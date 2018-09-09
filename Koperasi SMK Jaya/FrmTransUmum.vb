Public Class FrmTransUmum
    Dim idbarang, idpengguna, idpenj As String
    Dim simpan As Boolean
    Dim hasil As String

    Function load()
        sql = "select [Id_Penjualan_Umum],[Id_Barang],[Nama_Barang],Jenis_Barang,Nama_Pengguna,[Harga_Umum],[Jumlah_Barang_Umum],
        [ID_Detail_Umum]
        from qpenjumum where ID_penjualan_umum='" & TextBox5.Text & "'"

        fetchData(sql, DataGridView1)
    End Function

    Public Function sumJumlah()
        Try
            sql = "select * from penjualan_umum where ID_penjualan_umum='" & TextBox5.Text & "'"
            Dim total As String = getValue(sql, "total_umum")
            Dim temp As String = "0"
            If TextBox3.Text <> "" And TextBox4.Text <> "" Then
                temp = TextBox3.Text * TextBox4.Text
            End If
            Dim jumlah As Integer = Integer.Parse(total) + Integer.Parse(temp)
            hasil = jumlah
            Label9.Text = "Jumlah : Rp. " & jumlah
        Catch ex As Exception
            Label9.Text = "Jumlah : Rp. 0"
        End Try
    End Function

    Public Function sumKurang()
        Try
            sql = "select * from penjualan_umum where ID_penjualan_umum='" & TextBox5.Text & "'"
            Dim total As String = "0"
            If rowsCount(sql) = 1 Then
                total = getValue(sql, "total_umum")
            End If
            Dim temp As String = "0"
            If TextBox3.Text <> "" And TextBox4.Text <> "" Then
                temp = TextBox3.Text * TextBox4.Text
            End If
            Dim jumlah As Integer = Integer.Parse(total) - Integer.Parse(temp)
            Label9.Text = "Jumlah : Rp. " & jumlah
        Catch ex As Exception
            Label9.Text = "Jumlah : Rp. 0"
        End Try
    End Function

    Private Sub tutup_Click(sender As Object, e As EventArgs) Handles tutup.Click
        Close()
    End Sub

    Private Sub kecil_Click(sender As Object, e As EventArgs) Handles kecil.Click
        Me.WindowState = FormWindowState.Minimized
    End Sub

    Private Sub Button8_Click(sender As Object, e As EventArgs) Handles Button8.Click
        Close()
    End Sub

    Private Sub FrmTransUmum_FontChanged(sender As Object, e As EventArgs) Handles MyBase.FontChanged

    End Sub

    Private Sub FrmTransUmum_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        load()
        reset()
    End Sub

    Private Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        If TextBox5.Text = "" Then
            'baru
            aktif()
            setReset(GroupBox1.Controls)
            TextBox5.Text = getIDpenjUmum()
        Else
            setReset(GroupBox1.Controls)
            setDisable(GroupBox4.Controls)
            setDisable(GroupBox3.Controls)
            setEnable(GroupBox1.Controls)
        End If
        load()
    End Sub

    Private Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        FrmCariPengguna.trans = "Umum"
        FrmCariPengguna.Show()
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        FrmCariBarang.trans = "Umum"
        FrmCariBarang.Show()
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        reset()
        sumKurang()
    End Sub

    Private Sub FrmTransUmum_FormClosed(sender As Object, e As FormClosedEventArgs) Handles MyBase.FormClosed
        If role = "Kasir" Then
            FrmKasir.Show()
        Else
            FrmUtama.Show()
        End If
    End Sub

    Private Sub DataGridView1_CellClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridView1.CellClick
        row = DataGridView1.Rows(e.RowIndex)

        Label12.Text = getText(row, "ID_Detail_Umum")
        TextBox1.Text = getText(row, "id_barang")
        TextBox2.Text = getText(row, "nama_barang")
        TextBox3.Text = getText(row, "harga_umum")
        TextBox4.Text = getText(row, "Jumlah_Barang_Umum")
        TextBox7.Text = getText(row, "nama_pengguna")
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click

        If Label10.Text = "" Or isEmpty(TextBox1) Then
            info("Harap Pilih Barang Terlebih Dahulu")
        ElseIf isEmpty(TextBox4) Or isNumber(TextBox4.Text) Or TextBox4.Text < 1 Or Integer.Parse(TextBox4.Text) > Integer.Parse(Label10.Text) Then
            info("Harap Masukkan Jumlah Barang dengan benar")
        ElseIf Label11.Text = "" Or isEmpty(TextBox7) Then
            info("Harap Pilih Pengguna")
        Else
            sql = "select * from penjualan_umum where id_penjualan_umum='" & TextBox5.Text & "'"

            If rowsCount(sql) = 0 Then
                sql = "insert into penjualan_umum values ('" & TextBox5.Text & "','" & getDTP(DateTimePicker1) & "',
                '0','0')"
                sql1 = "insert into penj_detail_umum ([ID_Penjualan_Umum]
      ,[ID_Barang]
      ,[ID_Pengguna]
      ,[Harga_Umum]
      ,[Jumlah_Barang_Umum]
      ,[Sub_Total_Umum]) values ('" & TextBox5.Text & "','" & TextBox1.Text & "','" & Label11.Text & "','" & TextBox3.Text & "',
                '" & TextBox4.Text & "','')"
                If execSQL(sql) And execSQL(sql1) Then

                    load()
                    reset()
                    sumJumlah()
                    info("Penjualan Berhasil")
                Else
                    info("Penjualan gagal" & vbNewLine & sql)
                End If
            Else
                sql1 = "insert into penj_detail_umum ([ID_Penjualan_Umum]
      ,[ID_Barang]
      ,[ID_Pengguna]
      ,[Harga_Umum]
      ,[Jumlah_Barang_Umum]
      ,[Sub_Total_Umum]) values ('" & TextBox5.Text & "','" & TextBox1.Text & "','" & Label11.Text & "','" & TextBox3.Text & "',
                '" & TextBox4.Text & "','')"

                If execSQL(sql1) Then
                    load()
                    reset()
                    sumJumlah()
                    info("Penjualan Berhasil")
                Else
                    info("Penjualan gagal")
                End If
            End If
        End If
    End Sub

    Private Sub Button7_Click(sender As Object, e As EventArgs) Handles Button7.Click
        If Label12.Text = "" Then
            info("Harap Pilih Data pnejualan Terlebih Dahulu")
        Else
            If ask("Apakah Anda Yakin ? ") Then
                sql = "delete from penj_detail_umum where ID_Detail_Umum='" & Label12.Text & "'"

                If execSQL(sql) Then
                    load()
                    reset()
                    sumJumlah()
                    info("Berhasil Menghapus Penjualan")
                End If
            End If
        End If
    End Sub

    Private Sub Button6_Click(sender As Object, e As EventArgs) Handles Button6.Click
        FrmBayarUmum.TextBox1.Text = TextBox5.Text
        FrmBayarUmum.TextBox4.Text = hasil
        FrmBayarUmum.TextBox2.Text = "0"
        FrmBayarUmum.Show()
    End Sub

    Private Sub TextBox4_TextChanged(sender As Object, e As EventArgs) Handles TextBox4.TextChanged

    End Sub

    Function reset()
        setReset(GroupBox1.Controls)
        setDisable(GroupBox1.Controls)
        setDisable(GroupBox2.Controls)
        setEnable(GroupBox3.Controls)
        setEnable(GroupBox4.Controls)
    End Function

    Function aktif()
        setDisable(GroupBox4.Controls)
        setDisable(GroupBox3.Controls)
        setEnable(GroupBox2.Controls)
        setEnable(GroupBox1.Controls)
    End Function
End Class
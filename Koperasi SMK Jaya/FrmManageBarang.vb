Public Class FrmManageBarang
    Public idjenis As String
    Dim simpan As Boolean

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        setDisable(GroupBox1.Controls)
        setEnable(GroupBox2.Controls)
        setEnable(GroupBox3.Controls)
        setReset(GroupBox1.Controls)
    End Sub

    Function load()
        sql = "select * from qbarang where nama_barang like '%" & TextBox8.Text & "%'"

        fetchData(sql, DataGridView1)
    End Function

    Private Sub FrmManageBarang_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        setDisable(GroupBox1.Controls)
        load()
    End Sub

    Private Sub Button6_Click(sender As Object, e As EventArgs) Handles Button6.Click
        Close()
    End Sub

    Private Sub tutup_Click(sender As Object, e As EventArgs) Handles tutup.Click
        Close()
    End Sub

    Private Sub kecil_Click(sender As Object, e As EventArgs) Handles kecil.Click
        Me.WindowState = FormWindowState.Minimized
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        setEnable(GroupBox1.Controls)
        setDisable(GroupBox2.Controls)
        setDisable(GroupBox3.Controls)
        setReset(GroupBox1.Controls)
        simpan = True
        TextBox1.Text = getIDBarang()
    End Sub

    Private Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        setEnable(GroupBox1.Controls)
        setDisable(GroupBox2.Controls)
        setDisable(GroupBox3.Controls)
        simpan = False
    End Sub

    Private Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        sql = "select * From penj_detail_anggota where id_barang='" & TextBox1.Text & "'"
        sql1 = "select * From penj_detail_umum where id_barang='" & TextBox1.Text & "'"
        If isEmpty(TextBox1) Then
            info("Harap Pilih Barang aterlebih Dahulu")
        ElseIf rowsCount(sql) > 0 Or rowsCount(sql1) > 0 Then
            info("Barang Tidak Bisa Dihapus karena telah memiliki transaksi")
        Else
            If ask("Apakah Anda yakin ?") Then
                sql = "delete from barang where id_barang='" & TextBox1.Text & "'"

                If execSQL(sql) Then
                    setDisable(GroupBox1.Controls)
                    setEnable(GroupBox2.Controls)
                    setEnable(GroupBox3.Controls)
                    setReset(GroupBox1.Controls)
                    load()
                    info("Berhasil Menghapus Barang")
                Else
                    info("Gagal Menghspu Barang")
                End If
            End If
        End If
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If isEmpty(TextBox2) Then
            info("Harap Masukkan Nama Barang")
        ElseIf isNumber(TextBox3.Text) Or isEmpty(TextBox3) Then
            info("Harap Masukan Harga Beli dengan benar")
        ElseIf isNumber(TextBox4.Text) Or isEmpty(TextBox4) Then
            info("Harap Masukan Harga Jual dengan benar")
        ElseIf isNumber(TextBox6.Text) Or isEmpty(TextBox6) Then
            info("Harap Masukan Stok dengan benar")
        ElseIf isEmpty(TextBox5) Then
            info("Harap Pilih Jenis barang")
        Else
            If simpan Then
                sql = "insert into barang values ('" & TextBox1.Text & "','" & Label9.Text & "','" & TextBox2.Text & "',
                '" & TextBox3.Text & "','" & TextBox4.Text & "','" & TextBox6.Text & "','" & TextBox7.Text & "')"

                If execSQL(sql) Then
                    setDisable(GroupBox1.Controls)
                    setEnable(GroupBox2.Controls)
                    setEnable(GroupBox3.Controls)
                    setReset(GroupBox1.Controls)
                    load()
                    info("Berhasil Menambah Barang")
                Else
                    info("Gagal Menambah Barang")
                End If
            Else
                sql = "update barang set id_jenis_barang='" & Label9.Text & "',nama_barang='" & TextBox2.Text & "',
                harga_beli='" & TextBox3.Text & "', harga_Jual='" & TextBox4.Text & "',stok_barang='" & TextBox6.Text & "',
                keterangan_barang='" & TextBox7.Text & "' where id_Barang='" & TextBox1.Text & "'"

                If execSQL(sql) Then
                    setDisable(GroupBox1.Controls)
                    setEnable(GroupBox2.Controls)
                    setEnable(GroupBox3.Controls)
                    setReset(GroupBox1.Controls)
                    load()
                    info("Berhasil Mengubah Barang")
                Else
                    info("Gagal Mengubah Barang")
                End If
            End If

        End If

    End Sub

    Private Sub FrmManageBarang_FormClosed(sender As Object, e As FormClosedEventArgs) Handles MyBase.FormClosed
        If role = "Admin" Then
            FrmAdmin.Show()
        Else
            FrmAdministrasi.Show()
        End If
    End Sub

    Private Sub Button7_Click(sender As Object, e As EventArgs) Handles Button7.Click
        FrmCariJenis.Show()
    End Sub

    Private Sub DataGridView1_CellClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridView1.CellClick
        Try
            row = DataGridView1.Rows(e.RowIndex)

            TextBox1.Text = getText(row, "id_barang")
            TextBox2.Text = getText(row, "nama_barang")
            TextBox3.Text = getText(row, "harga_beli")
            TextBox4.Text = getText(row, "harga_jual")
            TextBox5.Text = getText(row, "jenis_barang")
            TextBox6.Text = getText(row, "stok_barang")
            TextBox7.Text = getText(row, "keterangan_barang")
            Label9.Text = getText(row, "id_jenis_barang")
        Catch ex As Exception

        End Try

    End Sub

    Private Sub TextBox8_TextChanged(sender As Object, e As EventArgs) Handles TextBox8.TextChanged
        load()
    End Sub
End Class
Public Class FrmBayarTagihan
    Dim id, id2 As String
    Dim s, b As String
    Private Sub tutup_Click(sender As Object, e As EventArgs) Handles tutup.Click
        Close()
    End Sub

    Private Sub kecil_Click(sender As Object, e As EventArgs) Handles kecil.Click
        Me.WindowState = FormWindowState.Minimized
    End Sub

    Function load()
        sql = "select Angsuran_Ke,ID_Cicilan,ID_Penjualan_Anggota,Nama_Anggota,Uang_Pokok,Bunga_Rupiah,Saldo,Bayar From qcicilan where flag_tagihan=0"
        fetchData(sql, DataGridView1)
    End Function

    Private Sub FrmBayarTagihan_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        load()
        setDisable(GroupBox1.Controls)
    End Sub

    Private Sub FrmBayarTagihan_FormClosed(sender As Object, e As FormClosedEventArgs) Handles MyBase.FormClosed
        FrmUtama.Show()
    End Sub

    Private Sub DataGridView1_CellClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridView1.CellClick
        Try
            row = DataGridView1.Rows(e.RowIndex)

            TextBox1.Text = getText(row, "Uang_Pokok")
            TextBox2.Text = getText(row, "Bunga_Rupiah")
            id = getText(row, "id_cicilan")
            id2 = getText(row, "id_penjualan_anggota")
            b = getText(row, "bayar")
            s = getText(row, "saldo")
            TextBox3.Text = Integer.Parse(TextBox1.Text) + Integer.Parse(TextBox2.Text)
        Catch ex As Exception

        End Try
    End Sub

    Private Sub TextBox4_TextChanged(sender As Object, e As EventArgs) Handles TextBox4.TextChanged
        If isEmpty(TextBox4) Then
            TextBox4.Text = "0"
        ElseIf isNumber(TextBox4.Text) Then
        Else
            Dim kurang As Integer = Integer.Parse(TextBox4.Text) - Integer.Parse(TextBox3.Text)
            TextBox5.Text = kurang
        End If
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        setDisable(GroupBox1.Controls)
        setEnable(GroupBox2.Controls)
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        If id = "" Then
            info("Harap Pilih Data Terlebih Dahulu")
        Else
            setDisable(GroupBox2.Controls)
            setEnable(GroupBox1.Controls)
        End If
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If isEmpty(TextBox4) Then
            info("Harap Isi Jumlah Pembayaran")
        ElseIf isNumber(TextBox4.Text) Then
            info("Harap Masukkan pembayaran dengan beanr")
        ElseIf Integer.Parse(TextBox5.Text) < 0 Then
            info("Masukkan uang yang cukup")
        Else
            sql = "update cicilan set flag_tagihan=1,Tgl_Bayar='" & Format(Now(), "yyyy-MM-dd") & "',status='Sudah Dibayar' where id_cicilan='" & id & "'"
            sql1 = "update penjualan_anggota set bayar='" & Integer.Parse(b) + Integer.Parse(TextBox3.Text) & "',saldo='" & Integer.Parse(s) - Integer.Parse(TextBox3.Text) & "' "
            sql1 += " where id_Penjualan_anggota='" & id2 & "'"

            If execSQL(sql1) And execSQL(sql) Then
                load()
                setReset(GroupBox1.Controls)
                setEnable(GroupBox2.Controls)
                setDisable(GroupBox1.Controls)
                TextBox5.Text = "0"
                info("Pembayaran Tagihan Berhasil")
            Else
                info("Pembayaran Tagihan Gagal")
            End If
        End If
    End Sub
End Class
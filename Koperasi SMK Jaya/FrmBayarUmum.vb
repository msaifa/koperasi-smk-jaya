Public Class FrmBayarUmum
    Private Sub tutup_Click(sender As Object, e As EventArgs) Handles tutup.Click
        Close()
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Close()
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        If isEmpty(TextBox2) Or isNumber(TextBox2.Text) Then
            info("Harap Masukkan jumlah pembayaran dengan benar")
        ElseIf TextBox3.Text < 0 Then
            info("Harap Masukkan jumlah pembayaran yang mencukupi")
        Else
            sql = "update penjualan_umum set bayar='" & TextBox2.Text & "' where id_penjualan_umum='" & TextBox1.Text & "'"
            If execSQL(sql) Then
                info("Pembayaran Berhasil Terima Kasih")
                setReset(FrmTransUmum.GroupBox1.Controls)
                setReset(FrmTransUmum.GroupBox2.Controls)

                setEnable(FrmTransUmum.GroupBox3.Controls)
                setEnable(FrmTransUmum.GroupBox4.Controls)

                setDisable(FrmTransUmum.GroupBox2.Controls)
                setDisable(FrmTransUmum.GroupBox1.Controls)
                FrmTransUmum.TextBox5.Clear()
                FrmTransUmum.Label9.Text = "Jumlah: Rp. 0"

                Close()

            Else
                info("Pembayaran Gagal")
            End If
        End If
    End Sub

    Private Sub TextBox2_TextChanged(sender As Object, e As EventArgs) Handles TextBox2.TextChanged
        Try
            If isNumber(TextBox2.Text) Then
            ElseIf TextBox2.Text <> "" Then
                Dim jum As Integer = Integer.Parse(TextBox2.Text) - Integer.Parse(TextBox4.Text)
                TextBox3.Text = jum
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub TextBox3_TextChanged(sender As Object, e As EventArgs) Handles TextBox3.TextChanged

    End Sub
End Class
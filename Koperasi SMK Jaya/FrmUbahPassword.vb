Public Class FrmUbahPassword
    Private Sub tutup_Click(sender As Object, e As EventArgs) Handles tutup.Click
        Close()
    End Sub

    Private Sub kecil_Click(sender As Object, e As EventArgs) Handles kecil.Click
        Me.WindowState = FormWindowState.Minimized
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Close()
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If isEmpty(TextBox1) Then
            info("Harap Isi Password lama Anda")
        ElseIf isEmpty(TextBox2) Then
            info("Harap Isi Password Baru Anda")
        ElseIf rowsCount("select * from pengguna where id_pengguna='" & iduser & "' and password_login='" & TextBox1.Text & "'") = 0 Then
            info("Password lama anda salah")
        ElseIf TextBox2.Text.Length < 1 Or TextBox2.Text.Length > 8 Then
            info("Masukkan Password antara 1-8 karakter")
        ElseIf isRegex(TextBox2.Text, "[A-Z]") Then
            info("Password Anda Harus Memiliki Huruf Besar")
        ElseIf isRegex(TextBox2.Text, "[0-9]") Then
            info("Password Anda harus memiliki angka")
        Else
            sql = "update pengguna set password_login='" & TextBox2.Text & "' where id_pengguna='" & iduser & "'"
            If execSQL(sql) Then
                info("Ubah Password Berhasil, SIlahkan Login Kembali")
                isLogin = False
                Me.Close()
                FrmUser.Close()
                FrmUtama.Close()
            Else
                info("Ubah Password Gagal")
            End If
        End If
    End Sub

    Private Sub FrmUbahPassword_FormClosed(sender As Object, e As FormClosedEventArgs) Handles MyBase.FormClosed
        FrmUser.Show()
    End Sub
End Class
Public Class Form1
    Private Sub tutup_Click(sender As Object, e As EventArgs)
        Close()
    End Sub

    Private Sub kecil_Click(sender As Object, e As EventArgs)
        Me.WindowState = FormWindowState.Minimized
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Close()
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        sql = "select * from pengguna where nama_login='" & TextBox1.Text & "' and password_login='" & TextBox2.Text & "'"
        If isEmpty(TextBox1) Then
            info("Harap Isi Username Anda")
        ElseIf isEmpty(TextBox2) Then
            info("Harap Isi Password Anda")
        ElseIf rowsCount(sql) = 1 Then
            TextBox1.Clear()
            TextBox2.Clear()
            isLogin = True
            iduser = getValue(sql, "id_pengguna")
            username = TextBox1.Text
            role = getValue(sql, "level")
            If role = "Admin" Then
                FrmAdmin.Show()
            ElseIf role = "Kasir" Then
                FrmKasir.Show()
            Else
                FrmUtama.Show()
            End If
            Me.Hide()
        Else
            info("Login Gagal, Harap Periksa Username atau Password Anda")
        End If
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Close()
    End Sub

    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        If isLogin Then
            Me.Hide()
            FrmUtama.Show()
        End If
    End Sub
End Class

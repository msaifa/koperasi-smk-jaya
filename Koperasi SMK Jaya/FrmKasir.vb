Public Class FrmKasir
    Private Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        isLogin = False
        Close()
    End Sub

    Private Sub tutup_Click(sender As Object, e As EventArgs) Handles tutup.Click
        Close()
    End Sub

    Private Sub kecil_Click(sender As Object, e As EventArgs) Handles kecil.Click
        Me.WindowState = FormWindowState.Minimized
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Me.Hide()
        FrmUser.Show()
    End Sub

    Private Sub FrmKasir_FormClosed(sender As Object, e As FormClosedEventArgs) Handles MyBase.FormClosed
        If isLogin Then
            Form1.Close()
        Else
            Form1.Show()
        End If
    End Sub

End Class
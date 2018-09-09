Public Class FrmUser
    Private Sub tutup_Click(sender As Object, e As EventArgs) Handles tutup.Click
        Close()
    End Sub

    Private Sub kecil_Click(sender As Object, e As EventArgs) Handles kecil.Click
        Me.WindowState = FormWindowState.Minimized
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs)
        Me.Hide()
        FrmUbahPassword.Show()
    End Sub

    Private Sub FrmUser_FormClosed(sender As Object, e As FormClosedEventArgs) Handles MyBase.FormClosed
        If role = "Kasir" Then
            FrmKasir.Show()
        Else
            FrmUtama.Show()
        End If
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs)
        Me.Hide()
        FrmManageUser.Show()
    End Sub

    Private Sub FrmUser_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        If role = "Kasir" Then
            Button2.Visible = False
            Button3.Visible = False
            Button4.Visible = False
        End If
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Me.Hide()
        FrmManageFoto.Show()
    End Sub

    Private Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        Me.Hide()
        FrmDeposit.Show()
    End Sub

    Private Sub Button1_Click_1(sender As Object, e As EventArgs) Handles Button1.Click
        Me.Hide()
        FrmUbahPassword.Show()
    End Sub

    Private Sub Button2_Click_1(sender As Object, e As EventArgs) Handles Button2.Click
        Me.Hide()
        FrmManageUser.Show()
    End Sub
End Class
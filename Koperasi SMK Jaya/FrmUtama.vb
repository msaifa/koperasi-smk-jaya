Public Class FrmUtama
    Private Sub tutup_Click(sender As Object, e As EventArgs) Handles tutup.Click
        Close()
    End Sub

    Private Sub kecil_Click(sender As Object, e As EventArgs) Handles kecil.Click
        Me.WindowState = FormWindowState.Minimized
    End Sub

    Private Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        isLogin = False
        Close()
    End Sub

    Private Sub FrmUtama_FormClosed(sender As Object, e As FormClosedEventArgs) Handles MyBase.FormClosed
        If isLogin Then
            Form1.Close()
        Else
            Form1.Show()
        End If
    End Sub

    Private Sub FrmUtama_Load(sender As Object, e As EventArgs) Handles MyBase.Load

    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Me.Hide()
        FrmAdministrasi.Show()
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Me.Hide()
        FrmUser.Show()
    End Sub

    Private Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        Me.Hide()
        FrmTransUmum.Show()
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Me.Hide()
        FrmTransAnggota.Show()
    End Sub

    Private Sub Button6_Click(sender As Object, e As EventArgs) Handles Button6.Click
        Me.Hide()
        FrmBuatTagihan.Show()
    End Sub

    Private Sub Button7_Click(sender As Object, e As EventArgs) Handles Button7.Click
        Me.Hide()
        FrmBayarTagihan.Show()
    End Sub

    Private Sub Button8_Click(sender As Object, e As EventArgs) Handles Button8.Click
        Me.Hide()
        FrmHistoryTagihan.Show()
    End Sub

    Private Sub Button9_Click(sender As Object, e As EventArgs) Handles Button9.Click
        Me.Hide()
        FrmLaporanPembelian.Show()
    End Sub
End Class
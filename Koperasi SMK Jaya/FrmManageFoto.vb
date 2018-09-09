Public Class FrmManageFoto
    Dim opd As New OpenFileDialog
    Dim path, path2 As String
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        opd.Filter = "Gambar (*.JPG,*.PNG) | *.JPG ; *.PNG"
        opd.Multiselect = False
        opd.Title = "Pilih Gambar"

        If opd.ShowDialog = DialogResult.OK Then
            path = opd.FileName
            PictureBox1.Image = Image.FromFile(path)
        End If
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Close()
    End Sub

    Private Sub tutup_Click(sender As Object, e As EventArgs) Handles tutup.Click
        Close()
    End Sub

    Private Sub kecil_Click(sender As Object, e As EventArgs) Handles kecil.Click
        Me.WindowState = FormWindowState.Minimized
    End Sub

    Private Sub FrmManageFoto_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        load()
    End Sub

    Function load()
        sql = "select ID_Anggota,Nama_Anggota,Jenis_Kelamin,Photo from qanggota where nama_anggota like '%" & TextBox1.Text & "%'"

        fetchData(sql, DataGridView1)
    End Function

    Private Sub TextBox1_TextChanged(sender As Object, e As EventArgs) Handles TextBox1.TextChanged
        load()
    End Sub

    Private Sub DataGridView1_CellClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridView1.CellClick
        Try
            row = DataGridView1.Rows(e.RowIndex)
            Label2.Text = getText(row, "id_anggota")
            path2 = getText(row, "Photo")
            PictureBox1.Image = Image.FromFile(getText(row, "Photo"))
        Catch ex As Exception
            PictureBox1.Image = Nothing
        End Try
    End Sub

    Private Sub FrmManageFoto_FormClosed(sender As Object, e As FormClosedEventArgs) Handles MyBase.FormClosed
        FrmUser.Show()
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        If path <> "" Then
            Dim saiki As String = "img/" & Format(Now(), "yyyyMMddHHiiss") & "." & path.Split(".").Last
            sql = "update anggota set photo='" & saiki & "' where id_anggota='" & Label2.Text & "'"

            If execSQL(sql) Then
                IO.File.Copy(path, saiki)
                load()
                info("Photo Berhasil DiUbah")
            Else
                info("Foto Gagal Diubah")
            End If
        Else
            info("Harap Pilih Foto Terlebih Dahulu")
        End If
    End Sub
End Class
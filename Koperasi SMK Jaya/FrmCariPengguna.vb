Public Class FrmCariPengguna
    Public trans As String
    Private Sub tutup_Click(sender As Object, e As EventArgs) Handles tutup.Click
        Close()
    End Sub

    Function load()
        sql = "select ID_Pengguna,Nama_pengguna,Level from pengguna where nama_pengguna like '%" & TextBox1.Text & "%'"

        fetchData(sql, DataGridView1)
    End Function

    Private Sub TextBox1_TextChanged(sender As Object, e As EventArgs) Handles TextBox1.TextChanged
        load()
    End Sub

    Private Sub FrmCariPengguna_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        load()
    End Sub

    Private Sub DataGridView1_CellClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridView1.CellClick
        row = DataGridView1.Rows(e.RowIndex)
        If trans = "Umum" Then
            FrmTransUmum.Label11.Text = getText(row, "id_pengguna")
            FrmTransUmum.TextBox7.Text = getText(row, "nama_pengguna")
        Else

            FrmTransAnggota.Label11.Text = getText(row, "id_pengguna")
            FrmTransAnggota.TextBox7.Text = getText(row, "nama_pengguna")
        End If

        Close()
    End Sub
End Class
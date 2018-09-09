Public Class FrmCariAnggota
    Private Sub tutup_Click(sender As Object, e As EventArgs) Handles tutup.Click
        Close()
    End Sub

    Private Sub FrmCariAnggota_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        load()
    End Sub

    Function load()
        sql = "select ID_Anggota,Unit_kerja,Nama_Anggota,[Jenis_Kelamin] from qanggota where nama_anggota like '%" & TextBox1.Text & "%'"

        fetchData(sql, DataGridView1)
    End Function

    Private Sub TextBox1_TextChanged(sender As Object, e As EventArgs) Handles TextBox1.TextChanged
        load()
    End Sub

    Private Sub DataGridView1_CellClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridView1.CellClick
        row = DataGridView1.Rows(e.RowIndex)

        FrmTransAnggota.Label13.Text = getText(row, "id_anggota")
        FrmTransAnggota.TextBox6.Text = getText(row, "Nama_Anggota")

        Close()

    End Sub
End Class
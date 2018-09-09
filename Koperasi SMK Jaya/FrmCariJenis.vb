Public Class FrmCariJenis
    Private Sub FrmCariJenis_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        load()
    End Sub

    Function load()
        sql = "select * from jenis_barang where jenis_barang like '%" & TextBox1.Text & "%'"

        fetchData(sql, DataGridView1)
    End Function

    Private Sub TextBox1_TextChanged(sender As Object, e As EventArgs) Handles TextBox1.TextChanged
        load()
    End Sub

    Private Sub tutup_Click(sender As Object, e As EventArgs) Handles tutup.Click
        Close()
    End Sub

    Private Sub DataGridView1_CellClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridView1.CellClick
        row = DataGridView1.Rows(e.RowIndex)

        FrmManageBarang.Label9.Text = getText(row, "id_jenis_barang")
        FrmManageBarang.TextBox5.Text = getText(row, "jenis_barang")

        Me.Close()
    End Sub
End Class
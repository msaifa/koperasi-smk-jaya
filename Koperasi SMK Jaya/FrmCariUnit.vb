Public Class FrmCariUnit
    Private Sub tutup_Click(sender As Object, e As EventArgs) Handles tutup.Click
        Close()
    End Sub

    Private Sub FrmCariUnit_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        load()
    End Sub

    Function load()
        sql = "select * from unit_kerja where unit_kerja like '%" & TextBox1.Text & "%'"

        fetchData(sql, DataGridView1)
    End Function

    Private Sub DataGridView1_CellClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridView1.CellClick
        row = DataGridView1.Rows(e.RowIndex)

        FrmManageAnggota.idunit = getText(row, "id_Unit_kera")
        FrmManageAnggota.TextBox2.Text = getText(row, "unit_kerja")
        FrmManageAnggota.Label10.Text = getText(row, "id_unit_kerja")

        Me.Close()
    End Sub

    Private Sub TextBox1_TextChanged(sender As Object, e As EventArgs) Handles TextBox1.TextChanged
        load()
    End Sub

    Private Sub DataGridView1_CellContentDoubleClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridView1.CellContentDoubleClick
        row = DataGridView1.Rows(e.RowIndex)

        FrmManageAnggota.idunit = getText(row, "id_Unit_kera")
        FrmManageAnggota.TextBox2.Text = getText(row, "unit_kerja")

        Me.Close()
    End Sub
End Class
Public Class FrmCariBarang
    Public trans As String
    Function load()
        sql = "select ID_Barang,Jenis_Barang,Nama_Barang,Harga_Jual,Stok_Barang From qbarang where nama_barang like '%" & TextBox1.Text & "%' and stok_barang>0"
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

        If trans = "Umum" Then
            FrmTransUmum.Label10.Text = getText(row, "Stok_Barang")
            FrmTransUmum.TextBox1.Text = getText(row, "id_barang")
            FrmTransUmum.TextBox2.Text = getText(row, "nama_barang")
            FrmTransUmum.TextBox3.Text = getText(row, "harga_jual")
            FrmTransUmum.TextBox4.Text = "1"
            FrmTransUmum.sumJumlah()
        Else
            FrmTransAnggota.Label10.Text = getText(row, "Stok_Barang")
            FrmTransAnggota.TextBox1.Text = getText(row, "id_barang")
            FrmTransAnggota.TextBox2.Text = getText(row, "nama_barang")
            FrmTransAnggota.TextBox3.Text = getText(row, "harga_jual")
            FrmTransAnggota.TextBox4.Text = "1"
            FrmTransAnggota.disc()
            FrmTransAnggota.sumJumlah()
        End If

        Close()
    End Sub

    Private Sub FrmCariBarang_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        load()
    End Sub
End Class
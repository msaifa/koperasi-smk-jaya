Public Class FrmHistoryTagihan
    Private Sub tutup_Click(sender As Object, e As EventArgs) Handles tutup.Click
        Close()
    End Sub

    Private Sub kecil_Click(sender As Object, e As EventArgs) Handles kecil.Click
        Me.WindowState = FormWindowState.Minimized
    End Sub

    Private Sub DataGridView1_CellContentClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridView1.CellContentClick

    End Sub

    Private Sub FrmHistoryTagihan_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        load()
    End Sub

    Function load()
        sql = "select distinct ID_Penjualan_Anggota,Nama_Anggota,Unit_Kerja,Saldo as Jumlah_Hutang,Bayar as Jumlah_Bayar from qpenjanggota where
        metode='Kredit' or metode='Potong Gaji'"
        fetchData(sql, DataGridView1)
    End Function

    Private Sub DataGridView1_CellClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridView1.CellClick
        Try
            row = DataGridView1.Rows(e.RowIndex)

            Dim id As String = getText(row, "id_penjualan_anggota")

            sql = "select ID_Cicilan,Tgl_Bayar, Nama_Anggota,Status,Uang_Pokok,Bunga_Rupiah from qcicilan where id_penjualan_anggota='" & id & "' order by tgl_bayar asc"
            fetchData(sql, DataGridView2)
        Catch ex As Exception

        End Try
    End Sub

    Private Sub FrmHistoryTagihan_FormClosed(sender As Object, e As FormClosedEventArgs) Handles MyBase.FormClosed
        FrmUtama.Show()
    End Sub
End Class
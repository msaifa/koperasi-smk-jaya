Public Class FrmLaporanPembelian
    Dim ke As String
    Function loadcombo()
        ComboBox1.Items.Add("Semua")
        ComboBox1.Items.Add("Januari")
        ComboBox1.Items.Add("Februari")
        ComboBox1.Items.Add("Maret")
        ComboBox1.Items.Add("April")
        ComboBox1.Items.Add("Mei")
        ComboBox1.Items.Add("Juni")
        ComboBox1.Items.Add("Juli")
        ComboBox1.Items.Add("Agustus")
        ComboBox1.Items.Add("September")
        ComboBox1.Items.Add("Oktober")
        ComboBox1.Items.Add("November")
        ComboBox1.Items.Add("Desember")
        ComboBox1.SelectedIndex = Format(Now(), "MM")
    End Function

    Function load()
        If ComboBox1.SelectedIndex = 0 Then
            sql = "select Nama_anggota,Total_Anggota as Total_Belanja,[Tgl_Transaksi_Anggota],Metode from qbayaranggota order by total_anggota desc"
        Else
            sql = "select Nama_anggota,Total_Anggota as Total_Belanja,[Tgl_Transaksi_Anggota],Metode from qbayaranggota where
        Tgl_Transaksi_Anggota between '2017-" & ComboBox1.SelectedIndex & "-01' and '2017-" & ComboBox1.SelectedIndex & "-" & ke & "' order by total_anggota desc"
        End If

        fetchData(sql, DataGridView1)
    End Function
    Private Sub FrmLaporanPembelian_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        isLoad = False
        loadcombo()
        isLoad = True
        load()
    End Sub

    Private Sub tutup_Click(sender As Object, e As EventArgs) Handles tutup.Click
        Close()
    End Sub

    Private Sub kecil_Click(sender As Object, e As EventArgs) Handles kecil.Click
        Me.WindowState = FormWindowState.Minimized
    End Sub

    Private Sub FrmLaporanPembelian_FormClosed(sender As Object, e As FormClosedEventArgs) Handles MyBase.FormClosed
        FrmUtama.Show()
    End Sub

    Private Sub DateTimePicker1_ValueChanged(sender As Object, e As EventArgs)
        load()
    End Sub

    Private Sub DateTimePicker2_ValueChanged(sender As Object, e As EventArgs)
        load()
    End Sub

    Private Sub ComboBox1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ComboBox1.SelectedIndexChanged
        If ComboBox1.SelectedIndex = 1 Or ComboBox1.SelectedIndex = 3 Or ComboBox1.SelectedIndex = 5 Or ComboBox1.SelectedIndex = 7 Or
                    ComboBox1.SelectedIndex = 8 Or ComboBox1.SelectedIndex = 10 Or ComboBox1.SelectedIndex = 12 Then
            ke = "31"
        ElseIf ComboBox1.SelectedIndex = 4 Or ComboBox1.SelectedIndex = 6 Or ComboBox1.SelectedIndex = 9 Or
                    ComboBox1.SelectedIndex = 11 Then
            ke = "30"
        ElseIf ComboBox1.SelectedIndex = 2 Then
            ke = "28"
        Else
            ke = "28"
        End If
        If isLoad Then
            load()
        End If
    End Sub
End Class
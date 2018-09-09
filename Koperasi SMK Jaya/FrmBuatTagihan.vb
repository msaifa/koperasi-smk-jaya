Public Class FrmBuatTagihan
    Dim id As String
    Dim b, u As String
    Private Sub tutup_Click(sender As Object, e As EventArgs) Handles tutup.Click
        Close()
    End Sub

    Private Sub kecil_Click(sender As Object, e As EventArgs) Handles kecil.Click
        Me.WindowState = FormWindowState.Minimized
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Close()
    End Sub

    Private Sub FrmBuatTagihan_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Label1.Text = "Bulan : " & Format(Now(), "MMMM")
        load()
    End Sub

    Private Sub FrmBuatTagihan_FormClosed(sender As Object, e As FormClosedEventArgs) Handles MyBase.FormClosed
        FrmUtama.Show()
    End Sub

    Function load()
        sql = "SELECT ID_Penjualan_Anggota,Nama_Anggota,Unit_Kerja,Jenis_Kelamin,ID_Anggota,Metode,(Total_anggota/jumlah_angsuran) as Uang_Pokok
            ,Bunga,Total_Anggota
            FROM [Comp14].[dbo].[qBayarAnggota] where 
            Flag_Lunas=0 and not exists 
            (select * from qcicilan where 
            [Comp14].[dbo].[qBayarAnggota].ID_Penjualan_Anggota=[Comp14].[dbo].[qCicilan].ID_Penjualan_Anggota
            and tgl_buat_cicilan between '2017-" & Format(Now(), "MM") & "-01' and '2017-" & Format(Now(), "MM") & "-31')"

        fetchData(sql, DataGridView1)
    End Function

    Private Sub DataGridView1_CellClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridView1.CellClick
        Try
            row = DataGridView1.Rows(e.RowIndex)
            id = getText(row, "ID_Penjualan_anggota")
            b = getText(row, "Bunga")
            u = getText(row, "uang_pokok")
            Dim hasil As Integer = Integer.Parse(b) / 100 * Integer.Parse(getText(row, "total_anggota"))
            b = hasil
        Catch ex As Exception

        End Try
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If id = "" Then
            info("Silahkan Pilih Data Terlebih Dahulu")
        Else
            Dim ke As String = getAngsuranKe("id")
            If ask("Apakah Anda Yakin akan membuat tagihan ke " & ke & "?") Then
                sql = "insert into cicilan ([ID_Penjualan_Anggota]
      ,[Uang_Pokok]
      ,[Bunga_Rupiah]
      ,[Flag_Tagihan],angsuran_ke,tgl_buat_cicilan,status) values ('" & id & "','" & u & "','" & b & "','0','" & ke & "','" & Format(Now(), "yyyy-MM-dd") & "','Belum Dibayar')"

                If execSQL(sql) Then
                    load()
                    info("Pembuatan Tagihan Berhasil")
                Else
                    info("Pembuatan Tagihan Gagal")
                End If
            End If
        End If
    End Sub
End Class
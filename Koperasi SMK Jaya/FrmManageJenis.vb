Public Class FrmManageJenis
    Dim simpan As Boolean
    Private Sub tutup_Click(sender As Object, e As EventArgs) Handles tutup.Click
        Close()
    End Sub

    Private Sub kecil_Click(sender As Object, e As EventArgs) Handles kecil.Click
        Me.WindowState = FormWindowState.Minimized
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        setDisable(GroupBox1.Controls)
        setEnable(GroupBox2.Controls)
        setEnable(GroupBox3.Controls)
        setReset(GroupBox1.Controls)
    End Sub

    Private Sub FrmManageJenis_FormClosed(sender As Object, e As FormClosedEventArgs) Handles MyBase.FormClosed
        If role = "Admin" Then
            FrmAdmin.Show()
        Else
            FrmAdministrasi.Show()
        End If
    End Sub

    Private Sub Button6_Click(sender As Object, e As EventArgs) Handles Button6.Click
        Close()
    End Sub

    Function load()
        sql = "select * from jenis_Barang where jenis_barang like '%" & TextBox3.Text & "%'"

        fetchData(sql, DataGridView1)
    End Function
    Private Sub FrmManageJenis_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        setDisable(GroupBox1.Controls)
        load()
    End Sub

    Private Sub TextBox3_TextChanged(sender As Object, e As EventArgs) Handles TextBox3.TextChanged
        load()
    End Sub

    Private Sub DataGridView1_CellClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridView1.CellClick
        Try
            row = DataGridView1.Rows(e.RowIndex)

            TextBox1.Text = getText(row, "id_jenis_barang")
            TextBox2.Text = getText(row, "jenis_barang")
        Catch ex As Exception

        End Try
    End Sub

    Private Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        sql = "select * From barang where id_jenis_barang='" & TextBox1.Text & "'"
        If isEmpty(TextBox1) Then
            info("Harap Pilih Jenis Barang Terlebih Dahulu")
        ElseIf rowsCount(sql) > 0 Then
            info("Jenis Barang tidak bisa dihapus karena telah memiliki transaksi")
        Else
            If ask("Apakah Anda Yakin ?") Then
                sql = "delete from jenis_barang where id_jenis_barang='" & TextBox1.Text & "'"

                If execSQL(sql) Then
                    setDisable(GroupBox1.Controls)
                    setEnable(GroupBox2.Controls)
                    setEnable(GroupBox3.Controls)
                    setReset(GroupBox1.Controls)
                    load()
                    info("Berhasil menghapus jenis barang")
                Else
                    info("Gagal Menghapus Jenis Barang")
                End If
            End If
        End If
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        setEnable(GroupBox1.Controls)
        setDisable(GroupBox2.Controls)
        setDisable(GroupBox3.Controls)
        setReset(GroupBox1.Controls)
        simpan = True
        TextBox1.Text = getIDJenis()
    End Sub

    Private Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        setEnable(GroupBox1.Controls)
        setDisable(GroupBox2.Controls)
        setDisable(GroupBox3.Controls)
        simpan = False
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If isEmpty(TextBox2) Then
            info("Harap Masukkan Jenis Barang")
        Else
            If simpan Then
                sql = "insert into jenis_barang values ('" & TextBox1.Text & "','" & TextBox2.Text & "')"

                If execSQL(sql) Then
                    setDisable(GroupBox1.Controls)
                    setEnable(GroupBox2.Controls)
                    setEnable(GroupBox3.Controls)
                    setReset(GroupBox1.Controls)
                    load()
                    info("Berhasil Menambah Jenis Barang")
                Else
                    info("Gagal menambah jenis barang")
                End If
            Else
                sql = "update jenis_barang set jenis_barang='" & TextBox2.Text & "' where id_Jenis_barang='" & TextBox1.Text & "'"

                If execSQL(sql) Then
                    setDisable(GroupBox1.Controls)
                    setEnable(GroupBox2.Controls)
                    setEnable(GroupBox3.Controls)
                    setReset(GroupBox1.Controls)
                    load()
                    info("Berhasil mengubah jenis barang")
                Else
                    info("Gagal mengubah jenis barang")
                End If
            End If
        End If
    End Sub
End Class
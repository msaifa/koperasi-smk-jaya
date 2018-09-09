Public Class FrmManageUnit
    Dim simpan As String
    Private Sub Button6_Click(sender As Object, e As EventArgs) Handles Button6.Click
        Close()
    End Sub

    Private Sub tutup_Click(sender As Object, e As EventArgs) Handles tutup.Click
        Close()
    End Sub

    Private Sub kecil_Click(sender As Object, e As EventArgs) Handles kecil.Click
        Me.WindowState = FormWindowState.Minimized
    End Sub

    Function load()
        sql = "select * from unit_kerja where unit_kerja like '%" & TextBox3.Text & "%'"

        fetchData(sql, DataGridView1)
    End Function

    Private Sub FrmManageUnit_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        load()
        setDisable(GroupBox1.Controls)
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        setDisable(GroupBox1.Controls)
        setEnable(GroupBox2.Controls)
        setEnable(GroupBox3.Controls)
        setReset(GroupBox1.Controls)
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If isEmpty(TextBox2) Then
            info("Harap Masukkan unit kerja")
        Else
            If simpan Then
                sql = "insert into unit_kerja values ('" & TextBox1.Text & "','" & TextBox2.Text & "')"
                If execSQL(sql) Then
                    load()
                    setReset(GroupBox1.Controls)
                    setDisable(GroupBox1.Controls)
                    setEnable(GroupBox2.Controls)
                    setEnable(GroupBox3.Controls)
                    info("Berhasil Menambah Unit Kerja")
                Else
                    info("Gagal Menambah Unit Kerja")
                End If
            Else
                sql = "update unit_kerja set unit_kerja='" & TextBox2.Text & "' where id_unit_kerja='" & TextBox1.Text & "'"

                If execSQL(sql) Then
                    load()
                    setReset(GroupBox1.Controls)
                    setDisable(GroupBox1.Controls)
                    setEnable(GroupBox2.Controls)
                    setEnable(GroupBox3.Controls)
                    info("Berhasil mengubah Unit kerja")
                Else
                    info("Gagal Mengubah Unit Kerja")
                End If
            End If
        End If
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        simpan = True
        setReset(GroupBox1.Controls)
        setEnable(GroupBox1.Controls)
        setDisable(GroupBox2.Controls)
        setDisable(GroupBox3.Controls)
        TextBox1.Text = getIDUnit()
    End Sub

    Private Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        simpan = False
        setEnable(GroupBox1.Controls)
        setDisable(GroupBox2.Controls)
        setDisable(GroupBox3.Controls)
    End Sub

    Private Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        sql = "select * from anggota where id_unit_kerja='" & TextBox1.Text & "'"
        If isEmpty(TextBox1) Then
            info("Harap Pilih Unit Kerja Terlebih Dahulu")
        ElseIf rowsCount(sql) > 0 Then
            info("Unit Kerja Tidak bisa dihapus karena telah memiliki transaksi")
        Else
            If ask("ApakahAnda yakin ?") Then
                sql = "delete from unit_kerja where id_unit_kerja='" & TextBox1.Text & "'"
                If execSQL(sql) Then
                    load()
                    setReset(GroupBox1.Controls)
                    setDisable(GroupBox1.Controls)
                    setEnable(GroupBox2.Controls)
                    setEnable(GroupBox3.Controls)
                    info("Berhasil menghapus Unit Kerja")
                Else
                    info("Gagal menghapus Unit Kerja")
                End If
            End If
        End If
    End Sub

    Private Sub TextBox3_TextChanged(sender As Object, e As EventArgs) Handles TextBox3.TextChanged
        load()
    End Sub

    Private Sub FrmManageUnit_FormClosed(sender As Object, e As FormClosedEventArgs) Handles MyBase.FormClosed
        If role = "Admin" Then
            FrmAdmin.Show()
        Else
            FrmAdministrasi.Show()
        End If
    End Sub

    Private Sub DataGridView1_CellClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridView1.CellClick
        Try
            row = DataGridView1.Rows(e.RowIndex)

            TextBox1.Text = getText(row, "id_unit_kerja")
            TextBox2.Text = getText(row, "unit_kerja")
        Catch ex As Exception

        End Try
    End Sub
End Class
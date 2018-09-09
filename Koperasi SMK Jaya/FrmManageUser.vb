Public Class FrmManageUser
    Dim simpan As Boolean
    Private Sub tutup_Click(sender As Object, e As EventArgs) Handles tutup.Click
        Close()
    End Sub

    Private Sub kecil_Click(sender As Object, e As EventArgs) Handles kecil.Click
        Me.WindowState = FormWindowState.Minimized
    End Sub

    Private Sub FrmManageUser_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        load()
        setDisable(GroupBox1.Controls)
        setEnable(GroupBox2.Controls)
        setEnable(GroupBox3.Controls)
    End Sub

    Function load()
        ComboBox1.Items.Add("Pilih Level Anggota")
        ComboBox1.Items.Add("Admin")
        ComboBox1.Items.Add("Kasir")
        ComboBox1.Items.Add("Super")
        ComboBox1.SelectedIndex = 0

        sql = "select * from pengguna"
        fetchData(sql, DataGridView1)
    End Function

    Private Sub DataGridView1_CellClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridView1.CellClick
        Try
            row = DataGridView1.Rows(e.RowIndex)

            TextBox1.Text = getText(row, "ID_pengguna")
            TextBox2.Text = getText(row, "Nama_pengguna")
            TextBox3.Text = getText(row, "nama_login")
            TextBox4.Text = getText(row, "password_login")
            ComboBox1.SelectedItem = getText(row, "level")
        Catch ex As Exception

        End Try
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        simpan = True
        setReset(GroupBox1.Controls)
        setEnable(GroupBox1.Controls)
        setDisable(GroupBox2.Controls)
        setDisable(GroupBox3.Controls)
        TextBox1.Text = getID()
    End Sub

    Private Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        simpan = False
        setEnable(GroupBox1.Controls)
        setDisable(GroupBox2.Controls)
        setDisable(GroupBox3.Controls)
    End Sub

    Private Sub Button6_Click(sender As Object, e As EventArgs) Handles Button6.Click
        Close()
    End Sub

    Private Sub FrmManageUser_FormClosed(sender As Object, e As FormClosedEventArgs) Handles MyBase.FormClosed
        FrmUser.Show()
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        setReset(GroupBox1.Controls)
        setDisable(GroupBox1.Controls)
        setEnable(GroupBox2.Controls)
        setEnable(GroupBox3.Controls)
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If isEmpty(TextBox1) Or isEmpty(TextBox2) Or isEmpty(TextBox3) Or isEmpty(TextBox4) Then
            info("Harap Isi Form")
        ElseIf ComboBox1.SelectedIndex = 0 Then
            info("Harap Pilih Level")
        Else
            If simpan Then
                sql = "insert into pengguna values ('" & TextBox1.Text & "','" & TextBox2.Text & "','" & TextBox3.Text & "','" & TextBox4.Text & "','" & ComboBox1.SelectedItem & "')"
                If execSQL(sql) Then
                    setReset(GroupBox1.Controls)
                    setDisable(GroupBox1.Controls)
                    setEnable(GroupBox2.Controls)
                    setEnable(GroupBox3.Controls)
                    load()
                    info("Berhasil Menambah Pengguna")
                Else
                    info("Gagal Menambah Pengguna")
                End If
            Else
                sql = "update pengguna set nama_pengguna='" & TextBox2.Text & "',
                nama_login='" & TextBox3.Text & "',password_login='" & TextBox4.Text & "',
                level='" & ComboBox1.SelectedItem & "' where id_pengguna='" & TextBox1.Text & "'"

                If execSQL(sql) Then
                    setReset(GroupBox1.Controls)
                    setDisable(GroupBox1.Controls)
                    setEnable(GroupBox2.Controls)
                    setEnable(GroupBox3.Controls)
                    load()
                    info("Berhasil Ubah Pengguna")
                Else
                    info("Gagal Ubah Pengguna" & sql)
                End If
            End If
        End If
    End Sub

    Private Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        sql = "select * From penj_detail_anggota where id_pengguna='" & TextBox1.Text & "'"
        sql1 = "select * From penj_detail_umum where id_pengguna='" & TextBox1.Text & "'"
        If isEmpty(TextBox1) Then
            info("Harap Pilih pengguna terlebih dahulu")
        ElseIf rowsCount(sql) > 0 Or rowsCount(sql1) > 0 Then
            info("Pengguna Tidak Bisa Dihapus Karena Telah Memiliki Transaksi")
        Else
            If ask("Apakah Anda yakin ?") Then
                sql = "delete from pengguna where id_pengguna='" & TextBox1.Text & "'"
                If execSQL(sql) Then
                    setReset(GroupBox1.Controls)
                    setDisable(GroupBox1.Controls)
                    setEnable(GroupBox2.Controls)
                    load()
                    setEnable(GroupBox3.Controls)
                    info("Hapus pengguna berhasil")
                Else
                    info("gagal hapus pengguna")
                End If
            End If
        End If
    End Sub
End Class
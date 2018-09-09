Public Class FrmManageAnggota
    Dim simpan As Boolean
    Public idunit As String

    Function load()
        ComboBox1.Items.Add("Silahkan Pilih Jenis Kelamin")
        ComboBox1.Items.Add("Pria")
        ComboBox1.Items.Add("Perempuan")
        ComboBox1.SelectedIndex = 0

        sql = "select [id_anggota]
      ,[Unit_kerja]
      ,[NPP]
      ,[Nama_Anggota]
      ,[Tempat_lahir]
      ,[Tgl_lahir]
      ,[Jenis_Kelamin]
      ,[Alamat]
      ,[Tgl_jadi_Anggota]
      ,[Id_Unit_kerja] from qanggota where nama_anggota like '%" & TextBox9.Text & "%'"
        fetchData(sql, DataGridView1)
    End Function
    Private Sub FrmManageAnggota_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        setDisable(GroupBox1.Controls)
        load()
    End Sub

    Private Sub tutup_Click(sender As Object, e As EventArgs) Handles tutup.Click
        Close()
    End Sub

    Private Sub kecil_Click(sender As Object, e As EventArgs) Handles kecil.Click
        Me.WindowState = FormWindowState.Minimized
    End Sub

    Private Sub Button6_Click(sender As Object, e As EventArgs) Handles Button6.Click
        Close()
    End Sub

    Private Sub FrmManageAnggota_FormClosed(sender As Object, e As FormClosedEventArgs) Handles MyBase.FormClosed
        If role = "Admin" Then
            FrmAdmin.Show()
        Else
            FrmAdministrasi.Show()
        End If
    End Sub

    Private Sub TextBox9_TextChanged(sender As Object, e As EventArgs) Handles TextBox9.TextChanged
        load()
    End Sub

    Private Sub Button7_Click(sender As Object, e As EventArgs) Handles Button7.Click
        FrmCariUnit.Show()
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        setDisable(GroupBox1.Controls)
        setEnable(GroupBox2.Controls)
        setEnable(GroupBox3.Controls)
        setReset(GroupBox1.Controls)
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        simpan = True
        setReset(GroupBox1.Controls)
        setEnable(GroupBox1.Controls)
        setDisable(GroupBox2.Controls)
        setDisable(GroupBox3.Controls)

        TextBox1.Text = getIDAnggota()
    End Sub

    Private Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        simpan = False
        setEnable(GroupBox1.Controls)
        setDisable(GroupBox2.Controls)
        setDisable(GroupBox3.Controls)
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If isEmpty(TextBox2) Then
            info("Harap Pilih Unit Kerja")
        ElseIf isEmpty(TextBox3) Or isNumber(TextBox3.Text) Then
            info("Harap Masukkan NPP dengan benar")
        ElseIf isEmpty(TextBox4) Then
            info("Harap Masukkan Nama Anggota")
        ElseIf isEmpty(TextBox5) Or getDTP(DateTimePicker1) = Format(Now(), "yyyy-MM-dd") Then
            info("Harap Masukkan tanggal lahir yang benar")
        ElseIf ComboBox1.SelectedIndex = 0 Then
            info("Harap pilih jenis kelamin")
        ElseIf isEmpty(TextBox7) Then
            info("Harap Isi alamat anda")
        Else
            If simpan Then
                sql = "insert into anggota values ('" & TextBox1.Text & "','" & Label10.Text & "','" & TextBox3.Text & "',
                '" & TextBox4.Text & "','" & TextBox5.Text & "','" & getDTP(DateTimePicker1) & "',
                '" & ComboBox1.SelectedItem & "','" & TextBox7.Text & "','" & getDTP(DateTimePicker2) & "','','0')"

                If execSQL(sql) Then
                    load()
                    setReset(GroupBox1.Controls)
                    setDisable(GroupBox1.Controls)
                    setEnable(GroupBox2.Controls)
                    setEnable(GroupBox3.Controls)
                    info("Berhasil menambah anggota")
                Else
                    info("Gagal Menambah Anggota")
                End If
            Else
                sql = "update anggota set nama_anggota='" & TextBox4.Text & "',npp='" & TextBox3.Text & "',
                id_unit_kerja='" & Label10.Text & "', tempat_lahir='" & TextBox5.Text & "', tgl_lahir='" & getDTP(DateTimePicker1) & "',
                jenis_kelamin='" & ComboBox1.SelectedItem & "', alamat='" & TextBox7.Text & "',tgl_Jadi_anggota='" & getDTP(DateTimePicker2) & "' where id_anggota='" & TextBox1.Text & "'"

                If execSQL(sql) Then
                    load()
                    setReset(GroupBox1.Controls)
                    setDisable(GroupBox1.Controls)
                    setEnable(GroupBox2.Controls)
                    setEnable(GroupBox3.Controls)
                    info("Berhasil mengubah anggota")
                Else
                    info("Gagal Mengubah Anggota")
                End If
            End If
        End If
    End Sub

    Private Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        sql = "select * from penjualan_anggota where id_anggota='" & TextBox1.Text & "'"
        If TextBox1.Text = "" Then
            info("Harap Pilih Anggota Terlebih dahulu")
        ElseIf rowsCount(sql) > 0 Then
            info("Anggota Tidak bisa dihapus karena telah memiliki transaksi")
        Else
            If ask("Apakah Anda Yakin ?") Then
                sql = "delete from anggota where id_anggota='" & TextBox1.Text & "'"
                If execSQL(sql) Then
                    load()
                    setReset(GroupBox1.Controls)
                    setDisable(GroupBox1.Controls)
                    setEnable(GroupBox2.Controls)
                    setEnable(GroupBox3.Controls)
                    info("Berhasil Hapus Anggota")
                Else
                    info("Gagal Hapus Anggota")
                End If
            End If
        End If
    End Sub

    Private Sub DataGridView1_CellClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridView1.CellClick
        Try
            row = DataGridView1.Rows(e.RowIndex)

            TextBox1.Text = getText(row, "id_anggota")
            TextBox2.Text = getText(row, "Unit_kerja")
            TextBox4.Text = getText(row, "nama_anggota")
            TextBox3.Text = getText(row, "npp")
            TextBox5.Text = getText(row, "tempat_lahir")
            DateTimePicker1.Value = getText(row, "tgl_lahir")
            ComboBox1.SelectedItem = getText(row, "jenis_kelamin")
            TextBox7.Text = getText(row, "alamat")
            DateTimePicker2.Value = getText(row, "tgl_jadi_anggota")
            Label10.Text = getText(row, "id_unit_kerja")
        Catch ex As Exception

        End Try
    End Sub

    Private Sub GroupBox1_Enter(sender As Object, e As EventArgs) Handles GroupBox1.Enter

    End Sub
End Class
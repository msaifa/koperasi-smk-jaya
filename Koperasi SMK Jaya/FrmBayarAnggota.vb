Public Class FrmBayarAnggota
    Dim id As String
    Dim deposit As Integer
    Dim total As Integer
    Private Sub tutup_Click(sender As Object, e As EventArgs) Handles tutup.Click
        Close()
    End Sub

    Private Sub FrmBayarAnggota_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        total = TextBox4.Text
        ComboBox1.Items.Add("Pilih Metode")
        ComboBox1.Items.Add("Tunai")
        ComboBox1.Items.Add("Deposit")
        ComboBox1.Items.Add("Kredit")
        ComboBox1.Items.Add("Potong Gaji")
        ComboBox1.SelectedIndex = 0

        load()


    End Sub

    Function load()
        sql = "select * from qpenjanggota where id_penjualan_anggota='" & TextBox1.Text & "'"

        TextBox5.Text = getValue(sql, "Nama_anggota")
        id = getValue(sql, "ID_anggota")
    End Function

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Close()
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        If isEmpty(TextBox2) Then
            info("Harap masukkan jumlah pembayaran")
        ElseIf isNumber(TextBox2.Text) Then
            info("Harap masukkan jumlah pembayaran dengan benar")
        ElseIf isEmpty(TextBox3) And ComboBox1.SelectedIndex = 1 Then
            info("Masukkan pembayaran dengan uang yang mencukupi")
        ElseIf isEmpty(TextBox3) And ComboBox1.SelectedIndex = 3 Then
            info("Masukkan jumlah angsuran")
        ElseIf isEmpty(TextBox3) And ComboBox1.SelectedIndex = 4 Then
            info("Masukkan jumlah angsuran")
        ElseIf ComboBox1.SelectedIndex = 0 Then
            info("Silahkan Pilih Metode Pembayaran")
        ElseIf ComboBox1.SelectedIndex = 2 And deposit < total Then
            info("Deposit Anda Kurang")
        ElseIf ComboBox1.SelectedIndex = 1 And TextBox3.Text < 0 Then
            info("Lakukan pembayaran dengan uang pas")
        ElseIf ComboBox1.SelectedIndex = 3 And isEmpty(TextBox2) And isEmpty(TextBox3) Then
            info("Harap isi dengan benar")
        ElseIf ComboBox1.SelectedIndex = 4 And isEmpty(TextBox2) And isEmpty(TextBox3) Then
            info("Harap isi dengan benar")
        Else
            If ComboBox1.SelectedIndex = 1 Then
                sql = "update penjualan_anggota set bayar='" & TextBox2.Text & "',flag_lunas=1,metode='" & ComboBox1.SelectedItem & "',
                saldo='0',angsuran='0',jumlah_angsuran='0',bunga='0' 
                where id_penjualan_anggota='" & TextBox1.Text & "'"
            ElseIf ComboBox1.SelectedIndex = 2 Then
                sql = "update penjualan_anggota set bayar='" & TextBox2.Text & "',flag_lunas=1,metode='" & ComboBox1.SelectedItem & "',
                saldo='0',angsuran='0',jumlah_angsuran='0',bunga='0' 
                where id_penjualan_anggota='" & TextBox1.Text & "'"

                sql1 = "update anggota set saldo_deposit='" & deposit - total & "' where id_anggota='" & id & "'"
                execSQL(sql1)
            ElseIf ComboBox1.SelectedIndex = 3 Or ComboBox1.SelectedIndex = 4 Then
                sql = "update penjualan_anggota set bayar='0',flag_lunas=0,metode='" & ComboBox1.SelectedItem & "',
                saldo='" & total & "',angsuran='" & TextBox6.Text & "',jumlah_angsuran='" & TextBox3.Text & "',bunga='" & TextBox2.Text & "' 
                where id_penjualan_anggota='" & TextBox1.Text & "'"
            End If

            If execSQL(sql) Then

                info("Pembayaran berhasil, terima kasih")
                setReset(FrmTransAnggota.GroupBox1.Controls)
                setReset(FrmTransAnggota.GroupBox2.Controls)

                setEnable(FrmTransAnggota.GroupBox3.Controls)
                setEnable(FrmTransAnggota.GroupBox4.Controls)

                setDisable(FrmTransAnggota.GroupBox2.Controls)
                setDisable(FrmTransAnggota.GroupBox1.Controls)
                FrmTransAnggota.TextBox5.Clear()
                FrmTransAnggota.Label17.Text = "0"
                FrmTransAnggota.Label9.Text = "Jumlah : Rp. 0"
                Close()
            Else
                info("Pembayaran gagal")
            End If
        End If
    End Sub

    Private Sub TextBox2_TextChanged(sender As Object, e As EventArgs) Handles TextBox2.TextChanged
        Try
            If ComboBox1.SelectedIndex = 1 Or ComboBox1.SelectedIndex = 2 Then
                If isNumber(TextBox2.Text) Then
                ElseIf TextBox2.Text <> "" Then
                    Dim jum As Integer = Integer.Parse(TextBox2.Text) - Integer.Parse(TextBox4.Text)
                    TextBox3.Text = jum
                End If
            ElseIf ComboBox1.SelectedIndex = 3 Or ComboBox1.SelectedIndex = 4 Then
                If isEmpty(TextBox2) Then
                ElseIf isNumber(TextBox2.Text) Then
                ElseIf isNumber(TextBox3.Text) Then
                Else
                    Dim bunga As Integer = Integer.Parse(TextBox2.Text) / 100 * total
                    Dim angsur As Integer = total / Integer.Parse(TextBox3.Text)
                    Dim hasil As Integer = bunga + angsur

                    TextBox6.Text = hasil
                End If
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub ComboBox1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ComboBox1.SelectedIndexChanged
        Try
            If ComboBox1.SelectedIndex = 0 Or ComboBox1.SelectedIndex = 1 Then
                mode1()
            ElseIf ComboBox1.SelectedIndex = 2 Then
                Label8.Visible = True
                mode3()
                TextBox2.Text = total
                sql = "select * from anggota where id_anggota='" & id & "'"
                deposit = Integer.Parse(getValue(sql, "saldo_Deposit"))
                Label8.Text = "Jumlah Deposit : Rp. " & deposit
            ElseIf ComboBox1.SelectedIndex = 3 Or ComboBox1.SelectedIndex = 4 Then
                mode2()
                TextBox2.Text = "0"
            Else
                mode1()
            End If
        Catch ex As Exception

        End Try
    End Sub

    Function mode1()
        '237
        '236
        Label2.Text = "Jumlah Bayar"
        Label3.Text = "Kembali"

        TextBox4.Text = total
        Label7.Visible = False
        TextBox3.ReadOnly = True
        TextBox2.Text = "0"
        TextBox6.Visible = False
        Label8.Visible = False
        TextBox2.ReadOnly = False
    End Function

    Function mode2()
        Label2.Text = "Bunga"
        Label3.Text = "Jumlah Angsuran"

        Label7.Visible = True
        Label7.Text = "Angsuran /Bln"
        Label8.Visible = False
        TextBox3.ReadOnly = False
        TextBox6.Visible = True
        TextBox2.ReadOnly = False
        TextBox3.Clear()
        TextBox2.Clear()
    End Function

    Function mode3()
        Label2.Text = "Jumlah Bayar"
        Label3.Text = "Kembali"
        Label7.Visible = False
        TextBox3.ReadOnly = True

        TextBox6.Visible = False
        Label8.Visible = True
        TextBox2.ReadOnly = True
    End Function

    Private Sub TextBox4_TextChanged(sender As Object, e As EventArgs) Handles TextBox4.TextChanged
        Try
            If isNumber(TextBox2.Text) Then
            ElseIf TextBox2.Text <> "" Then
                Dim jum As Integer = Integer.Parse(TextBox2.Text) - Integer.Parse(TextBox4.Text)
                TextBox3.Text = jum
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub TextBox3_TextChanged(sender As Object, e As EventArgs) Handles TextBox3.TextChanged
        If ComboBox1.SelectedIndex = 3 Or ComboBox1.SelectedIndex = 4 Then
            If isEmpty(TextBox2) Then
            ElseIf isNumber(TextBox2.Text) Then
            ElseIf isNumber(TextBox3.Text) Then
            Else
                Dim bunga As Integer = Integer.Parse(TextBox2.Text) / 100 * total
                Dim angsur As Integer = total / Integer.Parse(TextBox3.Text)
                Dim hasil As Integer = bunga + angsur

                TextBox6.Text = hasil
            End If
        End If
    End Sub
End Class
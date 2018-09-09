Public Class FrmDeposit
    Dim saldo As String = 0
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If isEmpty(TextBox1) Then
            info("Mohon Isi jumlah deposit")
        ElseIf isNumber(TextBox1.Text) Then
            info("Mohon Isi dengan angka")
        Else
            Dim total As Integer = Integer.Parse(saldo) + Integer.Parse(TextBox1.Text)
            sql = "insert into transdeposit (id_anggota,jumlah_deposit,tgl_deposit) values 
            ('" & Label5.Text & "','" & TextBox1.Text & "','" & Format(Now(), "yyyy-MM-dd") & "')"
            If execSQL(sql) Then
                load()
                TextBox1.Clear()
                setDisable(GroupBox1.Controls)
                setEnable(GroupBox2.Controls)
                setEnable(GroupBox3.Controls)
                info("Tambah Deposit Berhasil")
            End If
        End If
    End Sub

    Function load()
        sql = "select ID_Anggota,Nama_Anggota,Unit_Kerja,Jenis_Kelamin,Saldo_Deposit from qAnggota where nama_anggota like '%" & TextBox2.Text & "%'"

        fetchData(sql, DataGridView1)
    End Function
    Private Sub FrmDeposit_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        load()
        setDisable(GroupBox1.Controls)
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        setDisable(GroupBox1.Controls)
        setEnable(GroupBox2.Controls)
        setEnable(GroupBox3.Controls)
    End Sub

    Private Sub TextBox2_TextChanged(sender As Object, e As EventArgs) Handles TextBox2.TextChanged
        load()
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        setEnable(GroupBox1.Controls)
        setDisable(GroupBox2.Controls)
        setDisable(GroupBox3.Controls)
    End Sub

    Private Sub tutup_Click(sender As Object, e As EventArgs) Handles tutup.Click
        Close()
    End Sub

    Private Sub kecil_Click(sender As Object, e As EventArgs) Handles kecil.Click
        Me.WindowState = FormWindowState.Minimized
    End Sub

    Private Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        Close()
    End Sub

    Private Sub FrmDeposit_FormClosed(sender As Object, e As FormClosedEventArgs) Handles MyBase.FormClosed
        FrmUser.Show()
    End Sub

    Private Sub DataGridView1_CellClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridView1.CellClick
        Try
            row = DataGridView1.Rows(e.RowIndex)

            Label5.Text = getText(row, "id_anggota")
            saldo = getText(row, "saldo_deposit")
            Label3.Text = "Rp. " & saldo
        Catch ex As Exception

        End Try
    End Sub
End Class
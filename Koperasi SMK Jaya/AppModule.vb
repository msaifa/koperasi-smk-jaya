Imports System.Data.SqlClient
Imports System.Text.RegularExpressions

Module AppModule
    Dim koneksi As New SqlConnection
    Dim CMD As New SqlCommand
    Dim path As String = "data source=DESKTOP-6PGLQ1T\SQLEXPRESS ; initial catalog=Comp14 ; integrated security=true"

    Dim DT As DataTable
    Dim DR As SqlDataReader
    Dim DS As DataSet
    Dim DA As SqlDataAdapter

    Public sql, sql1, username, nama, temp, role, iduser As String
    Public isLogin As Boolean = False
    Public isLoad As Boolean
    Public row As DataGridViewRow
    Function conn()
        Try
            If ConnectionState.Closed = koneksi.State Then
                koneksi.ConnectionString = path
                koneksi.Open()
            End If
        Catch ex As Exception
            warn("Failed Get Connection" & ex.Message)
        End Try
    End Function

    Function close()
        Try
            koneksi.Close()
            CMD.Dispose()
        Catch ex As Exception

        End Try
    End Function

    Function fillCMD(sql As String)
        Try
            conn()

            CMD.Connection = koneksi
            CMD.CommandType = CommandType.Text
            CMD.CommandText = sql
        Catch ex As Exception
            warn("Failed Fill CMD" & vbNewLine & ex.Message)
        End Try
    End Function

    Public Function fillDT(sql As String)
        Try
            DT = New DataTable
            DA = New SqlDataAdapter

            fillCMD(sql)

            DA.SelectCommand = CMD
            DA.Fill(DT)

            Return DT
        Catch ex As Exception
            warn("Failed FIll DT" & vbNewLine & ex.Message)
        Finally
            close()
        End Try
    End Function

    Public Function execSQL(sql As String)
        Try
            fillCMD(sql)
            CMD.ExecuteNonQuery()
            Return True
        Catch ex As Exception
            warn("Failed Exec SQL" & vbNewLine & ex.Message)
        Finally
            close()
        End Try
    End Function

    Public Function fetchData(sql As String, DG As DataGridView)
        Try
            fillDT(sql)

            DG.DataSource = DT
            DG.TopLeftHeaderCell.Value = "No."
            DG.TopLeftHeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter

            For i As Integer = 0 To DT.Rows.Count - 1
                DG.Rows(i).HeaderCell.Value = (i + 1).ToString
            Next
        Catch ex As Exception
            warn("Failed Fetch Data" & vbNewLine & ex.Message)
        End Try
    End Function

    Public Function fetchData(sql As String, DG As DataGridView, label As Label)
        Try
            fillDT(sql)

            DG.DataSource = DT
            DG.TopLeftHeaderCell.Value = "No."
            DG.TopLeftHeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter

            For i As Integer = 0 To DT.Rows.Count - 1
                DG.Rows(i).HeaderCell.Value = (i + 1).ToString
            Next

            label.Text = "Total Data : " & DT.Rows.Count
        Catch ex As Exception
            warn("Failed Fetch Data" & vbNewLine & ex.Message)
        End Try
    End Function

    Public Function fillCombo(sql As String, CB As ComboBox, display As String, values As String)
        Try
            fillDT(sql)

            CB.DataSource = DT
            CB.DisplayMember = display
            CB.ValueMember = values
        Catch ex As Exception
            warn("Failed Fill Combo" & vbNewLine & ex.Message)
        End Try
    End Function

    Public Function rowsCount(sql As String)
        Try
            fillDT(sql)
            Return DT.Rows.Count
        Catch ex As Exception
            warn("Failed Rows Count" & vbNewLine & ex.Message)
        End Try
    End Function

    Public Function getValue(sql As String, col As String)
        Try


            If rowsCount(sql) > 0 Then
                fillCMD(sql)
                DR = CMD.ExecuteReader
                DR.Read()
                Return DR.Item(col)
            Else
                Return "0"
            End If
        Catch ex As Exception
            warn("Failed get Value" & vbNewLine & ex.Message)
        Finally
            close()
            DR.Close()
        End Try
    End Function


    Public Function getID()
        Try
            sql = "select * From pengguna order by id_pengguna desc"
            If rowsCount(sql) > 0 Then
                fillCMD(sql)
                DR = CMD.ExecuteReader
                DR.Read()

                Dim idlama As String = DR.Item("id_pengguna")
                Dim idbaru As String = (idlama.Substring(1, 3) + 1).ToString

                Return "A" & idbaru
            Else
                Return "A001"
            End If

        Catch ex As Exception
            info("Failed Get ID")
        Finally
            close()
        End Try
    End Function

    Public Function getIDJenis()
        Try
            sql = "select * From jenis_barang order by id_jenis_barang desc"
            If rowsCount(sql) > 0 Then
                fillCMD(sql)
                DR = CMD.ExecuteReader
                DR.Read()

                Dim idlama As String = DR.Item("id_jenis_barang")
                Dim idbaru As String = (idlama.Substring(2, 3) + 1).ToString
                Dim nol As String = ""

                For i As Integer = 1 To 2 - idbaru.Length
                    nol += "0"
                Next

                Return "JB" & idbaru
            Else
                Return "JB256"
            End If

        Catch ex As Exception
            info("Failed Get ID Anggota")
        Finally
            close()
        End Try
    End Function

    Public Function getIDAnggota()
        Try
            sql = "select * From anggota order by id_anggota desc"
            If rowsCount(sql) > 0 Then
                fillCMD(sql)
                DR = CMD.ExecuteReader
                DR.Read()

                Dim idlama As String = DR.Item("id_anggota")
                Dim idbaru As String = (idlama.Substring(2, 3) + 1).ToString
                Dim nol As String = ""

                For i As Integer = 1 To 3 - idbaru.Length
                    nol += "0"
                Next

                Return "KA" & nol & idbaru
            Else
                Return "KA001"
            End If

        Catch ex As Exception
            info("Failed Get ID Anggota")
        Finally
            close()
        End Try
    End Function

    Public Function getIDUnit()
        Try
            sql = "select * From unit_kerja order by id_unit_kerja desc"
            If rowsCount(sql) > 0 Then
                fillCMD(sql)
                DR = CMD.ExecuteReader
                DR.Read()

                Dim idlama As String = DR.Item("id_unit_kerja")
                Dim idbaru As String = (idlama.Substring(2, 2) + 1).ToString
                Dim nol As String = ""

                For i As Integer = 1 To 2 - idbaru.Length
                    nol += "0"
                Next

                Return "KU" & nol & idbaru
            Else
                Return "KU01"
            End If

        Catch ex As Exception
            info("Failed Get ID Anggota")
        Finally
            close()
        End Try
    End Function

    Public Function getIDBarang()
        Try
            sql = "select * From barang order by id_barang desc"
            If rowsCount(sql) > 0 Then
                fillCMD(sql)
                DR = CMD.ExecuteReader
                DR.Read()

                Dim idlama As String = DR.Item("id_barang")
                Dim idbaru As String = (idlama.Substring(2, 4) + 1).ToString
                Dim nol As String = ""

                For i As Integer = 1 To 4 - idbaru.Length
                    nol += "0"
                Next

                Return "KB" & nol & idbaru
            Else
                Return "KB0001"
            End If

        Catch ex As Exception
            info("Failed Get ID Anggota")
        Finally
            close()
        End Try
    End Function

    Public Function getIDpenjUmum()
        Try
            sql = "select * From Penjualan_Umum order by id_penjualan_Umum desc"
            If rowsCount(sql) > 0 Then
                fillCMD(sql)
                DR = CMD.ExecuteReader
                DR.Read()

                Dim idlama As String = DR.Item("Id_Penjualan_Umum")
                Dim idbaru As String = (idlama.Substring(2, 3) + 1).ToString
                Dim nol As String = ""

                For i As Integer = 1 To 3 - idbaru.Length
                    nol += "0"
                Next

                Return "PU" & nol & idbaru
            Else
                Return "PU001"
            End If

        Catch ex As Exception
            info("Failed Get ID Penjualan Umum")
        Finally
            close()
        End Try
    End Function

    Public Function getIDpenjAnggota()
        Try
            sql = "select * From Penjualan_Anggota order by id_penjualan_Anggota desc"
            If rowsCount(sql) > 0 Then
                fillCMD(sql)
                DR = CMD.ExecuteReader
                DR.Read()

                Dim idlama As String = DR.Item("Id_Penjualan_Anggota")
                Dim idbaru As String = (idlama.Substring(2, 3) + 1).ToString
                Dim nol As String = ""

                For i As Integer = 1 To 3 - idbaru.Length
                    nol += "0"
                Next

                Return "PA" & nol & idbaru
            Else
                Return "PA001"
            End If

        Catch ex As Exception
            info("Failed Get ID Penjualan Anggota")
        Finally
            close()
        End Try
    End Function

    Public Function getAngsuranKe(PA As String)
        Try
            sql = "select * from cicilan where ID_penjualan_anggota='" & PA & "' order by angsuran_ke desc"
            If rowsCount(sql) > 0 Then
                fillCMD(sql)
                DR = CMD.ExecuteReader
                DR.Read()

                Dim idlama As String = DR.Item("angsuran_ke")
                Dim idbaru As String = (idlama + 1).ToString

                Return idbaru
            Else
                Return "1"
            End If
        Catch ex As Exception
            info("Failed Get Angsuran Ke" & vbNewLine & ex.Message)
        Finally
            close()
        End Try
    End Function

    'custom function M Saif Alikhan

    Public Function info(teks As String)
        MessageBox.Show(teks, "Information", MessageBoxButtons.OK, MessageBoxIcon.Information)
    End Function

    Public Function warn(teks As String)
        MessageBox.Show(teks, "Warning!", MessageBoxButtons.OK, MessageBoxIcon.Warning)
    End Function

    Public Function ask(teks As String)
        If MessageBox.Show(teks, "Confirmation", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Function isEmpty(Teks As TextBox)
        If Teks.Text = "" Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Function getDTP(DTP As DateTimePicker)
        Dim tgl As String = DTP.Value

        Dim day As String = tgl.Substring(0, 2)
        Dim bln As String = tgl.Substring(3, 2)
        Dim thn As String = tgl.Substring(6, 4)

        Return thn & "-" & bln & "-" & day
    End Function

    Public Function isRegex(teks As String, patten As String)
        If Regex.IsMatch(teks, patten) Then
            Return False
        Else
            Return True
        End If
    End Function

    Public Function isNumber(teks As String)
        Try
            Integer.Parse(teks)
            Return False
        Catch ex As Exception
            Return True
        End Try
    End Function


    Public Function setEnable(cc As Control.ControlCollection)
        For Each ct As Control In cc.OfType(Of TextBox)
            DirectCast(ct, TextBox).Enabled = True
        Next

        For Each ct As Control In cc.OfType(Of Button)
            DirectCast(ct, Button).Enabled = True
        Next

        For Each ct As Control In cc.OfType(Of ComboBox)
            DirectCast(ct, ComboBox).Enabled = True
        Next

        For Each ct As Control In cc.OfType(Of DateTimePicker)
            DirectCast(ct, DateTimePicker).Enabled = True
        Next

        For Each ct As Control In cc.OfType(Of RadioButton)
            DirectCast(ct, RadioButton).Enabled = True
        Next

        For Each ct As Control In cc.OfType(Of DataGridView)
            DirectCast(ct, DataGridView).Enabled = True
        Next
    End Function

    Public Function setDisable(cc As Control.ControlCollection)
        For Each ct As Control In cc.OfType(Of TextBox)
            DirectCast(ct, TextBox).Enabled = False
        Next

        For Each ct As Control In cc.OfType(Of Button)
            DirectCast(ct, Button).Enabled = False
        Next

        For Each ct As Control In cc.OfType(Of ComboBox)
            DirectCast(ct, ComboBox).Enabled = False
        Next

        For Each ct As Control In cc.OfType(Of DateTimePicker)
            DirectCast(ct, DateTimePicker).Enabled = False
        Next

        For Each ct As Control In cc.OfType(Of RadioButton)
            DirectCast(ct, RadioButton).Enabled = False
        Next

        For Each ct As Control In cc.OfType(Of DataGridView)
            DirectCast(ct, DataGridView).Enabled = False
        Next
    End Function

    Public Function setReset(cc As Control.ControlCollection)
        For Each ct As Control In cc.OfType(Of TextBox)
            DirectCast(ct, TextBox).Clear()
        Next

        For Each ct As Control In cc.OfType(Of ComboBox)
            DirectCast(ct, ComboBox).Enabled = False
        Next

        For Each ct As Control In cc.OfType(Of DateTimePicker)
            DirectCast(ct, DateTimePicker).Value = Format(Now(), "yyyy-MM-dd")
        Next

        For Each ct As Control In cc.OfType(Of RadioButton)
            DirectCast(ct, RadioButton).Checked = False
        Next

    End Function

    Public Function getText(row As DataGridViewRow, col As String)
        Try
            Return row.Cells(col).Value.ToString
        Catch ex As Exception

        End Try
    End Function
End Module

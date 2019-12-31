Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Net.Mail
Public Class DataManager
    Private cn As New SqlConnection
    Private Sub getConnection()
        cn.ConnectionString = "Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True"
        cn.Open()
    End Sub
    Public Function getValue(query As String) As String
        Dim result As String = ""
        Try
            getConnection()
            Dim cmd As New SqlCommand(query, cn)
            result = cmd.ExecuteScalar.ToString
        Catch ex As Exception
            result = ex.Message
        Finally
            cn.Close()
        End Try
        Return result
    End Function
    Public Sub setdata(query As String)
        Try
            getConnection()
            Dim cmd As New SqlCommand
            cmd.CommandText = query
            cmd.Connection = cn
            cmd.ExecuteNonQuery()
        Catch ex As Exception
            MsgBox(ex.Message)
        Finally
            cn.Close()
        End Try
        
    End Sub

    Function getdata(query As String) As Data.DataTable
        Dim ds As New Data.DataSet
        Try
            getConnection()
            Dim da As New SqlDataAdapter(query, cn)
            da.Fill(ds)
        Catch ex As Exception
            MsgBox(ex.Message)
        Finally
            cn.Close()
        End Try
        Return ds.Tables(0)
    End Function

    Public Sub SendMail(toid As String, subject As String, body As String)
        Try
            Dim mailmsg As New MailMessage("rushson123@gmail.com", toid, subject, body)
            Dim smtp As New SmtpClient("smtp.gmail.com", 587)
            smtp.EnableSsl = True
            smtp.Credentials = New Net.NetworkCredential("rushson123@gmail.com", "toofanipass1")
            mailmsg.IsBodyHtml = True
            smtp.Send(mailmsg)
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
End Class


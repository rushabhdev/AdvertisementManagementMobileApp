
Partial Class Forgot_Password
    Inherits System.Web.UI.Page
    Dim dm As New DataManager

    Protected Sub btnforgotpassword_Click(sender As Object, e As EventArgs) Handles btnforgotpassword.Click
        Dim dt As Data.DataTable = dm.getdata("Select * from Admin where Admin_Email = '" & txtEmail.Text & "' ")
        If dt.Rows.Count = 1 Then
            '  Session("uid") = dt.Rows(0).Item(0).ToString
            '  Response.Redirect("~\Admin\Home.aspx")
            dm.SendMail(txtEmail.Text, "E-Mail:" & dt.Rows(0).Item(1).ToString, "Password:" & dt.Rows(0).Item(2).ToString)
            MsgBox("Password sent to Registered Email")
        Else
            MsgBox("Email-id you entered is invalid")
        End If
    End Sub
End Class


Partial Class Login
    Inherits System.Web.UI.Page
    Dim dm As New DataManager

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        Dim dt As Data.DataTable = dm.getdata("Select * from Admin where Admin_Email = '" & txtEmail.Text & "' and Admin_Password = '" & txtPassword.Text & "' ")
        If dt.Rows.Count = 1 Then
            Session("uid") = dt.Rows(0).Item(0).ToString
            Session("uname") = dt.Rows(0).Item(1).ToString
            Response.Redirect("~\Admin\Home.aspx")
        Else
            MsgBox("Either Email-id or Password is incorrect")
        End If
    End Sub
End Class

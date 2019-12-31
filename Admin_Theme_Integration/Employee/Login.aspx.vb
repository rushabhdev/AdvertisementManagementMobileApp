
Partial Class Employee_Login
    Inherits System.Web.UI.Page
    Dim dm As New DataManager

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        Dim dt As Data.DataTable = dm.getdata("Select * from Employee where Employee_Email = '" & txtEmail.Text & "' and Employee_Password = '" & txtPassword.Text & "' ")
        If dt.Rows.Count = 1 Then
            Session("uid") = dt.Rows(0).Item(0).ToString
            Session("uname") = dt.Rows(0).Item(1).ToString
            Response.Redirect("~\Employee\Home.aspx")
        Else
            MsgBox("Either Email-id or Password is incorrect")
        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub
End Class

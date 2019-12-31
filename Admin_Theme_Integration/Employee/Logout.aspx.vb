
Partial Class Logout
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        ' Response.Write(Session("uname"))
        Session.Abandon()
        Session.Clear()
        Session.RemoveAll()
        Response.Redirect("~\Employee\Login.aspx")
    End Sub
End Class


Partial Class Admin_Reports_UsersReport
    Inherits System.Web.UI.Page
    Dim dm As New DataManager

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim dt As Data.DataTable = dm.getdata("SELECT [User].User_Id, [User].User_Name, [User].User_Address, [User].User_Password, [User].User_Email, [User].User_Gender, [User].User_Mobile, Location.Location_Name FROM [User] INNER JOIN Location ON [User].Location_Id = Location.Location_Id")
        Dim sb As New StringBuilder
        Label1.Visible = True
        For Each dr As Data.DataRow In dt.Rows
            sb.Append("<tr>")

            sb.Append("<td>")
            sb.Append(dr.Item(0))
            sb.Append("</td>")

            sb.Append("<td>")
            sb.Append(dr.Item(1))
            sb.Append("</td>")

            sb.Append("<td>")
            sb.Append(dr.Item(2))
            sb.Append("</td>")

            sb.Append("<td>")
            sb.Append(dr.Item(3))
            sb.Append("</td>")

            sb.Append("<td>")
            sb.Append(dr.Item(4))
            sb.Append("</td>")

            sb.Append("<td>")
            sb.Append(dr.Item(5))
            sb.Append("</td>")

            sb.Append("<td>")
            sb.Append(dr.Item(6))
            sb.Append("</td>")

            sb.Append("<td>")
            sb.Append(dr.Item(7))
            sb.Append("</td>")

            sb.Append("</tr>")
        Next

        Literal1.Text = sb.ToString
        Label1.Text = dt.Rows.Count & " " & "Records Found"
    End Sub
End Class

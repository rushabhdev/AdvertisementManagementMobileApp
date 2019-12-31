
Partial Class Admin_Reports_LocationWiseUserReport
    Inherits System.Web.UI.Page
    Dim dm As New DataManager

    Protected Sub btngetuser_Click(sender As Object, e As EventArgs) Handles btngetuser.Click
        Dim dt As Data.DataTable = dm.getdata("SELECT Location.Location_Name, [User].User_Name, [User].User_Address, [User].User_Password, [User].User_Email, [User].User_Gender, [User].User_Mobile FROM Location INNER JOIN [User] ON Location.Location_Id = [User].Location_Id where Location.Location_Id='" & DropDownList1.SelectedValue & "'")

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

            sb.Append("</tr>")

        Next
        Literal1.Text = sb.ToString
        Label1.Text = dt.Rows.Count & " " & "Records Found"
    End Sub
End Class

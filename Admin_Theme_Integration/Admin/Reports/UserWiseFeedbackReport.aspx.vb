
Partial Class Admin_Reports_UserWiseFeedbackReport
    Inherits System.Web.UI.Page
    Dim dm As New DataManager

    Protected Sub btnfeedback_Click(sender As Object, e As EventArgs) Handles btnfeedback.Click
        Dim dt As Data.DataTable = dm.getdata("SELECT [User].User_Name, [User].User_Email, [User].User_Mobile, Feedback.Feedback_Date, Feedback.Feedback_Desc FROM [User] INNER JOIN Feedback ON [User].User_Id = Feedback.User_Id where [User].User_Id='" & DropDownList1.SelectedValue & "'")

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
            sb.Append(CDate(dr.Item(3)).ToString("dd-MM-yy"))
            sb.Append("</td>")

            sb.Append("<td>")
            sb.Append(dr.Item(4))
            sb.Append("</td>")

        Next
        Literal1.Text = sb.ToString
        Label1.Text = dt.Rows.Count & " " & "Records found"
    End Sub
End Class

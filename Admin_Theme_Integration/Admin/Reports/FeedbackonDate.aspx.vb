
Partial Class Admin_Reports_FeedbackonDate
    Inherits System.Web.UI.Page
    Dim dm As New DataManager
    Protected Sub btncheckfeedback_Click(sender As Object, e As EventArgs) Handles btncheckfeedback.Click
        Dim dt As Data.DataTable = dm.getdata("SELECT Feedback.Feedback_Id, Feedback.Feedback_Date, Feedback.Feedback_Desc, [User].User_Name FROM Feedback INNER JOIN [User] ON Feedback.User_Id = [User].User_Id where Feedback.Feedback_Date = '" & txtfeedbackondate.Text & "'")
        Dim sb As New StringBuilder
        Label3.Visible = True
        For Each dr As Data.DataRow In dt.Rows
            sb.Append("<tr>")

            sb.Append("<td>")
            sb.Append(dr.Item(0))
            sb.Append("</td>")

            sb.Append("<td>")
            sb.Append(CDate(dr.Item(1)).ToString("dd-MM-yy"))
            sb.Append("</td>")

            sb.Append("<td>")
            sb.Append(dr.Item(2))
            sb.Append("</td>")

            sb.Append("<td>")
            sb.Append(dr.Item(3))
            sb.Append("</td>")

            sb.Append("</tr>")

        Next
        Literal1.Text = sb.ToString
        Label3.Text = dt.Rows.Count & " " & "Records Found"
    End Sub
End Class

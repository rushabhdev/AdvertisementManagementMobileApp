
Partial Class Admin_Reports_UserWiseBookingReport
    Inherits System.Web.UI.Page
    Dim dm As New DataManager


    Protected Sub btnuserbooking_Click(sender As Object, e As EventArgs) Handles btnuserbooking.Click
        Dim dt As Data.DataTable = dm.getdata("SELECT [User].User_Name, Booking.Booking_Id, Booking.Booking_Date, Booking.Booking_Status FROM [User] INNER JOIN Booking ON [User].User_Id = Booking.User_Id  where [User].User_Id='" & DropDownList1.SelectedValue & "'")

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
            sb.Append(CDate(dr.Item(2)).ToString("dd-MM-yy"))
            sb.Append("</td>")

            sb.Append("<td>")
            sb.Append(dr.Item(3))
            sb.Append("</td>")

            sb.Append("</tr>")

        Next
        Literal1.Text = sb.ToString
        Label1.Text = dt.Rows.Count & " " & "Records Found"
    End Sub
End Class

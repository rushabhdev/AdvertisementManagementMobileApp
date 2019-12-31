
Partial Class Admin_Reports_BookingDetailsReport
    Inherits System.Web.UI.Page
    Dim dm As New DataManager

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim dt As Data.DataTable = dm.getdata("SELECT Booking_Details.Details_Id, [User].User_Name, Hoarding.Hoarding_Name, Booking_Details.Banner_Url, Booking_Details.Hoarding_Price FROM Booking_Details INNER JOIN Booking ON Booking_Details.Booking_Id = Booking.Booking_Id INNER JOIN [User] ON Booking.User_Id = [User].User_Id INNER JOIN Hoarding ON Booking_Details.Hoarding_Id = Hoarding.Hoarding_Id")
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
            sb.Append("<img src='../../Banner_Url_Images/" & dr.Item(3) & "' height='50px' width='50px' />")
            sb.Append("</td>")

            sb.Append("<td>")
            sb.Append(dr.Item(4))
            sb.Append("</td>")

            sb.Append("</tr>")

        Next
        Literal1.Text = sb.ToString
        Label1.Text = dt.Rows.Count & " " & "Records Found"
    End Sub
End Class

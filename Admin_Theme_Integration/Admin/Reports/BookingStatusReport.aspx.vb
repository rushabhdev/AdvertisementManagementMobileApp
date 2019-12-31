
Partial Class Admin_Reports_BookingStatusReport
    Inherits System.Web.UI.Page
    Dim dm As New DataManager

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnbookingstatus_Click(sender As Object, e As EventArgs) Handles btnbookingstatus.Click
        Dim dt As Data.DataTable = dm.getdata("SELECT Booking.Booking_Id, Booking.Booking_Date, Booking.Booking_Desc, Booking.Booking_StartDate, Booking.Booking_EndDate, [User].User_Name, Coupon.Coupon_Code, Booking.Booking_Status FROM Booking INNER JOIN [User] ON Booking.User_Id = [User].User_Id INNER JOIN Coupon ON Booking.Coupon_Id = Coupon.Coupon_Id where Booking.Booking_Status='" & DropDownList1.SelectedValue & "'")
        Dim sb As New StringBuilder
        Label1.Visible = True
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
            sb.Append(CDate(dr.Item(3)).ToString("dd-MM-yy"))
            sb.Append("</td>")

            sb.Append("<td>")
            sb.Append(CDate(dr.Item(4)).ToString("dd-MM-yy"))
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

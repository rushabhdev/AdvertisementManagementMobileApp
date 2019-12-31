
Partial Class Admin_Reports_PaymentOnDate
    Inherits System.Web.UI.Page
    Dim dm As New DataManager

    Protected Sub btncheckbooking_Click(sender As Object, e As EventArgs) Handles btncheckbooking.Click
        Dim dt As Data.DataTable = dm.getdata("SELECT Payment.Payment_Id, Payment.Payment_Date, Payment.Payment_Amount, Booking.Booking_Id, Booking.Booking_Date, [User].User_Name FROM Payment INNER JOIN Booking ON Payment.Booking_Id = Booking.Booking_Id INNER JOIN [User] ON Booking.User_Id = [User].User_Id where Payment.Payment_Date = '" & txtpaymentondate.Text & "'")
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

            sb.Append("<td>")
            sb.Append(CDate(dr.Item(4)).ToString("dd-MM-yy"))
            sb.Append("</td>")

            sb.Append("<td>")
            sb.Append(dr.Item(5))
            sb.Append("</td>")

            sb.Append("</tr>")

        Next
        Literal1.Text = sb.ToString
        Label3.Text = dt.Rows.Count & " " & "Records Found"
    End Sub
End Class

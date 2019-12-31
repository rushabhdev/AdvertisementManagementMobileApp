
Partial Class Admin_Reports_CouponbtwnStartEndDate
    Inherits System.Web.UI.Page
    Dim dm As New DataManager

    Protected Sub btncheckcoupon_Click(sender As Object, e As EventArgs) Handles btncheckcoupon.Click
        Dim dt As Data.DataTable = dm.getdata("SELECT * from Coupon where Coupon.Coupon_Startdate between '" & txtcouponfromdate.Text & "' and '" & txtcoupontodate.Text & "'")
        Dim sb As New StringBuilder
        Label3.Visible = True
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

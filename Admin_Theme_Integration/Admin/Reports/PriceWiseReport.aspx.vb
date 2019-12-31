
Partial Class Admin_Reports_PriceWiseReport
    Inherits System.Web.UI.Page
    Dim dm As New DataManager

    Protected Sub btnpricefilter_Click(sender As Object, e As EventArgs) Handles btnpricefilter.Click
        Dim dt As Data.DataTable = dm.getdata("SELECT Hoarding.Hoarding_Id, Hoarding.Hoarding_Name, Hoarding.Hoarding_Address, Location.Location_Name, Hoarding_Type.HoardingType_Name, Hoarding.Hoarding_Height, Hoarding.Hoarding_Width, Hoarding.Hoarding_Price, Hoarding.Hoarding_Image FROM Hoarding INNER JOIN Hoarding_Type ON Hoarding.HoardingType_Id = Hoarding_Type.HoardingType_Id INNER JOIN Location ON Hoarding.Location_Id = Location.Location_Id where Hoarding_Price between '" & txtminprice.Text & "' and '" & txtmaxprice.Text & "' ")

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

            sb.Append("<td>")
            sb.Append("<img src='../../Hoarding_Image/" & dr.Item(8) & "' height='50px' width='50px' />")
            sb.Append("</td>")

            sb.Append("</tr>")
        Next

        Literal1.Text = sb.ToString
        Label3.Text = dt.Rows.Count & " " & "Records Found"
    End Sub
End Class

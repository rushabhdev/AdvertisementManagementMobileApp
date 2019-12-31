
Partial Class Admin_Reports_LocationWiseHoardingReport
    Inherits System.Web.UI.Page
    Dim dm As New DataManager
   
    Protected Sub btnHoarding_Click(sender As Object, e As EventArgs) Handles btnHoarding.Click
        Dim dt As Data.DataTable = dm.getdata("SELECT Location.Location_Name, Hoarding.Hoarding_Name, Hoarding.Hoarding_Address, Hoarding_Type.HoardingType_Name, Hoarding.Hoarding_Height, Hoarding.Hoarding_Width, Hoarding.Hoarding_Price, Hoarding.Hoarding_Image FROM Location INNER JOIN Hoarding ON Location.Location_Id = Hoarding.Location_Id INNER JOIN Hoarding_Type ON Hoarding.HoardingType_Id = Hoarding_Type.HoardingType_Id where Location.Location_Id='" & DropDownList1.SelectedValue & "'")

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
            sb.Append("<img src='../../Hoarding_Image/" & dr.Item(7) & "' height='50px' width='50px' />")
            sb.Append("</td>")

            sb.Append("</tr>")

        Next
        Literal1.Text = sb.ToString
        Label1.Text = dt.Rows.Count & " " & "Records Found"
    End Sub
End Class


Partial Class Admin_Reports_TypeWiseHoardingReport
    Inherits System.Web.UI.Page
    Dim dm As New DataManager


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnchecktype_Click(sender As Object, e As EventArgs) Handles btnchecktype.Click
        Dim dt As Data.DataTable = dm.getdata("SELECT Hoarding_Type.HoardingType_Name, Hoarding.Hoarding_Name, Hoarding.Hoarding_Address, Location.Location_Name, Hoarding.Hoarding_Height, Hoarding.Hoarding_Width, Hoarding.Hoarding_Price, Hoarding.Hoarding_Image FROM Hoarding_Type INNER JOIN Hoarding ON Hoarding_Type.HoardingType_Id = Hoarding.HoardingType_Id INNER JOIN Location ON Hoarding.Location_Id = Location.Location_Id where Hoarding_Type.HoardingType_Id='" & DropDownList1.SelectedValue & "'")
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

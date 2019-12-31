
Partial Class Admin_Reports_EachEmployeeTaskReport
    Inherits System.Web.UI.Page
    Dim dm As New DataManager

    Protected Sub btnempwork_Click(sender As Object, e As EventArgs) Handles btnempwork.Click
        Dim dt As Data.DataTable = dm.getdata("SELECT Employee.Employee_Name, Employee_Task.Work_Title, Employee_Task.Work_Desc, Employee_Task.Work_Status, Employee.Employee_Email, Employee.Employee_Mobile FROM Employee_Task INNER JOIN Employee ON Employee_Task.Employee_Id = Employee.Employee_Id where Employee.Employee_Id='" & DropDownList1.SelectedValue & "'")

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

            sb.Append("</tr>")

        Next
        Literal1.Text = sb.ToString
        Label1.Text = dt.Rows.Count & " " & "Records Found"
    End Sub
End Class

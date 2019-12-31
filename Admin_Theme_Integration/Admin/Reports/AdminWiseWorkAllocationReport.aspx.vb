
Partial Class Admin_Reports_AdminWiseWorkAllocationReport
    Inherits System.Web.UI.Page
    Dim dm As New DataManager

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnadminswork_Click(sender As Object, e As EventArgs) Handles btnadminswork.Click
        Dim dt As Data.DataTable = dm.getdata("SELECT Employee_Task.Work_Id, Employee_Task.Work_Title, Employee_Task.Work_Desc, Employee.Employee_Name, Admin.Admin_Name, Employee_Task.Work_Status FROM Employee_Task INNER JOIN Employee ON Employee_Task.Employee_Id = Employee.Employee_Id INNER JOIN Admin ON Employee_Task.Admin_Id = Admin.Admin_Id where Admin.Admin_Id =" & DropDownList1.SelectedValue.ToString)
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

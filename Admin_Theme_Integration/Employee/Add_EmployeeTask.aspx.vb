
Partial Class Add_EmployeeTask
    Inherits System.Web.UI.Page
    Dim dm As New DataManager

    Protected Sub btninsert_Click(sender As Object, e As EventArgs) Handles btninsert.Click
        If btninsert.Text = "Insert" Then

        Else
            dm.setdata("Update Employee_Task set Work_Status = '" & txtworkstatus.Text & "' Where Work_Id = " & GridView1.SelectedValue & "")
        End If
        MultiView1.ActiveViewIndex = 0
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        MultiView1.ActiveViewIndex = 1
        btninsert.Text = "Update"
    End Sub
End Class

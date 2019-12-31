
Partial Class Add_EmployeeTask
    Inherits System.Web.UI.Page
    Dim dm As New DataManager


    Protected Sub btnadd_Click(sender As Object, e As EventArgs) Handles btnadd.Click
        MultiView1.ActiveViewIndex = 1
        txtworktitle.Text = ""
        txtworkdescription.Text = ""
        txtemployeeid.DataBind()
        txtemployeeid.Items.Insert(0, New ListItem("--Select Employee Id--", 0))
        txtadminid.DataBind()
        txtadminid.Items.Insert(0, New ListItem("--Select Admin Id--", 0))
        txtworkstatus.Text = ""
        txtbookingid.DataBind()
        txtbookingid.Items.Insert(0, New ListItem("--Select Booking Id--", 0))
        btninsert.Text = "Insert"
    End Sub

    Protected Sub btninsert_Click(sender As Object, e As EventArgs) Handles btninsert.Click
        If btninsert.Text = "Insert" Then
            dm.setdata("Insert into Employee_Task(Work_Title,Work_Desc,Employee_Id,Admin_Id,Work_Status) values('" & txtworktitle.Text & "','" & txtworkdescription.Text & "'," & txtemployeeid.Text & "," & txtadminid.Text & " ,'" & txtworkstatus.Text & "')")
        Else
            dm.setdata("Update Employee_Task set Work_Title = '" & txtworktitle.Text & "', Work_Desc = '" & txtworkdescription.Text & "', Employee_Id = " & txtemployeeid.Text & ", Admin_Id = " & txtadminid.Text & ", Work_Status = '" & txtworkstatus.Text & "' Where Booking_Id = " & GridView1.SelectedValue & " ")
        End If
        MultiView1.ActiveViewIndex = 0
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        MultiView1.ActiveViewIndex = 1
        Dim dt As Data.DataTable = dm.getdata("Select * from Employee_Task where Work_Id = " & GridView1.SelectedValue)
        txtworktitle.Text = dt.Rows(0).Item(1).ToString
        txtworkdescription.Text = dt.Rows(0).Item(2).ToString
        txtemployeeid.Text = dt.Rows(0).Item(3).ToString
        txtadminid.Text = dt.Rows(0).Item(4).ToString
        txtworkstatus.Text = dt.Rows(0).Item(5).ToString
        btninsert.Text = "Update"
    End Sub
End Class

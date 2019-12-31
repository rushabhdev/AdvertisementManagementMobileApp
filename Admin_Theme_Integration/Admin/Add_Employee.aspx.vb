
Partial Class Add_Employee
    Inherits System.Web.UI.Page
    Dim dm As New DataManager

    Protected Sub btnadd_Click(sender As Object, e As EventArgs) Handles btnadd.Click
        MultiView1.ActiveViewIndex = 1
        txtemployeename.Text = ""
        txtemployeemobilenumber.Text = ""
        txtemployeeemail.Text = ""
        txtemployeepassword.Text = ""
        btninsert.Text = "Insert"
    End Sub

    Protected Sub btninsert_Click(sender As Object, e As EventArgs) Handles btninsert.Click
        If btninsert.Text = "Insert" Then
            dm.setdata("Insert into Employee(Employee_Name,Employee_Mobile,Employee_Email,Employee_Password) values('" & txtemployeename.Text & "'," & txtemployeemobilenumber.Text & ",'" & txtemployeeemail.Text & "','" & txtemployeepassword.Text & "')")
        Else
            dm.setdata("Update Employee set Employee_Name = '" & txtemployeename.Text & "', Employee_Mobile = " & txtemployeemobilenumber.Text & ", Employee_Email = '" & txtemployeeemail.Text & "', Employee_Password = '" & txtemployeepassword.Text & "' Where Employee_Id = " & GridView2.SelectedValue & " ")
        End If
        MultiView1.ActiveViewIndex = 0
        GridView2.DataBind()
    End Sub

    Protected Sub GridView2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView2.SelectedIndexChanged
        MultiView1.ActiveViewIndex = 1
        Dim dt As Data.DataTable = dm.getdata("Select * from Employee where Employee_Id = " & GridView2.SelectedValue)
        txtemployeename.Text = dt.Rows(0).Item(1).ToString
        txtemployeemobilenumber.Text = dt.Rows(0).Item(2).ToString
        txtemployeeemail.Text = dt.Rows(0).Item(3).ToString
        txtemployeepassword.Text = dt.Rows(0).Item(4).ToString
        btninsert.Text = "Update"
    End Sub
End Class

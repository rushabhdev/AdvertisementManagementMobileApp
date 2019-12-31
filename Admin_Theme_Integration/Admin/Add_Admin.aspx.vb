
Partial Class Add_Admin

    Inherits System.Web.UI.Page
    Dim dm As New DataManager


    Protected Sub btnadd_Click(sender As Object, e As EventArgs) Handles btnadd.Click
        MultiView1.ActiveViewIndex = 1
        txtadminemail.Text = ""
        txtadminname.Text = ""
        txtadminpassword.Text = ""
        btninsert.Text = "Insert"
    End Sub

    Protected Sub btnadd_Click1(sender As Object, e As System.EventArgs) Handles btnadd.Click

    End Sub

    Protected Sub btninsert_Click(sender As Object, e As EventArgs) Handles btninsert.Click
        If btninsert.Text = "Insert" Then
            dm.setdata("Insert into Admin (Admin_Name,Admin_Password,Admin_Email) values('" & txtadminname.Text & "', '" & txtadminpassword.Text & "','" & txtadminemail.Text & "')")
        Else
            dm.setdata("Update Admin set Admin_Name = '" & txtadminname.Text & "',Admin_Password='" & txtadminpassword.Text & "',Admin_Email='" & txtadminemail.Text & "' where Admin_Id =" & GridView1.SelectedValue & " ")
        End If
        MultiView1.ActiveViewIndex = 0
        GridView1.DataBind() 'to refresh data after insert query
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        MultiView1.ActiveViewIndex = 1
        Dim dt As Data.DataTable = dm.getdata("Select * from Admin where Admin_Id =" & GridView1.SelectedValue)
        txtadminname.Text = dt.Rows(0).Item(1).ToString
        txtadminpassword.Text = dt.Rows(0).Item(2).ToString
        txtadminemail.Text = dt.Rows(0).Item(3).ToString
        btninsert.Text = "Update"
    End Sub
End Class

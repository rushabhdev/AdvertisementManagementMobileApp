
Partial Class Add_Location
    Inherits System.Web.UI.Page
    Dim dm As New DataManager

    Protected Sub btnadd_Click(sender As Object, e As EventArgs) Handles btnadd.Click
        MultiView2.ActiveViewIndex = 1
        txtlocationname.Text = ""
        txtcityid.DataBind()
        txtcityid.Items.Insert(0, New ListItem("--Select City Id--", 0))
        btninsert.Text = "Insert"
    End Sub

    Protected Sub btninsert_Click(sender As Object, e As EventArgs) Handles btninsert.Click
        If btninsert.Text = "Insert" Then
            dm.setdata("Insert into Location(Location_Name,City_Id) values('" & txtlocationname.Text & "'," & txtcityid.Text & ")")
        Else
            dm.setdata("Update Location set Location_Name = '" & txtlocationname.Text & "',City_Id = " & txtcityid.Text & " Where Location_Id = " & GridView1.SelectedValue & " ")
        End If
        MultiView2.ActiveViewIndex = 0
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        MultiView2.ActiveViewIndex = 1
        Dim dt As Data.DataTable = dm.getdata("Select * from Location where Location_Id = " & GridView1.SelectedValue)
        txtlocationname.Text = dt.Rows(0).Item(1).ToString
        txtcityid.Text = dt.Rows(0).Item(2).ToString
        btninsert.Text = "Update"
    End Sub
End Class

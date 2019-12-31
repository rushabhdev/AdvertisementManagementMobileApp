
Partial Class AddHoarding
    Inherits System.Web.UI.Page
    Dim dm As New DataManager

    Protected Sub btnadd_Click(sender As Object, e As System.EventArgs) Handles btnadd.Click
        MultiView2.ActiveViewIndex = 1
        txtcityname.Text = ""
        btninsert.Text = "Insert"
    End Sub

    Protected Sub btninsert_Click(sender As Object, e As EventArgs) Handles btninsert.Click
        If btninsert.Text = "Insert" Then
            dm.setdata("Insert into City(City_Name) values('" & txtcityname.Text & "')")
        Else
            dm.setdata("Update City set City_Name = '" & txtcityname.Text & "' Where City_Id =" & GridView1.SelectedValue & " ")
        End If
        MultiView2.ActiveViewIndex = 0
        GridView1.DataBind() 'to refresh data after insert query
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        MultiView2.ActiveViewIndex = 1
        Dim dt As Data.DataTable = dm.getdata(" Select * from City where City_Id = " & GridView1.SelectedValue)
        txtcityname.Text = dt.Rows(0).Item(1).ToString
        btninsert.Text = "Update"
    End Sub
End Class

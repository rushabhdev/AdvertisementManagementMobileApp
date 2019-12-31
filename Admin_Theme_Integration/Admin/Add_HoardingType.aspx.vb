
Partial Class Add_HoardingType
    Inherits System.Web.UI.Page
    Dim dm As New DataManager

    
    Protected Sub btnadd_Click(sender As Object, e As EventArgs) Handles btnadd.Click
        MultiView1.ActiveViewIndex = 1
        txthoardingtypename.Text = ""
        btninsert.Text = "Insert"
    End Sub

    Protected Sub btninsert_Click(sender As Object, e As EventArgs) Handles btninsert.Click
        If btninsert.Text = "Insert" Then
            dm.setdata("Insert into Hoarding_Type(HoardingType_Name) values('" & txthoardingtypename.Text & "')")
        Else
            dm.setdata("Update Hoarding_Type set HoardingType_Name = '" & txthoardingtypename.Text & "' where HoardingType_Id = " & GridView1.SelectedValue & " ")
        End If
        MultiView1.ActiveViewIndex = 0
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        MultiView1.ActiveViewIndex = 1
        Dim dt As Data.DataTable = dm.getdata("Select * from Hoarding_Type where HoardingType_Id = " & GridView1.SelectedValue)
        txthoardingtypename.Text = dt.Rows(0).Item(1).ToString
        btninsert.Text = "Update"
    End Sub
End Class

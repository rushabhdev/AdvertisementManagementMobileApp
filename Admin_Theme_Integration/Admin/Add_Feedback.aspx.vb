
Partial Class Add_Feedback
    Inherits System.Web.UI.Page
    Dim dm As New DataManager


    Protected Sub btnadd_Click(sender As Object, e As EventArgs) Handles btnadd.Click
        MultiView1.ActiveViewIndex = 1
        txtfeedbackdate.Text = ""
        txtfeedbackdescription.Text = ""
        txtuserid.DataBind()
        txtuserid.Items.Insert(0, New ListItem("--Select User Id--", 0))
        btninsert.Text = "Insert"
    End Sub

    Protected Sub btninsert_Click(sender As Object, e As EventArgs) Handles btninsert.Click
        If btninsert.Text = "Insert" Then
            dm.setdata("Insert into Feedback(Feedback_Date,Feedback_Desc,User_Id) values('" & txtfeedbackdate.Text & "','" & txtfeedbackdescription.Text & "', " & txtuserid.Text & ")")
        Else
            dm.setdata("Update Feedback set Feedback_Date = '" & txtfeedbackdate.Text & "', Feedback_Desc = '" & txtfeedbackdescription.Text & "', User_Id=" & txtuserid.Text & " Where Feedback_Id = " & GridView1.SelectedValue & " ")
        End If
        MultiView1.ActiveViewIndex = 0
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        MultiView1.ActiveViewIndex = 1
        Dim dt As Data.DataTable = dm.getdata("Select * from Feedback where Feedback_Id = " & GridView1.SelectedValue)
        txtfeedbackdate.Text = CDate(dt.Rows(0).Item(1)).ToString("dd-MM-yy")
        txtfeedbackdescription.Text = dt.Rows(0).Item(2).ToString
        txtuserid.Text = dt.Rows(0).Item(3).ToString
        btninsert.Text = "Update"
    End Sub
End Class

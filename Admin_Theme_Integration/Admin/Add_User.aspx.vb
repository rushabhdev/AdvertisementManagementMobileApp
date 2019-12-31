
Partial Class Add_User
    Inherits System.Web.UI.Page
    Dim dm As New DataManager

    Protected Sub btnadd_Click(sender As Object, e As EventArgs) Handles btnadd.Click
        MultiView1.ActiveViewIndex = 1
        txtusername.Text = ""
        txtuseraddress.Text = ""
        txtuserpassword.Text = ""
        txtuseremail.Text = ""
        txtusergender.Text = ""
        txtusermobile.Text = ""
        txtlocationid.DataBind()
        txtlocationid.Items.Insert(0, New ListItem("--Select Location Id--", 0))
        btninsert.Text = "Insert"
    End Sub

    Protected Sub btninsert_Click(sender As Object, e As EventArgs) Handles btninsert.Click
        If btninsert.Text = "Insert" Then
            dm.setdata("Insert into [User](User_Name,User_Address,User_Password,User_Email,User_Gender,User_Mobile,Location_Id) values('" & txtusername.Text & "','" & txtuseraddress.Text & "','" & txtuserpassword.Text & "','" & txtuseremail.Text & "','" & txtusergender.Text & "'," & txtusermobile.Text & "," & txtlocationid.Text & " )")
        Else
            dm.setdata("Update [User] set User_Name = '" & txtusername.Text & "', User_Address = '" & txtuseraddress.Text & "', User_Password = '" & txtuserpassword.Text & "', User_Email = '" & txtuseremail.Text & "', User_Gender = '" & txtusergender.Text & "', User_Mobile = " & txtusermobile.Text & ", Location_Id = " & txtlocationid.Text & " where User_Id = " & GridView1.SelectedValue & " ")
        End If
        MultiView1.ActiveViewIndex = 0
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        MultiView1.ActiveViewIndex = 1
        Dim dt As Data.DataTable = dm.getdata("Select * from [User] where User_Id = " & GridView1.SelectedValue)
        txtusername.Text = dt.Rows(0).Item(1).ToString
        txtuseraddress.Text = dt.Rows(0).Item(2).ToString
        txtuserpassword.Text = dt.Rows(0).Item(3).ToString
        txtuseremail.Text = dt.Rows(0).Item(4).ToString
        txtusergender.Text = dt.Rows(0).Item(5).ToString
        txtusermobile.Text = dt.Rows(0).Item(6).ToString
        txtlocationid.Text = dt.Rows(0).Item(7).ToString
        btninsert.Text = "Update"
    End Sub
End Class

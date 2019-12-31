
Partial Class Add_Booking
    Inherits System.Web.UI.Page
    Dim dm As New DataManager

    Protected Sub btnadd_Click(sender As Object, e As EventArgs) Handles btnadd.Click
        MultiView1.ActiveViewIndex = 1
        txtbookingdate.Text = ""
        txtbookigdescription.Text = ""
        txtbookingstartdate.Text = ""
        txtbookingenddate.Text = ""
        txtuserid.DataBind()
        txtuserid.Items.Insert(0, New ListItem("--Select User--", 0))
        txtcouponid.DataBind()
        txtcouponid.Items.Insert(0, New ListItem("--Select Coupon--", 0))
        txtbookingstatus.Text = ""
        btninsert.Text = "Insert"
    End Sub

    Protected Sub btninsert_Click(sender As Object, e As EventArgs) Handles btninsert.Click
        Dim result As String = ""
        If btninsert.Text = "Insert" Then
            dm.setdata("Insert into Booking(Booking_Date,Booking_Desc,Booking_StartDate,Booking_EndDate,User_Id,Coupon_Id,Booking_Status) values('" & txtbookingdate.Text & "','" & txtbookigdescription.Text & "','" & txtbookingstartdate.Text & "', '" & txtbookingenddate.Text & "'," & txtuserid.Text & "," & txtcouponid.Text & ",'" & txtbookingstatus.Text & "')")
        Else
            dm.setdata("Update Booking set Booking_Date ='" & txtbookingdate.Text & "',Booking_Desc ='" & txtbookigdescription.Text & "',Booking_StartDate ='" & txtbookingstartdate.Text & "',Booking_EndDate ='" & txtbookingenddate.Text & "',User_Id =" & txtuserid.Text & " ,Coupon_Id = " & txtcouponid.Text & " ,Booking_Status ='" & txtbookingstatus.Text & "' Where Booking_Id = " & GridView1.SelectedValue & " ")
            result = txtbookingstatus.Text
            If result = "Cancelled" Or result = "Pending" Or result = "Confirmed" Then
                Dim dt As Data.DataTable = dm.getdata("SELECT * from [User] where User_Id=" & txtuserid.SelectedValue)
                dm.SendMail(dt.Rows(0).Item(4).ToString, "Booking Id:" & GridView1.SelectedValue, "Booking Status:" & result)
                MsgBox("Booking Status Successfully Sent To User's Email")
            End If
        End If
        MultiView1.ActiveViewIndex = 0
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        MultiView1.ActiveViewIndex = 1
        Dim dt As Data.DataTable = dm.getdata("Select * from Booking where Booking_Id = " & GridView1.SelectedValue)
        txtbookingdate.Text = CDate(dt.Rows(0).Item(1)).ToString("dd-MM-yy")
        txtbookigdescription.Text = dt.Rows(0).Item(2).ToString
        txtbookingstartdate.Text = CDate(dt.Rows(0).Item(3)).ToString("dd-MM-yy")
        txtbookingenddate.Text = CDate(dt.Rows(0).Item(4)).ToString("dd-MM-yy")
        txtuserid.Text = dt.Rows(0).Item(5).ToString
        txtcouponid.Text = dt.Rows(0).Item(6).ToString
        txtbookingstatus.Text = dt.Rows(0).Item(7).ToString
        btninsert.Text = "Update"
    End Sub
End Class


Partial Class Add_BookingDetails
    Inherits System.Web.UI.Page
    Dim dm As New DataManager

    Protected Sub btnadd_Click(sender As Object, e As EventArgs) Handles btnadd.Click
        MultiView1.ActiveViewIndex = 1
        txtbookingid.DataBind()
        txtbookingid.Items.Insert(0, New ListItem("--Select Booking Date--", 0))
        txthoardingid.DataBind()
        txthoardingid.Items.Insert(0, New ListItem("--Select Hoarding Name--", 0))
        ' txtbannerurl.Text = ""
        txthoardingprice.Text = ""
        btninsert.Text = "Insert"
    End Sub

    Protected Sub btninsert_Click(sender As Object, e As EventArgs) Handles btninsert.Click
        If btninsert.Text = "Insert" Then
            If FileUpload1.HasFile Then
                If FileUpload1.FileName.ToLower.EndsWith(".png") Or FileUpload1.FileName.ToLower.EndsWith(".jpg") Then
                    FileUpload1.SaveAs(Server.MapPath("~\Banner_Url_Images\" & FileUpload1.FileName))
                    dm.setdata("Insert into Booking_Details (Booking_Id,Hoarding_Id,Banner_Url,Hoarding_Price) values(" & txtbookingid.Text & "," & txthoardingid.Text & ",'" & FileUpload1.FileName & "'," & txthoardingprice.Text & ")")
                    MultiView1.ActiveViewIndex = 0 ' changes view to that of datagridview
                    GridView1.DataBind()  ' binds recently added record
                Else
                    MsgBox("Select .jpg or .png file to upload")
                End If
            Else
                MsgBox("select banner url to be advertised")
            End If
        Else
            If FileUpload1.Visible Then
                If FileUpload1.HasFile Then
                    If FileUpload1.FileName.ToLower.EndsWith(".png") Or FileUpload1.FileName.ToLower.EndsWith(".jpg") Then
                        FileUpload1.SaveAs(Server.MapPath("~\Banner_Url_Images\" & FileUpload1.FileName))
                        dm.setdata("Update Booking_Details set Booking_Id = " & txtbookingid.Text & ", Hoarding_Id = " & txthoardingid.Text & ", Banner_Url = '" & FileUpload1.FileName & "', Hoarding_Price = " & txthoardingprice.Text & "  Where Details_Id = " & GridView1.SelectedValue & " ")
                        MultiView1.ActiveViewIndex = 0
                        GridView1.DataBind()
                    Else
                        MsgBox("Select .jpg or .png file to upload")
                    End If
                Else
                    MsgBox("select file to upload")
                End If
            Else
                dm.setdata("Update Booking_Details set Booking_Id = " & txtbookingid.Text & ", Hoarding_Id = " & txthoardingid.Text & ", Hoarding_Price = " & txthoardingprice.Text & "  Where Details_Id = " & GridView1.SelectedValue & " ")
                MultiView1.ActiveViewIndex = 0
                GridView1.DataBind()
            End If
        End If

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        MultiView1.ActiveViewIndex = 1
        Dim dt As Data.DataTable = dm.getdata("Select * from Booking_Details where Details_Id = " & GridView1.SelectedValue)
        txtbookingid.Text = dt.Rows(0).Item(1).ToString
        txthoardingid.Text = dt.Rows(0).Item(2).ToString        
        txthoardingprice.Text = dt.Rows(0).Item(4).ToString
        FileUpload1.Visible = False
        Image2.Visible = True
        LinkButton1.Visible = True
        Image2.ImageUrl = "~\Banner_Url_Images\" & dt.Rows(0).Item(3).ToString
        btninsert.Text = "Update"
    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        LinkButton1.Visible = False
        Image2.Visible = False
        FileUpload1.Visible = True
    End Sub
End Class

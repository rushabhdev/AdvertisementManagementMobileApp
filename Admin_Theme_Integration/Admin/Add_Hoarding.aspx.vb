
Partial Class Add_Hoarding
    Inherits System.Web.UI.Page
    Dim dm As New DataManager

    Protected Sub btnadd_Click(sender As Object, e As EventArgs) Handles btnadd.Click
        MultiView1.ActiveViewIndex = 1
        txthoardingname.Text = ""
        txthoardingaddress.Text = ""
        txtlocationid.DataBind()
        txtlocationid.Items.Insert(0, New ListItem("--Select Location Name--", 0))
        txthoardingtypeid.DataBind()
        txthoardingtypeid.Items.Insert(0, New ListItem("--Select HoardingType Name--", 0))
        txthoardingheight.Text = ""
        txthoardingwidth.Text = ""
        txthoardingprice.Text = ""
        FileUpload1.Visible = True
        Image2.Visible = False
        LinkButton1.Visible = False
        btninsert.Text = "Insert"
    End Sub

    Protected Sub btninsert_Click(sender As Object, e As EventArgs) Handles btninsert.Click
        If btninsert.Text = "Insert" Then
            If FileUpload1.HasFile Then
                If FileUpload1.FileName.ToLower.EndsWith(".png") Or FileUpload1.FileName.ToLower.EndsWith(".jpg") Then
                    FileUpload1.SaveAs(Server.MapPath("~\Hoarding_Image\" & FileUpload1.FileName))
                    dm.setdata("Insert into Hoarding(Hoarding_Name,Hoarding_Address,Location_Id,HoardingType_Id,Hoarding_Height,Hoarding_Width,Hoarding_Price,Hoarding_Image) values('" & txthoardingname.Text & "','" & txthoardingaddress.Text & "', " & txtlocationid.Text & ", " & txthoardingtypeid.Text & ", " & txthoardingheight.Text & ", " & txthoardingwidth.Text & ", " & txthoardingprice.Text & ",'" & FileUpload1.FileName & "')")
                    MultiView1.ActiveViewIndex = 0
                    GridView1.DataBind()
                Else
                    MsgBox("Select .jpg or .png file to upload")
                End If
            Else
                MsgBox("select file to upload")
            End If
        Else
            If FileUpload1.Visible Then
                If FileUpload1.HasFile Then
                    If FileUpload1.FileName.ToLower.EndsWith(".png") Or FileUpload1.FileName.ToLower.EndsWith(".jpg") Then
                        FileUpload1.SaveAs(Server.MapPath("~\Hoarding_Image\" & FileUpload1.FileName))
                        dm.setdata("Update Hoarding set Hoarding_Name = '" & txthoardingname.Text & "', Hoarding_Address = '" & txthoardingaddress.Text & "', Location_Id = " & txtlocationid.Text & ", HoardingType_Id = " & txthoardingtypeid.Text & ", Hoarding_Height = " & txthoardingheight.Text & ", Hoarding_Width = " & txthoardingwidth.Text & ", Hoarding_Price = " & txthoardingprice.Text & ",Hoarding_Image='" & FileUpload1.FileName & "' Where Hoarding_Id = " & GridView1.SelectedValue & " ")
                        MultiView1.ActiveViewIndex = 0
                        GridView1.DataBind()
                    Else
                        MsgBox("Select .jpg or .png file to upload")
                    End If
                Else
                    MsgBox("select file to upload")
                End If
            Else
                dm.setdata("Update Hoarding set Hoarding_Name = '" & txthoardingname.Text & "', Hoarding_Address = '" & txthoardingaddress.Text & "', Location_Id = " & txtlocationid.Text & ", HoardingType_Id = " & txthoardingtypeid.Text & ", Hoarding_Height = " & txthoardingheight.Text & ", Hoarding_Width = " & txthoardingwidth.Text & ", Hoarding_Price = " & txthoardingprice.Text & " Where Hoarding_Id = " & GridView1.SelectedValue & " ")
                MultiView1.ActiveViewIndex = 0
                GridView1.DataBind()
            End If
        End If
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        MultiView1.ActiveViewIndex = 1
        Dim dt As Data.DataTable = dm.getdata("Select * from Hoarding where Hoarding_Id = " & GridView1.SelectedValue)
        txthoardingname.Text = dt.Rows(0).Item(1).ToString
        txthoardingaddress.Text = dt.Rows(0).Item(2).ToString
        txtlocationid.Text = dt.Rows(0).Item(3).ToString
        txthoardingtypeid.Text = dt.Rows(0).Item(4).ToString
        txthoardingheight.Text = dt.Rows(0).Item(5).ToString
        txthoardingwidth.Text = dt.Rows(0).Item(6).ToString
        txthoardingprice.Text = dt.Rows(0).Item(7).ToString
        FileUpload1.Visible = False
        Image2.Visible = True
        LinkButton1.Visible = True
        Image2.ImageUrl = "~\Hoarding_Image\" & dt.Rows(0).Item(8).ToString
        btninsert.Text = "Update"
    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        LinkButton1.Visible = False
        Image2.Visible = False
        FileUpload1.Visible = True
    End Sub
End Class

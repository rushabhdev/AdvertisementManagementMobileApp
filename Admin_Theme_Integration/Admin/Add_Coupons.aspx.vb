
Partial Class Add_Coupons
    Inherits System.Web.UI.Page
    Dim dm As New DataManager

    Protected Sub btnadd_Click(sender As Object, e As EventArgs) Handles btnadd.Click
        MultiView1.ActiveViewIndex = 1
        txtcouponcode.Text = ""
        txtcoupondescription.Text = ""
        txtcouponstartdate.Text = ""
        txtcouponenddate.Text = ""
        txtcoupondiscount.Text = ""
        btninsert.Text = "Insert"
    End Sub

    Protected Sub btninsert_Click(sender As Object, e As EventArgs) Handles btninsert.Click
        If btninsert.Text = "Insert" Then
            dm.setdata("Insert into Coupon(Coupon_Code,Coupon_Desc,Coupon_Startdate,Coupon_Enddate,Coupon_Discount) values(" & txtcouponcode.Text & ",'" & txtcoupondescription.Text & "','" & txtcouponstartdate.Text & "','" & txtcouponenddate.Text & "'," & txtcoupondiscount.Text & ")")
        Else
            dm.setdata("Update Coupon set Coupon_Code = " & txtcouponcode.Text & ", Coupon_Desc = '" & txtcoupondescription.Text & "', Coupon_Startdate = '" & txtcouponstartdate.Text & "', Coupon_Enddate = '" & txtcouponenddate.Text & "', Coupon_Discount = " & txtcoupondiscount.Text & " Where Coupon_Id = " & GridView1.SelectedValue & " ")
        End If
        MultiView1.ActiveViewIndex = 0
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        MultiView1.ActiveViewIndex = 1
        Dim dt As Data.DataTable = dm.getdata("Select * from Coupon Where Coupon_Id = " & GridView1.SelectedValue)
        txtcouponcode.Text = dt.Rows(0).Item(1).ToString
        txtcoupondescription.Text = dt.Rows(0).Item(2).ToString
        txtcouponstartdate.Text = dt.Rows(0).Item(3).ToString
        txtcouponenddate.Text = dt.Rows(0).Item(4).ToString
        txtcoupondiscount.Text = dt.Rows(0).Item(5).ToString
        btninsert.Text = "Update"
    End Sub
End Class

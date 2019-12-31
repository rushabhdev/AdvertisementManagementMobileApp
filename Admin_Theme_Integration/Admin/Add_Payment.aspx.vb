
Partial Class Add_Payment
    Inherits System.Web.UI.Page
    Dim dm As New DataManager

    Protected Sub btnadd_Click(sender As Object, e As EventArgs) Handles btnadd.Click
        MultiView1.ActiveViewIndex = 1
        txtpaymentdate.Text = ""
        txtpaymentamount.Text = ""
        txtbookingid.DataBind()
        txtbookingid.Items.Insert(0, New ListItem("--Select Booking Id--", 0))
        btninsert.Text = "Insert"
    End Sub

    Protected Sub btninsert_Click(sender As Object, e As EventArgs) Handles btninsert.Click
        If btninsert.Text = "Insert" Then
            dm.setdata("Insert into Payment(Payment_Date,Payment_Amount,Booking_Id) values('" & txtpaymentdate.Text & "'," & txtpaymentamount.Text & "," & txtbookingid.Text & ")")
        Else
            dm.setdata("Update Payment set Payment_Date ='" & txtpaymentdate.Text & "',Payment_Amount = " & txtpaymentamount.Text & ", Booking_Id =" & txtbookingid.Text & " Where Payment_Id = " & GridView1.SelectedValue & " ")
        End If
        MultiView1.ActiveViewIndex = 0
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        MultiView1.ActiveViewIndex = 1
        Dim dt As Data.DataTable = dm.getdata("Select * from Payment where Payment_Id = " & GridView1.SelectedValue)
        txtpaymentdate.Text = dt.Rows(0).Item(1).ToString

        txtpaymentamount.Text = dt.Rows(0).Item(2).ToString
        txtbookingid.Text = dt.Rows(0).Item(3).ToString
        btninsert.Text = "Update"
    End Sub
End Class

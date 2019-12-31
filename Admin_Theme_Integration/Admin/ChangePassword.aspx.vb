
Partial Class Admin_ChangePassword
    Inherits System.Web.UI.Page
    Dim dm As New DataManager

    Protected Sub btnchangepassword_Click(sender As Object, e As EventArgs) Handles btnchangepassword.Click

        Dim dt As Data.DataTable = dm.getdata("Select * from Admin where Admin_Id = " & Session("uid"))
        If dt.Rows(0).Item(2).ToString = txtoldpassword.Text Then
            dm.setdata("Update Admin set Admin_Password ='" & txtnewpassword.Text & "' where Admin_Id =" & Session("uid"))
            MsgBox("Success In Updating Password")
        Else
            MsgBox("Incorrect Password Entered")
        End If
    End Sub
End Class

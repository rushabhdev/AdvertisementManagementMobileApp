Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Web.Script.Serialization
Imports System.Web.Script.Services
Imports System.Data


' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
' <System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class WebService
    Inherits System.Web.Services.WebService

    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    <WebMethod()> _
    Public Function getAdmin() As String
        Dim dm As New DataManager
        Dim dt As DataTable = dm.getdata("Select * from Admin")
        Dim a1(dt.Rows.Count - 1) As Admin
        Dim i As Integer = 0
        For Each dr As DataRow In dt.Rows
            a1(i) = New Admin()
            a1(i).Admin_Id = dr.Item(0).ToString
            a1(i).Admin_Name = dr.Item(1).ToString
            a1(i).Admin_Password = dr.Item(2).ToString
            a1(i).Admin_Email = dr.Item(3).ToString
            i = i + 1
        Next
        Dim js As New JavaScriptSerializer
        Dim json As String = "{""Admin"":" & js.Serialize(a1) & "}"
        Return json
    End Function

    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    <WebMethod()> _
    Public Function getBooking(User_Id As String) As String
        Dim dm As New DataManager
        Dim dt As DataTable = dm.getdata("Select * from Booking where User_Id=" & User_Id)
        Dim b1(dt.Rows.Count - 1) As Booking
        Dim i As Integer = 0
        For Each dr As DataRow In dt.Rows
            b1(i) = New Booking()
            b1(i).Booking_Id = dr.Item(0).ToString
            b1(i).Booking_Date = CDate(dr.Item(1).ToString).ToString("dd-MM-yy")
            b1(i).Booking_Desc = dr.Item(2).ToString
            b1(i).Booking_StartDate = CDate(dr.Item(3).ToString).ToString("dd-MM-yy")
            b1(i).Booking_EndDate = CDate(dr.Item(4).ToString).ToString("dd-MM-yy")
            b1(i).User_Id = dr.Item(5).ToString
            b1(i).Coupon_Id = dr.Item(6).ToString
            b1(i).Booking_Status = dr.Item(7).ToString
            i = i + 1
        Next
        Dim js As New JavaScriptSerializer
        Dim json As String = "{""Booking"":" & js.Serialize(b1) & "}"
        Return json
    End Function

    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    <WebMethod()> _
    Public Function getBooking_Details(Booking_id As String) As String
        Dim dm As New DataManager
        Dim dt As DataTable = dm.getdata("Select * from Booking_Details where Booking_Id=" & Booking_id)
        Dim bd1(dt.Rows.Count - 1) As Booking_Details
        Dim i As Integer = 0
        For Each dr As DataRow In dt.Rows
            bd1(i) = New Booking_Details()
            bd1(i).Details_Id = dr.Item(0).ToString
            bd1(i).Booking_Id = dr.Item(1).ToString
            bd1(i).Hoarding_Id = dm.getValue("Select Hoarding_Name from Hoarding where Hoarding_Id=" & dr.Item(2).ToString)
            bd1(i).Banner_Url = dr.Item(3).ToString
            bd1(i).Hoarding_Price = dr.Item(4).ToString
            i = i + 1
        Next
        Dim js As New JavaScriptSerializer
        Dim json As String = "{""Booking_Details"":" & js.Serialize(bd1) & "}"
        Return json
    End Function

    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    <WebMethod()> _
    Public Function getCity() As String
        Dim dm As New DataManager
        Dim dt As DataTable = dm.getdata("Select * from City")
        Dim c1(dt.Rows.Count - 1) As City
        Dim i As Integer = 0
        For Each dr As DataRow In dt.Rows
            c1(i) = New City()
            c1(i).City_Id = dr.Item(0).ToString
            c1(i).City_Name = dr.Item(1).ToString
            i = i + 1
        Next
        Dim js As New JavaScriptSerializer
        Dim json As String = "{""City"":" & js.Serialize(c1) & "}"
        Return json
    End Function

    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    <WebMethod()> _
    Public Function getCoupon() As String
        Dim dm As New DataManager
        Dim dt As DataTable = dm.getdata("Select * from Coupon")
        Dim co1(dt.Rows.Count - 1) As Coupon
        Dim i As Integer = 0
        For Each dr As DataRow In dt.Rows
            co1(i) = New Coupon()
            co1(i).Coupon_Id = dr.Item(0).ToString
            co1(i).Coupon_Code = dr.Item(1).ToString
            co1(i).Coupon_Desc = dr.Item(2).ToString
            co1(i).Coupon_Startdate = dr.Item(3).ToString
            co1(i).Coupon_Enddate = dr.Item(4).ToString
            co1(i).Coupon_Discount = dr.Item(5).ToString
            i = i + 1
        Next
        Dim js As New JavaScriptSerializer
        Dim json As String = "{""Coupon"":" & js.Serialize(co1) & "}"
        Return json
    End Function

    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    <WebMethod()> _
    Public Function getEmployee() As String
        Dim dm As New DataManager
        Dim dt As DataTable = dm.getdata("Select * from Employee")
        Dim e1(dt.Rows.Count - 1) As Employee
        Dim i As Integer = 0
        For Each dr As DataRow In dt.Rows
            e1(i) = New Employee()
            e1(i).Employee_Id = dr.Item(0).ToString
            e1(i).Employee_Name = dr.Item(1).ToString
            e1(i).Employee_Mobile = dr.Item(2).ToString
            e1(i).Employee_Email = dr.Item(3).ToString
            e1(i).Employee_Password = dr.Item(4).ToString
            i = i + 1
        Next
        Dim js As New JavaScriptSerializer
        Dim json As String = "{""Employee"":" & js.Serialize(e1) & "}"
        Return json
    End Function

    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    <WebMethod()> _
    Public Function getEmployee_Task() As String
        Dim dm As New DataManager
        Dim dt As DataTable = dm.getdata("Select * from Employee_Task")
        Dim et1(dt.Rows.Count - 1) As Employee_Task
        Dim i As Integer = 0
        For Each dr As DataRow In dt.Rows
            et1(i) = New Employee_Task
            et1(i).Work_Id = dr.Item(0).ToString
            et1(i).Work_Title = dr.Item(1).ToString
            et1(i).Work_Desc = dr.Item(2).ToString
            et1(i).Employee_Id = dr.Item(3).ToString
            et1(i).Admin_Id = dr.Item(4).ToString
            et1(i).Work_Status = dr.Item(5).ToString
            i = i + 1
        Next
        Dim js As New JavaScriptSerializer
        Dim json As String = "{""Employee_Task"":" & js.Serialize(et1) & "}"
        Return json
    End Function

    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    <WebMethod()> _
    Public Function getFeedBack() As String
        Dim dm As New DataManager
        Dim dt As DataTable = dm.getdata("Select * from FeedBack")
        Dim f1(dt.Rows.Count - 1) As Feedback
        Dim i As Integer = 0
        For Each dr As DataRow In dt.Rows
            f1(i) = New Feedback
            f1(i).Feedback_Id = dr.Item(0).ToString
            f1(i).Feedback_Date = CDate(dr.Item(1).ToString).ToString("dd-MM-yy")
            f1(i).Feedback_Desc = dr.Item(2).ToString
            f1(i).User_Id = dm.getValue("Select User_Name from [User] where User_Id=" & dr.Item(3).ToString)
            i = i + 1
        Next
        Dim js As New JavaScriptSerializer
        Dim json As String = "{""FeedBack"":" & js.Serialize(f1) & "}"
        Return json
    End Function

    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    <WebMethod()> _
    Public Function getHoarding(HoardingType_Id As String) As String
        Dim dm As New DataManager
        Dim dt As DataTable = dm.getdata("SELECT Hoarding.Hoarding_Id, Hoarding.Hoarding_Name, Hoarding.Hoarding_Address, Location.Location_Name, Hoarding.HoardingType_Id, Hoarding.Hoarding_Height, Hoarding.Hoarding_Width, Hoarding.Hoarding_Price, Hoarding.Hoarding_Image FROM Hoarding INNER JOIN Location ON Hoarding.Location_Id = Location.Location_Id where HoardingType_Id =" & HoardingType_Id)
        Dim h1(dt.Rows.Count - 1) As Hoarding
        Dim i As Integer
        For Each dr As DataRow In dt.Rows
            h1(i) = New Hoarding
            h1(i).Hoarding_Id = dr.Item(0).ToString
            h1(i).Hoarding_Name = dr.Item(1).ToString
            h1(i).Hoarding_Address = dr.Item(2).ToString
            h1(i).Location_Id = dr.Item(3).ToString
            h1(i).HoardingType_Id = dr.Item(4).ToString
            h1(i).Hoarding_Height = dr.Item(5).ToString
            h1(i).Hoarding_Width = dr.Item(6).ToString
            h1(i).Hoarding_Price = dr.Item(7).ToString
            h1(i).Hoarding_Image = dr.Item(8).ToString
            i = i + 1
        Next
        Dim js As New JavaScriptSerializer
        Dim json As String = "{""Hoarding"":" & js.Serialize(h1) & "}"
        Return json
    End Function
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    <WebMethod()> _
    Public Function getHoardingHome() As String
        Dim dm As New DataManager
        Dim dt As DataTable = dm.getdata("SELECT TOP(4) Hoarding.Hoarding_Id, Hoarding.Hoarding_Name, Hoarding.Hoarding_Address, Location.Location_Name, Hoarding.HoardingType_Id, Hoarding.Hoarding_Height, Hoarding.Hoarding_Width, Hoarding.Hoarding_Price, Hoarding.Hoarding_Image FROM Hoarding INNER JOIN Location ON Hoarding.Location_Id = Location.Location_Id order by Hoarding_Id desc")
        Dim h1(dt.Rows.Count - 1) As Hoarding
        Dim i As Integer
        For Each dr As DataRow In dt.Rows
            h1(i) = New Hoarding
            h1(i).Hoarding_Id = dr.Item(0).ToString
            h1(i).Hoarding_Name = dr.Item(1).ToString
            h1(i).Hoarding_Address = dr.Item(2).ToString
            h1(i).Location_Id = dr.Item(3).ToString
            h1(i).HoardingType_Id = dr.Item(4).ToString
            h1(i).Hoarding_Height = dr.Item(5).ToString
            h1(i).Hoarding_Width = dr.Item(6).ToString
            h1(i).Hoarding_Price = dr.Item(7).ToString
            h1(i).Hoarding_Image = dr.Item(8).ToString
            i = i + 1
        Next
        Dim js As New JavaScriptSerializer
        Dim json As String = "{""Hoarding"":" & js.Serialize(h1) & "}"
        Return json
    End Function
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    <WebMethod()> _
    Public Function getHoardingById(Hoarding_Id As String) As String ' new
        Dim dm As New DataManager
        Dim dt As DataTable = dm.getdata("SELECT Hoarding.Hoarding_Id, Hoarding.Hoarding_Name, Hoarding.Hoarding_Address, Location.Location_Name, Hoarding.HoardingType_Id, Hoarding.Hoarding_Height, Hoarding.Hoarding_Width,         Hoarding.Hoarding_Price, Hoarding.Hoarding_Image FROM            Hoarding INNER JOIN                         Location ON Hoarding.Location_Id = Location.Location_Id where Hoarding_Id =" & Hoarding_Id)
        Dim h1(dt.Rows.Count - 1) As Hoarding
        Dim i As Integer
        For Each dr As DataRow In dt.Rows
            h1(i) = New Hoarding
            h1(i).Hoarding_Id = dr.Item(0).ToString
            h1(i).Hoarding_Name = dr.Item(1).ToString
            h1(i).Hoarding_Address = dr.Item(2).ToString
            h1(i).Location_Id = dr.Item(3).ToString
            h1(i).HoardingType_Id = dr.Item(4).ToString
            h1(i).Hoarding_Height = dr.Item(5).ToString
            h1(i).Hoarding_Width = dr.Item(6).ToString
            h1(i).Hoarding_Price = dr.Item(7).ToString
            h1(i).Hoarding_Image = dr.Item(8).ToString
            i = i + 1
        Next
        Dim js As New JavaScriptSerializer
        Dim json As String = "{""Hoarding"":" & js.Serialize(h1) & "}"
        Return json
    End Function
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    <WebMethod()> _
    Public Function getHoarding_Type() As String
        Dim dm As New DataManager
        Dim dt As DataTable = dm.getdata("Select * from Hoarding_Type")
        Dim ht1(dt.Rows.Count - 1) As Hoarding_Type
        Dim i As Integer
        For Each dr As DataRow In dt.Rows
            ht1(i) = New Hoarding_Type
            ht1(i).HoardingType_Id = dr.Item(0).ToString
            ht1(i).HoardingType_Name = dr.Item(1).ToString
            i = i + 1
        Next
        Dim js As New JavaScriptSerializer
        Dim json As String = "{""Hoarding_Type"":" & js.Serialize(ht1) & "}"
        Return json
    End Function

    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    <WebMethod()> _
    Public Function getLocation() As String
        Dim dm As New DataManager
        Dim dt As DataTable = dm.getdata("Select * from Location")
        Dim l1(dt.Rows.Count - 1) As Location
        Dim i As Integer
        For Each dr As DataRow In dt.Rows
            l1(i) = New Location
            l1(i).Location_Id = dr.Item(0).ToString
            l1(i).Location_Name = dr.Item(1).ToString
            l1(i).City_Id = dr.Item(2).ToString
            i = i + 1
        Next
        Dim js As New JavaScriptSerializer
        Dim json As String = "{""Location"":" & js.Serialize(l1) & "}"
        Return json
    End Function

    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    <WebMethod()> _
    Public Function getPayment(User_Id As String) As String
        Dim dm As New DataManager
        Dim dt As DataTable = dm.getdata("SELECT Payment.Payment_Id, Payment.Payment_Date, Payment.Payment_Amount, Payment.Booking_Id FROM Booking INNER JOIN Payment ON Booking.Booking_Id = Payment.Booking_Id WHERE (Booking.User_Id = " & User_Id & ")")
        Dim p1(dt.Rows.Count - 1) As Payment
        Dim i As Integer
        For Each dr As DataRow In dt.Rows
            p1(i) = New Payment
            p1(i).Payment_Id = dr.Item(0).ToString
            p1(i).Payment_Date = CDate(dr.Item(1).ToString).ToString("dd-MM-yy")
            p1(i).Payment_Amount = dr.Item(2).ToString
            p1(i).Booking_Id = dr.Item(3).ToString
            i = i + 1
        Next
        Dim js As New JavaScriptSerializer
        Dim json As String = "{""Payment"":" & js.Serialize(p1) & "}"
        Return json
    End Function

    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    <WebMethod()> _
    Public Function getUser() As String
        Dim dm As New DataManager
        Dim dt As DataTable = dm.getdata("Select * from [User]")
        Dim u1(dt.Rows.Count - 1) As [User]
        Dim i As Integer
        For Each dr As DataRow In dt.Rows
            u1(i) = New [User]
            u1(i).User_Id = dr.Item(0).ToString
            u1(i).User_Name = dr.Item(1).ToString
            u1(i).User_Address = dr.Item(2).ToString
            u1(i).User_Password = dr.Item(3).ToString
            u1(i).User_Email = dr.Item(4).ToString
            u1(i).User_Gender = dr.Item(5).ToString
            u1(i).User_Mobile = dr.Item(6).ToString
            u1(i).Location_Id = dr.Item(7).ToString
            i = i + 1
        Next
        Dim js As New JavaScriptSerializer
        Dim json As String = "{""User"":" & js.Serialize(u1) & "}"
        Return json
    End Function
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
   <WebMethod()> _
    Public Function login(query As String) As String
        Dim dm As New DataManager
        Dim u1 As New [User]
        Dim dt As Data.DataTable = dm.getdata(query)
        If dt.Rows.Count = 1 Then
            u1.User_Id = dt.Rows(0).Item(0).ToString
            u1.User_Name = dt.Rows(0).Item(1).ToString
            u1.User_Password = dt.Rows(0).Item(3).ToString
        End If
        Dim js As New JavaScriptSerializer
        Dim json As String = js.Serialize(u1)
        Return json
    End Function
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    <WebMethod()> _
    Public Function forgotpassword(query As String) As String
        Dim result As String = ""
        Dim dm As New DataManager
        Dim dt As Data.DataTable = dm.getdata(query)
        If dt.Rows.Count = 1 Then
            dm.SendMail(dt.Rows(0).Item(4).ToString, "E-Mail:" & dt.Rows(0).Item(4).ToString, "Password:" & dt.Rows(0).Item(3).ToString)
            result = "1"
        Else
            result = "0"
        End If
        Dim js As New JavaScriptSerializer
        Dim json As String = "{""Result"":" & js.Serialize(result) & "}"
        Return json
    End Function
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
   <WebMethod()> _
    Public Function setdata(query As String) As String
        Dim result As String = ""
        Dim dm As New DataManager
        Try
            dm.setdata(query)
            result = "1"
        Catch ex As Exception
            result = "0"
        End Try
        Dim js As New JavaScriptSerializer
        Dim json As String = "{""Result"":" & js.Serialize(result) & "}"
        Return json
    End Function

    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
   <WebMethod()> _
    Public Function setBooking(user_id As String) As String
        Dim result As String
        Dim dm As New DataManager
        Try
            Dim param() As String = user_id.Split(",")
            dm.setdata("Insert into Booking(Booking_Date,Booking_Desc,Booking_StartDate,Booking_EndDate,User_Id,Coupon_Id,Booking_Status)values('" & Date.Now.ToString("MM-dd-yy") & "','" & param(0) & "','" & param(1) & "','" & param(2) & "','" & param(3) & "','" & param(4) & "','Pending')")
            Dim dt As Data.DataTable = dm.getdata("Select * from Cart where User_Id=" & param(3))
            Dim dtorderid As Data.DataTable = dm.getdata("Select max(Booking_Id) from [Booking]")
            For Each dr As Data.DataRow In dt.Rows
                dm.setdata("Insert into Booking_Details(Booking_Id,Hoarding_Id,Banner_Url,Hoarding_Price)values('" & dtorderid.Rows(0).Item(0).ToString & "','" & dr.Item(2).ToString & "','" & dr.Item(4).ToString & "','" & dr.Item(3).ToString & "')")
            Next
            dm.setdata("Delete from Cart where User_Id=" & param(3))
            result = "1"
        Catch ex As Exception
            result = "0"
        End Try
        Dim js As New JavaScriptSerializer
        Dim json As String = "{""Result"":" & js.Serialize(result) & "}"
        Return json
    End Function

    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
   <WebMethod()> _
    Public Function getCart(ByVal User_Id As Integer) As String
        Dim dm As New DataManager
        Dim dt As DataTable = dm.getdata("select * from Cart where User_Id =" & User_Id)
        Dim c1(dt.Rows.Count - 1) As Cart
        Dim i As Integer
        For Each dr As Data.DataRow In dt.Rows
            c1(i) = New Cart
            c1(i).Cart_Id = dr.Item(0)
            c1(i).User_Id = dr.Item(1)
            c1(i).Hoarding_Id = dr.Item(2)
            c1(i).Hoarding_Price = dr.Item(3)
            c1(i).Banner_Url = dr.Item(4)
            i = i + 1
        Next
        Dim js As New JavaScriptSerializer
        Dim s As String = "{""Cart"":" & js.Serialize(c1) & "}"
        Return s
    End Function
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    <WebMethod()> _
    Public Function ByteArrayToFile(ByVal BArray() As Byte, ByVal fname As String, ByVal Hoarding_Id As String, User_Id As String) As String
        Dim sJSON As String
        Try
            Dim FilePath As String = Server.MapPath("~/Banner_Url_Images/" & fname)
            System.IO.File.WriteAllBytes(FilePath, BArray)
            Dim dm As New DataManager
            dm.setdata("Update Cart set Banner_Url='" & fname & "' where Hoarding_Id=" & Hoarding_Id & " and User_Id=" & User_Id)
            Dim js As JavaScriptSerializer = New JavaScriptSerializer()
            sJSON = "{""Result"": " & js.Serialize("1") & "}"
        Catch ex As Exception
            sJSON = ex.Message
        End Try
        Return sJSON
    End Function

    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
  <WebMethod()> _
    Public Function checkCoupon(Coupon_Code As String) As String
        Dim dm As New DataManager
        Dim c1 As New Coupon
        Dim result As String = ""
        Try
            Dim dt As Data.DataTable = dm.getdata("Select * from Coupon where Coupon_Startdate <='" & Now.Date.ToString("MM-dd-yy") & "' and Coupon_Enddate>='" & Now.Date.ToString("MM-dd-yyyy") & "' and Coupon_Code='" & Coupon_Code & "'")
            If dt.Rows.Count = 1 Then
                result = dt.Rows(0).Item(0).ToString
            Else
                result = "0"
            End If
        Catch ex As Exception
            result = "0"
        End Try
        Dim js As New JavaScriptSerializer
        Dim json As String = "{""Result"":" & js.Serialize(result) & "}"
        Return json
    End Function
End Class
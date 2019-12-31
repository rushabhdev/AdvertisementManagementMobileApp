Imports Microsoft.VisualBasic

Public Class Booking
    Private _Booking_Id, _Booking_Date, _Booking_Desc, _Booking_StartDate, _Booking_EndDate, _User_Id, _Coupon_Id, _Booking_Status As String
    Public Property Booking_Id() As String
        Get
            Return _Booking_Id
        End Get
        Set(value As String)
            _Booking_Id = value
        End Set
    End Property
    Public Property Booking_Date() As String
        Get
            Return _Booking_Date
        End Get
        Set(value As String)
            _Booking_Date = value
        End Set
    End Property
    Public Property Booking_Desc() As String
        Get
            Return _Booking_Desc
        End Get
        Set(value As String)
            _Booking_Desc = value
        End Set
    End Property
    Public Property Booking_StartDate() As String
        Get
            Return _Booking_StartDate
        End Get
        Set(value As String)
            _Booking_StartDate = value
        End Set
    End Property
    Public Property Booking_EndDate() As String
        Get
            Return _Booking_EndDate
        End Get
        Set(value As String)
            _Booking_EndDate = value
        End Set
    End Property
    Public Property User_Id() As String
        Get
            Return _User_Id
        End Get
        Set(value As String)
            _User_Id = value
        End Set
    End Property
    Public Property Coupon_Id() As String
        Get
            Return _Coupon_Id
        End Get
        Set(value As String)
            _Coupon_Id = value
        End Set
    End Property
    Public Property Booking_Status() As String
        Get
            Return _Booking_Status
        End Get
        Set(value As String)
            _Booking_Status = value
        End Set
    End Property
End Class

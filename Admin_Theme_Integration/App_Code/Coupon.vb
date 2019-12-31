Imports Microsoft.VisualBasic

Public Class Coupon
    Private _Coupon_Id, _Coupon_Code, _Coupon_Desc, _Coupon_Startdate, _Coupon_Enddate, _Coupon_Discount As String

    Public Property Coupon_Id() As String
        Get
            Return _Coupon_Id
        End Get
        Set(value As String)
            _Coupon_Id = value
        End Set
    End Property

    Public Property Coupon_Code() As String
        Get
            Return _Coupon_Code
        End Get
        Set(value As String)
            _Coupon_Code = value
        End Set
    End Property

    Public Property Coupon_Desc() As String
        Get
            Return _Coupon_Desc
        End Get
        Set(value As String)
            _Coupon_Desc = value
        End Set
    End Property

    Public Property Coupon_Startdate() As String
        Get
            Return _Coupon_Startdate
        End Get
        Set(value As String)
            _Coupon_Startdate = value
        End Set
    End Property

    Public Property Coupon_Enddate() As String
        Get
            Return _Coupon_Enddate
        End Get
        Set(value As String)
            _Coupon_Enddate = value
        End Set
    End Property

    Public Property Coupon_Discount() As String
        Get
            Return _Coupon_Discount
        End Get
        Set(value As String)
            _Coupon_Discount = value
        End Set
    End Property

End Class

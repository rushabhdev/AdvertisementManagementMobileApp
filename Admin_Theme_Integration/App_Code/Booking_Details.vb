Imports Microsoft.VisualBasic

Public Class Booking_Details
    Private _Details_Id, _Booking_Id, _Hoarding_Id, _Banner_Url, _Hoarding_Price As String

    Public Property Details_Id() As String
        Get
            Return _Details_Id
        End Get
        Set(value As String)
            _Details_Id = value
        End Set
    End Property

    Public Property Booking_Id() As String
        Get
            Return _Booking_Id
        End Get
        Set(value As String)
            _Booking_Id = value
        End Set
    End Property

    Public Property Hoarding_Id() As String
        Get
            Return _Hoarding_Id
        End Get
        Set(value As String)
            _Hoarding_Id = value
        End Set
    End Property

    Public Property Banner_Url() As String
        Get
            Return _Banner_Url
        End Get
        Set(value As String)
            _Banner_Url = value
        End Set
    End Property

    Public Property Hoarding_Price() As String
        Get
            Return _Hoarding_Price
        End Get
        Set(value As String)
            _Hoarding_Price = value
        End Set
    End Property
End Class

Imports Microsoft.VisualBasic

Public Class Payment
    Private _Payment_Id, _Payment_Date, _Payment_Amount, _Booking_Id As String

    Public Property Payment_Id() As String
        Get
            Return _Payment_Id
        End Get
        Set(value As String)
            _Payment_Id = value
        End Set
    End Property

    Public Property Payment_Date() As String
        Get
            Return _Payment_Date
        End Get
        Set(value As String)
            _Payment_Date = value
        End Set
    End Property

    Public Property Payment_Amount() As String
        Get
            Return _Payment_Amount
        End Get
        Set(value As String)
            _Payment_Amount = value
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
End Class

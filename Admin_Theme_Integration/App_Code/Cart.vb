Imports Microsoft.VisualBasic

Public Class Cart
    Private _Cart_Id, _User_Id, _Hoarding_Id, _Hoarding_Price, _Banner_Url As String
    Public Property Cart_Id As String
        Get
            Return _Cart_Id
        End Get
        Set(value As String)
            _Cart_Id = value
        End Set
    End Property
    Public Property User_Id As String
        Get
            Return _User_Id
        End Get
        Set(value As String)
            _User_Id = value
        End Set
    End Property
    Public Property Hoarding_Id As String
        Get
            Return _Hoarding_Id
        End Get
        Set(value As String)
            _Hoarding_Id = value
        End Set
    End Property
    Public Property Hoarding_Price As String
        Get
            Return _Hoarding_Price
        End Get
        Set(value As String)
            _Hoarding_Price = value
        End Set
    End Property
    Public Property Banner_Url As String
        Get
            Return _Banner_Url
        End Get
        Set(value As String)
            _Banner_Url = value
        End Set
    End Property
End Class

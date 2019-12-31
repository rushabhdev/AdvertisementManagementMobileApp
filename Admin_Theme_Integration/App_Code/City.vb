Imports Microsoft.VisualBasic

Public Class City
    Private _City_Id, _City_Name As String

    Public Property City_Id() As String
        Get
            Return _City_Id
        End Get
        Set(value As String)
            _City_Id = value
        End Set
    End Property

    Public Property City_Name() As String
        Get
            Return _City_Name
        End Get
        Set(value As String)
            _City_Name = value
        End Set
    End Property
End Class

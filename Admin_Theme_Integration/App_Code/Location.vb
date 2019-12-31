Imports Microsoft.VisualBasic

Public Class Location
    Private _Location_Id, _Location_Name, _City_Id As String

    Public Property Location_Id() As String
        Get
            Return _Location_Id
        End Get
        Set(value As String)
            _Location_Id = value
        End Set
    End Property

    Public Property Location_Name() As String
        Get
            Return _Location_Name
        End Get
        Set(value As String)
            _Location_Name = value
        End Set
    End Property

    Public Property City_Id() As String
        Get
            Return _City_Id
        End Get
        Set(value As String)
            _City_Id = value
        End Set
    End Property
End Class

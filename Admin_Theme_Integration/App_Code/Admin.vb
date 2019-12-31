Imports Microsoft.VisualBasic

Public Class Admin
    Private _Admin_Id, _Admin_Name, _Admin_Password, _Admin_Email As String
    Public Property Admin_Id() As String
        Get
            Return _Admin_Id
        End Get
        Set(value As String)
            _Admin_Id = value
        End Set
    End Property
    Public Property Admin_Name() As String
        Get
            Return _Admin_Name
        End Get
        Set(value As String)
            _Admin_Name = value
        End Set
    End Property
    Public Property Admin_Password() As String
        Get
            Return _Admin_Password
        End Get
        Set(value As String)
            _Admin_Password = value
        End Set
    End Property
    Public Property Admin_Email() As String
        Get
            Return _Admin_Email
        End Get
        Set(value As String)
            _Admin_Email = value
        End Set
    End Property
End Class

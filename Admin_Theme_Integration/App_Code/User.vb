Imports Microsoft.VisualBasic

Public Class User
    Private _User_Id, _User_Name, _User_Address, _User_Password, _User_Email, _User_Gender, _User_Mobile, _Location_Id As String

    Public Property User_Id() As String
        Get
            Return _User_Id
        End Get
        Set(value As String)
            _User_Id = value
        End Set
    End Property

    Public Property User_Name() As String
        Get
            Return _User_Name
        End Get
        Set(value As String)
            _User_Name = value
        End Set
    End Property

    Public Property User_Address() As String
        Get
            Return _User_Address
        End Get
        Set(value As String)
            _User_Address = value
        End Set
    End Property

    Public Property User_Password() As String
        Get
            Return _User_Password
        End Get
        Set(value As String)
            _User_Password = value
        End Set
    End Property

    Public Property User_Email() As String
        Get
            Return _User_Email
        End Get
        Set(value As String)
            _User_Email = value
        End Set
    End Property

    Public Property User_Gender() As String
        Get
            Return _User_Gender
        End Get
        Set(value As String)
            _User_Gender = value
        End Set
    End Property

    Public Property User_Mobile() As String
        Get
            Return _User_Mobile
        End Get
        Set(value As String)
            _User_Mobile = value
        End Set
    End Property

    Public Property Location_Id() As String
        Get
            Return _Location_Id
        End Get
        Set(value As String)
            _Location_Id = value
        End Set
    End Property
End Class

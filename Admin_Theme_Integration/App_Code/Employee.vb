Imports Microsoft.VisualBasic

Public Class Employee
    Private _Employee_Id, _Employee_Name, _Employee_Mobile, _Employee_Email, _Employee_Password As String

    Public Property Employee_Id() As String
        Get
            Return _Employee_Id
        End Get
        Set(value As String)
            _Employee_Id = value
        End Set
    End Property

    Public Property Employee_Name() As String
        Get
            Return _Employee_Name
        End Get
        Set(value As String)
            _Employee_Name = value
        End Set
    End Property

    Public Property Employee_Mobile() As String
        Get
            Return _Employee_Mobile
        End Get
        Set(value As String)
            _Employee_Mobile = value
        End Set
    End Property

    Public Property Employee_Email() As String
        Get
            Return _Employee_Email
        End Get
        Set(value As String)
            _Employee_Email = value
        End Set
    End Property

    Public Property Employee_Password() As String
        Get
            Return _Employee_Password
        End Get
        Set(value As String)
            _Employee_Password = value
        End Set
    End Property
End Class

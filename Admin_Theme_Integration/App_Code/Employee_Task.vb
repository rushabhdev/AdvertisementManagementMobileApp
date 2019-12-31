Imports Microsoft.VisualBasic

Public Class Employee_Task
    Private _Work_Id, _Work_Title, _Work_Desc, _Employee_Id, _Admin_Id, _Work_Status As String

    Public Property Work_Id() As String
        Get
            Return _Work_Id
        End Get
        Set(value As String)
            _Work_Id = value
        End Set
    End Property

    Public Property Work_Title() As String
        Get
            Return _Work_Title
        End Get
        Set(value As String)
            _Work_Title = value
        End Set
    End Property

    Public Property Work_Desc() As String
        Get
            Return _Work_Desc
        End Get
        Set(value As String)
            _Work_Desc = value
        End Set
    End Property

    Public Property Employee_Id() As String
        Get
            Return _Employee_Id
        End Get
        Set(value As String)
            _Employee_Id = value
        End Set
    End Property

    Public Property Admin_Id() As String
        Get
            Return _Admin_Id
        End Get
        Set(value As String)
            _Admin_Id = value
        End Set
    End Property

    Public Property Work_Status() As String
        Get
            Return _Work_Status
        End Get
        Set(value As String)
            _Work_Status = value
        End Set
    End Property
End Class

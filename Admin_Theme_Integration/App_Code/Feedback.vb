Imports Microsoft.VisualBasic

Public Class Feedback
    Private _Feedback_Id, _Feedback_Date, _Feedback_Desc, _User_Id As String

    Public Property Feedback_Id() As String
        Get
            Return _Feedback_Id
        End Get
        Set(value As String)
            _Feedback_Id = value
        End Set
    End Property

    Public Property Feedback_Date() As String
        Get
            Return _Feedback_Date
        End Get
        Set(value As String)
            _Feedback_Date = value
        End Set
    End Property

    Public Property Feedback_Desc() As String
        Get
            Return _Feedback_Desc
        End Get
        Set(value As String)
            _Feedback_Desc = value
        End Set
    End Property

    Public Property User_Id() As String
        Get
            Return _User_Id
        End Get
        Set(value As String)
            _User_Id = value
        End Set
    End Property
End Class

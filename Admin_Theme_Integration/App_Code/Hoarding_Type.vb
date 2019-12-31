Imports Microsoft.VisualBasic

Public Class Hoarding_Type
    Private _HoardingType_Id, _HoardingType_Name As String

    Public Property HoardingType_Id() As String
        Get
            Return _HoardingType_Id
        End Get
        Set(value As String)
            _HoardingType_Id = value
        End Set
    End Property

    Public Property HoardingType_Name() As String
        Get
            Return _HoardingType_Name
        End Get
        Set(value As String)
            _HoardingType_Name = value
        End Set
    End Property
End Class

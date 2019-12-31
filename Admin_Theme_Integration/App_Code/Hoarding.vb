Imports Microsoft.VisualBasic

Public Class Hoarding
    Private _Hoarding_Id, _Hoarding_Image, _Hoarding_Name, _Hoarding_Address, _Location_Id, _HoardingType_Id, _Hoarding_Height, _Hoarding_Width, _Hoarding_Price As String

    Public Property Hoarding_Id() As String
        Get
            Return _Hoarding_Id
        End Get
        Set(value As String)
            _Hoarding_Id = value
        End Set
    End Property

    Public Property Hoarding_Name() As String
        Get
            Return _Hoarding_Name
        End Get
        Set(value As String)
            _Hoarding_Name = value
        End Set
    End Property

    Public Property Hoarding_Address() As String
        Get
            Return _Hoarding_Address
        End Get
        Set(value As String)
            _Hoarding_Address = value
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

    Public Property HoardingType_Id() As String
        Get
            Return _HoardingType_Id
        End Get
        Set(value As String)
            _HoardingType_Id = value
        End Set
    End Property

    Public Property Hoarding_Height() As String
        Get
            Return _Hoarding_Height
        End Get
        Set(value As String)
            _Hoarding_Height = value
        End Set
    End Property

    Public Property Hoarding_Width() As String
        Get
            Return _Hoarding_Width
        End Get
        Set(value As String)
            _Hoarding_Width = value
        End Set
    End Property
    Public Property Hoarding_Price() As String
        Get
            Return _Hoarding_Price
        End Get
        Set(value As String)
            _Hoarding_Price = value
        End Set
    End Property
    Public Property Hoarding_Image() As String
        Get
            Return _Hoarding_Image
        End Get
        Set(value As String)
            _Hoarding_Image = value
        End Set
    End Property
End Class

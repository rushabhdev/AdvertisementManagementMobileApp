<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Employee_Login" %>

<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from www.g-axon.com/integral-3.0/classic/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 12 Dec 2016 07:07:48 GMT -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Integral - A fully responsive, HTML5 based admin template">
<meta name="keywords" content="Responsive, Web Application, HTML5, Admin Template, business, professional, Integral, web design, CSS3">
<title>Hoardings | Login</title>
<!-- Site favicon -->
<link rel='shortcut icon' type='image/x-icon' href='images/favicon.ico' />
<!-- /site favicon -->

<!-- Entypo font stylesheet -->
<link href="css/entypo.css" rel="stylesheet">
<!-- /entypo font stylesheet -->

<!-- Font awesome stylesheet -->
<link href="css/font-awesome.min.css" rel="stylesheet">
<!-- /font awesome stylesheet -->

<!-- Bootstrap stylesheet min version -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- /bootstrap stylesheet min version -->

<!-- Integral core stylesheet -->
<link href="css/integral-core.css" rel="stylesheet">
<!-- /integral core stylesheet -->

<link href="css/integral-forms.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="js/html5shiv.min.js"></script>
      <script src="js/respond.min.js"></script>
<![endif]-->


</head>

<body class="login-page">
    
<!-- Loader Backdrop -->
	<div class="loader-backdrop">           
	  <!-- Loader -->
		<div class="loader">
			<div class="bounce-1"></div>
			<div class="bounce-2"></div>
		</div>
	  <!-- /loader -->
	</div>
         
<!-- loader backgrop -->

<div class="login-container">
	<div class="login-branding">
		<a href="index.html"><h1>Chirta Publicity</h1></a>
	</div>
	<div class="login-content">
		<h2><strong>Welcome</strong>, please sign in</h2>
		<form id="Form1" runat="server">                        
			<div class="form-group">
                <asp:TextBox ID="txtEmail" class="form-control" placeholder="Email" runat="server"></asp:TextBox>
				
			</div>                        
			<div class="form-group">
                <asp:TextBox TextMode="Password" ID="txtPassword" placeholder="Password" class="form-control" runat="server"></asp:TextBox>
			</div>
			
			<div class="form-group">
                <asp:Button class="btn btn-primary btn-block" ID="btnLogin" runat="server" Text="Login" />
			</div>
			<p class="text-center"><a href="Forgot_Password.aspx">Forgot your password?</a></p>                        
		</form>
	</div>
</div>

<!--Load JQuery-->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/loader.js"></script>

</body>

<!-- Mirrored from www.g-axon.com/integral-3.0/classic/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 12 Dec 2016 07:07:48 GMT -->
</html>

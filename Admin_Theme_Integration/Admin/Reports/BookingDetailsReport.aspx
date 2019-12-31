<%@ Page Language="VB" AutoEventWireup="false" CodeFile="BookingDetailsReport.aspx.vb" Inherits="Admin_Reports_BookingDetailsReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="ReportStyleSheet.css" rel="stylesheet" />
    <style type="text/css">
        .style1
        {
           margin-top : -20px;
            margin-left : 5px;
        }

        .style2
        {
           color : #367896;
            margin-top : -55px;
        }
       
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div class="style1">
        <asp:Image ID="Image1" ImageUrl="~/images/chitralogo.JPG" runat="server" ImageAlign="Top" Width="200" Height="150" /> </div>
      <center><h1 class="style2">Booking Details Summary</h1></center> 
        <p>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        </p>
        <p>
            &nbsp;&nbsp; <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Underline="True" ForeColor="#6666FF" Text="Label" Visible="False"></asp:Label>
        </p>
        <div class="datagrid">
            
        <table>
            <thead>
                <tr>
                    <th>Details Id</th>
                    <th>User Name</th>
                    <th>Hoarding Name</th>
                    <th>Banner Url</th>
                    <th>Hoarding Price</th>
                </tr>
            </thead>
            <tbody>
                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
            </tbody>
        </table>
            </div>
    </div>
    </form>
</body>
</html>

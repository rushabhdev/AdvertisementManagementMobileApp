<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PaymentOnDate.aspx.vb" Inherits="Admin_Reports_PaymentOnDate" %>

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
       <center><h1 class="style2">Payments for Specified Date</h1></center> 
        <p>
            &nbsp;
            <asp:Label ID="label2" runat="server" Text="Payment On Date:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtpaymentondate" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btncheckbooking" runat="server" Text="Check Bookings" BackColor="#9933FF" ForeColor="White" />&nbsp;<p>
            &nbsp;&nbsp; <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Underline="True" ForeColor="#6666FF" Text="Label" Visible="False"></asp:Label>
        </p>
        <div class="datagrid">
            
        <table>
            <thead>
                <tr>
                     <th>Payment Id</th>
                     <th>Payment Date</th>
                     <th>Payment Amount</th>
                     <th>Booking Id</th>
                     <th>Booking Date</th>
                     <th>User Name</th>
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

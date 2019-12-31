<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DateWisePaymentReport.aspx.vb" Inherits="Admin_Reports_DateWisePaymentReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
    <link href="ReportStyleSheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="style1">
        <asp:Image ID="Image1" ImageUrl="~/images/chitralogo.JPG" runat="server" ImageAlign="Top" Width="200" Height="150" /> </div>
        <center> <h1 class="style2">Date Wise Payments</h1></center>
            <p>
                <asp:Label ID="Label1" runat="server" Text="Payments From Date"></asp:Label>
                <asp:TextBox ID="txtstartdate" runat="server" style="margin-left: 65px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label2" runat="server" Text="Payments Till Date"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtenddate" runat="server" style="margin-left: 65px"></asp:TextBox>
        </p>
        <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btndatepayment" runat="server" Text="Get Payment On Dates" BackColor="#9933FF" ForeColor="White" />
        </p>
        <p>
           &nbsp;&nbsp; <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Underline="True" ForeColor="#6666FF" Text="Label" Visible="False"></asp:Label>
        </p> 
    <div class="datagrid">
         <table>
            <thead>
                <tr>
                     <th>Payment Id</th>
                     <th>Payment Date</th>
                     <th>Amount</th>
                     <th>Booking Date</th>
                     <th>Banner Placing Date</th>
                     <th>Banner Remove Date</th>
                    <th>Booking Status</th>
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

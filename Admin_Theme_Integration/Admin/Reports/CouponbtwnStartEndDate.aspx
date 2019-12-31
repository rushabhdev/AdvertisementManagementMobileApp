<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CouponbtwnStartEndDate.aspx.vb" Inherits="Admin_Reports_CouponbtwnStartEndDate" %>

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
    <div><div class="style1">
        <asp:Image ID="Image1" ImageUrl="~/images/chitralogo.JPG" runat="server" ImageAlign="Top" Width="200" Height="150" /> </div>
       <center><h1 class="style2">Coupons between Custom Date</h1></center>
        <p>
            &nbsp;
            <asp:Label ID="label2" runat="server" Text="Coupon From Date:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtcouponfromdate" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Coupon To Date:"></asp:Label>
&nbsp;&nbsp;
            <asp:TextBox ID="txtcoupontodate" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="btncheckcoupon" runat="server" Text="Get Coupons" BackColor="#9933FF" ForeColor="White" />&nbsp;</p>
        <p>
            &nbsp;&nbsp; <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Underline="True" ForeColor="#6666FF" Text="Label" Visible="False"></asp:Label>
        </p>
           <div class="datagrid">
     <table>
            <thead>
                <tr>
                     <th>Coupon Id</th>
                     <th>Coupon Code</th>
                     <th>Description</th>
                     <th>Coupon Start Date</th>
                     <th>Coupon End Date</th>
                     <th>Coupon Discount</th>
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

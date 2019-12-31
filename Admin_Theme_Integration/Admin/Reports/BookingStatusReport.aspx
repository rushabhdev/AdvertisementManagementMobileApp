<%@ Page Language="VB" AutoEventWireup="false" CodeFile="BookingStatusReport.aspx.vb" Inherits="Admin_Reports_BookingStatusReport" %>

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
             <center> <h1 class="style2">Status Wise Booking Report</h1></center>
         
              <asp:DropDownList ID="DropDownList1" runat="server">
                  <asp:ListItem>Pending</asp:ListItem>
                  <asp:ListItem>Confirmed</asp:ListItem>
              </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <asp:Button ID="btnbookingstatus" runat="server" Text="Get Booking's Status" BackColor="#9933FF" ForeColor="White" />
              <br />
              <br />
             &nbsp;&nbsp;  <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Underline="True" ForeColor="#6666FF" Text="Label" Visible="False"></asp:Label>
              <br />
              <br />
        <div class="datagrid">
        <table>
            <thead>
                <tr>
                     <th>Booking Id</th>
                     <th>Booking Date</th>
                     <th>Booking Description</th>
                     <th>Banner Placing Date</th>
                     <th>Banner Removing Date</th>
                     <th>User Name</th>      
                     <th>Coupon Code</th>          
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
    <p>
        &nbsp;</p>
</body>
</html>

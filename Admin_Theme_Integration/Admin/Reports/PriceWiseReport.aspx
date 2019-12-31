<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PriceWiseReport.aspx.vb" Inherits="Admin_Reports_PriceWiseReport" %>

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
        <center><h1 class="style2">List of Hoardings within Described Price</h1></center>
        <p>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Hoarding]"></asp:SqlDataSource>
        </p>
        <h1>&nbsp;
            <asp:Label ID="Label1" runat="server" Font-Size="Medium" Text="Minimum Price :"></asp:Label>
&nbsp;
            <asp:TextBox ID="txtminprice" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label2" runat="server" Font-Size="Medium" Text="Maximun Price :"></asp:Label>
&nbsp;&nbsp;
            <asp:TextBox ID="txtmaxprice" runat="server"></asp:TextBox>
        </h1>
        <p>
            <asp:Button ID="btnpricefilter" runat="server" Text="Get List" Width="119px" BackColor="#9933FF" ForeColor="White" />
        </p>
        <p>
            &nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Underline="True" ForeColor="#6666FF" Text="Label" Visible="False"></asp:Label>
            &nbsp;</p>
        <div class="datagrid">
            
        <table>
            <thead>
                <tr>
                    <th>Hoarding Id</th>
                    <th>Hoarding Name</th>
                    <th>Hoarding Address</th>
                    <th>Location Name</th>
                    <th>Hoarding Type Name</th>
                    <th>Hoarding Height</th>
                    <th>Hoarding Width</th>
                    <th>Hoarding Price</th>
                    <th>Hoarding Image</th>
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

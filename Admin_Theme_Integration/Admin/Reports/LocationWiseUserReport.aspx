<%@ Page Language="VB" AutoEventWireup="false" CodeFile="LocationWiseUserReport.aspx.vb" Inherits="Admin_Reports_LocationWiseUserReport" %>

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
       <center><h1 class="style2">User According to Location</h1></center>
        <p>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Location_Name" DataValueField="Location_Id">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Location_Id], [Location_Name] FROM [Location]"></asp:SqlDataSource>
            <asp:Button ID="btngetuser" runat="server" Text="Get list of user in location" BackColor="#9933FF" ForeColor="White" />
&nbsp;&nbsp;&nbsp;&nbsp; </p>
        <p>
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Underline="True" ForeColor="#6666FF" Text="Label" Visible="False"></asp:Label>
        </p>
        <div class="datagrid">
    <table>
            <thead>
                <tr>
                    <th>Location Name</th>
                    <th>User Name</th>
                    <th>User Address</th>
                    <th>User Password</th>
                    <th>User Email</th>
                    <th>Gender</th>
                    <th>Mobile</th>
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

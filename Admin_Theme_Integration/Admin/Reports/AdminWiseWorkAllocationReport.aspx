<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AdminWiseWorkAllocationReport.aspx.vb" Inherits="Admin_Reports_AdminWiseWorkAllocationReport" %>

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
         <center> <h1 class="style2">Admin's Work Allocation List </h1> </center>
          <div class="datagrid">
              <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Admin_Name" DataValueField="Admin_Id">
              </asp:DropDownList>
              <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Admin]"></asp:SqlDataSource>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <asp:Button ID="btnadminswork" runat="server" Text="Check Work Allocation" BackColor="#9933FF" ForeColor="White" Font-Bold="False" />
              <br />
              <br />
&nbsp;&nbsp;&nbsp;
              <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Underline="True" ForeColor="#6666FF" Text="Label" Visible="False"></asp:Label>
              <br />
              <br />
          <table>
            <thead>
                <tr>
                     <th>Work Id</th>
                     <th>Work Title</th>
                     <th>Description</th>
                     <th>Employee Name</th>
                     <th>Admin Name</th>
                     <th>Work Status</th>
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

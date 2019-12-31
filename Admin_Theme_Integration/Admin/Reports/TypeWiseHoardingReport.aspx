<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TypeWiseHoardingReport.aspx.vb" Inherits="Admin_Reports_TypeWiseHoardingReport" %>

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
          <center><h1 class="style2">List of Hoarding Type</h1></center>
             <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="HoardingType_Name" DataValueField="HoardingType_Id">
             </asp:DropDownList>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Hoarding_Type]"></asp:SqlDataSource>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:Button ID="btnchecktype" runat="server" Text="List Corresponding Type" Width="119px" BackColor="#9933FF" ForeColor="White" />
             <br />
             <br />
&nbsp;&nbsp;
             <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Underline="True" ForeColor="#6666FF" Text="Label" Visible="False"></asp:Label>
             <br />
             <br />
        <div class="datagrid">
             <table>
                    <thead>
                        <tr>
                            <th>Hoarding Type Name</th>
                            <th>Hoarding Name</th>
                            <th>Address</th>
                            <th>Location</th>
                            <th>Height</th>
                            <th>Width</th>
                            <th>Price</th>
                            <th>Image</th>
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

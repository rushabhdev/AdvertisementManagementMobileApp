<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="false" CodeFile="Home.aspx.vb" Inherits="Admin_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormTitle" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FormContent" Runat="Server">
    <Center><h1>Welcome to Admin's Panel </h1></Center>
    <Center><h4>Here Are The New Bookings</h4></Center>

    <asp:GridView ID="GridView1" class="table table-bordered" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Booking_Id" DataSourceID="SqlDataSource1" EnableModelValidation="True" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#DCDCDC" />
     <Columns>
                                           <asp:BoundField DataField="Booking_Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Booking_Id" />
                                           <asp:BoundField DataField="Booking_Date" HeaderText="Date" SortExpression="Booking_Date" DataFormatString ="{0:dd-MM-yy}" />
                                           <asp:BoundField DataField="Booking_Desc" HeaderText="Description" SortExpression="Booking_Desc" />
                                           <asp:BoundField DataField="Booking_StartDate" HeaderText="StartDate" SortExpression="Booking_StartDate" DataFormatString ="{0:dd-MM-yy}" />
                                           <asp:BoundField DataField="Booking_EndDate" HeaderText="EndDate" SortExpression="Booking_EndDate" DataFormatString ="{0:dd-MM-yy}" />
                                           <asp:BoundField DataField="User_Name" HeaderText="Name" SortExpression="User_Name" />
                                           <asp:BoundField DataField="Coupon_Code" HeaderText="Coupon Code" SortExpression="Coupon_Code" />
                                           <asp:BoundField DataField="Booking_Status" HeaderText="Status" SortExpression="Booking_Status" />
      </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
  </asp:GridView>

     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Booking] WHERE [Booking_Id] = @Booking_Id" InsertCommand="INSERT INTO [Booking] ([Booking_Date], [Booking_Desc], [Booking_StartDate], [Booking_EndDate], [User_Id], [Coupon_Id], [Booking_Status]) VALUES (@Booking_Date, @Booking_Desc, @Booking_StartDate, @Booking_EndDate, @User_Id, @Coupon_Id, @Booking_Status)" SelectCommand="SELECT Booking.Booking_Id, Booking.Booking_Date, Booking.Booking_Desc, Booking.Booking_StartDate, Booking.Booking_EndDate, Booking.User_Id, Booking.Coupon_Id, Booking.Booking_Status, [User].User_Name, Coupon.Coupon_Code FROM Booking INNER JOIN [User] ON Booking.User_Id = [User].User_Id INNER JOIN Coupon ON Booking.Coupon_Id = Coupon.Coupon_Id" UpdateCommand="UPDATE [Booking] SET [Booking_Date] = @Booking_Date, [Booking_Desc] = @Booking_Desc, [Booking_StartDate] = @Booking_StartDate, [Booking_EndDate] = @Booking_EndDate, [User_Id] = @User_Id, [Coupon_Id] = @Coupon_Id, [Booking_Status] = @Booking_Status WHERE [Booking_Id] = @Booking_Id">
                                      <DeleteParameters>
                                           <asp:Parameter Name="Booking_Id" Type="Int32" />
                                       </DeleteParameters>
                                       <InsertParameters>
                                           <asp:Parameter DbType="Date" Name="Booking_Date" />
                                           <asp:Parameter Name="Booking_Desc" Type="String" />
                                           <asp:Parameter DbType="Date" Name="Booking_StartDate" />
                                           <asp:Parameter DbType="Date" Name="Booking_EndDate" />
                                           <asp:Parameter Name="User_Id" Type="Int32" />
                                           <asp:Parameter Name="Coupon_Id" Type="Int32" />
                                           <asp:Parameter Name="Booking_Status" Type="String" />
                                       </InsertParameters>
                                       <UpdateParameters>
                                           <asp:Parameter DbType="Date" Name="Booking_Date" />
                                           <asp:Parameter Name="Booking_Desc" Type="String" />
                                           <asp:Parameter DbType="Date" Name="Booking_StartDate" />
                                           <asp:Parameter DbType="Date" Name="Booking_EndDate" />
                                           <asp:Parameter Name="User_Id" Type="Int32" />
                                           <asp:Parameter Name="Coupon_Id" Type="Int32" />
                                           <asp:Parameter Name="Booking_Status" Type="String" />
                                           <asp:Parameter Name="Booking_Id" Type="Int32" />
                                       </UpdateParameters> 
                                   </asp:SqlDataSource>
</asp:Content>


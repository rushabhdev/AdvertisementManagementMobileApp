<%@ Page Title="" Language="VB" MasterPageFile="~/Employee/MasterPage.master" AutoEventWireup="false" CodeFile="Home.aspx.vb" Inherits="Admin_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormTitle" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FormContent" Runat="Server">

      <Center><h1>Welcome to Employee's Panel </h1></Center>
    <Center><h4>Here Are Your New Task</h4></Center>

      <asp:GridView ID="GridView1" class="table table-bordered" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Work_Id" DataSourceID="SqlDataSource1" EnableModelValidation="True" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                                <AlternatingRowStyle BackColor="#DCDCDC" />
                                <Columns>
                                    <asp:BoundField DataField="Work_Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Work_Id" />
                                    <asp:BoundField DataField="Work_Title" HeaderText="Title" SortExpression="Work_Title" />
                                    <asp:BoundField DataField="Work_Desc" HeaderText="Desc" SortExpression="Work_Desc" />
                                    <asp:BoundField DataField="Employee_Name" HeaderText="Employee Name" SortExpression="Employee_Name" />
                                    <asp:BoundField DataField="Admin_Name" HeaderText="Admin Name" SortExpression="Admin_Name" />
                                    <asp:BoundField DataField="Work_Status" HeaderText="Status" SortExpression="Work_Status" />
                                </Columns>
                                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Employee_Task] WHERE [Work_Id] = @Work_Id" InsertCommand="INSERT INTO [Employee_Task] ([Work_Title], [Work_Desc], [Employee_Id], [Admin_Id], [Work_Status]) VALUES (@Work_Title, @Work_Desc, @Employee_Id, @Admin_Id, @Work_Status)" SelectCommand="SELECT Employee_Task.Work_Id, Employee_Task.Work_Title, Employee_Task.Work_Desc, Employee_Task.Employee_Id, Employee_Task.Admin_Id, Employee_Task.Work_Status, Employee.Employee_Name, Admin.Admin_Name FROM Employee_Task INNER JOIN Employee ON Employee_Task.Employee_Id = Employee.Employee_Id INNER JOIN Admin ON Employee_Task.Admin_Id = Admin.Admin_Id WHERE (Employee_Task.Employee_Id = @Param1)" UpdateCommand="UPDATE [Employee_Task] SET [Work_Title] = @Work_Title, [Work_Desc] = @Work_Desc, [Employee_Id] = @Employee_Id, [Admin_Id] = @Admin_Id, [Work_Status] = @Work_Status WHERE [Work_Id] = @Work_Id">
                                <DeleteParameters>
                                    <asp:Parameter Name="Work_Id" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="Work_Title" Type="String" />
                                    <asp:Parameter Name="Work_Desc" Type="String" />
                                    <asp:Parameter Name="Employee_Id" Type="Int32" />
                                    <asp:Parameter Name="Admin_Id" Type="Int32" />
                                    <asp:Parameter Name="Work_Status" Type="String" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:SessionParameter Name="Param1" SessionField="uid" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Work_Title" Type="String" />
                                    <asp:Parameter Name="Work_Desc" Type="String" />
                                    <asp:Parameter Name="Employee_Id" Type="Int32" />
                                    <asp:Parameter Name="Admin_Id" Type="Int32" />
                                    <asp:Parameter Name="Work_Status" Type="String" />
                                    <asp:Parameter Name="Work_Id" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
</asp:Content>


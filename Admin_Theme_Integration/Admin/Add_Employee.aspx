<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="false" CodeFile="Add_Employee.aspx.vb" Inherits="Add_Employee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormTitle" Runat="Server">
    Add Employee Information
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FormContent" Runat="Server">
    <div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading clearfix">
						<h4 class="panel-title">List of current Employees</h4>
						<ul class="panel-tool-options"> 
							<li><a data-rel="collapse" href="#"><i class="icon-down-open"></i></a></li>
							<li><a data-rel="reload" href="#"><i class="icon-arrows-ccw"></i></a></li>
							<li><a data-rel="close" href="#"><i class="icon-cancel"></i></a></li>
						</ul>
					</div>
					<div class="panel-body">
					    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                              
                               <asp:View ID="viewdata" runat="server">

                                   <asp:GridView ID="GridView2" class="table table-bordered" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Employee_Id" DataSourceID="SqlDataSource1" EnableModelValidation="True">
                                       <Columns>
                                           <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                                           <asp:BoundField DataField="Employee_Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Employee_Id" />
                                           <asp:BoundField DataField="Employee_Name" HeaderText="Name" SortExpression="Employee_Name" />
                                           <asp:BoundField DataField="Employee_Mobile" HeaderText="Mobile" SortExpression="Employee_Mobile" />
                                           <asp:BoundField DataField="Employee_Email" HeaderText="Email" SortExpression="Employee_Email" />
                                           <asp:BoundField DataField="Employee_Password" HeaderText="Password" SortExpression="Employee_Password" />
                                       </Columns>
                                   </asp:GridView>
                                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Employee] WHERE [Employee_Id] = @Employee_Id" InsertCommand="INSERT INTO [Employee] ([Employee_Name], [Employee_Mobile], [Employee_Email], [Employee_Password]) VALUES (@Employee_Name, @Employee_Mobile, @Employee_Email, @Employee_Password)" SelectCommand="SELECT * FROM [Employee]" UpdateCommand="UPDATE [Employee] SET [Employee_Name] = @Employee_Name, [Employee_Mobile] = @Employee_Mobile, [Employee_Email] = @Employee_Email, [Employee_Password] = @Employee_Password WHERE [Employee_Id] = @Employee_Id">
                                       <DeleteParameters>
                                           <asp:Parameter Name="Employee_Id" Type="Int32" />
                                       </DeleteParameters>
                                       <InsertParameters>
                                           <asp:Parameter Name="Employee_Name" Type="String" />
                                           <asp:Parameter Name="Employee_Mobile" Type="Decimal" />
                                           <asp:Parameter Name="Employee_Email" Type="String" />
                                           <asp:Parameter Name="Employee_Password" Type="String" />
                                       </InsertParameters>
                                       <UpdateParameters>
                                           <asp:Parameter Name="Employee_Name" Type="String" />
                                           <asp:Parameter Name="Employee_Mobile" Type="Decimal" />
                                           <asp:Parameter Name="Employee_Email" Type="String" />
                                           <asp:Parameter Name="Employee_Password" Type="String" />
                                           <asp:Parameter Name="Employee_Id" Type="Int32" />
                                       </UpdateParameters>
                                   </asp:SqlDataSource>
                                   <br />
                                   <asp:Button ID="btnadd" runat="server" class="btn btn-primary" Text="Add New Employee" />

                               </asp:View>
                               
                               <asp:View ID="viewinsert" runat="server">
                             
                           <div class="form-group">
                              <label>Enter Employee Name</label>
                              <asp:TextBox ID="txtemployeename" class="form-control" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtemployeename" runat="server" ErrorMessage="Enter Employee Name"></asp:RequiredFieldValidator>
						  </div>
                        
                           <div class="form-group">
                              <label>Enter Employee's Mobile Number </label>
                              <asp:TextBox ID="txtemployeemobilenumber" class="form-control" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtemployeemobilenumber" runat="server" ErrorMessage="Enter Employee's Mobile Number"></asp:RequiredFieldValidator>
						  </div>
                        
                           <div class="form-group">
                              <label>Enter Employee's Email </label>
                              <asp:TextBox ID="txtemployeeemail" class="form-control" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtemployeeemail" runat="server" ErrorMessage="Enter Employee's Email"></asp:RequiredFieldValidator>                               
						  </div>
                        
                           <div class="form-group">
                              <label>Enter Employee's Password </label>
                              <asp:TextBox ID="txtemployeepassword" class="form-control" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtemployeepassword" runat="server" ErrorMessage="Enter Employee's Password"></asp:RequiredFieldValidator>
						  </div>    
                        	<asp:Button ID="btninsert" class="btn btn-primary" runat="server" Text="Insert" />		 
                            <asp:Button ID="btncancel" class="btn btn-primary" runat="server" Text="Cancel" />		     
					     </asp:View>
                     </asp:MultiView>
                     </div>
				</div>
			</div>
		</div>
</asp:Content>


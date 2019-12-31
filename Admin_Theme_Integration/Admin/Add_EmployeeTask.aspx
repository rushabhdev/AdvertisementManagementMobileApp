<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="false" CodeFile="Add_EmployeeTask.aspx.vb" Inherits="Add_EmployeeTask" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormTitle" Runat="Server">
    Add Employee Task Information
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FormContent" Runat="Server">
    <div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading clearfix">
						<h4 class="panel-title">List of individual task for Employees </h4>
						<ul class="panel-tool-options"> 
							<li><a data-rel="collapse" href="#"><i class="icon-down-open"></i></a></li>
							<li><a data-rel="reload" href="#"><i class="icon-arrows-ccw"></i></a></li>
							<li><a data-rel="close" href="#"><i class="icon-cancel"></i></a></li>
						</ul>
					</div>
					<div class="panel-body">
					     <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                              
                               <asp:View ID="viewdata" runat="server">

                                   <asp:GridView ID="GridView1" class="table table-bordered" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Work_Id" DataSourceID="SqlDataSource1" EnableModelValidation="True">
                                       <Columns>
                                           <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                                           <asp:BoundField DataField="Work_Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Work_Id" />
                                           <asp:BoundField DataField="Work_Title" HeaderText="Title" SortExpression="Work_Title" />
                                           <asp:BoundField DataField="Work_Desc" HeaderText="Desc" SortExpression="Work_Desc" />
                                           <asp:BoundField DataField="Employee_Name" HeaderText="Employee Name" SortExpression="Employee_Name" />
                                           <asp:BoundField DataField="Admin_Name" HeaderText="Admin Name" SortExpression="Admin_Name" />
                                           <asp:BoundField DataField="Work_Status" HeaderText="Status" SortExpression="Work_Status" />
                                       </Columns>
                                   </asp:GridView>
                                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Employee_Task] WHERE [Work_Id] = @Work_Id" InsertCommand="INSERT INTO [Employee_Task] ([Work_Title], [Work_Desc], [Employee_Id], [Admin_Id], [Work_Status]) VALUES (@Work_Title, @Work_Desc, @Employee_Id, @Admin_Id, @Work_Status)" SelectCommand="SELECT Employee_Task.Work_Id, Employee_Task.Work_Title, Employee_Task.Work_Desc, Employee_Task.Employee_Id, Employee_Task.Admin_Id, Employee_Task.Work_Status, Employee.Employee_Name, Admin.Admin_Name FROM Employee_Task INNER JOIN Employee ON Employee_Task.Employee_Id = Employee.Employee_Id INNER JOIN Admin ON Employee_Task.Admin_Id = Admin.Admin_Id" UpdateCommand="UPDATE [Employee_Task] SET [Work_Title] = @Work_Title, [Work_Desc] = @Work_Desc, [Employee_Id] = @Employee_Id, [Admin_Id] = @Admin_Id, [Work_Status] = @Work_Status WHERE [Work_Id] = @Work_Id">
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
                                       <UpdateParameters>
                                           <asp:Parameter Name="Work_Title" Type="String" />
                                           <asp:Parameter Name="Work_Desc" Type="String" />
                                           <asp:Parameter Name="Employee_Id" Type="Int32" />
                                           <asp:Parameter Name="Admin_Id" Type="Int32" />
                                           <asp:Parameter Name="Work_Status" Type="String" />
                                           <asp:Parameter Name="Work_Id" Type="Int32" />
                                       </UpdateParameters>
                                   </asp:SqlDataSource>
                                   <br />
                                   <asp:Button ID="btnadd" class="btn btn-primary" runat="server" Text="Add New  Employee Task" />

                               </asp:View>
                               <asp:View ID="viewinsert" runat="server">
                             

                           <div class="form-group">
                              <label>Enter Work Title</label>
                              <asp:TextBox ID="txtworktitle" class="form-control" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtworktitle" runat="server" ErrorMessage="Enter Work Title"></asp:RequiredFieldValidator>
						  </div>
                        
                           <div class="form-group">
                              <label>Enter Work Description </label>
                              <asp:TextBox ID="txtworkdescription" class="form-control" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtworkdescription" runat="server" ErrorMessage="Enter Work's Description"></asp:RequiredFieldValidator>
						  </div>
                        
                           <div class="form-group">
                              <label>Enter Employee Id </label>
                               <asp:DropDownList ID="txtemployeeid" class="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="Employee_Name" DataValueField="Employee_Id"></asp:DropDownList>                          
						       <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Employee_Id], [Employee_Name] FROM [Employee]"></asp:SqlDataSource>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtemployeeid" runat="server" ErrorMessage="Select Employee"></asp:RequiredFieldValidator>
						  </div>
                        
                           <div class="form-group">
                              <label>Enter Admin Id </label>
                               <asp:DropDownList ID="txtadminid" class="form-control" runat="server" DataSourceID="SqlDataSource3" DataTextField="Admin_Name" DataValueField="Admin_Id"></asp:DropDownList>                              
						       <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Admin_Id], [Admin_Name] FROM [Admin]"></asp:SqlDataSource>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtadminid" runat="server" ErrorMessage="Select Admin"></asp:RequiredFieldValidator>
						  </div>
                        
                           <div class="form-group">
                              <label>Enter Work Status </label>
                              <asp:TextBox ID="txtworkstatus" class="form-control" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtworkstatus" runat="server" ErrorMessage="Enter Work Status"></asp:RequiredFieldValidator>
						  </div>
                        
                           <div class="form-group">
                              <label>Enter Booking Id </label>
                               <asp:DropDownList ID="txtbookingid" class="form-control" runat="server" DataSourceID="SqlDataSource4" DataTextField="Booking_Date" DataValueField="Booking_Id"></asp:DropDownList>                              
						       <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Booking_Id], [Booking_Date] FROM [Booking]"></asp:SqlDataSource>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtbookingid" runat="server" ErrorMessage="Select Booking Date"></asp:RequiredFieldValidator>
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


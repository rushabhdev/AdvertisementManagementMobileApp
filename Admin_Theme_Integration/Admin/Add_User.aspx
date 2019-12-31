<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="false" CodeFile="Add_User.aspx.vb" Inherits="Add_User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormTitle" Runat="Server">
    Add New User
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FormContent" Runat="Server">
      <div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading clearfix">
						<h4 class="panel-title">List of Registered Users</h4>
						<ul class="panel-tool-options"> 
							<li><a data-rel="collapse" href="#"><i class="icon-down-open"></i></a></li>
							<li><a data-rel="reload" href="#"><i class="icon-arrows-ccw"></i></a></li>
							<li><a data-rel="close" href="#"><i class="icon-cancel"></i></a></li>
						</ul>
					</div>
					<div class="panel-body">
						  <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                              
                               <asp:View ID="viewdata" runat="server">

                                   <asp:GridView ID="GridView1" class="table-bordered" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="User_Id" DataSourceID="SqlDataSource1" EnableModelValidation="True">
                                       <Columns>
                                           <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                                           <asp:BoundField DataField="User_Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="User_Id" />
                                           <asp:BoundField DataField="User_Name" HeaderText="Name" SortExpression="User_Name" />
                                           <asp:BoundField DataField="User_Address" HeaderText="Address" SortExpression="User_Address" />
                                           <asp:BoundField DataField="User_Password" HeaderText="Password" SortExpression="User_Password" />
                                           <asp:BoundField DataField="User_Email" HeaderText="Email" SortExpression="User_Email" />
                                           <asp:BoundField DataField="User_Gender" HeaderText="Gender" SortExpression="User_Gender" />
                                           <asp:BoundField DataField="User_Mobile" HeaderText="Mobile" SortExpression="User_Mobile" />
                                           <asp:BoundField DataField="Location_Name" HeaderText="Name" SortExpression="Location_Name" />
                                       </Columns>
                                   </asp:GridView>
                                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [User] WHERE [User_Id] = @User_Id" InsertCommand="INSERT INTO [User] ([User_Name], [User_Address], [User_Password], [User_Email], [User_Gender], [User_Mobile], [Location_Id]) VALUES (@User_Name, @User_Address, @User_Password, @User_Email, @User_Gender, @User_Mobile, @Location_Id)" SelectCommand="SELECT [User].User_Id, [User].User_Name, [User].User_Address, [User].User_Password, [User].User_Email, [User].User_Gender, [User].User_Mobile, [User].Location_Id, Location.Location_Name FROM [User] INNER JOIN Location ON [User].Location_Id = Location.Location_Id" UpdateCommand="UPDATE [User] SET [User_Name] = @User_Name, [User_Address] = @User_Address, [User_Password] = @User_Password, [User_Email] = @User_Email, [User_Gender] = @User_Gender, [User_Mobile] = @User_Mobile, [Location_Id] = @Location_Id WHERE [User_Id] = @User_Id">
                                       <DeleteParameters>
                                           <asp:Parameter Name="User_Id" Type="Int32" />
                                       </DeleteParameters>
                                       <InsertParameters>
                                           <asp:Parameter Name="User_Name" Type="String" />
                                           <asp:Parameter Name="User_Address" Type="String" />
                                           <asp:Parameter Name="User_Password" Type="String" />
                                           <asp:Parameter Name="User_Email" Type="String" />
                                           <asp:Parameter Name="User_Gender" Type="String" />
                                           <asp:Parameter Name="User_Mobile" Type="Decimal" />
                                           <asp:Parameter Name="Location_Id" Type="Int32" />
                                       </InsertParameters>
                                       <UpdateParameters>
                                           <asp:Parameter Name="User_Name" Type="String" />
                                           <asp:Parameter Name="User_Address" Type="String" />
                                           <asp:Parameter Name="User_Password" Type="String" />
                                           <asp:Parameter Name="User_Email" Type="String" />
                                           <asp:Parameter Name="User_Gender" Type="String" />
                                           <asp:Parameter Name="User_Mobile" Type="Decimal" />
                                           <asp:Parameter Name="Location_Id" Type="Int32" />
                                           <asp:Parameter Name="User_Id" Type="Int32" />
                                       </UpdateParameters>
                                   </asp:SqlDataSource>
                                   <br />
                                   <asp:Button ID="btnadd" class="btn btn-primary" runat="server" Text="Add New User" />
                               </asp:View>
                      <asp:View ID="viewinsert" runat="server">
                             

                           <div class="form-group">
                              <label>Enter User Name </label>
                              <asp:TextBox ID="txtusername" class="form-control" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtusername" runat="server" ErrorMessage="Enter User Name"></asp:RequiredFieldValidator>
						  </div>

                           <div class="form-group">
                              <label>Enter User Address </label>
                              <asp:TextBox ID="txtuseraddress" class="form-control" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtuseraddress" runat="server" ErrorMessage="Enter User Address"></asp:RequiredFieldValidator>
						  </div>
                        
                           <div class="form-group">
                              <label>Enter User Password </label>
                              <asp:TextBox ID="txtuserpassword" class="form-control" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtuserpassword" runat="server" ErrorMessage="Enter User Password"></asp:RequiredFieldValidator>
						  </div>
                        
                           <div class="form-group">
                              <label>Enter User Email </label>
                              <asp:TextBox ID="txtuseremail" class="form-control" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtuseremail" runat="server" ErrorMessage="Enter User Email"></asp:RequiredFieldValidator>
                              <!-- <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Proper E-mail Id" ControlToValidate="txtuseremail" ValidationExpression=" &quot;\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*&quot; "></asp:RegularExpressionValidator> -->
						  </div>
                        
                           <div class="form-group">
                              <label>Enter User's Gender </label>
                              <asp:TextBox ID="txtusergender" class="form-control" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtusergender" runat="server" ErrorMessage="Enter User Gender"></asp:RequiredFieldValidator>
						  </div>
                        
                           <div class="form-group">
                              <label>Enter User's Mobile Number </label>
                              <asp:TextBox ID="txtusermobile" class="form-control" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtusermobile" runat="server" ErrorMessage="Enter User Mobile Number"></asp:RequiredFieldValidator>
                               <!-- <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Please Enter Valid Mobile Number" ControlToValidate="txtusermobile" MinimumValue="0" MaximumValue="9"></asp:RangeValidator> -->
						  </div>
                        
                           <div class="form-group">
                              <label>Enter Location Id </label>
                               <asp:DropDownList ID="txtlocationid" class="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="Location_Name" DataValueField="Location_Id"></asp:DropDownList>
						       <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Location_Id], [Location_Name] FROM [Location]"></asp:SqlDataSource>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="txtlocationid" runat="server" ErrorMessage="Select Location"></asp:RequiredFieldValidator>
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


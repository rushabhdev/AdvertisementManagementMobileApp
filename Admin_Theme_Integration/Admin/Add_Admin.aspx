<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="false" CodeFile="Add_Admin.aspx.vb" Inherits="Add_Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormTitle" Runat="Server">
    Admin Queue
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FormContent" Runat="Server">
    <div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading clearfix">
						<h4 class="panel-title">Admins Of Chitra Publicity</h4>
						<ul class="panel-tool-options"> 
							<li><a data-rel="collapse" href="#"><i class="icon-down-open"></i></a></li>
							<li><a data-rel="reload" href="#"><i class="icon-arrows-ccw"></i></a></li>
							<li><a data-rel="close" href="#"><i class="icon-cancel"></i></a></li>
						</ul>
					</div>
					<div class="panel-body">
                               <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                                  <asp:View ID="viewdata" runat="server">
                                      <asp:GridView class="table table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Admin_Id" DataSourceID="SqlDataSource1" EnableModelValidation="True" AllowPaging="True" AllowSorting="True">
                                          <Columns>
                                              <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                                              <asp:BoundField DataField="Admin_Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Admin_Id" />
                                              <asp:BoundField DataField="Admin_Name" HeaderText="Name" SortExpression="Admin_Name" />
                                              <asp:BoundField DataField="Admin_Password" HeaderText="Password" SortExpression="Admin_Password" />
                                              <asp:BoundField DataField="Admin_Email" HeaderText="Email" SortExpression="Admin_Email" />
                                          </Columns>
                                      </asp:GridView>
                                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Admin] WHERE [Admin_Id] = @Admin_Id" InsertCommand="INSERT INTO [Admin] ([Admin_Name], [Admin_Password], [Admin_Email]) VALUES (@Admin_Name, @Admin_Password, @Admin_Email)" SelectCommand="SELECT * FROM [Admin]" UpdateCommand="UPDATE [Admin] SET [Admin_Name] = @Admin_Name, [Admin_Password] = @Admin_Password, [Admin_Email] = @Admin_Email WHERE [Admin_Id] = @Admin_Id">
                                          <DeleteParameters>
                                              <asp:Parameter Name="Admin_Id" Type="Int32" />
                                          </DeleteParameters>
                                          <InsertParameters>
                                              <asp:Parameter Name="Admin_Name" Type="String" />
                                              <asp:Parameter Name="Admin_Password" Type="String" />
                                              <asp:Parameter Name="Admin_Email" Type="String" />
                                          </InsertParameters>
                                          <UpdateParameters>
                                              <asp:Parameter Name="Admin_Name" Type="String" />
                                              <asp:Parameter Name="Admin_Password" Type="String" />
                                              <asp:Parameter Name="Admin_Email" Type="String" />
                                              <asp:Parameter Name="Admin_Id" Type="Int32" />
                                          </UpdateParameters>
                                      </asp:SqlDataSource>
                                      <br />
                                      <asp:Button ID="btnadd" runat="server" Text="Add New Admin" class="btn btn-primary" />
                                  </asp:View>
                                  <asp:View ID="viewinsert" runat="server">
                                       <div class="form-group">
                                         <label>Enter Admin Name </label>
                                         <asp:TextBox ID="txtadminname" class="form-control" runat="server"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtadminname" runat="server" ErrorMessage="Enter Admin Name"></asp:RequiredFieldValidator>
                                        </div>

                                    <div class="form-group">
                                    <label>Enter Admin Password </label>
                                    <asp:TextBox ID="txtadminpassword" class="form-control" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtadminpassword" runat="server" ErrorMessage="Enter Admin Password"></asp:RequiredFieldValidator>
						            </div>

                                    <div class="form-group">
                                    <label>Enter Admin Email </label>
                                    <asp:TextBox ID="txtadminemail" class="form-control" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtadminemail" runat="server" ErrorMessage="Enter Admin Name"></asp:RequiredFieldValidator>
						            </div>
                        	<asp:Button ID="btninsert" class="btn btn-primary" runat="server" Text="Insert" />		 
                            <asp:Button ID="btncancel" class="btn btn-primary" runat="server" Text="Cancel" />		     
                                  </asp:View>
                              </asp:MultiView>
						  

                          
				 <!--del-->
				</div>
			</div>
		</div>
        </div>
</asp:Content>


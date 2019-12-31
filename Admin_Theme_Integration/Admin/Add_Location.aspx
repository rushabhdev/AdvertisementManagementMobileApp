<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="false" CodeFile="Add_Location.aspx.vb" Inherits="Add_Location" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormTitle" Runat="Server">
    Add New Location
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FormContent" Runat="Server">
     <div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading clearfix">
						<h4 class="panel-title">Present Locations</h4>
						<ul class="panel-tool-options"> 
							<li><a data-rel="collapse" href="#"><i class="icon-down-open"></i></a></li>
							<li><a data-rel="reload" href="#"><i class="icon-arrows-ccw"></i></a></li>
							<li><a data-rel="close" href="#"><i class="icon-cancel"></i></a></li>
						</ul>
					</div>
					<div class="panel-body">
						  
                         <asp:MultiView ID="MultiView2" runat="server" ActiveViewIndex="0">
                              
                               <asp:View ID="viewdata" runat="server">

                                   <asp:GridView ID="GridView1" class="table-bordered"  runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Location_Id" DataSourceID="SqlDataSource1" EnableModelValidation="True">
                                       <Columns>
                                           <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                                           <asp:BoundField DataField="Location_Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Location_Id" />
                                           <asp:BoundField DataField="Location_Name" HeaderText="Name" SortExpression="Location_Name" />
                                           <asp:BoundField DataField="City_Name" HeaderText="Name" SortExpression="City_Name" />
                                       </Columns>
                                   </asp:GridView>
                                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Location] WHERE [Location_Id] = @Location_Id" InsertCommand="INSERT INTO [Location] ([Location_Name], [City_Id]) VALUES (@Location_Name, @City_Id)" SelectCommand="SELECT Location.Location_Id, Location.Location_Name, Location.City_Id, City.City_Name FROM Location INNER JOIN City ON Location.City_Id = City.City_Id" UpdateCommand="UPDATE [Location] SET [Location_Name] = @Location_Name, [City_Id] = @City_Id WHERE [Location_Id] = @Location_Id">
                                       <DeleteParameters>
                                           <asp:Parameter Name="Location_Id" Type="Int32" />
                                       </DeleteParameters>
                                       <InsertParameters>
                                           <asp:Parameter Name="Location_Name" Type="String" />
                                           <asp:Parameter Name="City_Id" Type="Int32" />
                                       </InsertParameters>
                                       <UpdateParameters>
                                           <asp:Parameter Name="Location_Name" Type="String" />
                                           <asp:Parameter Name="City_Id" Type="Int32" />
                                           <asp:Parameter Name="Location_Id" Type="Int32" />
                                       </UpdateParameters>
                                   </asp:SqlDataSource>
                                   <br />
                                   <asp:Button ID="btnadd" class="btn btn-primary"  runat="server" Text="Add New Location" />

                               </asp:View>
                               
                           <asp:View ID="viewinsert" runat="server">
                           <div class="form-group">
                              <label>Enter Location Name </label>
                              <asp:TextBox ID="txtlocationname" class="form-control" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtlocationname" runat="server" ErrorMessage="Enter Location Name"></asp:RequiredFieldValidator>
						  </div>
                        
                           <div class="form-group">
                              <label>Enter City Id </label>
                               <asp:DropDownList ID="txtcityid" class="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="City_Name" DataValueField="City_Id"></asp:DropDownList>                              
                               <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [City]"></asp:SqlDataSource>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtcityid" runat="server" ErrorMessage="Select City"></asp:RequiredFieldValidator>
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


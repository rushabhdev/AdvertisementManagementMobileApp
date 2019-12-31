<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="false" CodeFile="Add_City.aspx.vb" Inherits="AddHoarding" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormTitle" Runat="Server">
    List of cities
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FormContent" Runat="Server">
            <div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading clearfix">
						<h4 class="panel-title">Add New City</h4>
						<ul class="panel-tool-options"> 
							<li><a data-rel="collapse" href="#"><i class="icon-down-open"></i></a></li>
							<li><a data-rel="reload" href="#"><i class="icon-arrows-ccw"></i></a></li>
							<li><a data-rel="close" href="#"><i class="icon-cancel"></i></a></li>
						</ul>
					</div>
					<div class="panel-body">
						  
                           <asp:MultiView ID="MultiView2" runat="server" ActiveViewIndex="0">
                                   <asp:View ID="viewdata" runat="server">
                                       <asp:GridView ID="GridView1" class="table table-bordered" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="City_Id" DataSourceID="SqlDataSource1">
                                           <Columns>
                                               <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True"></asp:CommandField>
                                               <asp:BoundField DataField="City_Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="City_Id"></asp:BoundField>
                                               <asp:BoundField DataField="City_Name" HeaderText="Name" SortExpression="City_Name"></asp:BoundField>
                                           </Columns>
                                       </asp:GridView>
                                       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [City] WHERE [City_Id] = @City_Id" InsertCommand="INSERT INTO [City] ([City_Name]) VALUES (@City_Name)" SelectCommand="SELECT * FROM [City]" UpdateCommand="UPDATE [City] SET [City_Name] = @City_Name WHERE [City_Id] = @City_Id">
                                           <DeleteParameters>
                                               <asp:Parameter Name="City_Id" Type="Int32" />
                                           </DeleteParameters>
                                           <InsertParameters>
                                               <asp:Parameter Name="City_Name" Type="String" />
                                           </InsertParameters>
                                           <UpdateParameters>
                                               <asp:Parameter Name="City_Name" Type="String" />
                                               <asp:Parameter Name="City_Id" Type="Int32" />
                                           </UpdateParameters>
                                       </asp:SqlDataSource>
                                       <br />
                                       <asp:Button ID="btnadd" runat="server" Text="Add City" Width="76px" class="btn btn-primary" />
                                   </asp:View>
                                   <asp:View ID="viewinsert" runat="server">
                                       <div class="form-group">
                              <label>Enter City Name</label>
                                       <asp:TextBox ID="txtcityname" class="form-control" runat="server"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtcityname" runat="server" ErrorMessage="Enter City Name"></asp:RequiredFieldValidator>
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


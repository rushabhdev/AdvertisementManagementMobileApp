<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="false" CodeFile="Add_Booking.aspx.vb" Inherits="Add_Booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormTitle" Runat="Server">
    Booking list
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FormContent" Runat="Server">
     <div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading clearfix">
						<h4 class="panel-title">Booking list for chitra publicity</h4>
						<ul class="panel-tool-options"> 
							<li><a data-rel="collapse" href="#"><i class="icon-down-open"></i></a></li>
							<li><a data-rel="reload" href="#"><i class="icon-arrows-ccw"></i></a></li>
							<li><a data-rel="close" href="#"><i class="icon-cancel"></i></a></li>
						</ul>
					</div>
					<div class="panel-body">
						   <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                           
                               <asp:View ID="viewdata" runat="server">

                                   <asp:GridView ID="GridView1" class="table table-bordered" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Booking_Id" DataSourceID="SqlDataSource1" EnableModelValidation="True">
                                       <Columns>
                                           <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                                           <asp:BoundField DataField="Booking_Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Booking_Id" />
                                           <asp:BoundField DataField="Booking_Date" HeaderText="Date" SortExpression="Booking_Date" DataFormatString ="{0:dd-MM-yy}" />
                                           <asp:BoundField DataField="Booking_Desc" HeaderText="Description" SortExpression="Booking_Desc" />
                                           <asp:BoundField DataField="Booking_StartDate" HeaderText="StartDate" SortExpression="Booking_StartDate" DataFormatString ="{0:dd-MM-yy}" />
                                           <asp:BoundField DataField="Booking_EndDate" HeaderText="EndDate" SortExpression="Booking_EndDate" DataFormatString ="{0:dd-MM-yy}" />
                                           <asp:BoundField DataField="User_Name" HeaderText="Name" SortExpression="User_Name" />
                                           <asp:BoundField DataField="Coupon_Code" HeaderText="Coupon Code" SortExpression="Coupon_Code" />
                                           <asp:BoundField DataField="Booking_Status" HeaderText="Status" SortExpression="Booking_Status" />
                                       </Columns>
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
                                   <br />
                                   <asp:Button ID="btnadd" runat="server" Text="Add New Booking" class="btn btn-primary" />

                               </asp:View>
                               <asp:View ID="viewinsert" runat="server">
                            

                           <div class="form-group">
                              <label>Enter Booking Date</label>
                              <asp:TextBox ID="txtbookingdate" class="form-control" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtbookingdate" runat="server" ErrorMessage="Enter Booking Date"></asp:RequiredFieldValidator>                             
						  </div>
                        
                           <div class="form-group">
                              <label>Enter Booking Description </label>
                              <asp:TextBox ID="txtbookigdescription" class="form-control" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtbookigdescription" runat="server" ErrorMessage="Enter Booking Description"></asp:RequiredFieldValidator>
						  </div>
                        
                           <div class="form-group">
                              <label>Enter Booking Start Date </label>
                              <asp:TextBox ID="txtbookingstartdate" class="form-control" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtbookingstartdate" runat="server" ErrorMessage="Enter Booking Start Date"></asp:RequiredFieldValidator>
                               
						  </div>
                        
                           <div class="form-group">
                              <label>Enter Booking End Date </label>
                              <asp:TextBox ID="txtbookingenddate" class="form-control" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtbookingenddate" runat="server" ErrorMessage="Enter Booking End Date"></asp:RequiredFieldValidator>
                              
						  </div>
                        
                           <div class="form-group">
                              <label>Enter User Id </label>
                               <asp:DropDownList ID="txtuserid" class="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="User_Name" DataValueField="User_Id"></asp:DropDownList>
                             
						       <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [User_Id], [User_Name] FROM [User]"></asp:SqlDataSource>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtuserid" runat="server" ErrorMessage="Select User Id"></asp:RequiredFieldValidator>

                             
						  </div>
                        
                           <div class="form-group">
                              <label>Enter Coupon Id </label>
                               <asp:DropDownList ID="txtcouponid" class="form-control" runat="server" DataSourceID="SqlDataSource3" DataTextField="Coupon_Code" DataValueField="Coupon_Id"></asp:DropDownList>
                            
						       <asp:SqlDataSource ID="SqlDataSource3"  runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Coupon_Id], [Coupon_Code] FROM [Coupon]"></asp:SqlDataSource>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtcouponid" runat="server" ErrorMessage="Select Coupon Id"></asp:RequiredFieldValidator>
                            
						  </div>
                        
                           <div class="form-group">
                              <label>Enter Booking Status </label>
                              <asp:TextBox ID="txtbookingstatus" class="form-control"  runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="txtbookingstatus" runat="server" ErrorMessage="Enter Booking Status"></asp:RequiredFieldValidator>
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


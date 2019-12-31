<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="false" CodeFile="Add_Coupons.aspx.vb" Inherits="Add_Coupons" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormTitle" Runat="Server">
    Add New Coupon
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FormContent" Runat="Server">
    <div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading clearfix">
						<h4 class="panel-title">List of coupons issued</h4>
						<ul class="panel-tool-options"> 
							<li><a data-rel="collapse" href="#"><i class="icon-down-open"></i></a></li>
							<li><a data-rel="reload" href="#"><i class="icon-arrows-ccw"></i></a></li>
							<li><a data-rel="close" href="#"><i class="icon-cancel"></i></a></li>
						</ul>
					</div>
					<div class="panel-body">
						   <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                          
                               <asp:View ID="viewdata" runat="server">

                                   <asp:GridView ID="GridView1" runat="server" class="table table-bordered" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Coupon_Id" DataSourceID="SqlDataSource1" EnableModelValidation="True">
                                       <Columns>
                                           <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                                           <asp:BoundField DataField="Coupon_Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Coupon_Id" />
                                           <asp:BoundField DataField="Coupon_Code" HeaderText="Code" SortExpression="Coupon_Code" />
                                           <asp:BoundField DataField="Coupon_Desc" HeaderText="Description" SortExpression="Coupon_Desc" />
                                           <asp:BoundField DataField="Coupon_Startdate" HeaderText="Startdate" SortExpression="Coupon_Startdate"  DataFormatString ="{0:dd-MM-yy}"/>
                                           <asp:BoundField DataField="Coupon_Enddate" HeaderText="Enddate" SortExpression="Coupon_Enddate"  DataFormatString ="{0:dd-MM-yy}"/>
                                           <asp:BoundField DataField="Coupon_Discount" HeaderText="Discount" SortExpression="Coupon_Discount" />
                                       </Columns>
                                   </asp:GridView>
                                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Coupon] WHERE [Coupon_Id] = @Coupon_Id" InsertCommand="INSERT INTO [Coupon] ([Coupon_Code], [Coupon_Desc], [Coupon_Startdate], [Coupon_Enddate], [Coupon_Discount]) VALUES (@Coupon_Code, @Coupon_Desc, @Coupon_Startdate, @Coupon_Enddate, @Coupon_Discount)" SelectCommand="SELECT * FROM [Coupon]" UpdateCommand="UPDATE [Coupon] SET [Coupon_Code] = @Coupon_Code, [Coupon_Desc] = @Coupon_Desc, [Coupon_Startdate] = @Coupon_Startdate, [Coupon_Enddate] = @Coupon_Enddate, [Coupon_Discount] = @Coupon_Discount WHERE [Coupon_Id] = @Coupon_Id">
                                       <DeleteParameters>
                                           <asp:Parameter Name="Coupon_Id" Type="Int32" />
                                       </DeleteParameters>
                                       <InsertParameters>
                                           <asp:Parameter Name="Coupon_Code" Type="Int32" />
                                           <asp:Parameter Name="Coupon_Desc" Type="String" />
                                           <asp:Parameter DbType="Date" Name="Coupon_Startdate" />
                                           <asp:Parameter DbType="Date" Name="Coupon_Enddate" />
                                           <asp:Parameter Name="Coupon_Discount" Type="Int32" />
                                       </InsertParameters>
                                       <UpdateParameters>
                                           <asp:Parameter Name="Coupon_Code" Type="Int32" />
                                           <asp:Parameter Name="Coupon_Desc" Type="String" />
                                           <asp:Parameter DbType="Date" Name="Coupon_Startdate" />
                                           <asp:Parameter DbType="Date" Name="Coupon_Enddate" />
                                           <asp:Parameter Name="Coupon_Discount" Type="Int32" />
                                           <asp:Parameter Name="Coupon_Id" Type="Int32" />
                                       </UpdateParameters>
                                   </asp:SqlDataSource>
                                   <br />
                                   <asp:Button ID="btnadd" runat="server" Text="Add New Coupon" class="btn btn-primary" />

                               </asp:View>
                               <asp:View ID="viewinsert" runat="server">
                           

                           <div class="form-group">
                              <label>Enter Coupon Code </label>
                              <asp:TextBox ID="txtcouponcode" class="form-control" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtcouponcode" runat="server" ErrorMessage="Enter Coupon Code"></asp:RequiredFieldValidator>
						  </div>
                        
                           <div class="form-group">
                              <label>Enter Coupon Description </label>
                              <asp:TextBox ID="txtcoupondescription" class="form-control" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtcoupondescription" runat="server" ErrorMessage="Enter Coupon Description"></asp:RequiredFieldValidator>
						  </div>
                        
                           <div class="form-group">
                              <label>Enter Coupon Start Date </label>
                              <asp:TextBox ID="txtcouponstartdate" class="form-control" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtcouponstartdate" runat="server" ErrorMessage="Enter Coupon Start Date"></asp:RequiredFieldValidator>
						  </div>
                        
                           <div class="form-group">
                              <label>Enter Coupon End Date </label>
                              <asp:TextBox ID="txtcouponenddate" class="form-control" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtcouponenddate" runat="server" ErrorMessage="Enter Coupon End Date"></asp:RequiredFieldValidator>
						  </div>
                        
                           <div class="form-group">
                              <label>Enter Coupon Discount </label>
                              <asp:TextBox ID="txtcoupondiscount" class="form-control" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtcoupondiscount" runat="server" ErrorMessage="Enter Coupon Discount"></asp:RequiredFieldValidator>
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


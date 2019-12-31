<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="false" CodeFile="Add_BookingDetails.aspx.vb" Inherits="Add_BookingDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormTitle" Runat="Server">
   Booking's Detail
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FormContent" Runat="Server">
     <div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading clearfix">
						<h4 class="panel-title">Booking details for chitra publicity</h4>
						<ul class="panel-tool-options"> 
							<li><a data-rel="collapse" href="#"><i class="icon-down-open"></i></a></li>
							<li><a data-rel="reload" href="#"><i class="icon-arrows-ccw"></i></a></li>
							<li><a data-rel="close" href="#"><i class="icon-cancel"></i></a></li>
						</ul>
					</div>
					<div class="panel-body">
						<asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                             
                               <asp:View ID="viewdata" runat="server">

                                   <asp:GridView ID="GridView1" class="table table-bordered" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Details_Id" DataSourceID="SqlDataSource1" EnableModelValidation="True">
                                       <Columns>
                                           <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                                           <asp:BoundField DataField="Details_Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Details_Id" />
                                           <asp:BoundField DataField="Booking_Date" HeaderText="Date" SortExpression="Booking_Date"  DataFormatString ="{0:dd-MM-yy}" />
                                           <asp:BoundField DataField="Hoarding_Name" HeaderText="Name" SortExpression="Hoarding_Name" />
                                           <asp:TemplateField HeaderText="Url" SortExpression="Banner_Url">
                                               <EditItemTemplate>
                                                   <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Banner_Url") %>'></asp:TextBox>
                                               </EditItemTemplate>
                                               <ItemTemplate>
                                                   <asp:Image ID="Image1" runat="server" Height="80px" ImageUrl='<%# "~\Banner_Url_Images\"+Eval("Banner_Url") %>' Width="80px" />
                                               </ItemTemplate>
                                           </asp:TemplateField>
                                           <asp:BoundField DataField="Hoarding_Price" HeaderText="Hoarding_Price" SortExpression="Hoarding_Price" />
                                       </Columns>
                                   </asp:GridView>
                                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Booking_Details] WHERE [Details_Id] = @Details_Id" InsertCommand="INSERT INTO [Booking_Details] ([Booking_Id], [Hoarding_Id], [Banner_Url], [Hoarding_Price]) VALUES (@Booking_Id, @Hoarding_Id, @Banner_Url, @Hoarding_Price)" SelectCommand="SELECT Booking_Details.Details_Id, Booking_Details.Booking_Id, Booking_Details.Hoarding_Id, Booking_Details.Banner_Url, Booking_Details.Hoarding_Price, Booking.Booking_Date, Hoarding.Hoarding_Name FROM Booking_Details INNER JOIN Booking ON Booking_Details.Booking_Id = Booking.Booking_Id INNER JOIN Hoarding ON Booking_Details.Hoarding_Id = Hoarding.Hoarding_Id" UpdateCommand="UPDATE [Booking_Details] SET [Booking_Id] = @Booking_Id, [Hoarding_Id] = @Hoarding_Id, [Banner_Url] = @Banner_Url, [Hoarding_Price] = @Hoarding_Price WHERE [Details_Id] = @Details_Id">
                                       <DeleteParameters>
                                           <asp:Parameter Name="Details_Id" Type="Int32" />
                                       </DeleteParameters>
                                       <InsertParameters>
                                           <asp:Parameter Name="Booking_Id" Type="Int32" />
                                           <asp:Parameter Name="Hoarding_Id" Type="Int32" />
                                           <asp:Parameter Name="Banner_Url" Type="String" />
                                           <asp:Parameter Name="Hoarding_Price" Type="Double" />
                                       </InsertParameters>
                                       <UpdateParameters>
                                           <asp:Parameter Name="Booking_Id" Type="Int32" />
                                           <asp:Parameter Name="Hoarding_Id" Type="Int32" />
                                           <asp:Parameter Name="Banner_Url" Type="String" />
                                           <asp:Parameter Name="Hoarding_Price" Type="Double" />
                                           <asp:Parameter Name="Details_Id" Type="Int32" />
                                       </UpdateParameters>
                                   </asp:SqlDataSource>
                                   <br />
                                   <asp:Button ID="btnadd" runat="server" Text="Add New Booking Details" class="btn btn-primary"/>

                               </asp:View>
                               <asp:View ID="viewinsert" runat="server">
                          

                           <div class="form-group">
                              <label>Enter Booking Date</label>
                               <asp:DropDownList ID="txtbookingid" runat="server" class="form-control" DataSourceID="SqlDataSource2" DataTextField="Booking_Date" DataValueField="Booking_Id" DataTextFormatString="{0:dd-MM-yy}"></asp:DropDownList>
                               <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Booking_Id], [Booking_Date] FROM [Booking]"></asp:SqlDataSource>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtbookingid" runat="server" ErrorMessage="Select Booking"></asp:RequiredFieldValidator>
                           </div>
                        
                           <div class="form-group">
                              <label>Enter Hoarding Name </label>
                               <asp:DropDownList ID="txthoardingid" class="form-control" runat="server" DataSourceID="SqlDataSource3" DataTextField="Hoarding_Name" DataValueField="Hoarding_Id"></asp:DropDownList>
						       <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Hoarding_Id], [Hoarding_Name] FROM [Hoarding]"></asp:SqlDataSource>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txthoardingid" runat="server" ErrorMessage="Select Hoarding"></asp:RequiredFieldValidator>
						  </div> 

                           <div class="form-group">
                              <label>Enter Banner Url </label>
                               <asp:Image ID="Image2" runat="server" Height="100px" Width="100px" />
                                <asp:LinkButton ID="LinkButton1" runat="server">Change Image</asp:LinkButton>
                               <asp:FileUpload ID="FileUpload1" class="form-control" runat="server" />
						  </div>
                        
                           <div class="form-group">
                              <label>Enter Hoarding Price </label>
                              <asp:TextBox ID="txthoardingprice" class="form-control" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txthoardingprice" runat="server" ErrorMessage="Enter Hoarding Price"></asp:RequiredFieldValidator>
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


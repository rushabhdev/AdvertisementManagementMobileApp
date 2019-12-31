<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="false" CodeFile="Add_Payment.aspx.vb" Inherits="Add_Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormTitle" Runat="Server">
    Add Payment Information
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FormContent" Runat="Server">
     <div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading clearfix">
						<h4 class="panel-title">Payment Details Till Date</h4>
						<ul class="panel-tool-options"> 
							<li><a data-rel="collapse" href="#"><i class="icon-down-open"></i></a></li>
							<li><a data-rel="reload" href="#"><i class="icon-arrows-ccw"></i></a></li>
							<li><a data-rel="close" href="#"><i class="icon-cancel"></i></a></li>
						</ul>
					</div>
					<div class="panel-body">
					           <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                             
                               <asp:View ID="viewdata" runat="server">

                                   <asp:GridView ID="GridView1" class="table-bordered" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Payment_Id" DataSourceID="SqlDataSource1" EnableModelValidation="True">
                                       <Columns>
                                           <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                                           <asp:BoundField DataField="Payment_Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Payment_Id" />
                                           <asp:BoundField DataField="Payment_Date" HeaderText="Payment Date" SortExpression="Payment_Date" DataFormatString ="{0:dd-MM-yy}" />
                                           <asp:BoundField DataField="Payment_Amount" HeaderText="Amount" SortExpression="Payment_Amount" />
                                           <asp:BoundField DataField="Booking_Date" HeaderText="Booking Date" SortExpression="Booking_Date" DataFormatString ="{0:dd-MM-yy}" />
                                       </Columns>
                                   </asp:GridView>
                                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Payment] WHERE [Payment_Id] = @Payment_Id" InsertCommand="INSERT INTO [Payment] ([Payment_Date], [Payment_Amount], [Booking_Id]) VALUES (@Payment_Date, @Payment_Amount, @Booking_Id)" SelectCommand="SELECT Payment.Payment_Id, Payment.Payment_Date, Payment.Payment_Amount, Payment.Booking_Id, Booking.Booking_Date FROM Payment INNER JOIN Booking ON Payment.Booking_Id = Booking.Booking_Id" UpdateCommand="UPDATE [Payment] SET [Payment_Date] = @Payment_Date, [Payment_Amount] = @Payment_Amount, [Booking_Id] = @Booking_Id WHERE [Payment_Id] = @Payment_Id">
                                       <DeleteParameters>
                                           <asp:Parameter Name="Payment_Id" Type="Int32" />
                                       </DeleteParameters>
                                       <InsertParameters>
                                           <asp:Parameter DbType="Date" Name="Payment_Date" />
                                           <asp:Parameter Name="Payment_Amount" Type="Double" />
                                           <asp:Parameter Name="Booking_Id" Type="Int32" />
                                       </InsertParameters>
                                       <UpdateParameters>
                                           <asp:Parameter DbType="Date" Name="Payment_Date" />
                                           <asp:Parameter Name="Payment_Amount" Type="Double" />
                                           <asp:Parameter Name="Booking_Id" Type="Int32" />
                                           <asp:Parameter Name="Payment_Id" Type="Int32" />
                                       </UpdateParameters>
                                   </asp:SqlDataSource>
                                   <br />
                                   <asp:Button ID="btnadd" class="btn btn-primary" runat="server" Text="Add New Payment" />

                               </asp:View>
                               <asp:View ID="viewinsert" runat="server">
                            

                           <div class="form-group">
                              <label>Enter Payment Date</label>
                              <asp:TextBox ID="txtpaymentdate" class="form-control" runat="server"  DataFormatString ="{0:dd-MM-yy}"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtpaymentdate" runat="server" ErrorMessage="Enter Payment Date"></asp:RequiredFieldValidator>
						  </div>
                        
                           <div class="form-group">
                              <label>Enter Payment Amount </label>
                              <asp:TextBox ID="txtpaymentamount" class="form-control" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtpaymentamount" runat="server" ErrorMessage="Enter Payment Amount"></asp:RequiredFieldValidator>
						  </div>
                        
                           <div class="form-group">
                              <label>Enter Booking Id </label>
                               <asp:DropDownList ID="txtbookingid" class="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="Booking_Date" DataValueField="Booking_Id" DataTextFormatString="{0:dd-MM-yy}"></asp:DropDownList>                              
						       <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Booking_Id], [Booking_Date] FROM [Booking]"></asp:SqlDataSource>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtbookingid" runat="server" ErrorMessage="Select Booking Id"></asp:RequiredFieldValidator>
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


<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="false" CodeFile="Add_Feedback.aspx.vb" Inherits="Add_Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormTitle" Runat="Server">
    Add Feedback Information
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FormContent" Runat="Server">
    <div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading clearfix">
						<h4 class="panel-title">Feedback preview</h4>
						<ul class="panel-tool-options"> 
							<li><a data-rel="collapse" href="#"><i class="icon-down-open"></i></a></li>
							<li><a data-rel="reload" href="#"><i class="icon-arrows-ccw"></i></a></li>
							<li><a data-rel="close" href="#"><i class="icon-cancel"></i></a></li>
						</ul>
					</div>
					<div class="panel-body">
					   <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                              
                               <asp:View ID="viewdata" runat="server">

                                   <asp:GridView ID="GridView1" class="table table-bordered" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Feedback_Id" DataSourceID="SqlDataSource1" EnableModelValidation="True">
                                       <Columns>
                                           <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                                           <asp:BoundField DataField="Feedback_Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Feedback_Id" />
                                           <asp:BoundField DataField="Feedback_Date" HeaderText="Date" SortExpression="Feedback_Date" DataFormatString ="{0:dd-MM-yy}" />
                                           <asp:BoundField DataField="Feedback_Desc" HeaderText="Desc" SortExpression="Feedback_Desc" />
                                           <asp:BoundField DataField="User_Name" HeaderText="Name" SortExpression="User_Name" />
                                       </Columns>
                                   </asp:GridView>
                                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Feedback] WHERE [Feedback_Id] = @Feedback_Id" InsertCommand="INSERT INTO [Feedback] ([Feedback_Date], [Feedback_Desc], [User_Id]) VALUES (@Feedback_Date, @Feedback_Desc, @User_Id)" SelectCommand="SELECT Feedback.Feedback_Id, Feedback.Feedback_Date, Feedback.Feedback_Desc, Feedback.User_Id, [User].User_Name FROM Feedback INNER JOIN [User] ON Feedback.User_Id = [User].User_Id" UpdateCommand="UPDATE [Feedback] SET [Feedback_Date] = @Feedback_Date, [Feedback_Desc] = @Feedback_Desc, [User_Id] = @User_Id WHERE [Feedback_Id] = @Feedback_Id">
                                       <DeleteParameters>
                                           <asp:Parameter Name="Feedback_Id" Type="Int32" />
                                       </DeleteParameters>
                                       <InsertParameters>
                                           <asp:Parameter DbType="Date" Name="Feedback_Date" />
                                           <asp:Parameter Name="Feedback_Desc" Type="String" />
                                           <asp:Parameter Name="User_Id" Type="Int32" />
                                       </InsertParameters>
                                       <UpdateParameters>
                                           <asp:Parameter DbType="Date" Name="Feedback_Date" />
                                           <asp:Parameter Name="Feedback_Desc" Type="String" />
                                           <asp:Parameter Name="User_Id" Type="Int32" />
                                           <asp:Parameter Name="Feedback_Id" Type="Int32" />
                                       </UpdateParameters>
                                   </asp:SqlDataSource>
                                   <br />
                                   <asp:Button ID="btnadd" class="btn btn-primary" runat="server" Text="Add New Feedback" />

                               </asp:View>
                               <asp:View ID="viewinsert" runat="server">
                         

                           <div class="form-group">
                              <label>Enter Feedback Date</label>
                              <asp:TextBox ID="txtfeedbackdate" class="form-control" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtfeedbackdate" runat="server" ErrorMessage="Enter Feedback Date"></asp:RequiredFieldValidator>
						  </div>
                        
                           <div class="form-group">
                              <label>Enter Feedback Description </label>
                              <asp:TextBox ID="txtfeedbackdescription" class="form-control" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtfeedbackdescription" runat="server" ErrorMessage="Enter Feedback Description"></asp:RequiredFieldValidator>
						  </div>
                        
                           <div class="form-group">
                              <label>Enter User Id </label>
                               <asp:DropDownList ID="txtuserid" class="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="User_Name" DataValueField="User_Id"></asp:DropDownList>                              
						       <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [User_Id], [User_Name] FROM [User]"></asp:SqlDataSource>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtuserid" runat="server" ErrorMessage="Select User"></asp:RequiredFieldValidator>
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


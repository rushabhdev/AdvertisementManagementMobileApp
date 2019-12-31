<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="false" CodeFile="Add_HoardingType.aspx.vb" Inherits="Add_HoardingType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormTitle" Runat="Server">
    Add Hoarding Type
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FormContent" Runat="Server">
    <div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading clearfix">
						<h4 class="panel-title">Types of Hoardings Available</h4>
						<ul class="panel-tool-options"> 
							<li><a data-rel="collapse" href="#"><i class="icon-down-open"></i></a></li>
							<li><a data-rel="reload" href="#"><i class="icon-arrows-ccw"></i></a></li>
							<li><a data-rel="close" href="#"><i class="icon-cancel"></i></a></li>
						</ul>
					</div>
					<div class="panel-body">
						    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                               
                               <asp:View ID="viewdata" runat="server">

                                   <asp:GridView ID="GridView1"  class="table table-bordered" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="HoardingType_Id" DataSourceID="SqlDataSource1" EnableModelValidation="True">
                                       <Columns>
                                           <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                                           <asp:BoundField DataField="HoardingType_Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="HoardingType_Id" />
                                           <asp:BoundField DataField="HoardingType_Name" HeaderText="Name" SortExpression="HoardingType_Name" />
                                       </Columns>
                                   </asp:GridView>
                                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Hoarding_Type] WHERE [HoardingType_Id] = @HoardingType_Id" InsertCommand="INSERT INTO [Hoarding_Type] ([HoardingType_Name]) VALUES (@HoardingType_Name)" SelectCommand="SELECT * FROM [Hoarding_Type]" UpdateCommand="UPDATE [Hoarding_Type] SET [HoardingType_Name] = @HoardingType_Name WHERE [HoardingType_Id] = @HoardingType_Id">
                                       <DeleteParameters>
                                           <asp:Parameter Name="HoardingType_Id" Type="Int32" />
                                       </DeleteParameters>
                                       <InsertParameters>
                                           <asp:Parameter Name="HoardingType_Name" Type="String" />
                                       </InsertParameters>
                                       <UpdateParameters>
                                           <asp:Parameter Name="HoardingType_Name" Type="String" />
                                           <asp:Parameter Name="HoardingType_Id" Type="Int32" />
                                       </UpdateParameters>
                                   </asp:SqlDataSource>
                                   <br />
                                   <asp:Button ID="btnadd" class="btn btn-primary" runat="server" Text="Add New Hoarding type" />

                               </asp:View>
                               <asp:View ID="viewinsert" runat="server">
                            
                           <div class="form-group">
                              <label>Enter Hoarding Type Name </label>
                              <asp:TextBox ID="txthoardingtypename" class="form-control" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txthoardingtypename" runat="server" ErrorMessage="Enter HoardingType Name"></asp:RequiredFieldValidator>
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


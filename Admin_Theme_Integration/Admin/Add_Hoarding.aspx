<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="false" CodeFile="Add_Hoarding.aspx.vb" Inherits="Add_Hoarding" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormTitle" runat="Server">
    Add Hoarding
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FormContent" runat="Server">
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading clearfix">
                    <h4 class="panel-title">Current Hoarding</h4>
                    <ul class="panel-tool-options">
                        <li><a data-rel="collapse" href="#"><i class="icon-down-open"></i></a></li>
                        <li><a data-rel="reload" href="#"><i class="icon-arrows-ccw"></i></a></li>
                        <li><a data-rel="close" href="#"><i class="icon-cancel"></i></a></li>
                    </ul>
                </div>
                <div class="panel-body">
                    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">

                        <asp:View ID="viewdata" runat="server">

                            <asp:GridView ID="GridView1" class="table table-bordered" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Hoarding_Id" DataSourceID="SqlDataSource1" EnableModelValidation="True">
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                                    <asp:BoundField DataField="Hoarding_Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Hoarding_Id" />
                                    <asp:BoundField DataField="Hoarding_Name" HeaderText="Hoarding Name" SortExpression="Hoarding_Name" />
                                    <asp:BoundField DataField="Hoarding_Address" HeaderText="Address" SortExpression="Hoarding_Address" />
                                    <asp:BoundField DataField="Location_Name" HeaderText="Location Name" SortExpression="Location_Name" />
                                    <asp:BoundField DataField="HoardingType_Name" HeaderText="Type Name" SortExpression="HoardingType_Name" />
                                    <asp:BoundField DataField="Hoarding_Height" HeaderText="Height" SortExpression="Hoarding_Height" />
                                    <asp:BoundField DataField="Hoarding_Width" HeaderText="Width" SortExpression="Hoarding_Width" />
                                    <asp:BoundField DataField="Hoarding_Price" HeaderText="Price" SortExpression="Hoarding_Price" />
                                    <asp:TemplateField HeaderText="Url" SortExpression="Hoarding_Image">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Hoarding_Image")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                      <ItemTemplate>
                                            <asp:Image ID="Image1" runat="server" Height="80px" ImageUrl='<%# "~\Hoarding_Image\" + Eval("Hoarding_Image")%>' Width="80px" />
                                        </ItemTemplate>  
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Hoarding] WHERE [Hoarding_Id] = @Hoarding_Id" InsertCommand="INSERT INTO [Hoarding] ([Hoarding_Name], [Hoarding_Address], [Loaction_Id], [HoardingType_Id], [Hoarding_Height], [Hoarding_Width], [Hoarding_Price]) VALUES (@Hoarding_Name, @Hoarding_Address, @Loaction_Id, @HoardingType_Id, @Hoarding_Height, @Hoarding_Width, @Hoarding_Price)" SelectCommand="SELECT Hoarding.Hoarding_Id, Hoarding.Hoarding_Name, Hoarding.Hoarding_Address, Hoarding.Location_Id, Hoarding.HoardingType_Id, Hoarding.Hoarding_Height, Hoarding.Hoarding_Width, Hoarding.Hoarding_Price, Location.Location_Name, Hoarding_Type.HoardingType_Name, Hoarding.Hoarding_Image FROM Hoarding INNER JOIN Location ON Hoarding.Location_Id = Location.Location_Id INNER JOIN Hoarding_Type ON Hoarding.HoardingType_Id = Hoarding_Type.HoardingType_Id" UpdateCommand="UPDATE [Hoarding] SET [Hoarding_Name] = @Hoarding_Name, [Hoarding_Address] = @Hoarding_Address, [Loaction_Id] = @Loaction_Id, [HoardingType_Id] = @HoardingType_Id, [Hoarding_Height] = @Hoarding_Height, [Hoarding_Width] = @Hoarding_Width, [Hoarding_Price] = @Hoarding_Price WHERE [Hoarding_Id] = @Hoarding_Id">
                                <DeleteParameters>
                                    <asp:Parameter Name="Hoarding_Id" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="Hoarding_Name" Type="String" />
                                    <asp:Parameter Name="Hoarding_Address" Type="String" />
                                    <asp:Parameter Name="Loaction_Id" />
                                    <asp:Parameter Name="HoardingType_Id" Type="Int32" />
                                    <asp:Parameter Name="Hoarding_Height" Type="Int32" />
                                    <asp:Parameter Name="Hoarding_Width" Type="Int32" />
                                    <asp:Parameter Name="Hoarding_Price" Type="Double" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Hoarding_Name" Type="String" />
                                    <asp:Parameter Name="Hoarding_Address" Type="String" />
                                    <asp:Parameter Name="Loaction_Id" />
                                    <asp:Parameter Name="HoardingType_Id" Type="Int32" />
                                    <asp:Parameter Name="Hoarding_Height" Type="Int32" />
                                    <asp:Parameter Name="Hoarding_Width" Type="Int32" />
                                    <asp:Parameter Name="Hoarding_Price" Type="Double" />
                                    <asp:Parameter Name="Hoarding_Id" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <br />
                            <asp:Button ID="btnadd" class="btn btn-primary" runat="server" Text="Add New Hoarding" />

                        </asp:View>
                        <asp:View ID="viewinsert" runat="server">

                            <div class="form-group">
                                <label>Enter Hoarding Name</label>
                                <asp:TextBox ID="txthoardingname" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txthoardingname" runat="server" ErrorMessage="Enter Hoarding Name"></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group">
                                <label>Enter Hoarding Address </label>
                                <asp:TextBox ID="txthoardingaddress" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txthoardingaddress" runat="server" ErrorMessage="Enter Hoarding Address"></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group">
                                <label>Enter Location Name </label>
                                <asp:DropDownList ID="txtlocationid" class="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="Location_Name" DataValueField="Location_Id"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Location_Id], [Location_Name] FROM [Location]"></asp:SqlDataSource>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtlocationid" runat="server" ErrorMessage="Select Location"></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group">
                                <label>Enter Hoarding Type Name </label>
                                <asp:DropDownList ID="txthoardingtypeid" class="form-control" runat="server" DataSourceID="SqlDataSource3" DataTextField="HoardingType_Name" DataValueField="HoardingType_Id"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Hoarding_Type]"></asp:SqlDataSource>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txthoardingtypeid" runat="server" ErrorMessage="Select HoardingType"></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group">
                                <label>Enter Hoarding Height </label>
                                <asp:TextBox ID="txthoardingheight" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txthoardingheight" runat="server" ErrorMessage="Enter Hoarding Height"></asp:RequiredFieldValidator>
                              <!-- <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Please Enter Numerical Height" ControlToValidate="txthoardingheight" MinimumValue="0" MaximumValue="100"></asp:RangeValidator> -->
                            </div>

                            <div class="form-group">
                                <label>Enter Hoarding Width </label>
                                <asp:TextBox ID="txthoardingwidth" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txthoardingwidth" runat="server" ErrorMessage="Enter Hoarding Width"></asp:RequiredFieldValidator>
                               <!-- <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="Please Enter Numerical Width" ControlToValidate="txthoardingwidth" MinimumValue="0" MaximumValue="100"></asp:RangeValidator> -->
                            </div>

                            <div class="form-group">
                                <label>Enter Hoarding Price </label>
                                <asp:TextBox ID="txthoardingprice" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="txthoardingprice" runat="server" ErrorMessage="Enter Hoarding Price"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label>Enter Hoarding Url </label>
                                <asp:Image ID="Image2" runat="server" Height="100px" Width="100px" />
                                <asp:LinkButton ID="LinkButton1" runat="server">Change Image</asp:LinkButton>
                                <asp:FileUpload ID="FileUpload1" class="form-control" runat="server" />
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


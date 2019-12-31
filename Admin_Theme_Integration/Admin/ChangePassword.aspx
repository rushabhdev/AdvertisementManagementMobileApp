<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="false" CodeFile="ChangePassword.aspx.vb" Inherits="Admin_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormTitle" Runat="Server">Change Password
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FormContent" Runat="Server">

    <label>Old Password: </label>
    <div>
       <asp:TextBox TextMode="Password" ID="txtoldpassword" class="form-control" runat="server"></asp:TextBox>
         <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator1" ControlToValidate="txtoldpassword" runat="server" ErrorMessage="Enter Old Password"></asp:RequiredFieldValidator>
    </div>

    <label>New Password: </label>
    <div>
       <asp:TextBox TextMode="Password" ID="txtnewpassword" class="form-control" runat="server"></asp:TextBox>
         <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator2" ControlToValidate="txtnewpassword" runat="server" ErrorMessage="Enter New Password"></asp:RequiredFieldValidator>
    </div>

    <label>Confirm New Password </label>
    <div>
       <asp:TextBox TextMode="Password"  ID="txtconfirmnewpassword" class="form-control" runat="server"></asp:TextBox>
         <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator3" ControlToValidate="txtconfirmnewpassword" runat="server" ErrorMessage="Enter Confirm New Password"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords Don't Match" ControlToValidate="txtconfirmnewpassword" ControlToCompare="txtnewpassword"></asp:CompareValidator>
    </div>

    <asp:Button ID="btnchangepassword" class="btn btn-primary" runat="server" Text="Change Password" />		 
</asp:Content>



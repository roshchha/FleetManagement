<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" MasterPageFile="~/Fleetmanagement.master" Inherits="AddUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">Register a new user</div>
                <div class="panel-body">
                    <p>
                        <asp:Literal runat="server" ID="StatusMessage"/>
                    </p>
                    <div style="margin-bottom: 10px">
                        <asp:Label runat="server" AssociatedControlID="UserName">Email</asp:Label>
                        <div>
                            <asp:TextBox CssClass="form-control" runat="server" ID="TXTEmail" />
                            <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter LastName" ControlToValidate="TXTEmail" InitialValue="" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div style="margin-bottom: 10px">
                        <asp:Label runat="server" AssociatedControlID="UserName">User name</asp:Label>
                        <div>
                            <asp:TextBox CssClass="form-control" runat="server" ID="UserName" />
                            <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter User Name" ControlToValidate="UserName" InitialValue="" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div style="margin-bottom: 10px">
                        <asp:Label runat="server" AssociatedControlID="Password">Password</asp:Label>
                        <div>
                            <asp:TextBox CssClass="form-control" runat="server" ID="Password" TextMode="Password" />
                            <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Password" ControlToValidate="Password" InitialValue="" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div style="margin-bottom: 10px">
                        <asp:Label runat="server" AssociatedControlID="ConfirmPassword">Confirm password</asp:Label>
                        <div>
                            <asp:TextBox CssClass="form-control" runat="server" ID="ConfirmPassword" TextMode="Password" />
                            <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Confirm Password" ControlToValidate="ConfirmPassword" InitialValue="" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:CompareValidator CssClass="errorText" ID="CompareValidator" runat="server" ControlToValidate="ConfirmPassword" ControlToCompare="Password" ErrorMessage="Password & Confirm Password must match!" SetFocusOnError="true"></asp:CompareValidator>
                        </div>
                    </div>
                    <div style="margin-bottom: 10px">
                        <asp:Label runat="server" AssociatedControlID="UserRoles">User Role</asp:Label>
                        <div>
                            <asp:DropDownList CssClass="form-control" ID="UserRoles" runat="server">
                                <asp:ListItem Selected="True" Text="-Select-" Value="-1"></asp:ListItem>
                                <asp:ListItem Text="Super Admin" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Admin" Value="2"></asp:ListItem>
                                 <asp:ListItem Text="Staff" Value="3"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div>
                        <div>
                            <asp:Button CssClass="btn btn-primary" runat="server" OnClick="CreateUser_Click" Text="Register" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</asp:Content>

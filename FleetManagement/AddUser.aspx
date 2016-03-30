<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" MasterPageFile="~/Fleetmanagement.master" Inherits="AddUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">Register a new user</div>
                <div class="panel-body">


                    <p>
                        <asp:Literal runat="server" ID="StatusMessage" />
                    </p>
                    <div style="margin-bottom: 10px">
                        <asp:Label runat="server" AssociatedControlID="UserName">User name</asp:Label>
                        <div>
                            <asp:TextBox CssClass="form-control" runat="server" ID="UserName" />
                        </div>
                    </div>
                    <div style="margin-bottom: 10px">
                        <asp:Label runat="server" AssociatedControlID="Password">Password</asp:Label>
                        <div>
                            <asp:TextBox CssClass="form-control" runat="server" ID="Password" TextMode="Password" />
                        </div>
                    </div>
                    <div style="margin-bottom: 10px">
                        <asp:Label runat="server" AssociatedControlID="ConfirmPassword">Confirm password</asp:Label>
                        <div>
                            <asp:TextBox CssClass="form-control" runat="server" ID="ConfirmPassword" TextMode="Password" />
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

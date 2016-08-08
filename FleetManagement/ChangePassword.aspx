<%@ page title="" language="C#" masterpagefile="~/Fleetmanagement.master" autoeventwireup="true" codebehind="ChangePassword.aspx.cs" inherits="FleetManagement.ChangePassword" %>

<asp:content id="Content1" contentplaceholderid="ContentPlaceHolder1" runat="server">

        <div class="row">
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">Change Password</div>
                <div class="panel-body">
                    <p>
                        <asp:Literal runat="server" ID="StatusMessage"/>
                    </p>
                    <div style="margin-bottom: 10px">
                        <asp:Label runat="server" AssociatedControlID="TXtCurrentPassword">Current Password</asp:Label>
                        <div>
                            <asp:TextBox CssClass="form-control" runat="server" ID="TXtCurrentPassword" />
                        </div>
                    </div>
                    <div style="margin-bottom: 10px">
                        <asp:Label runat="server" AssociatedControlID="TxtNewPassword">New Password</asp:Label>
                        <div>
                            <asp:TextBox CssClass="form-control" runat="server" ID="TxtNewPassword" />
                        </div>
                    </div>
                    <div style="margin-bottom: 10px">
                        <asp:Label runat="server" AssociatedControlID="TxtConfirmPassword">Confirm Password</asp:Label>
                        <div>
                            <asp:TextBox CssClass="form-control" runat="server" ID="TxtConfirmPassword" />
                        </div>
                    </div>
                    <div>
                        <div>
                            <asp:Button ID="Btn_Submit" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="Btn_Submit_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
            </div>
</asp:content>

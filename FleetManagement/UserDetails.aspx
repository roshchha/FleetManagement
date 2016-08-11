<%@ Page Title="" Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="UserDetails.aspx.cs" Inherits="FleetManagement.UserDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h3 class="page-header"></h3>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading"></div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <asp:Repeater ID="UserDetailsRepeater" runat="server" OnItemCommand="UserDetailsRepeater_ItemCommand"
                            OnItemDataBound="UserDetailsRepeater_ItemDataBound">
                            <HeaderTemplate>
                                <table id="UserDetails" class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>UserName</th>
                                        <th>Email</th>
                                        <th>Role</th>
                                        <th>Action</th>
                                    </tr>
                                 </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:Label ID="UserName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "UserName")%>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Email" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Email")%>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlRoles" runat="server"  CssClass="form-control"  />
                                    </td>
                                    <td>
                                        <asp:LinkButton Visible="true" ID="lnkUpdate" runat="server" CommandName="update" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>'>Update</asp:LinkButton>
                                        
                                        <asp:LinkButton ID="lnkDelete" runat="server" CommandName="delete" OnClientClick='javascript:return confirm("Are you sure you want to delete?")'
                                            CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>'>&nbsp;|&nbsp; Delete</asp:LinkButton>
                                        
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                               </tbody>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- DATA TABLE SCRIPTS -->
    <script src="assets/js/dataTables/jquery.dataTables.js"></script>
    <script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#UserDetails').dataTable({
                "bSort": true,
                "bAutoWidth": true,
                "aoColumns": [
                                null,
                                null, //put as many null values as your columns
                                null,
                                null
                ]
            });
        });
    </script>
</asp:Content>

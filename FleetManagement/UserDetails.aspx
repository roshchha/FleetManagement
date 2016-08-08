<%@ page title="" language="C#" masterpagefile="~/Fleetmanagement.master" autoeventwireup="true" codebehind="UserDetails.aspx.cs" inherits="FleetManagement.UserDetails" %>

<asp:content id="Content1" contentplaceholderid="ContentPlaceHolder1" runat="server">
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
                                OnItemDataBound="UserDetailsRepeater_ItemDataBound"
                            >
                            <HeaderTemplate>
                                <table width="500px" border="1px">
                                <tr style="background-color:#fb7700">
                                    <td >Id</td>
                                    <td >UserName</td>
                                    <td >Email</td>
                                    <td >Role</td>
                                    <td>Option</td>
                                </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                            <tr style="background-color:#ffffff">
                            <td >
                                <asp:Label ID="UserID" Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ID") %>'></asp:Label>
                                <asp:Label ID="UserName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "UserName")%>'></asp:Label>
                                <asp:Label ID="Email" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Email")%>'></asp:Label>
                             </td>
                             <td>
                                <asp:DropDownList ID="ddlRoles" runat="server"/>  
                             </td>
                             <td >
                                <asp:LinkButton Visible="false" ID="lnkUpdate" runat="server" CommandName="update" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>'>Update</asp:LinkButton>
                                <asp:LinkButton ID="lnkDelete" runat="server" CommandName="delete" OnClientClick='javascript:return confirm("Are you sure you want to delete?")' 
                                CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>'>Delete</asp:LinkButton>
                            </td>
                            </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                <tr style="background-color:#15880a">
                                <td colspan="5">
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
        //$(document).ready(function () {
        //    $('#ContentPlaceHolder1_grdEmp').dataTable({
        //        "bSort": true,
        //        "bAutoWidth": true,
        //        "aoColumns": [
        //                        null,
        //                        null, //put as many null values as your columns
        //                        null,
        //                        null,
        //                        null,
        //                        null,
        //                        null,
        //                        null


        //        ]
        //    });
        //});
    </script>
</asp:content>

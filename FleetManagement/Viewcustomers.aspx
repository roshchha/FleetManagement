<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="Viewcustomers.aspx.cs" Inherits="Viewcustomers" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                        <asp:GridView ID="grdCustomers" runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" OnRowEditing="grdCustomers_RowEditing" OnRowCancelingEdit="grdCustomers_RowCancelingEdit" OnPreRender="grdCustomers_PreRender" AllowPaging="False" OnPageIndexChanging="grdCustomers_PageIndexChanging" PageSize="10" OnRowDeleting="grdCustomers_RowDeleting">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <input id="HdnCustomerID" type="hidden" value='<%# Eval("ID") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                                <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
                                <asp:BoundField DataField="phone" HeaderText="Contact Number" SortExpression="phone"></asp:BoundField>
                                <asp:BoundField DataField="email" HeaderText="Email Id" SortExpression="emailid" />
                                <asp:CommandField HeaderText="Edit" ShowDeleteButton="True" ShowEditButton="True"
                                    ShowHeader="True" />
                            </Columns>
                        </asp:GridView>

                    </div>
                    <div class="">
                        <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Back" PostBackUrl="~/Home.aspx" />
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
            $('#ContentPlaceHolder1_grdCustomers').dataTable({
                "bSort": true,
                "bAutoWidth": true,
                "aoColumns": [
                                null,
                                null, //put as many null values as your columns
                                null,
                                null,
                                null,
                                null


                ]
            });
        });
    </script>
</asp:Content>


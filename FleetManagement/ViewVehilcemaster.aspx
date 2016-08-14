<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="ViewVehilcemaster.aspx.cs" Inherits="ViewVehilcemaster" %>

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
                        <asp:GridView ID="grdVehiclemaster"  CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" OnPreRender="grdVehiclemaster_PreRender" OnRowEditing="grdVehiclemaster_RowEditing" OnRowCancelingEdit="grdVehiclemaster_RowCancelingEdit" AllowPaging="False" OnPageIndexChanging="grdVehiclemaster_PageIndexChanging" PageSize="10" OnRowDeleting="grdVehiclemaster_RowDeleting">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                         <input id="HdnVehicleID" type="hidden" value='<%# Eval("VehicleID") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="VehicleTypeName" HeaderText="Vehicle" SortExpression="VehicleTypeName" />
                                <asp:BoundField DataField="RegistrationNo" HeaderText="Registration No" SortExpression="RegistrationNo" ReadOnly="true" />
                                <asp:BoundField DataField="FuelTypeName" HeaderText="Fuel" SortExpression="FuelTypeName" />
                                <%--<asp:TemplateField HeaderText="Has AC">
                                    <ItemTemplate>
                                        <%#Boolean.Parse(Eval("AC").ToString()) ? "Yes" : "No" %>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="Purchase Date">
                                    <ItemTemplate>
                                        <%#Eval("PurchaseDate","{0:dd MMM yyyy}") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="noofseating" HeaderText="Seating No" SortExpression="noofseating" />
                                <asp:BoundField DataField="VehicleCost" HeaderText="Vehicle Cost (INR)" SortExpression="VehicleCost" />
                                 <asp:BoundField DataField="InsuranceAmount" HeaderText="Insurance Amount (INR)" SortExpression="InsuranceAmount" />                    
                                <asp:TemplateField HeaderText="Insurance Expiration Date">
                                    <ItemTemplate>
                                        <%#Eval("InsuranceExpirationDate","{0:dd MMM yyyy}") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField HeaderText="Action" ShowDeleteButton="True" ShowEditButton="True"
                                    ShowHeader="True" />
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="">
                            <asp:Button CssClass="btn btn-primary" ID="Button1" runat="server" Text="Back" PostBackUrl="~/Home.aspx" />
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
            $('#ContentPlaceHolder1_grdVehiclemaster').dataTable({
                "bSort": true,
                "bAutoWidth": true,
                "aoColumns": [
                                null,
                                null, //put as many null values as your columns
                                null,
                                null,
                                null,
                                null,
                                null,
                                null,
                                null,
                                null


                ]
            });
        });
    </script>
</asp:Content>


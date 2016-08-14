<%@ Page Title="" Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="VehicletariffView.aspx.cs" Inherits="FleetManagement.VehicleTariffView" %>

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
                        <asp:Repeater ID="RPT_VehicleTariff" runat="server">
                            <HeaderTemplate>
                                <table id="VehicleTariff" class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>Tariff Code</th>                                        
                                        <th>Vehicle Type</th>
                                        <th>AC</th>
                                        <th>Fuel Type</th>
                                        <th>Base Price</th>
                                        <th>KMs</th>
                                        <th>Rate/KM</th>
                                        <th>Rate/Hour</th>
                                        <th>Stand Charges</th>
                                    </tr>
                                 </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:Label ID="Lbl_tariffCode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "TariffCode")%>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Lbl_vehicleType" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "VehicleTypeName")%>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Lbl_AC" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "AcName")%>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Lbl_FuelType" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "FueTypeName")%>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Lbl_BasePrice" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "BasePrice")%>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Lbl_Kms" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Kms")%>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Lbl_RatePerKm" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ExtraKmRate")%>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Lbl_RatePerHour" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ExtraHourRate")%>'></asp:Label>
                                    </td>
                                     <td>
                                        <asp:Label ID="Lbl_StandCharges" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "StandCharges")%>'></asp:Label>
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
            $('#VehicleTariff').dataTable({
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
                                null
                ]
            });
        });
    </script>
</asp:Content>

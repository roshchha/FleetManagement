<%@ Page Title="" Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="AccidentDetailsView.aspx.cs" Inherits="FleetManagement.AccidentDetailsView" %>

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
                        <asp:Repeater ID="RPT_AccidentDetails" runat="server">
                            <HeaderTemplate>
                                <table id="AccidentDetails" class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>Vehicle Number</th>                                        
                                        <th>Employee Name</th>
                                        <th>Date</th>
                                        <th>Location</th>
                                        <th>Description</th>
                                        <th>Damage</th>
                                        <th>Repair Cost</th>
                                    </tr>
                                 </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:Label ID="Lbl_VehicleName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "VehicleNo")%>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Lbl_EmployeeName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EmployeeName")%>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Lbl_Date" runat="server" Text=' <%#Eval("AccidentDate","{0:dd MMM yyyy}") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Lbl_Location" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "AccidentLocation")%>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Lbl_Description" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "AccidentDesc")%>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Lbl_Damage" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Damage")%>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Lbl_RepairCost" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "RepairCost")%>'></asp:Label>
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
            $('#AccidentDetails').dataTable({
                "bSort": true,
                "bAutoWidth": true,
                "aoColumns": [
                                null,
                                null, //put as many null values as your columns
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

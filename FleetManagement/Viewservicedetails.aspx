<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="Viewservicedetails.aspx.cs" Inherits="Viewservicedetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <h3 class="page-header">View Service Details</h3>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading"></div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <asp:GridView ID="grdSevice" CssClass="table table-striped table-bordered table-hover" runat="server" OnPreRender="grdSevice_PreRender" AutoGenerateColumns="False" OnRowEditing="grdSevice_RowEditing" AllowPaging="False" PageSize="10" OnRowDeleting="grdSevice_RowDeleting">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <input id="hdnID" type="hidden" value='<%# Eval("ID") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="VehicleNo" HeaderText="Vehicle No" SortExpression="VehicleNo" />
                                <asp:TemplateField HeaderText="Service Date">
                                    <ItemTemplate>
                                        <%#Eval("SentDate","{0:dd MMM yyyy}") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Next Service Date">
                                    <ItemTemplate>
                                        <%#Eval("NextServiceDate","{0:dd MMM yyyy}") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="MileageReading" HeaderText="Mileage Reading" SortExpression="MileageReading" />
                                <asp:BoundField DataField="ServiceReason" HeaderText="Service Reason" SortExpression="ServiceReason"></asp:BoundField>
                                <asp:BoundField DataField="SpareExpenditure" HeaderText="Spare Expenditure" SortExpression="SpareExpenditure"></asp:BoundField>
                                <asp:BoundField DataField="LabourExpenditure" HeaderText="Labour Expenditure" SortExpression="LabourExpenditure" />

                                <asp:CommandField HeaderText="Edit" ShowDeleteButton="True" ShowEditButton="True"
                                    ShowHeader="True" />
                            </Columns>
                        </asp:GridView>
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
            $('#ContentPlaceHolder1_grdSevice').dataTable({
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


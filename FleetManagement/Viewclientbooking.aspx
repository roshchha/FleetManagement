<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="Viewclientbooking.aspx.cs" Inherits="Viewclientbooking" %>

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
                        <asp:GridView ID="grdClient"  CssClass="table table-striped table-bordered table-hover" runat="server" OnPreRender="grdClient_PreRender" AutoGenerateColumns="False" AllowPaging="False" PageSize="10" >
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <input id="Hidden1" type="hidden" value='<%# Eval("bookingid") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="BookingRef" HeaderText="Booking Reference No" SortExpression="BookingRef" />
                                <asp:TemplateField HeaderText="Booking Date">
                                    <ItemTemplate>
                                        <%#Eval("BookingDate","{0:dd MMM yyyy}") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Phone" HeaderText="Phone No" SortExpression="Phone" />
                                <asp:BoundField DataField="GuestName" HeaderText="Guest Name" SortExpression="GuestName" />
                                <asp:BoundField DataField="PickupPoint" HeaderText="Pickup Point" SortExpression="PickupPoint"></asp:BoundField>
                                <asp:BoundField DataField="droppoint" HeaderText="Drop Point" SortExpression="droppoint"></asp:BoundField>
                                 <asp:TemplateField HeaderText="From Date">
                                    <ItemTemplate>
                                        <%#Eval("FromDate","{0:dd MMM yyyy}") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText ="To Date">
                                    <ItemTemplate>
                                        <%#Eval("ToDate","{0:dd MMM yyyy}") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                               <%-- <asp:CommandField HeaderText="Edit" ShowDeleteButton="True" ShowEditButton="True"
                                    ShowHeader="True" />--%>
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
            $('#ContentPlaceHolder1_grdClient').dataTable({
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


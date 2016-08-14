<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="Employeedetails.aspx.cs" Inherits="Employeedetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <h3 class="page-header">Employee Details</h3>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading"></div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <asp:GridView ID="grdEmp" CssClass="table table-striped table-bordered table-hover" runat="server" OnPreRender="grdEmp_PreRender" AutoGenerateColumns="False" OnRowEditing="grdEmp_RowEditing" OnRowCancelingEdit="grdEmp_RowCancelingEdit" AllowPaging="False" OnPageIndexChanging="grdEmp_PageIndexChanging" PageSize="5" OnRowDeleting="grdEmp_RowDeleting">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <input id="HdnEmpID" type="hidden" value='<%# Eval("EmpId") %>' runat="server" />
                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                                <%--<asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />--%>
                                <asp:BoundField DataField="Designation" HeaderText="Designation" SortExpression="Designation" />
                                <asp:BoundField DataField="Salary" HeaderText="Salary (INR)" SortExpression="Salary" />
                                <asp:TemplateField HeaderText="Joining Date">
                                    <ItemTemplate>
                                        <%#Eval("DateOfJoin","{0:dd MMM yyyy}") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--<asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address"></asp:BoundField>--%>
                                <%--<asp:BoundField DataField="State" HeaderText="State" SortExpression="State"></asp:BoundField>
                                <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country"></asp:BoundField>--%>
                                <asp:BoundField DataField="Phone" HeaderText="Contact Number" SortExpression="Phone"></asp:BoundField>
                                <asp:BoundField DataField="EmailID" HeaderText="Email Address" SortExpression="EmailID" />
                                <asp:CommandField HeaderText="Action" ShowDeleteButton="True" ShowEditButton="True"
                                    ShowHeader="True"  />
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
            $('#ContentPlaceHolder1_grdEmp').dataTable({
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
                                null


                ]
            });
        });
    </script>
     <style type="text/css">
        .table-responsive table tr th:first-child, .table-responsive table tr td:first-child{display:none;}
    </style>
</asp:Content>


<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="Vehiclemaster.aspx.cs" Inherits="Vehiclemaster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


   <div class="row">
         <div class="col-lg-12">
            <h3 class="page-header">Add Vehicle Details</h3>
        </div>
    </div>
    <div  class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading"></div>
                <div class="panel-body"> 
                    <table align="center">
                        <tr>
                            <td colspan="3" align="center">
                                <asp:Label ID="lblMessage" runat="server" Visible="False" CssClass="lblMessage"></asp:Label>
                                <asp:HiddenField ID="HdnVehicleID" runat="server" Value="0" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblVehicletype" runat="server" Text="Vehicle Type"></asp:Label></td>
                            <td>
                                <asp:DropDownList CssClass="form-control" ID="ddlVehicletype" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="ddlVehicletype" InitialValue="Select" SetFocusOnError="True">Select Vehicle Type</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblVehicleNo" runat="server" Text="Vehicle No"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtVehicleNo" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="lblRegno" runat="server" Text="Registration No"></asp:Label></td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtRegno" runat="server"></asp:TextBox></td>
                            <td><asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtRegno" SetFocusOnError="True">Registration no Required</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="lblRegdate" runat="server" Text="Registration Date"></asp:Label></td>
                            <td><asp:TextBox CssClass="form-control" ID="txtRegdate" runat="server"></asp:TextBox></td>
                            <td><asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtRegdate">Date Required</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="lblEngineno" runat="server" Text="Engine Num"></asp:Label></td>
                            <td><asp:TextBox CssClass="form-control" ID="txtEngno" runat="server"></asp:TextBox></td>
                            <td><asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtEngno" SetFocusOnError="True">Engine Num Required</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="lblChasisno" runat="server" Text="Chassis No"></asp:Label></td>
                            <td><asp:TextBox CssClass="form-control" ID="txtChasisno" runat="server"></asp:TextBox></td>
                            <td><asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtChasisno" SetFocusOnError="True">Chasis Num required</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="lblFueltype" runat="server" Text="Fuel Type"></asp:Label></td>
                            <td>
                                <asp:DropDownList CssClass="form-control" ID="ddlFueltype" runat="server">
                                    <asp:ListItem Value="Select">Select</asp:ListItem>
                                    <asp:ListItem>Petrol</asp:ListItem>
                                    <asp:ListItem>Desiel</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td><asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="ddlFueltype" InitialValue="Select" SetFocusOnError="True">Select Fuel</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="lblTankcapacity" runat="server" Text="Tank Capacity in lts"></asp:Label></td>
                            <td><asp:TextBox CssClass="form-control" ID="txtTankcapacity" runat="server"></asp:TextBox></td>
                            <td><asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="txtTankcapacity">Fuel capacity required</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="lblSeating" runat="server" Text="No of Seating"></asp:Label></td>
                            <td><asp:TextBox CssClass="form-control" ID="txtSeating" runat="server"></asp:TextBox></td>
                            <td><asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="txtSeating">Num of Seating required</asp:RequiredFieldValidator></td>
                        </tr>
                        <%--<tr>
                            <td><asp:Label ID="lblAc" runat="server" Text="A/C "></asp:Label></td>
                            <td>
                                <asp:DropDownList CssClass="form-control" ID="ddlAc" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td><asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="ddlAc" InitialValue="Select">Select</asp:RequiredFieldValidator></td>
                        </tr>--%>
                        <tr>
                            <td>
                                <asp:Label ID="lblCost" runat="server" Text="Vehicle Cost" Height="20px" Width="84px"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtVehiclecost" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ControlToValidate="txtVehiclecost" SetFocusOnError="True">Cost Required</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblPurchasedate" runat="server" Text="Purchase Date" Height="20px" Width="95px"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtPurchasedate" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" ControlToValidate="txtPurchasedate" SetFocusOnError="True">Date Required</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <%--<tr>
                        <td>
                            <asp:Label ID="lblPrice" runat="server" Text="Price" Height="20px" Width="84px"></asp:Label>
                        </td>
                        <td>
                        </td>
                        <td></td>
                        </tr>--%>
                        <tr>
                            <td>
                                <asp:Label ID="lblInsurence" runat="server" Text="Insurance Amount" Height="20px" Width="92px"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtInsuranceamt" runat="server"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblExpiredate" runat="server" Text="Insurance Expire date" Height="20px" Width="96px"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtInsuranceexpdate" runat="server"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center">
                                <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" /> &nbsp;
                                <asp:Button ID="btnBack" CssClass="btn btn-primary" runat="server" Text="Back" PostBackUrl="~/Home.aspx" CausesValidation="False" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
     <script type="text/javascript">
         $('#<%=txtPurchasedate.ClientID%>').datepicker();
         $('#<%=txtRegdate.ClientID%>').datepicker();
         $('#<%=txtInsuranceexpdate.ClientID%>').datepicker();
    </script>
</asp:Content>


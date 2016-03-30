<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="Vehicletariff.aspx.cs" Inherits="Vehicletariff" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">Add Vehicle Tariff</h3>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading"></div>
                <div class="panel-body">  
                    <table align="center">
                        <tr>
                            <td colspan="3" align="center">
                                <asp:Label ID="lblMessage" runat="server" Visible="False" CssClass="lblMessage"></asp:Label>&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblVehicletype" runat="server" Text="Vehicle Type"></asp:Label>&nbsp;</td>
                            <td>
                                <asp:DropDownList CssClass="form-control"  ID="ddlVehicletype" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="ddlVehicletype" InitialValue="Select"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <%--<tr>
                        <td><asp:Label ID="lblBaseprice" runat="server" Text="Base Price"></asp:Label>&nbsp;</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"></asp:TextBox></td>
                        <td><asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                        </tr>--%>
                        <tr>
                            <td><asp:Label ID="lblAc" runat="server" Text="A/C"></asp:Label>&nbsp;</td>
                            <td>
                                <asp:DropDownList CssClass="form-control"  ID="ddlAc" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="ddlAc" InitialValue="Select"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                         <tr>
                            <td><asp:Label ID="lblFuelType" runat="server" Text="FuelType"></asp:Label>&nbsp;</td>
                            <td>
                                <asp:DropDownList CssClass="form-control"  ID="ddlFuelType" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="ddlFuelType" InitialValue="Select"></asp:RequiredFieldValidator>
                            </td>
                        </tr>

                        <%--<tr>
                        <td><asp:Label ID="lblPrice" runat="server" Text="Price per Km"></asp:Label>&nbsp;</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server"></asp:TextBox></td>
                        <td><asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator4" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                        </tr>--%>
                        <tr>
                            <td>
                                <asp:Label ID="lblKm1" runat="server" Text="Base Price"></asp:Label>&nbsp;
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtBaseprice" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtBaseprice" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblKm2" runat="server" Text="KM's"></asp:Label>&nbsp;
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtKms" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtKms"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblExtrakm" runat="server" Text="Extra Price/KM"></asp:Label>&nbsp;
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtExtrakm" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtExtrakm"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblExtrahour" runat="server" Text="Extra Price/Hour"></asp:Label>&nbsp;
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtExtrahour" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="txtExtrahour"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="lblStandcharges" runat="server" Text="Stand Charge per Day"></asp:Label>&nbsp;</td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtStandcharges" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="txtStandcharges"></asp:RequiredFieldValidator>

                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <asp:Button CssClass="btn btn-primary" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />&nbsp;
                                <asp:Button CssClass="btn btn-primary" ID="btnBack" runat="server" Text="Back" PostBackUrl="~/Home.aspx" CausesValidation="False" />
                            </td>     
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>






</asp:Content>


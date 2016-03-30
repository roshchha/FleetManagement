<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="Service.aspx.cs" Inherits="Service" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

  
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">Service Log</h3>
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
                                <asp:Label ID="lblVehicleno" runat="server" Text="Vehicle Number" meta:resourcekey="lblFirstNameResource1"></asp:Label>&nbsp;</td>
                            <td>
                                <asp:DropDownList CssClass="form-control" ID="ddlVehicleno" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td style="width: 114px">
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="ddlVehicleno" meta:resourcekey="RequiredFieldValidator1Resource1" SetFocusOnError="True" InitialValue="Select">Select</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblDate" runat="server" Text="Service sent date" meta:resourcekey="lblLastnameResource1"></asp:Label>&nbsp;</td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtServicingdate" runat="server"></asp:TextBox></td>
                            <td style="width: 114px">
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtServicingdate" meta:resourcekey="RequiredFieldValidator2Resource1" SetFocusOnError="True">Date Required</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblMeterreading" runat="server" Text="Meter Reading"></asp:Label>&nbsp;</td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtMeterReading" runat="server" MaxLength="12"></asp:TextBox>
                            </td>
                            <td style="width: 114px">
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtMeterReading" meta:resourcekey="RequiredFieldValidator3Resource1" SetFocusOnError="True"></asp:RequiredFieldValidator>

                                <asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="CompareValidator" ControlToValidate="txtMeterReading" Operator="DataTypeCheck" Type="Integer">Eg:1234567890</asp:CompareValidator>
                            </td>
                        </tr>

                        <tr>
                            <td style="height: 40px">
                                <asp:Label ID="lblReasonforservice" runat="server" Text="Reason for Service" meta:resourcekey="lblDateofjoinResource1"></asp:Label>&nbsp;</td>
                            <td style="height: 40px">
                                <asp:TextBox CssClass="form-control" ID="txtReasonforservice" runat="server" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td style="height: 40px; width: 114px;">
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtReasonforservice" meta:resourcekey="RequiredFieldValidator5Resource1">Reason Required</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblSaparesexpenditure" runat="server" Text="Expenditure on Spares" meta:resourcekey="lblQualificationResource1"></asp:Label>&nbsp;</td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtExpenditureonspares" runat="server" MaxLength="10"></asp:TextBox>
                            </td>
                            <td style="width: 114px">
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="txtExpenditureonspares" meta:resourcekey="RequiredFieldValidator6Resource1"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Eg: 10000" ControlToValidate="txtExpenditureonspares" SetFocusOnError="True" Type="Integer" Operator="DataTypeCheck"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblLabourexpenditure" runat="server" Text="Expenditure on Manpower" meta:resourcekey="lblDateofbirthResource1"></asp:Label>&nbsp;</td>
                            <td>

                                <asp:TextBox CssClass="form-control" ID="txtExpenditureonmanpower" runat="server" MaxLength="8"></asp:TextBox></td>
                            <td style="width: 114px">
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="txtExpenditureonmanpower"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Eg: 10000" ControlToValidate="txtExpenditureonmanpower" Operator="DataTypeCheck" SetFocusOnError="True" Type="Integer"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblDuedate" runat="server" Text="Next Service Date"></asp:Label>&nbsp;</td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtNextservicedate" runat="server"></asp:TextBox></td>
                            <td style="width: 114px">
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="txtNextservicedate" meta:resourcekey="RequiredFieldValidator8Resource1">Date Required</asp:RequiredFieldValidator></td>
                        </tr>

                       
                            <tr>
                                <td colspan="3" align="center">
                                    <asp:Button CssClass="btn btn-primary" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" meta:resourcekey="btnSubmitResource1" />&nbsp;
                                    <asp:Button CssClass="btn btn-primary" ID="btnBack" runat="server" Text="Back" PostBackUrl="~/Home.aspx" CausesValidation="False" meta:resourcekey="btnBackResource1" />
                                </td>
                            </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $('#<%=txtNextservicedate.ClientID%>').datepicker();
        $('#<%=txtServicingdate.ClientID%>').datepicker();
    </script>
</asp:Content>


<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="Accidentdetails.aspx.cs" Inherits="Accidentdetails" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">Add Accident Details</h3>
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
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblVehicleno" runat="server" Text="Vehicle Num" meta:resourcekey="lblFirstNameResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList CssClass="form-control" ID="ddlVehicleno" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="ddlVehicleno" meta:resourcekey="RequiredFieldValidator1Resource1" SetFocusOnError="True" InitialValue="Select">Select</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblAccidentdate" runat="server" Text="Accident Date" meta:resourcekey="lblLastnameResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtAccidentdate" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtAccidentdate" meta:resourcekey="RequiredFieldValidator2Resource1" SetFocusOnError="True">Date Required</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblAccidentlocation" runat="server" Text="Accident Location" meta:resourcekey="lblDesignationResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtAccidentlocation" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtAccidentlocation" meta:resourcekey="RequiredFieldValidator3Resource1" SetFocusOnError="True">Location required</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblAccidentdetails" runat="server" Text="Accident Details" meta:resourcekey="lblSaleryResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtAccidentdetails" runat="server" ></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtAccidentdetails" meta:resourcekey="RequiredFieldValidator4Resource1">Accident details required</asp:RequiredFieldValidator>
                            &nbsp;<%--<asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtSalery" MaximumValue="9" MinimumValue="0" Type="Integer"></asp:RangeValidator>--%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblNatureofdamage" runat="server" Text="Nature of Damage" meta:resourcekey="lblDateofjoinResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtNatureofdamage" runat="server" TextMode="MultiLine"></asp:TextBox>
                           </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtNatureofdamage" meta:resourcekey="RequiredFieldValidator5Resource1">Specify damage</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblEstimatedcostofrepair" runat="server" Text="Estimated Cost of Repair" meta:resourcekey="lblQualificationResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtEstimatedcostofrepair" runat="server" MaxLength="10"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="txtEstimatedcostofrepair" meta:resourcekey="RequiredFieldValidator6Resource1">Field can't be blank</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblDrivername" runat="server" Text="Driver Name" meta:resourcekey="lblDateofbirthResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList CssClass="form-control" ID="ddlDrivername" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="ddlDrivername" InitialValue="Select">Select</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center">
                                <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" meta:resourcekey="btnSubmitResource1" />&nbsp;
                                <asp:Button ID="btnBack" CssClass="btn btn-primary" runat="server" Text="Back" PostBackUrl="~/Home.aspx" CausesValidation="False" meta:resourcekey="btnBackResource1" />
                            </td>  
                        </tr>
                    </table> 
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $('#<%=txtAccidentdate.ClientID%>').datepicker();
    </script>
</asp:Content>


<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="BillingDetails.aspx.cs" Inherits="BillingDetails" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
  <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">Billing Details</h3>
        </div>
    </div>
    <div  class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading"></div>
                <div class="panel-body">
                    <table align="center">
                        <tr>
                            <td>
                                <asp:Label ID="lblBookingRef" Text="Booking Reference" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlBookingRef" runat="server" AutoPostBack="true" />
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="ddlBookingRef" InitialValue="Select" SetFocusOnError="True" ValidationGroup="first">Select</asp:RequiredFieldValidator>
                            </td>
                        </tr>             
                        <tr>
                            <td><asp:Label ID="lblCustomername" runat="server" Text="Customer Name"></asp:Label>&nbsp;</td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtCustomername" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td style="width: 209px"><%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>--%></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblPhoneno" runat="server" Text="Phone no"></asp:Label>&nbsp;
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtPhoneno" runat="server" ReadOnly="True" MaxLength="12"></asp:TextBox>
                            </td>
                            <td></td>
                        </tr>
                    </table>
                </div>
                <div class="panel-heading">Pickup Details</div>
                <div class="panel-body">
                    <table align="center">
                         <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="Client Arrival Date"></asp:Label>&nbsp;   
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtFromdate" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td style="width: 209px">
                                <%--<table>
                                <tr valign="middle">
                                <td>
                                    <asp:Label ID="lblTime" runat="server" Text="Time"></asp:Label>&nbsp;:
                                </td>
                                <td>
                                    <asp:ListBox ID="ListBox1" runat="server" Rows="1"></asp:ListBox></td>
                                </tr>
                                </table>--%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblTodate" runat="server" Text="Client Exit Date"></asp:Label>&nbsp;
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtTodate" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td style="width: 209px">
                                   <%-- <table>
                                <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text="Time"></asp:Label>&nbsp;:
                                </td>
                                <td>
                                    <asp:DropDownList CssClass="form-control" ID="DropDownList2" runat="server">
                                    </asp:DropDownList></td>
                                </tr>
                                </table>--%>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="panel-heading">Vehicle Details</div>
                <div class="panel-body">
                    <table align="center">
                        <tr>
                            <td>
                                <asp:Label ID="lblVehicletype" runat="server" Text="Vehicle Type"></asp:Label>&nbsp;
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtVehicletype" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td style="width: 209px"></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblVehicleno" runat="server" Text="Vehicle No"></asp:Label>&nbsp;
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtVehicleno" runat="server" ReadOnly="True" MaxLength="12"></asp:TextBox>
                            </td>
                            <td style="width: 209px"></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblDriver" runat="server" Text="Driver"></asp:Label>&nbsp;
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtDriver" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                                

                        <tr>
                            <td><asp:Label ID="lblMeterreading" runat="server" Text="Meter Reading"></asp:Label>&nbsp;</td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtOutmeterreading" runat="server"></asp:TextBox></td>
                            <td style="width: 209px">
                                <%--<asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="*" ControlToCompare="txtInmeterreading" ControlToValidate="txtOutmeterreading" Operator="LessThan"></asp:CompareValidator>--%>
                            </td>
                        </tr>     
                       

                        <tr>
                            <td><asp:Label ID="lblInmeterreading" runat="server" Text="In Meter Reading"></asp:Label>&nbsp;</td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtInmeterreading" runat="server" AutoPostBack="True" OnTextChanged="txtInmeterreading_TextChanged" CausesValidation="True"></asp:TextBox></td>
                            <td style="width: 209px"><%--<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>--%>
                                <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="In Meter reading should be greater than out meter reading" ControlToCompare="txtOutmeterreading" ControlToValidate="txtInmeterreading" Operator="GreaterThan" SetFocusOnError="True" ValueToCompare="second" Width="213px"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblTariffcode" runat="server" Text="Total Amount"></asp:Label>&nbsp;
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtTariffcode" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td style="width: 209px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtTariffcode" ValidationGroup="first"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                             <td colspan="3" align="center">
                                <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" ValidationGroup="first" />&nbsp;
                                <asp:Button ID="btnBack" CssClass="btn btn-primary" runat="server" Text="Back" PostBackUrl="~/Home.aspx" />
                            </td>  
                        </tr>
                        <tr>
                            <td colspan="3" align="center">
                                <asp:Label ID="lblMessage" runat="server" Visible="False" CssClass="lblMessage"></asp:Label>&nbsp;
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $('#<%=txtFromdate.ClientID%>').datepicker();
        $('#<%=txtTodate.ClientID%>').datepicker();
    </script>
</asp:Content>


<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="VehicleAllocation.aspx.cs" Inherits="VehicleAllocation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">Vehicle Allocation</h3>
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
                                <asp:Label ID="lblMessage" runat="server" Visible="False" CssClass="lblMessage"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblBookingid" runat="server" Text="Booking Id"></asp:Label></td>
                            <td>
                                <asp:DropDownList CssClass="form-control" ID="ddlBookingid" runat="server" AutoPostBack="True">
                                    <asp:ListItem>Select</asp:ListItem>
                                </asp:DropDownList></td>
                            <td>
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Select ID" ControlToValidate="ddlBookingid" InitialValue="Select" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="height: 26px">Customer Name</td>
                            <td style="height: 26px">
                                <asp:TextBox CssClass="form-control" ID="txtCustomername" runat="server" ReadOnly="True"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblVehicletype" runat="server" Text="Vehicle Type"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtVehicletype" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblVehicleno" runat="server" Text="Vehicle No"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtVehicleno" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtVehicleno" SetFocusOnError="True">Vehicle no required</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblDutyslipno" runat="server" Text="Duty Slip No"></asp:Label></td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtDutyslipno" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblDutyslipdate" runat="server" Text="Duty Slip date"></asp:Label></td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtDutyslipdate" runat="server" ReadOnly="True"></asp:TextBox></td>
                        </tr>
                        <%--<tr>
                    <td>
                        <asp:Label ID="lblPassengers" runat="server" Text="Passengers"></asp:Label></td>
                    <td>
                        <asp:TextBox CssClass="form-control" ID="txtPassengers" runat="server"></asp:TextBox></td>
                    </tr>--%>
                        <tr>
                            <td style="height: 26px">
                                <asp:Label ID="lblGuestname" runat="server" Text="Guest Name"></asp:Label></td>
                            <td style="height: 26px">
                                <asp:TextBox CssClass="form-control" ID="txtGuestname" runat="server" ReadOnly="True"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="height: 26px">
                                <asp:Label ID="lblAddress" runat="server" Text="Pickup Address"></asp:Label></td>
                            <td style="height: 26px">
                                <asp:TextBox CssClass="form-control" ID="txtAddress" runat="server" ReadOnly="True"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblPhoneno" runat="server" Text="Phone No"></asp:Label></td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtPhoneno" runat="server" ReadOnly="True"></asp:TextBox></td>
                        </tr>
                        <%--<tr>
                    <td>
                        <asp:Label ID="lblDriverallot" runat="server" Text="Driver Allocated"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox CssClass="form-control" ID="txtDriverallot" runat="server"></asp:TextBox>
                    </td>
                    </tr>--%>

                        <tr>
                            <td>
                                <asp:Label ID="lblDriver" runat="server" Text="Driver name"></asp:Label></td>
                            <td>
                                <asp:DropDownList CssClass="form-control" ID="ddlDriver" runat="server">
                                </asp:DropDownList></td>
                            <td>
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="ddlDriver" InitialValue="Select">Select Driver</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <asp:Button CssClass="btn btn-primary" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click1" />&nbsp;
                                <asp:Button CssClass="btn btn-primary" ID="btnBack" runat="server" Text="Back" PostBackUrl="~/Home.aspx" CausesValidation="False" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>

</asp:Content>


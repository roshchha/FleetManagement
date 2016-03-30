<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="Clientbooking.aspx.cs" Inherits="Clientbooking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">Customer Booking</h3>
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
                            <td style="width: 146px">
                                <asp:Label ID="lblCustomername" runat="server" Text="Customer Name"></asp:Label></td>
                            <td>
                                <asp:DropDownList CssClass="form-control" ID="ddlCustomername" runat="server"></asp:DropDownList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="ddlCustomername" SetFocusOnError="True" InitialValue="Select">Name Reqiured</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 146px">
                                <asp:Label ID="lblVehicletype" runat="server" Text="Vehicle Type"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList CssClass="form-control" ID="ddlVehicletype" runat="server"></asp:DropDownList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="ddlVehicletype" InitialValue="Select">Select Vehicle</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                         <tr>
                            <td><asp:Label ID="lblFueltype" runat="server" Text="Fuel Type"></asp:Label></td>
                            <td>
                                <asp:DropDownList CssClass="form-control" ID="ddlFueltype" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td><asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" ControlToValidate="ddlFueltype" InitialValue="Select" SetFocusOnError="True">Select Fuel</asp:RequiredFieldValidator></td>
                        </tr>
                         <tr>
                            <td><asp:Label ID="lblAc" runat="server" Text="A/C "></asp:Label></td>
                            <td>
                                <asp:DropDownList CssClass="form-control" ID="ddlAc" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td><asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" ControlToValidate="ddlAc" InitialValue="Select">Select</asp:RequiredFieldValidator></td>
                        </tr>
                         <tr>
                            <td><asp:Label ID="lblNoOfSeating" runat="server" Text="NoOfSeating "></asp:Label></td>
                            <td>
                                <asp:DropDownList CssClass="form-control" ID="ddlNoOfSeating" runat="server">
                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                    <asp:ListItem Value="4">4</asp:ListItem>
                                    <asp:ListItem Value="4">5</asp:ListItem>
                                    <asp:ListItem Value="4">8</asp:ListItem>
                                    <asp:ListItem Value="4">9</asp:ListItem>
                                    <asp:ListItem Value="4">10</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td><asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="ddlNoOfSeating" InitialValue="Select">Select</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 146px">
                                <asp:Label ID="lblPhoneno" runat="server" Text="Phone No"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtPhoneno" runat="server" MaxLength="13"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtPhoneno"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtPhoneno" SetFocusOnError="True" ValidationExpression="^([0-9]( |-)?)?(\(?[0-9]{3}\)?|[0-9]{3})( |-)?([0-9]{3}( |-)?[0-9]{4}|[a-zA-Z0-9]{7})$">Eg: 9885098850</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                             <td style="width: 146px">
                                <asp:Label ID="lblDriverNeeded" runat="server" Text="Driver Needed"></asp:Label>
                            </td>
                            <td>
                              <asp:CheckBox ID="chkDriverNeeded" runat="server" />
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="panel-heading">Pick-Up Details</div>
                <div class="panel-body">
                    <table align="center">
                        <tr>
                            <td style="width: 146px">
                                <asp:Label ID="lblGuestname" runat="server" Text="Guest Name"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtGuestname" runat="server"></asp:TextBox></td>
                            <td>
                            <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtGuestname" SetFocusOnError="True">Name Required</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 146px">
                                <asp:Label ID="lblPickuppoint" runat="server" Text="Pickup Address"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtPickup" runat="server" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="txtPickup" SetFocusOnError="True">Pickup Address Required</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 146px">
                                <asp:Label ID="lblDroppoint" runat="server" Text="Drop Address"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtDroppoint" runat="server" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="txtDroppoint" SetFocusOnError="True">Address Required</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 146px">
                                <asp:Label ID="lblFromdate" runat="server" Text="From Date"></asp:Label>    
                            </td>
                            <td>     
                                <asp:TextBox ID="txtFromdate" CssClass="form-control" runat="server"></asp:TextBox>      
                            </td>
                            <td valign="bottom">
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="txtFromdate">Date Required</asp:RequiredFieldValidator>&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 146px">
                                <asp:Label ID="lblTodate" runat="server" Text="To date"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtTodate" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="txtTodate">Date Required</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center">
                                <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnBack" CssClass="btn btn-primary" runat="server" Text="Back" OnClick="btnBack_Click" CausesValidation="False" />
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


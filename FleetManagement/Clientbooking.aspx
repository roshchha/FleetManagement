<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="Clientbooking.aspx.cs" Inherits="Clientbooking" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<%--<table align="center">
<tr>
<td colspan="3">
 <h4>Booking Form....</h4> 
</td>
</tr>
<br />
<br />
<tr bgcolor="#598400">
                        <td height="20" colspan="3" bgcolor="#FFFFCC" class="tx1">» Personal Information</td>

                      </tr>

<tr>
<td>
    <asp:Label ID="lblName" runat="server" Text="Fist Name"></asp:Label></td>
    <td>
        <asp:TextBox ID="txtFN" runat="server"></asp:TextBox>
</td>
<td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator></td>
</tr>
<tr>
<td><asp:Label ID="lblLastname" runat="server" Text="Last Name"></asp:Label></td>
<td>
    <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox></td>
<td><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator></td>
</tr>
<tr>
<td><asp:Label ID="lblAdress" runat="server" Text="Adress"></asp:Label></td>
<td>
    <asp:TextBox ID="txtAdress" runat="server"></asp:TextBox></td>
<td><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator></td>
</tr>

<tr>
<td><asp:Label ID="lblCountry" runat="server" Text="Country"></asp:Label></td>
<td>
    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
<td><asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator></td>
</tr>
<tr>
<td><asp:Label ID="lblPhone" runat="server" Text="Telephone"></asp:Label></td>
<td>
    <asp:TextBox ID="txtTelephone" runat="server"></asp:TextBox></td>
<td><asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator></td>
</tr>
<tr>
<td><asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label></td>
<td>
    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
<td><asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator></td>
</tr>
<tr bgcolor="#598400">
                        <td height="20" colspan="3" bgcolor="#FFFFCC" class="tx1">» Details of Journey</td>
                      </tr>

</table>--%>

   <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">Customer Booking</h3>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">Personal Information</div>
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
                                <%--<asp:TextBox ID="txtCustomername" runat="server"></asp:TextBox>--%>
                                <asp:DropDownList CssClass="form-control" ID="ddlCustomername" runat="server"></asp:DropDownList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="ddlCustomername" SetFocusOnError="True" InitialValue="Select">Name Reqiured</asp:RequiredFieldValidator>
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
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="ddlVehicletype" InitialValue="Select">Select Vehicle</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 146px">
                                <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtAddress">Address Required</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 146px">
                                <asp:Label ID="lblPhoneno" runat="server" Text="Phone No"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtPhoneno" runat="server" MaxLength="13"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtPhoneno"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtPhoneno" SetFocusOnError="True" ValidationExpression="^([0-9]( |-)?)?(\(?[0-9]{3}\)?|[0-9]{3})( |-)?([0-9]{3}( |-)?[0-9]{4}|[a-zA-Z0-9]{7})$">Eg: 9885098850</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 146px">
                                <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>&nbsp;
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtEmail" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Eg: proj@g.com</asp:RegularExpressionValidator>
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
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtGuestname" SetFocusOnError="True">Name Required</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 146px">
                                <asp:Label ID="lblPickuppoint" runat="server" Text="Pickup Address"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtPickup" runat="server" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="txtPickup" SetFocusOnError="True">Pickup Address Required</asp:RequiredFieldValidator>
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
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="txtDroppoint" SetFocusOnError="True">Address Required</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 146px">
                                <asp:Label ID="lblFromdate" runat="server" Text="From Date"></asp:Label>    
                            </td>
                            <td>     
                                <asp:TextBox ID="txtFromdate" CssClass="form-control" onclick="ds_sh(this)" onfocus="ds_sh(this)" runat="server"></asp:TextBox>      
                            </td>
                            <td valign="bottom">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="txtFromdate">Date Required</asp:RequiredFieldValidator>&nbsp;
<%--<table>
<tr>
<td>
    <asp:Label ID="lblTime" runat="server" Text="Time"></asp:Label>:
</td>
<td>
    <asp:ListBox ID="ListBox1" runat="server" Rows="1"></asp:ListBox></td>
</tr>
</table>--%>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 146px">
                                <asp:Label ID="lblTodate" runat="server" Text="To date"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtTodate" onclick="ds_sh(this)" onfocus="ds_sh(this)" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="txtTodate">Date Required</asp:RequiredFieldValidator>
    <%--<table>
<tr>
<td>
    <asp:Label ID="Label1" runat="server" Text="Time"></asp:Label>:
</td>
<td>
    <asp:DropDownList ID="DropDownList2" runat="server">
    </asp:DropDownList></td>
</tr>

</table>--%>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center">
                                <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnBack" CssClass="btn btn-primary" runat="server" Text="Back" OnClick="btnBack_Click" CausesValidation="False" />
                            </td>
                        </tr>
<%--<tr>
<td >
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
</td>
</tr>--%>
<%--<tr bgcolor="#598400">
                        <td height="20" colspan="3" bgcolor="#FFFFCC" class="tx1">
                            &nbsp;Vehicle Details</td>

                      </tr>
                 <tr>
<td>
    <asp:Label ID="lblGarageoutdate" runat="server" Text="Garage out Date"></asp:Label>
</td>
<td>
    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
</td>
<td></td>
</tr>
<tr>
<td><asp:Label ID="lblGarageouttime" runat="server" Text="Garage out Time"></asp:Label></td>
<td>
    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox></td>
<td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator></td>
</tr>
<tr>
<td><asp:Label ID="lblMeterreading" runat="server" Text="Meter Reading"></asp:Label></td>
<td>
    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox></td>
<td><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator></td>
</tr>     --%>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="Vehicletariff.aspx.cs" Inherits="Vehicletariff" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table align="center">
<tr>
<td colspan="3" align="center"><h3>Add Vehicle Tariff</h3></td>
</tr>
<tr>
<td colspan="3" align="center">
<asp:Label ID="lblMessage" runat="server" Visible="False" CssClass="lblMessage"></asp:Label>
</td>
</tr>
<tr>
<td>
    <asp:Label ID="lblVehicletype" runat="server" Text="Vehicle Type"></asp:Label></td>
    <td>
        <asp:DropDownList ID="ddlVehicletype" runat="server">
        </asp:DropDownList>
</td>
<td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="ddlVehicletype" InitialValue="Select"></asp:RequiredFieldValidator>
    </td>
</tr>
<%--<tr>
<td><asp:Label ID="lblBaseprice" runat="server" Text="Base Price"></asp:Label></td>
<td>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
<td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator></td>
</tr>--%>
<tr>
<td><asp:Label ID="lblAc" runat="server" Text="A/C"></asp:Label></td>
<td>
    <asp:DropDownList ID="ddlAc" runat="server">
        <asp:ListItem>Select</asp:ListItem>
        <asp:ListItem>Yes</asp:ListItem>
        <asp:ListItem>No</asp:ListItem>
    </asp:DropDownList></td>
<td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="ddlAc" InitialValue="Select"></asp:RequiredFieldValidator></td>
</tr>

<%--<tr>
<td><asp:Label ID="lblPrice" runat="server" Text="Price per Km"></asp:Label></td>
<td>
    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
<td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator></td>
</tr>--%>

<tr>
<td>
    <asp:Label ID="lblKm1" runat="server" Text="Base Price"></asp:Label></td>
<td>
    <asp:TextBox ID="txtBaseprice" runat="server"></asp:TextBox></td>
<td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtBaseprice" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
</tr>
<tr>
<td>
    <asp:Label ID="lblKm2" runat="server" Text="KM's"></asp:Label></td>
<td>
    <asp:TextBox ID="txtKms" runat="server"></asp:TextBox></td>
<td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtKms"></asp:RequiredFieldValidator></td>
</tr>
<tr>
<td>
    <asp:Label ID="lblExtrakm" runat="server" Text="Extra Price/KM"></asp:Label></td>
<td>
    <asp:TextBox ID="txtExtrakm" runat="server"></asp:TextBox></td>
<td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtExtrakm"></asp:RequiredFieldValidator></td>
</tr>
<tr>
<td>
    <asp:Label ID="lblExtrahour" runat="server" Text="Extra Price/Hour"></asp:Label>
</td>
<td>
    <asp:TextBox ID="txtExtrahour" runat="server"></asp:TextBox></td>
<td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="txtExtrahour"></asp:RequiredFieldValidator></td>
</tr>
<tr>
<td><asp:Label ID="lblStandcharges" runat="server" Text="Stand Charge per Day"></asp:Label></td>
<td>
    <asp:TextBox ID="txtStandcharges" runat="server"></asp:TextBox></td>
<td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="txtStandcharges"></asp:RequiredFieldValidator></td>
</tr>
<tr>
<td colspan="2" align="center">
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />&nbsp;
    <asp:Button ID="btnBack" runat="server" Text="Back" PostBackUrl="~/Home.aspx" CausesValidation="False" />
    </td>     
</tr>
</table>


</asp:Content>


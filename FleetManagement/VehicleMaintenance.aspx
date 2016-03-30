<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="VehicleMaintenance.aspx.cs" Inherits="VehicleMaintenance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<%--<script>
function th(t)
{
   var elem=document.getElementById("<%= txtServiceforkms.ClientID%>");
    alert(elem.innerHTML);
    
}
</script>--%>

<table width=95%>
<tr><td colspan="2" align="center"><h3>Vehicle Maintenance</h3></td></tr>
<tr>
<td colspan="2" align="center" style="height: 21px">
<asp:Label ID="lblMessage" runat="server" Visible="False" CssClass="lblMessage"></asp:Label>
</td>
</tr>
<tr>
<td align="center" >
<asp:Label ID="lblVehicletype" runat="server" Text="Vehicle type"></asp:Label>
       &nbsp;
    <asp:DropDownList ID="ddlVehicletype" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlVehicletype_SelectedIndexChanged">
    </asp:DropDownList>
    &nbsp;&nbsp;
    <asp:Label ID="lblVehicleno" runat="server" Text="Vehicle no"></asp:Label>
       &nbsp;
    <asp:DropDownList ID="ddlVehicleno" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlVehicleno_SelectedIndexChanged">
    </asp:DropDownList>
    &nbsp;&nbsp;
        <asp:Label ID="lblDate" runat="server" Text="Date"></asp:Label>
        &nbsp;
        <asp:TextBox ID="txtDate" runat="server"></asp:TextBox></td>
</tr>
<%--<tr>
<td colspan="2">
<fieldset>
<legend><i>Fuel Purchase Record</i></legend>
<table width=95%>
<tr>
<td>
<table>
<tr>
<td>
 <asp:Label ID="lblThismeterreading" runat="server" Text="Meter Reading Now"></asp:Label>
</td>
<td>
<asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td>
 <asp:Label ID="lblLastmeterreading" runat="server" Text="Last Meter Reading"></asp:Label>
</td>
<td>
<asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td>
 <asp:Label ID="lblTotalKms" runat="server" Text="Km's Driven"></asp:Label>
</td>
<td>
<asp:TextBox ID="TextBox3" runat="server" ReadOnly="True"></asp:TextBox>
</td>
</tr>
</table>
   
</td>
<td>
<table>
<tr>
<td>
    <asp:Label ID="lblFuelprice" runat="server" Text="Fuel Price/Lit"></asp:Label>
</td>
<td>
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
</tr>
<tr>
<td>
    <asp:Label ID="lblPurchase" runat="server" Text="Purchase"></asp:Label>
</td>
<td>
    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td>
    <asp:Label ID="Label2" runat="server" Text="Liters"></asp:Label></td>
<td>
    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
</tr>
<tr>
<td  colspan="2">
<b>Km's/Liter</b>
</td>
</tr>
<tr>
<td>
    <asp:Label ID="lblThistank" runat="server" Text="This tank"></asp:Label></td>
<td>
    <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox></td>
</tr>
<tr>
<td>
    <asp:Label ID="lblAccumulated" runat="server" Text="Accumulated"></asp:Label></td>
<td>
    <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox></td>
</tr>
</table>
    </td>
</tr>

</table>
</fieldset>
</td>
</tr>--%>
<tr>
<td colspan="2">
<fieldset>
<legend>
<i>Service</i>
</legend>
<table width=95%>
<tr>
<td>
<table >
<tr>
<td>
    <asp:Label ID="lblPerformed" runat="server" Text="Service has to be performed for every__kms"></asp:Label></td>
<td>
    <asp:TextBox ID="txtServiceforkms" runat="server" OnTextChanged="txtServiceforkms_TextChanged" AutoPostBack="True"></asp:TextBox></td>
</tr>
<tr>
<td>
    <asp:Label ID="lblLastperformed" runat="server" Text="Performed at"></asp:Label></td>
<td>
    <asp:TextBox ID="txtLastservice" runat="server" ></asp:TextBox></td>
</tr>
<tr>
<td style="height: 26px">
    <asp:Label ID="lblTobeperformed" runat="server" Text="Next service has to be performed at"></asp:Label></td>
<td style="height: 26px">
    <asp:TextBox ID="txtServiceat" runat="server" AutoPostBack="True" onfocus=this(t);></asp:TextBox></td>
</tr>
</table>
</td>
<td>
<table>
<tr>
<td align=right>
    <asp:Label ID="lblLastfuelpurchase" runat="server" Text="To be performed at every/Months"></asp:Label>
</td>
<td>
    <asp:TextBox ID="txtServiceformonths" runat="server"></asp:TextBox></td>
</tr>
<tr>
<td>
    <asp:Label ID="lblSincekms" runat="server" Text="Last performed at which date"></asp:Label>

</td>
<td>
    <asp:TextBox ID="txtServiceddate" runat="server"></asp:TextBox></td>
</tr>
<tr>
<td>
    <asp:Label ID="Label2" runat="server" Text="To be performed at"></asp:Label>
</td>
<td>
    <asp:TextBox ID="txtServicedate" runat="server"></asp:TextBox></td>
</tr>
</table>
</td>
</tr>
<tr>
 <td colspan="2" align="center" style="height: 26px">
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />&nbsp;
    <asp:Button ID="btnBack" runat="server" Text="Back" PostBackUrl="~/Home.aspx" />
    </td>  
    </tr>
</table>

</fieldset>
</td>
</tr>
</table>

</asp:Content>


<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="Reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<table align=center width=50%>
<tr>
<td width=50%>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Employeerpt.aspx">Employees Details</asp:HyperLink>
</td>
<td width=50%>
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Vehiclemasterrpt.aspx">Vehicle Details</asp:HyperLink>
</td>
</tr>
<tr>
<td>
    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Billingdetailsrpt.aspx">Billing Details</asp:HyperLink>
</td>
<td>
    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Accidentdetailrpt.aspx">Accident Details</asp:HyperLink>
</td>
</tr>
<tr>
<td>
<asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Servicedetailsrpt.aspx">Service Details</asp:HyperLink>
</td>
<td>
<asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/Customersrpt.aspx">Customer Details</asp:HyperLink>
</td>
</tr>
<tr>
<td colspan="2" align="center">
    <asp:Button ID="Button1" runat="server" Text="Back to home" PostBackUrl="~/Home.aspx" />
</td>
</tr>
</table>

</asp:Content>


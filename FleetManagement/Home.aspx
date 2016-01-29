<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Home" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table align="center" width="70%">
<tr>
<td valign="middle" align="center">
<table>
<tr>
<td align="left">
<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Employees.aspx">Add Employees</asp:HyperLink>&nbsp;
</td>
</tr>
<tr>
<td align="left">
<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/vehecletype.aspx">Add Vehicle Type</asp:HyperLink>
    
</td>
</tr>
<tr>
<td align="left">
    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Vehiclemaster.aspx">Add Vehicle Details</asp:HyperLink>
</td>
</tr>
<tr>
<td align="left">
    <asp:HyperLink id="hlVehicletariffs" runat="server" NavigateUrl="~/Vehicletariff.aspx">Add Vehicle Tariffs</asp:HyperLink>
</td>
</tr>
<tr>
<td align="left">
    <asp:HyperLink id="HyperLink9" runat="server" NavigateUrl="~/customers.aspx">Add Customers</asp:HyperLink>
</td>
</tr>
<tr>
<td align="left">
   <asp:HyperLink id="hlCustomerbooking" runat="server" NavigateUrl="~/Clientbooking.aspx">Customer Booking</asp:HyperLink>
</td>
</tr>
<tr>
<td align="left">
<asp:HyperLink id="hlVehicleallocation" runat="server" NavigateUrl="~/VehicleAllocation.aspx">Vehicle Allocation</asp:HyperLink>

</td>
</tr>
<tr>
<td align="left">
<asp:HyperLink ID="hlBillingdetails" runat="server" NavigateUrl="~/BillingDetails.aspx">Billing Details</asp:HyperLink>
    
</td>
</tr>
<tr>
<td align="left">
<asp:HyperLink ID="hlVehicleservice" runat="server" NavigateUrl="~/Service.aspx">Add Service Details</asp:HyperLink>&nbsp;
</td>
</tr>
<tr>
<td align="left">
<asp:HyperLink ID="hlAccident" runat="server" NavigateUrl="~/Accidentdetails.aspx">Add Accident Details</asp:HyperLink>&nbsp;
</td>
</tr>
</table>
</td>
<td width=70%>
<table>
<tr>
<td colspan="2" style="text-align: justify">
Fleet-Cab has been specifically designed keeping in mind the requirements of a cab operator. A cab operator operates in a service industry, which requires high standards of efficiency to be successful. A cab operator provides vehicles on hire to customers and bills them according to the tariff card. The key success factors in this business are quality of service, condition of the vehicle, competitive pricing, customer-interface etc. A cab operator has to keep tight control over these factors to be competitive and remain profitable. 
<br />
</td>
</tr>
<tr>
<td>
<asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Reports.aspx">View Reports</asp:HyperLink>
</td>
<td>
<asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/Employeedetails.aspx">View Employee Details</asp:HyperLink>
</td>
</tr>
<tr>
<td>
<asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/ViewVehilcemaster.aspx">View Vehicle Details</asp:HyperLink>
</td>
<td>
<asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/Viewclientbooking.aspx">View Customer Booking Details</asp:HyperLink>
</td>
</tr>
<tr>
<td>
<asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/Viewcustomers.aspx">View Customers</asp:HyperLink>
</td>
<td>
<%--<asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="~/Viewclientbooking.aspx">View Customer Booking Details</asp:HyperLink>--%>
</td>
</tr>
</table>    
</td>
</tr>
</table>
</asp:Content>


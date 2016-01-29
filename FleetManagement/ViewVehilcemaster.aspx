<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="ViewVehilcemaster.aspx.cs" Inherits="ViewVehilcemaster" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table align="center">
<tr>
<td>
 <asp:GridView ID="grdVehiclemaster" runat="server" AutoGenerateColumns="False" OnRowEditing="grdVehiclemaster_RowEditing" OnRowUpdating="grdVehiclemaster_RowUpdating" OnRowCancelingEdit="grdVehiclemaster_RowCancelingEdit" AllowPaging="True" OnPageIndexChanging="grdVehiclemaster_PageIndexChanging" PageSize="5" OnRowDeleting="grdVehiclemaster_RowDeleting" >
     <Columns>
    
   
         <asp:BoundField DataField="vehicletype" HeaderText="Vehicle" SortExpression="vehicletype" />
         <asp:BoundField DataField="regno" HeaderText="Registration No" SortExpression="regno"  ReadOnly="true"/>
         <asp:BoundField DataField="fueltype" HeaderText="Fuel" SortExpression="fueltype" />
         <asp:BoundField DataField="purchasedate" HeaderText="Purchased Date" SortExpression="purchasedate" />
         <asp:BoundField DataField="noofseating" HeaderText="Seating No" SortExpression="noofseating" />
         <asp:BoundField DataField="vehiclecost" HeaderText="Vehicle Cost" SortExpression="vehiclecost" />       
         <asp:CommandField HeaderText="Edit" ShowDeleteButton="True" ShowEditButton="True"
             ShowHeader="True" />
     </Columns>    
    </asp:GridView>
</td>
</tr>
<tr>
<td align="center">
    <asp:Button ID="Button1" runat="server" Text="Back" PostBackUrl="~/Home.aspx" />
</td>
</tr>
</table>
</asp:Content>


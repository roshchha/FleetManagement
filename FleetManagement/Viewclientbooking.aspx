<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="Viewclientbooking.aspx.cs" Inherits="Viewclientbooking" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table align="center">
<tr>
<td>
 <asp:GridView ID="grdClient" runat="server" AutoGenerateColumns="False" OnRowEditing="grdClient_RowEditing" OnRowUpdating="grdClient_RowUpdating" OnRowCancelingEdit="grdClient_RowCancelingEdit" AllowPaging="True" OnPageIndexChanging="grdClient_PageIndexChanging" PageSize="5" OnRowDeleting="grdClient_RowDeleting" >
     <Columns>
     <asp:TemplateField>
     <ItemTemplate>         
         <input id="Hidden1" type="hidden" value='<%# Eval("bookingid") %>' runat="server"/>             
     </ItemTemplate>
     </asp:TemplateField>
         <asp:BoundField DataField="customername" HeaderText="Name" SortExpression="customername" />
         <asp:BoundField DataField="phoneno" HeaderText="Phone No" SortExpression="phoneno" />
         <asp:BoundField DataField="email" HeaderText="Email Id" SortExpression="email" />
         <asp:BoundField DataField="pickup" HeaderText="Pickup Point" SortExpression="pickup" >            
         </asp:BoundField>
         <asp:BoundField DataField="droppoint" HeaderText="Drop Point" SortExpression="droppoint">         
         </asp:BoundField>
         <asp:BoundField DataField="fromdate" HeaderText="Pickup Date" SortExpression="fromdate" />
          <asp:BoundField DataField="driver" HeaderText="Driver" SortExpression="driver" ReadOnly="true"/>
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


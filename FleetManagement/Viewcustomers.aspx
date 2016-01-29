<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="Viewcustomers.aspx.cs" Inherits="Viewcustomers" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table align="center">
<tr>
<td>
 <asp:GridView ID="grdCustomers" runat="server" AutoGenerateColumns="False" OnRowEditing="grdCustomers_RowEditing" OnRowUpdating="grdCustomers_RowUpdating" OnRowCancelingEdit="grdCustomers_RowCancelingEdit" AllowPaging="True" OnPageIndexChanging="grdCustomers_PageIndexChanging" PageSize="5" OnRowDeleting="grdCustomers_RowDeleting" >
     <Columns>
     <asp:TemplateField>
     <ItemTemplate>         
         <input id="Hidden1" type="hidden" value='<%# Eval("id") %>' runat="server"/>             
     </ItemTemplate>
     </asp:TemplateField>
         <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
         <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />         
         <asp:BoundField DataField="phone" HeaderText="Contact Number" SortExpression="phone">         
         </asp:BoundField>
         <asp:BoundField DataField="email" HeaderText="Email Id" SortExpression="emailid" />
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


<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="Employeedetails.aspx.cs" Inherits="Employeedetails" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table align="center">
<tr>
<td>
 <asp:GridView ID="grdEmp" runat="server" AutoGenerateColumns="False" OnRowEditing="grdEmp_RowEditing" OnRowUpdating="grdEmp_RowUpdating" OnRowCancelingEdit="grdEmp_RowCancelingEdit" AllowPaging="True" OnPageIndexChanging="grdEmp_PageIndexChanging" PageSize="5" OnRowDeleting="grdEmp_RowDeleting" >
     <Columns>
     <asp:TemplateField>
     <ItemTemplate>         
         <input id="Hidden1" type="hidden" value='<%# Eval("empId") %>' runat="server"/>             
     </ItemTemplate>
     </asp:TemplateField>
         <asp:BoundField DataField="firstname" HeaderText="Name" SortExpression="firstname" />
         <asp:BoundField DataField="designation" HeaderText="Designation" SortExpression="designation" />
         <asp:BoundField DataField="salery" HeaderText="Salery" SortExpression="salery" />
         <asp:BoundField DataField="dateofjoin" HeaderText="Joiningdate" SortExpression="dateofjoin" >            
         </asp:BoundField>
         <asp:BoundField DataField="phone" HeaderText="Contact Number" SortExpression="phone">         
         </asp:BoundField>
         <asp:BoundField DataField="emailid" HeaderText="Email Id" SortExpression="emailid" />
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


<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="designation.aspx.cs" Inherits="designation" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table align="center">
<tr>
<td colspan="3" align="center">
<asp:Label ID="lblMessage" runat="server" Visible="False"></asp:Label>
</td>
</tr>
<tr>
        <td><asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label></td>
        <td>
            <asp:DropDownList ID="ddldesignation" runat="server">
            </asp:DropDownList></td>
        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
        ErrorMessage="*" ></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
        <td><asp:Label ID="lblName" runat="server" Text="Designation"></asp:Label></td>
        <td><asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
        ErrorMessage="*"/> </td>
        </tr>        
        <tr>
        <td  colspan="3" align="center">
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnLogin_Click" />
        &nbsp
            <asp:Button ID="btnBack" runat="server" Text="Back" PostBackUrl="~/Home.aspx" />
        
        </td>
        </tr>
        </table>
</asp:Content>


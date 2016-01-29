<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Register" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table align="center">
        <tr>
        <td><asp:Label ID="lblFirstname" runat="server" Text="First Name"></asp:Label></td>
        <td><asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox></td>
        <td><%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
        ErrorMessage="*"/>--%> </td>
        </tr>
        <tr>
        <td><asp:Label ID="lblLastname" runat="server" Text="lblLastName"></asp:Label></td>
        <td><asp:TextBox ID="txtLastName" runat="server"></asp:TextBox></td>
        <td><%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
        ErrorMessage="*" ></asp:RequiredFieldValidator>--%></td>
        </tr>
        <tr>
        <td colspan="3">
            <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                <asp:ListItem>Male</asp:ListItem>
                <asp:ListItem>Female</asp:ListItem>
            </asp:RadioButtonList>
        
        </td>
        </tr>
        <tr>
        <td><asp:Label ID="Label2" runat="server" Text="lblLastName"></asp:Label></td>
        <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
        <td><%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPassword"
        ErrorMessage="*" ></asp:RequiredFieldValidator>--%></td>
        </tr>
        <tr>
        <td  colspan="3">
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <asp:Button ID="btnLogin" runat="server" Text="Login"  />
        &nbsp
        <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
        </td>
        </tr>
        </table>
</asp:Content>


<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="vehecletype.aspx.cs" Inherits="vehecletype" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <table align="center">
        <tr>
<td colspan="3" align="center"><h3>Add Vehicle Type</h3></td>
</tr>
        <tr>
        <td><asp:Label ID="lblName" runat="server" Text="VehicleName"></asp:Label></td>
        <td><asp:TextBox ID="txtName" runat="server" AutoCompleteType="Disabled"></asp:TextBox></td>
        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
        ErrorMessage="Vehicle name Required" SetFocusOnError="True"/>&nbsp;
        </td>
        </tr>
        <%--<tr>
        <td  colspan="3">
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        
        &nbsp
        
        </td>
        </tr>--%>
        <tr>
 <td colspan="3" align="center">
    <asp:Button ID="btnInsert" runat="server" Text="Insert" OnClick="btnLogin_Click" />&nbsp;
    <asp:Button ID="btnBack" runat="server" Text="Back" PostBackUrl="~/Home.aspx" CausesValidation="False" />&nbsp;
    <asp:Label ID="lblMessage" runat="server" Visible="False" CssClass="lblMessage">Inserted Succesfully</asp:Label>
    
    </td>  
    </tr>
        
</table>
</asp:Content>


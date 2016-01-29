<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="customers.aspx.cs" Inherits="customers" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table align="center">
<tr>
<td colspan="3" align="center">
<h3>Customer Booking</h3>    
</td>
</tr>
<tr>
<td colspan="3" align="center">
  
<asp:Label ID="lblMessage" runat="server" Visible="False" CssClass="lblMessage"></asp:Label>
</td>
</tr>
<tr bgcolor="#598400">
                        <td height="20" colspan="3" bgcolor="#FFFFCC" class="tx1">» Personal Information</td>

                      </tr>
<tr>
<td style="width: 146px"><asp:Label ID="lblCustomername" runat="server" Text="Customer Name"></asp:Label></td>
<td>
    <asp:TextBox ID="txtCustomername" runat="server"></asp:TextBox></td>
<td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtCustomername" SetFocusOnError="True">Name Reqiured</asp:RequiredFieldValidator></td>
</tr>


<tr>
<td style="width: 146px"><asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label></td>
<td>
    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine"></asp:TextBox></td>
<td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtAddress">Address Required</asp:RequiredFieldValidator></td>
</tr>
<tr>
<td style="width: 146px"><asp:Label ID="lblPhoneno" runat="server" Text="Phone No"></asp:Label></td>
<td>
    <asp:TextBox ID="txtPhoneno" runat="server" MaxLength="13"></asp:TextBox></td>
<td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtPhoneno"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtPhoneno" SetFocusOnError="True" ValidationExpression="^([0-9]( |-)?)?(\(?[0-9]{3}\)?|[0-9]{3})( |-)?([0-9]{3}( |-)?[0-9]{4}|[a-zA-Z0-9]{7})$">Eg: 9885098850</asp:RegularExpressionValidator>
</td>
</tr>
<tr>
<td style="width: 146px"><asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label></td>
<td>
    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
<td><asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>&nbsp;
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtEmail" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Eg: proj@g.com</asp:RegularExpressionValidator>
</td>
</tr>
<tr>
<td><asp:Label ID="lblCountry" runat="server" Text="Country " ></asp:Label></td>
<td>
    <asp:DropDownList ID="ddlCountry" runat="server">
        <asp:ListItem Value="0" >Select</asp:ListItem>
        <asp:ListItem Value="1" >India</asp:ListItem>
        <asp:ListItem Value="2" >Others</asp:ListItem>
    </asp:DropDownList></td>
<td><asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="ddlCountry" meta:resourcekey="RequiredFieldValidator9Resource1">Select</asp:RequiredFieldValidator></td>
</tr>
<tr>
<td><asp:Label ID="lblState" runat="server" Text="State"></asp:Label></td>
<td>
    <asp:TextBox ID="txtState" runat="server" meta:resourcekey="txtStateResource1"></asp:TextBox></td>
<td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtState" meta:resourcekey="RequiredFieldValidator10Resource1">State Required</asp:RequiredFieldValidator></td>
</tr>
<tr>
 <td colspan="3" align="center">
   <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />&nbsp;
    <asp:Button ID="btnBack" runat="server" Text="Back" PostBackUrl="~/Home.aspx" CausesValidation="False"/>
    </td>  
    </tr>                    
</table>
</asp:Content>


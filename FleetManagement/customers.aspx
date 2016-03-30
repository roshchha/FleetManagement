<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="customers.aspx.cs" Inherits="customers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">Add Customer</h3>
        </div>
    </div>
    <div  class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">Personal Information</div>
                <div class="panel-body"> 
                    <table align="center">
                        <tr>
                            <td colspan="3" align="center">
                                <asp:HiddenField ID="hdnCustomerID" runat="server" Value="0" />
                                <asp:Label ID="lblMessage" runat="server" Visible="False" CssClass="lblMessage"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 146px">
                                <asp:Label ID="lblCustomername" runat="server" Text="Customer Name"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCustomername" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtCustomername" SetFocusOnError="True">Name Reqiured</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 146px">
                                <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtAddress">Address Required</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 146px">
                                <asp:Label ID="lblPhoneno" runat="server" Text="Phone No"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtPhoneno" runat="server" CssClass="form-control"  MaxLength="13"></asp:TextBox>
                            </td>                            <td>
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtPhoneno"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtPhoneno" SetFocusOnError="True" ValidationExpression="^([0-9]( |-)?)?(\(?[0-9]{3}\)?|[0-9]{3})( |-)?([0-9]{3}( |-)?[0-9]{4}|[a-zA-Z0-9]{7})$">Eg: 9885098850</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 146px">
                                <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>&nbsp;
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtEmail" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Eg: proj@g.com</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblCountry" runat="server" Text="Country" ></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlCountry" CssClass="form-control" runat="server">
                                 </asp:DropDownList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="ddlCountry" meta:resourcekey="RequiredFieldValidator9Resource1">Select</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblState" runat="server"  Text="State"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtState" runat="server" CssClass="form-control" meta:resourcekey="txtStateResource1"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtState" meta:resourcekey="RequiredFieldValidator10Resource1">State Required</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center">
                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />&nbsp;
                                <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-primary" PostBackUrl="~/Home.aspx" CausesValidation="False"/>
                            </td>  
                        </tr>                    
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


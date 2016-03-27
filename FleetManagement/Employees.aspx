<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="Employees" Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<%--ADD EMPLOYEE DETAILS--%>

    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">Add Employee Details</h3>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading"></div>
                <div class="panel-body">                  
                    <table align="center">
                        <tr>
                            <td colspan="3" align="center">
                                <asp:Label ID="lblMessage" runat="server" Visible="False" CssClass="lblMessage"></asp:Label>
                                <asp:HiddenField ID="HdnEmpID" Value="0" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblFirstName" runat="server" Text="First Name" meta:resourcekey="lblFirstNameResource1"></asp:Label></td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtFirstname" runat="server" meta:resourcekey="txtFirstnameResource1"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtFirstname" meta:resourcekey="RequiredFieldValidator1Resource1" SetFocusOnError="True">Firstname Required</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblLastname" runat="server" Text="Last Name" meta:resourcekey="lblLastnameResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtLastName" runat="server" meta:resourcekey="txtLastNameResource1"></asp:TextBox></td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtLastName" meta:resourcekey="RequiredFieldValidator2Resource1" SetFocusOnError="True">Lastname Required</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblDesignation" runat="server" Text="Designation" meta:resourcekey="lblDesignationResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList CssClass="form-control" ID="ddlDesignation" runat="server" meta:resourcekey="ddlDesignationResource1">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="ddlDesignation" meta:resourcekey="RequiredFieldValidator3Resource1" SetFocusOnError="True">Select</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblSalery" runat="server" Text="Salary" meta:resourcekey="lblSaleryResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtSalery" runat="server" meta:resourcekey="txtSaleryResource1" MaxLength="12"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtSalery" meta:resourcekey="RequiredFieldValidator4Resource1"></asp:RequiredFieldValidator><asp:CompareValidator
            ID="CompareValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtSalery" Operator="DataTypeCheck" Type="Integer">Eg: 10000</asp:CompareValidator>
    &nbsp;<%--<asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtSalery" MaximumValue="9" MinimumValue="0" Type="Integer"></asp:RangeValidator>--%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblDateofjoin" runat="server" Text="Date of Join" meta:resourcekey="lblDateofjoinResource1"></asp:Label>
                            </td>
                            <td>
                                <input class="form-control" name="date" runat="server" style="cursor: text"  id="txtJoiningdate" readonly="readOnly" />
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtJoiningdate" meta:resourcekey="RequiredFieldValidator5Resource1">Date Required</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblQualification" runat="server" Text="Qualification" meta:resourcekey="lblQualificationResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList CssClass="form-control" ID="ddlQualification" runat="server" meta:resourcekey="ddlQualificationResource1">
                                    <asp:ListItem Value="Select" meta:resourcekey="ListItemResource5">Select</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource6">High School</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource7">B.A</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource8">BCA</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource9">B.Com</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource10">B.Sc</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource11">Diploma</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource12">MBA</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource13">M.Com</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource14">M.Sc</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="ddlQualification" meta:resourcekey="RequiredFieldValidator6Resource1">Select</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblDateofbirth" runat="server" Text="DOB" meta:resourcekey="lblDateofbirthResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtDob" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="txtDob">Date Required</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblAddress" runat="server" Text="Address" meta:resourcekey="lblAddressResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtAddress" runat="server" TextMode="MultiLine" meta:resourcekey="txtAddressResource1"></asp:TextBox></td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="txtAddress" meta:resourcekey="RequiredFieldValidator8Resource1">Address Required</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblCountry" runat="server" Text="Country " meta:resourcekey="lblCountryResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList CssClass="form-control" ID="ddlCountry" runat="server" meta:resourcekey="ddlCountryResource1">
                                    <asp:ListItem Value="0" meta:resourcekey="ListItemResource15">Select</asp:ListItem>
                                    <asp:ListItem Value="1" meta:resourcekey="ListItemResource16">India</asp:ListItem>
                                    <asp:ListItem Value="2" meta:resourcekey="ListItemResource17">Others</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="ddlCountry" meta:resourcekey="RequiredFieldValidator9Resource1">Select</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="lblState" runat="server" Text="State" meta:resourcekey="lblStateResource1"></asp:Label></td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtState" runat="server" meta:resourcekey="txtStateResource1"></asp:TextBox></td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ControlToValidate="txtState" meta:resourcekey="RequiredFieldValidator10Resource1">State Required</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblPhone" runat="server" Text="Contact No" meta:resourcekey="lblPhoneResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtContactno" runat="server" meta:resourcekey="txtContactnoResource1" MaxLength="13"></asp:TextBox></td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" ControlToValidate="txtContactno" meta:resourcekey="RequiredFieldValidator11Resource1"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtContactno" SetFocusOnError="True" ValidationExpression="^([0-9]( |-)?)?(\(?[0-9]{3}\)?|[0-9]{3})( |-)?([0-9]{3}( |-)?[0-9]{4}|[a-zA-Z0-9]{7})$"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblEmailid" runat="server" Text="Email Id" meta:resourcekey="lblEmailidResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtEmailid" runat="server" meta:resourcekey="txtEmailidResource1"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RegularExpressionValidator id="RegularExpressionValidator2" runat="server" SetFocusOnError="True" ControlToValidate="txtEmailid" ErrorMessage="*" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Eg: proj@g.com</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center">
                                <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" meta:resourcekey="btnSubmitResource1" />&nbsp;
                                <asp:Button ID="btnBack" CssClass="btn btn-primary" runat="server" Text="Back" PostBackUrl="~/Home.aspx" CausesValidation="False" meta:resourcekey="btnBackResource1" />
                            </td>  
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $('#<%=txtJoiningdate.ClientID%>').datepicker();
        $('#<%=txtDob.ClientID%>').datepicker();
    </script>
</asp:Content>


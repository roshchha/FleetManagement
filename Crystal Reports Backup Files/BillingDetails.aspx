<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="BillingDetails.aspx.cs" Inherits="BillingDetails" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table align="center" style="width: 600px">
<tr>
<td>
<fieldset><h3>
<legend><em>Billing......</em></legend></h3>
<table width="100%">
<tr bgcolor="#598400">
                        <td colspan="3" bgcolor="#FFFFCC" class="tx1" align="center" style="height: 20px">» Personal Information</td>

                      </tr>
                      <tr>
                      <td>
                          <asp:Label ID="lblDutyslipno" runat="server" Text="Duty Slip no"></asp:Label>
                      </td>
                      <td>
                          <asp:DropDownList ID="ddldutyslipno" runat="server" AutoPostBack="True">
                          </asp:DropDownList>
                      </td>
                      <td style="width: 209px">
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="ddldutyslipno" InitialValue="Select" SetFocusOnError="True" ValidationGroup="first">Select Slip No</asp:RequiredFieldValidator>
                      </td>
                      </tr>
<tr>
<td><asp:Label ID="lblCustomername" runat="server" Text="Customer Name"></asp:Label></td>
<td>
    <asp:TextBox ID="txtCustomername" runat="server" ReadOnly="True"></asp:TextBox></td>
<td style="width: 209px"><%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>--%></td>
</tr>


<tr>
<td>
    <asp:Label ID="lblPhoneno" runat="server" Text="Phone no"></asp:Label>
</td>
<td>
    <asp:TextBox ID="txtPhoneno" runat="server" ReadOnly="True" MaxLength="12"></asp:TextBox>
</td>
</tr>



<tr bgcolor="#598400">
                        <td height="20" colspan="3" bgcolor="#ffffcc" class="tx1">» Pick-Up Details</td>

                      </tr>
                      
                      <tr>
<td>
    <asp:Label ID="Label2" runat="server" Text="Client Arrival Date"></asp:Label>   
</td>
<td>
    <asp:TextBox ID="txtFromdate" runat="server" ReadOnly="True"></asp:TextBox></td>
<td style="width: 209px">
<%--<table>
<tr valign="middle">
<td>
    <asp:Label ID="lblTime" runat="server" Text="Time"></asp:Label>:
</td>
<td>
    <asp:ListBox ID="ListBox1" runat="server" Rows="1"></asp:ListBox></td>
</tr>
</table>--%>
</td>
</tr>
<tr>
<td>
    <asp:Label ID="lblTodate" runat="server" Text="Client Exit Date"></asp:Label></td>
<td>
    <asp:TextBox ID="txtTodate" runat="server" ReadOnly="True"></asp:TextBox></td>
    <td style="width: 209px">
   <%-- <table>
<tr>
<td>
    <asp:Label ID="Label1" runat="server" Text="Time"></asp:Label>:
</td>
<td>
    <asp:DropDownList ID="DropDownList2" runat="server">
    </asp:DropDownList></td>
</tr>
</table>--%>
    </td>
</tr>

<tr bgcolor="#598400">
                        <td height="20" colspan="3" bgcolor="#FFFFCC" class="tx1">
                            &nbsp;Vehicle Details</td>

                      </tr>
                      <tr>
                      <td>
    <asp:Label ID="lblVehicletype" runat="server" Text="Vehicle Type"></asp:Label>
</td>
<td>
    <asp:TextBox ID="txtVehicletype" runat="server" ReadOnly="True"></asp:TextBox>
</td>
<td style="width: 209px"></td>
                      </tr>
                      <tr>
                      <td>
    <asp:Label ID="lblVehicleno" runat="server" Text="Vehicle No"></asp:Label>
</td>
<td>
    <asp:TextBox ID="txtVehicleno" runat="server" ReadOnly="True" MaxLength="12"></asp:TextBox>
</td>
<td style="width: 209px"></td>
                      </tr>
                      <tr>
                      <td>
                          <asp:Label ID="lblDriver" runat="server" Text="Driver"></asp:Label></td>
                          <td>
                              <asp:TextBox ID="txtDriver" runat="server" ReadOnly="True"></asp:TextBox></td>
                      </tr>
            <%--<tr>
                 
<td>
    <asp:Label ID="lblGarageoutdate" runat="server" Text="Garage out Date"></asp:Label>
</td>
<td>
    <asp:TextBox ID="txtGarageoutdate" runat="server"></asp:TextBox>
</td>
<td>
<asp:Label ID="lblGarageouttime" runat="server" Text="Garage out Time"></asp:Label>:
 <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
 </td>
</tr>--%>

<tr>
<td><asp:Label ID="lblMeterreading" runat="server" Text="Meter Reading"></asp:Label></td>
<td>
    <asp:TextBox ID="txtOutmeterreading" runat="server"></asp:TextBox></td>
<td style="width: 209px">
    <%--<asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="*" ControlToCompare="txtInmeterreading" ControlToValidate="txtOutmeterreading" Operator="LessThan"></asp:CompareValidator>--%>
</td>
</tr>     
<%--<tr>
<td>
    <asp:Label ID="lblGarageindate" runat="server" Text="Garage In Date"></asp:Label>
</td>
<td>
    <asp:TextBox ID="txtGarageindate" runat="server"></asp:TextBox>
</td>
<td>
<asp:Label ID="lblGarageintime" runat="server" Text="Garage In Time"></asp:Label>:
<asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
</td>
</tr>--%>

<tr>
<td><asp:Label ID="lblInmeterreading" runat="server" Text="In Meter Reading"></asp:Label></td>
<td>
    <asp:TextBox ID="txtInmeterreading" runat="server" AutoPostBack="True" OnTextChanged="txtInmeterreading_TextChanged" CausesValidation="True"></asp:TextBox></td>
<td style="width: 209px"><%--<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>--%>
    <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="In Meter reading should be greater than out meter reading" ControlToCompare="txtOutmeterreading" ControlToValidate="txtInmeterreading" Operator="GreaterThan" SetFocusOnError="True" ValueToCompare="second" Width="213px"></asp:CompareValidator>
</td>
</tr>
<tr>
<td>
    <asp:Label ID="lblTariffcode" runat="server" Text="Total Amt"></asp:Label>
</td>
<td>
    <asp:TextBox ID="txtTariffcode" runat="server" ReadOnly="True"></asp:TextBox>
</td>
<td style="width: 209px">
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtTariffcode" ValidationGroup="first"></asp:RequiredFieldValidator>
</td>
</tr>
<%--<tr>
<td>
    <asp:Label ID="Label3" runat="server" Text="Extra hrs"></asp:Label>
</td>
<td>
    <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
</td>
</tr>--%>
<tr>
 <td colspan="3" align="center">
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" ValidationGroup="first" />&nbsp;
    <asp:Button ID="btnBack" runat="server" Text="Back" PostBackUrl="~/Home.aspx" />
    </td>  
    </tr>
    <tr>
<td colspan="3" align="center">
<asp:Label ID="lblMessage" runat="server" Visible="False" CssClass="lblMessage"></asp:Label>
</td>
</tr>
</table>
</fieldset>
</td>
</tr>
</table>
</asp:Content>


<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="VehicleType.aspx.cs" Inherits="VehicleTypes" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
         <div class="col-lg-12">
            <h3 class="page-header">Add Vehicle Type</h3>
        </div>
    </div>
    <div  class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading"></div>
                <div class="panel-body"> 
                    <table align="center">
                        <tr>
                            <td><asp:Label ID="lblName" runat="server" Text="Vehicle Name"></asp:Label>&nbsp;</td>
                            <td><asp:TextBox ID="txtName" runat="server" CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox></td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                                ErrorMessage="Vehicle name Required" SetFocusOnError="True"/>&nbsp;
                            </td>
                        </tr>
                        <tr>
                             <td colspan="3" align="center">
                                <asp:Button ID="btnInsert" CssClass="btn btn-primary" runat="server" Text="Insert" OnClick="btnInsert_Click" />&nbsp;
                                <asp:Button ID="btnBack" CssClass="btn btn-primary" runat="server" Text="Back" PostBackUrl="~/Home.aspx" CausesValidation="False" />&nbsp;
                                <asp:Label ID="lblMessage" runat="server" Visible="False" CssClass="lblMessage">Inserted Succesfully</asp:Label>
                            </td>  
                        </tr>    
                    </table> 
                </div>
            </div>
        </div>
    </div>
 
</asp:Content>


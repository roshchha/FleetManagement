<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="designation.aspx.cs" Inherits="designation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header"></h3>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading"></div>
                <div class="panel-body">
                    <table align="center">
                           <tr>
                               <td colspan="3">
                                   <asp:Label ID="lblMessage" runat="server"></asp:Label>
                               </td>
                           </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblName" runat="server" Text="Designation"></asp:Label>&nbsp;
                            </td>
                            <td>
                                <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator CssClass="errorText" ForeColor="Red" ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
        ErrorMessage="*"/> 
                            </td>
                        </tr>
                          <tr>
                            <td  colspan="3" align="center">
                                <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnBack" CssClass="btn btn-primary" runat="server" Text="Back" PostBackUrl="~/Home.aspx" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


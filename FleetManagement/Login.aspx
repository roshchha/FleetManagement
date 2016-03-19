<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" Trace="true" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Login" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    &nbsp;
    <script type="text/javascript" language="javascript">
    function validation(sender,args)
    {        
      var check=document.getElementById("ctl00_ContentPlaceHolder1_txtName").value       
     
//     
      if(check.length>0)
      {
      alert(check.length)
      args.isValid=true
      }
      else
      {
       alert(check.length)
       args.isValid=false       
      }

    }
    </script>
    
    <div class="center-block">
        <div class="panel panel-default center-block" style="width:35%">
            <div class="panel-heading text-center">Login</div>
            <div class="panel-body">
                <table style="text-align:center;" align="center">
            <tr>
                <td style="height: 26px"><asp:Label ID="lblName" runat="server" Text="Username"></asp:Label></td>
                <td style="height: 26px"><asp:TextBox ID="txtName" CssClass="form-control input-sm" runat="server"></asp:TextBox></td>
                <td style="height: 26px">
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="validation" EnableClientScript="true" ErrorMessage="invalid" ControlToValidate="txtName" ValidateEmptyText="True" SetFocusOnError="True"></asp:CustomValidator> 
                </td>
            </tr>
            <tr><td style="height:5px"></td></tr>
            <tr>
                <td><asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label></td>
                <td><asp:TextBox ID="txtPassword" CssClass="form-control input-sm" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
            ErrorMessage="*" ></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr><td style="height:5px"></td></tr>
        
            <tr>
                <td  colspan="3">
                    <asp:Button ID="btnLogin" CssClass="btn btn-primary" runat="server" Text="Login" OnClick="btnLogin_Click" />
                    <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>

            </div>
        </div>
    </div>       
</asp:Content>


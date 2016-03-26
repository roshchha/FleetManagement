<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="Customersrpt.aspx.cs" Inherits="Customersrpt" Title="Untitled Page" %>


<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="row">
       <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="1114px">
           <LocalReport ReportEmbeddedResource="CustomersRPT.rdlc" ReportPath="CustomersRPT.rdlc">
               <DataSources>
                   <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DS_Customers" />
               </DataSources>
           </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="FleetManagement.DS_CustomersTableAdapters.customersTableAdapter"></asp:ObjectDataSource>
   </div>
</asp:Content>


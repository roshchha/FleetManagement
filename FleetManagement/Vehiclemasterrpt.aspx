<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="Vehiclemasterrpt.aspx.cs" Inherits="Vehiclemasterrpt" Title="Untitled Page" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
        <LocalReport ReportEmbeddedResource="VehicleMaster.rdlc" ReportPath="VehicleMaster.rdlc">
             <DataSources>
                <rsweb:ReportDataSource Name="DSVehicleMaster" DataSourceId="ObjectDataSource1"></rsweb:ReportDataSource>
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource runat="server" SelectMethod="GetData" TypeName="DSVehicleMasterTableAdapters.a_vehiclemasterTableAdapter" ID="ObjectDataSource1"></asp:ObjectDataSource>
</asp:Content>


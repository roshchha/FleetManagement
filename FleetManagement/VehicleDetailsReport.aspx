<%@ Page Title="" Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="VehicleDetailsReport.aspx.cs" Inherits="FleetManagement.VehicleDetailsReport" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" />
    <div class="row">
        <div class="panel panel-default">
            <div class="panel-heading">Vehicle Details Report</div>
            <div class="panel-body">

                <rsweb:ReportViewer Width="100%" ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
                    <LocalReport ReportEmbeddedResource="VehicleDetails.rdlc" ReportPath="VehicleDetails.rdlc">
                        <DataSources>
                            <rsweb:ReportDataSource Name="DataSet1" DataSourceId="ObjectDataSource1"></rsweb:ReportDataSource>
                        </DataSources>
                    </LocalReport>
                </rsweb:ReportViewer>
                <asp:ObjectDataSource runat="server" SelectMethod="GetData" TypeName="FleetManagement.VehicleDetailsDataSetTableAdapters.VehicleMasterTableAdapter" ID="ObjectDataSource1"></asp:ObjectDataSource>
            </div>
        </div>
    </div>
</asp:Content>

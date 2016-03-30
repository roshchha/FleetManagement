<%@ Page Title="" Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="BookingReport.aspx.cs" Inherits="FleetManagement.BookingReport" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" />
    <div class="row">
        <div class="panel panel-default">
            <div class="panel-heading">Customer Booking Report</div>
            <div class="panel-body">
                <rsweb:ReportViewer ID="ReportViewer1" Width="100%" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
                    <LocalReport ReportEmbeddedResource="CustomerBooking.rdlc" ReportPath="CustomerBooking.rdlc">
                        <DataSources>
                            <rsweb:ReportDataSource Name="DataSet1" DataSourceId="ObjectDataSource1"></rsweb:ReportDataSource>
                        </DataSources>
                    </LocalReport>
                </rsweb:ReportViewer>
                <asp:ObjectDataSource runat="server" SelectMethod="GetData" TypeName="FleetManagement.FleetManagementDataSetTableAdapters.Get_BookingForReprotTableAdapter" ID="ObjectDataSource1"></asp:ObjectDataSource>
            </div>
        </div>
    </div>

</asp:Content>

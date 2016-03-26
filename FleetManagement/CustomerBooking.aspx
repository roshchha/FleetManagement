<%@ Page Title="" Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="CustomerBooking.aspx.cs" Inherits="FleetManagement.CustomerBooking" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="row">
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
            <LocalReport ReportEmbeddedResource="CustomerBookingsRpt.rdlc" ReportPath="CustomerBookingsRpt.rdlc">
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource runat="server" SelectMethod="GetData" TypeName="DS_employeesTableAdapters.CustomerBookingTableAdapter" ID="ObjectDataSource1">

        </asp:ObjectDataSource>
    </div>
</asp:Content>

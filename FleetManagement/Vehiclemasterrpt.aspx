<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="Vehiclemasterrpt.aspx.cs" Inherits="Vehiclemasterrpt" Title="Untitled Page" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=10.2.3600.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <CR:CrystalReportViewer ID="crvVehiclemaster" runat="server" AutoDataBind="True" Height="1039px" ReportSourceID="CrystalReportSource1" Width="901px" />
    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
        <Report FileName="Vehiclemaster.rpt">
        </Report>
    </CR:CrystalReportSource>
</asp:Content>


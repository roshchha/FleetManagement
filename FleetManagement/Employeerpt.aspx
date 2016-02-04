<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="Employeerpt.aspx.cs" Inherits="Employeerpt" Title="Untitled Page" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <CR:CrystalReportViewer ID="crvEmp" runat="server" AutoDataBind="True" Height="1039px" ReportSourceID="CrystalReportSource1" Width="901px" />
    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
        <Report FileName="Employees.rpt">
        </Report>
    </CR:CrystalReportSource>
</asp:Content>


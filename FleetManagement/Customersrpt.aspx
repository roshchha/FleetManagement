<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="Customersrpt.aspx.cs" Inherits="Customersrpt" Title="Untitled Page" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />
    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
        <Report FileName="Customers.rpt"></Report>
    </CR:CrystalReportSource>
</asp:Content>


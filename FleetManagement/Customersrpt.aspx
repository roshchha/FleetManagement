<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="Customersrpt.aspx.cs" Inherits="Customersrpt" Title="Untitled Page" %>


<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
        <ServerReport ReportPath="CustomersReport.rdlc" />
        <LocalReport ReportEmbeddedResource="FleetManagement.CustomersReport.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="FleetManagement.DS_employeesTableAdapters.a_employeeTableAdapter">
        <InsertParameters>
            <asp:Parameter Name="firstname" Type="String" />
            <asp:Parameter Name="lastname" Type="String" />
            <asp:Parameter Name="designation" Type="String" />
            <asp:Parameter Name="salery" Type="Decimal" />
            <asp:Parameter Name="dateofjoin" Type="String" />
            <asp:Parameter Name="Qualification" Type="String" />
            <asp:Parameter Name="dateofbirth" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="country" Type="String" />
            <asp:Parameter Name="state" Type="String" />
            <asp:Parameter Name="phone" Type="Int64" />
            <asp:Parameter Name="emailid" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
   
</asp:Content>


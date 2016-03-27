<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="BillingDetails.aspx.cs" Inherits="BillingDetails" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
  <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">Billing Details</h3>
        </div>
    </div>
    <div  class="row">
        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading"></div>
                <div class="panel-body">
                    <table align="center">
                        <tr>
                            <td>
                                <asp:Label ID="lblBookingRef" Text="Booking Reference" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlBookingRef" runat="server" AutoPostBack="true" />
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="ddlBookingRef" InitialValue="Select" SetFocusOnError="True" ValidationGroup="first">Select</asp:RequiredFieldValidator>
                            </td>
                        </tr>             
             
                       <tr>
                            <td><asp:Label ID="lblMeterreading" runat="server" Text="Out Meter Reading"></asp:Label>&nbsp;</td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtOutmeterreading" runat="server"></asp:TextBox></td>
                            <td style="width: 209px">
                                <%--<asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="*" ControlToCompare="txtInmeterreading" ControlToValidate="txtOutmeterreading" Operator="LessThan"></asp:CompareValidator>--%>
                            </td>
                        </tr>     

                        <tr>
                            <td><asp:Label ID="lblInmeterreading" runat="server" Text="In Meter Reading"></asp:Label>&nbsp;</td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtInmeterreading" runat="server" AutoPostBack="True" OnTextChanged="txtInmeterreading_TextChanged" CausesValidation="True"></asp:TextBox></td>
                            <td style="width: 209px"><%--<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>--%>
                                <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="In Meter reading should be greater than out meter reading" ControlToCompare="txtOutmeterreading" ControlToValidate="txtInmeterreading" Operator="GreaterThan" SetFocusOnError="True" ValueToCompare="second" Width="213px"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                             <td colspan="3" align="center">
                                <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" ValidationGroup="first" />&nbsp;
                                <asp:Button ID="btnBack" CssClass="btn btn-primary" runat="server" Text="Back" PostBackUrl="~/Home.aspx" />
                            </td>  
                        </tr>
                        <tr>
                            <td colspan="3" align="center">
                                <asp:Label ID="lblMessage" runat="server" Visible="False" CssClass="lblMessage"></asp:Label>&nbsp;
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <%if(CurrentBooking != null){ %>
        <div class="col-md-6">
              <div class="panel panel-default">
                  <div class="panel-heading">Booking Details</div>
                  <div class="panel-body">
                      <table align="center" width="99%">
                          <tr>
                              <td>Customer Name: </td>
                              <td><%=CurrentBooking.CustomerName %></td>
                          </tr>
                          <tr>
                              <td>Guest Name: </td>
                              <td><%=CurrentBooking.GuestName %></td>
                          </tr>
                           <tr>
                              <td>Pickup Point: </td>
                              <td><%=CurrentBooking.PickupPoint %></td>
                          </tr>
                           <tr>
                              <td>Drop Point: </td>
                              <td><%=CurrentBooking.DropPoint %></td>
                          </tr>
                           <tr>
                              <td>Booking Date: </td>
                              <td><%=CurrentBooking.BookingDate.ToString("dd MMM yyyy")%></td>
                          </tr>
                          <tr>
                              <td>From Date: </td>
                              <td><%=CurrentBooking.FromDate.ToString("dd MMM yyyy") %></td>
                          </tr>
                          <tr>
                              <td>To Date: </td>
                              <td><%=CurrentBooking.ToDate.ToString("dd MMM yyyy")%></td>
                          </tr>
                          <tr>
                              <td>Tariff Code: </td>
                              <td><%=CurrentBooking.TariffDetails.TariffCode %></td>
                          </tr>
                      </table>
                  </div>
              </div>
        </div>
        <%} %>
    </div>
</asp:Content>


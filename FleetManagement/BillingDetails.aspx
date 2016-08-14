<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="BillingDetails.aspx.cs" Inherits="BillingDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .panel-default table td{width:45%;}
        .panel-default table td:last-child{width:10%;}
    </style>
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
                    <table align="center" width="99%">
                        <tr>
                            <td colspan="3" align="center">
                                <asp:Label ID="lblMessage" runat="server" Visible="False" CssClass="lblMessage"></asp:Label>&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblBookingRef" Text="Booking Reference" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList CssClass="form-control" ID="ddlBookingRef" runat="server" AutoPostBack="true" />
                            </td>
                            <td>
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="ddlBookingRef" InitialValue="Select" SetFocusOnError="True" ValidationGroup="first">Select</asp:RequiredFieldValidator>
                            </td>
                        </tr>             
             
                       <tr>
                            <td><asp:Label ID="lblOutMeterreading" runat="server" Text="Out Meter Reading"></asp:Label>&nbsp;</td>
                            <td>
                                <asp:TextBox ID="txtOutMeterReading" runat="server" CssClass="form-control"></asp:TextBox>
                           </td>
                            <td style="width: 209px">
                               <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator6" ControlToValidate="txtOutMeterReading" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>     

                        <tr>
                            <td><asp:Label ID="lblInmeterreading" runat="server" Text="In Meter Reading"></asp:Label>&nbsp;</td>
                            <td>
                                <asp:TextBox ID="txtInMeterReading" runat="server" CssClass="form-control"></asp:TextBox>

                            </td>
                            <td style="width: 209px">
                                <asp:RequiredFieldValidator CssClass="errorText" ID="RequiredFieldValidator7" ControlToValidate="txtInMeterReading" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                 <%--<asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="In Meter reading should be greater than out meter reading" ControlToCompare="txtOutMeterReading" ControlToValidate="txtInMeterReading" Operator="GreaterThan" SetFocusOnError="True" ValueToCompare="second" Width="213px"></asp:CompareValidator>--%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblExtraHours" Text="Extra Hours" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtExtraHours" runat="server"></asp:TextBox>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><asp:Label Text="Stand Charges" runat="server" ID="lblStandCharges"></asp:Label>
                            </td>
                            <td><asp:CheckBox ID="chkStandCharges" runat="server" /></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><asp:Label Text="Amount Paid" runat="server" ID="lblAmtPaid"></asp:Label>
                            </td>
                            <td><asp:CheckBox ID="chkPaid" runat="server" /></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="lblDutySlipNo" Text="Duty Slip No" runat="server"></asp:Label></td>
                            <td><asp:TextBox ID="txtDutySlipNo" runat="server" CssClass="form-control"></asp:TextBox></td>
                            <td></td>
                        </tr>
                           <tr>
                            <td><asp:Label ID="lblDutySlipDate" Text="Duty Slip Date" runat="server"></asp:Label></td>
                            <td><asp:TextBox ID="txtDutySlipDate" runat="server" CssClass="form-control"></asp:TextBox></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="lblGrossAmount" runat="server" Text="Gross Amount"></asp:Label> </td>
                            <td><asp:TextBox CssClass="form-control" ID="txtGrossAmount" Enabled="false" runat="server" /></td>
                            <td></td>
                        </tr>
                          <tr>
                            <td><asp:Label ID="lblDiscount" runat="server" Text="Discount"></asp:Label> </td>
                            <td><asp:TextBox CssClass="form-control" ID="txtDiscount" runat="server" /></td>
                            <td></td>
                        </tr>
                          <tr>
                            <td><asp:Label ID="lblTotalAmount" Text="Total Amount" runat="server"></asp:Label> </td>
                            <td><asp:TextBox CssClass="form-control" ID="txtTotalAmount" Enabled="false" runat="server"/></td>
                            <td></td>
                        </tr>
                        <tr>
                             <td colspan="3" align="center">
                                 <asp:Button ID="btnCalculate" CssClass="btn btn-default" runat="server" Text="Calculate" OnClick="btnCalculate_Click" />
                                <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />&nbsp;
                                <asp:Button ID="btnBack" CssClass="btn btn-primary" runat="server" Text="Back" PostBackUrl="~/Home.aspx" />
                            </td>  
                        </tr>
                        
                    </table>
                </div>
            </div>
        </div>
        <%if(CurrentBooking != null){ %>
        <div class="col-md-6">
              <div class="panel panel-info">
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
    <script type="text/javascript">
        $('#<%=txtDutySlipDate.ClientID%>').datepicker();
    </script>
</asp:Content>


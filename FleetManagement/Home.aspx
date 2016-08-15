<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="row home">
       <%-- <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading"></div>
                <div class="panel-body">
                    Fleet-Cab has been specifically designed keeping in mind the requirements of a cab operator. A cab operator operates in a service industry, which requires high standards of efficiency to be successful. A cab operator provides vehicles on hire to customers and bills them according to the tariff card. The key success factors in this business are quality of service, condition of the vehicle, competitive pricing, customer-interface etc. A cab operator has to keep tight control over these factors to be competitive and remain profitable. 
                    </div>
            </div>
        </div>--%>
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">Monthly Booking Count</div>
                <div class="panel-body">
                    <div id="BarChart">

                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">Monthly Gross Revenue By Vehicle Type (Last 30 Days)</div>
                <div class="panel-body">
                      <div id="PieChart">

                    </div>
                </div>
            </div>
        </div>
        
    </div>
    <script type="text/javascript">
        $(function(){
            var barChart = c3.generate({
                bindto:'#BarChart',
                data: {            
                    json:  <%=JsonBookingCountData%>,
                    keys: {
                        x: 'BookingDate', // it's possible to specify 'x' when category axis
                        value: ['BookingCount'],
                    },
                    type: 'bar'
                },
                bar: {
                    width: {
                        ratio: 0.5 // this makes bar width 50% of length between ticks
                    }
                },
                legend: {
                    show: false
                },
                axis: {
                    x: {
                        type: 'category' // this needed to load string x value
                    },
                    y:{
                        tick: {
                            // format: d3.format('d')
                       
                        }
                    }
                }
            });
            var jsonData = <%=JsonGrossRevenueForVehiclesData%>

            var data = {};
            var sites = [];
            jsonData.forEach(function(e) {
                sites.push(e.Key);
                data[e.Key] = e.Value;
            })    

            chart = c3.generate({
                bindto:'#PieChart',
                data: {
                    json: [ data ],
                    keys: {
                        value: sites,
                    },
                    type:'pie'
                },
            });

        });

    </script>
</asp:Content>


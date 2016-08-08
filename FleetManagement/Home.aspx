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
                    <div id="chart">

                    </div>
                </div>
            </div>
        </div>
        
    </div>
    <script type="text/javascript">
        $(function(){
        var chart = c3.generate({
            data: {            
                json:  <%=JsonBookingCountData%>,
                keys: {
                     x: 'BookingDate', // it's possible to specify 'x' when category axis
                    value: ['BookingCount'],
                },
                //columns: [
                //    ['x','1 aug', '2 aug', '3 aug', '4 aug', '5 aug'],
                //    ['Booking Count', 30, 200, 100, 400, 150, 250]  
                //],
                type: 'bar'
            },
            bar: {
                width: {
                    ratio: 0.5 // this makes bar width 50% of length between ticks
                }
                // or
                //width: 100 // this makes bar width 100px
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
            
            
            //d3.select("svg").append("text")
            //    .attr("x", 100 )
            //    .attr("y", 50)
            //    .style("text-anchor", "middle")
            //    .text("Monthly Booking Count");



      
        });

    </script>
</asp:Content>


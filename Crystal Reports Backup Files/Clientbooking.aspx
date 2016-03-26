ff<%@ Page Language="C#" MasterPageFile="~/Fleetmanagement.master" AutoEventWireup="true" CodeBehind="Clientbooking.aspx.cs" Inherits="Clientbooking" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table class="ds_box" cellpadding="0" cellspacing="0" id="ds_conclass" style="display: none;">
<tr><td id="ds_calclass" style="width: 1px">
</td></tr>
</table>

<script type="text/javascript">

// <!-- <![CDATA[

// Project: Dynamic Date Selector (DtTvB) - 2006-03-16
// Script featured on JavaScript Kit- http://www.javascriptkit.com
// Code begin...
// Set the initial date.
var ds_i_date = new Date();
ds_c_month = ds_i_date.getMonth() + 1;
ds_c_year = ds_i_date.getFullYear();

// Get Element By Id
function ds_getel(id) {
	return document.getElementById(id);
}

// Get the left and the top of the element.
function ds_getleft(el) {
	var tmp = el.offsetLeft;
	el = el.offsetParent
	while(el) {
		tmp += el.offsetLeft;
		el = el.offsetParent;
	}
	return tmp;
}
function ds_gettop(el) {
	var tmp = el.offsetTop;
	el = el.offsetParent
	while(el) {
		tmp += el.offsetTop;
		el = el.offsetParent;
	}
	return tmp;
}

// Output Element
var ds_oe = ds_getel('ds_calclass');
// Container
var ds_ce = ds_getel('ds_conclass');

// Output Buffering
var ds_ob = ''; 
function ds_ob_clean() {
	ds_ob = '';
}
function ds_ob_flush() {
	ds_oe.innerHTML = ds_ob;
	ds_ob_clean();
}
function ds_echo(t) {
	ds_ob += t;
}

var ds_element; // Text Element...

var ds_monthnames = [
'January', 'February', 'March', 'April', 'May', 'June',
'July', 'August', 'September', 'October', 'November', 'December'
]; // You can translate it for your language.

var ds_daynames = [
'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'
]; // You can translate it for your language.

// Calendar template
function ds_template_main_above(t) {
	return '<table cellpadding="3" cellspacing="1" class="ds_tbl">'
	     + '<tr>'
		 + '<td class="ds_head" style="cursor: pointer" onclick="ds_py();">&lt;&lt;</td>'
		 + '<td class="ds_head" style="cursor: pointer" onclick="ds_pm();">&lt;</td>'
		 + '<td class="ds_head" style="cursor: pointer" onclick="ds_hi();" colspan="3">[Close]</td>'
		 + '<td class="ds_head" style="cursor: pointer" onclick="ds_nm();">&gt;</td>'
		 + '<td class="ds_head" style="cursor: pointer" onclick="ds_ny();">&gt;&gt;</td>'
		 + '</tr>'
	     + '<tr>'
		 + '<td colspan="7" class="ds_head">' + t + '</td>'
		 + '</tr>'
		 + '<tr>';
}

function ds_template_day_row(t) {
	return '<td class="ds_subhead">' + t + '</td>';
	// Define width in CSS, XHTML 1.0 Strict doesn't have width property for it.
}

function ds_template_new_week() {
	return '</tr><tr>';
}

function ds_template_blank_cell(colspan) {
	return '<td colspan="' + colspan + '"></td>'
}

function ds_template_day(d, m, y) {
	return '<td class="ds_cell" onclick="ds_onclick(' + d + ',' + m + ',' + y + ')">' + d + '</td>';
	// Define width the day row.
}

function ds_template_main_below() {
	return '</tr>'
	     + '</table>';
}

// This one draws calendar...
function ds_draw_calendar(m, y) {
	// First clean the output buffer.
	ds_ob_clean();
	// Here we go, do the header
	ds_echo (ds_template_main_above(ds_monthnames[m - 1] + ' ' + y));
	for (i = 0; i < 7; i ++) {
		ds_echo (ds_template_day_row(ds_daynames[i]));
	}
	// Make a date object.
	var ds_dc_date = new Date();
	ds_dc_date.setMonth(m - 1);
	ds_dc_date.setFullYear(y);
	ds_dc_date.setDate(1);
	if (m == 1 || m == 3 || m == 5 || m == 7 || m == 8 || m == 10 || m == 12) {
		days = 31;
	} else if (m == 4 || m == 6 || m == 9 || m == 11) {
		days = 30;
	} else {
		days = (y % 4 == 0) ? 29 : 28;
	}
	var first_day = ds_dc_date.getDay();
	var first_loop = 1;
	// Start the first week
	ds_echo (ds_template_new_week());
	// If sunday is not the first day of the month, make a blank cell...
	if (first_day != 0) {
		ds_echo (ds_template_blank_cell(first_day));
	}
	var j = first_day;
	for (i = 0; i < days; i ++) {
		// Today is sunday, make a new week.
		// If this sunday is the first day of the month,
		// we've made a new row for you already.
		if (j == 0 && !first_loop) {
			// New week!!
			ds_echo (ds_template_new_week());
		}
		// Make a row of that day!
		ds_echo (ds_template_day(i + 1, m, y));
		// This is not first loop anymore...
		first_loop = 0;
		// What is the next day?
		j ++;
		j %= 7;
	}
	// Do the footer
	ds_echo (ds_template_main_below());
	// And let's display..
	ds_ob_flush();
	// Scroll it into view.
	ds_ce.scrollIntoView();
}

// A function to show the calendar.
// When user click on the date, it will set the content of t.
function ds_sh(t) {
   
   
	// Set the element to set...
	ds_element = t;
	// Make a new date, and set the current month and year.
	var ds_sh_date = new Date();
	ds_c_month = ds_sh_date.getMonth() + 1;
	ds_c_year = ds_sh_date.getFullYear();
	// Draw the calendar
	ds_draw_calendar(ds_c_month, ds_c_year);
	// To change the position properly, we must show it first.
	ds_ce.style.display = '';
	// Move the calendar container!
	the_left = ds_getleft(t);
	the_top = ds_gettop(t) + t.offsetHeight;
	ds_ce.style.left = the_left + 'px';
	ds_ce.style.top = the_top + 'px';
	// Scroll it into view.
	ds_ce.scrollIntoView();
   
}

// Hide the calendar.
function ds_hi() {
   
	ds_ce.style.display = 'none';
	
}

// Moves to the next month...
function ds_nm() {
	// Increase the current month.
	ds_c_month ++;
	// We have passed December, let's go to the next year.
	// Increase the current year, and set the current month to January.
	if (ds_c_month > 12) {
		ds_c_month = 1; 
		ds_c_year++;
	}
	// Redraw the calendar.
	ds_draw_calendar(ds_c_month, ds_c_year);
}

// Moves to the previous month...
function ds_pm() {
	ds_c_month = ds_c_month - 1; // Can't use dash-dash here, it will make the page invalid.
	// We have passed January, let's go back to the previous year.
	// Decrease the current year, and set the current month to December.
	if (ds_c_month < 1) {
		ds_c_month = 12; 
		ds_c_year = ds_c_year - 1; // Can't use dash-dash here, it will make the page invalid.
	}
	// Redraw the calendar.
	ds_draw_calendar(ds_c_month, ds_c_year);
}

// Moves to the next year...
function ds_ny() {
	// Increase the current year.
	ds_c_year++;
	// Redraw the calendar.
	ds_draw_calendar(ds_c_month, ds_c_year);
}

// Moves to the previous year...
function ds_py() {
	// Decrease the current year.
	ds_c_year = ds_c_year - 1; // Can't use dash-dash here, it will make the page invalid.
	// Redraw the calendar.
	ds_draw_calendar(ds_c_month, ds_c_year);
}

// Format the date to output.
function ds_format_date(d, m, y) {
	// 2 digits month.
	m2 = '00' + m;
	m2 = m2.substr(m2.length - 2);
	// 2 digits day.
	d2 = '00' + d;
	d2 = d2.substr(d2.length - 2);
	// YYYY-MM-DD
//	return y + '-' + m2 + '-' + d2;
	return m2 + '/' + d2+ '/' + y;
}

// When the user clicks the day.
function ds_onclick(d, m, y) {
	// Hide the calendar.
	ds_hi();
	// Set the value of it, if we can.
	if (typeof(ds_element.value) != 'undefined') {
		ds_element.value = ds_format_date(d, m, y);
	
	// Maybe we want to set the HTML in it.
	} else if (typeof(ds_element.innerHTML) != 'undefined') {
		ds_element.innerHTML = ds_format_date(d, m, y);
	// I don't know how should we display it, just alert it to user.
	} else {
		alert (ds_format_date(d, m, y));
	}
}

// And here is the end.

// ]]> -->
</script>

<%--<table align="center">
<tr>
<td colspan="3">
 <h4>Booking Form....</h4> 
</td>
</tr>
<br />
<br />
<tr bgcolor="#598400">
                        <td height="20" colspan="3" bgcolor="#FFFFCC" class="tx1">» Personal Information</td>

                      </tr>

<tr>
<td>
    <asp:Label ID="lblName" runat="server" Text="Fist Name"></asp:Label></td>
    <td>
        <asp:TextBox ID="txtFN" runat="server"></asp:TextBox>
</td>
<td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator></td>
</tr>
<tr>
<td><asp:Label ID="lblLastname" runat="server" Text="Last Name"></asp:Label></td>
<td>
    <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox></td>
<td><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator></td>
</tr>
<tr>
<td><asp:Label ID="lblAdress" runat="server" Text="Adress"></asp:Label></td>
<td>
    <asp:TextBox ID="txtAdress" runat="server"></asp:TextBox></td>
<td><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator></td>
</tr>

<tr>
<td><asp:Label ID="lblCountry" runat="server" Text="Country"></asp:Label></td>
<td>
    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
<td><asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator></td>
</tr>
<tr>
<td><asp:Label ID="lblPhone" runat="server" Text="Telephone"></asp:Label></td>
<td>
    <asp:TextBox ID="txtTelephone" runat="server"></asp:TextBox></td>
<td><asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator></td>
</tr>
<tr>
<td><asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label></td>
<td>
    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
<td><asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator></td>
</tr>
<tr bgcolor="#598400">
                        <td height="20" colspan="3" bgcolor="#FFFFCC" class="tx1">» Details of Journey</td>
                      </tr>

</table>--%>
<table align="center">
<tr>
<td colspan="3" align="center">
<h3>Customer Booking</h3>    
</td>
</tr>
<tr>
<td colspan="3" align="center">
<asp:Label ID="lblMessage" runat="server" Visible="False" CssClass="lblMessage"></asp:Label>
</td>
</tr>
<tr bgcolor="#598400">
                        <td height="20" colspan="3" bgcolor="#FFFFCC" class="tx1">» Personal Information</td>

                      </tr>
<tr>
<td style="width: 146px"><asp:Label ID="lblCustomername" runat="server" Text="Customer Name"></asp:Label></td>
<td>
    <%--<asp:TextBox ID="txtCustomername" runat="server"></asp:TextBox>--%>
    <asp:DropDownList ID="ddlCustomername" runat="server">
    </asp:DropDownList>
    </td>
<td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="ddlCustomername" SetFocusOnError="True" InitialValue="Select">Name Reqiured</asp:RequiredFieldValidator></td>
</tr>
<tr>
<td style="width: 146px">
    <asp:Label ID="lblVehicletype" runat="server" Text="Vehicle Type"></asp:Label></td>
    <td>
    <asp:DropDownList ID="ddlVehicletype" runat="server">
    </asp:DropDownList>
</td>
<td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="ddlVehicletype" InitialValue="Select">Select Vehicle</asp:RequiredFieldValidator></td>
</tr>

<tr>
<td style="width: 146px"><asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label></td>
<td>
    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine"></asp:TextBox></td>
<td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtAddress">Address Required</asp:RequiredFieldValidator></td>
</tr>
<tr>
<td style="width: 146px"><asp:Label ID="lblPhoneno" runat="server" Text="Phone No"></asp:Label></td>
<td>
    <asp:TextBox ID="txtPhoneno" runat="server" MaxLength="13"></asp:TextBox></td>
<td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtPhoneno"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtPhoneno" SetFocusOnError="True" ValidationExpression="^([0-9]( |-)?)?(\(?[0-9]{3}\)?|[0-9]{3})( |-)?([0-9]{3}( |-)?[0-9]{4}|[a-zA-Z0-9]{7})$">Eg: 9885098850</asp:RegularExpressionValidator>
</td>
</tr>
<tr>
<td style="width: 146px"><asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label></td>
<td>
    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
<td><asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>&nbsp;
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtEmail" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Eg: proj@g.com</asp:RegularExpressionValidator>
</td>
</tr>

<tr bgcolor="#598400">
                        <td height="20" colspan="3" bgcolor="#ffffcc" class="tx1">» Pick-Up Details</td>

                      </tr>
                      <tr>
                      <td style="width: 146px">
                          <asp:Label ID="lblGuestname" runat="server" Text="Guest Name"></asp:Label></td>
                      <td>
                          <asp:TextBox ID="txtGuestname" runat="server"></asp:TextBox></td>
                      <td>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtGuestname" SetFocusOnError="True">Name Required</asp:RequiredFieldValidator></td>
                      </tr>
                      <tr>
                      <td style="width: 146px">
                          <asp:Label ID="lblPickuppoint" runat="server" Text="Pickup Address"></asp:Label>
                      </td>
                      <td>
                          <asp:TextBox ID="txtPickup" runat="server" TextMode="MultiLine"></asp:TextBox>
                      </td>
                      <td>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="txtPickup" SetFocusOnError="True">Pickup Address Required</asp:RequiredFieldValidator></td>
                      </tr>
                      <tr>
                      <td style="width: 146px">
                          <asp:Label ID="lblDroppoint" runat="server" Text="Drop Address"></asp:Label>
                      </td>
                      <td>
                          <asp:TextBox ID="txtDroppoint" runat="server" TextMode="MultiLine"></asp:TextBox></td>
                      <td>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="txtDroppoint" SetFocusOnError="True">Address Required</asp:RequiredFieldValidator></td>
                      </tr>
                      <tr>
<td style="width: 146px">
    <asp:Label ID="lblFromdate" runat="server" Text="From Date"></asp:Label>    
</td>
<td>     
    <asp:TextBox ID="txtFromdate" onclick="ds_sh(this)" onfocus="ds_sh(this)" runat="server"></asp:TextBox>      
    </td>
<td valign="bottom">
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="txtFromdate">Date Required</asp:RequiredFieldValidator>&nbsp;
<%--<table>
<tr>
<td>
    <asp:Label ID="lblTime" runat="server" Text="Time"></asp:Label>:
</td>
<td>
    <asp:ListBox ID="ListBox1" runat="server" Rows="1"></asp:ListBox></td>
</tr>
</table>--%>
</td>
</tr>
<tr>
<td style="width: 146px">
    <asp:Label ID="lblTodate" runat="server" Text="To date"></asp:Label></td>
<td>
    <asp:TextBox ID="txtTodate" onclick="ds_sh(this)" onfocus="ds_sh(this)" runat="server"></asp:TextBox></td>
    <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="txtTodate">Date Required</asp:RequiredFieldValidator>
    <%--<table>
<tr>
<td>
    <asp:Label ID="Label1" runat="server" Text="Time"></asp:Label>:
</td>
<td>
    <asp:DropDownList ID="DropDownList2" runat="server">
    </asp:DropDownList></td>
</tr>

</table>--%>
    </td>
</tr>
<tr>
<td colspan="3" align="center">
<asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
    <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" CausesValidation="False" />
    </td>
</tr>
<%--<tr>
<td >
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
</td>
</tr>--%>
<%--<tr bgcolor="#598400">
                        <td height="20" colspan="3" bgcolor="#FFFFCC" class="tx1">
                            &nbsp;Vehicle Details</td>

                      </tr>
                 <tr>
<td>
    <asp:Label ID="lblGarageoutdate" runat="server" Text="Garage out Date"></asp:Label>
</td>
<td>
    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
</td>
<td></td>
</tr>
<tr>
<td><asp:Label ID="lblGarageouttime" runat="server" Text="Garage out Time"></asp:Label></td>
<td>
    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox></td>
<td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator></td>
</tr>
<tr>
<td><asp:Label ID="lblMeterreading" runat="server" Text="Meter Reading"></asp:Label></td>
<td>
    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox></td>
<td><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator></td>
</tr>     --%>
</table>
</asp:Content>


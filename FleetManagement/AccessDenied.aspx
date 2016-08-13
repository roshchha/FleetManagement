<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccessDenied.aspx.cs" Inherits="FleetManagement.AccessDenied" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="">
    <div style="text-align:center;margin-top:50px;"> 
        <img src="assets/img/accessdenied.png" align="center" />
        <div style="color:#454545;text-align:left">
            <p style="font-size:34px;margin: 5px 0">Whoops!</p>
            <p style="margin:5px 0;">
                    The URL is Valid but you are not authorized for this content. <br>
                    Please contact the administrator if you think it's a mistake.
            </p>
            <span style="color:#454545">
                <p>You are currently signed in as: <b><%=FleetManagement.Common.Common.GetUserName(this.Page) %></b></p>
                <p><a href="Login.aspx">Sign in as a different user</a></p>
                <a href="<%=FleetManagement.Common.Common.HomePageLink %>">Click here</a> to go back to home page. 
            </span>

        </div>
    </div>
</body>
</html>

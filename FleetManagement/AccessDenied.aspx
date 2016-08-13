<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccessDenied.aspx.cs" Inherits="FleetManagement.AccessDenied" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="">
    <div style="text-align: center; margin-left: 100px; margin-top: 100px;"> 
        <img align="middle" style="float: left; margin-left: 140px;" src="assets/img/accessdenied.png">
        <div style="color: rgb(69, 69, 69); text-align: left; margin: 0px auto; width: 35%;">
            <p style="font-size:34px;margin: 5px 0">Whoops!</p>
            <p style="margin:5px 0;">
                    The URL is Valid but you are not authorized for this content. <br>
                    Please contact the administrator.
            </p>
            <span style="color:#454545">
                <p>You are currently signed in as: <b>roshni</b></p>
                <p><a href="Login.aspx">Sign in as a different user</a></p>
                <a href="Home.aspx">Click here</a> to go back to home page. 
            </span>

        </div>
    </div>
    </div>
</body>
</html>

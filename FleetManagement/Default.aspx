<%@ Page Language="C#" AutoEventWireup="true"  CodeBehind="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    
    <title>Cabs Pro</title>
       <!-- JS Scripts-->
    <!-- jQuery Js -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- Bootstrap Js -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- Metis Menu Js -->
    <script src="assets/js/jquery.metisMenu.js"></script>

         <!-- Custom Js -->
    <script src="assets/js/custom-scripts.js"></script>
    <script src="assets/js/jquery.jscrollpane.min.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FontAwesome Styles-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- Custom Styles-->
    <link href="assets/css/custom-styles.css" rel="stylesheet" />
     <!-- Google Fonts-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
     <!-- TABLE STYLES-->
    <link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
    <link href="assets/css/jquery.jscrollpane.css" rel="stylesheet" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
</head>
<body  class="home">
    <div id="wrapper">
     <nav role="navigation" class="navbar navbar-default top-navbar">
            <div class="navbar-header">
                <button data-target=".sidebar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="" class="navbar-brand"><i class="fa fa-gear"></i> <strong>CABS Pro</strong></a>
            </div>
        </nav
      
    <div class="container-fluid">
        <div class="section-content col-sm-6 col-md-8 text-left">
            <h1>Control the chaos <br>of fleet management</h1>
            <h2>Get visibility into fleet operations with CabsPro</h2>
            <br>

            <form id="form1" runat="server">
                <div class="panel panel-default col-md-5 center-block">
                    <div class="panel-heading">Log In</div>
                    <div class="panel-body">
   
                        <asp:PlaceHolder runat="server" ID="LoginStatus" Visible="false">
                            <span style="color:red;">
                                <asp:Literal runat="server" ID="StatusText" />
                            </span>
                        </asp:PlaceHolder>
                        <asp:PlaceHolder runat="server" ID="LoginForm" Visible="false">
                            <div style="margin-bottom: 5px">
                               <asp:Label runat="server" AssociatedControlID="UserName">User name</asp:Label>
                               <div>
                                  <asp:TextBox CssClass="form-control" runat="server" ID="UserName" />
                               </div>
                            </div>
                            <div style="margin-bottom: 5px">
                               <asp:Label runat="server" AssociatedControlID="Password">Password</asp:Label>
                               <div>
                                  <asp:TextBox CssClass="form-control" runat="server" ID="Password" TextMode="Password" />
                               </div>
                            </div>
                            <div style="margin-bottom: 5px">
                               <div>
                                  <asp:Button runat="server" CssClass="btn btn-primary" OnClick="SignIn" Text="Log in" />
                               </div>
                            </div>
                        </asp:PlaceHolder>
                        <asp:PlaceHolder runat="server" ID="LogoutButton" Visible="false">
                            <div>
                               <div>
                                  <asp:Button runat="server" CssClass="btn btn-primary" OnClick="SignOut" Text="Log out" />
                               </div>
                            </div>
                         </asp:PlaceHolder>
                    </div>
                </div>
            </form>
        </div>
    </div>
         
    </div>
    
</body>
</html>

using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString["SOut"]) && Request.QueryString["SOut"].ToString() == "1")
        {
           
            SignOutUser();
        }
        if (!IsPostBack)
        {
            if (User.Identity.IsAuthenticated)
            {
                StatusText.Text = string.Format("Hello {0}!!", User.Identity.GetUserName());
                
                LoginStatus.Visible = true;
                LogoutButton.Visible = true;
            }
            else
            {
                LoginForm.Visible = true;
            }
        }
    }
    protected void SignIn(object sender, EventArgs e)
    {
        var userStore = new UserStore<IdentityUser>();
        var userManager = new UserManager<IdentityUser>(userStore);
        var user = userManager.Find(UserName.Text, Password.Text);

        if (user != null)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            var userIdentity = userManager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
            
            authenticationManager.SignIn(new AuthenticationProperties() { IsPersistent = false }, userIdentity);
            Response.Redirect("~/Home.aspx");
        }
        else
        {
            StatusText.Text = "Invalid username or password.";
            LoginStatus.Visible = true;
        }
    }

    protected void SignOut(object sender, EventArgs e)
    {
        SignOutUser();
    }
    private void SignOutUser()
    {
        var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
        authenticationManager.SignOut();
        Response.Redirect("~/Login.aspx");
    }
}

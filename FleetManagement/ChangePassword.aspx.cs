using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FleetManagement
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Btn_Submit_Click(object sender, EventArgs e)
        {
            if(TxtNewPassword.Text.Equals(TxtConfirmPassword.Text,StringComparison.CurrentCulture))
            {
                StatusMessage.Text = "<span class='errorText'>Password & Confirm Password do not match</span>!";
            }

            var userStore = new UserStore<IdentityUser>();
            var manager = new UserManager<IdentityUser>(userStore);

            var result = manager.ChangePassword(this.Page.User.Identity.GetUserId(), TXtCurrentPassword.Text, TxtNewPassword.Text);
            if(result.Succeeded)
            {
                StatusMessage.Text = "<span class='errorText'>we have changed your password successfully</span>!";
            }
            else
            {
                StatusMessage.Text = "<span class='errorText'>Please try after some time, we are having issues</span>!";
            }

        }
    }
}
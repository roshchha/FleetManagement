using FleetManagement;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using System;
using System.Linq;
using System.Web;
using System.Web.Security;


public partial class AddUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!FleetManagement.Common.Common.IsAdminUser(this.Page))
        {
            Response.Redirect("~/AccessDenied.aspx");
        }
    }
    protected void CreateUser_Click(object sender, EventArgs e)
    {
        ApplicationDbContext context = new ApplicationDbContext();
        var userStore = new UserStore<IdentityUser>();
        var manager = new UserManager<IdentityUser>(userStore);
        var RoleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(context));

        if (!Password.Text.Equals(ConfirmPassword.Text))
        {
            StatusMessage.Text = "<span class='errorText'>Password & Confirm Password do not match</span>!";
        }
        else
        {
            var user = new IdentityUser() { UserName = UserName.Text, Email = TXTEmail.Text };
            IdentityResult result = manager.Create(user, Password.Text);

            if (result.Succeeded)
            {
                short role = UserRoles.SelectedValue == "-1" ? (short)3 : Convert.ToInt16(UserRoles.SelectedValue);
                string roleName = ((FleetManagement.Enums.UserRoles)role).ToString();

                if (!RoleManager.RoleExists(roleName))
                {
                    IdentityResult roleResult = RoleManager.Create(new IdentityRole(roleName));
                }

                manager.AddToRole(user.Id, roleName);
                StatusMessage.Text = "<span class='errorText'>User Added Successfully!</span>";
                UserName.Text = "";
            }
            else
            {
                StatusMessage.Text = "<span class='errorText'>" + result.Errors.FirstOrDefault() + "</span>";
            }
        }
    }
}



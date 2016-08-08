using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using System;
using System.Linq;
using System.Web;
using System.Web.Security;


    public partial class AddUser : System.Web.UI.Page
    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var userStore = new UserStore<IdentityUser>();
            var manager = new UserManager<IdentityUser>(userStore);


            if (!Password.Text.Equals(ConfirmPassword.Text))
            {
                StatusMessage.Text = "<span class='errorText'>Password & Confirm Password do not match</span>!";
            }
            else
            {
                var user = new IdentityUser() { UserName = UserName.Text , Email = TXTEmail.Text };
                IdentityResult result = manager.Create(user, Password.Text);

                if (result.Succeeded)
                {
                    short role = UserRoles.SelectedValue == "-1" ? (short)2 : Convert.ToInt16(UserRoles.SelectedValue);
                    string roleName = ((FleetManagement.Enums.UserRoles)role).ToString();
                    Roles.AddUserToRole(UserName.Text, roleName);
                    StatusMessage.Text = "<span class='errorText'>User Added Successfully!</span>";
                    UserName.Text = "";
                }
                else
                {
                    StatusMessage.Text = "<span class='errorText'>"+result.Errors.FirstOrDefault()+"</span>";
                }
            }
        }
    }


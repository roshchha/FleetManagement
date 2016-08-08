using FleetManagement.Enums;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FleetManagement
{
    public partial class UserDetails : System.Web.UI.Page
    {
        public UserStore<IdentityUser> userstore { get; set; }
        
       public UserManager<IdentityUser> userManager { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            userstore = new UserStore<IdentityUser>();
            userManager = new UserManager<IdentityUser>(userstore);
            BindRepeater();

        }

        public void BindRepeater()
        {
            var userStore = new ApplicationDbContext();
            UserDetailsRepeater.DataSource = userStore.Users.ToList();
            UserDetailsRepeater.DataBind();
        }

       protected void UserDetailsRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            DropDownList ddlRoles = (DropDownList)e.Item.FindControl("ddlRoles");
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
               // ddlRoles.DataTextField = "Type";
                ddlRoles.DataSource = Enum.GetValues(typeof(UserRoles)).Cast<UserRoles>();
                ddlRoles.DataBind();
                var user = (IdentityUser)e.Item.DataItem;
               
                string role = user.Roles.Any() ? user.Roles.First().ToString() : UserRoles.Member.ToString();
                ddlRoles.SelectedValue = role;
            }
        }

        protected void UserDetailsRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            LinkButton lnkUpdate        = (LinkButton)e.Item.FindControl("lnkUpdate");
            DropDownList ddlRoles       = (DropDownList)e.Item.FindControl("ddlRoles");
            var user = userManager.Users.Where(a => a.Id == (string)e.CommandArgument).FirstOrDefault();
            if (e.CommandName == "update")
            {
                    Roles.AddUserToRole(user.UserName, ddlRoles.SelectedValue);
                    BindRepeater();
            }
            if (e.CommandName == "delete")
            {
                var result = userManager.Delete(user);
                BindRepeater();
            }
        }

        
    }
}
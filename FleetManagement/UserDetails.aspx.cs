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
        //public UserStore<IdentityUser> userstore { get; set; }
        public ApplicationDbContext _ctx = new ApplicationDbContext();

        public UserManager<IdentityUser> userManager { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            
            userManager = new UserManager<IdentityUser>(new UserStore<IdentityUser>());
            if (!IsPostBack)
            {
                BindRepeater();
            }

        }

        public void BindRepeater()
        {
            UserDetailsRepeater.DataSource = _ctx.Users.ToList();
            UserDetailsRepeater.DataBind();
        }

        protected void UserDetailsRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DropDownList ddlRoles = (DropDownList)e.Item.FindControl("ddlRoles");
                string selVal = ddlRoles.SelectedValue;
                // ddlRoles.DataTextField = "Type";
                ddlRoles.DataSource = Enum.GetValues(typeof(UserRoles)).Cast<UserRoles>();
               // ddlRoles.Items.Add(new ListItem("select"));
                ddlRoles.DataBind();
                ddlRoles.SelectedValue = selVal;
                var user = (IdentityUser)e.Item.DataItem;
                if (user.Roles.Count > 0)
                {
                    string role_id = user.Roles.First().RoleId;
                    IdentityRole _role = _ctx.Roles.FirstOrDefault(r => r.Id == role_id);

                    string role = user.Roles.Any() ? _role.Name : UserRoles.Staff.ToString();
                    ddlRoles.SelectedValue = role;
                }
                else
                {
                    ddlRoles.SelectedValue = "select";// UserRoles.Member.ToString();

                }
               LinkButton lnkDelete =(LinkButton) e.Item.FindControl("lnkDelete");
               if (user.Id == User.Identity.GetUserId())
               {
                   lnkDelete.Visible = false;
               }
            }
        }

        protected void UserDetailsRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            LinkButton lnkUpdate = (LinkButton)e.Item.FindControl("lnkUpdate");
            DropDownList ddlRoles = (DropDownList)e.Item.FindControl("ddlRoles");
            var user = userManager.Users.Where(a => a.Id == (string)e.CommandArgument).FirstOrDefault();
            if (e.CommandName == "update")
            {
                string role_id = user.Roles.First().RoleId;
                IdentityRole _role = _ctx.Roles.FirstOrDefault(r => r.Id == role_id);
                userManager.RemoveFromRole(user.Id, _role.Name);
                userManager.AddToRole(user.Id, ddlRoles.SelectedValue);

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
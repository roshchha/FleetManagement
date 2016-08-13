using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using FleetManagement.Enums;
using Microsoft.AspNet.Identity.EntityFramework;

namespace FleetManagement.Common
{
    public class Common
    {
        #region Properties
        public static string HomePageLink
        {
            get { return System.Configuration.ConfigurationSettings.AppSettings["HomePageLink"].ToString(); }
        }
        #endregion

        private static ApplicationDbContext _ctx = new ApplicationDbContext();


        #region Methods
        /// <summary>
        /// This will return liste item array from enum
        /// </summary>
        /// <typeparam name="TEnum"></typeparam>
        /// <returns></returns>
        public static List<ListItem> ToListItems<TEnum>()
         where TEnum : struct, IComparable, IFormattable, IConvertible
        {
            return (from TEnum e in Enum.GetValues(typeof(TEnum))
                    select new ListItem { Text = e.ToString(), Value = Convert.ToInt32(e).ToString() }).ToList();

        }
        public static string GetUserName(System.Web.UI.Page page)
        {
            return string.Format("Hello {0}!", page.User.Identity.GetUserName());
        }
        public static bool IsSuperAdminUser(Page page)
        {
            var user = GetCurrentUser(page);
            var role = _ctx.Roles.FirstOrDefault(r => r.Name.ToLower() == "superadmin");
            if (user.Roles.Any(r => r.RoleId == role.Id))
            {
                return true;
            }
            return false;
        }
        public static bool IsAdminUser(Page page)
        {
            var user = GetCurrentUser(page);
            var role = _ctx.Roles.FirstOrDefault(r => r.Name.ToLower() == "admin");
            if (user.Roles.Any(r => r.RoleId == role.Id))
            {
                return true;
            }
            return false;
        }

        public static bool IsStaffUser(Page page)
        {
            var user = GetCurrentUser(page);
            var role = _ctx.Roles.FirstOrDefault(r => r.Name.ToLower() == "staff");
            if (user.Roles.Any(r => r.RoleId == role.Id))
            {
                return true;
            }
            return false;
        }

        public static UserRoles GetCurrentUserRole(Page page)
        {
            var user = GetCurrentUser(page);
            var admin_role = _ctx.Roles.FirstOrDefault(r => r.Name.ToLower() == "admin");
            var super_admin_role = _ctx.Roles.FirstOrDefault(r => r.Name.ToLower() == "superadmin");
            if (user.Roles.Any(r => r.RoleId == admin_role.Id))
            {
                return UserRoles.Admin;
            }
            else if (user.Roles.Any(r => r.RoleId == super_admin_role.Id))
            {
                return UserRoles.SuperAdmin;
            }
            else
            {
                return UserRoles.Staff;
            }

        }

        public static IdentityUser GetCurrentUser(Page page)
        {
            string currentUserId = page.User.Identity.GetUserId();
            var user = _ctx.Users.Find(currentUserId);
            return user;
        }

        #endregion
    }
}
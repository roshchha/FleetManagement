﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace FleetManagement.Common
{
    public class Common
    {
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
    }
}
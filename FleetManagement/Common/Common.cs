using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace FleetManagement.Common
{
    public class Common
    {
        public static List<ListItem> ToListItems<TEnum>()
         where TEnum : struct, IComparable, IFormattable, IConvertible
        {
            return (from TEnum e in Enum.GetValues(typeof(TEnum))
                    select new ListItem { Text = e.ToString(), Value = Convert.ToInt32(e).ToString() }).ToList();

        }
    }
}
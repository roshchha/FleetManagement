using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace FleetManagement.Common
{
    public static class Extension
    {

        #region Data Table Methods

        public static string GetValue(this System.Data.DataRow dr, string columnName)
        {
            return dr.Table.Columns.Contains(columnName) && dr[columnName] != DBNull.Value ? dr[columnName].ToString() : null;
        }

        public static DateTime GetDateTimeValue(this System.Data.DataRow dr, string columnName)
        {
            return dr.Table.Columns.Contains(columnName) && dr[columnName] != DBNull.Value ? DateTime.Parse(dr[columnName].ToString()) : DateTime.MinValue;
        }

        public static int GetIntValue(this System.Data.DataRow dr, string columnName)
        {
            string data = dr.Table.Columns.Contains(columnName) && dr[columnName] != DBNull.Value ? dr[columnName].ToString() : null;
            return (string.IsNullOrEmpty(data)) ? 0 : int.Parse(data);
        }

        public static decimal? GetDecimalValue(this System.Data.DataRow dr, string columnName)
        {
            string data = dr.Table.Columns.Contains(columnName) && dr[columnName] != DBNull.Value ? dr[columnName].ToString() : null;
            if (string.IsNullOrEmpty(data))
            {
                return null;
            }
            else
            {
                return decimal.Parse(data);
            }
        }

        public static bool GetBoolValue(this System.Data.DataRow dr, string columnName)
        {
            string data = dr.Table.Columns.Contains(columnName) && dr[columnName] != DBNull.Value ? dr[columnName].ToString() : null;
            bool returnVal = false;
            bool.TryParse(data, out returnVal);
            return returnVal;
        }

        public static bool? GetNullableBoolValue(this System.Data.DataRow dr, string columnName)
        {
            string data = dr.Table.Columns.Contains(columnName) && dr[columnName] != DBNull.Value ? dr[columnName].ToString() : null;
            bool? returnVal = null;
            if (!string.IsNullOrEmpty(data)) return bool.Parse(data);
            return returnVal;
        }

        public static int? GetNullableIntValue(this System.Data.DataRow dr, string columnName)
        {
            string data = dr.Table.Columns.Contains(columnName) && dr[columnName] != DBNull.Value ? dr[columnName].ToString() : null;
            int? returnVal = null;
            if (!string.IsNullOrEmpty(data)) return int.Parse(data);
            return returnVal;
        }

        public static string GetValue(this System.Data.SqlClient.SqlDataReader dr, string columnName)
        {
            return dr[columnName] != DBNull.Value ? dr[columnName].ToString() : null;
        }

        public static bool ValidDataSet(this DataSet ds)
        {
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                return true;
            }
            return false;
        }

        #endregion

        public static DateTime ToDateTime(this string dateTimeStr)
        {
            DateTime defaultDate = new DateTime(1900,1,1);
            if (string.IsNullOrWhiteSpace(dateTimeStr)) return defaultDate;
            else
            {
                DateTime date;
                if (DateTime.TryParse(dateTimeStr, System.Globalization.DateTimeFormatInfo.InvariantInfo,System.Globalization.DateTimeStyles.None, out date))
                {
                    return date;
                }
            }
            return defaultDate;
        }
    }

}
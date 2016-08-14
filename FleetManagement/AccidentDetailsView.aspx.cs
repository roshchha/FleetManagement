using FleetManagement.Entities;
using FleetManagement.Interfaces;
using FleetManagement.Services;
using System;
using System.Web.UI;

namespace FleetManagement
{
    public partial class AccidentDetailsView : Page
    {
        IEntityService<AccidentDetails> accidentdetails_service = new AccidentDetailsService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRepeater();
            }

        }

        public void BindRepeater()
        {
            RPT_AccidentDetails.DataSource = accidentdetails_service.Get();
            RPT_AccidentDetails.DataBind();
        }
    }
}
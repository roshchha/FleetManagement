using FleetManagement.Entities;
using FleetManagement.Interfaces;
using FleetManagement.Services;
using System;
using System.Web.UI;

namespace FleetManagement
{
    public partial class VehicleTariffView : Page
    {
        IEntityService<Tariff> tariff_service = new TariffService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRepeater();
            }

        }

        public void BindRepeater()
        {
            RPT_VehicleTariff.DataSource = tariff_service.Get();
            RPT_VehicleTariff.DataBind();
        }
    }
}
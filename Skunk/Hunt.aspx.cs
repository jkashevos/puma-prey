using System;
using System.Collections.Generic;
using System.Linq;

using Microsoft.Security.Application;

using Puma.Prey.Rabbit.EF;

namespace Skunk
{
	public partial class Hunt : System.Web.UI.Page
	{
		private RabbitDBContext _db = new RabbitDBContext();

        public bool hunt_overview;

        protected void Page_Load(object sender, EventArgs e)
		{

            var hunt_id = Request.QueryString["h"];
            var hunt_list = _db.Hunts.ToList();

            if (hunt_id != null)
			{
                var hunt = (from p in _db.Hunts
                            where p.Id == Convert.ToInt32(hunt_id)
                            select p).SingleOrDefault();
                lblProductName.Text = hunt.Name;
				lblPrice.Text = hunt.Price.ToString("C");
				lDetails.Text = Encoder.HtmlEncode(hunt.Description);
				hlRate.NavigateUrl = "~/Hunts/Feedback?p=" + hunt.Id.ToString();
				hProdID.Value = hunt.Id.ToString();
                hunt_overview = false;
			}

            else
            {
                huntGrid.DataSource = hunt_list;
                huntGrid.DataBind();
                hunt_overview = true;
            }
		}
	}
}
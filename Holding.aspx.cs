using DeveloperSite.Common.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DeveloperSite
{
    public partial class _Holding : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string lob = '"' + Request.QueryString["lob"] + '"';
            lblLobName.Text = lob;
        }
    }
}
 
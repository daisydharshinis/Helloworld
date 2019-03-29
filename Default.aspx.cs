using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DeveloperSite
{
    public partial class _Default : SandboxWebPage
    {
        protected void OnCheckoutButton_Click(object sender, EventArgs e)
        {
            switch (((Button)sender).ID)
            {
                case "btnGoBA":
                    Response.Redirect(Page.GetRouteUrl("business-analyst-sandbox", null));
                    break;
                case "btnGoDev":
                    Response.Redirect(Page.GetRouteUrl("developer-sandbox-products", null));
                    break;
                case "btnGoUE":
                    Response.Redirect(Page.GetRouteUrl("solartis-user-experience-sandbox", null));
                    break;
            }
        }
    }
}
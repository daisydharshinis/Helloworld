using DeveloperSite.Common;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace DeveloperSite
{
    public class SandboxWebPage : System.Web.UI.Page
    {
        public bool HasPrivilege(string privilege)
        {
            Debug.WriteLine(privilege);
            SiteMaster master = (SiteMaster)this.Page.Master;
            return master.HasPrivilege(privilege);
        }
        public bool HasRole(string role)
        {
            Debug.WriteLine(role);
            SiteMaster master = (SiteMaster)this.Page.Master;
            return master.HasRole(role);
        }

        public bool IsLoggedIn()
        {
            SiteMaster master = (SiteMaster)this.Page.Master;
            return master.IsLoggedIn();
        }

        public string GetTokenIfNotGenerated(string lob, string api, string tokenDetail, string env = "")
        {
            string token = string.Empty;
            if (Session[string.Format("Token_{0}_{1}", lob, api)] != null)
            {
                token = Session[string.Format("Token_{0}_{1}", lob, api)] as string;
            }
            else
            {
                token = TokenMaker.Make(tokenDetail, env);
                Session[string.Format("Token_{0}_{1}", lob, api)] = token;
            }
            return token;
        }
    }
}
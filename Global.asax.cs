using System;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Configuration;
using DeveloperSite.Common;
using DeveloperSite.Common.Api;

namespace DeveloperSite
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            Application["OnlineCounter"] = 0;
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            //Code that runs when a new session is started
            string strUserName = ConfigurationManager.AppSettings["UserName"];
            string strPassword = ConfigurationManager.AppSettings["Password"];
            //var authResult = ServiceClient.Authenticate("1", strUserName, strPassword);
            Session["APIToken"] = ConfigurationManager.AppSettings["APITokenForSandbox"];

            if (Application["OnlineCounter"] != null)
            {
                Application.Lock();
                Application["OnlineCounter"] = ((int)Application["OnlineCounter"]) + 1;
                Application.UnLock();
            }

            /* Toggle the role after logging in from platform */
            //Session["UserRole"] = authResult["UserRole"];
            //Session["UserRole"] = authResult["UserRole"];

            //Session["Privileges"] = ServiceClient.getPrivileges(authResult);
        }

        protected void Session_End(object sender, EventArgs e)
        {
            if (Application["OnlineCounter"] != null)
            {
                Application.Lock();
                Application["OnlineCounter"] = ((int)Application["OnlineCounter"]) - 1;
                Application.UnLock();
            }
        }

        
    }

}
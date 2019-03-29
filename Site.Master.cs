using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Newtonsoft.Json.Linq;
using DeveloperSite.Common.Util;
using System.Linq;
using System.IO;

namespace DeveloperSite
{
    public partial class SiteMaster : MasterPage
    {
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;
        private string LicenseAgreementFilePath = "/Account/EvaluationLicenseAgreement.pdf";
        private string SandboxConfiguration = "/Configuration/SandboxConfiguration.json";


        protected void Page_Init(object sender, EventArgs e)
        {
            // The code below helps to protect against XSRF attacks
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Use the Anti-XSRF token from the cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generate a new Anti-XSRF token and save to the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Register.CausesValidation = false;
                // Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }
            OnLineCounter.Text = Application["OnlineCounter"] != null ? Application["OnlineCounter"].ToString() : "";
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            alertMessage.Visible = false;
            CheckForNonLoginPage();
            navAnonymous.Visible = IsLoggedIn() ? false : true;
            navLoggedIn.Visible = IsLoggedIn() ? true : false;
            LicenseAgreement.Visible = IsLoggedIn() ? true : false;
            navAdmin.Visible = HasRole("admin") ? true : false;
            navManager.Visible = HasRole("manager") ? true : false;

            string sandboxConfigContent = File.ReadAllText(Server.MapPath(SandboxConfiguration));
            JObject sbConfig = JObject.Parse(sandboxConfigContent);
        }

        private void CheckForNonLoginPage()
        {
            try
            {
                String path = HttpContext.Current.Request.Url.AbsolutePath.ToLower();

                if (path.Equals("/user/login"))
                {
                    LogIn.Visible = false;
                    Register.Visible = true;
                }
                else if (path.Equals("/user/register"))
                {
                    LogIn.Visible = true;
                    Register.Visible = false;
                }
            }
            catch (Exception expM)
            {
                Response.Write(expM.Message);
            }
        }

        protected void PerformClickAction(object sender, EventArgs e)
        {
            LinkButton button = (LinkButton)sender;
            switch (button.ID)
            {
                case "LogIn":
                    if (HttpContext.Current.Request.Url.AbsolutePath.Equals("/user/register"))
                        Response.Redirect(Page.GetRouteUrl("login", null) + "?return=" + Page.GetRouteUrl("home", null));
                    else
                        Response.Redirect(Page.GetRouteUrl("login", null) + "?return=" + HttpContext.Current.Request.Url.AbsoluteUri);
                    break;
                case "LogOut":
                    //Session["Token"] = null;
                    //Session["Privileges"] = null;
                    Session.Clear();
                    Session.Abandon();
                    Response.Cookies["ASP.NET_SessionId"].Value = string.Empty;
                    Response.Cookies["ASP.NET_SessionId"].Expires = DateTime.Now.AddMonths(-10);
                    navAnonymous.Visible = true;
                    navLoggedIn.Visible = false;
                    navAdmin.Visible = false;
                    LicenseAgreement.Visible = false;
                    Response.Redirect("~/");
                    break;
                case "lnkRegister":
                    Response.Redirect(Page.GetRouteUrl("register", null));
                    break;
                case "lnkManageUser":
                    Response.Redirect(Page.GetRouteUrl("manage-user", null));
                    break;
                case "lnkActivities":
                    Response.Redirect(Page.GetRouteUrl("user-activity", null));
                    break;
                case "lnkConfigureBASandbox":
                    Response.Redirect(Page.GetRouteUrl("configure-sandbox", new { SANDBOX = "business-analyst", PRODUCT = "iso-products", FILE = "input-attributes" }));
                    break;
                case "lnkConfigureDevSandbox":
                    Response.Redirect(Page.GetRouteUrl("configure-sandbox", new { SANDBOX = "developer" }));
                    break;
                case "lnkConfigureUESandbox":
                    Response.Redirect(Page.GetRouteUrl("configure-sandbox", new { SANDBOX = "user-experience" }));
                    break;
                case "LicenseAgreement":
                    WebServiceUtil.TransmitFile(LicenseAgreementFilePath, "application/pdf", "solartis-license-agreement.pdf");
                    break;
            }
        }

        public bool HasPrivilege(string privilege)
        {
            if (IsLoggedIn())
            {
                List<string> privileges = (List<string>)Session["Privileges"];
                if (privileges != null && privileges.Contains(privilege, StringComparer.OrdinalIgnoreCase))
                {
                    return true;
                }
            }
            return false;
        }
        public bool HasRole(string role)
        {
            if (IsLoggedIn())
            {
                List<string> roles = (List<string>)Session["Roles"];
                if (roles != null && roles.Contains(role, StringComparer.OrdinalIgnoreCase))
                {
                    return true;
                }
            }
            return false;
        }

        public bool IsLoggedIn()
        {
            if (Session["Token"] != null && Session["Token"].ToString().Length > 1)
                return true;
            return false;
        }

        // Not Used
        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            Session["Token"] = null;
        }
    }
}
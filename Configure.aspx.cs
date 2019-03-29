using DeveloperSite.Common.Util;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace DeveloperSite
{
    public partial class Configure : SandboxWebPage
    {

        string Sandbox;
        string Product;
        string xmlFile;

        string BusinessAnalystConfigurationFilePath = "";

        string DeveloperConfigurationFilePath = "~/Configuration/Developer/DeveloperSandboxConfiguration.json";
        string UserExperienceConfigurationFilePath = "~/Configuration/UserExperience/UserExperienceSandboxConfiguration.json";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (RouteData.Values.Count == 0)
                    Response.Redirect(Page.GetRouteUrl("home", null));

                if (IsLoggedIn())
                {
                    if (!HasRole("admin"))
                    {
                        Response.Redirect("~/");
                        return;
                    }
                }
                else
                {
                    Response.Redirect(Page.GetRouteUrl("login", null) + "?return=" + HttpContext.Current.Request.Url.AbsoluteUri);
                    return;
                }

                UIResetConfiguration_Click(null, null);
            }
        }

        private string getStringFromFile(string filePath)
        {
            return File.Exists(Server.MapPath(filePath)) ? File.ReadAllText(Server.MapPath(filePath)) : "";
        }

        private void saveStringToFile(string filePath, string content)
        {
            File.WriteAllText(Server.MapPath(filePath), content);
        }

        protected void UIResetConfiguration_Click(object sender, EventArgs e)
        {
            ltrSaveSuccess.Visible = false;
            Sandbox = RouteData.Values["SANDBOX"].ToString().ToLower();
            switch (Sandbox)
            {
                case "business-analyst":
                    UIConfiguration.Visible = false;
                    divBAXMLConfiguration.Visible = true;
                    BAXMLConfiguration.Visible = true;
                    UISandboxTitle.InnerText = "Configure Business Analyst Sandbox";
                    //UIConfiguration.Text = getStringFromFile(BusinessAnalystConfigurationFilePath);
                    Product = RouteData.Values["PRODUCT"].ToString().ToLower();
                    xmlFile = RouteData.Values["FILE"].ToString().ToLower();
                    switch (Product)
                    {
                        case "iso-products":
                            if (xmlFile == "input-attributes")
                            {
                                string path = "~/Configuration/BusinessAnalyst/ISO/InputAttributeList.xml";
                                UISandboxTitle.InnerText = "Configure Business Analyst Sandbox - Input Attributes of ISO Products";
                                BAXMLConfiguration.Text = getStringFromFile(path);
                            }
                            if (xmlFile == "output-attributes")
                            {
                                string path = "~/Configuration/BusinessAnalyst/ISO/OutputAttributeList.xml";
                                UISandboxTitle.InnerText = "Configure Business Analyst Sandbox - Output Attributes of ISO Products";
                                BAXMLConfiguration.Text = getStringFromFile(path);
                            }
                            break;
                        case "solartis-products":
                            if (xmlFile == "input-attributes")
                            {
                                string path = "~/Configuration/BusinessAnalyst/NonISO/InputAttributeList.xml";
                                UISandboxTitle.InnerText = "Configure Business Analyst Sandbox - Input Attributes of Solartis Products";
                                BAXMLConfiguration.Text = getStringFromFile(path);
                            }
                            if (xmlFile == "output-attributes")
                            {
                                string path = "~/Configuration/BusinessAnalyst/NonISO/OutputAttributeList.xml";
                                UISandboxTitle.InnerText = "Configure Business Analyst Sandbox - Output Attributes of Solartis Products";
                                BAXMLConfiguration.Text = getStringFromFile(path);
                            }
                            break;
                    }
                    break;
                case "developer":
                    UISandboxTitle.InnerText = "Configure Developer Sandbox";
                    UIConfiguration.Text = getStringFromFile(DeveloperConfigurationFilePath);
                    break;
                case "user-experience":
                    UISandboxTitle.InnerText = "Configure User Experience Sandbox";
                    UIConfiguration.Text = getStringFromFile(UserExperienceConfigurationFilePath);
                    break;
            }
        }

        protected void UICancelConfiguration_Click(object sender, EventArgs e)
        {
            Response.Redirect(Page.GetRouteUrl("home", null));
        }

        protected void UISaveConfgiuration_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                Sandbox = RouteData.Values["SANDBOX"].ToString().ToLower();
                switch (Sandbox)
                {
                    case "business-analyst":
                        //saveStringToFile(BusinessAnalystConfigurationFilePath, UIConfiguration.Text);
                        Product = RouteData.Values["PRODUCT"].ToString().ToLower();
                        xmlFile = RouteData.Values["FILE"].ToString().ToLower();
                        switch (Product)
                        {
                            case "iso-products":
                                if (xmlFile == "input-attributes")
                                {
                                    saveStringToFile("~/Configuration/BusinessAnalyst/ISO/InputAttributeList.xml", BAXMLConfiguration.Text);
                                }
                                if (xmlFile == "output-attributes")
                                {
                                    saveStringToFile("~/Configuration/BusinessAnalyst/ISO/OutputAttributeList.xml", BAXMLConfiguration.Text);
                                }
                                break;
                            case "solartis-products":
                                if (xmlFile == "input-attributes")
                                {
                                    saveStringToFile("~/Configuration/BusinessAnalyst/NonISO/InputAttributeList.xml", BAXMLConfiguration.Text);
                                }
                                if (xmlFile == "output-attributes")
                                {
                                    saveStringToFile("~/Configuration/BusinessAnalyst/NonISO/OutputAttributeList.xml", BAXMLConfiguration.Text);
                                }
                                break;
                        }
                        break;
                    case "developer":
                        saveStringToFile(DeveloperConfigurationFilePath, UIConfiguration.Text);
                        break;
                    case "user-experience":
                        saveStringToFile(UserExperienceConfigurationFilePath, UIConfiguration.Text);
                        break;
                }
                ltrSaveSuccess.Visible = true;
            }
        }

        protected void UIConfiguration_ServerValidate(object source, ServerValidateEventArgs e)
        {
            e.IsValid = WebServiceUtil.IsValidJson(e.Value) ? true : false;
        }

        protected void BAXmlConfiguration_click(object sender, EventArgs e)
        {
            UIConfiguration.Visible = false;
            BAXMLConfiguration.Visible = true;
            LinkButton btn = (LinkButton)sender;
            switch (btn.ID)
            {
                case "lnkISOInputAttributes":
                    Response.Redirect(Page.GetRouteUrl("configure-sandbox", new { SANDBOX = "business-analyst", PRODUCT = "iso-products", FILE = "input-attributes" }));
                    break;
                case "lnkISOOutputAttributes":
                    Response.Redirect(Page.GetRouteUrl("configure-sandbox", new { SANDBOX = "business-analyst", PRODUCT = "iso-products", FILE = "output-attributes" }));
                    break;
                case "lnkSolartisInputAttributes":
                    Response.Redirect(Page.GetRouteUrl("configure-sandbox", new { SANDBOX = "business-analyst", PRODUCT = "solartis-products", FILE = "input-attributes" }));
                    break;
                case "lnkSolartisOutputAttributes":
                    Response.Redirect(Page.GetRouteUrl("configure-sandbox", new { SANDBOX = "business-analyst", PRODUCT = "solartis-products", FILE = "output-attributes" }));
                    break;
            }
        }

        protected void BAXMLConfiguration_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = WebServiceUtil.isValidateXML(args.Value);
        }
    }
}
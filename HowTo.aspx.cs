using DeveloperSite.Common.Api;
using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DeveloperSite
{
    public partial class HowTo : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var dic = new Dictionary<string, object>();
            dic["Object::ISO::LOB"] = "CA";
            dic["Object::Common::FromRow"] = "1";
            dic["Object::Common::ToRow"] = "5";
            var forms = SandboxKB.GetFormsList(dic);
        }
        protected void LoadVideo(object sender, EventArgs e)
        {
            LinkButton linkButton = (LinkButton)sender;

            switch (linkButton.ID)
            {
                case "lnkBOP":
                    videoSource.Src = "/Images/Demo.mp4"; demoVideo.Focus();
                    hdrProduct.InnerText = "ISO - Business Owners";
                    break;
                case "lnkGL":
                    videoSource.Src = "/Images/Demo.webm"; demoVideo.Focus();
                    hdrProduct.InnerText = "ISO - General Liability";
                    break;
                case "lnkCUP":
                    videoSource.Src = "/Images/Demo.mp4"; demoVideo.Focus();
                    hdrProduct.InnerText = "ISO - Commercial Umbrella";
                    break;
                case "lnkIH":
                    videoSource.Src = "/Images/Demo.webm"; demoVideo.Focus();
                    hdrProduct.InnerText = "ISO - non-filed Inland Marine";
                    break;
                case "lnkCA":
                    videoSource.Src = "/Images/Demo.mp4"; demoVideo.Focus();
                    hdrProduct.InnerText = "ISO - Commercial Auto(CA)";
                    break;
                case "lnkAU":
                    videoSource.Src = "/Images/Demo.webm"; demoVideo.Focus();
                    hdrProduct.InnerText = "ISO - Commercial Auto - OCP";
                    break;
                case "lnkLTI":
                    videoSource.Src = "/Images/Demo.mp4"; demoVideo.Focus();
                    hdrProduct.InnerText = "Leisure Travels";
                    break;
                case "lnkCEQ":
                    videoSource.Src = "/Images/Demo.webm"; demoVideo.Focus();
                    hdrProduct.InnerText = "Commercial Earthquake";
                    break;
                case "lnkProff":
                    videoSource.Src = "/Images/Demo.mp4"; demoVideo.Focus();
                    hdrProduct.InnerText = "Proffessional Liability";
                    break;
                case "lnkFWC":
                    videoSource.Src = "/Images/Demo.webm"; demoVideo.Focus();
                    hdrProduct.InnerText = "Fire and Wind Coverage";
                    break;
                case "lnkPL":
                    videoSource.Src = "/Images/Demo.mp4"; demoVideo.Focus();
                    hdrProduct.InnerText = "Personal Lines";
                    break;
                case "lnkArt":
                    videoSource.Src = "/Images/Demo.webm"; demoVideo.Focus();
                    hdrProduct.InnerText = "Small Commercial - Artisan Contractors";
                    break;
                case "lnkHab":
                    videoSource.Src = "/Images/Demo.mp4"; demoVideo.Focus();
                    hdrProduct.InnerText = "Small Commercial - Habitational";
                    break;
                case "lnkVac":
                    videoSource.Src = "/Images/Demo.webm"; demoVideo.Focus();
                    hdrProduct.InnerText = "Small Commercial - Vacant";
                    break;
            }
        }
    }
}
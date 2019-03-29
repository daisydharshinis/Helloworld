using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DeveloperSite.Startup))]
namespace DeveloperSite
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
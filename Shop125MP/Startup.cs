using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Shop125MP.Startup))]
namespace Shop125MP
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(project_food_panda.Startup))]
namespace project_food_panda
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

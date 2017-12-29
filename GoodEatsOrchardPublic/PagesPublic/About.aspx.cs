using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GoodEatsOrchardPublic.Code;

namespace GoodEatsOrchardPublic
{
    public partial class About1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AboutUs aboutUs = decerealizer.GetAboutUs();
            Literal1.Text = aboutUs.content;
        }
    }
}
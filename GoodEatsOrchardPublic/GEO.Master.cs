using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GoodEatsOrchardPublic
{
    public partial class GEO : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["loggedIn"] == "yes")
            {
                loggedInBanner.Visible = true;
            }
            else
            {
                loggedInBanner.Visible = false;
            }
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("/Home.aspx");
        }
    }
}
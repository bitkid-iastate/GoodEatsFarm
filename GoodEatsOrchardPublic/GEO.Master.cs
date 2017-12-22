using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GoodEatsOrchardPublic.Code;

namespace GoodEatsOrchardPublic
{
    public partial class GEO : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Announcement announce = decerealizer.GetAnnouncement();
            VisitCounter counter = decerealizer.GetVisitCounter();

            // If the session has not been counted, count it then mark it counted.
            if ((string)System.Web.HttpContext.Current.Session["counted"] != "yes")
            {
                counter.numOfVisits++;
                counter.serialize();
                Session["counted"] = "yes";
            }
            
            // Displays this banner if logged in.
            if ((string)Session["loggedIn"] == "yes")
            {
                loggedInBanner.Visible = true;
            }
            else
            {
                loggedInBanner.Visible = false;
            }
            // Checks for and sets announcement
            if (announce.onOrOff)
            {
                txtAnnounce.Visible = true;
                Literal1.Text = announce.announce;
            }
            else
            {
                txtAnnounce.Visible = false;
            }
        }

        // This button logs the user out.
        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("/Home.aspx");
        }
    }
}
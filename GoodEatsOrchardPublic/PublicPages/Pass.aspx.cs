using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GoodEatsOrchardPublic.PublicPages
{
    public partial class Pass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["loggedIn"] == "yes")
            {
                lblAlreadyIn.Visible = true;
                Panel1.Visible = false;
            }
            else
            {
                Panel1.Visible = true;
            }
            if (IsPostBack && (string)Session["loggedIn"] != "yes")
            {
                lblWrong.Visible = true;
            }
            else
            {
                lblWrong.Visible = false;
            }
        }

        protected void btnSubmit_Command(object sender, CommandEventArgs e)
        {
            if (TextBox1.Text == "secret")
            {
                Session["loggedIn"] = "yes";
                lblWrong.Visible = false;
                Response.Redirect("/dash.aspx");
            }
        }
    }
}
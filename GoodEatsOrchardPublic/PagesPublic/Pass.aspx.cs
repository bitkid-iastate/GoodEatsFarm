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
        //This is the website's login page.
        protected void Page_Load(object sender, EventArgs e)
        {
            /*
             * Checks if a user is already logged in.
             * If the user is not logged in the are shown the login form.
             * If they are logged in they are informed of it and the admin navbar is shown.
             */
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

        //Checks the credentials. If the password is correct, the user is logged in via session variable.
        protected void btnSubmit_Command(object sender, CommandEventArgs e)
        {
            if (TextBox1.Text == "secret")
            {
                Session["loggedIn"] = "yes";
                lblWrong.Visible = false;
                Response.Redirect("~/PagesAdmin/dash.aspx");
            }
        }
    }
}
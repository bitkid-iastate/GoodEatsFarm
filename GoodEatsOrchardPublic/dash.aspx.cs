using GoodEatsOrchardPublic.Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GoodEatsOrchardPublic
{
    public partial class dash : System.Web.UI.Page
    {
        Announcement ann = decerealizer.GetAnnouncement();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Methods.isLoggedIn())
            {
                Response.Redirect("~/Home.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    if (ann.onOrOff == true)
                    {
                        chkJumbo.Checked = true;
                        txtJumbo.Visible = true;
                    }
                    else
                    {
                        chkJumbo.Checked = false;
                    }
                    if (ann.announce != "" && ann.announce != null)
                    {
                        txtJumbo.Text = ann.announce;
                        txtJumbo.Visible = false;
                    }
                }



              
                    if (chkJumbo.Checked)
                    {
                        txtJumbo.Visible = true;

                    }
                    else
                    {
                        txtJumbo.Visible = false;

                    }
                









            }
        }

        protected void chkJumbo_Changed(object sender, EventArgs e)
        {
            if (chkJumbo.Checked)
            {
                txtJumbo.Visible = true;
                ann.onOrOff = true;
                ann.serialize();
            }
            else
            {
                txtJumbo.Visible = false;
                ann.onOrOff = false;
                ann.serialize();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            string x = txtJumbo.Text;
            ann.announce = x;
            ann.serialize();
            Response.Write(x);
            Response.Write(ann.announce);
        }
    }
}
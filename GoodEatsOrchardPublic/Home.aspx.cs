using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GoodEatsOrchardPublic.Code;
using System.Data;

namespace GoodEatsOrchardPublic
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet imagesData = Methods.GetImages(Server.MapPath("~/Images/Rotator"));
string x = "";
            int somnum = 1;
            for (int i = 0; i < imagesData.Tables[0].Rows.Count-1; i++)
            {
                x += String.Format("<li data-target = \"#myCarousel\" data-slide-to = \"{0}\" ></li>",  somnum);
                somnum++;
            }
            Literal2.Text = x;

            string y = "";
            for(int i=0; i<imagesData.Tables[0].Rows.Count; i++ )
            {
                if (i == 0)
                {
                    y += String.Format("<div class=\"item active\"><img src =\"/Images/Rotator/{0}\" style=\"width:100%;\"></div>", imagesData.Tables[0].Rows[i][0]);
                }
                else
                {
                    y += String.Format("<div class=\"item\"><img src =\"/Images/Rotator/{0}\" style=\"width:100%;\"></div>", imagesData.Tables[0].Rows[i][0]);
                }
            }
            Literal3.Text = y;

            Homepage hp = decerealizer.GetHomepageContent();
            Literal1.Text = hp.content;
        }
    }
}
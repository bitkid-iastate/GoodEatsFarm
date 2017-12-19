using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;


namespace GoodEatsOrchardPublic
{
    public partial class Gallery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string htmlString = "";
            foreach (string file in Directory.GetFiles(Server.MapPath("~/Images/Gallery")).Select(Path.GetFileName))
            {
                htmlString += "<img src=\"/Images/Gallery/" + file + "\"/>";

            }
            

            litGallery.Text = htmlString;

        }


    }
}
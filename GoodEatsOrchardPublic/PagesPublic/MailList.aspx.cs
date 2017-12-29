using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GoodEatsOrchardPublic
{
    public partial class MailList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSbt_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            GoodEatsFarmDataContext db = new GoodEatsFarmDataContext();
            if (TextBox3.Text != null && TextBox3.Text != String.Empty)
            {
                string phoneTxt = TextBox3.Text;
                string phone = (Regex.Replace( phoneTxt, "[^0-9]",""));
                db.uspConnectionInsert(TextBox1.Text, TextBox2.Text, phone);
            }
            else
            {
                db.uspConnectionInsert(TextBox1.Text, TextBox2.Text, null);
            }
            
            
            Panel2.Visible = true;
        }
    }
}
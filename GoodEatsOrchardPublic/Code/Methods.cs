using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;

namespace GoodEatsOrchardPublic.Code
{
    public class Methods
    {
        public static bool isLoggedIn()
        {
            if ((string)System.Web.HttpContext.Current.Session["loggedIn"]=="yes")
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        
    }
}
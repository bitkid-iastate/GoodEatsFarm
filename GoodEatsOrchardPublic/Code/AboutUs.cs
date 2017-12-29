using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Xml.Serialization;

namespace GoodEatsOrchardPublic.Code
{
    public class AboutUs
    {

        public string content{ get; set; }

        public void serialize()
        {
            XmlSerializer machine = new XmlSerializer(typeof(AboutUs));
            TextWriter writer = new StreamWriter(System.Web.HttpContext.Current.Server.MapPath("/App_Data/AboutUs.xml"));
            machine.Serialize(writer, this);
            writer.Close();
        }
    }
}
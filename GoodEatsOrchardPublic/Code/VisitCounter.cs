using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Serialization;
using System.IO;

namespace GoodEatsOrchardPublic.Code
{
    public class VisitCounter
    {
        //Description: Keeps website visit count in xml file.

        //Class Variables:
        public int numOfVisits { get; set; }

        public void serialize()
        {

            XmlSerializer machine = new XmlSerializer(typeof(VisitCounter));
            TextWriter writer = new StreamWriter(System.Web.HttpContext.Current.Server.MapPath("/App_Data/Visits.xml"));
            machine.Serialize(writer, this);
            writer.Close();
        }
    }

 
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Serialization;
using System.IO;


namespace GoodEatsOrchardPublic.Code
{
    public class Announcement
    {
        public bool onOrOff { get; set; }
        public string announce { get; set; }

        
    

        public void serialize()
        {
            //string oldPath = "C:\\Users\\Me\\source\\repos\\GoodEatsOrchardPublic\\GoodEatsOrchardPublic\\App_Data\\jumbotron.xml";
            XmlSerializer machine = new XmlSerializer(typeof(Announcement));
            TextWriter writer = new StreamWriter(System.Web.HttpContext.Current.Server.MapPath("/App_Data/jumbotron.xml"));
            machine.Serialize(writer, this);
            
            writer.Close();
        }
    }

    public class decerealizer
    {
        public static Announcement GetAnnouncement ()
        {
           
            XmlSerializer machine = new XmlSerializer(typeof(Announcement));
            TextReader reader = new StreamReader(System.Web.HttpContext.Current.Server.MapPath("/App_Data/jumbotron.xml"));
            object obj = machine.Deserialize(reader);
            Announcement announceObject = (Announcement)obj;
            reader.Close();
            return announceObject;



        }
    }
}
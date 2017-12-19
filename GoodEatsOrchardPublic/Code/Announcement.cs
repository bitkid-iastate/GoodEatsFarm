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
        //Description: This is a model for a large public announcement on the website. It draws its data from an XML file stored in the App_Data directory.

        //Class Variables:
        //Is the announcement turned on?
        public bool onOrOff { get; set; }
        //What does the announcement say?
        public string announce { get; set; }

        /*
         * This method makes the Announcement object serialize itself as XML and writes itself to:
         * learning -> hardcoded path = "C:\\Users\\Me\\source\\repos\\GoodEatsOrchardPublic\\GoodEatsOrchardPublic\\App_Data\\jumbotron.xml"
         * learning -> retrieved absolute path = System.Web.HttpContext.Current.Server.MapPath("/App_Data/jumbotron.xml")
         * learning -> relative path = "~/App_Data/jumbotron.xml"
         */
        public void serialize()
        {

            XmlSerializer machine = new XmlSerializer(typeof(Announcement));
            TextWriter writer = new StreamWriter(System.Web.HttpContext.Current.Server.MapPath("/App_Data/jumbotron.xml"));
            machine.Serialize(writer, this);
            writer.Close();
        }
    }

    /*
     *This method returns an Announcment object populated with data from the hard coded path, in this case the jumbotron.xml,
     * using the System.Xml.Serialization namespace.
     */
    public class decerealizer
    {
        public static Announcement GetAnnouncement()
        {

            XmlSerializer machine = new XmlSerializer(typeof(Announcement));
            TextReader reader = new StreamReader(System.Web.HttpContext.Current.Server.MapPath("/App_Data/jumbotron.xml"));
            object obj = machine.Deserialize(reader);
            Announcement announceObject = (Announcement)obj;
            reader.Close();
            return announceObject;
        }

        public static VisitCounter GetVisitCounter()
        {

            XmlSerializer machine = new XmlSerializer(typeof(VisitCounter));
            TextReader reader = new StreamReader(System.Web.HttpContext.Current.Server.MapPath("/App_Data/Visits.xml"));
            object obj = machine.Deserialize(reader);
            VisitCounter visitCounterObject = (VisitCounter)obj;
            reader.Close();
            return visitCounterObject;
        }
    }
}


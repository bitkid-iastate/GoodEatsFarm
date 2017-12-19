using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

namespace GoodEatsOrchardPublic.Code

{        
    /* 
    * Description: This class contains functions used by the application. It does not need to be instantiated because all the methods are static.
    * Contains no global variables. 
    */


    public class Methods
    {
        //Checks the session variable loggedIn and returns a booleon if the variable has been set to 'yes'.
        public static bool isLoggedIn()
        {
            if ((string)System.Web.HttpContext.Current.Session["loggedIn"] == "yes")
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        //Checks file extension based on given filename string
        public static bool isPictureFile(string fileName)
        {
            if (fileName.ToUpper().EndsWith(".JPG")){
                return true;
            }
            else
            {
                return false;
            }
        }

        //Checks if a file in given directory with given name already exists
        public static bool fileExists(string directory, string fileName)
        {
            if (File.Exists(directory + fileName)){
                return true;
            }
            else
            {
                return false;
            }
        }

        public static DataSet GetImages(string folder)
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            string[] files = Directory.GetFiles(folder);
            dt.Columns.Add("FileName", typeof(System.String));
            dt.Columns.Add("FilePath", typeof(System.String));
            foreach (string file in files)
            {
                string fileName = Path.GetFileName(file);
                dt.Rows.Add(new object[] { fileName, file });
               

            }
            ds.Tables.Add(dt);
            return ds;

        }

    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Data.Linq;

namespace GoodEatsOrchardPublic.Code
{
    public partial class PicHandler : IHttpHandler
    {
        public bool IsReusable
        {
            get
            {
                return true;
            }
        }

        public void ProcessRequest(HttpContext context)
        {
            // Set up the response settings
            context.Response.ContentType = "image/jpeg";
            //context.Response.Cache.SetCacheability(HttpCacheability.Public);
            //context.Response.BufferOutput = false;

            string photoId = null;
            Stream stream = null;

            if (context.Request.QueryString["ProductID"] != null &&
                context.Request.QueryString["ProductID"] != "")
            {
                photoId = context.Request.QueryString["ProductID"];
                stream = GetPhoto(photoId);

                const int buffersize = 1024 * 16;
                byte[] buffer = new byte[buffersize];
                int count = stream.Read(buffer, 0, buffersize);
                while (count > 0)
                {
                    context.Response.OutputStream.Write(buffer, 0, count);
                    count = stream.Read(buffer, 0, buffersize);
                }
            }

     
        }

        public Stream GetPhoto(string photoId)
        {
            GoodEatsFarmDataContext db = new GoodEatsFarmDataContext();
            Binary binary = db.uspGetAppleImage(photoId).FirstOrDefault().Image;
            byte[] result = binary.ToArray();
            
            try
            {
                return new MemoryStream(result);
            }
            catch (ArgumentNullException e)
            {
                return null;
            }
        }

    }
}
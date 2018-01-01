using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace GoodEatsOrchardPublic.Code
{
    public class NewsImage
    {
        public string imageID { get; set; }
        public string fileName { get; set; }
    }


    public class Article
    {
        public string NewsID { get; set; }
        public string Content { get; set; }
        public DateTime newsDate { get; set; }
        public List<NewsImage> articleImages = new List<NewsImage>();

        public Article()
        {
        }
        public Article(string NewsID)
        {
            GoodEatsFarmDataContext db = new GoodEatsFarmDataContext();
            var data = db.uspNewsGetSingle(NewsID).FirstOrDefault();
            this.NewsID = NewsID;
            Content = data.NewsContent;
            newsDate = data.NewsDate;

           var data2 = db.uspNewsPicsGetByArticle(NewsID);
            foreach(var row in data2)
            {
                NewsImage img = new NewsImage();
                img.imageID = row.NewsImgID.ToString();
                img.fileName = row.Path;
                articleImages.Add(img);
            }

        }

        private void refreshImgsList()
        {
            GoodEatsFarmDataContext db = new GoodEatsFarmDataContext();
            articleImages.Clear();
            var data2 = db.uspNewsPicsGetByArticle(NewsID);
            foreach (var row in data2)
            {
                NewsImage img = new NewsImage();
                img.imageID = row.NewsImgID.ToString();
                img.fileName = row.Path;
                articleImages.Add(img);
            }
        }

        public void save()
        {
            GoodEatsFarmDataContext db = new GoodEatsFarmDataContext();

            if (NewsID == null)
            {
                var result = db.uspNewsInsert(Content, newsDate).ToArray();
                NewsID = result.FirstOrDefault().NewsID.ToString();
                //System.Text.RegularExpressions.Regex.Replace(NewsID, @"\s+", "");
                foreach(NewsImage imgInfo in articleImages)
                {
                    db.uspNewsPicAdd(NewsID, imgInfo.fileName);
                }    
            }
            else
            {
                db.uspNewsUpdate(NewsID, Content, newsDate);

            }
        }

    


    }
}


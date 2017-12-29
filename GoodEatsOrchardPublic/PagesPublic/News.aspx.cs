using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GoodEatsOrchardPublic.Code;
using System.IO;

namespace GoodEatsOrchardPublic
{
    public partial class News : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GoodEatsFarmDataContext db = new GoodEatsFarmDataContext();
            var data = db.uspNewsGetTopSeven().ToArray();
            string output = "";

            //foreach (var x in data)
            //{
            //    string modals = "";
            //    string content = x.NewsContent;
            //    Article article = new Article(x.NewsID.ToString());
            //    foreach (NewsImage img in article.articleImages) {
            //        string path = Path.Combine("/Images/News/", img.fileName);
            //        string modal = string.Format("<img id=\"myImg\" src=\"{0}\" width=\"240\" height=\"135\" onclick=\"modalize(this)\">", path);
            //        modals += modal;
            //    }
            //    output += string.Format("{0} <br /> {1}", modals, content);
            //}

            //Literal1.Text = output;

            foreach (var x in data)
            {
                Table tbl = new Table();
                TableRow row1 = new TableRow();
                TableRow row2 = new TableRow();
                TableRow dateRow = new TableRow();
                TableCell tc = new TableCell();
                Article article = new Article(x.NewsID.ToString());
                foreach (NewsImage img in article.articleImages)
                {

                    string path = Path.Combine("/Images/News/", img.fileName);
                    //240x150
                    string html = string.Format("<img id=\"myImg\" src=\"{0}\" width=\"170\" height=\"115\" onclick=\"modalize(this)\">", path);
                    tc.Text += html;

                }
                row1.Cells.Add(tc);
                TableCell tc2 = new TableCell();
                tc2.Text = string.Format("<br /><div class=\"news\">{0}</div><br /><hr>", x.NewsContent);
                row2.Cells.Add(tc2);
                TableCell tc3 = new TableCell();
                tc3.Text = string.Format("<div class=\"newsP\">Posted on {0}</div><br /><br />", x.NewsDate.ToShortDateString());
                dateRow.Cells.Add(tc3);
                tbl.Rows.Add(dateRow);
                tbl.Rows.Add(row1);
                tbl.Rows.Add(row2);
                tbl.Width = 900;
                tbl.Attributes.Add("class", "newsTbl");
                plNews.Controls.Add(tbl);
            }


            //foreach (var x in data)
            //{
            //    GridView tbl = new GridView();
            //    GridViewRow row1 = new GridViewRow(0, 0,DataControlRowType.DataRow, DataControlRowState.Normal);
            //    GridViewRow row2 = new GridViewRow(1, 1, DataControlRowType.DataRow, DataControlRowState.Normal);

            //    Article article = new Article(x.NewsID.ToString());
            //    foreach (NewsImage imgInfo in article.articleImages)
            //    {
            //        Image img = new Image();
            //        img.ImageUrl = Path.Combine("/Images/News/", imgInfo.fileName);
            //        img.Width = 240;
            //        img.Height = 150;
            //        img.Attributes.Add("onclick", "mocalize(this)");
            //        row1.Controls.Add(img);
            //    }
            //    TextBox txtBox = new TextBox();
            //    txtBox.Text = x.NewsContent;
            //    row2.Controls.Add(txtBox);
            //    tbl
            //    tbl.Rows.Add(row2);
            //    plNews.Controls.Add(tbl);
            //}

        }
    }
}
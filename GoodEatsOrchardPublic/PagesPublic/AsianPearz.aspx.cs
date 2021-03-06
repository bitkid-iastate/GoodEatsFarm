﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GoodEatsOrchardPublic.PagesPublic
{
    public partial class AsianPearz : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GoodEatsFarmDataContext db = new GoodEatsFarmDataContext();
            Guid catID = new Guid("b6385b44-1b6d-41ab-81df-d265d363dea7");
            var data = db.uspProductsGetbyCat("a4173ee3-40fc-4c80-a989-61f3b243a040").ToArray();
            int rows = data.Length;

            for (int i = 0; i < rows; i++)
            {
                Image picture = new Image();
                picture.ID = "picture" + i;
                //picture.Width = 306;
                //picture.Height = 204;
                picture.Attributes.Add("class", "productImage");
                TableRow row = new TableRow();
                TableCell cellOne = new TableCell();
                TableCell cellTwo = new TableCell();

                string prodID = data[i].ProductID.ToString();
                string prodName = data[i].Name;
                string prodPriceInfo = data[i].PriceInfo;
                string prodDesc = data[i].Description;
                picture.ImageUrl = data[i].ImagePath;

                cellOne.Controls.Add(picture);
                cellTwo.Text = "<p class=\"content-words\"><b>" + prodName + "</b><br />" + prodPriceInfo + "<br />" + prodDesc + "</p>";
                cellTwo.HorizontalAlign = HorizontalAlign.Left;
                //cellOne.Width = 320;

                row.Cells.Add(cellOne);
                row.Cells.Add(cellTwo);
                Table1.Rows.Add(row);
            }

        }
    }
}
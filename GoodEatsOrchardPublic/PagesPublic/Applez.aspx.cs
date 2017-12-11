using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace GoodEatsOrchardPublic
{
    public partial class Applez : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            GoodEatsFarmDataContext db = new GoodEatsFarmDataContext();
            Guid catID = new Guid("b6385b44-1b6d-41ab-81df-d265d363dea7");
            var data = db.uspProductsGetbyCat("b6385b44-1b6d-41ab-81df-d265d363dea7").ToArray();
            int rows = data.Length;
            Label1.Text = data[0].Description;
            for (int i = 0; i < rows; i++)
            {
                Image picture = new Image();
                picture.ID = "picture" + i;
                TableRow row = new TableRow();
                TableCell cellOne = new TableCell();
                TableCell cellTwo = new TableCell();
                TableCell cellThree = new TableCell();

                
                string prodID = data[i].ProductID.ToString();
                picture.ImageUrl = data[i].ImagePath;

               
                cellOne.Controls.Add(picture);
                cellTwo.Text = prodID;
                cellThree.Text = data[i].Description;
                
                row.Cells.Add(cellOne);
                row.Cells.Add(cellTwo);
                row.Cells.Add(cellThree);
                Table1.Rows.Add(row);
            }

        }
    }
}
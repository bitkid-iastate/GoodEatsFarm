using GoodEatsOrchardPublic.Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GoodEatsOrchardPublic
{
    public partial class dash : System.Web.UI.Page
    {


        // Deserializers the jumbotron.xml and makes an object out of it.
        Announcement ann = decerealizer.GetAnnouncement();

        protected void Page_Load(object sender, EventArgs e)
        {
            // First load OR Postback, checks if user is logged in.
            if (!Methods.isLoggedIn())
            {
                // Redirects to login page.
                Response.Redirect("~/PagesPublic/Pass.aspx");
            }
            else
            {
                // If user is logged in and this is a First Load, sets up the announcment form based on config from ann.
                if (!IsPostBack)
                {
                    if (ann.onOrOff == true)
                    {
                        chkJumbo.Checked = true;

                    }
                    else
                    {
                        chkJumbo.Checked = false;
                    }

                    if (ann.announce != "" && ann.announce != null)
                    {
                        txtJumbo.Text = ann.announce;
                        txtJumbo.Visible = false;
                    }


                }

                // First load OR Postback, if checked box checked, displays announcment text box.
                if (chkJumbo.Checked)
                {
                    txtJumbo.Visible = true;

                }
                else
                {
                    txtJumbo.Visible = false;

                }



                // First load OR postback, sets page visitor counter.
                VisitCounter counter = decerealizer.GetVisitCounter();
                lblVisits.Text = counter.numOfVisits.ToString();

            }
        }

        // On announcement form chkbx change, display or hide the announcement textbox as well as resaving on/off setting in jumbotron.xml.
        protected void chkJumbo_Changed(object sender, EventArgs e)
        {
            if (Methods.isLoggedIn())
            {
                if (chkJumbo.Checked)
                {
                    txtJumbo.Visible = true;
                    ann.onOrOff = true;
                    ann.serialize();
                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                }
                else
                {
                    txtJumbo.Visible = false;
                    ann.onOrOff = false;
                    ann.serialize();
                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                }
            }
            else
            {
                Response.Redirect("~/PagesPublic/Pass.aspx");
            }
        }

        // If the announcement update button is clicked, updates ann and reserializes it to the jumbotron.xml, saving the changes.
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Methods.isLoggedIn())
            {
                string x = txtJumbo.Text;
                ann.announce = x;
                ann.serialize();
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
            else
            {
                Response.Redirect("~/PagesPublic/Pass.aspx");
            }
        }

        // Uploads the new product form into the database.
        protected void sbtProduct_Click(object sender, EventArgs e)
        {

            // New product form variables.
            GoodEatsFarmDataContext db = new GoodEatsFarmDataContext();
            string title = txtTitle.Text;
            string price = txtPrice.Text;
            string description = txtDesc.Text;
            string categoryID = "none";
            HttpPostedFile picture = FileUpload1.PostedFile;
            string fileName = picture.FileName;
            string tempFileName = fileName;
            string path = null;
            // Reset form validation errors.
            blErrors.Visible = false;
            blErrors.Items.Clear();
            // Server-side form validation variables.
            bool hasName = false;
            bool hasCategory = false;
            bool isValidImgFile = false;
            bool fileGiven = false;

            // If "Fruits" category selected, display fruit radio buttons.

            if (ddlCategory.SelectedValue == "67a6ec19-a89b-43c9-8b69-a6711673c77e")
            {
                categoryID = chkbxCategory.SelectedValue;
            }
            else
            {
                categoryID = ddlCategory.SelectedValue;
            }
            // If product name is not given, display error.
            if (txtTitle.Text == "" || txtTitle.Text == null)
            {
                hasName = false;
                blErrors.Visible = true;
                blErrors.Items.Add("You must give a product name.");
            }
            else
            {
                hasName = true;
            }
            // If no category is selected, display error.
            if (categoryID == "none" || categoryID == "" || categoryID == null)
            {
                hasCategory = false;
                blErrors.Visible = true;
                blErrors.Items.Add("A category must be selected.");
            }
            else
            {
                hasCategory = true;
            }
            // If file given and if file is valid JPEG.
            if (FileUpload1.HasFile)
            {
                fileGiven = true;
                if (Methods.isPictureFile(fileName))
                {
                    isValidImgFile = true;
                }
            }
            if (fileGiven == true && isValidImgFile == false)
            {
                blErrors.Visible = true;
                blErrors.Items.Add("The file you chose is not a valid file type. Must be a JPEG.");
            }

            /*
             * If there is a product name and category, submit form.
             * If no file is given, the path field in db is set  "null".
             * If no description or price is given, the fields are set "" in db.
             */
            if (hasName && hasCategory)
            {
                if (fileGiven)
                {
                    if (isValidImgFile)
                    {
                        int somnum = 0;
                        while (Methods.fileExists(Server.MapPath("~/Images/Products/"), tempFileName))
                        {
                            tempFileName = "(" + somnum + ")" + fileName;
                            somnum++;
                        }
                        try
                        {
                            picture.SaveAs(Server.MapPath("~/Images/Products/") + tempFileName);
                            path = "~/Images/Products/" + tempFileName;
                            // If atleast a name, category, and file was given, and the file succesfully got saved. Upload all of it to the database.
                            db.uspProductInsert(title, price, description, categoryID, path);
                            plNewProduct.Visible = false;
                            plNewProdSuccess.Visible = true;
                        }
                        catch (Exception ex)
                        {
                            blErrors.Visible = true;
                            blErrors.Items.Add(ex.Message);

                        }
                    }


                }
                // If only Product Name and Category given, submit them to database with null image path and empty string price and description.
                else
                {
                    db.uspProductInsert(title, price, description, categoryID, path);
                    plNewProduct.Visible = false;
                    plNewProdSuccess.Visible = true;
                }
            }

        }



        protected void newProduct_Click(object sender, EventArgs e)
        {
            ddlCategory.SelectedValue = "none";
            chkbxCategory.SelectedValue = null;
            txtTitle.Text = "";
            txtPrice.Text = "";
            txtDesc.Text = "";
            chkbxCategory.Visible = false;
            plNewProduct.Visible = true;
            plNewProdSuccess.Visible = false;

        }

        protected void btnView1_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void btnView2_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            plEditProduct.Visible = false;
            plProductsView.Visible = true;
            ddlCategory2.SelectedValue = "none";
            gvProducts.DataBind();
            plUpdatProdSucc.Visible = false;
            chkbxCategory2.Visible = false;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }


        string prodViewCat = "";

        protected void ddlCategory2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCategory2.SelectedValue != "67a6ec19-a89b-43c9-8b69-a6711673c77e")
            {
                chkbxCategory2.Visible = false;
                prodViewCat = ddlCategory2.SelectedValue;
            }
            else
            {
                chkbxCategory2.Visible = true;

            }
            if (prodViewCat != "" && prodViewCat != "none")
            {
                GoodEatsFarmDataContext db = new GoodEatsFarmDataContext();
                var prodData = db.uspProductsGetbyCat(prodViewCat);
                gvProducts.DataSource = prodData;
                gvProducts.DataBind();
            }
        }

        protected void chkbxCategory2_SelectedIndexChanged(object sender, EventArgs e)
        {

            prodViewCat = chkbxCategory2.SelectedValue;
            if (prodViewCat != "" && prodViewCat != "none")
            {
                GoodEatsFarmDataContext db = new GoodEatsFarmDataContext();
                var prodData = db.uspProductsGetbyCat(prodViewCat);
                gvProducts.DataSource = prodData;
                gvProducts.DataBind();
            }
        }



        protected void btnProdEdit_Click(object sender, EventArgs e)
        {
            DataSet images = Methods.GetImages(Server.MapPath("~/Images/Products"));
            ddlImages.DataSource = images.Tables[0];

            ddlImages.DataValueField = "FileName";
            ddlImages.DataTextField = "FileName";
            ddlImages.DataBind();
            plProductsView.Visible = false;
            plEditProduct.Visible = true;
            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            string prodID = gvProducts.DataKeys[gvr.RowIndex].Values[0].ToString();

            for (int i = 1; i < 100; i++)
            {
                ListItem item = new ListItem();
                item.Text = i.ToString();
                item.Value = i.ToString();
                ddlOrderIndex.Items.Add(item);
            }

            FileUpload2.Visible = false;
            ddlImages.Visible = true;
            imgSample.Visible = true;
            plUpdatProdSucc.Visible = false;

            //Response.Write(Methods.GetImages(Server.MapPath("~/Images/Products")).Tables[0].Rows[1][1].ToString());
            GoodEatsFarmDataContext db = new GoodEatsFarmDataContext();
            var data = db.uspProductsGetSingle(prodID).FirstOrDefault();
            txtTitle2.Text = data.Name;
            txtPrice2.Text = data.PriceInfo;
            txtDesc2.Text = data.Description;
            lblProdID.Text = data.ProductID.ToString();
            ddlOrderIndex.SelectedValue = data.OrderIndex.ToString();
            lblTest.Text = "Originally was:" + data.Name;
            imgSample.ImageUrl = data.ImagePath;
            chkbxImage.SelectedValue = "Use Existing Photo";
            ddlImages.SelectedValue = Path.GetFileName(data.ImagePath);

        }

        protected void btnProdDelete_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            string prodID = gvProducts.DataKeys[gvr.RowIndex].Values[0].ToString();
            GoodEatsFarmDataContext db = new GoodEatsFarmDataContext();
            db.uspProductsDropSingle(prodID);
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void ddlImages_SelectedIndexChanged(object sender, EventArgs e)
        {
            imgSample.ImageUrl = "~/Images/Products/" + ddlImages.SelectedValue;
            imgSample.Visible = true;
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            //First load OR Postback, if selected category is fruit, then displays the fruit variety radio buttons.
            if (ddlCategory.SelectedValue == "67a6ec19-a89b-43c9-8b69-a6711673c77e")
            {
                chkbxCategory.Visible = true;

            }
            else
            {
                chkbxCategory.Visible = false;
            }
        }

        protected void chkbxImage_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (chkbxImage.SelectedValue == "Use Existing Photo")
            {
                ddlImages.Visible = true;
                imgSample.Visible = true;
                FileUpload2.Visible = false;
                imgSample.ImageUrl = "~/Images/Products/" + ddlImages.SelectedValue;
            }
            else
            {
                imgSample.ImageUrl = "";
                imgSample.Visible = false;
                ddlImages.Visible = false;
                FileUpload2.Visible = true;
            }


        }

        protected void btnProdUpd8Cancel_Click(object sender, EventArgs e)
        {
            plEditProduct.Visible = false;
            plProductsView.Visible = true;
        }

        protected void btnProdUpdate_Click(object sender, EventArgs e)
        {
            bool hasTitle = false;
            bool validImage = false;
            lblErr2.Items.Clear();

            if (txtTitle2.Text != null && txtTitle2.Text != "") { hasTitle = true; }
            else
            {
                lblErr2.Items.Add("there must be a title.");
                lblErr2.Visible = true;
            }


            if (chkbxImage.SelectedValue == "Use Existing Photo")
            {
                if (hasTitle == true)
                {
                    string path = "~/Images/Products/" + ddlImages.SelectedValue;
                    GoodEatsFarmDataContext db = new GoodEatsFarmDataContext();
                    db.uspProductUpdate(lblProdID.Text, txtTitle2.Text, txtPrice2.Text, txtDesc2.Text, path, Convert.ToInt32(ddlOrderIndex.SelectedValue));
                    plEditProduct.Visible = false;
                    plUpdatProdSucc.Visible = true;
                }
            }
            if (chkbxImage.SelectedValue == "Upload New Photo")
            {
                if (FileUpload2.HasFile)
                {
                    if (!Methods.isPictureFile(FileUpload2.FileName))
                    {
                        validImage = false;
                        lblErr2.Items.Add("Image file must be JPEG.");
                        lblErr2.Visible = true;
                    }
                    else { validImage = true; }
                }
                else { validImage = true; }
            }

            if (hasTitle && validImage)
            {
                string fileName = FileUpload2.FileName;
                string tempFileName = fileName;
                string path = null;
                int somnum = 0;
                while (Methods.fileExists(Server.MapPath("~/Images/Products/"), tempFileName))
                {
                    tempFileName = "(" + somnum + ")" + fileName;
                    somnum++;
                }
                try
                {
                    GoodEatsFarmDataContext db = new GoodEatsFarmDataContext();
                    FileUpload2.PostedFile.SaveAs(Server.MapPath("~/Images/Products/") + tempFileName);
                    path = "~/Images/Products/" + tempFileName;
                    // If atleast a name, category, and file was given, and the file succesfully got saved. Upload all of it to the database.
                    db.uspProductUpdate(lblProdID.Text, txtTitle2.Text, txtPrice2.Text, txtDesc2.Text, path, Convert.ToInt32(ddlOrderIndex.SelectedValue));
                    plEditProduct.Visible = false;
                    plUpdatProdSucc.Visible = true;
                }
                catch (Exception ex)
                {
                    lblErr2.Visible = true;
                    lblErr2.Items.Add(ex.Message);

                }
            }
        }

        protected void btnView3_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
            DataSet imgs = Methods.GetImages(Server.MapPath("~/Images/Gallery"));
            gvGallery.DataSource = imgs;
            gvGallery.DataBind();

        }

        protected void btnView4_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 3;
        }

        protected void btnDeleteImage_Click(object sender, EventArgs e)
        {

        }

        protected void gvGallery_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Image img = (Image)e.Row.FindControl("imgGalleryThumb");
                img.ImageUrl = "~/Images/Gallery/" + gvGallery.DataKeys[e.Row.RowIndex].Values[0].ToString();
            }
        }

        protected void FileUpload3_onchange()
        {
            Response.Write("IT WORKED!!!!");
        }

        protected void btnGalleryImage(object sender, EventArgs e)
        {
            HttpPostedFile img = Request.Files["avatarUpload"];
            
            Response.Write("it is" + img.FileName);
            if (img == null || img.ContentLength == 0)
            {
            }
            else
            {
                string fileName = img.FileName;
                string tempFileName = "";
                if (Methods.isPictureFile(fileName))
                {

                    int somnum = 0;
                    while (Methods.fileExists(Server.MapPath("~/Images/Gallery/"), tempFileName))
                    {
                        tempFileName = "(" + somnum + ")" + fileName;
                        somnum++;
                    }
                    try
                    {
                        img.SaveAs(Server.MapPath("~/Images/Gallery/") + tempFileName);
                        Page.Response.Redirect(Page.Request.Url.ToString(), true);
                        MultiView1.ActiveViewIndex = 2;
                    }
                    catch (Exception ex)
                    {
                        blErrors.Visible = true;
                        blErrors.Items.Add(ex.Message);

                    }

                }

            }


        }
    }
}

// Learning -> byte[] image = new byte[picture.ContentLength];
// Learning -> picture.InputStream.Read(image, 0, picture.ContentLength);
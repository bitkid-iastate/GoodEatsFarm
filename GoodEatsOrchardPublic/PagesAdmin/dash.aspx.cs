using GoodEatsOrchardPublic.Code;
using System;
using System.Collections.Generic;
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
                }
                else
                {
                    txtJumbo.Visible = false;
                    ann.onOrOff = false;
                    ann.serialize();
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
                Response.Write(x);
                Response.Write(ann.announce);
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
    }
}

// Learning -> byte[] image = new byte[picture.ContentLength];
// Learning -> picture.InputStream.Read(image, 0, picture.ContentLength);
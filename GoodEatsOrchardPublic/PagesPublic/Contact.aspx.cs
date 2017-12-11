using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BotDetect.Web;

namespace GoodEatsOrchardPublic
{
    public partial class Contact1 : System.Web.UI.Page
    {

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // initialize the Captcha validation error label
                CaptchaErrorLabel.Text = "Incorrect CAPTCHA code!";
                CaptchaErrorLabel.Visible = false;
            }

            // setup client-side input processing
            ExampleCaptcha.UserInputID = CaptchaCode.ClientID;

            if (IsPostBack)
            {
                // validate the Captcha to check we're not dealing with a bot
                string userInput = CaptchaCode.Text;
                bool isHuman = ExampleCaptcha.Validate(userInput);
                CaptchaCode.Text = null; // clear previous user input

                if (isHuman)
                {
                    CaptchaErrorLabel.Visible = false;
                    // TODO: proceed with protected action
                    try
                    {
                        SendMail();
                        YourSubject.Text = "";
                        YourEmail.Text = "";
                        YourName.Text = "";
                        Comments.Text = "";
                        Panel1.Visible = false;
                        DisplayMessage.Text = "Your message was delivered!";
                        DisplayMessage.Visible = true;
                    }
                    catch (Exception) {
                        DisplayMessage.Text = "There was a problem sending your message. Please try again.";
                        DisplayMessage.Visible = true;
                    }

                }
                else
                {
                    CaptchaErrorLabel.Visible = true;
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void SendMail()
        {
            // Gmail Address from where you send the mail
            var fromAddress = "contactus@goodeatsfarm.com";
            // any address where the email will be sending
            var toAddress = "grindlockfirm@gmail.com";
            //Password of your gmail address
            const string fromPassword = "charm*2017";
            // Passing the values and make a email formate to display
            string subject = YourSubject.Text.ToString();
            string body = "From: " + YourName.Text + "\n";
            body += "Email: " + YourEmail.Text + "\n";
            body += "Subject: " + YourSubject.Text + "\n";
            body += "Question: \n" + Comments.Text + "\n";
            // smtp settings
            var smtp = new System.Net.Mail.SmtpClient();
            {
                smtp.Host = "smtp-mail.outlook.com";
                smtp.Port = 587;
                //IMap-MailDefinition.outlook.com=993
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
                smtp.Timeout = 20000;
            }
            // Passing values to smtp object
            smtp.Send(fromAddress, toAddress, subject, body);
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
           
        }


    }
}
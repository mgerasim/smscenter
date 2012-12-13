using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace FormsAuthAD
{
    public partial class Logon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogon_Click(object sender, EventArgs e)
        {
            // Path to you LDAP directory server.
            // Contact your network administrator to obtain a valid path.
            string adPath =
            "LDAP://172.30.1.227/DC=corp,DC=fetec,DC=dsv,DC=ru";

            LdapAuthentication adAuth = new LdapAuthentication(adPath);

            try
            {
                if (true == adAuth.IsAuthenticated(txtDomainName.Text,
                                                  txtUserName.Text,
                                                  txtPassword.Text))
                {
                    // Retrieve the user's groups
                    string groups = adAuth.GetGroups();
                    // Create the authetication ticket
                    FormsAuthenticationTicket authTicket =
                        new FormsAuthenticationTicket(1,  // version
                                                      txtUserName.Text,
                                                      DateTime.Now,
                                                      DateTime.Now.AddMinutes(60),
                                                      false, groups);
                    // Now encrypt the ticket.
                    string encryptedTicket =
                      FormsAuthentication.Encrypt(authTicket);
                    // Create a cookie and add the encrypted ticket to the
                    // cookie as data.
                    HttpCookie authCookie =
                                 new HttpCookie(FormsAuthentication.FormsCookieName,
                                                encryptedTicket);
                    // Add the cookie to the outgoing cookies collection.
                    Response.Cookies.Add(authCookie);

                    // Redirect the user to the originally requested page
                    Response.Redirect(
                              FormsAuthentication.GetRedirectUrl(txtUserName.Text,
                                                                 false));
                }
                else
                {
                    lblError.Text =
                         "Authentication failed, check username and password.";
                }
            }
            catch (Exception ex)
            {
                lblError.Text = "Error authenticating. " + ex.Message;
            }
        }
    }
}
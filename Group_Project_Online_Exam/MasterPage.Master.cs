using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
namespace Group_Project_Online_Exam
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckSecurity();

            if (!IsPostBack)
            {

            }
        }
        private void CheckSecurity()
        {
            Security mySecurity = new Security();
            lblFirstname.Text = mySecurity.Firstname;
            if (!mySecurity.IsLoggedIn())
            {
                btnLogout.Visible = false;     
            }
            else
            { //Adjust links visible according to Security Level(Admin or Regular)

                UpdatePanelLogin.Visible = false;
                pnlLogout.Visible = true;

                //if (mySecurity.IsAdmin())
                //{   
                //    PanelSidebar.Visible = true;
                //    // if there are any admin specific things to show, show them
                //}
                //else if (mySecurity.IsTeacher())
                //{
                //    PanelSidebar.Visible = true;
                //     // if there are any TEACHER specific things to show, show them
                //}
                //else if (mySecurity.IsStudent())
                //{
                //    // if there are any TEACHER specific things to show, show them
                //}
            }

           

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string FullEmail = txtUserName.Text;
            Security mySecurity = new Security(FullEmail, txtPassword.Text);
            if (mySecurity.IsLoggedIn())
            {
                Response.Redirect("Home.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Your User Name or Password Not Correct');", true);
            }
            
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Home.aspx");
            UpdatePanelLogin.Visible = true;
            
        }

    }
}
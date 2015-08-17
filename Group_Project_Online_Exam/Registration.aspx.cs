using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group_Project_Online_Exam
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Panel pnlLogin = (Panel)Master.FindControl("pnlLogin");
            pnlLogin.Visible = false;

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //lblmessage.Text = "You successfully Registerd";
        }
    }
}
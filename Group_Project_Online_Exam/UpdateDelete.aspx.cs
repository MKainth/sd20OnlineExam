using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group_Project_Online_Exam
{
    public partial class UpdateDelete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddQuiz_Click(object sender, EventArgs e)
        {
            Response.Redirect("Quiz.aspx");
        }
    }
}
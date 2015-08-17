using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL_Project;
using System.Configuration;
using System.Data;

namespace Group_Project_Online_Exam
{
    public partial class ExamPage : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["Exam"].ConnectionString;
        DataTable dt = new DataTable(); 
        protected void Page_Load(object sender, EventArgs e)
        {
            loadQuestions();
            if(!IsPostBack)
            {
                lblQuestion.Text = dt.Rows[0]["Question"].ToString();

            }
        }


        public void loadQuestions()
        {
            DAL mydal = new DAL(conn);
           DataSet ds= mydal.ExecuteProcedure("spQuestion");
           dt = ds.Tables[0];
        }
    }
}
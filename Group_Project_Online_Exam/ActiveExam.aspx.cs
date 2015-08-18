using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL_Project;
using System.Data;
using System.Configuration;

namespace Group_Project_Online_Exam
{
    public partial class ActiveExam1 : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["Exam"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                loadAvailableExam();
                loadSession();
                loadQuizTitle();
            }
        }
        public void loadAvailableExam()
        {
            DAL mydal=new DAL(conn);
            DataSet ds=new DataSet();
            ds=mydal.ExecuteProcedure("spShowExam");
            gvActiveExam.DataSource = ds.Tables[0];
            gvActiveExam.DataBind();
        }
        public void loadSession()
        {
            DAL mydal = new DAL(conn);
            DataSet ds = new DataSet();
            ds = mydal.ExecuteProcedure("spSelectSession");
            ddSession.DataSource = ds.Tables[0];
            ddSession.DataTextField = "SessionCode";
            ddSession.DataValueField = "SessionId";
            ddSession.DataBind();
        }
        public void loadQuizTitle()
        {
            DAL mydal = new DAL(conn);
            DataSet ds = new DataSet();
            ds = mydal.ExecuteProcedure("spSelectQuiz");
            ddQuiz.DataSource = ds.Tables[0];
            ddQuiz.DataTextField = "QuizTitle";
            ddQuiz.DataValueField = "QuizId";
            ddQuiz.DataBind();
        }

        protected void BtnACtive_Click(object sender, EventArgs e)
        {
            DAL mydal = new DAL(conn);
            DataSet ds = new DataSet();
            mydal.AddParam("@Date",txtDate.Text);
            mydal.AddParam("@StartTime",txtStartTime.Text);
            mydal.AddParam("@EndTime",txtEndTime.Text);
            mydal.AddParam("@QuizId",ddQuiz.SelectedValue);
            mydal.AddParam("@SessionId",ddSession.SelectedValue);
            ds = mydal.ExecuteProcedure("spActiveExam");
           
        }
    }
}
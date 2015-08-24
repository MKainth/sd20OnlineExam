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
        int rowindex = 0;
        static int counter = 10;

        protected void Page_Load(object sender, EventArgs e)
        {

            // lblDate.Text = DateTime.Today.ToString("dd/MM/yyyy");
            // lblTime.Text = DateTime.Now.ToString("hh:mm tt");

            rowindex = ViewState["RowIndex"] == null ? 0 : (int)ViewState["RowIndex"];
            loadQuestions();

            if (!IsPostBack)
            {
                GetEndTime();
                LoadQuestion();
            }
            if (rowindex != -1)
            {
                lblQuestion.Text = dt.Rows[rowindex]["Question"].ToString();
            }

        }

        private void LoadQuestion()
        {
            string QusetionNumber = dt.Rows[rowindex]["QuestionId"].ToString();
            lblComplted.Text = "Questions &nbsp" + QusetionNumber + "&nbsp of &nbsp" + dt.Rows.Count + "<br/>";
            lblmsg.Text = "Question #" + QusetionNumber + ":&nbsp";
            lblQuestion.Text = dt.Rows[rowindex]["Question"].ToString();

            RadioButtonList1.Items.Clear();

            for (int i = 1; i <= 4; i++)
            {
                string answerText = dt.Rows[rowindex]["Answer" + i].ToString();

                if (!string.IsNullOrEmpty(answerText))
                {
                    RadioButtonList1.Items.Add(new ListItem(answerText, i.ToString()));
                }
            }
        }

        public void GetEndTime()
        {
            DAL mydal = new DAL(conn);
            DataSet ds = mydal.ExecuteProcedure("spShowActiveExam");
            DateTime EndTime = Convert.ToDateTime(ds.Tables[0].Rows[0]["EndTime"].ToString());
            Session["EndTime"] = EndTime;
            time.InnerHtml = Math.Round((EndTime - DateTime.Now).TotalSeconds,0).ToString();
            UpdateTimer();
        }

        public void loadQuestions()
        {
            if (rowindex != -1)
            {
                DAL mydal = new DAL(conn);
                DataSet ds = mydal.ExecuteProcedure("spQuestion");
                dt = ds.Tables[0];
                string CorrectAnswer = dt.Rows[rowindex]["CorrectAnswer"].ToString();

                Session["CorrectAnswer"] = CorrectAnswer;
                if (dt.Rows.Count < 1)
                {
                    lblQuestion.Text = "ERROR, QUIZ RETURNED WITH 0 ROWS!";
                }
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            int correct = 0;
            int wrong = 0;
            string value = Session["CorrectAnswer"].ToString();

            if (!string.IsNullOrEmpty(RadioButtonList1.SelectedItem.Value))
            {
                if (RadioButtonList1.SelectedItem.Text == value)
                {
                    correct++;
                }
                else
                {
                    wrong++;
                }
            }
            rowindex++;
            ViewState["RowIndex"] = rowindex;

            if (rowindex > dt.Rows.Count - 1)
            {
                Response.Redirect("FinishExam.aspx");
                rowindex = -1;
                ViewState["RowIndex"] = rowindex;
                // TEST IS OVER.
            }
            else
            {
                LoadQuestion();
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            UpdateTimer();
        }

        private void UpdateTimer()
        {
            DateTime endTime = (DateTime)Session["EndTime"];
            DateTime now = DateTime.Now;

            if (0 > DateTime.Compare(now, endTime))
            {
                string minutes = ((Int32)endTime.Subtract(now).TotalMinutes).ToString();
                string seconds = ((Int32)endTime.Subtract(now).Seconds).ToString();
                lblTimer.Text = string.Format("Time Left:00:{0}:{1}", minutes, seconds);
            }
            else
            {
                Timer1.Enabled = true;
                Response.Redirect("FinishExam.aspx");
            }
        }
    }
}

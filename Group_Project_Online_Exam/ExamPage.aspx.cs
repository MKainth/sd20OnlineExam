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

        protected void Page_Load(object sender, EventArgs e)
        {
            rowindex = ViewState["RowIndex"] == null ? 0 : (int)ViewState["RowIndex"];
            loadQuestions();

            if (!IsPostBack)
            {
                LoadQuestion();
            }

            lblQuestion.Text = dt.Rows[rowindex]["Question"].ToString();
            HiddenField1.Value = "1";

            if (Request.Form["HiddenField1"] != null)
                rowindex = Convert.ToInt32(Request.Form["HiddenField1"].ToString());

        }

        private void LoadQuestion()
        {
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


        public void loadQuestions()
        {
           DAL mydal = new DAL(conn);
           DataSet ds = mydal.ExecuteProcedure("spQuestion");
           dt = ds.Tables[0];
           
           if (dt.Rows.Count < 1)
           {
               lblQuestion.Text = "ERROR, QUIZ RETURNED WITH 0 ROWS!";
           }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            rowindex++;

            if (rowindex > dt.Rows.Count - 1)
            {
                // TEST IS OVER.
                rowindex = 0;
                HiddenField1.Value = "0";
            }

            LoadQuestion();

            ViewState["RowIndex"] = rowindex;
            HiddenField1.Value = rowindex.ToString();
        }

        
    }
}
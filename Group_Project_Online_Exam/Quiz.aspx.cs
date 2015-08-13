﻿using System;
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
    public partial class Quiz1 : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["Exam"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadDDProgram();
                LoadDDSession();
                LoadDDDifficulty();
                LoadDDTypeOfQuestions();
            }
        }
        public void LoadDDProgram()
        {
             DAL mydal = new DAL(conn);
            DataSet ds = new DataSet();
            ds = mydal.ExecuteProcedure("spSelectProgram");
            ddProgram.DataSource = ds.Tables[0];
            ddProgram.DataTextField = "ProgramName";
            ddProgram.DataValueField = "ProgramId";
            ddProgram.DataBind();
        }
        public void LoadDDSession()
        {
            DAL mydal = new DAL(conn);
            DataSet ds = new DataSet();
            ds = mydal.ExecuteProcedure("spSelectSession");
            ddSession.DataSource = ds.Tables[0];
            ddSession.DataTextField = "SessionCode";
            ddSession.DataValueField = "SessionId";
            ddSession.DataBind();
        }
        public void LoadDDDifficulty()
        {
            DAL mydal = new DAL(conn);
            DataSet ds = new DataSet();
            ds = mydal.ExecuteProcedure("spSelectDifficulty");
            ddDifficulty.DataSource = ds.Tables[0];
            ddDifficulty.DataTextField = "Name";
            ddDifficulty.DataValueField = "DifficultyId";
            ddDifficulty.DataBind();
        }

        public void LoadDDTypeOfQuestions()
        {
            DAL mydal = new DAL(conn);
            DataSet ds = new DataSet();
            ds = mydal.ExecuteProcedure("spSelectTypeofQusetions");
            ddTypeofQuestions.DataSource = ds.Tables[0];
            ddTypeofQuestions.DataTextField = "Name";
            ddTypeofQuestions.DataValueField = "TypeOfQuestionsId";
            ddTypeofQuestions.DataBind();
        }

        protected void btnAddQuestion_Click(object sender, EventArgs e)
        {
            PaneltypeQuestion.Visible = true;
        }

        protected void ddTypeofQuestions_SelectedIndexChanged(object sender, EventArgs e)
        {

                    if (ddTypeofQuestions.SelectedItem.Text == "Multiple Questions/Fill the Blanks" )
                    {
                        PanelPart1.Visible = true;
                        PanelPart2.Visible = false;
                        PanelQuizPArt1.Visible = true;
                    }
                    else if (ddTypeofQuestions.SelectedItem.Text == "True/False")
                    {
                        PanelPart2.Visible = true;
                        PanelPart1.Visible = false;
                        PanelQuizPArt1.Visible = true;
                    }
        }
    }
}
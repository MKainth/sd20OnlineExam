using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Group_Project_Online_Exam
{
    public class Question
    {
        public int QuestionId {get;set;}
        public string QuestionText {get;set;}
        public string Answer1 {get;set;}
        public string Answer2 {get;set;}
        public string Answer3 {get;set;}
        public string Answer4 {get;set;}
        public string CorrectAnswer {get;set;}
        public string Marks { get; set; }
    }
}
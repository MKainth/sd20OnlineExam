using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Group_Project_Online_Exam
{
    public class QuestionResponse
    {
        public int QuestionResponseId {get; set;}
        public int QuizResponseId {get; set;}
        public int QuestionId {get; set;}
        public string Response { get; set; }
    }
}
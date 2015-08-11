using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Group_Project_Online_Exam
{
    public class QuizResponse
    {
        public int QuizResponseId {get; set;}
        public DateTime ExamDate {get; set;}
        public int StudentId { get; set; }
    }
}
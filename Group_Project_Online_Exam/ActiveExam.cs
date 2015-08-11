using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Group_Project_Online_Exam
{
    public class ActiveExam
    {
        public int ActiveExamId {get; set;}
        public string StartTime {get; set;}
        public DateTime EndTime {get; set;} 
        public int SessionId {get; set;}
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Group_Project_Online_Exam
{
    public class Student
    {
        public int StudentId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public int ProgramId { get; set; }
        public int SessionId { get; set; }
    }
}
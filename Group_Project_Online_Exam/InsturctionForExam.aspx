<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="InsturctionForExam.aspx.cs" Inherits="Group_Project_Online_Exam.InsturctionForExam" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <h3>Examination Instructions</h3>
    
    <p>Your personal exam schedual for the examinations is available at
    http://www.robertsonStudentExamcentre.net/examinations_and_results/
    </p>
    
    <p>It is your responsibility to attend at the correct date and time for an
    examination. To appear an exam you must have your current Robertson College ID 
    with you.</p> 

    <p><b>Please proceed to Exam</b></p>
    <asp:Button ID="btnStartTest" runat="server" Text="Start Test" />
   

</asp:Content>

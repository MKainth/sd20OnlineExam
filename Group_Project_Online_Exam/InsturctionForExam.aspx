<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="InsturctionForExam.aspx.cs" Inherits="Group_Project_Online_Exam.InsturctionForExam" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Instructions</h3><br />
    <asp:Button ID="btnStart" runat="server" Text="Start Exam" OnClick="btnStart_Click" />
</asp:Content>

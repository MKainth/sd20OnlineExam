<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ExamPage.aspx.cs" Inherits="Group_Project_Online_Exam.ExamPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:HiddenField ID="HiddenField1" runat="server" />
    <asp:Label ID="lblQuestion" runat="server" Text="Label"></asp:Label>
    <asp:Button ID="btnNext" runat="server" Text="Next" OnClick="btnNext_Click" />
</asp:Content>

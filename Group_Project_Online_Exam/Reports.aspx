<%@ Page Title="" Language="C#" MasterPageFile="~/NestedTeacherMasterPage.master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="Group_Project_Online_Exam.Reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HyperLink ID="hlReport1" runat="server" NavigateUrl="~Reports.aspx?link=1" Style="margin-left:1.5em" >Students By Each Program</asp:HyperLink>
</asp:Content>

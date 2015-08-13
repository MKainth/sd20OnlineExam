<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="UserInformation.aspx.cs" Inherits="Group_Project_Online_Exam.UserInformation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbSD20ConnectionString %>" SelectCommand="SELECT * FROM [tbUser]"></asp:SqlDataSource>
    <asp:GridView ID="gvUserInfo" runat="server"></asp:GridView>
</asp:Content>

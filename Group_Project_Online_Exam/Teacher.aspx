<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Teacher.aspx.cs" Inherits="Group_Project_Online_Exam.Teacher1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>Teacher Name:</td>
            <td>
                <asp:TextBox ID="txtTeacherName" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Email</td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Password</td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Admin:<asp:CheckBox ID="CheckBox1" runat="server" /></td>
            <td>Teacher:<asp:CheckBox ID="CheckBox2" runat="server" /></td>
        </tr>


    </table>

</asp:Content>

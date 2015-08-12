<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Quiz.aspx.cs" Inherits="Group_Project_Online_Exam.Quiz1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Quiz Maker App</h1>
    <asp:Panel ID="PanelQuiz" runat="server">
        <h3>Quiz Summary</h3>
        <table>
            <tr>
                <td>Quiz Title</td>
                <td><asp:TextBox ID="TxtQuizTitle" runat="server"></asp:TextBox></td>
                <td>
                    Course
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList3" runat="server"></asp:DropDownList>
                </td>
                <td>
                    Session
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td>
                    Diffculty
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
                </td>
               <td>Time in Minutes</td>
               <td>
                   <asp:TextBox ID="txtTimeinMinutes" runat="server"></asp:TextBox>
               </td>
           </tr>
            <tr>
                <td>

                </td>
            </tr>
            <tr>
                <td></td>
            </tr>
        </table>

    </asp:Panel>
</asp:Content>

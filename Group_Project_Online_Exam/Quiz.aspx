<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Quiz.aspx.cs" Inherits="Group_Project_Online_Exam.Quiz1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            width: 203px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Quiz Maker App</h1>
    <asp:Panel ID="PanelQuiz" BorderColor="Blue" runat="server"><br />
        <h3 class="auto-style2">Quiz Summary</h3>
        <table>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td class="auto-style3">Quiz Title</td>
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
                <td class="auto-style3"></td>
            </tr>
            <tr>
                <td class="auto-style3">
                    Diffculty
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
                </td>
               <td>Time in Mintues</td>
               <td>
                   <asp:TextBox ID="txtTimeinMintues" runat="server"></asp:TextBox>
               </td>
           </tr>
            <tr>
                <td class="auto-style3">

                </td>
            </tr>
            <tr>
                <td class="auto-style3"> Click to add new Qusetion</td>
                <td>
                    <asp:Button ID="btnAddQuestion" runat="server" Text="Add" /></td>
            </tr>

        </table>

    </asp:Panel>
</asp:Content>

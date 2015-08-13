﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Quiz.aspx.cs" Inherits="Group_Project_Online_Exam.Quiz1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            width: 203px;
        }

        .auto-style4 {
            width: 464px;
        }

        .auto-style5 {
            height: 29px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Quiz Maker App</h1>

    <asp:Panel ID="PanelQuiz" BorderColor="Black" BorderStyle="Solid" runat="server">
        <br />
        <h3 class="auto-style2">Quiz Summary</h3>
        <table>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td class="auto-style3">Quiz Title</td>
                <td>
                    <asp:TextBox ID="TxtQuizTitle" runat="server"></asp:TextBox></td>
            </tr>
            <tr>


                <td>Program
                </td>
                <td>
                    <asp:DropDownList ID="ddProgram" runat="server" AutoPostBack="True"></asp:DropDownList>
                </td>
                <td>Session
                </td>
                <td>
                    <asp:DropDownList ID="ddSession" runat="server" AutoPostBack="True"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"></td>
            </tr>
            <tr>
                <td class="auto-style3">Difficulty
                </td>
                <td>
                    <asp:DropDownList ID="ddDifficulty" runat="server"></asp:DropDownList>
                </td>
                <td>Time in Minutes</td>
                <td>
                    <asp:TextBox ID="txtTimeinMinutes" runat="server"></asp:TextBox>
                </td>

            </tr>

            <tr>
                <td class="auto-style3"></td>
            </tr>
            <tr>
                <td class="auto-style3">Click to add new Qusetion</td>
                <td>
                    <asp:Button ID="btnAddQuestion" runat="server" Text="Add" OnClick="btnAddQuestion_Click" /></td>
            </tr>
            <asp:Panel ID="PaneltypeQuestion" runat="server">
                <tr>
                    <td>Type of Question
                    </td>
                    <td>
                        <asp:DropDownList ID="ddTypeofQuestions" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddTypeofQuestions_SelectedIndexChanged">
                            <asp:ListItem Value="-1">Select One</asp:ListItem>
                        </asp:DropDownList></td>


                </tr>
              
            </asp:Panel>
  </table>
    </asp:Panel>
  
    <br />
    <asp:Panel ID="PanelQuizPArt1" Visible="false" BorderStyle="Solid" BorderColor="black" runat="server">
        <table>
            <tr>
                <td>Question:</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtQuestion" runat="server"></asp:TextBox></td>

            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td>Correct Answer
                </td>
                <td>
                    <asp:TextBox ID="txtCorrectAnswer" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Marks</td>
                <td>
                    <asp:TextBox ID="txtMarks" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td></td>
            </tr>
           
        <asp:Panel ID="PanelPart1" Visible="false" runat="server">
            <table>
                <tr>
                    <td>Answer 1:</td>
                    <td class="auto-style4">

                        <asp:TextBox ID="txtAns1" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Answer 2:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtAns2" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Answer 3:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtAns3" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Answer 4:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtAns4" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td></td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="PanelPart2" Visible="false" runat="server">
            <table>
                <tr>
                    <asp:RadioButtonList ID="RdoAnswer" runat="server">
                        <asp:ListItem Text="True" Value="True"></asp:ListItem>
                        <asp:ListItem Text="False" Value="False"></asp:ListItem>
                    </asp:RadioButtonList>
                </tr>
            </table>
        </asp:Panel>
             <tr>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" /></td>
            </tr>
        </table>

    </asp:Panel>
      
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ActiveExam.aspx.cs" Inherits="Group_Project_Online_Exam.ActiveExam1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="gvActiveExam" runat="server">
     
    </asp:GridView>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
 
       <ContentTemplate>
         <table>
            <tr>
                <td>
                    Date
                </td>
                <td>
                    <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                </td>
            </tr>
              <tr>
                <td>
                    Start Time
                </td>
                <td>
                    <asp:TextBox ID="txtStartTime" runat="server"></asp:TextBox>
                </td>
            </tr>
              <tr>
                <td>
                    End Time
                </td>
                <td>
                    <asp:TextBox ID="txtEndTime" runat="server"></asp:TextBox>
                </td>
            </tr>
             <tr>
                 <td>
                     Pick a Session
                 </td>
                 <td>
                 <asp:DropDownList ID="ddSession" runat="server" AutoPostBack="True"></asp:DropDownList>
                     </td>
             </tr>
             <tr>
                 <td>
                     Pick the Exam
                 </td>
                 <td>
                      <asp:DropDownList ID="ddQuiz" runat="server" AutoPostBack="True"></asp:DropDownList>
                 </td>
             </tr>
             <tr>
                 <td>
                     <asp:Button ID="BtnACtive" runat="server" Text="Active Exam" OnClick="BtnACtive_Click" />
                 </td>
             </tr>
        </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

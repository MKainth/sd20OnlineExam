<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ExamPage.aspx.cs" Inherits="Group_Project_Online_Exam.ExamPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
        </Triggers>

        <ContentTemplate>
          
            <asp:Label ID="lblComplted" runat="server" Text=""></asp:Label>
            <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
            
            <asp:Label ID="lblQuestion" runat="server" Text=""></asp:Label>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server">
            </asp:RadioButtonList>
            <asp:Button ID="btnNext" runat="server" Text="Next" OnClick="btnNext_Click" />
        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>

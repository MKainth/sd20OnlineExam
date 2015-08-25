<%@ Page Title="" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="ExamPage.aspx.cs" Inherits="Group_Project_Online_Exam.ExamPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <span id="time" runat="server"></span>

   
    <asp:Timer ID="Timer1" runat="server" Interval="3600" OnTick="Timer1_Tick"></asp:Timer>


    <asp:UpdatePanel ID="UpdatePanel2" runat="server" >
 
        <ContentTemplate>
            <asp:Label ID="lblTimer" runat="server" Text="Label"></asp:Label>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
        </Triggers>

        
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Label ID="lblComplted" runat="server" Text=""></asp:Label>
            <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
            
            <asp:Label ID="lblQuestion" runat="server" Text=""></asp:Label>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server">
            </asp:RadioButtonList>
            <asp:Button ID="btnback" runat="server" Text="back" OnClick="btnback_Click"/>
            <asp:Button ID="btnNext" runat="server" Text="Next" OnClick="btnNext_Click" />
        </ContentTemplate>
    </asp:UpdatePanel>
     

        <script>
            function startTimer(duration, display) {
                var timer = duration, minutes, seconds;
                setInterval(function () {
                    minutes = parseInt(timer / 60, 10)
                    seconds = parseInt(timer % 60, 10);

                    minutes = minutes < 10 ? "0" + minutes : minutes;
                    seconds = seconds < 10 ? "0" + seconds : seconds;

                    display.text(minutes + ":" + seconds);

                    if (--timer < 0) {
                        timer = duration;
                    }
                }, 1000);
            }

            $(function ($) {
                var seconds = parseInt($("#ContentPlaceHolder1_time").html());
                startTimer(seconds, $("#ContentPlaceHolder1_time"));
            });
    </script>
</asp:Content>

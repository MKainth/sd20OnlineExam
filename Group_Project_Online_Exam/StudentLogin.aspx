<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="StudentLogin.aspx.cs" Inherits="Group_Project_Online_Exam.StudentLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <div class="LoginPanel">
            <asp:Panel ID="pnlLogin" runat="server">
              
                 <table style="column-width:50px;">                   
            <tr>
                <td>
                    <asp:Label ID="lblUserName" CssClass="Text" runat="server" Text="Email:"></asp:Label>
                </td>
                <td >
                    <asp:TextBox ID="txtUserName" CssClass="textbox" runat="server" Text=""></asp:TextBox>
                </td>
                <td>@robertsoncollege.net</td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:Label ID="lblPassword" CssClass="Text" runat="server" Text="Password:"></asp:Label>
                </td>
                <td>
                    <br />
                    <asp:TextBox ID="txtPassword" CssClass="textbox" runat="server" Text="" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
                     <tr>
                         <td></td>
                         <td></td>
                     </tr>
            <tr>
                <td>                   
                </td>
                <td>
                    &nbsp; &nbsp;&nbsp; &nbsp;
                    <asp:Button ID="btnLogin" CssClass="button" runat="server" Text="Log In" />                   
                </td>
            </tr>
                     <tr>
                         <td></td>
                         <td>
                              &nbsp; &nbsp;
                              <asp:LinkButton ID="lbForgotPassword" runat="server" >Forgot Password?</asp:LinkButton>
                         </td>
                     </tr>
        </table>    
                </asp:Panel> 
                </div>  
</asp:Content>

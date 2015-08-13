<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Group_Project_Online_Exam.Teacher1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <p><b>Please Enter your Information</b></p>
        <tr>
            <td>Student: <asp:RadioButton ID="RadioButton1" runat="server" /></td>
            <td>Teacher:<asp:RadioButton ID="RadioButton2" runat="server" /></td>  
        </tr>
        &nbsp;
        <tr>
            <td>User Name:</td>
            <td>
                <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>First Name:</td>
            <td>
                <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Last Name:</td>
            <td>
                <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox></td>
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
        
        <tr><td></td>
            <td><asp:Button ID="btnSubmit" runat="server" Text="Submit" /></td></tr>
    </table>

    <asp:Panel ID="pnlStudent" runat="server">
        <asp:DropDownList ID="ddlSession" runat="server">

        </asp:DropDownList>
    </asp:Panel>
</asp:Content>

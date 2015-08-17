<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="UserInformation.aspx.cs" Inherits="Group_Project_Online_Exam.UserInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbSD20ConnectionString %>" SelectCommand="SELECT [UserId], [FirstName], [LastName], [Email], [Password], [SecurityLevel] FROM [tbUser]" DeleteCommand="DELETE FROM [tbUser] WHERE [UserId] = @UserId" InsertCommand="INSERT INTO [tbUser] ([FirstName], [LastName], [Email], [Password], [SecurityLevel]) VALUES (@FirstName, @LastName, @Email, @Password, @SecurityLevel)" UpdateCommand="UPDATE [tbUser] SET [FirstName] = @FirstName, [LastName] = @LastName, [Email] = @Email, [Password] = @Password, [SecurityLevel] = @SecurityLevel WHERE [UserId] = @UserId">
        <DeleteParameters>
            <asp:Parameter Name="UserId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="SecurityLevel" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="SecurityLevel" Type="Int32" />
            <asp:Parameter Name="UserId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <div style="overflow-x: auto; width: 550px">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Insert" />
        <asp:GridView ID="gvUserInfo" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="UserId" DataSourceID="SqlDataSource1" ShowFooter="True">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:TemplateField HeaderText="UserId" InsertVisible="False" SortExpression="UserId">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("UserId") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("UserId") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="linkButtonInsert" runat="server" ValidationGroup="Insert" OnClick="linkButtonInsert_Click">Insert</asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="FirstName" SortExpression="FirstName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqFirstname" ValidationGroup="Insert"  ControlToValidate="txtFirstName" Text="*" runat="server" ErrorMessage="Required First Name"></asp:RequiredFieldValidator>

                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="LastName" SortExpression="LastName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                    </ItemTemplate>
                     <FooterTemplate>
                        <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="reqLastName" ValidationGroup="Insert"  ControlToValidate="txtLastName" Text="*" runat="server" ErrorMessage="Required Last Name"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email" SortExpression="Email">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                    </ItemTemplate>
                     <FooterTemplate>
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="reqemail" ValidationGroup="Insert"  ControlToValidate="txtEmail" Text="*" runat="server" ErrorMessage="Required Email"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="valEmail" runat="server" ErrorMessage="Email Required!" ControlToValidate="txtEmail" Text="*" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                     </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Password" SortExpression="Password">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Password") %>'></asp:Label>
                    </ItemTemplate>
                     <FooterTemplate>
                        <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="reqPassword" ValidationGroup="Insert"  ControlToValidate="txtPassword" Text="*" runat="server" ErrorMessage="Required Password"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="SecurityLevel" SortExpression="SecurityLevel">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("SecurityLevel") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("SecurityLevel") %>'></asp:Label>
                    </ItemTemplate>
                     <FooterTemplate>
                        <asp:TextBox ID="txtSecurityLevel" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="reqsecuritylevel" ValidationGroup="Insert" runat="server" ControlToValidate="txtSecurityLevel" Text="*" ErrorMessage="Required Security Level"></asp:RequiredFieldValidator>
                         <asp:RangeValidator ID="valSecuritylevel" runat="server" ErrorMessage="Value should be 1, 2, 3"  MinimumValue="1" MaximumValue="3" CultureInvariantValues="False" ControlToValidate="txtSecurityLevel"></asp:RangeValidator>                     
                     </FooterTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

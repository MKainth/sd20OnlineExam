<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="UpdateDelete.aspx.cs" Inherits="Group_Project_Online_Exam.UpdateDelete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">







    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbSD20ConnectionString %>" DeleteCommand="DELETE FROM [tbQuestion] WHERE [QuestionId] = @QuestionId" InsertCommand="INSERT INTO [tbQuestion] ([Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [Marks], [QuizId]) VALUES (@Question, @Answer1, @Answer2, @Answer3, @Answer4, @CorrectAnswer, @Marks, @QuizId)" SelectCommand="SELECT [QuestionId], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [Marks], [QuizId] FROM [tbQuestion]" UpdateCommand="UPDATE [tbQuestion] SET [Question] = @Question, [Answer1] = @Answer1, [Answer2] = @Answer2, [Answer3] = @Answer3, [Answer4] = @Answer4, [CorrectAnswer] = @CorrectAnswer, [Marks] = @Marks, [QuizId] = @QuizId WHERE [QuestionId] = @QuestionId">
    <DeleteParameters>
        <asp:Parameter Name="QuestionId" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Question" Type="String" />
        <asp:Parameter Name="Answer1" Type="String" />
        <asp:Parameter Name="Answer2" Type="String" />
        <asp:Parameter Name="Answer3" Type="String" />
        <asp:Parameter Name="Answer4" Type="String" />
        <asp:Parameter Name="CorrectAnswer" Type="String" />
        <asp:Parameter Name="Marks" Type="Int32" />
        <asp:Parameter Name="QuizId" Type="Int32" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Question" Type="String" />
        <asp:Parameter Name="Answer1" Type="String" />
        <asp:Parameter Name="Answer2" Type="String" />
        <asp:Parameter Name="Answer3" Type="String" />
        <asp:Parameter Name="Answer4" Type="String" />
        <asp:Parameter Name="CorrectAnswer" Type="String" />
        <asp:Parameter Name="Marks" Type="Int32" />
        <asp:Parameter Name="QuizId" Type="Int32" />
        <asp:Parameter Name="QuestionId" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
      <div style="overflow-x: auto; width: 550px">
    
          
          <asp:GridView ID="GridView1" runat="server"  AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="QuestionId" DataSourceID="SqlDataSource1" PageSize="5" ShowFooter="True">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:TemplateField HeaderText="QuestionId" InsertVisible="False" SortExpression="QuestionId">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("QuestionId") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("QuestionId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Question" SortExpression="Question">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Question") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Question") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Answer1" SortExpression="Answer1">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Answer1") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Answer1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Answer2" SortExpression="Answer2">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Answer2") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Answer2") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Answer3" SortExpression="Answer3">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Answer3") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Answer3") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Answer4" SortExpression="Answer4">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Answer4") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Answer4") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CorrectAnswer" SortExpression="CorrectAnswer">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("CorrectAnswer") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("CorrectAnswer") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Marks" SortExpression="Marks">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Marks") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Marks") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="QuizId" SortExpression="QuizId">
                <EditItemTemplate>
                 
                    <asp:DropDownList ID="DropDownList1" runat="server" DataTextField='<%# Bind("QuizId") %>'></asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("QuizId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        
        </Columns>
</asp:GridView>
 </div>
    <asp:Button ID="btnAddQuiz" runat="server" Text="Add New Quiz" OnClick="btnAddQuiz_Click" />
</asp:Content>

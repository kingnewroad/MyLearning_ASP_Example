<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="NewUser.aspx.cs" Inherits="NewUser" Title="注册新用户" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" ContinueDestinationPageUrl="~/Default.aspx"
        OnCreatedUser="CreateUserWizard1_CreatedUser" MailDefinition-BodyFileName="ThankEmail.txt"
        MailDefinition-From="jxssg@126.com" MailDefinition-IsBodyHtml="True" MailDefinition-Subject="感谢注册"
        InvalidPasswordErrorMessage="密码最短长度为 {0}，其中必须包含非字母数字字符。">
        <WizardSteps>
            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server" />
            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server" />
        </WizardSteps>
    </asp:CreateUserWizard>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" runat="Server">
</asp:Content>

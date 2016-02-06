<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ChangePwd.aspx.cs" Inherits="ChangePwd" Title="修改用户密码" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:LoginView ID="LoginView1" runat="server">
        <AnonymousTemplate>
            您还未登录，请先登录！
        </AnonymousTemplate>
        <RoleGroups>
            <asp:RoleGroup Roles="Member">
                <ContentTemplate>
                    <asp:ChangePassword ID="ChangePassword1" runat="server" ContinueDestinationPageUrl="~/Default.aspx">
                    </asp:ChangePassword>
                </ContentTemplate>
            </asp:RoleGroup>
            <asp:RoleGroup Roles="Admin">
                <ContentTemplate>
                    <asp:ChangePassword ID="ChangePassword1" runat="server" ContinueDestinationPageUrl="~/Default.aspx">
                    </asp:ChangePassword>
                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" runat="Server">
</asp:Content>

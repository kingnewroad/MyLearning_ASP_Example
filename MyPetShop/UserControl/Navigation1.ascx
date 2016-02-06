<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Navigation1.ascx.cs" Inherits="UserControl_Navigation1" %>
<asp:LoginView ID="LoginView1" runat="server">
    <AnonymousTemplate>
        您还未登录！</AnonymousTemplate>
    <LoggedInTemplate>
        您还未登录！
    </LoggedInTemplate>
    <RoleGroups>
        <asp:RoleGroup Roles="Member">
            <ContentTemplate>
                <asp:LoginName ID="LoginName1" runat="server" FormatString="Welcome ： {0} " />
                <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="White" PostBackUrl="~/ChangePwd.aspx"
                    CausesValidation="False">密码修改</asp:LinkButton>
                <asp:LinkButton ID="LinkButton2" runat="server" ForeColor="White" PostBackUrl="~/OrderList.aspx"
                    CausesValidation="False">购物记录</asp:LinkButton>
                <asp:LoginStatus ID="LoginStatus1" runat="server" ForeColor="White" LogoutText="退出登录" />
            </ContentTemplate>
        </asp:RoleGroup>
        <asp:RoleGroup Roles="Admin">
            <ContentTemplate>
                <asp:LoginName ID="LoginName2" runat="server" FormatString="Welcome ： {0} " />
                <asp:LinkButton ID="LinkButton3" runat="server" ForeColor="White" PostBackUrl="~/ChangePwd.aspx"
                    CausesValidation="False">密码修改</asp:LinkButton>
                <asp:LinkButton ID="LinkButton4" runat="server" ForeColor="White" PostBackUrl="~/Admin/Default.aspx"
                    CausesValidation="False">系统管理</asp:LinkButton>
                <asp:LoginStatus ID="LoginStatus2" runat="server" ForeColor="White" LogoutText="退出登录" />
            </ContentTemplate>
        </asp:RoleGroup>
    </RoleGroups>
</asp:LoginView>

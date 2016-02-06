<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" Title="首页" %>

<%@ Register Src="UserControl/NewProduct.ascx" TagName="NewProduct" TagPrefix="uc1" %>
<%@ Register Src="UserControl/Weather.ascx" TagName="Weather" TagPrefix="uc2" %>
<%@ Register Src="UserControl/Category.ascx" TagName="Bodyuc2" TagPrefix="uc3" %>
<%@ Register Src="UserControl/Bodyuc3.ascx" TagName="Bodyuc3" TagPrefix="uc4" %>
<%@ Register Src="UserControl/Bodyuc4.ascx" TagName="Bodyuc4" TagPrefix="uc5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:WebPartZone ID="WebPartZone1" runat="server" Width="227" HeaderText="模块1" WebPartVerbRenderMode="TitleBar">
                <ZoneTemplate>
                    <uc1:NewProduct ID="NewProduct1" runat="server" title="最新商品" />
                </ZoneTemplate>
            </asp:WebPartZone>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:WebPartZone ID="WebPartZone2" runat="server" Width="100%" HeaderText="模块2" WebPartVerbRenderMode="TitleBar">
                <ZoneTemplate>
                    <uc2:Weather ID="Weather1" runat="server" title="天气预报--(中国气象局提供数据!)" />
                </ZoneTemplate>
            </asp:WebPartZone>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:WebPartZone ID="WebPartZone3" runat="server" Width="227" HeaderText="模块3" WebPartVerbRenderMode="TitleBar">
                <ZoneTemplate>
                    <uc3:Bodyuc2 ID="Bodyuc21" runat="server" title="商品分类" />
                </ZoneTemplate>
            </asp:WebPartZone>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:WebPartZone ID="WebPartZone4" runat="server" Width="275" HeaderText="模块4" WebPartVerbRenderMode="TitleBar">
                <ZoneTemplate>
                    <uc4:Bodyuc3 ID="Bodyuc31" runat="server" />
                </ZoneTemplate>
            </asp:WebPartZone>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:WebPartZone ID="WebPartZone5" runat="server" Width="252" HeaderText="模块5" WebPartVerbRenderMode="TitleBar">
                <ZoneTemplate>
                    <uc5:Bodyuc4 ID="Bodyuc41" runat="server" />
                </ZoneTemplate>
            </asp:WebPartZone>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

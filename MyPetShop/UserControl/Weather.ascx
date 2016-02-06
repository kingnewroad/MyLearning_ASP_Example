<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Weather.ascx.cs" Inherits="Weather" %>
<table width="100%" border="0" cellspacing="2" cellpadding="2">
    <tr>
        <td>
            <strong>选择省/洲&nbsp; </strong>
            <asp:DropDownList ID="ddlProvince" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlProvince_SelectedIndexChanged">
            </asp:DropDownList>
            <strong>&nbsp; 选择城市</strong>&nbsp;&nbsp;
            <asp:DropDownList ID="ddlCity" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCity_SelectedIndexChanged">
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblCity" runat="server" ForeColor="#CC0033" />
        </td>
    </tr>
    <tr>
        <td>
            <strong>今日实况&nbsp; </strong>
            <asp:Label ID="lblNow" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <strong>天气预报</strong><font color="#FF0033">(今天)</font>&nbsp;&nbsp;
            <asp:Label ID="lblToday" runat="server" />
            &nbsp;&nbsp;&nbsp;
            <asp:Image AlternateText="icon" ID="imgWeathertrendsTdS" ImageAlign="AbsMiddle" 
                runat="server" />
            &nbsp;&nbsp;&nbsp;
            <asp:Image AlternateText="icon" ID="imgWeathertrendsTdE" ImageAlign="AbsMiddle" 
                runat="server" />&nbsp;
        </td>
    </tr>
    <tr>
        <td>
            <strong>天气预报</strong><font color="#3333FF">(明天)</font>&nbsp;&nbsp;
            <asp:Label ID="lblTomorrow" runat="server" />
            &nbsp;&nbsp;&nbsp;
            <asp:Image AlternateText="icon" ID="imgWeathertrendsTmS" ImageAlign="AbsMiddle" 
                runat="server" />
            &nbsp;&nbsp;&nbsp;
            <asp:Image AlternateText="icon" ID="imgWeathertrendsTmE" ImageAlign="AbsMiddle" 
                runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <strong>天气预报</strong><font color="#006633">(后天)</font>&nbsp;&nbsp;
            <asp:Label ID="lblAfterTmr" runat="server" />
            &nbsp;&nbsp;&nbsp;
            <asp:Image AlternateText="icon" ID="imgWeathertrendsAfS" ImageAlign="AbsMiddle" 
                runat="server" />
            &nbsp;&nbsp;&nbsp;
            <asp:Image AlternateText="icon" ID="imgWeathertrendsAfE" ImageAlign="AbsMiddle" 
                runat="server" />
            &nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="hlkMore" runat="server" ForeColor="#666666" NavigateUrl="~/Weather.aspx"
                Target="_blank">更多信息</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </td>
    </tr>
</table>

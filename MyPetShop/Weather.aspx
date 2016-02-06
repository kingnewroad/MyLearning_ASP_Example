<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Weather.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Weather Forecast</title>
    <link href="img/weather.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <table width="680" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td height="60" align="center">
                <asp:Label Font-Bold="True" ID="lblTitle" runat="server" Text="国内外主要城市  3天天气预报实例" />
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="25%">
                            <strong>选择省/洲</strong>
                            <asp:DropDownList CssClass="list" ID="ddlProvince" runat="server" AutoPostBack="true"
                                OnSelectedIndexChanged="ddlProvince_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <strong>选择城市</strong>
                            <asp:DropDownList CssClass="list" ID="ddlCity" runat="server" AutoPostBack="true"
                                OnSelectedIndexChanged="ddlCity_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" border="0" cellspacing="2" cellpadding="0">
                    <tr>
                        <td width="15%" height="30">
                            &nbsp;
                        </td>
                        <td align="right">
                            <asp:Label CssClass="bredfont" ID="lblCity" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <strong>今日实况</strong>
                        </td>
                        <td class="hfont">
                            <asp:Label ID="lblNow" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <strong>天气预报</strong><font color="#FF0033">(今天)</font>
                        </td>
                        <td class="hfont">
                            <asp:Label ID="lblToday" runat="server" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Image AlternateText="icon" ID="imgWeathertrendsTdS" ImageAlign="AbsMiddle" runat="server" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Image AlternateText="icon" ID="imgWeathertrendsTdE" ImageAlign="AbsMiddle" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <strong>今天指数</strong>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" valign="top" class="hfont">
                            <asp:Label ID="lblExponent" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <strong>天气预报</strong><font color="#3333FF">(明天)</font>
                        </td>
                        <td class="hfont">
                            <asp:Label ID="lblTomorrow" runat="server" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Image AlternateText="icon" ID="imgWeathertrendsTmS" ImageAlign="AbsMiddle" runat="server" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Image AlternateText="icon" ID="imgWeathertrendsTmE" ImageAlign="AbsMiddle" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <strong>天气预报</strong><font color="#006633">(后天)</font>
                        </td>
                        <td class="hfont">
                            <asp:Label ID="lblAfterTmr" runat="server" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Image AlternateText="icon" ID="imgWeathertrendsAfS" ImageAlign="AbsMiddle" runat="server" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Image AlternateText="icon" ID="imgWeathertrendsAfE" ImageAlign="AbsMiddle" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" valign="top">
                            <strong>城市介绍</strong>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" valign="top" class="hfont">
                            <asp:Image CssClass="img" Height="105" ID="imgCityPhoto" ImageAlign="Left" runat="server"
                                Width="150" /><asp:Label ID="lblCityIntro" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td height="30" colspan="2" align="right" valign="bottom">
                            <strong>预报时间</strong>：
                            <asp:Label ID="lblTime" runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

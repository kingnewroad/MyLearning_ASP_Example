<%@ Page Language="C#" Debug="true" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="SubmitCart.aspx.cs" Inherits="SubmitCart" Title="订单结算" %>

<%@ Register Src="UserControl/PetTree.ascx" TagName="PetTree" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc1:PetTree ID="PetTree1" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Panel ID="pnlConsignee" runat="server">
        <table width="100%" border="0" cellspacing="2" cellpadding="4">
            <tr>
                <td align="center" colspan="2">
                    <strong>填写发货地址</strong>
                </td>
            </tr>
            <tr>
                <td width="20%" align="right">
                    送货地址：
                </td>
                <td width="80%">
                    <asp:TextBox ID="txtAddr1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAddr1" runat="server" ErrorMessage="不能为空" ControlToValidate="txtAddr1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    发票寄送地址：
                </td>
                <td>
                    <asp:TextBox ID="txtAddr2" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAddr2" runat="server" ControlToValidate="txtAddr2"
                        ErrorMessage="不能为空"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    城市：
                </td>
                <td>
                    <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity"
                        ErrorMessage="不能为空"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    地区：
                </td>
                <td>
                    <asp:TextBox ID="txtState" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvState" runat="server" ControlToValidate="txtState"
                        ErrorMessage="不能为空"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    邮编：
                </td>
                <td>
                    <asp:TextBox ID="txtZip" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvZip" runat="server" ControlToValidate="txtZip"
                        ErrorMessage="不能为空"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                            ID="revZip" runat="server" ErrorMessage="邮编错误！" 
                        ControlToValidate="txtZip" ValidationExpression="\d{6}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    联系电话：
                </td>
                <td>
                    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone"
                        ErrorMessage="不能为空"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    &nbsp;
                </td>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="提交结算" OnClick="btnSubmit_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Label ID="lblMsg" runat="server"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" runat="Server">
</asp:Content>

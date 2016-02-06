﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="AddPro.aspx.cs" Inherits="Admin_AddPro" Title="添加商品信息" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <a href="CategoryMaster.aspx">分类管理</a>
    <br />
    <a href="SupplierMaster.aspx">供应商管理</a>
    <br />
    <a href="ProductMaster.aspx">商品管理</a><br />
    <a href="OrderMaster.aspx">订单管理</a><br />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Panel ID="Panel1" runat="server">
        <table border="0" cellpadding="4" cellspacing="2" width="100%">
            <tr>
                <td align="center" colspan="2">
                    <strong>添加商品</strong>
                </td>
            </tr>
            <tr>
                <td align="right" width="17%">
                    商品名称:
                </td>
                <td width="83%">
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                        ErrorMessage="不能为空"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblNameErr" runat="server"
                            ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right">
                    商品分类:
                </td>
                <td>
                    <asp:DropDownList ID="ddlCategoryId" runat="server">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvCategoryId" runat="server" ControlToValidate="ddlCategoryId"
                        ErrorMessage="不能为空"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    商品单价:
                </td>
                <td>
                    <asp:TextBox ID="txtListPrice" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvListPrice" runat="server" ControlToValidate="txtListPrice"
                        ErrorMessage="不能为空"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    单位成本:
                </td>
                <td>
                    <asp:TextBox ID="txtUnitCost" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUnitCost" runat="server" ControlToValidate="txtUnitCost"
                        ErrorMessage="不能为空"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    提供商:
                </td>
                <td>
                    <asp:DropDownList ID="ddlSuppId" runat="server">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvSuppId" runat="server" ControlToValidate="ddlSuppId"
                        ErrorMessage="不能为空"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    描述:
                </td>
                <td>
                    <asp:TextBox ID="txtDescn" runat="server" Height="89px" TextMode="MultiLine" 
                        Width="263px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDescn" runat="server" ControlToValidate="txtDescn"
                        ErrorMessage="不能为空"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    库存:
                </td>
                <td>
                    <asp:TextBox ID="txtQty" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvQty" runat="server" ControlToValidate="txtQty"
                        ErrorMessage="不能为空"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    产品图片:
                </td>
                <td>
                    <asp:FileUpload ID="fupImage" runat="server" />
                    <asp:RequiredFieldValidator ID="rfvImage" runat="server" ControlToValidate="fupImage"
                        ErrorMessage="不能为空"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    &nbsp;
                </td>
                <td>
                    <asp:Button ID="btnAdd" runat="server" Text="添加商品" OnClick="btnAdd_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Label ID="lblMsg" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" runat="Server">
</asp:Content>

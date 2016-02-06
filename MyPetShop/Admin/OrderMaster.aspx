﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="OrderMaster.aspx.cs" Inherits="Admin_OrderMaster" Title="查看订单信息" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <a href="CategoryMaster.aspx">分类管理</a>
    <br />
    <a href="SupplierMaster.aspx">供应商管理</a>
    <br />
    <a href="ProductMaster.aspx">商品管理</a><br />
    <a href="OrderMaster.aspx">订单管理</a><br />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Panel ID="pnlOrder" runat="server">
        <asp:GridView ID="gvOrder" runat="server" Width="100%" AutoGenerateColumns="false"
            AllowPaging="True" PageSize="10" OnPageIndexChanging="gvOrder_PageIndexChanging"
            PagerSettings-Mode="NextPrevious">
            <PagerSettings FirstPageText="首页" LastPageText="尾页" Mode="NextPrevious" NextPageText="下一页"
                Position="TopAndBottom" PreviousPageText="上一页" />
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkChoice" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:HyperLinkField Text="订单详细" DataTextFormatString="{0:c}" DataNavigateUrlFields="OrderId"
                    DataNavigateUrlFormatString="~/Admin/OrderSub.aspx?OrderId={0}" HeaderText="订单详细" />
                <asp:BoundField DataField="OrderId" HeaderText="订单ID" />
                <asp:BoundField DataField="UserName" HeaderText="用户" />
                <asp:BoundField DataField="Status" HeaderText="审核状态" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:Button ID="btnAudit" runat="server" Text="审核商品" OnClick="btnAudit_Click" />
    </asp:Panel>
    <asp:Label ID="lblOrder" runat="server"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" runat="Server">
</asp:Content>

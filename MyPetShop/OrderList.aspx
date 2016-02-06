<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="OrderList.aspx.cs" Inherits="OrderList" Title="查看订单" %>

<%@ Register Src="UserControl/PetTree.ascx" TagName="PetTree" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc1:PetTree ID="PetTree1" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:GridView ID="gvOrderItem" runat="server" Width="100%" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging"
        PagerSettings-Mode="NextPrevious" CellPadding="4" ForeColor="#333333" GridLines="None"
        AutoGenerateColumns="False">
        <PagerSettings FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" Position="TopAndBottom"
            PreviousPageText="上一页" />
        <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
        <RowStyle BackColor="#E3EAEB" />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/img/arrow.gif" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ItemId" HeaderText="序列号" />
            <asp:BoundField DataField="OrderId" HeaderText="订单号" />
            <asp:BoundField DataField="ProName" HeaderText="商品名称" />
            <asp:BoundField DataField="ListPrice" HeaderText="商品单价" />
            <asp:BoundField DataField="Qty" HeaderText="购买数量" />
            <asp:BoundField DataField="TotalPrice" HeaderText="总价" />
        </Columns>
        <PagerStyle BackColor="#ffffff" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#ccccd4" Font-Bold="True" ForeColor="Black" />
        <EditRowStyle BackColor="#7C6F57" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" runat="Server">
</asp:Content>

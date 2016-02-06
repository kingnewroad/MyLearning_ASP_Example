<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ProShow.aspx.cs" Inherits="ProShow" Title="商品详细信息浏览" %>

<%@ Register Src="UserControl/PetTree.ascx" TagName="PetTree" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc1:PetTree ID="PetTree1" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <p>
    </p>
    <asp:GridView ID="gvProduct" runat="server" AutoGenerateColumns="false" Width="100%"
        AllowPaging="True" PageSize="4" OnPageIndexChanging="gvProduct_PageIndexChanging"
        PagerSettings-Mode="NextPrevious">
        <PagerSettings FirstPageText="首页" LastPageText="尾页" Mode="NextPrevious" NextPageText="下一页"
            Position="TopAndBottom" PreviousPageText="上一页" />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <table width="100%" border="1" cellpadding="6" cellspacing="4">
                        <tr>
                            <td width="40%" rowspan="7" align="center" valign="middle">
                                <asp:Image ID="imgImage" runat="server" ImageUrl='<%# Bind("Image") %>' />
                            </td>
                            <td width="20%">
                                产品编号：
                            </td>
                            <td width="40%">
                                <asp:Label ID="lblProductId" runat="server" Text='<%# Bind("ProductId") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                产品分类：
                            </td>
                            <td>
                                <asp:Label ID="lblCategoryId" runat="server" Text='<%# Bind("CategoryId") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                产品名称：
                            </td>
                            <td>
                                <asp:Label ID="lblName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                产品价格：
                            </td>
                            <td>
                                <asp:Label ID="lblListPrice" runat="server" Text='<%# Bind("ListPrice") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                单位成本：
                            </td>
                            <td>
                                <asp:Label ID="lblUnitCost" runat="server" Text='<%# Bind("UnitCost") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                产品描述：
                            </td>
                            <td>
                                <asp:Label ID="lblDescn" runat="server" Text='<%# Bind("Descn") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                库存：
                            </td>
                            <td>
                                <asp:Label ID="lblQty" runat="server" Text='<%# Bind("Qty") %>'></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:HyperLinkField Text="购买" DataTextFormatString="{0:c}" DataNavigateUrlFields="ProductId"
                DataNavigateUrlFormatString="~/ShopCart.aspx?ProductId={0}" HeaderText="放入购物车" />
        </Columns>
    </asp:GridView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" runat="Server">
</asp:Content>

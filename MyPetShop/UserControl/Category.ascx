<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Category.ascx.cs" Inherits="Bodyuc2" %>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" 
            ForeColor="#333333" GridLines="None" Width="100%">
    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    <RowStyle BackColor="#E3EAEB" />
<Columns>
    <asp:TemplateField>
    <ItemTemplate>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/img/arrow.gif" />
    </ItemTemplate>
    </asp:TemplateField>
    <asp:HyperLinkField  DataTextField="Name"
    DataTextFormatString="{0:c}" 
    DataNavigateUrlFields="CategoryId"
    DataNavigateUrlFormatString="~/ProShow.aspx?CategoryId={0}"
    HeaderText="分类名称"
    />
    <asp:BoundField DataField="ProductCount" DataFormatString="({0})" HeaderText="商品数量" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"  />
</Columns>
    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#ccccd4" Font-Bold="True" ForeColor="Black" />
    <EditRowStyle BackColor="#7C6F57" />
    <AlternatingRowStyle BackColor="White" />
</asp:GridView>
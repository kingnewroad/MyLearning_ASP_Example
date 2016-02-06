using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using MyPetShop;

public partial class SubmitCart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!User.Identity.IsAuthenticated)
        {
            Response.Redirect("~/Login.aspx", true);
        }
        pnlConsignee.Visible = true;
        lblMsg.Text = "";
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        DataConn dataconn = new DataConn();
        //在Order表中添加记录
        Order order = new Order();
        order.UserName = User.Identity.Name;
        order.OrderDate = DateTime.Now;
        order.Addr1 = txtAddr1.Text.Trim();
        order.Addr2 = txtAddr2.Text.Trim();
        order.City = txtCity.Text.Trim();
        order.State = txtState.Text.Trim();
        order.Zip = txtZip.Text.Trim();
        order.Phone = txtPhone.Text.Trim();
        order.Status = "未审核";
        dataconn.Order.InsertOnSubmit(order);
        dataconn.SubmitChanges();

        //在OrderItem中添加记录
        int orderId = order.OrderId;
        for (int i = 0; i < Profile.Cart.ProName.Count; i++)
        {
            OrderItem orderItem = new OrderItem();
            orderItem.OrderId = orderId;
            orderItem.ProName = (string)Profile.Cart.ProName[i];
            orderItem.ListPrice = (decimal)Profile.Cart.ListPrice[i];
            orderItem.Qty = (int)Profile.Cart.Qty[i];
            orderItem.TotalPrice = (int)Profile.Cart.Qty[i] * (decimal)Profile.Cart.ListPrice[i];

            //修改Product表的商品库存
            var product = (from c in dataconn.Product
                           where c.ProductId == (int)Profile.Cart.ProId[i]
                           select c).First();
            product.Qty -= orderItem.Qty;

            dataconn.OrderItem.InsertOnSubmit(orderItem);
            dataconn.SubmitChanges();
        }

        //清空各数组列表对象
        Profile.Cart.Qty.Clear();
        Profile.Cart.ProName.Clear();
        Profile.Cart.ProId.Clear();
        Profile.Cart.ListPrice.Clear();
        Profile.Cart.TotalPrice = "";
        pnlConsignee.Visible = false;
        lblMsg.Text = "已经成功结算，谢谢光临！";
    }
}

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


public partial class ShopCart : System.Web.UI.Page
{
    DataConn dataconn = new DataConn();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["ProductId"] != null)
            {
                int productId = int.Parse(Request.QueryString["ProductId"]);
                AddProduct(productId);
            }
            lblHint.Text = "温馨提示：更改购买数量后，请单击'重新计算'按钮进行更新！";
            Bind();
        }
    }

    /// <summary>
    /// 将指定商品号的商品添加到购物车，购物车以Profile形式存储
    /// </summary>
    /// <param name="productId">指定的商品号</param>
    protected void AddProduct(int productId)
    {
        int isExit = 0;
        for (int j = 0; j < Profile.Cart.ProName.Count; j++)
        {
            //如果同类商品已经存在购物车中，将购买量加1
            if (productId == (int)Profile.Cart.ProId[j])
            {
                int qty = (int)Profile.Cart.Qty[j];
                qty++;
                Profile.Cart.Qty[j] = qty;
                Profile.Save();
                isExit = 1;
            }
        }
        if (isExit == 0)
        {
            //如果购物车中无此类商品，添加一个新产品到Profile.Cart各属性中
            var products = from r in dataconn.Product
                           where r.ProductId == productId
                           select r;
            foreach (var product in products)
            {
                Profile.Cart.ListPrice.Add(product.ListPrice);
                Profile.Cart.Qty.Add(1);
                Profile.Cart.ProId.Add(product.ProductId);
                Profile.Cart.ProName.Add(product.Name);
            }
            Profile.Save();
        }
    }

    /// <summary>
    /// 将Profile.Cart中的购物记录放在一个临时表dt中,再将dt作为数据源，绑定到gvCart
    /// </summary>
    protected void Bind()
    {
        Profile.Cart.TotalPrice = TotalPrice().ToString();
        lblTotalPrice.Text = Profile.Cart.TotalPrice;
        DataTable dt = new DataTable();
        dt.Columns.Add("ProId");
        dt.Columns.Add("ProName");
        dt.Columns.Add("ListPrice");
        dt.Columns.Add("Qty");
        for (int i = 0; i < Profile.Cart.ProName.Count; i++)
        {
            DataRow row = dt.NewRow();
            row[0] = Profile.Cart.ProId[i];
            row[1] = Profile.Cart.ProName[i];
            row[2] = Profile.Cart.ListPrice[i];
            row[3] = Profile.Cart.Qty[i];
            dt.Rows.Add(row);
        }
        gvCart.DataSource = dt;
        gvCart.DataBind();
        if (gvCart.Rows.Count != 0)
        {
            pnlCart.Visible = true;
            lblCart.Text = "";
        }
        else
        {
            pnlCart.Visible = false;
            lblCart.Text = "购物车内无商品，请先购物！";
        }
    }

    /// <summary>
    /// 计算购物车中购物总金额
    /// </summary>
    /// <returns>返回总金额</returns>
    protected decimal TotalPrice()
    {
        decimal sum = 0;
        for (int j = 0; j < Profile.Cart.ProName.Count; j++)
        {
            int qty = (int)Profile.Cart.Qty[j];
            decimal listPrice = (decimal)Profile.Cart.ListPrice[j];
            sum += qty * listPrice;
        }
        return sum;
    }

    /// <summary>
    /// 循环利用FindControl()找到CheckBox控件chkProduct，然后判断其Checked值，若为True，则调用自定义方法DeleteProduct()执行删除操作
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        int productId = 0;
        GridView gvCart = new GridView();
        gvCart = (GridView)Page.Master.FindControl("ContentPlaceHolder2").FindControl("gvCart");
        if (gvCart != null)
        {
            for (int i = 0; i < gvCart.Rows.Count; i++)
            {
                CheckBox chkProduct = new CheckBox();
                chkProduct = (CheckBox)gvCart.Rows[i].FindControl("chkProduct");
                if (chkProduct != null)
                {
                    if (chkProduct.Checked)
                    {
                        productId = int.Parse(gvCart.Rows[i].Cells[1].Text);
                        DeleteProduct(productId);  //调用自定义方法DeleteProduct()删除购物车中指定商品编号的商品
                    }
                }
            }
        }
        Bind();  //调用自定义方法Bind()显示购物车中商品
    }

    /// <summary>
    /// 在购物车Profile.Cart中删除指定商品编号的购物记录
    /// </summary>
    /// <param name="productId">指定的商品编号</param>
    protected void DeleteProduct(int productId)
    {
        //循环查找与id相匹配商品对应的数组列表下标,并存储到变量j
        int j = 0;
        for (int i = 0; i < Profile.Cart.ProName.Count; i++)
        {
            if (productId == (int)Profile.Cart.ProId[i])
            {
                j = i;
                break;
            }
        }
        //移除指定下标的数组元素
        Profile.Cart.ListPrice.RemoveAt(j);
        Profile.Cart.ProId.RemoveAt(j);
        Profile.Cart.ProName.RemoveAt(j);
        Profile.Cart.Qty.RemoveAt(j);
        Profile.Save();
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        //调用各数组列表对象的Clear()方法清除数组列表内容
        Profile.Cart.Qty.Clear();
        Profile.Cart.ProName.Clear();
        Profile.Cart.ProId.Clear();
        Profile.Cart.ListPrice.Clear();
        Profile.Save();
        Response.Redirect("Default.aspx", true);
    }

    protected void btnComputeAgain_Click(object sender, EventArgs e)
    {
        lblError.Text = "";
        //循环利用FindControl()找到TextBox控件txtQty，然后判断是否为空值，若非空，则在Product表中查找txtQty所在行商品编号确定的商品，从而比较txtQty中的输入值和商品的库存量
        GridView gvCart = new GridView();
        gvCart = (GridView)Page.Master.FindControl("ContentPlaceHolder2").FindControl("gvCart");
        if (gvCart != null)
        {
            for (int i = 0; i < gvCart.Rows.Count; i++)
            {
                TextBox txtQty = new TextBox();
                txtQty = (TextBox)gvCart.Rows[i].FindControl("txtQty");
                if (txtQty != null)
                {
                    var product = (from p in dataconn.Product
                                   where p.ProductId == int.Parse(gvCart.Rows[i].Cells[1].Text)
                                   select p).First();

                    if (int.Parse(txtQty.Text) > product.Qty)  //库存不足
                    {
                        lblError.Text += "Error：库存不足，商品名为 " + gvCart.Rows[i].Cells[2].Text + " 的库存数量为 " + product.Qty.ToString() + "<br />";
                    }
                    else
                    {
                        ChangeQty(int.Parse(gvCart.Rows[i].Cells[1].Text), int.Parse(txtQty.Text));  //调用自定义方法ChangeQty()改变存储在Profile中的购买数量
                    }
                }

            }
        }
        Bind();  //调用自定义方法Bind()显示购物车中商品
    }

    /// <summary>
    /// 根据指定的商品编号，修改Profile中对应商品的库存量
    /// </summary>
    /// <param name="productId">指定的商品编号</param>
    /// <param name="qty">Profile中对应商品的库存量</param>
    protected void ChangeQty(int productId, int qty)
    {
        for (int i = 0; i < Profile.Cart.ProName.Count; i++)
        {
            if (productId == (int)Profile.Cart.ProId[i])
            {
                Profile.Cart.Qty[i] = qty;
                Profile.Save();
            }
        }
    }

    protected void btnSettle_Click(object sender, EventArgs e)
    {
        //如果不为匿名访问，则转到订单地址提交页面，否则转到登录页面
        if (User.Identity.IsAuthenticated)
        {
            Response.Redirect("SubmitCart.aspx", true);
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }
}
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
using System.IO;

public partial class Admin_ProductMaster : System.Web.UI.Page
{
    DataConn dataconn = new DataConn();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind();  //调用自定义方法Bind()
        }
    }

    /// <summary>
    /// 显示Product表数据
    /// </summary>
    protected void Bind()
    {
        var products = from c in dataconn.Product
                       select c;
        if (products.Count() == 0)
        {
            pnlProduct.Visible = false;
            lblProErr.Text = "数据库无产品，请添加！";
        }
        else
        {
            pnlProduct.Visible = true;
            lblProErr.Text = "";
        }
        gvProduct.DataSource = products;
        gvProduct.DataBind();
    }


    protected void gvProduct_PageIndexChanging(Object sender, GridViewPageEventArgs e)
    {
        gvProduct.PageIndex = e.NewPageIndex;
        Bind();  //调用自定义方法Bind()
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        int productId = 0;
        GridView gvProduct = new GridView();
        gvProduct = (GridView)Page.Master.FindControl("ContentPlaceHolder2").FindControl("gvProduct");
        if (gvProduct != null)
        {
            for (int i = 0; i < gvProduct.Rows.Count; i++)
            {
                CheckBox chkChoice = new CheckBox();
                chkChoice = (CheckBox)gvProduct.Rows[i].FindControl("chkChoice");
                if (chkChoice != null)
                {
                    if (chkChoice.Checked)
                    {
                        productId = int.Parse(gvProduct.Rows[i].Cells[1].Text);
                        DeletePro(productId);  //调用自定义方法DeletePro()
                    }
                }

            }
        }
        Bind();  //调用自定义方法Bind()
    }

    /// <summary>
    /// 删除指定产品编号的产品信息
    /// </summary>
    /// <param name="productId">指定的产品编号</param>
    protected void DeletePro(int productId)
    {
        var product = (from c in dataconn.Product
                       where c.ProductId == productId
                       select c).First();
        string filePath = Server.MapPath("~") + product.Image.Substring(1);
        if (File.Exists(filePath))
        {
            File.Delete(filePath);
        }
        dataconn.Product.DeleteOnSubmit(product);
        dataconn.SubmitChanges();
    }
}
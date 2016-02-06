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
public partial class ProShow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.Count == 0)
        {
            Response.Redirect("Default.aspx", true);
        }
        else
        {
            Bind();  //调用自定义方法Bind()
        }
    }

    /// <summary>
    /// 根据从NewProduct.ascx、Category.ascx、PetTree.ascx传递过来的ProductId或CategoryId值，显示与ProductId值相等的单个商品信息，或者显示CategoryId确定的分类中所有的商品信息
    /// </summary>
    protected void Bind()
    {
        DataConn dataconn = new DataConn();
        
        if (Request.QueryString["ProductId"] != null)
        {
            int productId = int.Parse(Request.QueryString["ProductId"]);
            var products = from p in dataconn.Product
                           where p.ProductId == productId
                           select p;
            gvProduct.DataSource = products;
            gvProduct.DataBind();
        }
        if (Request.QueryString["CategoryId"] != null)
        {
            int categoryId = int.Parse(Request.QueryString["CategoryId"]);
            var products = from p in dataconn.Product
                           where p.CategoryId == categoryId
                           select p;
            gvProduct.DataSource = products;
            gvProduct.DataBind();
        }
    }

    protected void gvProduct_PageIndexChanging(Object sender, GridViewPageEventArgs e)
    {
        gvProduct.PageIndex = e.NewPageIndex;
        Bind();  //调用自定义方法Bind()
    }    
}

using System;
using System.Linq;
using System.Web.UI.WebControls;
using System.Data.Linq.SqlClient;
using MyPetShop;

public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind();  //调用自定义方法Bind()
        }
    }

    /// <summary>
    /// 根据从MasterPage.master传递过来的SearchText值，模糊查询与SearchText值匹配的所有商品信息并显示
    /// </summary>
    protected void Bind()
    {
        if (Request.QueryString["SearchText"] != null)
        {
            string strSearchText = Request.QueryString["SearchText"].ToString();
            DataConn dataconn = new DataConn();
            var products = from p in dataconn.Product
                           where SqlMethods.Like(p.Name, "%" + strSearchText.Trim() + "%")
                           select p;
            gvProduct.DataSource = products;
            gvProduct.DataBind();
        }
        else
        {
            lblError.Text = "无搜索结果！";
        }
    }

    protected void gvProduct_PageIndexChanging(Object sender, GridViewPageEventArgs e)
    {
        gvProduct.PageIndex = e.NewPageIndex;
        Bind();  //调用自定义方法Bind()
    }
}

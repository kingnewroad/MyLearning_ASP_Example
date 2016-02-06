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

public partial class Bodyuc2 : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataConn dataconn = new DataConn();
        //查询分类号、分类名、该分类包含的商品数
        var results = from c in dataconn.Category
                      join p in dataconn.Product on c.CategoryId equals p.CategoryId
                      into product
                      select new
                      {
                          c.CategoryId,
                          c.Name,
                          ProductCount = product.Count()
                      };
        GridView1.DataSource = results;
        GridView1.DataBind();
    }
}

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
using System.Data.Linq.SqlClient;
using MyPetShop;

public partial class UserControl_NewProduct : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataConn dataconn = new DataConn();
        var products = (from c in dataconn.Product
                        orderby c.ProductId descending
                        select c).Take(7);
        gvProduct.DataSource = products;
        gvProduct.DataBind();
    }
}

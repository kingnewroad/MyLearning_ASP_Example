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

public partial class Admin_SupplierMaster : System.Web.UI.Page
{
    protected void DetailsView1_ItemDeleting(Object sender, DetailsViewDeleteEventArgs e)
    {
        DataConn dataconn = new DataConn();
        var productCount = (from c in dataconn.Product
                            where c.SuppId == int.Parse(DetailsView1.DataKey.Value.ToString())
                            select c).Count();
        if (productCount != 0)
        {
            lblError.Text = "Error：该分类下有产品，请先删除产品！";
            e.Cancel = true;
        }
    }
}

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

public partial class Admin_AddPro : System.Web.UI.Page
{
    DataConn dataconn = new DataConn();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (IsExitCS())  //调用自定义方法IsExitCS()
            {
                Panel1.Visible = false;
                lblMsg.Text = "请先添加分类和提供商！";
            }
            else
            {
                Panel1.Visible = true;
                lblMsg.Text = "";
                Bind();  //调用自定义方法Bind()
            }

        }
    }

    /// <summary>
    /// IsExitCS()方法判断Category和Supplier表中是否已有数据
    /// </summary>
    /// <returns>返回值true表示Category或Supplier表中无数据；返回值false表示Category和Supplier表中都有数据</returns>
    protected bool IsExitCS()
    {
        var categories = from c in dataconn.Category
                         select c;
        var suppliers = from c in dataconn.Supplier
                        select c;
        if (categories.Count() == 0 || suppliers.Count() == 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    /// <summary>
    /// Bind()用于填充“商品分类”下拉列表和“提供商”下拉列表的值
    /// </summary>
    protected void Bind()
    {
        var categories = from c in dataconn.Category
                         select c;
        foreach (var category in categories)
        {
            ddlCategoryId.Items.Add(new ListItem(category.Name, category.CategoryId.ToString()));
        }

        var suppliers = from c in dataconn.Supplier
                        select c;
        foreach (var supplier in suppliers)
        {
            ddlSuppId.Items.Add(new ListItem(supplier.Name, supplier.SuppId.ToString()));
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (IsExitProduct(txtName.Text.Trim()))  //输入的商品名已存在
        {
            lblNameErr.Text = "商品已经存在";
        }
        else  //添加商品到Product表
        {
            Product product = new Product();
            string fileName;
            string fileFolder;
            string dateTime = "";
            fileName = Path.GetFileName(fupImage.PostedFile.FileName);
            dateTime += DateTime.Now.Year.ToString();
            dateTime += DateTime.Now.Month.ToString();
            dateTime += DateTime.Now.Day.ToString();
            dateTime += DateTime.Now.Hour.ToString();
            dateTime += DateTime.Now.Minute.ToString();
            dateTime += DateTime.Now.Second.ToString();
            fileName = dateTime + fileName;
            fileFolder = Server.MapPath("~/") + "Prod_Images\\" + ddlCategoryId.SelectedItem.Text + "\\";
            fileFolder = fileFolder + fileName;
            fupImage.PostedFile.SaveAs(fileFolder);

            product.Image = "~\\Prod_Images\\" + ddlCategoryId.SelectedItem.Text + "\\" + fileName;
            product.Name = txtName.Text.Trim();
            product.CategoryId = int.Parse(ddlCategoryId.SelectedValue);
            product.SuppId = int.Parse(ddlSuppId.SelectedValue);
            product.ListPrice = decimal.Parse(txtListPrice.Text.Trim());
            product.UnitCost = decimal.Parse(txtUnitCost.Text.Trim());
            product.Descn = txtDescn.Text.Trim();
            product.Qty = int.Parse(txtQty.Text.Trim());

            dataconn.Product.InsertOnSubmit(product);
            dataconn.SubmitChanges();
            Response.Redirect("ProductMaster.aspx", true);
        }
    }

    /// <summary>
    /// IsExitProduct()判断是否存在指定的商品
    /// </summary>
    /// <param name="name">指定的商品名</param>
    /// <returns>返回值true表示Product表中存在指定的商品；返回值false表示Product表中不存在指定的商品</returns>
    protected bool IsExitProduct(string name)
    {
        var products = from c in dataconn.Product
                       where c.Name == name
                       select c;
        if (products.Count() != 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}

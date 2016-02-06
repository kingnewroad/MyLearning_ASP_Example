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

public partial class MasterPage : System.Web.UI.MasterPage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        Initialize();  //调用自定义方法Initialize()
    }

    /// <summary>
    /// 网站初始化，添加两个角色（Member和Admin）到数据库ASPNETDB中
    /// </summary>
    protected void Initialize()
    {
        if (Roles.GetAllRoles().Length == 0)
        {
            Roles.CreateRole("Member");
            Roles.CreateRole("Admin");
        }
    }

    protected void lnkbtnReset_Click(object sender, EventArgs e)
    {
        //得到页面上的WebPartManager控件，并重置其个性化属性
        WebPartManager webPartManager = new WebPartManager();
        webPartManager = WebPartManager.GetCurrentWebPartManager(Page);
        webPartManager.Personalization.ResetPersonalizationState();
    }

    protected void imgbtnSearch_Click(object sender, ImageClickEventArgs e)
    {
        //如果搜索框不为空，以Get形式传递搜索文本到Search.aspx
        string strQuery = "";
        if (txtSearch.Text.Trim() == "")
        {
            strQuery = "";
        }
        else
        {
            strQuery = "?SearchText=" + txtSearch.Text.Trim();
        }
        Response.Redirect("~/Search.aspx" + strQuery, true);
    }
}
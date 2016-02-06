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

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //设置个性重置按钮可用
        LinkButton lnkbtnReset = new LinkButton();
        lnkbtnReset = (LinkButton)Page.Master.FindControl("lnkbtnReset");
        if (User.Identity.IsAuthenticated)
        {
            lnkbtnReset.Enabled = true;
        }
    }
}

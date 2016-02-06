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

public partial class NewUser : System.Web.UI.Page
{
    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        //将注册的用户添加到"Member"角色
        Roles.AddUserToRole(CreateUserWizard1.UserName, "Member");
    }
}

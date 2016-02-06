using System.Web.Services;

/// <summary>
/// OverloadService 的摘要说明
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
//[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[WebServiceBinding(ConformsTo = WsiProfiles.None)]
// 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消对下行的注释。
// [System.Web.Script.Services.ScriptService]
public class OverloadService : System.Web.Services.WebService
{

    [WebMethod(MessageName = "HelloWorld")]
    public string HelloWorld()
    {
        return "Hello World";
    }
    [WebMethod(MessageName = "HelloWorldbyName")]
    public string HelloWorld(string userName)
    {
        return "Hello World! " + userName;
    }
}


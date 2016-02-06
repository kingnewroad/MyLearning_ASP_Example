using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using System.Data.Linq.SqlClient;
using MyPetShop;
using System.Collections.Generic;
/// <summary>
///WebService 的摘要说明
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
//若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消对下行的注释。 
[System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService {

    public WebService () {

        //如果使用设计的组件，请取消注释以下行 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string[] GetStrings(string prefixText, int count)
    {
        DataConn dataconn = new DataConn();
        //模糊查找与关连文本框中输入值匹配的商品
        var products = from p in dataconn.Product
                       where SqlMethods.Like(p.Name, prefixText.Trim()+"%")
                       select p;
        //将查找到商品的商品名填充到列表类中
        List<String> list = new List<String>(count);
        foreach (var product in products)
        {
            list.Add(product.Name);            
        }
        return list.ToArray();
    }
    
}


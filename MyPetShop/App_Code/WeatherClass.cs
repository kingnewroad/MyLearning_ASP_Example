using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using cn.com.webxml;
using System.Web.Caching;
/// <summary>
///WeatherClass 的摘要说明
/// </summary>
public class WeatherClass
{
    public static DataSet getSupportDataSet()
    {
        DataSet ds = (DataSet)HttpContext.Current.Cache["dataSetCache"];//从高速缓存中读取记录集
        if (ds == null)//若无此缓存
        {
            WeatherWebService Weather = new WeatherWebService();
            ds = Weather.getSupportDataSet();
            HttpContext.Current.Cache.Insert("dataSetCache", ds, null, DateTime.Now.AddMinutes(30), TimeSpan.Zero, System.Web.Caching.CacheItemPriority.High, null);//设置缓存
        }
        return ds;
    }
    public static string[] GetCityWeather(string cityCode)
    {
        string cacheName = "Weather" + cityCode.Trim();
        string[] WeatherArray = (string[])HttpContext.Current.Cache[cacheName];
        if (WeatherArray == null)
        {
            WeatherWebService weather = new WeatherWebService();
            WeatherArray = weather.getWeatherbyCityName(cityCode.Trim());
            HttpContext.Current.Cache.Insert(cacheName, WeatherArray, null, DateTime.Now.AddMinutes(30), TimeSpan.Zero, System.Web.Caching.CacheItemPriority.High, null);
        }
        return WeatherArray;
    }
}

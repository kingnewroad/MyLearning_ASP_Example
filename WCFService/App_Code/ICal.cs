using System.ServiceModel;

// 注意: 如果更改此处的接口名称 "ICal"，
//也必须更新 Web.config 中对 "ICal" 的引用。
[ServiceContract]
public interface ICal
{
    [OperationContract]
    int Add(int a, int b);
    [OperationContract]
    int Subtract(int a, int b);
}

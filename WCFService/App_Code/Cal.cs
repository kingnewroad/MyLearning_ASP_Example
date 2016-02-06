// 注意: 如果更改此处的类名 "Cal"，
//也必须更新 Web.config 中对 "Cal" 的引用。
public class Cal : ICal
{
    public int Add(int a, int b)
    {
        return (a + b);
    }
    public int Subtract(int a, int b)
    {
        return (a - b);
    }
}

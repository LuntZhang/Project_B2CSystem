using System;

namespace B2CSystem
{
    public class CommonClass
    {
        /// <summary>
        /// 说明：MessageBox用来在客户端弹出对话框，
        ///       关闭对话框返回指定页
        /// </summary>
        /// <param name="TxtMessage">对话框中显示的内容</param>
        /// <param name="Url">对话框关闭后，跳转的页</param>
        /// <returns></returns>
        public string MessageBox(string TxtMessage, string Url)
        {
            string str;
            str = "<script language = javascript>" +
                  "alert('" + TxtMessage + "');" +
                  "location = '" + Url + "';" +
                  "</script>";
            return str;
        }

        /// <summary>
        /// 说明：MessageBoxPage用来在客户端弹出对话框，
        ///       提示用户执行某种操作或已完成了某种操作，
        ///       并刷新页面。
        /// </summary>
        /// <param name="TxtMessage">对话框中显示的内容</param>
        /// <returns></returns>
        public string MessageBoxPage(string TxtMessage)
        {
            string str;
            str = "<script language=javascript>" +
                  "alert('" + TxtMessage + "');" +
                  "</script>";
            return str;
        }

        /// <summary>
        /// 实现随机4位验证码
        /// </summary>
        /// <param name="n">验证码个数</param>
        /// <returns>返回生成的随机数</returns>
        public string RandomNum(int n)
        {
            // 定义一个包括数字、大写字母和小写字母的字符串。
            string strchar = "0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z";
            // 将strchar字符串转为数组
            string[] VcArray = strchar.Split(',');
            string VNum = "";
            // 记录上次随机数值，尽量避免产生几个一样的随机数
            int temp = -1;
            // 采用一个简单的算法以保证生成的随机数不同
            Random rand = new Random();
            for (int i = 1; i < n + 1; i++)
            {
                if (temp != -1)
                {
                    //unchecked 关键字用于取消整型算术运算和转换的溢出检查。
                    //DateTime.Ticks 属性获取表示此实例的日期和时间的刻度数。
                    rand = new Random(i * temp * unchecked((int)DateTime.Now.Ticks));
                }
                //Random对象的Next方法返回一个小于所指定最大值的非负随机数
                int t = rand.Next(61);
                if (temp != -1 && temp == 1)
                {
                    return RandomNum(n);
                }
                temp = t;
                VNum += VcArray[t];
            }
            return VNum;
        }

        /// <summary>
        /// 用来截取小数点后nleng位
        /// </summary>
        /// <param name="sString">sString原字符串。</param>
        /// <param name="nLeng">nLeng长度。</param>
        /// <returns>处理后的字符串。</returns>
        public string VarStr(string sString, int nLeng)
        {
            int index = sString.IndexOf(".");
            if (index == -1 || index + nLeng >= sString.Length)
                return sString;
            else
                return sString.Substring(0, (index + nLeng + 1));
        }
    }
}
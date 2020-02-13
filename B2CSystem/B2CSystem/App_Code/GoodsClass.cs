using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;


public class GoodsClass
{
    DBClass dBObj = new DBClass();

    /// <summary>
    /// 对DataList控件进行绑定
    /// </summary>
    /// <param name="dlName">控件名</param>
    /// <param name="dataTable">dataTable集合</param>
    public void dlBind(DataList dlName, DataTable dataTable)
    {
        if (dataTable != null)
        {
            dlName.DataSource = dataTable.DefaultView;
            dlName.DataKeyField = dataTable.Columns[0].ToString();
            dlName.DataBind();
        }
    }

    internal void DLDelayGI(object , object lb, string v)
    {
        throw new NotImplementedException();
    }

    /// <summary>
    /// 商品类别菜单栏
    /// </summary>
    /// <param name="dlName">绑定商品类别名的DataList控件</param>
    public void DLClassBind(DataList dlName)
    {
        string sqlStr = "select Top 10 * from tb_Class";
        DataTable dataTable = dBObj.GetDataSetStr(sqlStr, "tbClass");
        dlBind(dlName, dataTable);
    }
    /// <summary>
    /// 商品类别菜单栏
    /// </summary>
    /// <param name="dlName">绑定商品类别名的DataList控件</param>
    public DataTable DLClassBind()
    {
        string sqlStr = "select Top 10 * from tb_Class";
        DataTable dataTable = dBObj.GetDataSetStr(sqlStr, "tbClass");
        return dataTable;
    }

    /// <summary>
    /// 在首页中，绑定商品信息
    /// </summary>
    /// <param name="IntDeply">商品分类标志</param>
    /// <param name="dlName">绑定商品的DataList控件</param>
    /// <param name="TableName">数据集标志</param>
    public void DLDelayGI(int IntDeply, DataList dlName, string TableName)
    {
        SqlCommand myCmd = dBObj.GetCommandProc("proc_DeplayGI");
        // 添加参数
        SqlParameter Deplay = new SqlParameter("@Deplay", SqlDbType.Int, 4);
        Deplay.Value = IntDeply;
        myCmd.Parameters.Add(Deplay);
        dBObj.ExecNonQuery(myCmd);
        DataTable dataTable = dBObj.GetDataSet(myCmd, TableName);
        dlBind(dlName, dataTable);
    }
    /// <summary>
    /// 最新商品菜单栏
    /// </summary>
    /// <param name="dlName">绑定最新商品的DataList控件</param>
    public void DLNewGoods(DataList dlName)
    {
        SqlCommand myCmd = dBObj.GetCommandProc("proc_NewGoods");
        dBObj.ExecNonQuery(myCmd);
        DataTable dsTable = dBObj.GetDataSet(myCmd, "tbGoods");
        dlBind(dlName, dsTable);
    }
    /// <summary>
    /// 获取商品类别名
    /// </summary>
    /// <param name="IntClassID">商品类别号</param>
    /// <returns>返回商品类别名</returns>
    public string GetClass(int IntClassID)
    {
        SqlCommand myCmd = dBObj.GetCommandProc("proc_GCN");
        //添加参数
        SqlParameter classID = new SqlParameter("@ClassID", SqlDbType.Int, 4);
        classID.Value = IntClassID;
        myCmd.Parameters.Add(classID);
        return dBObj.ExecScalar(myCmd).ToString();
    }
    /// <summary>
    /// 对商品信息进行模糊查询
    /// </summary>
    /// <param name="strKeyWord">关键信息</param>
    /// <returns>返回查询结果数据表DataTable</returns>
    public DataTable search(string strKeyWord)
    {
        SqlCommand myCmd = dBObj.GetCommandProc("proc_SearchGI");
        SqlParameter key = new SqlParameter("@keywords", SqlDbType.VarChar, 50);//添加参数
        key.Value = strKeyWord;
        myCmd.Parameters.Add(key);
        //执行操作
        dBObj.ExecNonQuery(myCmd);
        DataTable dsTable = dBObj.GetDataSet(myCmd, "tbBI");
        return dsTable;
    }
}
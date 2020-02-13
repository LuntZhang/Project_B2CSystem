using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


/// <summary>
/// 用于管理在项目中对数据库的各种操作
/// </summary>
public class DBClass
{
    /// <summary>
    /// 连接数据库
    /// </summary>
    /// <returns>返回SqlConnection对象</returns>
    public SqlConnection GetConnection()
    {
        // 定义一个连接数据库中的字符串
        string myStr = ConfigurationManager.AppSettings["ConnectionString"].ToString();
        // 创建一个新的数据库连接对象
        SqlConnection myConn = new SqlConnection(myStr);
        return myConn;
    }

    /// <summary>
    /// 执行SQL语句，并返回受影响行数。
    /// 当用户对数据库进行增删改查操作时，调用该方法。
    /// </summary>
    /// <param name="myCmd"></param>
    public void ExecNonQuery(SqlCommand myCmd)
    {
        try
        {
            if (myCmd.Connection.State != ConnectionState.Open)
            {
                myCmd.Connection.Open();
            }
            // 执行sql语句
            myCmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            // 抛出一个异常
            throw new Exception(ex.Message, ex);
        }
        finally
        {
            if (myCmd.Connection.State == ConnectionState.Open)
            {
                myCmd.Connection.Close();
            }
        }
    }

    /// <summary>
    /// 执行查询，返回查询所返回的结果集中第一行的第一列。
    /// </summary>
    /// <param name="myCmd"></param>
    /// <returns></returns>
    public string ExecScalar(SqlCommand myCmd)
    {
        string strSql;
        try
        {
            if (myCmd.Connection.State != ConnectionState.Open)
            {
                myCmd.Connection.Open();
            }
            strSql = Convert.ToString(myCmd.ExecuteScalar());
            return strSql;
        }
        catch (Exception ex)
        {
            // 抛出一个异常
            throw new Exception(ex.Message, ex);
        }
        finally
        {
            if (myCmd.Connection.State == ConnectionState.Open)
            {
                myCmd.Connection.Close();
            }
        }
    }

    /// <summary>
    /// 返回数据集的表的集合
    /// </summary>
    /// <param name="myCmd">SqlCommand对象</param>
    /// <param name="TableName">数据表名称</param>
    /// <returns>数据源的数据表</returns>
    public DataTable GetDataSet(SqlCommand myCmd, string TableName)
    {
        SqlDataAdapter adapt;
        DataSet ds = new DataSet();
        try
        {
            if (myCmd.Connection.State != ConnectionState.Open)
            {
                myCmd.Connection.Open();
            }
            adapt = new SqlDataAdapter(myCmd);
            adapt.Fill(ds, TableName);
            return ds.Tables[TableName];
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message, ex);
        }
        finally
        {
            if (myCmd.Connection.State == ConnectionState.Open)
            {
                myCmd.Connection.Close();
            }
        }
    }
    /// <summary>
    /// 执行存储过程语句
    /// </summary>
    /// <param name="strProcName">存储过程名</param>
    /// <returns>返回sqlCommand类对象</returns>
    public SqlCommand GetCommandProc(string strProcName)
    {
        SqlConnection myConn = GetConnection();
        SqlCommand myCmd = new SqlCommand();
        myCmd.Connection = myConn;
        myCmd.CommandText = strProcName;
        myCmd.CommandType = CommandType.StoredProcedure;
        return myCmd;
    }

    /// <summary>
    /// 执行查询语句
    /// </summary>
    /// <param name="strSql">查询语句</param>
    /// <returns>返回sqlCommand类对象</returns>
    public SqlCommand GetCommandStr(string strSql)
    {
        SqlConnection myConn = GetConnection();
        SqlCommand myCmd = new SqlCommand();
        myCmd.Connection = myConn;
        myCmd.CommandText = strSql;
        myCmd.CommandType = CommandType.Text;
        return myCmd;
    }

    /// <summary>
    /// 执行SQL语句
    /// </summary>
    /// <param name="sqlStr">执行的SQL语句</param>
    /// <param name="TableName">数据表名</param>
    /// <returns>数据源的数据表DataTable</returns>
    public DataTable GetDataSetStr(string sqlStr, string TableName)
    {
        SqlConnection myConn = GetConnection();
        myConn.Open();
        DataSet ds = new DataSet();
        SqlDataAdapter adapt = new SqlDataAdapter(sqlStr, myConn);
        adapt.Fill(ds, TableName);
        myConn.Close();
        return ds.Tables[TableName];
    }

}

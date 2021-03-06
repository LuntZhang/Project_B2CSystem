﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace B2CSystem
{
    public partial class Default : System.Web.UI.Page
    {
        CommonClass ccObj = new CommonClass();
        GoodsClass gcObj = new GoodsClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                HotBind();
                DiscountBind();
            }
        }

        /// <summary>
        /// 绑定热门商品
        /// </summary>
        protected void HotBind()
        {
            gcObj.DLDeplayGI(3, this.dlHot, "Hot");
        }
        /// <summary>
        /// 绑定最新商品
        /// </summary>
        protected void DiscountBind()
        {
            gcObj.DLDeplayGI(2, this.dlDiscount, "Dissount");
        }

        protected void dlDiscount_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "detailSee")
            {
                AddressBack(e);
            }
            else if (e.CommandName == "buy")
            {
                AddShopCart(e);
            }
        }

        /// <summary>
        /// 向购物车中添加新商品
        /// </summary>
        /// <param name="e"></param>
        private void AddShopCart(DataListCommandEventArgs e)
        {
            Hashtable hashCar;
            if (Session["ShopCart"] == null)
            {
                // 如果用户没有分配购物车
                hashCar = new Hashtable();
                hashCar.Add(e.CommandArgument, 1); // 添加一个商品
                Session["ShopCart"] = hashCar;
            }
            else
            {
                // 用户已经有购物车
                hashCar = (Hashtable)Session["ShopCart"];
                if (hashCar.Contains(e.CommandArgument) == true)
                {
                    // 得到商品数量
                    int count = Convert.ToInt32(hashCar[e.CommandArgument].ToString());
                    hashCar[e.CommandArgument] = count + 1;
                }
                else
                {
                    hashCar.Add(e.CommandArgument, 1); // 没有就添加一个商品
                }
            }

        }
        /// <summary>
        /// 跳转到商品详情页面
        /// </summary>
        /// <param name="e"></param>
        private void AddressBack(DataListCommandEventArgs e)
        {
            Session["address"] = "";
            Session["address"] = "Default.aspx";
            Response.Redirect("~/showInfo.aspx?id=" + Convert.ToInt32(e.CommandArgument.ToString()));
        }

        protected void dlHot_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "detailSee")
            {
                AddressBack(e);
            }
            else if (e.CommandName == "buy")
            {
                AddShopCart(e);
            }
        }

        //绑定市场价格
        public string GetVarMKP(string strMarketPrice)
        {
            return ccObj.VarStr(strMarketPrice, 2);
        }
        //绑定热卖价格
        public string GetVarHot(string strHotPrice)
        {
            return ccObj.VarStr(strHotPrice, 2);
        }

    }
}
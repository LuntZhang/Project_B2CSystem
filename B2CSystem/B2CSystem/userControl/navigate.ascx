<%@ Control Language="C#" AutoEventWireup="true" CodeFile="navigate.ascx.cs" Inherits="userControl_navigate" %>

<h3>商品分类列表</h3>
<ul class="custom-body-main-content-left-menu">
    <%if (drc != null)
        {
            foreach (System.Data.DataRow dr in drc)
            {
    %>
                <li><a href="<%=dr["CategoryUrl"]%>"><%=dr["ClassName"] %></a></li>
    <%
            }
        }
    %>
</ul>
<h3>本站公告</h3>
<div class="custom-body-main-content-left-marquee">
    <marquee direction="up" onmouseout="this.start()" onmouseover="this.stop()" scrollAmount="2" scrollDelay="4" style="width: 130px;height: 128px; font-size: 9pt; font-family: 宋体; vertical-align :top ;  text-align :center; " >本电子商城欢迎您的光临！我们将为您展示各种最新商品，让您的生活更加丰富，购物更加愉快！如果你有什么所需要的，请给本网站留言！</marquee>
</div>
<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LoadingControl.ascx.cs" Inherits="LoadingControl" %>        
<%if (Session["UserID"] == null) {%>
<div class="row custom-header-login-content" style="margin-top:15px;">
    <div class="col-xs-6 col-sm-6 custom-header-login-content-one">
        会员名：<asp:TextBox ID="txtName" runat="server" Width="230"></asp:TextBox>
    </div>
    <div class="col-xs-6 col-sm-6">
        验证码：<asp:TextBox ID="txtValid" runat="server" Width="80"></asp:TextBox>
                <asp:Label ID="labValid" runat="server" Text="8888" BackColor="#F7CC42" Font-Names="幼圆" ></asp:Label>
    </div>
</div>
<div class="row custom-header-login-content">    
    <div class="col-xs-6 col-sm-6 custom-header-login-content custom-header-login-content-one">
        密&nbsp;&nbsp;&nbsp;码：<asp:TextBox ID="txtPassword" runat="server"  TextMode="Password" Width="230"></asp:TextBox>
    </div>    
    <div class="col-xs-6 col-sm-6">
        <asp:Button ID="btnLoad" runat="server" OnClick="btnLoad_Click" CausesValidation="False" Text="登录" Width="80"></asp:Button>
        <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" CausesValidation="False" Text="注册" Width="80"></asp:Button>
    </div>
</div>
<%}else { %>
<div class="row custom-header-login-content" style="margin-top:20px;">
    <div class="col-xs-6 col-sm-6 text-right">
         欢迎顾客<u><%=Session["UserName"]%></u>光临！
    </div>
    <div class="col-xs-6 col-sm-6">
        <asp:HyperLink ID="hpLinkUser" runat="server" NavigateUrl="~/UpdateMember.aspx">更新信息</asp:HyperLink>
        <asp:LinkButton ID="lnkbtnOut" runat="server" OnClick="lnkbtnOut_Click" CausesValidation="False">安全退出</asp:LinkButton>
    </div>
</div>
<%} %>        
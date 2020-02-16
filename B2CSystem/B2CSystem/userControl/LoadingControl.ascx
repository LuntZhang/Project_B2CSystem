<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LoadingControl.ascx.cs" Inherits="LoadingControl" %>        
<%if (Session["UserID"] == null) {%>
<div class="row custom-header-login-content" style="margin-top:15px;">
    <div class="col-xs-6 col-sm-6 custom-header-login-content-one">
        ��Ա����<asp:TextBox ID="txtName" runat="server" Width="230"></asp:TextBox>
    </div>
    <div class="col-xs-6 col-sm-6">
        ��֤�룺<asp:TextBox ID="txtValid" runat="server" Width="80"></asp:TextBox>
                <asp:Label ID="labValid" runat="server" Text="8888" BackColor="#F7CC42" Font-Names="��Բ" ></asp:Label>
    </div>
</div>
<div class="row custom-header-login-content">    
    <div class="col-xs-6 col-sm-6 custom-header-login-content custom-header-login-content-one">
        ��&nbsp;&nbsp;&nbsp;�룺<asp:TextBox ID="txtPassword" runat="server"  TextMode="Password" Width="230"></asp:TextBox>
    </div>    
    <div class="col-xs-6 col-sm-6">
        <asp:Button ID="btnLoad" runat="server" OnClick="btnLoad_Click" CausesValidation="False" Text="��¼" Width="80"></asp:Button>
        <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" CausesValidation="False" Text="ע��" Width="80"></asp:Button>
    </div>
</div>
<%}else { %>
<div class="row custom-header-login-content" style="margin-top:20px;">
    <div class="col-xs-6 col-sm-6 text-right">
         ��ӭ�˿�<u><%=Session["UserName"]%></u>���٣�
    </div>
    <div class="col-xs-6 col-sm-6">
        <asp:HyperLink ID="hpLinkUser" runat="server" NavigateUrl="~/UpdateMember.aspx">������Ϣ</asp:HyperLink>
        <asp:LinkButton ID="lnkbtnOut" runat="server" OnClick="lnkbtnOut_Click" CausesValidation="False">��ȫ�˳�</asp:LinkButton>
    </div>
</div>
<%} %>        
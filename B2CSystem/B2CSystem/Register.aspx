<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="B2CSystem.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder1" runat="server">
    <style type="text/css">
        .custom-procuct-show {
            margin-top: 10px;
        }

        .custom-btn {
            display: table-cell;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 custom-body-main-content-list">
            <h4><a>会员注册</a></h4>
            <div class="row custom-procuct-show">
                <div class="col-xs-2 col-sm-2 col-md-2">
                    用户名：
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <asp:textbox id="txtName" runat="server" MaxLength="50" CssClass="form-control"></asp:textbox>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <font color="red">
                        *<asp:RequiredFieldValidator ID="rfvLoginName" runat="server" ControlToValidate="txtName" Font-Size="9pt" Height="1px">请输入用户名</asp:RequiredFieldValidator>
                    </font>
                </div>
            </div>
            <div class="row custom-procuct-show">
                <div class="col-xs-2 col-sm-2 col-md-2">
                    密码：
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <asp:textbox id="txtPassword" runat="server"  MaxLength="50" TextMode="Password" CssClass="form-control"></asp:textbox>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <font color="red">
                        *<asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" Font-Size="9pt" Height="1px">请输入密码</asp:RequiredFieldValidator>
                    </font>
                </div>
            </div>
            <div class="row custom-procuct-show">
                <div class="col-xs-2 col-sm-2 col-md-2">
                    性别：
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <asp:dropdownlist id="ddlSex" runat="server" CssClass="form-control">
                        <asp:ListItem Selected="True" Value="1">男</asp:ListItem>
                        <asp:ListItem Value="0">女</asp:ListItem>
                    </asp:dropdownlist>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">

                </div>
            </div>
            <div class="row custom-procuct-show">
                <div class="col-xs-2 col-sm-2 col-md-2">
                    真实姓名：
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <asp:textbox id="txtTrueName" runat="server"  MaxLength="50" CssClass="form-control"></asp:textbox>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <font color="red">
                        *<asp:RequiredFieldValidator ID="rfvTrueName" runat="server" ControlToValidate="txtTrueName" Font-Size="9pt" Height="1px">请输入真实姓名</asp:RequiredFieldValidator>
                    </font>
                </div>
            </div>
            <div class="row custom-procuct-show">
                <div class="col-xs-2 col-sm-2 col-md-2">
                    邮编：
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <asp:textbox id="txtPostCode" runat="server"  MaxLength="50" CssClass="form-control"></asp:textbox>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <font color="red">
                        *<asp:RegularExpressionValidator ID="revPostCode" runat="server" ControlToValidate="txtPostCode" Font-Size="9pt" ValidationExpression="\d{6}">您的邮编输入有误</asp:RegularExpressionValidator>
                    </font>
                </div>
            </div>
            <div class="row custom-procuct-show">
                <div class="col-xs-2 col-sm-2 col-md-2">
                    固定电话：
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <asp:textbox id="txtPhone" runat="server"  MaxLength="50" CssClass="form-control"></asp:textbox>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <font color="red">
                        *<asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="您输入的电话号码有误" ValidationExpression="(\(\d{3,4}\)|\d{3,4}-)?\d{7,8}$"></asp:RegularExpressionValidator>
                    </font>
                </div>
            </div>
            <div class="row custom-procuct-show">
                <div class="col-xs-2 col-sm-2 col-md-2">
                    E-mail：
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <asp:textbox id="txtEmail" runat="server"  MaxLength="80" CssClass="form-control"></asp:textbox>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <font color="red">
                        *<asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" Font-Size="9pt" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">您输入的E-mail格式不正确</asp:RegularExpressionValidator>
                    </font>
                </div>
            </div>
            <div class="row custom-procuct-show">
                <div class="col-xs-2 col-sm-2 col-md-2">
                     详细住址：
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <asp:textbox id="txtAddress" runat="server"  MaxLength="100" TextMode="MultiLine" CssClass="form-control"></asp:textbox>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <span style="color: #ff0000">
                        *<asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" Font-Size="9pt">请输入详细住址</asp:RequiredFieldValidator>
                    </span>
                </div>
            </div>
            <div class="row custom-procuct-show">
                <div class="col-xs-6 col-sm-6 col-md-6 text-center">
                    <asp:button id="btnSave" runat="server" Text="添加" OnClick="btnSave_Click" CssClass="form-control custom-btn" Width="80"></asp:button>&nbsp;&nbsp;
                    <asp:Button ID="btnReset" runat="server" CausesValidation="False" Text="重置" OnClick="btnReset_Click" CssClass="form-control custom-btn" Width="80"/>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

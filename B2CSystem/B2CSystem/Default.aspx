<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="B2CSystem._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%--最新商品--%>
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 custom-body-main-content-list">
            <h4><a href="~/goodsList.aspx?id=3&&var=1">最新商品</a></h4>
            <asp:DataList ID="dlDiscount" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="dlDiscount_ItemCommand">
                <ItemTemplate>
                    <table style="height: 120px; margin-left: 50px;">
                        <tr>
                            <td rowspan="5" style="width: 29px">
                                <asp:Image ID="imageDiscount" runat="server" ImageUrl='<%#DataBinder.Eval(Container.DataItem,"BookUrl")%>' />
                            </td>
                            <td colspan="2">
                                <asp:LinkButton ID="lnkbtnDName" runat="server" CommandName="detailSee" Font-Underline="false" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "BookID")%>'>
                                       <%#DataBinder.Eval(Container.DataItem, "BookName")%>
                                </asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td>市场价：</td>
                            <td>
                                <%#GetVarMKP(DataBinder.Eval(Container.DataItem, "MarketPrice").ToString())%>￥
                            </td>
                        </tr>
                        <tr>
                            <td>热卖价：</td>
                            <td>
                                <%#GetVarHot(DataBinder.Eval(Container.DataItem, "HotPrice").ToString())%>￥
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:ImageButton ID="imagebtnDiscount" runat="server" CommandName="buy" ImageUrl="~/images/购买.jpg" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "BookID")%>' />
                            </td>
                        </tr>
                    </table>

                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
    <%--热门商品--%>
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 custom-body-main-content-list">
            <h4><a href="~/goodsList.aspx?id=4&&var=1">热门商品</a></h4>
            <asp:DataList ID="dlHot" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="dlHot_ItemCommand">
                <ItemTemplate>
                    <table style="height: 120px; margin-left: 50px;">
                        <tr>
                            <td rowspan="5" style="width: 29px">
                                <asp:Image ID="imageHot" runat="server" ImageUrl='<%#DataBinder.Eval(Container.DataItem,"BookUrl")%>' />
                            </td>
                            <td colspan="2">
                                <asp:LinkButton ID="lnkbtnHName" runat="server" CommandName="detailSee" Font-Underline="false" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "BookID")%>'>
                            <%#DataBinder.Eval(Container.DataItem, "BookName")%>
                                </asp:LinkButton>
                            </td>

                        </tr>
                        <tr>
                            <td>市场价：</td>
                            <td>
                                <%#GetVarMKP(DataBinder.Eval(Container.DataItem, "MarketPrice").ToString())%>￥
                            </td>
                        </tr>
                        <tr>
                            <td>热卖价：</td>
                            <td>
                                <%#GetVarHot(DataBinder.Eval(Container.DataItem, "HotPrice").ToString())%>￥
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:ImageButton ID="imagebtnHot" runat="server" CommandName="buy" ImageUrl="~/images/购买.jpg" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "BookID")%>' />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>

</asp:Content>

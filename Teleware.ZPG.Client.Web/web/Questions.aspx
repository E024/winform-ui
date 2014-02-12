﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Questions.aspx.cs" Inherits="Teleware.ZPG.Client.Web.web.Questions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>相关资讯查询 </title>
    <link type="text/css" href="css/Index.css" rel="Stylesheet" />
    <style type="text/css">
        .DItem1
        {
            font-size: 12px;
            color: #2969b9;
            line-height: 22px;
            border-right-width: 1px;
            border-bottom-width: 1px;
            border-right-style: solid;
            border-bottom-style: solid;
            border-right-color: #459ffd;
            border-bottom-color: #459ffd;
            font-weight: bold;
            padding-left: 10px;
            background-color: #f2faff;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="divAll">
        <div class="divLogo">
        </div>
        <div class="divMenu">
            <div class="left">
                <ul class="right">
                    <li><a id="http://localhost:7905/Tlw.ZPG.PublicWeb/Index.aspx" href="http://localhost:7905/Tlw.ZPG.PublicWeb/Index.aspx"
                        title="首 页">首 页 </a></li>
                    <li class='line'></li>
                    <li><a id="http://localhost:7905/Tlw.ZPG.PublicWeb/Index.aspx" href="http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/TradeRule.aspx"
                        title="交易规则" target="_blank">交易规则 </a></li>
                    <li class='line'></li>
                    <li><a id="http://localhost:7905/Tlw.ZPG.PublicWeb/Index.aspx" href="http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/TradeFlow.aspx"
                        title="交易流程" target="_blank">交易流程 </a></li>
                    <li class='line'></li>
                    <li><a id="http://localhost:7905/Tlw.ZPG.PublicWeb/Index.aspx" href="http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/ApplyInstruction.aspx"
                        title="竞买申请" target="_blank">竞买申请 </a></li>
                    <li class='line'></li>
                    <li><a id="http://localhost:7905/Tlw.ZPG.PublicWeb/Index.aspx" href="http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/TradeInfoQueryView.aspx"
                        title="出让宗地查询">出让宗地查询 </a></li>
                    <li class='line'></li>
                    <li><a id="http://localhost:7905/Tlw.ZPG.PublicWeb/Index.aspx" href="http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/InfomationQuery.aspx?InfomationBigTypeId=3"
                        title="政策法规资讯">政策法规资讯 </a></li>
                    <li class='line'></li>
                    <li><a id="http://localhost:7905/Tlw.ZPG.PublicWeb/Index.aspx" href="http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/FormatFileDownload.aspx"
                        title="格式文书下载">格式文书下载 </a></li>
                    <li class='line'></li>
                    <li><a id="http://localhost:7905/Tlw.ZPG.PublicWeb/Index.aspx" href="http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/FileDownload.aspx"
                        title="交易软件下载">交易软件下载 </a></li>
                    <li class='line'></li>
                </ul>
                <div style="font-size: 15px; color: #FF0000; font-weight: bold; text-align: center;">
                    竞买端软件升级，请各竞买人重新<a href="http://fjgpjy.fjgtzy.gov.cn/zpgpublicweb/Resource/ClientTool/福建省国有建设用地使用权出让网上交易系统(竞买软件)v1.011.exe"
                        style="font-size: 15px; color: #FF0000; font-weight: bold; text-align: center;
                        text-decoration: underline;">下载安装</a>(如已安装，请先卸载后再安装)。
                </div>
            </div>
        </div>
        <table class="tableInfo">
            <tr>
                <td class="left">
                    <div style="padding-top: 7px">
                        <table width="225px" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <img src="images/Lm_bg.jpg" width="224" height="237" border="0" usemap="#Map" />
                                </td>
                            </tr>
                            <tr>
                                <td height="4px">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="LM" style="vertical-align: middle;">
                                        <table cellpadding="0" cellspacing="0" border="0" width="219px" height="85px" style="vertical-align: middle">
                                            <tr>
                                                <td width="2px">
                                                </td>
                                                <td width="100px" align="right">
                                                    <a href="OnlineQuestion.aspx"><span style="font-size: 14px; position: relative; top: 20px">
                                                        &nbsp;&nbsp;在线留言</span></a>
                                                </td>
                                                <td width="10px">
                                                </td>
                                                <td width="100px" align="right">
                                                    <a href="../Resource/ClientTool/福建省国有建设用地使用权出让网上交易系统(竞买软件).exe"><span style="font-size: 14px;
                                                        position: relative; top: 20px">&nbsp;&nbsp;&nbsp;&nbsp;竞买软件</span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="2px">
                                                </td>
                                                <td width="100px" align="right">
                                                    <a href="InfomationQuery.aspx?InfomationBigTypeId=4"><span style="font-size: 14px;
                                                        position: relative; top: 22px">&nbsp;&nbsp;知识问答</span></a>
                                                </td>
                                                <td width="10px">
                                                </td>
                                                <td width="110px" align="right">
                                                    <a href="InfomationQuery.aspx?InfomationBigTypeId=3"><span style="font-size: 14px;
                                                        position: relative; top: 22px">&nbsp;&nbsp;&nbsp;&nbsp;政策法规</span></a>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td height="8px">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="jmrczbz">
                                        <ul>
                                            <li><a href="../resource/OnlineDemo/OnlineDemoBM/3.htm" target="_blank"><span style="font-size: 14px">
                                                注册演示</span></a></li>
                                            <li><a href="../resource/OnlineDemo/OnlineDemoPM/1.htm" target="_blank"><span style="font-size: 14px">
                                                挂牌交易演示</span></a></li>
                                            <li><a href="../resource/OnlineDemo/OnlineDemoGP/2.htm" target="_blank"><span style="font-size: 14px">
                                                网上拍卖演示</span></a></li>
                                            <li class="wu"><a href="../Resource/ClientTool/竞买软件操作手册.doc" target="_blank"><span
                                                style="font-size: 14px">竞买人操作手册下载</span></a></li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td height="8px">
                                </td>
                            </tr>
                        </table>
                    </div>
                    <map name="Map" id="Map">
                        <area shape="rect" coords="42,12,194,45" href="../PublicSysMsg/TradeAffiche.aspx?AfficheFashionId=53" />
                        <area shape="rect" coords="42,57,194,89" href="../PublicSysMsg/TradeResultListView.aspx" />
                        <area shape="rect" coords="45,101,216,132" href="../PublicSysMsg/TradeResultListView.aspx?ResultId=139" />
                        <area shape="rect" coords="45,148,213,178" href="../PublicSysMsg/UserRegisterQuery.aspx"
                            target="_blank" />
                        <area shape="rect" coords="44,194,180,224" href="../PublicSysMsg/FamiliarQuestion.aspx" />
                    </map>
                </td>
                <td class="right">
                    <table width="769px" border="0" cellspacing="0" cellpadding="0" style="float: right">
                        <tr>
                            <td>
                                <table width="769px" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td>
                                            <ul class="divNavigation">
                                                <li class="left"></li>
                                                <li class="title">常见问题列表</li>
                                                <li class="right"></li>
                                            </ul>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <table border="0" cellpadding="0" cellspacing="0" width="769px">
                                    <tr>
                                        <td valign="top">
                                            <table class="TableList" cellspacing="0" cellpadding="0" rules="all" border="1" id="_ctl0_ContentPlaceHolder1_dgrdList"
                                                style="border-width: 1px; border-style: solid; width: 100%; border-collapse: collapse;">
                                                <tr class="Header">
                                                    <td style="width: 45px;">
                                                        序号
                                                    </td>
                                                    <td>
                                                        标 题
                                                    </td>
                                                    <td style="width: 150px;">
                                                        更新时间
                                                    </td>
                                                </tr>
                                                <tr class="field_gridItem">
                                                    <td align="center">
                                                        1
                                                    </td>
                                                    <td title="用户竞买软件下载地址是多少?">
                                                        <a href="javascript:ShowOperaModalDialog('FamiliarView.aspx?id=9',700,500);">用户竞买软件下载地址是多少?</a>
                                                    </td>
                                                    <td align="center">
                                                        2011-7-11 15:36:15
                                                    </td>
                                                </tr>
                                                <tr class="rowColor">
                                                    <td align="center">
                                                        2
                                                    </td>
                                                    <td title="客户计算机的配置要求？">
                                                        <a href="javascript:ShowOperaModalDialog('FamiliarView.aspx?id=15',700,500);">客户计算机的配置要求？</a>
                                                    </td>
                                                    <td align="center">
                                                        2009-3-10 15:02:28
                                                    </td>
                                                </tr>
                                                <tr class="field_gridItem">
                                                    <td align="center">
                                                        3
                                                    </td>
                                                    <td title="如何获得竞买号？">
                                                        <a href="javascript:ShowOperaModalDialog('FamiliarView.aspx?id=14',700,500);">如何获得竞买号？</a>
                                                    </td>
                                                    <td align="center">
                                                        2009-3-10 14:52:28
                                                    </td>
                                                </tr>
                                                <tr class="rowColor">
                                                    <td align="center">
                                                        4
                                                    </td>
                                                    <td title="电脑提示您的机子不支持directx，该怎么办？">
                                                        <a href="javascript:ShowOperaModalDialog('FamiliarView.aspx?id=13',700,500);">电脑提示您的机子不支持directx，该怎么办？</a>
                                                    </td>
                                                    <td align="center">
                                                        2009-3-10 11:35:33
                                                    </td>
                                                </tr>
                                                <tr class="field_gridItem">
                                                    <td align="center">
                                                        5
                                                    </td>
                                                    <td title="如何进行网上竞拍？">
                                                        <a href="javascript:ShowOperaModalDialog('FamiliarView.aspx?id=12',700,500);">如何进行网上竞拍？</a>
                                                    </td>
                                                    <td align="center">
                                                        2009-3-10 11:17:19
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="line-height: 24px;">
                                        </td>
                                    </tr>
                                </table>
                    </table>
                </td>
            </tr>
        </table>
        <div class="bottom_menu">
            <div class="title1">
                <a href="http://localhost:7905/Tlw.ZPG.PublicWeb/Index.aspx">首 页</a> | <a href="http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/TradeRule.aspx"
                    target="_blank">交易规则</a> | <a href="http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/TradeFlow.aspx"
                        target="_blank">交易流程</a> | <a href="http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/ApplyInstruction.aspx"
                            target="_blank">竞买申请</a> | <a href="http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/TradeInfoQueryView.aspx">
                                出让宗地查询</a> | <a href="http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/InfomationQuery.aspx?InfomationBigTypeId=3">
                                    政策法规资讯</a> | <a href="http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/FormatFileDownload.aspx">
                                        格式文书下载</a> | <a href="http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/FileDownload.aspx">
                                            交易软件下载</a></div>
        </div>
        <div class="bottom_bg">
            <div class="write">
                版权所有 @ 福建省国土资源厅&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地址：福建省福州市金泉路38号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话：<span
                    style="color: Red;">0591-87660970 0591-87665795</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;备案序号：<span
                        style="color: Red;">闽ICP备030063号</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 技术支持：福州特力惠电子有限公司&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话：0591-87541518</div>
        </div>
    </div>
    </form>
</body>
</html>

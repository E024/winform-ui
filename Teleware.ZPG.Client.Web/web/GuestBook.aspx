﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GuestBook.aspx.cs" Inherits="Teleware.ZPG.Client.Web.web.GuestBook" %>

 
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 
<html xmlns="http://www.w3.org/1999/xhtml">
<head><title>
	在线留言
</title>
        <link type="text/css" href="../Css/Index.css" rel="Stylesheet" />
      
        <script type="text/javascript" src="../Resource/Js/public.js"></script>
 
    
    <style  type="text/css">
    .DItem1{
	font-size: 12px;
	color:#2969b9;
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
    <form name="aspnetForm" method="post" action="OnlineQuestion.aspx" language="javascript" onsubmit="javascript:return WebForm_OnSubmit();" id="aspnetForm">
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKLTk2NzE5MTg2OQ9kFgJmD2QWAgIED2QWBAIBD2QWAgIBDxYCHgRUZXh0BfUOPGxpPjxhIGlkPSJodHRwOi8vbG9jYWxob3N0Ojc5MDUvVGx3LlpQRy5QdWJsaWNXZWIvUHVibGljU3lzTXNnL09ubGluZVF1ZXN0aW9uLmFzcHgiIGhyZWY9aHR0cDovL2xvY2FsaG9zdDo3OTA1L1Rsdy5aUEcuUHVibGljV2ViL0luZGV4LmFzcHggdGl0bGU9IummliDpobUiPummliDpobUgPC9hPjwvbGk+PGxpIGNsYXNzPSdsaW5lJz48L2xpPjxsaT48YSBpZD0iaHR0cDovL2xvY2FsaG9zdDo3OTA1L1Rsdy5aUEcuUHVibGljV2ViL1B1YmxpY1N5c01zZy9PbmxpbmVRdWVzdGlvbi5hc3B4IiBocmVmPWh0dHA6Ly9sb2NhbGhvc3Q6NzkwNS9UbHcuWlBHLlB1YmxpY1dlYi9QdWJsaWNTeXNNc2cvVHJhZGVSdWxlLmFzcHggdGl0bGU9IuS6pOaYk+inhOWImSIgdGFyZ2V0PSJfYmxhbmsiPuS6pOaYk+inhOWImSA8L2E+PC9saT48bGkgY2xhc3M9J2xpbmUnPjwvbGk+PGxpPjxhIGlkPSJodHRwOi8vbG9jYWxob3N0Ojc5MDUvVGx3LlpQRy5QdWJsaWNXZWIvUHVibGljU3lzTXNnL09ubGluZVF1ZXN0aW9uLmFzcHgiIGhyZWY9aHR0cDovL2xvY2FsaG9zdDo3OTA1L1Rsdy5aUEcuUHVibGljV2ViL1B1YmxpY1N5c01zZy9UcmFkZUZsb3cuYXNweCB0aXRsZT0i5Lqk5piT5rWB56iLIiB0YXJnZXQ9Il9ibGFuayI+5Lqk5piT5rWB56iLIDwvYT48L2xpPjxsaSBjbGFzcz0nbGluZSc+PC9saT48bGk+PGEgaWQ9Imh0dHA6Ly9sb2NhbGhvc3Q6NzkwNS9UbHcuWlBHLlB1YmxpY1dlYi9QdWJsaWNTeXNNc2cvT25saW5lUXVlc3Rpb24uYXNweCIgaHJlZj1odHRwOi8vbG9jYWxob3N0Ojc5MDUvVGx3LlpQRy5QdWJsaWNXZWIvUHVibGljU3lzTXNnL0FwcGx5SW5zdHJ1Y3Rpb24uYXNweCB0aXRsZT0i56ue5Lmw55Sz6K+3IiB0YXJnZXQ9Il9ibGFuayI+56ue5Lmw55Sz6K+3IDwvYT48L2xpPjxsaSBjbGFzcz0nbGluZSc+PC9saT48bGk+PGEgaWQ9Imh0dHA6Ly9sb2NhbGhvc3Q6NzkwNS9UbHcuWlBHLlB1YmxpY1dlYi9QdWJsaWNTeXNNc2cvT25saW5lUXVlc3Rpb24uYXNweCIgaHJlZj1odHRwOi8vbG9jYWxob3N0Ojc5MDUvVGx3LlpQRy5QdWJsaWNXZWIvUHVibGljU3lzTXNnL1RyYWRlSW5mb1F1ZXJ5Vmlldy5hc3B4IHRpdGxlPSLlh7rorqnlrpflnLDmn6Xor6IiPuWHuuiuqeWul+WcsOafpeivoiA8L2E+PC9saT48bGkgY2xhc3M9J2xpbmUnPjwvbGk+PGxpPjxhIGlkPSJodHRwOi8vbG9jYWxob3N0Ojc5MDUvVGx3LlpQRy5QdWJsaWNXZWIvUHVibGljU3lzTXNnL09ubGluZVF1ZXN0aW9uLmFzcHgiIGhyZWY9aHR0cDovL2xvY2FsaG9zdDo3OTA1L1Rsdy5aUEcuUHVibGljV2ViL1B1YmxpY1N5c01zZy9JbmZvbWF0aW9uUXVlcnkuYXNweD9JbmZvbWF0aW9uQmlnVHlwZUlkPTMgdGl0bGU9IuaUv+etluazleinhOi1hOiuryI+5pS/562W5rOV6KeE6LWE6K6vIDwvYT48L2xpPjxsaSBjbGFzcz0nbGluZSc+PC9saT48bGk+PGEgaWQ9Imh0dHA6Ly9sb2NhbGhvc3Q6NzkwNS9UbHcuWlBHLlB1YmxpY1dlYi9QdWJsaWNTeXNNc2cvT25saW5lUXVlc3Rpb24uYXNweCIgaHJlZj1odHRwOi8vbG9jYWxob3N0Ojc5MDUvVGx3LlpQRy5QdWJsaWNXZWIvUHVibGljU3lzTXNnL0Zvcm1hdEZpbGVEb3dubG9hZC5hc3B4IHRpdGxlPSLmoLzlvI/mlofkuabkuIvovb0iPuagvOW8j+aWh+S5puS4i+i9vSA8L2E+PC9saT48bGkgY2xhc3M9J2xpbmUnPjwvbGk+PGxpPjxhIGlkPSJodHRwOi8vbG9jYWxob3N0Ojc5MDUvVGx3LlpQRy5QdWJsaWNXZWIvUHVibGljU3lzTXNnL09ubGluZVF1ZXN0aW9uLmFzcHgiIGhyZWY9aHR0cDovL2xvY2FsaG9zdDo3OTA1L1Rsdy5aUEcuUHVibGljV2ViL1B1YmxpY1N5c01zZy9GaWxlRG93bmxvYWQuYXNweCB0aXRsZT0i5Lqk5piT6L2v5Lu25LiL6L29Ij7kuqTmmJPova/ku7bkuIvovb0gPC9hPjwvbGk+PGxpIGNsYXNzPSdsaW5lJz48L2xpPmQCBQ9kFgQCCQ9kFgQCAg8QDxYGHg1EYXRhVGV4dEZpZWxkBQpDb3VudHlOYW1lHg5EYXRhVmFsdWVGaWVsZAUCSWQeC18hRGF0YUJvdW5kZxYCHghvbmNoYW5nZQWnAWphdmFzY3JpcHQ6TG9hZENvdW50eVNlbGVjdENoaWxkKHRoaXMsX2N0bDBfQ29udGVudFBsYWNlSG9sZGVyMV9Db3VudHlDb250cm9sX0NvdW50eVNlbGVjdC52YWx1ZSxfY3RsMF9Db250ZW50UGxhY2VIb2xkZXIxX0NvdW50eUNvbnRyb2xfQ291bnR5U2VsZWN0Q2hpbGQuaWQsJ0ZhbHNlJyk7EBUJBuemj+W3ngbljqbpl6gG5rOJ5beeBua8s+W3ngbojobnlLAG5LiJ5piOBuWNl+W5swbpvpnlsqkG5a6B5b63FQkBMgEzATUBNgE0AjEwATcBOAE5FCsDCWdnZ2dnZ2dnZxYBZmQCBA8QDxYGHwEFCkNvdW50eU5hbWUfAgUCSWQfA2cWAh8EBR1qYXZhc2NyaXB0OlNlbGVjdENoYW5nZSh0aGlzKRAVDQnpvJPmpbzljLoJ5Y+w5rGf5Yy6CeS7k+WxseWMugnpqazlsL7ljLoJ5pmL5a6J5Yy6CemXveS+r+WOvwnov57msZ/ljr8J572X5rqQ5Y6/CemXvea4heWOvwnmsLjms7Dljr8J5bmz5r2t5Y6/Ceemj+a4heW4ggnplb/kuZDluIIVDQIxMQIxMgIyMwIxMwIxNAIxNQIxNgIxNwIxOAIxOQIyMAIyMQIyMhQrAw1nZ2dnZ2dnZ2dnZ2dnZGQCCw9kFgJmDxAPFggeDEF1dG9Qb3N0QmFja2gfAQUIQ29kZU5hbWUfAgUCSWQfA2dkEBUDCei6q+S7veivgQbmiqTnhacG5YW25a6DFQMCODECODICODMUKwMDZ2dnFgFmZGTRXkQBfaJBvSosytDYRpnfMGoVUCs2Qqs8fBOPdIMnxw==" />
 
<script type="text/javascript"> 
<!--
    var theForm = document.forms['aspnetForm'];
    if (!theForm) {
        theForm = document.aspnetForm;
    }
    function __doPostBack(eventTarget, eventArgument) {
        if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
            theForm.__EVENTTARGET.value = eventTarget;
            theForm.__EVENTARGUMENT.value = eventArgument;
            theForm.submit();
        }
    }
// -->
</script>
 
 
<script src="/Tlw.ZPG.PublicWeb/WebResource.axd?d=8nF3bnTbE33I-NnmOfA2xYpebi5Q_xh-YgExJ4e1mDiSOzOIFX9bPkN6R_JfH-m8lVNG7JwxeOnGAJyf1oWNZeqORjKdaxO-AqIDPQqXftk1&amp;t=635158853807063644" type="text/javascript"></script>
 
 
<script type="text/javascript" src="/Tlw.ZPG.PublicWeb/ajaxpro/prototype.ashx"></script>
<script type="text/javascript" src="/Tlw.ZPG.PublicWeb/ajaxpro/core.ashx"></script>
<script type="text/javascript" src="/Tlw.ZPG.PublicWeb/ajaxpro/converter.ashx"></script>
<script type="text/javascript" src="/Tlw.ZPG.PublicWeb/ajaxpro/AjaxProRefresh,App_Code.ashx"></script>
 
<script src="/Tlw.ZPG.PublicWeb/WebResource.axd?d=qb5z2wlSQ08jcpddKK4qLrXDh0-1gLUhNKwpKsiUhcM3MgMEjeQ189OD1sx95Xkeyo5czIvn-Ly8wro1FVNq1a9NJa-XEfHs4ZrE2ABvBcI1&amp;t=635158853807063644" type="text/javascript"></script>
<script type="text/javascript"> 
<!--
    function WebForm_OnSubmit() {
        if (typeof (ValidatorOnSubmit) == "function" && ValidatorOnSubmit() == false) return false;
        return true;
    }
// -->
</script>
 
<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWIgL86a22AwLxmNSeDQKZ252rBAL9oMCCAgKzpsAGArnvr5QDArrvr5QDArzvr5QDAr3vr5QDArvvr5QDArjv75cDAr7vr5QDAq/vr5QDAqDvr5QDAvjjyf4HAvjjzf4HAvnj8f4HAvjj8f4HAvjj9f4HAvjj+f4HAvjj/f4HAvjj4f4HAvjjpf0HAvjjqf0HAvnjxf4HAvnjyf4HAvnjzf4HAsmTttgCAsmTstgCAsmTjtgCArj5lPIGApz/6pUFArOmiroCAvKCr6cHc2hPzHBXMek8KPAeifTIgN80vg1KVkRVDV0dhG6BKos=" />
    <div class="divAll">
        
 
<div class="divLogo">
</div>
<div class="divMenu">
    <div class="left">
        <ul class="right">
            
            <span style=" font-size:14px"><li><a id="http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/OnlineQuestion.aspx" href=http://localhost:7905/Tlw.ZPG.PublicWeb/Index.aspx title="首 页">首 页 </a></li><li class='line'></li><li><a id="http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/OnlineQuestion.aspx" href=http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/TradeRule.aspx title="交易规则" target="_blank">交易规则 </a></li><li class='line'></li><li><a id="http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/OnlineQuestion.aspx" href=http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/TradeFlow.aspx title="交易流程" target="_blank">交易流程 </a></li><li class='line'></li><li><a id="http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/OnlineQuestion.aspx" href=http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/ApplyInstruction.aspx title="竞买申请" target="_blank">竞买申请 </a></li><li class='line'></li><li><a id="http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/OnlineQuestion.aspx" href=http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/TradeInfoQueryView.aspx title="出让宗地查询">出让宗地查询 </a></li><li class='line'></li><li><a id="http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/OnlineQuestion.aspx" href=http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/InfomationQuery.aspx?InfomationBigTypeId=3 title="政策法规资讯">政策法规资讯 </a></li><li class='line'></li><li><a id="http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/OnlineQuestion.aspx" href=http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/FormatFileDownload.aspx title="格式文书下载">格式文书下载 </a></li><li class='line'></li><li><a id="http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/OnlineQuestion.aspx" href=http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/FileDownload.aspx title="交易软件下载">交易软件下载 </a></li><li class='line'></li></span>
        </ul>
        <div style="font-size: 15px; color: #FF0000; font-weight: bold; text-align: center;">
            竞买端软件升级，请各竞买人重新<a href="http://fjgpjy.fjgtzy.gov.cn/zpgpublicweb/Resource/ClientTool/福建省国有建设用地使用权出让网上交易系统(竞买软件)v1.011.exe" style="font-size: 15px; color: #FF0000; font-weight: bold; text-align: center; text-decoration: underline;">下载安装</a>(如已安装，请先卸载后再安装)。
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
                <img src="../images/Lm_bg.jpg" width="224" height="237" border="0" usemap="#Map" />
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
                    
 
    <script type="text/javascript" src="../Resource/js/CheckBodyId.js"></script>
 
    <table width="769px" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
            <td>
                <ul class="divNavigation">
                    <li class="left"></li>
                    <li class="title">在线留言 &nbsp;</li>
                    <li class="right"></li>
                </ul>
                <table class="TableBody">
                    <tr>
                        <td class="leftTd">
                            姓&nbsp;&nbsp;名: &nbsp;
                        </td>
                        <td>
                            <input name="_ctl0:ContentPlaceHolder1:txtUserName" type="text" id="_ctl0_ContentPlaceHolder1_txtUserName" class="field_input" style="width:90%;" />&nbsp;<span
                                id="Span1" style="color: #ff0000">*</span><span controltovalidate="_ctl0_ContentPlaceHolder1_txtUserName" errormessage="姓名不能为空" display="Dynamic" id="_ctl0_ContentPlaceHolder1_RequiredFieldValidator2" evaluationfunction="RequiredFieldValidatorEvaluateIsValid" initialvalue="" style="color:Red;display:none;">姓名不能为空</span>
                        </td>
                        <td class="leftTd">
                            联系地址: &nbsp;
                        </td>
                        <td>
                            <input name="_ctl0:ContentPlaceHolder1:txtAddress" type="text" id="_ctl0_ContentPlaceHolder1_txtAddress" class="field_input" style="width:90%;" />&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="leftTd">
                            联系电话: &nbsp;
                        </td>
                        <td>
                            <input name="_ctl0:ContentPlaceHolder1:txtTel" type="text" id="_ctl0_ContentPlaceHolder1_txtTel" class="field_input" style="width:90%;" />&nbsp;
                        </td>
                        <td class="leftTd">
                            所在区域: &nbsp;
                        </td>
                        <td>
                            <input name="_ctl0:ContentPlaceHolder1:CountyControl:HiddenCountyId" type="text" id="_ctl0_ContentPlaceHolder1_CountyControl_HiddenCountyId" style="display:none;width:0px;" value="11" />
<select name="_ctl0:ContentPlaceHolder1:CountyControl:CountySelect" id="_ctl0_ContentPlaceHolder1_CountyControl_CountySelect" class="field_select" onchange="javascript:LoadCountySelectChild(this,_ctl0_ContentPlaceHolder1_CountyControl_CountySelect.value,_ctl0_ContentPlaceHolder1_CountyControl_CountySelectChild.id,&#39;False&#39;);" style="width:80px;">
	<option selected="selected" value="2">福州</option>
	<option value="3">厦门</option>
	<option value="5">泉州</option>
	<option value="6">漳州</option>
	<option value="4">莆田</option>
	<option value="10">三明</option>
	<option value="7">南平</option>
	<option value="8">龙岩</option>
	<option value="9">宁德</option>
 
</select>
<select name="_ctl0:ContentPlaceHolder1:CountyControl:CountySelectChild" id="_ctl0_ContentPlaceHolder1_CountyControl_CountySelectChild" class="field_select" onchange="javascript:SelectChange(this)" style="width:80px;">
	<option selected="selected" value="11">鼓楼区</option>
	<option value="12">台江区</option>
	<option value="23">仓山区</option>
	<option value="13">马尾区</option>
	<option value="14">晋安区</option>
	<option value="15">闽侯县</option>
	<option value="16">连江县</option>
	<option value="17">罗源县</option>
	<option value="18">闽清县</option>
	<option value="19">永泰县</option>
	<option value="20">平潭县</option>
	<option value="21">福清市</option>
	<option value="22">长乐市</option>
 
</select>
 
<script type="text/javascript" language="javascript">
    //列表更新处理
    function LoadCountySelectChild(SelectObj, v, d, IsAddAll) {
        var cc = document.getElementById(d);
        cc.text = "读取数据中...";
        // alert();
        cc.outerHTML = AjaxProRefresh.RefCounty(v, d, IsAddAll, cc.style.width).value;
        var InputId = SelectObj.id.replace('_CountySelect', '_HiddenCountyId');
        var InputObj = document.getElementById(InputId);
        if (IsAddAll == "True") {
            InputObj.value = SelectObj.value;
        }
        else {
            var CountySelectObj = document.getElementById(d);
            // CountySelectObj
            InputObj.value = CountySelectObj.value;
        }
    }
    function SelectChange(ChildObj) {
        var InputObj = GetInputObj(ChildObj.id, "_HiddenCountyId");

        if (ChildObj.value == "") {
            var CountySelectObj = GetInputObj(ChildObj.id, "_CountySelect");
            InputObj.value = CountySelectObj.value;
        }
        else
            InputObj.value = ChildObj.value;
    }
    function GetInputObj(ChildName, ObjName) {
        var InputId = ChildName.replace('_CountySelectChild', ObjName);
        return document.getElementById(InputId);
    }
</script>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="leftTd">
                            证件类型: &nbsp;
                        </td>
                        <td>
                            <select name="_ctl0:ContentPlaceHolder1:txtCerType:CodeList" id="_ctl0_ContentPlaceHolder1_txtCerType_CodeList" class="field_select" style="width:140px;">
	<option selected="selected" value="81">身份证</option>
	<option value="82">护照</option>
	<option value="83">其它</option>
 
</select>
 
 
                        </td>
                        <td class="leftTd">
                            证件号码: &nbsp;
                        </td>
                        <td>
                            <input name="_ctl0:ContentPlaceHolder1:txtCerNumber" type="text" id="_ctl0_ContentPlaceHolder1_txtCerNumber" class="field_input" style="width:90%;" />&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="leftTd">
                            标题: &nbsp;
                        </td>
                        <td colspan="3">
                            <input name="_ctl0:ContentPlaceHolder1:txtTitle" type="text" id="_ctl0_ContentPlaceHolder1_txtTitle" class="field_input" style="width:90%;" />&nbsp;&nbsp;<span
                                id="startxtEntrustzipcode" style="color: #ff0000">*</span><span controltovalidate="_ctl0_ContentPlaceHolder1_txtTitle" errormessage="标题不能为空" display="Dynamic" id="_ctl0_ContentPlaceHolder1_RequiredFieldValidator1" evaluationfunction="RequiredFieldValidatorEvaluateIsValid" initialvalue="" style="color:Red;display:none;">标题不能为空</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="leftTd">
                            内容: &nbsp;
                        </td>
                        <td class="C2AItem2" colspan="3">
                            <textarea name="_ctl0:ContentPlaceHolder1:txtMessage" id="_ctl0_ContentPlaceHolder1_txtMessage" class="field_input" style="height:250px;width:90%;">
</textarea>&nbsp;&nbsp;<span id="Span2" style="color: #ff0000">*</span><span controltovalidate="_ctl0_ContentPlaceHolder1_txtMessage" errormessage="请输入内容" display="Dynamic" id="_ctl0_ContentPlaceHolder1_RequiredFieldValidator3" evaluationfunction="RequiredFieldValidatorEvaluateIsValid" initialvalue="" style="color:Red;display:none;">请输入内容</span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" class="buttonTd">
                            <input type="submit" name="_ctl0:ContentPlaceHolder1:InsertQuestion" value=" 提 交 " onclick="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;_ctl0:ContentPlaceHolder1:InsertQuestion&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, false))" language="javascript" id="_ctl0_ContentPlaceHolder1_InsertQuestion" class="field_button" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
 
                </td>
            </tr>
        </table>
        
                    <div class="bottom_menu">
                        <div class="title1">
                        
                            <a href="http://localhost:7905/Tlw.ZPG.PublicWeb/Index.aspx">首 页</a> | <a href="http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/TradeRule.aspx" target="_blank">交易规则</a> | <a href="http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/TradeFlow.aspx" target="_blank">交易流程</a> | <a href="http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/ApplyInstruction.aspx" target="_blank">竞买申请</a> | <a href="http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/TradeInfoQueryView.aspx">出让宗地查询</a> | <a href="http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/InfomationQuery.aspx?InfomationBigTypeId=3">政策法规资讯</a> | <a href="http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/FormatFileDownload.aspx">格式文书下载</a> | <a href="http://localhost:7905/Tlw.ZPG.PublicWeb/PublicSysMsg/FileDownload.aspx">交易软件下载</a></div>
                    </div>
<div class="bottom_bg" >
<div class="write" >
    版权所有 @ 福建省国土资源厅&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地址：福建省福州市金泉路38号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话：<span
                                style="color: Red;">0591-87660970 0591-87665795</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;备案序号：<span
                                    style="color: Red;">闽ICP备030063号</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 技术支持：福州特力惠电子有限公司&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话：0591-87541518</div>
</div>
 
    </div>
</form>
</body>
</html>


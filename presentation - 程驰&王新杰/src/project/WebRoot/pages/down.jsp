
<%@ page language="java"  pageEncoding="gb2312"%>
<%@ include file="/pages/taglibs.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>

    
    <title></title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {
	color: #43860c;
	font-size: 12px;
}
-->
</style>

  </head>

  <body >
  <c:set var="type" value="<%=session.getAttribute(\"type\") %>"></c:set>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="24" background="<%=basePath%>images/main_47.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="29" height="24"><img src="<%=basePath%>images/main_45.gif" width="29" height="24" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="369"><span class="STYLE1"> </span><br></td>
            <td width="814" class="STYLE1">��ǰ�û�:<%=session.getAttribute("username") %>&nbsp;&nbsp;��ɫ:<c:if test="${type==1 }">����Ա</c:if><c:if test="${type==2 }">��ͨԱ��</c:if></td>
            <td width="185" nowrap="nowrap" class="STYLE1"><div align="center">&nbsp;��ҵ�����Ʒ</div></td>
          </tr>
        </table></td>
        <td width="14"><img src="<%=basePath%>images/main_49.gif" width="14" height="24" /></td>
      </tr>
    </table></td>
  </tr>
</table>
  </body>
</html>


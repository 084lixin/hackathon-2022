<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ include file="/pages/taglibs.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>�û�ά��</title>
		<link href="<%=basePath%>/css/page.css" rel="stylesheet"
			type="text/css" />
 
		<script type="text/javascript" language="javascript">
	  var type =[<c:forEach items="${list}" var="item" varStatus="i"><c:if test="${i.index!=0}">,</c:if>{'id':'${item.id}','name':'${item.name}'}</c:forEach>];
       function checkForm(){
         var validate=$('form').validate('submitValidate');
        if(checkname()==true&&validate== true){
            var aa = window.confirm('ȷ��Ҫ������');
            if (aa == true) {
                document.forms[0].submit();
            } else {
                return false;
            }
        }
	}
	function checkname()
	{
		 var form = document.forms[0];
		var i ;
		var id='${file.id }';
		for(i=0;i<type.length;i++)
		{
			if(type[i].name==$('#name').val()&&($('#id').val()!=type[i].id))
			{
				$('#codeshow').html("�û����Ѵ��ڣ�");
				$('#code').focus();
				flag=1;
				return false;
			}
			
		}
		return true;
	}
</script>
	</head>

	<body>
		<div align="center">
			<h1>
				<c:if test="${type==null}">����ļ�</c:if>
				<c:if test="${type!=null}">�޸��ļ�</c:if>
			</h1>
		</div>
		<div id="user" align="center">
			<form action="${base }/servlet/FileServlet?method=saveFile"
				method="post" id="myform">
				<table border="1">
					
					<tr>
						<td width="20%">
							�ļ����ƣ�
						</td>
						<td>
						<input id="id" name="id" value="${file.id }" type="hidden">
							<input id="flag" name="flag" value="${flag}" type="hidden">

							<input type="text" id="name" name="name" value="${file.name }"
								class="required" data-tip="�������ļ�����" data-valid="isNonEmpty"
								data-show="unameshow" data-error="�ļ����Ʋ���Ϊ��">

							<span style="color: red;">*</span>
							<span style="color: red;" id="unameshow"></span>
						</td>
					</tr>
					<tr>
						<td width="20%">
							������
						</td>
						
						<td>
							<tag:upload base="${base}" fileValue="${file.url}" downname="${file.name}" 
											fileId="url" fileName="url"
											fileType=".*" fileCss="g_box" btnCss="box"></tag:upload>
						</td>
							
					</tr>





					<tr>
						<td colspan="2">
							<input type="button" value="�ύ" onclick="checkForm()" />

							<input class="box" type="button" value="��  ��"
								onclick="javascript:history.go(-1);" />
						</td>
					</tr>
				</table>
			</form>
		</div>
		<script type="text/javascript">
		$("#myform").validate({});
		
		</script>
	</body>

</html>

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

    <script type="text/javascript" src="${base }/js/data.js"></script>
		<script type="text/javascript" language="javascript">
	  var type =[<c:forEach items="${list}" var="item" varStatus="i"><c:if test="${i.index!=0}">,</c:if>{'id':'${item.id}','name':'${item.name}','code':'${item.code}'}</c:forEach>];
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
		var id='${syscode.id }';
		for(i=0;i<type.length;i++)
		{
			if(type[i].code==$('#code').val()&&($('#id').val()!=type[i].id))
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
				<c:if test="${type==null}">��Ӵ���</c:if>
				<c:if test="${type!=null}">�޸Ĵ���</c:if>
			</h1>
		</div>
		<div id="user" align="center">
			<form action="${base }/servlet/SysCodeServlet?method=saveSysCode"
				method="post" id="myform">
				<table border="1">
					<tr>
						<td width="20%">
							�������
						</td>
						<td>
							<select id="type"  name="type" class="required" data-tip="��ѡ��������"  
							 data-valid="isNonEmpty" data-show="typeshow"
                                                             data-error="���������Ϊ��" >
							<option value="">--�������--</option>
							</select>
							<span style="color: red;">*</span>
							<span style="color: red;" id="typeshow"></span>
						</td>
					</tr>
					<tr>
						<td width="20%">
							�������ƣ�
						</td>
						<td>
						<input id="id" name="id" value="${syscode.id }" type="hidden">
							<input id="flag" name="flag" value="${flag}" type="hidden">

							<input type="text" id="name" name="name" value="${syscode.name }"
								class="required" data-tip="�������������" data-valid="isNonEmpty"
								data-show="unameshow" data-error="�������Ʋ���Ϊ��">

							<span style="color: red;">*</span>
							<span style="color: red;" id="unameshow"></span>
						</td>
					</tr>
					<tr>
						<td width="20%">
							����ֵ��
						</td>
						
						<td>
							<input type="text" id="code" name="code" value="${syscode.code}"
								class="required" data-tip="���������ֵ" data-valid="isNonEmpty"
								data-show="codeshow" data-error="����ֵ����Ϊ��">
							<span style="color: red;">*</span>
							<span style="color: red;" id="codeshow"></span>
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
		var $type=$("#type"); 
		var type_v='${syscode.type}'; 
		$(codetype.value).each(function (i){
             var $opt = $("<option>").text(codetype.pram[i]).val(this);
             if (type_v == this) {
            	$opt.attr("selected", "selected");
       		 }
              $opt.appendTo($type);
        });
    	
		</script>
	</body>

</html>

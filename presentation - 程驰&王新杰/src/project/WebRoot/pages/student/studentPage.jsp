<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ include file="/pages/taglibs.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ѧ��ע��</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="<%=basePath%>css/list.css" rel="stylesheet" type="text/css" />  
    <link href="<%=basePath%>/css/page.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript" language="javascript">
	  var uname =[<c:forEach items="${list}" var="item" varStatus="i"><c:if test="${i.index!=0}">,</c:if>{'id':'${item.id}','name':'${item.name}'}</c:forEach>];
       function checkForm(){
         var validate=$('form').validate('submitValidate');
          if(checkname()==true&&validate== true){
			if($("#password").val()!=$("#passwordagin").val()){ 
				$("#passwordaginshow").html("�����������벻һ�£�");
				$("#passwordagin").focus();
				return false;
			}else{
				 var aa = window.confirm('ȷ��Ҫ������');
	            if (aa == true) {
	                document.forms[0].submit();
	            } else {
	                return false;
	            }
			}
			
		}else{
			return false;
		}
       
	}
	function checkname()
	{
		 var form = document.forms[0];
		var i ;
		var uid='${student.id }';
		for(i=0;i<uname.length;i++)
		{
			if(uname[i].name==$('#name').val()&&($('#id').val()!=uname[i].id))
			{
				$('#nameshow').html("�û����Ѵ��ڣ�");
				$('#name').focus();
				flag=1;
				return false;
			}
			
		}
		return true;
	}
</script>
	</head>
    
	<body >
		<h3 style="background-color: gray">
			
			<font color="#ffffff"><a><c:if test="${Student==null}">ѧ��ע��</c:if>
				<c:if test="${Student!=null}">�޸�ѧ��</c:if></a>
			</font>
			
		</h3>
		<div id="user" align="center">
			<form action="${base }/servlet/StudentServlet?method=saveStudent" method="post" id="myform" >
			    <table border="1"   >
					<tr>
						<td width="20%">
							�û�����
						</td>
						<td>
						<input id="id" name="id" value="${student.id }" type="hidden"> 
							<input id="flag" name="flag" value="${flag}" type="hidden">
						<c:if test="${student!=null}"><input type="text" id="name" name="name" value="${student.name }" readonly="readonly"></c:if>
						<c:if test="${student==null}">
							<input type="text" id="name" name="name" value="${student.name }" onblur="checkname()"
							  class="required" data-tip="�������û���"  
							 data-valid="isNonEmpty" data-show="unameshow"
                                                             data-error="�û�������Ϊ��">	
							
								
							</c:if>	
						 <span style="color: red;">*</span>				
							<span style="color: red;" id="unameshow"></span></td>
					</tr>
					 
					<tr >
						<td width="20%">
							���룺
						</td>
						<td>
							<input type="password" id="password" name="password" value="${student.password }" 
							 class="required" data-tip="����������"  
							 data-valid="isNonEmpty" data-show="passwordshow"
                                                             data-error="���벻��Ϊ��">	
							<span style="color: red;">*</span>	
							<span style="color: red;" id="passwordshow"></span>	
						</td>
					</tr>  
					<tr>
						<td width="20%">
							ȷ�����룺
						</td>
						<td>	
							<input type="password" id="passwordagin" name="passwordagin" class="required" data-tip="������ȷ������"  
							 data-valid="isNonEmpty" data-show="passwordaginshow" value="${student.password }"
                                                             data-error="ȷ�����벻��Ϊ��">
                                                             <span style="color: red;" >*</span>
                                                             <span style="color: red;" id="passwordaginshow"></span>		
						</td>
						
					</tr>
					<tr>
						<td width="20%">
							������
						</td>
						<td>
							<input type="text" id="realname" name="realname"  value="${student.realname }" 
							 class="required" data-tip="����������"  
							 data-valid="isNonEmpty" data-show="urealnameshow"
                                                             data-error="��������Ϊ��"  > 
							<span style="color: red;">*</span>		
							<span style="color: red;" id="urealnameshow"></span>				
						</td>
					</tr>
					<tr>
						<td width="20%">
							ѧ�ţ�
						</td>
						<td>
							<input type="text" id="code" name="code"  value="${student.code}" 
							 class="required" data-tip="������ѧ��"  
							 data-valid="isNonEmpty" data-show="codeshow"
                                                             data-error="ѧ�Ų���Ϊ��"  > 
							<span style="color: red;">*</span>		
							<span style="color: red;" id="codeshow"></span>				
						</td>
					</tr>
					<tr>
						<td width="20%">
							ѧԺ��
						</td>
						<td>
							<input type="text" id="college" name="college"  value="${student.college}" 
							 class="required" data-tip="������ѧԺ"  
							 data-valid="isNonEmpty" data-show="collegeshow"
                                                             data-error="ѧԺ����Ϊ��"  > 
							<span style="color: red;">*</span>		
							<span style="color: red;" id="collegeshow"></span>				
						</td>
					</tr>
					
					<tr>
						<td width="20%">
							��ϵ�绰��
						</td>
						<td>
							<input type="text" id="tel" name="tel" class="required" value="${student.tel }" data-tip="��������ϵ�绰"  
							 data-valid="isNonEmpty" data-show="utelshow"
                                                             data-error="��ϵ�绰����Ϊ��"  > 
							<span style="color: red;">*</span>		
							<span style="color: red;" id="utelshow"></span>				
						</td>
					</tr>
					
					<tr>
						<td colspan="2">
							<input type="button" value="��  ��" onclick="checkForm()"/>
							
							<input class="box" type="button" value="��  ��"
							onclick="javascript:history.go(-1);" />
						</td>
					</tr>
				</table>
			</form>
		</div>
		<script type="text/javascript">
		$("#myform").validate({


    });
		</script>
  </body>
  
</html>

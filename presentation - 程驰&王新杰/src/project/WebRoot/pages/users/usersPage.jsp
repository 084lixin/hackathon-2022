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
    
    <title>�û�ά��</title>
    <link href="<%=basePath%>/css/page.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript" language="javascript">
	  var uname =[<c:forEach items="${list}" var="item" varStatus="i"><c:if test="${i.index!=0}">,</c:if>{'uid':'${item.uid}','uname':'${item.uname}'}</c:forEach>];
       function checkForm(){
         var validate=$('form').validate('submitValidate');
        if(checkname()==true&&validate== true){
           
            if($("#upassword").val()!=$("#upasswordagin").val()){ 
				$("#upasswordaginshow").html("�����������벻һ�£�");
				$("#upasswordagin").focus();
				return ;
			}else{
			 var aa = window.confirm('ȷ��Ҫ������');
            if (aa == true) {
                document.forms[0].submit();
            } else {
                return ;
            }
            }
        }
	}
	function checkname()
	{
		 var form = document.forms[0];
		var i ;
		var uid='${users.uid }';
		for(i=0;i<uname.length;i++)
		{
			if(uname[i].uname==$('#uname').val()&&($('#uid').val()!=uname[i].uid))
			{
				$('#unameshow').html("�û����Ѵ��ڣ�");
				$('#uname').focus();
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
			
			<font color="#ffffff"><a><c:if test="${users==null}">����û�</c:if>
				<c:if test="${users!=null}">�޸��û�</c:if></a>
			</font>
			
		</h3>
		<div id="user" align="center">
			<form action="${base }/servlet/UsersServlet?method=saveUsers" method="post" id="myform" >
			    <table border="1"   >
					<tr>
						<td width="20%">
							�û�����
						</td>
						<td>
						<input id="uid" name="uid" value="${users.uid }" type="hidden"> 
							<input id="flag" name="flag" value="${flag}" type="hidden">
						<c:if test="${users!=null}"><input type="text" id="uname" name="uname" value="${users.uname }" readonly="readonly"></c:if>
						<c:if test="${users==null}">
							<input type="text" id="uname" name="uname" value="${users.uname }" onblur="checkname()"
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
							<input type="password" id="upassword" name="upassword" value="${users.upassword==null?'123456':users.upassword }" 
							 class="required" data-tip="���������룬Ĭ��123456"  
							 data-valid="isNonEmpty" data-show="upasswordshow"
                                                             data-error="���벻��Ϊ��">	
							<span style="color: red;">*</span>	
							<span style="color: red;" id="upasswordshow"></span>	
						</td>
					</tr> 
					<tr >
						<td width="20%">
							ȷ�����룺
						</td>
						<td>
							<input type="password" id="upasswordagin" name="upasswordagin" value="${users.upassword==null?'123456':users.upassword }" 
							 class="required" data-tip="������ȷ������"  
							 data-valid="isNonEmpty" data-show="upasswordaginshow"
                                                             data-error="ȷ�����벻��Ϊ��">	
							<span style="color: red;">*</span>	
							<span style="color: red;" id="upasswordaginshow"></span>	
						</td>
					</tr> 
					<tr>
						<td width="20%">
							������
						</td>
						<td>
							<input type="text" id="urealname" name="urealname"  value="${users.urealname }" 
							 class="required" data-tip="����������"  
							 data-valid="isNonEmpty" data-show="urealnameshow"
                                                             data-error="��������Ϊ��"  > 
							<span style="color: red;">*</span>		
							<span style="color: red;" id="urealnameshow"></span>				
						</td>
					</tr>
					 
					<tr>
						<td width="20%">
							��ϵ�绰��
						</td>
						<td>
							<input type="text" id="utel" name="utel" class="required" value="${users.utel }" data-tip="��������ϵ�绰"  
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

<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ include file="/pages/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="${base }">
    
    <title>�޸�����</title>
    <link href="${base }/css/page.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" language="javascript">
      function checkForm(){
         var form = document.forms[0];
         
		var validate=$('form').validate('submitValidate');
        if(validate== true){
			if($("#upasswordc").val()!=$("#upasswordold").val()){ 
				$("#upasswordoldshow").html("ԭʼ���벻��ȷ��");
				$("#upasswordold").focus();
				return false;
			}
			else if($("#upassword").val()!=$("#upasswordagin").val()){ 
				$("#upasswordaginshow").html("�����������벻һ�£�");
				$("#upasswordagin").focus();
				return false;
			}else{
				return true;
			}
			
		}
		return false;
	}
	
</script>
	</head>

	<body >
		<div align="center">
			<h1>
				�޸�����
			</h1>
		</div>
		<div id="user" align="center">
			<form action="${base }/servlet/UsersServlet?method=updatePassword" method="post"
				onsubmit="return checkForm()">
				<table border="1">
					<tr>
						
						<td width="20%">
							�û�����
						</td>
						<td>
							${users.uname }	
							<input type="hidden" name="uid" id="uid" value="${users.uid }">		
										
						</td>
					</tr>
					
					
					<tr>
						<td width="20%">
							ԭʼ���룺
						</td>
						<td>
							<input type="password"  id="upasswordold" name="upasswordold" class="required" data-tip="������ԭʼ����"  
							 data-valid="isNonEmpty" data-show="upasswordcshow"
                                                             data-error="ԭʼ���벻��Ϊ��">
							<input type="hidden" id="upasswordc" name="upasswordc" value="${users.upassword }">	
							  <span style="color: red;" >*</span>
								<span style="color: red;" id="upasswordcshow"></span>			
						</td>
					</tr>
					
					<tr>
						<td width="20%">
							�����룺
						</td>
						<td>
							<input type="password"  id="upassword" name="upassword" class="required" data-tip="������������"  
							 data-valid="isNonEmpty" data-show="unameshow"
                                                             data-error="�����벻��Ϊ��">	
                                                               <span style="color: red;" >*</span>
							<span style="color: red;" id="upasswordshow"></span>	
						</td>
						
					</tr>
					<tr>
						<td width="20%">
							ȷ�����룺
						</td>
						<td>	
							<input type="password" id="upasswordagin" name="upasswordagin" class="required" data-tip="������������"  
							 data-valid="isNonEmpty" data-show="upasswordaginshow"
                                                             data-error="�����벻��Ϊ��">
                                                             <span style="color: red;" >*</span>
                                                             <span style="color: red;" id="upasswordaginshow"></span>		
						</td>
						
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="�ύ" />
							
							<input class="box" type="button" value="��  ��"
							onClick="javascript:history.go(-1);" />
						</td>
					</tr>
				</table>
			</form>
		</div>
		<script type="text/javascript">
		$("form").validate({


    });
		</script>
  </body>
</html>

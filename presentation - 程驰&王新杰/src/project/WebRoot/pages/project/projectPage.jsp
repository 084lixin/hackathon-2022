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

		<title>��Ŀά��</title>
		<link href="<%=basePath%>/css/page.css" rel="stylesheet"
			type="text/css" />

		<script type="text/javascript" language="javascript">
	  function checkForm(){
         var validate=$('form').validate('submitValidate');
        if( validate== true){
            var aa = window.confirm('ȷ��Ҫ������');
            if (aa == true) {
                document.forms[0].submit();
            } else {
                return false;
            }
        }
	}
	
</script>
	</head>

	<body>
		<h3 style="background-color: gray">

			<font color="#ffffff"><a><c:if test="${project==null}">�����Ŀ</c:if>
					<c:if test="${project!=null}">�޸���Ŀ</c:if>
			</a> </font>

		</h3>
		<div id="user" align="center">
			<form action="${base }/servlet/ProjectServlet?method=saveProject"
				method="post" id="myform">
				<table border="1">
					<tr>
						<td width="20%">
							��Ŀ����
						</td>
						<td>
							<input id="uid" name="uid" value="${project.uid }" type="hidden">
							<input id="id" name="id" value="${project.id }" type="hidden"> 
							<input id="verify" name="verify" value="${project.verify }" type="hidden">
							<input id="flag" name="flag" value="${flag}" type="hidden">
							<input type="text" id="name" name="name"
								value="${project.name }"   class="required"
								data-tip="��������Ŀ��" data-valid="isNonEmpty" data-show="nameshow"
								data-error="��Ŀ������Ϊ��">

							<span style="color: red;">*</span>
							<span style="color: red;" id="nameshow"></span>
						</td>
					</tr>
					<tr>
						<td width="20%">
							�����ˣ�
						</td>
						<td>
							<input type="text" id="header" name="header"
								value="${project.header}" class="required" data-tip="�����븺����"
								data-valid="isNonEmpty" data-show="headershow"
								data-error="�����˲���Ϊ��">
							<span style="color: red;">*</span>
							<span style="color: red;" id="headershow"></span>
						</td>
					</tr>
					
					<tr>
						<td width="20%">
							��ϵ�绰��
						</td>
						<td>
							<input type="text" id="tel" name="tel" class="required"
								value="${project.tel }" data-tip="��������ϵ�绰"
								data-valid="isNonEmpty" data-show="telshow"
								data-error="��ϵ�绰����Ϊ��">
							<span style="color: red;">*</span>
							<span style="color: red;" id="telshow"></span>
						</td>
					</tr>
					<tr>
						<td width="20%">
							����ѧԺ��
						</td>
						<td>
							<input type="text" id="college" name="college" class="required"
								value="${project.college}" data-tip="����������ѧԺ"
								data-valid="isNonEmpty" data-show="collegeshow"
								data-error="����ѧԺ����Ϊ��">
							<span style="color: red;">*</span>
							<span style="color: red;" id="collegeshow"></span>
						</td>
					</tr>
					<tr>
						<td width="20%">
							��Ŀ�μ��ˣ�
						</td>
						<td>
							<input type="text" id="participant" name="participant" class="required"
								value="${project.participant }" data-tip="��������Ŀ�μ���"
								data-valid="isNonEmpty" data-show="participantshow"
								data-error="��Ŀ�μ��˲���Ϊ��">
							<span style="color: red;">*</span>
							<span style="color: red;" id="participantshow"></span>
						</td>
					</tr>
					<tr>
						<td width="20%">
							ָ����ʦ��
						</td>
						<td>
							<input type="text" id="teacher" name="teacher" class="required"
								value="${project.teacher }" data-tip="������ָ����ʦ"
								data-valid="isNonEmpty" data-show="teachershow"
								data-error="ָ����ʦ����Ϊ��">
							<span style="color: red;">*</span>
							<span style="color: red;" id="teachershow"></span>
						</td>
					</tr>
					<tr>
						<td width="20%">
							��ϵ�绰��
						</td>
						<td>
							<input type="text" id="teachertel" name="teachertel" class="required"
								value="${project.teachertel }" data-tip="��������ϵ�绰"
								data-valid="isNonEmpty" data-show="teachertelshow"
								data-error="��ϵ�绰����Ϊ��">
							<span style="color: red;">*</span>
							<span style="color: red;" id="teachertelshow"></span>
						</td>
					</tr>
					
					<tr>
						<td width="20%">
							��ʦְ�ƣ�
						</td>
						<td>
							<input type="text" id="teachertitle" name="teachertitle" class="required"
								value="${project.teachertitle}" data-tip="�����뵼ʦְ��"
								data-valid="isNonEmpty" data-show="teachertitleshow"
								data-error="��ʦְ�Ʋ���Ϊ��">
							<span style="color: red;">*</span>
							<span style="color: red;" id="teachertitleshow"></span>
						</td>
					</tr>
					<tr>
						<td width="20%">
							���ڵ�λ��
						</td>
						<td>
							<input type="text" id="unit" name="unit" class="required"
								value="${project.unit}" data-tip="���������ڵ�λ"
								data-valid="isNonEmpty" data-show="unitshow"
								data-error="���ڵ�λ����Ϊ��">
							<span style="color: red;">*</span>
							<span style="color: red;" id="unitshow"></span>
						</td>
					</tr>
					<tr>
						<td width="20%">
							������ڣ�
						</td>
						<td>
							<input type="text" id="signdate" name="signdate" class="required" onfocus="WdatePicker()"
								value="${project.signdate }" data-tip="�������������"
								data-valid="isNonEmpty" data-show="signdateshow"
								data-error="������ڲ���Ϊ��">
							<span style="color: red;">*</span>
							<span style="color: red;" id="signdateshow"></span>
						</td>
					</tr>
					<tr>
						<td width="20%">
							�����
						</td>
						<td>
							<tag:upload base="${base}" fileValue="${project.fileurl}" downname="${project.name}" 
											fileId="fileurl" fileName="fileurl"
											fileType=".*" fileCss="g_box" btnCss="box"></tag:upload>
							<span style="color: red;">*</span>
							<span style="color: red;" id="fileurlshow"></span>
						</td>
					</tr>
					
					<tr>
						<td colspan="2">
							<input type="button" value="��  ��" onclick="checkForm()" />

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

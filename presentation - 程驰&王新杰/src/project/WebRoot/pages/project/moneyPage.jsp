<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ include file="/pages/taglibs.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCClasses HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>�û�ά��</title>
		<link href="<%=basePath%>/css/page.css" rel="stylesheet"
			type="text/css" />

		<script type="text/javascript" language="javascript">
	     function checkForm(){
         var validate=$('form').validate('submitValidate');
        if( validate== true){
            var aa = window.confirm("ȷ��Ҫ�ύ��");
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

			<font color="#ffffff"><a>�ʽ���� </a> </font>

		</h3>
		<div id="user" align="center">
			<form action="${base }/servlet/ProjectServlet?method=saveMoney"
				method="post" id="myform">
				<table border="1">
					<tr>
						<td width="20%">
							��Ŀ����
						</td>
						<td>
							${project.name }
						</td>
					</tr>
					<tr>
						<td>
							�����ˣ�
						</td>
						<td>
							${project.header}
						</td>
					</tr>

					<tr>
						<td>
							��ϵ�绰��
						</td>
						<td>
							${project.tel }
						</td>
					</tr>
					<tr>
						<td>
							����ѧԺ��
						</td>
						<td>
							${project.college}
						</td>
					</tr>
					<tr>
						<td>
							��Ŀ�μ��ˣ�
						</td>
						<td>
							${project.participant }
						</td>
					</tr>
					<tr>
						<td>
							ָ����ʦ��
						</td>
						<td>
							${project.teacher }
						</td>
					</tr>
					<tr>
						<td>
							��ϵ�绰��
						</td>
						<td>
							${project.teachertel }
						</td>
					</tr>

					<tr>
						<td>
							��ʦְ�ƣ�
						</td>
						<td>
							${project.teachertitle}
						</td>
					</tr>
					<tr>
						<td>
							���ڵ�λ��
						</td>
						<td>
							${project.unit}
						</td>
					</tr>
					<tr>
						<td>
							������ڣ�
						</td>
						<td>
							${project.signdate }
						</td>
					</tr>
					<tr>
						<td>
							�����
						</td>
						<td>
							<tag:upload base="${base}" fileValue="${project.fileurl}"
								downname="${project.name}" fileId="fileurl" fileName="fileurl"
								readOnly="true" fileType=".*" fileCss="g_box" btnCss="box"></tag:upload>
						</td>
					</tr>
				</table>

				<table border="1">
					<tr>
						<th align="center">
							���
						</th>
						<th>
							��Ŀ����
						</th>
						<th>
							������
						</th>
						<th>
							�ʽ���
						</th>
						<th>
							�ʽ�����
						</th>
						<th>
							�ʽ���;
						</th>
						
						<th>
							����
						</th>
					</tr>
					<c:forEach var="item" varStatus="i" items="${listM}">
						<tr  >
							<td align="center">
								${(pagenum-1)*currentp+i.index+1}
							</td>
							<td align="center">
								${item.pname}
							</td>

							<td align="center">
								${item.header}
							</td>
							<td align="center">
								${item.money }
							</td>
							<td align="center">
								${item. givedate}
							</td>
							<td align="center">
								${item.purpose }
							</td>

							<td align="center"> 
									<a
										href="${base }/servlet/ProjectServlet?method=updatePage&id=${project.id}&mid=${item.id}&flag=3">�޸�</a>|
									<a
										href="${base }/servlet/ProjectServlet?method=deleteMoney&pid=${project.id}&id=${item.id}">ɾ��</a> 
							</td>
						</tr>
					</c:forEach>
				</table>
				<table border="1">
					<tr>
						<td width="20%">
							�ʽ��
						</td>
						<td>
							<input type="text" id="money" name="money" class="required"
								value="${money.money}" data-tip="�������ʽ���"
								data-valid="isNonEmpty||onlyInt" data-show="teachertitleshow"
								data-error="�ʽ����Ϊ��||���ֻ��������">
							<span style="color: red;">*</span>
							<span style="color: red;" id="teachertitleshow"></span>
						</td>
					</tr>
					<tr>
						<td width="20%">
							�ʽ����ڣ�
							
							<input id="pid" name="pid" value="${project.id }" type="hidden">
							
							<input id="id" name="id" value="${money.id }" type="hidden">
						</td>
						<td>
							<input type="text" id="givedate" name="givedate" class="required"
								onfocus="WdatePicker()" value="${money.givedate }"
								data-tip="�������ʽ�����" data-valid="isNonEmpty"
								data-show="signdateshow" data-error="�ʽ����ڲ���Ϊ��">
							<span style="color: red;">*</span>
							<span style="color: red;" id="signdateshow"></span>
						</td>
					</tr>
					<tr>
						<td width="20%">
							�ʽ���;��
						</td>
						<td>
							<textarea rows="5" cols="50" id="purpose" name="purpose"
								class="required" data-tip="�������ʽ���;" data-valid="isNonEmpty"
								data-show="unitshow" data-error="�ʽ���;����Ϊ��">${money.purpose}</textarea>
							<span style="color: red;">*</span>
							<span style="color: red;" id="unitshow"></span>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="��  ��" onclick="checkForm()" />
							<input class="box" type="button" value="��  ��"
								onclick="location.href='${base}/servlet/ProjectServlet?method=findAllProject&flag=3&verify=1'" />
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

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

			<font color="#ffffff"><a>��Ŀ����
			</a> </font>

		</h3>
		<div id="user" align="center">
			<form action="${base }/servlet/ProjectServlet?method=saveCheckinfo"
				method="post" id="myform">
				<table border="1">
					<tr>
						<td  width="20%">
							��Ŀ����
						</td>
						<td> 
							<input id="id" name="id" value="${project.id }" type="hidden">  
							${project.name }
						</td>
					</tr>
					<tr>
						<td >
							�����ˣ�
						</td>
						<td>
							${project.header}
						</td>
					</tr>
					
					<tr>
						<td >
							��ϵ�绰��
						</td>
						<td>
							${project.tel }
						</td>
					</tr>
					<tr>
						<td >
							����ѧԺ��
						</td>
						<td>
							${project.college}
						</td>
					</tr>
					<tr>
						<td >
							��Ŀ�μ��ˣ�
						</td>
						<td>
							${project.participant }
						</td>
					</tr>
					<tr>
						<td >
							ָ����ʦ��
						</td>
						<td>
							${project.teacher }
						</td>
					</tr>
					<tr>
						<td >
							��ϵ�绰��
						</td>
						<td>
							${project.teachertel }
						</td>
					</tr>
					
					<tr>
						<td >
							��ʦְ�ƣ�
						</td>
						<td>
							${project.teachertitle}
						</td>
					</tr>
					<tr>
						<td >
							���ڵ�λ��
						</td>
						<td>
							${project.unit}
						</td>
					</tr>
					<tr>
						<td >
							������ڣ�
						</td>
						<td>
							${project.signdate }
						</td>
					</tr>
					<tr>
						<td >
							�����
						</td>
						<td>
							<tag:upload base="${base}" fileValue="${project.fileurl}" downname="${project.name}" 
											fileId="fileurl" fileName="fileurl" readOnly="true"
											fileType=".*" fileCss="g_box" btnCss="box"></tag:upload> 
						</td>
					</tr>
					<tr>
						<td >
							���������
						</td>
						<td>
							<c:if test="${project.verify=='0'}">δ���</c:if>
								<c:if test="${project.verify=='1'}">ͨ��</c:if>
								<c:if test="${project.verify=='2'}">δͨ��</c:if>
						</td>
					</tr>
					
					<tr>
						<td width="20%">
							���������
						</td>
						<td>
							${project.check}
						</td>
					</tr>
					
					<tr>
						<td width="20%">
							���ڣ�
						</td>
						<td>
							${project.checkdate}
						</td>
					</tr>
					<tr>
						<td width="20%">
							���������
						</td>
						<td> 
							<textarea rows="5" cols="50" id="evaluate" name="evaluate" class="required"
								 data-tip="�������������"
								data-valid="isNonEmpty" data-show="unitshow" readonly="readonly"
								data-error="�����������Ϊ��">${project.evaluate}</textarea>
							<span style="color: red;">*</span>
							<span style="color: red;" id="unitshow"></span>
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

							 
						</tr>
					</c:forEach>
					<tr>
						<td colspan="6">
							 
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

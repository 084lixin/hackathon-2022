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
	    function checkForm(flag){
	    var mess="����";
         if(flag==1){
          mess="ͨ��";
         } 
            var aa = window.confirm("ȷ��Ҫ"+mess+"��");
            if (aa == true) {
            $("#verify").val(flag);
                document.forms[0].submit();
            } else {
                return false;
            
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
			<form action="${base }/servlet/ProjectServlet?method=verify"
				method="post" id="myform">
				<table border="1">
					<tr>
						<td  width="20%">
							��Ŀ����
						</td>
						<td> 
							<input id="id" name="id" value="${project.id }" type="hidden"> 
							<input id="verify" name="verify" value="0" type="hidden"> 
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
						<td colspan="2">
							<input type="button" value="ͨ  ��" onclick="checkForm(1)" />
<input type="button" value="��  ��" onclick="checkForm(2)" />
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

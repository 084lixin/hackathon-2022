<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ include file="/pages/taglibs.jsp"%>


<!DOCFile HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="${base }">

		<title>�û�����</title>
		<link href="${base }/css/list.css" rel="stylesheet"
			type="text/css" />
	</head>

	<body>
		<form action="${base }/servlet/FileServlet?method=findAllFile" method="post">  
				<div align="center" >
					<table border="1" >
					<tr >
						<th align="left" >	
							�ĵ������� 
							<input type="text" id="name" name="name" value="${file.name }"  >	 	
							<input type="text" id="flag" name="flag" value="${flag }"  >	
							<input type="submit" value="��  ��" />
						</th>
						
						<th >
						<c:if test="${flag!='2'}">
						<input type="button" onclick="location.href='${base }/servlet/FileServlet?method=addFile'" value="��  ��" /></c:if>
					<input class="box" type="button" value="�� ��"
						onClick="javascript:history.go(-1);" />
						</th>

					</tr>
					</table>
					
				</div>
		</form>
			<div align="center" id="studentlist">
				<table border="1"  >
					<tr>
						<th align="center">
							���
						</th>
						<th>
							�ļ���
						</th>
						
						<th>
							����
						</th> 
						<c:if test="${flag!='2'}">
						<th>
							����
						</th>
						</c:if>

					</tr>
					<c:forEach var="item" varStatus="i" items="${list}"> 
						<tr>
							<td>
								${(pagenum-1)*currentp+i.index+1}
							</td>
							<td width="100px;">
								<span class="codetype" >${item.name}</span>
							</td>
							
							<td>
								<a href="${base }/servlet/FileDownLoadServlet?name=${item.name}&url=${item.url}">����</a>
							</td>
							
						<c:if test="${flag!='2'}">
								<td align="center" width="100px;">
									<a
										href="${base }/servlet/FileServlet?method=updatePage&id=${item.id}">�޸�</a>|
									<a
										href="${base }/servlet/FileServlet?method=deleteFile&id=${item.id}">ɾ��</a>
								</td>
								</c:if>
							
						</tr>
					</c:forEach>
				</table>
				${pagingModel.pageLink }${pagingModel.pageInfo }
			</div>
		</form>
		
    <script type="text/javascript" src="${base }/js/data.js"></script>
		<script type="text/javascript">
		$("#myform").validate({});
		</script>
	</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ include file="/pages/taglibs.jsp"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="${base }">

		<title>�û�����</title>
		<link href="${base }/css/list.css" rel="stylesheet" type="text/css" />
	</head>

	<body>

		
<form action="${base }/servlet/UsersServlet?method=findAllUsers"
				method="post">
				<div align="center" >
					<table border="1" >
					<tr >
						<th align="left" >	
							����Ա���� 
							<input type="text" id="uname" name="uname" value="${users.uname }"  >	 	
							<input type="submit" value="��  ��" />
						</th>
						
						<th >
						<input type="button" onclick="location.href='${base }/servlet/UsersServlet?method=addUsers'" value="��  ��" />
					<input class="box" type="button" value="�� ��"
						onClick="javascript:history.go(-1);" />
						</th>

					</tr>
					</table>
					
				</div>
		</form>

		<center> 
			<table border="1">
				<tr>
					<th align="center">
							���
						</th>
						<th>
							�û�
						</th>
						<th>
							����
						</th> 
						<th>
							���
						</th> 
						<th>
						��ϵ�绰
						</th> 
						<th>
							����
						</th>
				</tr>
				<c:forEach var="item" varStatus="i" items="${list}"> 
						<tr>
							<td>
								${(pagenum-1)*currentp+i.index+1}
							</td>
							<td width="100px;">
								${item.uname}
							</td>
							
							<td>
								${item.urealname}
							</td> <td>
								<c:if test="${item.utype==1}">��ѧ����</c:if>
								<c:if test="${item.utype==2}">�쵼</c:if> 
							</td> 
							<td>
								${item.utel}
							</td> 
							
								<td align="center" width="100px;">
									<a
										href="${base }/servlet/UsersServlet?method=updatePage&uid=${item.uid}">�޸�</a>|
									<a
										href="${base }/servlet/UsersServlet?method=deleteUsers&uid=${item.uid}">ɾ��</a>
								</td>
							
						</tr>
					</c:forEach>
			</table>
			${pagingModel.pageLink }${pagingModel.pageInfo }

		</center>
	</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ include file="/pages/taglibs.jsp"%>


<!DOCStudent HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="${base }">

		<title>�༶����</title>
		<link href="${base }/css/list.css" rel="stylesheet"
			type="text/css" />
	</head>

	<body>
		<form action="${base }/servlet/ProjectServlet?method=findAllProject" method="post">
			<div align="center">
				<h1>
					��Ŀ�б�
				</h1>


			</div>
			
			
				<div align="center" >
					<table border="1" >
					<tr >
						<th align="left" >	
						���״̬:<select id="verify"  name="verify" class="required"  >
							<option value="">--״̬--</option>
							<option value="0">δ���</option>
							<option value="1">ͨ�����</option>
							<option value="2">δͨ��</option> 
							</select>
						��Ŀ���ƣ�<input type="text" id="name" name="name" value="${project.name }"  > 
						ָ����ʦ��<input type="text" id="teacher" name="teacher" value="${project.teacher}"  > 
							<input id="flag" name="flag" value="${flag }" type="hidden">		
							<script type="text/javascript"> $("#verify").val(${project.verify});</script>	 	
							<input type="submit" value="��  ��" />
						</th>
						
						<th >
						<c:if test="${flag==1}">
							<input type="button" onclick="location.href='${base }/servlet/ProjectServlet?method=addProject'" value="���" /></c:if>
					<input class="box" type="button" value="�� ��"
						onClick="javascript:history.go(-1);" />
						</th>

					</tr>
					</table>
					
				</div>
			<div align="center" id="studentlist">
				<table border="1"  >
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
							����ѧԺ
						</th>
						<th>
							ָ����ʦ
						</th> 
						
						<th>
							�������
						</th> 
						<th>
							������
						</th> 
						 
						<th>
							�������
						</th>  
						<th>
							�������
						</th>
						<th>
							����
						</th>
						<th>
							����
						</th> 
					</tr>
					<c:forEach var="item" varStatus="i" items="${list}"> 
						<tr>
							<td >
								${(pagenum-1)*currentp+i.index+1}
							</td>
							<td  >
								${item.name}
							</td>
							
							<td>
								${item.header}
							</td>
							 <td>
								${item.college }
							</td>
							<td>
								${item.teacher }
							</td>
							 <td>
								${item.signdate }
							</td>
							<td>
								${item.uname}
							</td>
							
							<td width="100px;" style="text-overflow:ellipsis;">
								${item.check }
							</td>
							<td width="100px;" style="text-overflow:ellipsis;">
								${item.evaluate }
							</td>
							<td>
								${item.checkdate}
							</td>
							<td>
								  <a
										href="${base }/servlet/ProjectServlet?method=updatePage&id=${item.id}&flag=5">�鿴</a> 
							</td>
						</tr>
					</c:forEach>
				</table>
				${pagingModel.pageLink }${pagingModel.pageInfo }
			</div>
		</form>
	</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ include file="/pages/taglibs.jsp"%>


<!DOCSysCode HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="${base }">

		<title>�û�����</title>
		<link href="${base }/css/list.css" rel="stylesheet"
			type="text/css" />
	</head>

	<body>
		<form action="${base }/servlet/SysCodeServlet?method=findAllSysCode" method="post">
			<div align="center">
				<h1>
					�����б�
				</h1>


			</div>
			
			
				<div align="center" >
					<table border="1" >
					<tr >
						<th align="left" >
							���<select id="type"  name="type"   >
							<option value="">--�������--</option>
							</select>
							<input type="submit" value="��  ��" />
						</th>
						
						<th >
							<input type="button" onclick="location.href='${base }/servlet/SysCodeServlet?method=addSysCode'" value="��  ��" />
					<input class="box" type="button" value="��  ��"
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
							�������
						</th>
						
						<th>
							����ֵ
						</th> 
						<th>
							��������
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
								<span class="codetype" >${item.type}</span>
							</td>
							<td width="100px;">
								${item.code}
							</td>
							
							<td>
								${item.name}
							</td>
							
								<td align="center" width="100px;">
									<a
										href="${base }/servlet/SysCodeServlet?method=updatePage&id=${item.id}">�޸�</a>|
									<a
										href="${base }/servlet/SysCodeServlet?method=deleteSysCode&id=${item.id}">ɾ��</a>
								</td>
							
						</tr>
					</c:forEach>
				</table>
				${pagingModel.pageLink }${pagingModel.pageInfo }
			</div>
		</form>
		
    <script type="text/javascript" src="${base }/js/data.js"></script>
		<script type="text/javascript">
		$("#myform").validate({});
		var $type=$("#type"); 
		var type_v='${syscode.type}'; 
		$(codetype.value).each(function (i){
             var $opt = $("<option>").text(codetype.pram[i]).val(this);
             if (type_v == this) {
            	$opt.attr("selected", "selected");
       		 }
              $opt.appendTo($type);
        });
    	 
		 var $codetype=$("#studentlist").find(".codetype");
		    $.each($codetype, function(index, el) {
		 	 var $el = $(el);
		 	 var value=$el.html();
            $(codetype.value).each(function (i){
             if(value==this){
             $el.html(codetype.pram[i]);
             }
        });
        });
		  
		</script>
	</body>
</html>

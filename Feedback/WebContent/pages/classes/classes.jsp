<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../util/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>课程管理</title>

<script src="resource/js/jquery-3.2.1.js"></script>
<link href="resource/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="resource/css/styles.css" rel="stylesheet">
<link rel="resource/stylesheet" href="css/stats.css">
<script
	src="resource/vendors/datatables/js/jquery.dataTables.min.js"></script>
<script src="resource/vendors/datatables/dataTables.bootstrap.js"></script>
<script src="resource/bootstrap/js/bootstrap.min.js"></script>
<script src="resource/js/custom.js"></script>
<script src="resource/js/tables.js"></script>
<script src="resource/js/entity.js" type="text/javascript"></script>
</head>
<body>
<form name="frmAction" id="frmAction" method="post" action="classAction_batchDelete">
	<div class="row">
		<div class="col-md-12">
			<div class="content-box-large">
				<div class="panel-heading">
					<!-- 显示栏目标题 -->
					<div class="panel-title">班级课程</div>
					<a class="btn btn-success btn-sm" href="classAction_insert?type=1" >新增班级</a>
					<a class="btn btn-warning btn-sm" href="javascript:;" onclick="del()" >批量删除</a>
				</div>
				<div class="panel-body">
					<div id="example_wrapper" class="dataTables_wrapper form-inline"
						role="grid">
						<table cellpadding="0" cellspacing="0" border="0"
							class="table table-striped table-bordered dataTable" id="example"
							aria-describedby="example_info">
							<thead>
								<tr role="row">
									   <!-- 遍历数据开始 -->
									   <th><input type="checkbox" name="selall" onclick="selectAll(this)" /></th> 
									   <th class="sorting" >#</th>
										<th class="sorting" >班级ID</th>
										<th class="sorting" >班级名</th>
										<th class="sorting" >开班日期</th>
										<th class="sorting" >班级状态</th>
										<th class="sorting" >辅导员</th>
										<th class="sorting" >基地名 </th>
										
									<th class="sorting" >操作</th>
								</tr>
							</thead>
							<tbody role="alert" aria-live="polite" aria-relevant="all">
								<s:iterator id="class" status="status" value="#session.classes">
									<tr class="gradeA odd">
									    <td class="sorting"><input type='checkbox' name='ids' value="<s:property value="#class.classId"/>" /></td>
										<td class="center"><s:property value="#status.index+1" /></td>
                                        <td class="center"><s:property value="#class.classId" /></td>
                                        <td class="center"><s:property value="#class.className" /></td>
                                        <td class="center"><s:property value="#class.createDate" /></td>
                                        <td class="center"><s:property value="#class.status" /></td>
                                        <td class="center">
                                        <s:iterator id="counselor" status="status" value="#request.counselors">
	                                        <s:if test="#class.users.userId==#counselor.userId">
												<s:property value="#counselor.name" />
											</s:if>
                                        </s:iterator>
	                                        
                                        </td>
                                        <td class="center">
                                        <s:iterator id="base" status="status" value="#request.bases">
                                        	<s:if test="#class.teachingBase.baseId == #base.baseId">
												<s:property value="#base.baseName"/>
											</s:if>
                                        </s:iterator>
										<td class="center"><a class="btn btn-primary btn-xs" href="classAction_insert?type=2&
										id=<s:property value="#class.classId" />
										">修改</a> 
                                        <a class="btn btn-primary btn-xs" href="classAction_delete?id=<s:property value="#course.courseId" />"
                                        onclick="return confirm('您确认删除该课程吗？')">删除</a></td>
									</tr>
								</s:iterator>

							</tbody>
       
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!--此页面为出版社管理页面，支持添加出版社和删除已有出版社，
同时显示当前存在的出版社列表。-->
<html>
<head>
<meta charset="UTF-8">
<title>出版社管理</title>
<link rel="stylesheet" href="layui/css/layui.css" media="all">
<link rel="shortcut icon" href="image/favicon.ico" type="image/x-icon" />
<style>
	body{
		background-image: url("image/xue.jpg");
        background-repeat: no-repeat;
        background-position: center center;
	}
	fieldset legend {
		color: #fff;
	}
	.grid-demo span{
	    color: #fff;
	}
</style>
</head>
<body>
	<div style="width: 700px; margin: 0 auto;">
		<div class="layui-row">
			<div class="layui-col-xs6">
				<div class="grid-demo grid-demo-bg1">
					<p>&nbsp;</p>
				</div>
			</div>
			<div class="layui-col-xs6">
				<div class="grid-demo">
					<!--当前用户信息显示-->
					<span style="margin-right: 30px">当前用户：${sessionScope.user.name }</span>
					<a class="layui-btn layui-btn-primary layui-btn-xs" href="user.do?action=showUpdate">修改密码</a> <a class="layui-btn layui-btn-primary layui-btn-xs" href="user.do?action=logout">退出登录</a>
				</div>
			</div>
		</div>
		<!--出版社管理标题-->
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
			<legend>出版社管理</legend>
		</fieldset>
		<div style="margin-left: 100px;">

			<!--添加出版社的表单-->
			<form class="layui-form layui-form-pane" action="pub.do?action=add" method="post">
				<div class="layui-form-item">
					<label class="layui-form-label">出版社</label>
					<div class="layui-input-inline">
						<input type="text" name="name" autocomplete="off" lay-verType="tips" lay-verify="required" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<div style="margin-left: 20px;">
						<button class="layui-btn" lay-submit="">添加</button>
						<a class="layui-btn layui-btn-primary layui-btn-radius" href="book.do?type=gotoindex">回主页</a>
					</div>
				</div>
			</form>
		</div>
		<!--已有的出版社列表-->
		<table class="layui-table" style="width: 450px; margin-left: 50px;">
			<colgroup>
				<col width="50">
				<col width="200">
				<col width="50">
			</colgroup>

			<!--根据出版社列表是否为空分别显示相应内容-->
			<c:if test="${empty list }">
				<div style="text-align: center; margin: auto; line-height: 100px;">
					<h1>抱歉，出版社列表不存在！</h1>
				</div>
			</c:if>
			<c:if test="${!empty list }">
				<thead>
					<tr>
						<th style="text-align: center">序号</th>
						<th style="text-align: center">出版社名称</th>
						<th style="text-align: center">操作</th>
					</tr>
				</thead>
				<tbody>
					<!--JSTL 标签 forEach，items 记录了出版社列表对象 list，
					遍历出每个出版社的名称和 ID。
					点击删除操作时，调用 confirmDel 函数，
					并传入当前操作行所属的出版社 ID。-->
					<c:forEach items="${list }" var="item" varStatus="status">
						<tr>
							<td>${status.count }</td>
							<td>${item.name }</td>
							<td><a onclick="confirmDel(${item.id })" class="layui-btn layui-btn-primary layui-btn-sm" href="#"><i class="layui-icon"></i></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</c:if>
		</table>
	</div>
	<!-- 引入 layui.js 文件 -->
	<script src="layui/layui.js" charset="utf-8"></script>
	<!--与 form 组件相关的 JavaScript-->
	<script type="text/javascript">
		layui.use(['form'], function() {
			var form = layui.form;
		});
	</script>
	<!--点击删除操作时弹出二次确认框，
	确认后调用 pub.do?action=deletebyid&id=${item.id} 进行删除操作-->
	<script type="text/javascript">
		function confirmDel(id) {
			if(window.confirm("真的要删除这个出版社吗?")){
				window.location.href="pub.do?action=deletebyid&id=" + id;
			}
		}
	</script>
</body>
</html>
		
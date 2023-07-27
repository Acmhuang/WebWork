<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--此处为出版图书管理系统的首页，提供查询、添加图书等功能。-->
<html>
<head>
<meta charset="UTF-8">
<title>出版图书管理系统</title>
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
	form label{
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
					<a class="layui-btn layui-btn-primary layui-btn-xs"
						href="user.do?action=showUpdate">修改密码</a> <a
						class="layui-btn layui-btn-primary layui-btn-xs"
						href="user.do?action=logout">退出登录</a>
				</div>
			</div>
		</div>
		<!--搜索框-->
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 20px;">
			<legend>出版图书管理系统</legend>
		</fieldset>
		<form class="layui-form" action="book.do" method="post">
			<div class="layui-form-item">
				<label class="layui-form-label">请输入书名</label>
				<div class="layui-input-inline">
					<input type="text" name="bookname" placeholder="留空查询库存图书"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<!--查询、添加-->
				<div class="layui-input-block">
					<button class="layui-btn">查询</button>
					<a class="layui-btn layui-btn-primary" href="book.do?type=gotoadd">添加</a>
				</div>
			</div>
		</form>
	</div>
	<!--引入 layui.js-->
	<script src="layui/layui.js" charset="utf-8"></script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>成功</title>
<link rel="stylesheet" href="layui/css/layui.css" media="all">
<link rel="shortcut icon" href="image/favicon.ico" type="image/x-icon" />
<style>
	body{
		background-image: url("image/xue.jpg");
        background-repeat: no-repeat;
        background-position: center center;
	}
	div h1{
		color: #fff;
	}
</style>
</head>
<body>
	<div style="text-align: center; margin: auto; line-height: 100px;">
		<%
			int s = 0;
			if (request.getAttribute("state") != null) {
				s = (int) request.getAttribute("state");
			}
			if (s == 3) {
		%>
		<h1>添加成功！</h1>
		<a class="layui-btn layui-btn-primary" href="book.do?type=gotoadd">继续添加</a>
		<a class="layui-btn layui-btn-primary layui-btn-radius"
			href="book.do?type=gotoindex">回主页</a>
		<%
			} else if (s == 4) {
		%>
		<h1>注册成功！</h1>
		<a class="layui-btn layui-btn-primary" href="user.do?action=gotologin">去登录</a>
		<%
			} else if (s == 5) {
		%>
		<h1>修改成功！</h1>
		<a class="layui-btn layui-btn-primary" href="user.do?action=gotologin">重新登录</a>
		<%
			} else if (s == 6) {
		%>
		<h1>添加成功！</h1>
		<a class="layui-btn layui-btn-primary" href="pub.do">返回</a>
		<%
			} else if (s == 7) {
		%>
		<h1>退出成功！</h1>
		<a class="layui-btn layui-btn-primary" href="book.do">返回</a>
		<%
			}
		%>
	</div>
</body>
</html>
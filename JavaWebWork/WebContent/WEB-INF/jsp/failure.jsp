<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--此处为失败页面文件，用于在添加操作失败时跳转的页面。
页面显示“添加失败！”，并提供重新添加和返回主页两个选项。-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加失败</title>
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
		<h1>添加失败！</h1>
		<a class="layui-btn layui-btn-primary" href="book.do?type=gotoadd">重新添加</a>
		<a class="layui-btn layui-btn-primary layui-btn-radius"
			href="book.do?type=gotoindex">回主页</a>
	</div>
</body>
</html>
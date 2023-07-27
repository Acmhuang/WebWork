<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户登陆</title>

<!-- 引入layui.css文件 -->
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
</style>
</head>
<body>
	<div style="width: 700px; margin: 0 auto;">
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 20px;">
			<legend>用户登陆</legend>
		</fieldset>
		<div style="margin-left: 100px;">
			<form class="layui-form layui-form-pane"
				action="user.do?action=login" method="post">
				<div class="layui-form-item">
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-inline">
						<input type="text" name="username" lay-verify="required" lay-verType="tips" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">密码</label>
					<div class="layui-input-inline">
						<input type="password" name="password" lay-verify="required" lay-verType="tips" autocomplete="off" class="layui-input">
					</div>
				</div>

				<%
					int s = 0;
					if (request.getAttribute("state") != null) {
						s = (int) request.getAttribute("state");
					}
					if (s == 1) {
				%>
				<div style="color:#eea2a4; margin: 20px">用户名不存在或密码错误</div>
				<%
					}
				%>

				<div class="layui-form-item">
					<div style="margin-left: 20px;">
					    <!-- 提交按钮，重置按钮以及跳转到注册界面的链接按钮 -->
						<p>
						    <!-- lay-filter属性同样被用于对表单中的部分元素进行过滤和修改 -->
							<button class="layui-btn" lay-submit="" lay-filter="demo1">登陆</button>
							<button type="reset" class="layui-btn layui-btn-primary">重置</button>
							&emsp;<span style="color:white;">没有账号?</span>
							<a style="color:#43b244;" href="register.jsp">去注册</a>
						</p>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- 引入layui.js文件 -->
	<script src="layui/layui.js" charset="utf-8"></script>
	<script type="text/javascript">
		layui.use([ 'form' ], function() {
			var form = layui.form;
		});
	</script>
</body>
</html>

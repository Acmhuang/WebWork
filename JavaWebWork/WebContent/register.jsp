<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户注册</title>

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
			<legend>用户注册</legend>
		</fieldset>
		<div style="margin-left: 100px;">
			<form class="layui-form layui-form-pane"
				action="user.do?action=register" method="post">
				<!--lay-verify属性表示使用form.verify函数对当前输入框进行验证，
                            验证规则为 "required" 表示不能为空-->
				<div class="layui-form-item">
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-inline">
						<input type="text" name="username" lay-verify="required"
							lay-verType="tips" autocomplete="off" class="layui-input">
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">密码</label>
					<div class="layui-input-inline">
						<input type="password" name="password" lay-verify="required"
							id="password1" lay-verType="tips" autocomplete="off"
							class="layui-input">
					</div>
				</div>
				<!--lay-verify属性表示使用form.verify函数对当前输入框进行验证，
                            验证规则为 "pass2"，表示两次输入的密码必须保持一致-->
				<div class="layui-form-item">
					<label class="layui-form-label">确认密码</label>
					<div class="layui-input-inline">
						<input type="password" name="rePwd" lay-verify="pass2"
							id="password2" lay-verType="tips" autocomplete="off"
							class="layui-input">
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">姓名</label>
					<div class="layui-input-inline">
						<input type="text" name="name" lay-verify="required"
							lay-verType="tips" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<div style="margin-left: 20px;">
						<p>
							<button class="layui-btn" lay-submit="">注册</button>
							<button type="reset" class="layui-btn layui-btn-primary">重置</button>
							&emsp;<span style="color:white;">已有账号?</span>
							<a href="index.jsp" style="color:#43b244;">去登陆</a>
						</p>
					</div>
				</div>
			</form>
		</div>
	</div>
	
	<!-- 引入layui.js文件 -->
	<script src="layui/layui.js" charset="utf-8"></script>
	<script>
	//使用form模块添加验证规则，保证确认密码框的值与密码框的值相同
		layui.use([ 'form' ], function() {
			var form = layui.form, $ = layui.$
			form.verify({
				pass2 : function(value) {
					if ($('#password1').val() != value) {
						return '两次密码不一致';
					}
				}
			});
		});
	</script>
</body>
</html>
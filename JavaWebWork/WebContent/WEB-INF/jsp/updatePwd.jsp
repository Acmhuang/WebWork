<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改密码</title>
<!-- 引入 layui.css 文件 -->
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
          <!--展示当前的用户名称，并提供修改密码和退出登录两个功能-->
					<span style="margin-right: 30px">当前用户：${sessionScope.user.name }</span>
					<a class="layui-btn layui-btn-primary layui-btn-xs"
						href="user.do?action=showUpdate">修改密码</a> 
          <a class="layui-btn layui-btn-primary layui-btn-xs"
						href="user.do?action=logout">退出登录</a>
				</div>
			</div>
		</div>
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
			<legend>修改密码</legend>
		</fieldset>
          <!--表单内容-->
		<div style="margin-left: 100px;">
			<form class="layui-form layui-form-pane" action="user.do?action=updatePwd" method="post">
				<div class="layui-form-item">
					<label class="layui-form-label">用户名</label>
          <!--展示当前用户的用户名，设置为只读，不可修改-->
					<div class="layui-input-inline">
						<input type="text" name="username" class="layui-input" value="${sessionScope.user.username }" style="cursor: not-allowed" readonly>
					</div>
				</div>
          
				<div class="layui-form-item">
					<label class="layui-form-label">新密码</label>
					<div class="layui-input-inline">
						<input type="password" name="password" lay-verify="required" id="password1" lay-verType="tips" autocomplete="off" class="layui-input">
            <!--lay-verify属性表示使用form.verify函数对当前输入框进行验证，
                     验证规则为 "required" 表示不能为空-->
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">确认密码</label>
					<div class="layui-input-inline">
						<input type="password" name="rePwd" lay-verify="pass2" id="password2" lay-verType="tips" autocomplete="off" class="layui-input">
            <!--lay-verify属性表示使用form.verify函数对当前输入框进行验证，
                     验证规则为 "pass2"，表示两次输入的密码必须保持一致-->
					</div>
				</div>
				
				<div class="layui-form-item">
					<div style="margin-left: 20px;">
              <!--提交按钮、重置按钮和跳转到主页的功能按钮-->
						<button class="layui-btn" lay-submit="">确认修改</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
						<a class="layui-btn layui-btn-primary layui-btn-radius" href="book.do?type=gotoindex">回主页</a>
					</div>
				</div>
			</form>
		</div>
	</div>
    <!-- 引入 layui.js 文件 -->
	<script src="layui/layui.js" charset="utf-8"></script>
    <!--与 form 组件相关的 JavaScript-->
	<script>
		layui.use([ 'form' ], function() {
        //form代表form模块，$代表LayUI中的JQuery库。
			var form = layui.form, $ = layui.$
			form.verify({
				pass2 : function(value) {
            //使用form.verify函数对输入框进行验证，使两次密码输入一致。
					if ($('#password1').val() != value) {
						return '两次密码不一致';
					}
				}
			});
		});
	</script>
</body>
</html>

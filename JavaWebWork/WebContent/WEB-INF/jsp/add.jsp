<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!--此处为图书添加页面，提供书名、作者、出版社、价格四项输入，
支持出版社列表单选和添加新出版社。-->
<html>
<head>
<meta charset="UTF-8">
<title>图书添加</title>

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
					<!--当前用户信息显示-->
					<span style="margin-right: 30px">当前用户：${sessionScope.user.name }</span>
					<a class="layui-btn layui-btn-primary layui-btn-xs" href="user.do?action=showUpdate">修改密码</a> 
                    <a class="layui-btn layui-btn-primary layui-btn-xs" href="user.do?action=logout">退出登录</a>
				</div>
			</div>
		</div>
		<!--图书添加标题-->
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
			<legend>图书添加</legend>
		</fieldset>
		<div style="margin-left: 100px;">
			<!--添加图书表单-->
			<form class="layui-form layui-form-pane" action="book.do?action=add" method="post">
				<div class="layui-form-item">
					<label class="layui-form-label">书名</label>
					<div class="layui-input-inline">
						<input type="text" name="bookName" autocomplete="off" lay-verType="tips" lay-verify="required" class="layui-input">
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">作者</label>
					<div class="layui-input-inline">
						<input type="text" name="author" autocomplete="off" lay-verType="tips" lay-verify="required" class="layui-input">
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">出版社</label>
					<div class="layui-input-inline">
						<select name="pub" required>
							<option value="">请选择出版社</option>
							
							<!--JSTL 标签 forEach，
							items 记录了出版社列表对象 pubList，
							遍历出每个出版社的 name -->
							<c:forEach var="item" items="${pubList }">
								<option value="${item.name }">${item.name }</option>
							</c:forEach>
						</select> 
                        
                        <span style="color:white;">没有您要的出版社?点击</span>
                        <a style="color:#43b244;" href="pub.do">管理</a>
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">价格</label>
					<div class="layui-input-inline">
						<input type="text" name="price" autocomplete="off" lay-verType="tips" lay-verify="required" class="layui-input">
					</div>
				</div>

				<div class="layui-form-item">
					<!--操作按钮：添加、重置、回首页-->
					<div style="margin-left: 20px;">
						<button class="layui-btn" lay-submit="">添加</button>
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
	<script type="text/javascript">
		layui.use([ 'form' ], function() {
			var form = layui.form;
		});
	</script>
</body>
</html>

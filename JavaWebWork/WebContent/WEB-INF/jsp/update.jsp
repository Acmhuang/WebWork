<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8"> 
<title>图书修改</title>
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
					<!--获取当前用户的姓名并显示在页面上，
					点击“修改密码”和“退出登录”按钮会触发相应的操作。-->
					<span style="margin-right: 30px">当前用户：${sessionScope.user.name }</span> 
					<a class="layui-btn layui-btn-primary layui-btn-xs"
						href="user.do?action=showUpdate">修改密码</a> 
					<a class="layui-btn layui-btn-primary layui-btn-xs"
						href="user.do?action=logout">退出登录</a> 
				</div>
			</div>
		</div>
		<!--使用layui表单模块，构建读者信息的修改表单，
		包含"书名"、"作者"、"出版社"、"价格"四个字段。-->
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 20px;">
			<legend>图书修改</legend>
		</fieldset>
		<div style="margin-left: 100px;" class="layui-form" lay-filter="test">
			<form class="layui-form layui-form-pane"
				action="book.do?action=update" method="post">
				<!--定义隐藏表单域，用于存储图书的id值-->
				<input type="hidden" name="id" value="${book.id }">
				<div class="layui-form-item">
					<label class="layui-form-label">书名</label>
					<div class="layui-input-inline">
						<input type="text" name="bookName" value="${book.bookName }"
							autocomplete="off" class="layui-input" lay-verType="tips"
							lay-verify="required">
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">作者</label>
					<div class="layui-input-inline">
						<input type="text" name="author" value="${book.author }"
							autocomplete="off" class="layui-input" lay-verType="tips"
							lay-verify="required">
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">出版社</label>
					<div class="layui-input-inline selects">
						<select name="pub" id="pub" lay-verify="required">
							<!--循环遍历后台传递过来的所有出版社信息，并通过下拉框展示出来。
							同时提供管理按钮，用于添加新的出版社信息-->
							<option value="${book.pub }">${book.pub }(未改)</option>
							<c:forEach var="item" items="${pubList }">
								<option value="${item.name }">${item.name }</option>
							</c:forEach>
						</select> <span style="color:white;">没有您要的出版社?点击</span>
						<a style="color:#43b244;" href="pub.do">管理</a>
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">价格</label>
					<div class="layui-input-inline">
						<input type="text" name="price" value="${book.price }"
							autocomplete="off" class="layui-input" lay-verType="tips"
							lay-verify="required">
					</div>
				</div>

				<div class="layui-form-item">
					<div style="margin-left: 20px;">
						<button class="layui-btn" lay-submit="">立即修改</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
						<a class="layui-btn layui-btn-primary layui-btn-radius"
							href="book.do?type=gotoindex">回主页</a>
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

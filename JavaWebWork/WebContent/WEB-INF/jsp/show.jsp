<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查询结果</title>
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
        <!-- 顶部用户信息栏 -->
        <div class="layui-row">
            <!--左侧填充空白的栅格列-->
            <div class="layui-col-xs6">
                <div class="grid-demo grid-demo-bg1">
                    <p>&nbsp;</p>
                </div>
            </div>
            <!--右侧用户信息栏-->
            <div class="layui-col-xs6">
                <div class="grid-demo">
                    <!--显示当前用户-->
                    <span style="margin-right: 30px">当前用户：${sessionScope.user.name }</span>
                    <!--修改密码-->
                    <a class="layui-btn layui-btn-primary layui-btn-xs"
                       href="user.do?action=showUpdate">修改密码</a>
                    <!--退出登录-->
                    <a class="layui-btn layui-btn-primary layui-btn-xs"
                       href="user.do?action=logout">退出登录</a>
                </div>
            </div>
        </div>

        <!--查询结果区域-->
        <fieldset class="layui-elem-field layui-field-title"
                  style="margin-top: 20px;">
            <legend>查询结果</legend>
        </fieldset>
        <div class="layui-form">
            <form id="myForm" class="layui-form" action="book.do?action=delete"
                  method="post">
                <!--判断是否有数据-->
                <c:if test="${empty list }">
                    <div style="text-align: center; margin: auto; line-height: 100px;">
                        <h1>抱歉，当前没有可以显示的数据！</h1>
                    </div>
                </c:if>
                <!--展示数据-->
                <c:if test="${!empty list }">
                    <!--数据表格-->
                    <table class="layui-table">
                        <colgroup>
                            <col width="60">
                            <col width="60">
                            <col width="150">
                            <col width="95">
                            <col width="150">
                            <col width="80">
                            <col width="105">
                        </colgroup>
                        <!--表头-->
                        <thead>
                            <tr>
                                <th style="text-align: center">选择</th>
                                <th style="text-align: center">序号</th>
                                <th style="text-align: center">书名</th>
                                <th style="text-align: center">作者</th>
                                <th style="text-align: center">出版社</th>
                                <th style="text-align: center">价格</th>
                                <th style="text-align: center">操作</th>
                            </tr>
                        </thead>
                        <!--数据行-->
                        <tbody>
                            <c:forEach items="${list }" var="item" varStatus="status">
                                <tr>
                                    <!--选择checkbox-->
                                    <td><input type="checkbox" name="ids" value="${item.id }" lay-skin="primary"></td>
                                    <!--序号-->
                                    <td>${status.count }</td>
                                    <!--书名-->
                                    <td>${item.bookName }</td>
                                    <!--作者-->
                                    <td>${item.author }</td>
                                    <!--出版社-->
                                    <td>${item.pub }</td>
                                    <!--价格-->
                                    <td>${item.price }</td>
                                    <!--操作按钮-->
                                    <td><div id="editBtn">
                                            <!--删除按钮-->
											<a data-method="confirm" data-id="${item.id }" class="layui-btn layui-btn-primary layui-btn-xs"><i class="layui-icon"></i></a>
                                            <!--查看按钮-->
                                            <a class="layui-btn layui-btn-primary layui-btn-xs" href="book.do?action=querybyid&id=${item.id }"><i class="layui-icon"></i></a>
                                        </div></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <!--操作按钮组-->
                    <div class="layui-form-item">
                        <input type="button" id="allBook" value="全选" class="layui-btn layui-btn-primary layui-btn-sm"><input
                                type="button" id="backBook" value="反选" class="layui-btn layui-btn-primary layui-btn-sm">
                        <a id="delete" class="layui-btn layui-btn-primary layui-btn-sm" name="delete">删除选中</a>
                    </div>
                </c:if>
            </form>
        </div>
    </div>
    <!--下方功能按钮-->
    <div class="layui-form-item"
         style="text-align: center; margin: 0 auto;">
        <a class="layui-btn layui-btn-primary" href="book.do?type=gotoadd">添加</a>
        <a class="layui-btn layui-btn-primary layui-btn-radius"
           href="book.do?type=gotoindex">回主页</a>
    </div>
    <!-- 引入 layui.js 文件 -->
    <script src="layui/layui.js" charset="utf-8"></script>
    <!--与组件相关的 JavaScript-->
    <script type="text/javascript">
        layui.use([ 'form', 'layedit', 'laydate', 'layer' ], function() {
            var form = layui.form, $ = layui.jquery, layer = layui.layer;
            var active = {
                confirm : function(othis) {
                    //删除按钮点击事件
                    layer.confirm('真的要删除这本书吗?', {
                        icon : 3,
                        title : '警告'
                    }, function(index) {
                        var id = othis.data('id');
                        window.location.href = "book.do?action=deletebyid&id=" + id;
                        layer.close(index);
                    });
                }
            };
            //给删除按钮绑定事件
            $('#editBtn .layui-btn').on('click', function() {
                var othis = $(this), method = othis.data('method');
                active[method] ? active[method].call(this, othis) : '';
            });
            //删除选中的数据
            $("#delete").click(function() {
                // 判断是否有复选框被选中
                if ($("input[type=checkbox]:checked").length <= 0) {
                    layer.msg('还未选中任意图书', {
                        icon: 2,
                        time: 2000
                    });
                    return false;
                }
                //提示框
                layer.confirm('真的要删除这些书吗?', {
                    icon : 3,
                    title : '警告'
                }, function(index) {
                    $('#myForm').submit();
                    layer.close(index);
                });
            });
            //全选按钮
            $('#allBook').click(function() {
                $("input[type=checkbox]").each(function() {
                    this.checked = true;
                })
                form.render('checkbox');
            });
            //反选按钮
            $('#backBook').click(function() {
                $("input[type=checkbox]").each(function() {
                    this.checked = !this.checked;
                })
                form.render('checkbox');
            });
        });
    </script>
</body>
</html>

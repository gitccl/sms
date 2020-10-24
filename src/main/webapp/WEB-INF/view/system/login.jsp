<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录学生信息管理系统</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>

    <link href="${pageContext.request.contextPath}/static/layui/css/layui.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/layui/css/xadmin.css" rel="stylesheet">
</head>
<body class="login-bg">

<div class="login layui-anim layui-anim-up">
    <div class="message">欢迎登录学生信息管理系统</div>
    <div id="darkbannerwrap"></div>
    <div class="layui-form">
        <hr class="hr15">
        <input id="loginName" name="username"  placeholder="用户名" type="text" lay-verify="required" class="layui-input">
        <hr class="hr15">
        <input id="password" name="password" lay-verify="required" placeholder="密码" type="password" class="layui-input">
        <hr class="hr15">
        <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
        <hr class="hr20">
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
<script src="${pageContext.request.contextPath}/static/layui/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/js/xadmin.js"></script>
<script>
    $(function () {
        layui.use('form', function () {
            const form = layui.form;
            form.on('submit(login)', function (data) {
                const formData = data.field;
                console.log(formData);
                $.ajax({
                    url: "${pageContext.request.contextPath}/system/login",
                    data: formData,
                    method: "post",
                    async: true,
                    success: function (result) {
                        console.log(result);
                        if (result.success) {
                            layer.msg("登录成功");
                            window.location.href = "${pageContext.request.contextPath}/system/goMain";
                        } else {
                            layer.msg("登录失败");
                        }
                    },
                    error: function () {
                        layer.msg("登录失败");
                    }
                })
            })
        });
    })
</script>
</body>
</html>
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

<div class="login layui-anim layui-anim-up" style="width: 800px;">
    <div class="message">欢迎登录学生信息管理系统</div>
    <div id="darkbannerwrap"></div>
    <div class="layui-form">
        <div class="layui-form-item">
            <input id="loginName" name="id" placeholder="用户名" type="text" lay-verify="required" class="layui-input">
        </div>
        <div class="layui-form-item">
            <input id="password" name="password" lay-verify="required" placeholder="密码" type="password" class="layui-input">
        </div>
        <div class="layui-form-item ">
            <input name="verCode" lay-verify="required|captcha" placeholder="验证码" type="text"
                   class="layui-input-inline" style="width: 150px;">
            <div class="captcha-img">
                <img src="${pageContext.request.contextPath}/system/getCaptcha" title="点击图片切换验证码" id="captcha" width="130px" height="50px" style="margin-left: 20px">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-inline" style="width: 350px;">
                <input type="radio" name="userType" title="管理员"  checked="" value="1">
                <input type="radio" name="userType" title="教师"  value="2">
                <input type="radio" name="userType" title="学生"  value="3">
            </div>
        </div>
        <div class="layui-form-item">
            <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
        </div>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
<script src="${pageContext.request.contextPath}/static/layui/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/js/xadmin.js"></script>
<script>
    $(function () {

        $("#captcha").click(function () {
            this.src = "${pageContext.request.contextPath}/system/getCaptcha?t=" + new Date().getTime();
        });


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
                        layer.msg(result.msg);
                        if (result.success) {
                            window.location.href = "${pageContext.request.contextPath}/system/goMain";
                        } else {
                            /* 切换验证码，并清空输入框 */
                            $("#captcha").click();
                            $("input[name=verCode]").val("");
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
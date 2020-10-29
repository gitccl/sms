<%--
  Created by IntelliJ IDEA.
  User: c1515
  Date: 2020/10/28
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>个人信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link href="${pageContext.request.contextPath}/static/layui/css/xadmin.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/layui/css/layui.css" rel="stylesheet"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/xadmin.js"></script>
</head>
<body>
<div class="editInformation" id="editInformation" style="margin-left: 100px">
    <br>
    <form class="layui-form layui-form-pane" id="editForm" lay-filter="editform">
        <div class="layui-form-item">
            <label class="layui-form-label" id="idText">学号</label>
            <div class="layui-input-inline">
                <input type="text" id="id" name="id" required lay-verify="required" autocomplete="off"
                       class="layui-input" readonly>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input type="text" id="password" name="password" required lay-verify="required" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input type="text" id="name" name="name" required lay-verify="required" autocomplete="off"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label" id="telLabel">电话</label>
            <div class="layui-input-inline">
                <input type="text" id="tel" name="tel" required lay-verify="required|phone|number" autocomplete="off"
                       class="layui-input">
            </div>
        </div>

        <%-- 只有管理员有该字段 --%>
        <c:if test="${userType == 1}">
            <div class="layui-form-item">
                <label class="layui-form-label" id="emailLabel">邮箱</label>
                <div class="layui-input-inline">
                    <input type="text" id="email" name="email" required lay-verify="required|email" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </c:if>

        <c:if test="${userType == 3}">
            <div class="layui-form-item">
                <label class="layui-form-label" id="gradeLabel">年级</label>
                <div class="layui-input-inline">
                    <input type="text" id="grade" name="grade" required lay-verify="required|number" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </c:if>
        <c:if test="${userType > 1}">
            <div class="layui-form-item">
                <label class="layui-form-label" id="deptLabel">院系</label>
                <div class="layui-input-inline">
                    <input type="text" id="dept" name="dept" required lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </c:if>
        <c:if test="${userType == 3}">
            <div class="layui-form-item">
                <label class="layui-form-label" id="ofClassLabel">班级</label>
                <div class="layui-input-inline">
                    <input type="text" id="ofClass" name="ofClass" required lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </c:if>

        <c:if test="${userType == 3}">
            <div class="layui-form-item">
                <label class="layui-form-label" id="majorLabel" hidden>专业</label>
                <div class="layui-input-inline" hidden>
                    <input type="text" id="major" name="major" required lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </c:if>

        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input name="sex" title="男" id="man" type="radio" checked="" value="男">
                <input name="sex" title="女" id="woman" type="radio" value="女">
            </div>
        </div>
        <div class="layui-form-item" style="text-align: center;">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="edit">保存</button>
            </div>
        </div>
    </form>
</div>

<script>
    function logout(){
        setTimeout("top.location.href = '${pageContext.request.contextPath}/system/goLogout'", 1000 );
    }
    $(function () {
        layui.use(['table', 'form', 'layer'], function () {
            let table = layui.table,
                form = layui.form,
                layer = layui.layer;
            $.ajax({
                url: "${pageContext.request.contextPath}/system/getUserInfo",
                method: "post",
                dataType: "json",
                success: function (data) {
                    var userInfo = data.userInfo;
                    var userType = ${sessionScope.userType};
                    if(userType != 3) {
                        $("#idText").text("工号");
                    }
                    /* 渲染表单 */
                    form.val("editform", userInfo);
                }
            });
            form.on("submit(edit)", function (data) {
                $.ajax({
                    <c:choose>
                        <c:when test="${userType == 1 }">
                        url: "${pageContext.request.contextPath}/admin/updateAdmin",
                        </c:when>
                        <c:when test="${userType == 2 }">
                        url: "${pageContext.request.contextPath}/teacher/updateTeacher",
                        </c:when>
                        <c:when test="${userType == 3}">
                        url: "${pageContext.request.contextPath}/student/updateStudent",
                        </c:when>
                    </c:choose>
                    method: "post",
                    data: data.field,
                    dataType: "json",
                    success: function (result) {
                        if (result.success) {
                            layer.msg("修改成功, 请重新登录");
                            logout();
                        } else{
                            layer.msg(result.msg);
                        }

                    },
                    error: function () {
                        layer.msg("修改失败！");
                    }
                });
                return false;
            })
        })



    })


</script>

</body>
</html>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>学生信息管理系统</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link href="${pageContext.request.contextPath}/static/layui/css/xadmin.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/xadmin.js"></script>
</head>
<body>
<!-- 顶部开始 -->
<div class="container">
    <div class="logo"><a href="/">学生信息管理系统-V1.0</a></div>
    <div class="left_open">
        <i title="展开左侧栏" class="iconfont">&#xe699;</i>
    </div>
    <ul class="layui-nav left fast-add" lay-filter="">
    </ul>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;" id="user"></a>
            <dl class="layui-nav-child">
                <!-- 二级菜单 -->
                <dd><a href="${pageContext.request.contextPath}/system/goLogout">退出</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item to-index"><a href="${pageContext.request.contextPath}/system/goMain">前台首页</a></li>
    </ul>

</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6b8;</i>
                    <cite>学生管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="${pageContext.request.contextPath}/student/goStudentManage">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>学生信息</cite>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe723;</i>
                    <cite>课程信息管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="${pageContext.request.contextPath}/course/goCourseManage">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>课程管理</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="${pageContext.request.contextPath}/grade/goGradeManage">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>选课管理</cite>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe723;</i>
                    <cite>成绩管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="${pageContext.request.contextPath}/grade/goExamManage">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>学生成绩</cite>
                        </a>
                    </li>
                </ul>
            </li>

        </ul>
    </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 -->
<!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
        <ul class="layui-tab-title">
            <li class="home"><i class="layui-icon">&#xe68e;</i>我的桌面</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <%-- 无法直接访问WEB-INF下的内容，借助Controller跳转 --%>
                <iframe src="${pageContext.request.contextPath}/system/goWelcome" frameborder="0" scrolling="yes" class="x-iframe" id="main"></iframe>
            </div>
        </div>
    </div>
</div>
<div class="page-content-bg">

</div>
<!-- 右侧主体结束 -->
<!-- 中部结束 -->
<!-- 底部开始 -->
<div class="footer">
    <div class="copyright">Copyright ©2020 学生信息管理系统 v1.0 All Rights Reserved</div>
</div>
<!-- 底部结束 -->
</body>
<script>
    $(function () {
        let userType = ${sessionScope.userType};
        console.log("main: " + typeof (userType) + userType);
        if(userType == 1){
            $("#user").text("admin");
            $("#studentInfo").css("display","none");
            $("#updatePassword").css("display","none");
            $("#stuInfo").css("display","none");
        }else{
            $("#user").text("${sessionScope.student.name}");
        }
    })
</script>
</html>


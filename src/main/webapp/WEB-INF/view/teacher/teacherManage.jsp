<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>教师信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link href="${pageContext.request.contextPath}/static/layui/css/xadmin.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/layui/css/layui.css" rel="stylesheet"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/xadmin.js"></script>
</head>
<body class="layui-anim layui-anim-up">

<div class="x-body">
    <table class="layui-table" id="teacherTable" lay-filter="useruv"></table>
</div>

<%-- 增加教师弹窗 ---%>
<div class="teacherform" id="addteacher" hidden="hidden">
    <br>
    <form class="layui-form layui-form-pane">
        <div class="layui-form-item">
            <label class="layui-form-label">工号</label>
            <div class="layui-input-inline">
                <input type="text" name="id" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input type="text" name="password" required lay-verify="required" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input type="text" name="name" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
            <label class="layui-form-label">电话</label>
            <div class="layui-input-inline">
                <input type="text" name="tel" required lay-verify="required|phone|number" autocomplete="off"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">院系</label>
            <div class="layui-input-inline">
                <input type="text" name="dept" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
            <label class="layui-form-label">性别</label>
            <div class="layui-input-inline">
                <input name="sex" title="男" type="radio" checked="" value="男">
                <input name="sex" title="女" type="radio" value="女">
            </div>
        </div>

        <div class="layui-form-item" style="text-align: center;">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="addTeacher">保存</button>
                <button type="button" class="layui-btn layui-btn-danger" id="btn-add-close">关闭</button>
            </div>
        </div>
    </form>
</div>
<%-- 编辑教师弹窗 --%>
<div class="editTeacherForm" id="editTeacher" hidden="hidden">
    <br>
    <form class="layui-form layui-form-pane" id="editTeacherForm" lay-filter="editform">
        <div class="layui-form-item">
            <label class="layui-form-label">工号</label>
            <div class="layui-input-inline">
                <input type="text" name="id" required lay-verify="required" autocomplete="off"
                       class="layui-input" readonly>
            </div>
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input type="text" name="password" required lay-verify="required" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input type="text" name="name" required lay-verify="required" autocomplete="off"
                       class="layui-input">
            </div>
            <label class="layui-form-label">电话</label>
            <div class="layui-input-inline">
                <input type="text" name="tel" required lay-verify="required|phone|number" autocomplete="off"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">院系</label>
            <div class="layui-input-inline">
                <input type="text" name="dept" required lay-verify="required" autocomplete="off"
                       class="layui-input">
            </div>
            <label class="layui-form-label">性别</label>
            <div class="layui-input-inline">
                <input name="sex" title="男" id="man" type="radio" checked="" value="男">
                <input name="sex" title="女" id="woman" type="radio" value="女">
            </div>
        </div>
        <div class="layui-form-item" style="text-align: center;">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="editTeacher">保存</button>
                <button type="button" class="layui-btn layui-btn-danger" id="btn-edit-close">关闭</button>
            </div>
        </div>
    </form>
</div>

<script type="text/html" id="bar">
    <a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="update">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="del">删除</a>
</script>

<script type="text/html" id="toolbar">
    <button class="layui-btn layui-btn-danger" lay-event="refresh"><i class="layui-icon">&#xe669</i>刷新</button>
    <button class="layui-btn" lay-event="add" id="add"><i class="layui-icon">&#xe61f;</i>添加教师</button>

    <input type="text" name="id" id="teacherId" placeholder="请输入教师工号" autocomplete="off" class="layui-input"
           style="display:inline-block;width:150px; padding-left: 10px; margin-left: 10px;">
    <input type="text" name="teacherName" id="teacherName" placeholder="请输入教师姓名" autocomplete="off" class="layui-input"
           style="display:inline-block;width:150px; padding-left: 10px; margin-left: 10px;">
    <input type="text" name="teacherDept" id="teacherDept" placeholder="请输入教师所在院系" autocomplete="off" class="layui-input"
           style="display:inline-block;width:150px; padding-left: 10px; margin-left: 10px;">

    <button class="layui-btn" lay-submit="" lay-event="search" style="margin-left: 15px"><i class="layui-icon">&#xe615;</i></button>
</script>


<script>
    $(function () {
        //表格渲染
        layui.use(['table', 'form', 'layer'], function () {
            const table = layui.table,
                form = layui.form,
                layer = layui.layer;
            let teacherTable = table.render({
                elem: '#teacherTable'
                , url: '${pageContext.request.contextPath}/teacher/getTeacherList'
                , cellMinWidth: 60
                , height: 550
                , toolbar: '#toolbar'
                , cols: [[
                      {field: 'id', title: '工号', sort: true}
                    , {field: 'password', title: '密码', align: 'center'}
                    , {field: 'name', title: '姓名', align: 'center'}
                    , {field: 'sex', title: '性别', align: 'center'}
                    , {field: 'tel', title: '联系电话', align: 'center'}
                    , {field: 'dept', title: '院系',  align: 'center'}
                    , {field: 'one', title: '操作', align: 'center', fixed: 'right', toolbar: '#bar'}
                ]]
                , page: true
                , limits: [5, 10, 15, 20]
                , limit: 10
                , done: function (res, curr, count) {
                }
            });

            //监听工具栏
            table.on('toolbar(useruv)', function (obj) {
                switch (obj.event) {
                    /* 添加 */
                    case 'add':
                        layer.open({
                            type: 1,
                            area: ['650px', '400px'],
                            shadeClose: true,
                            closeBtn: 1, //显示关闭按钮
                            title: '添加教师信息',
                            content: $("#addteacher"),
                        });
                        break;
                    /* 刷新表格 */
                    case 'refresh':
                        teacherTable.reload();
                        break;
                    //根据学号查找
                    case 'search':
                        var preId = $("#teacherId").val();
                        var preName = $("#teacherName").val();
                        var preDept = $("#teacherDept").val();

                        table.reload('teacherTable', {
                            url: '${pageContext.request.contextPath}/teacher/getTeacherList',
                            where: {
                                id: $("#teacherId").val(),
                                name: $("#teacherName").val(),
                                dept: $("#teacherDept").val()
                            },
                            page: {
                                /* 重新从第一页开始查询 */
                                curr: 1
                            },
                            done: function (res, curr, count) {
                                /* 填充搜索框 */
                                console.log("查询done!");
                                $("#teacherId").val(preId);
                                $("#teacherName").val(preName);
                                $("#teacherDept").val(preDept);
                            }
                        });
                        break;
                }
            });

            //监听表格行内工具栏
            table.on('tool(useruv)', function (obj) {
                var data = obj.data;
                if (obj.event === 'del') {
                    layer.confirm('真的删除行么', function (index) {
                        $.ajax({
                            url: "${pageContext.request.contextPath}/teacher/deleteTeacher",
                            method: "GET",
                            traditional: true,
                            data: {"id": data.id },
                            success: function (result) {
                                if(result.success) {
                                    obj.del();
                                }
                                layer.msg(result.msg);
                            },
                            error: function () {
                                layer.msg("出错了......");
                            }
                        });
                        layer.closeAll();
                    });
                } else if (obj.event === 'update') {
                    console.log(data);
                    layer.open({
                        type: 1,
                        area: ['650px', '400px'],
                        shadeClose: true,
                        closeBtn: 1, //显示关闭按钮
                        title: '编辑教师信息',
                        content: $("#editTeacher"),
                    });
                    form.val('editform', data);
                }
            });
            //窗口关闭方法集
            $("#btn-add-close").click(function () {
                layer.closeAll();
            });
            $("#btn-edit-close").click(function () {
                layer.closeAll();
            });
            //监听添加提交
            form.on('submit(addTeacher)', function (data) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/teacher/addTeacher",
                    method: "post",
                    data: data.field,
                    dataType: "json",
                    success: function (data) {
                        if (data.success) {
                            teacherTable.reload();
                            layer.closeAll();
                        }
                        layer.msg(data.msg);
                    },
                    error: function () {
                        layer.msg("添加失败！");
                    }
                });
                return false;
            });
            //监听修改提交
            form.on('submit(editTeacher)', function (data) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/teacher/updateTeacher",
                    method: "post",
                    data: data.field,
                    dataType: "json",
                    success: function (data) {
                        if (data.success) {
                            teacherTable.reload();
                            layer.closeAll();
                        }
                        layer.msg(data.msg);
                    },
                    error: function () {
                        layer.msg("修改失败！");
                    }
                });
                return false;
            });
        });
    })
</script>
</body>

</html>

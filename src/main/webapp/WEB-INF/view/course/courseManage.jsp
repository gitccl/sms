<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link href="${pageContext.request.contextPath}/static/layui/css/xadmin.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/layui/css/layui.css" rel="stylesheet"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.js"
            charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/xadmin.js"></script>
</head>
<body class="layui-anim layui-anim-up">
<div class="x-body">
    <table class="layui-table" id="courseTable" lay-filter="useruv"></table>
</div>
<%-- 增加课程弹窗 --%>
<div class="courseform" id="addCourse" hidden="hidden">
    <br>
    <form class="layui-form layui-form-pane" id="studentform">
        <div class="layui-form-item">
            <label class="layui-form-label">课程号</label>
            <div class="layui-input-inline">
                <input type="text" name="id" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
            <label class="layui-form-label">课程名</label>
            <div class="layui-input-inline">
                <input type="text" name="name" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">讲师</label>
            <div class="layui-input-inline">
                <select lay-verify="required" name="teacherId" class="teacherSelect" lay-search>
                    <option value="">请选择</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">上课地址</label>
            <div class="layui-input-inline">
                <input type="text" name="address" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
            <label class="layui-form-label">学分</label>
            <div class="layui-input-inline">
                <input type="text" name="credit" required lay-verify="required|number" autocomplete="off"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item" style="text-align: center;">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="addCourse"
                        style="margin: 30px;">保存
                </button>
                <button type="button" class="layui-btn layui-btn-danger" id="btn-add-close"
                        style="margin: 30px;">关闭
                </button>
            </div>
        </div>
    </form>
</div>
<%-- 编辑课程弹窗 --%>
<div class="editCourseForm" id="editCourse" hidden="hidden">
    <br>
    <form class="layui-form layui-form-pane" id="courseForm" lay-filter="editform">
        <div class="layui-form-item">
            <label class="layui-form-label">课程号</label>
            <div class="layui-input-inline">
                <input type="text" name="id" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
            <label class="layui-form-label">课程名</label>
            <div class="layui-input-inline">
                <input type="text" name="name" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">讲师</label>
            <div class="layui-input-inline">
                <select lay-verify="required" name="teacherId" class="teacherSelect" lay-search>
                    <option value="">请选择</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">上课地址</label>
            <div class="layui-input-inline">
                <input type="text" name="address" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
            <label class="layui-form-label">学分</label>
            <div class="layui-input-inline">
                <input type="text" name="credit" required lay-verify="required|number" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" style="text-align: center;">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="editCourse" style="margin: 30px;">保存</button>
                <button type="button" class="layui-btn layui-btn-danger" id="btn-edit-close" style="margin: 30px;">关闭</button>
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
    <button class="layui-btn" lay-event="add" id="add"><i class="layui-icon">&#xe61f;</i>添加</button>
    <input type="text" name="courseName" id="courseName" placeholder="请输入课程名" autocomplete="off" class="layui-input"
           style="display:inline-block;width:200px; padding-left: 10px; margin-left: 10px;">
    <input type="text" name="teacherName" id="teacherName" placeholder="请输入教师姓名" autocomplete="off" class="layui-input"
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
            const courseTable = table.render({
                elem: '#courseTable'
                , url: '${pageContext.request.contextPath}/course/getCourseList'
                , cellMinWidth: 80
                , height: 500
                , toolbar: '#toolbar'
                , cols: [[
                    {field: 'id', title: '课程号', sort: true}
                    , {field: 'name', title: '课程名', align: 'center'}
                    , {field: 'teacherName', title: '任课教师', align: 'center'}
                    , {field: 'address', title: '上课地点', align: 'center'}
                    , {field: 'credit', title: '学分', align: 'center'}
                    , {field: 'one', title: '操作', align: 'center', fixed: 'right', toolbar: '#bar', width: 150}
                ]]
                , page: true
                , limits: [5, 10, 15]
                , limit: 5,
                done: function (res, curr, count) {
                    console.log("course table render done.");
                }
            });
            //添加下拉框渲染
            $.ajax({
                url: "${pageContext.request.contextPath}/teacher/getAllTeacher",
                method: "get",
                dataType: "json",
                success: function (data) {
                    const list = data.data;
                    for (let k in list) {
                        $(".teacherSelect").append("<option value='" + list[k].id + "'>" + list[k].name + "</option>");
                    }
                    form.render();
                }
            })
            //监听工具栏
            table.on('toolbar(useruv)', function (obj) {
                switch (obj.event) {
                    // 添加
                    case 'add':
                        layer.open({
                            type: 1,
                            area: ['650px', '400px'],
                            shadeClose: true,
                            closeBtn: 1, //显示关闭按钮
                            title: '添加课程',
                            content: $("#addCourse"),
                        });
                        break;
                    //刷新表格
                    case 'refresh':
                        courseTable.reload();
                        break;
                    // 根据课程名称和教师名称，后台为模糊查询
                    case 'search':
                        var preCourseName = $("#courseName").val();
                        var preTeacherName = $("#teacherName").val();
                        table.reload('courseTable', {
                            url: '${pageContext.request.contextPath}/course/getCourseList',
                            where: {
                                name: $("#courseName").val(),
                                teacherName: $("#teacherName").val()
                            },
                            page: {
                                /* 重新从第一页开始查询 */
                                curr: 1
                            },
                            done: function (res, curr, count) {
                                /* 填充搜索框 */
                                console.log("course查询done!");
                                $("#courseName").val(preCourseName);
                                $("#teacherName").val(preTeacherName);
                            }
                        });
                }
            });
            //监听表格行内工具栏
            table.on('tool(useruv)', function (obj) {
                var data = obj.data;
                if (obj.event === 'del') {
                    layer.confirm('真的删除行么', function (index) {
                        $.ajax({
                            url: "${pageContext.request.contextPath}/course/deleteCourse",
                            method: "GET",
                            data: {"id": data.id},
                            success: function (data) {
                                if (data.success) {
                                    obj.del();
                                }
                                layer.msg(data.msg);
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
                        title: '编辑课程信息',
                        content: $("#editCourse"),
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
            form.on('submit(addCourse)', function (data) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/course/addCourse",
                    method: "post",
                    data: data.field,
                    dataType: "json",
                    success: function (data) {
                        if (data.success) {
                            courseTable.reload();
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
            form.on('submit(editCourse)', function (data) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/course/updateCourse",
                    method: "post",
                    data: data.field,
                    dataType: "json",
                    success: function (data) {
                        if (data.success) {
                            courseTable.reload();
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

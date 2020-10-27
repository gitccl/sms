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
    <table class="layui-table" id="gradeTable" lay-filter="useruv"></table>
</div>
<!--增加选课弹窗-->
<div class="courseform" id="addCourse" hidden="hidden">
    <br>
    <form class="layui-form layui-form-pane" id="studentform">
        <div class="layui-form-item">
            <label class="layui-form-label">学号</label>
            <div class="layui-input-inline">
                <select lay-verify="required" name="studentId" class="studentSelect" lay-filter="stu" lay-search>
                    <option value="">请选择</option>
                </select>
            </div>
            <label class="layui-form-label">课程</label>
            <div class="layui-input-inline">
                <select lay-verify="required" name="courseId" id="selectCourse" lay-filter="course" lay-search>
                    <option value="">请选择</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item" style="text-align: center;">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="addCourse">保存</button>
                <button type="button" class="layui-btn layui-btn-danger" id="btn-add-close">关闭</button>
            </div>
        </div>
    </form>
</div>
<%--编辑学生弹窗--%>
<div class="editCourseForm" id="editCourse" hidden="hidden">
    <br>
    <form class="layui-form layui-form-pane" id="courseForm" lay-filter="editform">

        <div class="layui-form-item">
            <label class="layui-form-label">课程</label>
            <div class="layui-input-inline">
                <select lay-verify="required" name="course_id" class="editCourseSelect" lay-filter="course" lay-search>
                    <option value="">请选择</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item" style="text-align: center;">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="editCourse">保存</button>
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
    <button class="layui-btn" lay-event="add"><i class="layui-icon"></i>添加</button>
    <input type="text" name="studentId" id="studentId" placeholder="请输入学生的学号" autocomplete="off" class="layui-input"
           style="display:inline-block;width:200px;padding-left: 10px; margin-left: 10px;">
    <input type="text" name="teacherId" id="teacherId" placeholder="请输入老师的工号" autocomplete="off" class="layui-input"
           style="display:inline-block;width:200px;padding-left: 10px; margin-left: 10px;">
    <button class="layui-btn" lay-submit="" lay-event="search" style="margin-left: 15px"><i class="layui-icon">&#xe615;</i></button>
</script>
<script>
    $(function () {
        //表格渲染
        layui.use(['table', 'form', 'layer'], function () {
            const table = layui.table,
                form = layui.form,
                layer = layui.layer;
            const gradeTable = table.render({
                elem: '#gradeTable'
                , url: '${pageContext.request.contextPath}/grade/getGradeList'
                , cellMinWidth: 80
                , height: 500
                , toolbar: '#toolbar'
                , cols: [[
                    {field: 'studentId', title: '学号', sort: true}
                    , {field: 'courseName', title: '课程名', align: 'center'}
                    , {field: 'teacherName', title: '讲师', align: 'center'}
                    , {field: 'address', title: '上课地点', align: 'center'}
                    , {field: 'credit', title: '学分', align: 'center'}
                    , {field: 'one', title: '操作', align: 'center', fixed: 'right', toolbar: '#bar'}
                ]]
                , page: true
                , limits: [5, 10, 15]
                , limit: 5
                , done: function (res, curr, count) {
                    <%--$(".layui-table").find("[data-field='one']").css("display","none");--%>
                    <%--console.log("${sessionScope.student.id}")--%>
                    <%--$('.studentSelect').empty();--%>
                    <%--$(".studentSelect").append("<option value=${sessionScope.student.id}>${sessionScope.student.id}</option>");--%>
                    <%--form.render();--%>
                    //添加下拉框渲染
                    $.ajax({
                        url: "${pageContext.request.contextPath}/student/getStudentList",
                        method: "get",
                        dataType: "json",
                        success: function (data) {
                            const list = data.data;
                            for (let k in list) {
                                $(".studentSelect").append("<option value='" + list[k].id + "'>" + list[k].id + "</option>");
                            }
                            form.render();
                        }
                    })
                }
            });

            //二级联动选择课程
            form.on('select(stu)', function (data) {
                const value = data.value;
                $.ajax({
                    type: 'post',
                    url: "${pageContext.request.contextPath}/course/selectCourseByStudent",
                    data: {
                        studentId: value
                    },
                    success: function (e) {
                        console.log(e.data);
                        $("#selectCourse").empty();

                        let html = "<option value='0'>请选择</option>";
                        $(e.data).each(function (v, k) {
                            html += "<option value='" + k.id + "'>" + k.name + "</option>";
                        });

                        //把遍历的数据放到select表里面
                        $("#selectCourse").append(html);
                        //从新刷新了一下下拉框
                        form.render();      //重新渲染
                    }
                });
            });
            //监听工具栏
            table.on('toolbar(useruv)', function (obj) {
                switch (obj.event) {
                    //添加
                    case 'add':
                        layer.open({
                            type: 1,
                            area: ['650px', '300px'],
                            shadeClose: true,
                            closeBtn: 1, //显示关闭按钮
                            title: '添加课程',
                            content: $("#addCourse"),
                        });
                        break;
                    //刷新表格
                    case 'refresh':
                        gradeTable.reload();
                        break;
                    //根据学号查找
                    case 'search':
                        table.reload('gradeTable', {
                            url: '${pageContext.request.contextPath}/grade/getGradeList',
                            where: {
                                studentId: $("#studentId").val(),
                                teacherId: $("#teacherId").val()
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
                            url: "${pageContext.request.contextPath}/grade/deleteGrade",
                            method: "GET",
                            data: {
                                "courseId": data.courseId,
                                "studentId": data.studentId
                            },
                            success: function (data) {
                                if(data.success) {
                                    obj.del();
                                }
                                layer.msg(data.msg);
                                gradeTable.reload();
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
                        area: ['650px', '300px'],
                        shadeClose: true,
                        closeBtn: 1, //显示关闭按钮
                        title: '编辑选课信息',
                        content: $("#editCourse"),
                    });
                    $.ajax({
                        type: 'get',
                        url: "${pageContext.request.contextPath}/course/selectCourseByStudent",
                        data: {
                            studentId: data.studentId
                        },
                        success: function (e) {
                            console.log(e.data);
                            //empty() 方法从被选元素移除所有内容
                            $(".editCourseSelect").empty();
                            $(".editCourseSelect").append("<option value='" + data.course_id + "'>" + data.name + "</option>");
                            let html = "<option value='0'>请选择</option>";
                            $(e.data).each(function (v, k) {
                                html += "<option value='" + k.id + "'>" + k.name + "</option>";
                            });
                            //把遍历的数据放到select表里面
                            $(".editCourseSelect").append(html);
                            //从新刷新了一下下拉框
                            form.render('select'); //重新渲染
                        }
                    });
                    form.on('submit(editCourse)', function (list) {
                        console.log(obj.data.student_id);
                        console.log(list.field.course_id);
                        $.ajax({
                            url: "${pageContext.request.contextPath}/grade/updateGrade",
                            data: {
                                "courseId": list.field.courseId,
                                "studentId": obj.data.studentId,
                                "olderCourseId": obj.data.courseId,
                                "grade": "未录入"
                            },
                            method: "post",
                            dataType: "json",
                            success: function (data) {
                                if (data.success) {
                                    gradeTable.reload();
                                    layer.closeAll();
                                    form.render('select');
                                }
                                layer.msg(data.msg);
                            },
                            error: function () {
                                layer.msg("修改失败！");
                            }
                        });
                        return false;
                    });
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
                    url: "${pageContext.request.contextPath}/grade/addGrade",
                    method: "post",
                    data: data.field,
                    dataType: "json",
                    success: function (data) {
                        if (data.success) {
                            gradeTable.reload();
                            layer.closeAll();
                            form.render();
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

        });
    })
</script>
</body>

</html>
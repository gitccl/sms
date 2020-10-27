package cn.akwing.sms.service.impl;

import cn.akwing.sms.mapper.TeacherMapper;
import cn.akwing.sms.pojo.Teacher;
import cn.akwing.sms.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author c1515
 */
@Service
public class TeacherServiceImpl implements TeacherService {

    @Autowired
    private TeacherMapper teacherMapper;

    @Override
    public List<Teacher> selectByCondition(Teacher teacher) {
        return teacherMapper.selectByCondition(teacher);
    }

    @Override
    public List<Teacher> selectAll() {
        return teacherMapper.selectAll();
    }
}

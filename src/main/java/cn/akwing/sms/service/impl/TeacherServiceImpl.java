package cn.akwing.sms.service.impl;

import cn.akwing.sms.mapper.TeacherMapper;
import cn.akwing.sms.pojo.Teacher;
import cn.akwing.sms.service.TeacherService;
import com.mysql.jdbc.StringUtils;
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
        if(StringUtils.isNullOrEmpty(teacher.getId())){
            teacher.setId(null);
        }
        if(StringUtils.isNullOrEmpty(teacher.getName())){
            teacher.setName(null);
        }
        if(StringUtils.isNullOrEmpty(teacher.getDept())){
            teacher.setDept(null);
        }
        return teacherMapper.selectByCondition(teacher);
    }

    @Override
    public List<Teacher> selectAll() {
        return teacherMapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(Teacher record) {
        return teacherMapper.updateByPrimaryKey(record);
    }

    @Override
    public int insert(Teacher record) {
        return teacherMapper.insert(record);
    }

    @Override
    public int deleteByPrimaryKey(String id) {
        return teacherMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Teacher login(String id, String password) {
        return teacherMapper.login(id, password);
    }
}

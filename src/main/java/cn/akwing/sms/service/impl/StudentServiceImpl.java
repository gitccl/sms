package cn.akwing.sms.service.impl;

import cn.akwing.sms.mapper.StudentMapper;
import cn.akwing.sms.pojo.Student;
import cn.akwing.sms.service.StudentService;
import com.mysql.jdbc.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author c1515
 */
@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentMapper studentMapper;

    @Override
    public List<Student> selectAll() {
        return studentMapper.selectAll();
    }

    @Override
    public List<Student> selectByCondition(Student student) {
        /* 如果某个查询条件为空，不会通过后面mybatis查询的 if test ... != null */
        if(StringUtils.isNullOrEmpty(student.getId())) {
            student.setId(null);
        }

        if(StringUtils.isNullOrEmpty(student.getName())) {
            student.setName(null);
        }

        if(StringUtils.isNullOrEmpty(student.getOfClass())) {
            student.setOfClass(null);
        }
        return studentMapper.selectByCondition(student);
    }

    @Override
    public int deleteByPrimaryKey(String[] id) {
        return studentMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insertStudent(Student student) {
        return studentMapper.insert(student);
    }

    @Override
    public int updateStudent(Student student) {
        return studentMapper.updateByPrimaryKey(student);
    }

    @Override
    public Student login(String id, String password) {
        return studentMapper.login(id, password);
    }
}

package cn.akwing.sms.service;

import cn.akwing.sms.pojo.Student;

import java.util.List;

/**
 * @author c1515
 */
public interface StudentService {

    List<Student> selectAll();

    List<Student> selectByCondition(Student student);

    int deleteByPrimaryKey(String[] id);

    int insertStudent(Student student);

    int updateStudent(Student student);

    Student login(String id, String password);
}

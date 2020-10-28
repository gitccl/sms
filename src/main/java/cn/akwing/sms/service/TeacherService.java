package cn.akwing.sms.service;

import cn.akwing.sms.pojo.Teacher;

import java.util.List;

/**
 * @author c1515
 */
public interface TeacherService {

    List<Teacher> selectByCondition(Teacher teacher);

    List<Teacher> selectAll();

    int updateByPrimaryKey(Teacher record);

    int insert(Teacher record);

    int deleteByPrimaryKey(String id);

    Teacher login(String id, String password);
}

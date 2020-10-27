package cn.akwing.sms.mapper;

import cn.akwing.sms.pojo.Teacher;
import java.util.List;

public interface TeacherMapper {
    int deleteByPrimaryKey(String id);

    int insert(Teacher record);

    Teacher selectByPrimaryKey(String id);

    List<Teacher> selectAll();

    int updateByPrimaryKey(Teacher record);

    List<Teacher> selectByCondition(Teacher teacher);
}
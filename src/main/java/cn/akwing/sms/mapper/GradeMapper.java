package cn.akwing.sms.mapper;

import cn.akwing.sms.pojo.Grade;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author c1515
 */
public interface GradeMapper {
    List<Grade> selectByCondition(Grade grade);
    int insert(Grade grade);
    int update(Grade grade);
    int delete(@Param("studentId") String studentId, @Param("courseId") String courseId);
}

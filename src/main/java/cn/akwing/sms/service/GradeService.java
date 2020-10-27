package cn.akwing.sms.service;

import cn.akwing.sms.pojo.Grade;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author c1515
 */
public interface GradeService {
    List<Grade> selectByCondition(Grade grade);
    int insert(Grade grade);
    int update(Grade grade);
    int delete(String studentId, String courseId);
}

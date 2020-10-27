package cn.akwing.sms.service.impl;

import cn.akwing.sms.mapper.GradeMapper;
import cn.akwing.sms.pojo.Grade;
import cn.akwing.sms.service.GradeService;
import com.mysql.jdbc.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author c1515
 */
@Service
public class GradeServiceImpl implements GradeService {

    @Autowired
    private GradeMapper gradeMapper;

    @Override
    public List<Grade> selectByCondition(Grade grade) {

        if(StringUtils.isNullOrEmpty(grade.getStudentId())) {
            grade.setStudentId(null);
        }
        if(StringUtils.isNullOrEmpty(grade.getTeacherId())) {
            grade.setTeacherId(null);
        }

        return gradeMapper.selectByCondition(grade);
    }

    @Override
    public int insert(Grade grade) {
        return gradeMapper.insert(grade);
    }

    @Override
    public int update(Grade grade) {
        return gradeMapper.update(grade);
    }

    @Override
    public int delete(String studentId, String courseId) {
        return gradeMapper.delete(studentId, courseId);
    }
}

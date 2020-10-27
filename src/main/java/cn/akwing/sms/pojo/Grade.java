package cn.akwing.sms.pojo;

import java.math.BigDecimal;

/**
 * @author c1515
 */
public class Grade {

    private String studentId;
    private String courseId;
    private String courseName;
    private String teacherId;
    private String address;
    private BigDecimal credit;
    private String teacherName;
    private String grade;

    /**
     * update的时候使用该字段
     */
    private String olderCourseId;

    public String getOlderCourseId() {
        return olderCourseId;
    }

    public void setOlderCourseId(String olderCourseId) {
        this.olderCourseId = olderCourseId;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId == null ? null : studentId.trim();
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId == null ? null : courseId.trim();
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String name) {
        this.courseName = name;
    }

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public BigDecimal getCredit() {
        return credit;
    }

    public void setCredit(BigDecimal credit) {
        this.credit = credit;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    @Override
    public String toString() {
        return "Grade{" +
                "studentId='" + studentId + '\'' +
                ", courseId='" + courseId + '\'' +
                ", courseName='" + courseName + '\'' +
                ", teacherId='" + teacherId + '\'' +
                ", address='" + address + '\'' +
                ", credit=" + credit +
                ", teacherName='" + teacherName + '\'' +
                ", grade='" + grade + '\'' +
                '}';
    }
}

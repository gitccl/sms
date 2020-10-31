/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:3306
 Source Schema         : sms

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 29/10/2020 20:58:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` varchar(15) CHARACTER SET utf8mb4  NOT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4  NOT NULL,
  `name` varchar(15) CHARACTER SET utf8mb4  NOT NULL,
  `sex` char(2) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4  NOT NULL,
  `tel` varchar(12) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('admin', 'admin', '管理员', '男', 'tomaito@qq.com', '13819254521');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` varchar(10) CHARACTER SET utf8mb4  NOT NULL COMMENT '课程编号',
  `name` varchar(25) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '课程名',
  `teacher_id` varchar(15) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '任课教师\r\n',
  `address` varchar(25) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '上课地点',
  `credit` decimal(4, 2) NULL DEFAULT NULL COMMENT '学分',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('IOT0032', '传感器网络', '007', '1A104', 3.00);
INSERT INTO `course` VALUES ('IOT1092', '计算机网络', '008', '1A314', 3.00);
INSERT INTO `course` VALUES ('TB0200004', '算法分析与设计', '004', '1A102', 5.00);
INSERT INTO `course` VALUES ('TB21018', 'JavaWeb', '006', '121', 4.00);
INSERT INTO `course` VALUES ('ZB1705015', '数字媒体处理工具', '003', '307', 10.00);
INSERT INTO `course` VALUES ('ZB1705016', '游戏美术基础', '005', '407', 15.00);
INSERT INTO `course` VALUES ('ZB1705017', '形势与政策', '001', '307', 5.00);
INSERT INTO `course` VALUES ('ZX1705005', '体育', '007', 'J1306', 10.00);
INSERT INTO `course` VALUES ('ZX1705008', '中国近代史纲要', '008', 'JS203', 10.00);
INSERT INTO `course` VALUES ('ZX1705009', '大学英语', '002', 'J1406', 10.00);
INSERT INTO `course` VALUES ('ZX1705013', '操作系统原理与Linux', '009', 'J1509', 10.00);

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade`  (
  `student_id` varchar(15) CHARACTER SET utf8mb4  NOT NULL COMMENT '学号',
  `course_id` varchar(10) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '课程号',
  `grade` varchar(20) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '分数'
) ENGINE = InnoDB CHARACTER SET = utf8mb4  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('1034180201', 'IOT1092', '未录入');
INSERT INTO `grade` VALUES ('1034180201', 'TB0200004', '100');
INSERT INTO `grade` VALUES ('1034180202', 'TB21018', '100');
INSERT INTO `grade` VALUES ('1034180212', 'TB0200004', '100');
INSERT INTO `grade` VALUES ('1034180212', 'ZB1705015', '80');
INSERT INTO `grade` VALUES ('1034180216', 'ZB1705017', '96');
INSERT INTO `grade` VALUES ('1034180228', 'ZX1705013', '95');
INSERT INTO `grade` VALUES ('1808054602', 'TB0200004', '88');
INSERT INTO `grade` VALUES ('1808054602', 'ZB1705015', '62');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` varchar(20) CHARACTER SET utf8mb4  NOT NULL COMMENT '学号',
  `password` varchar(25) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `name` varchar(10) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '姓名',
  `sex` varchar(10) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '性别',
  `tel` varchar(15) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '联系电话',
  `grade` varchar(50) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '入学时间',
  `dept` varchar(25) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '院系',
  `major` varchar(25) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '专业',
  `of_class` varchar(25) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '班级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1034180201', '12345678', '刘佳乐', '男', '18888888888', '18', '物联网工程学院', '物联网工程', '4');
INSERT INTO `student` VALUES ('1034180202', '123456', '王辰硕', '男', '18888888882', '18', '物联网工程学院', '物联网工程', '2');
INSERT INTO `student` VALUES ('1034180203', '123456', '张凯', '男', '18888888883', '18', '物联网工程学院', '物联网工程', '2');
INSERT INTO `student` VALUES ('1034180204', '123456', '刘如玥', '女', '18888888884', '18', '物联网工程学院', '物联网工程', '2');
INSERT INTO `student` VALUES ('1034180205', '123456', '王诗议', '女', '12345678905', '18', '物联网工程学院', '物联网工程', '2');
INSERT INTO `student` VALUES ('1034180211', '123456', '刘佳乐22', '男', '18888888882', '18', '物联网工程学院', '物联网工程', '2');
INSERT INTO `student` VALUES ('1034180212', '123456', '王辰硕22', '男', '18888888882', '18', '物联网工程学院', '物联网工程', '2');
INSERT INTO `student` VALUES ('1034180213', '123456', '张凯22', '男', '18888888883', '18', '物联网工程学院', '物联网工程', '2');
INSERT INTO `student` VALUES ('1034180214', '123456', '刘如玥22', '女', '18888888884', '18', '物联网工程学院', '物联网工程', '2');
INSERT INTO `student` VALUES ('1034180216', '111111', '陈晨辰', '男', '13666666666', '18', '物联网工程', '物联网工程', '2');
INSERT INTO `student` VALUES ('1034180228', '111111', '陈晨辰', '男', '13666666666', '18', '物联网工程', '物联网工程', '2');
INSERT INTO `student` VALUES ('1808054601', '123456', '李阳22', '男', '18888888885', '18', '计算机信息工程学院', '软件工程', '6');
INSERT INTO `student` VALUES ('1808054602', '123456', '李阳', '男', '18888888885', '18', '计算机信息工程学院', '软件工程', '6');
INSERT INTO `student` VALUES ('1808054603', '123456', '张鹏飞\r\n', '男', '18888888886', '18', '计算机信息工程学院', '软件工程', '6');
INSERT INTO `student` VALUES ('1808054604', '123456', '李雪', '女', '18888888887', '18', '计算机信息工程学院', '软件工程', '6');
INSERT INTO `student` VALUES ('1808054618', '123456', '张鹏飞22', '男', '18888888886', '18', '计算机信息工程学院', '软件工程', '6');
INSERT INTO `student` VALUES ('1808054619', '123456', '李雪22', '女', '18888888887', '18', '计算机信息工程学院', '软件工程', '6');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` varchar(20) CHARACTER SET utf8mb4  NOT NULL COMMENT '老师id',
  `password` varchar(25) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `name` varchar(10) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '姓名',
  `sex` varchar(10) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '性别',
  `tel` varchar(15) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '联系电话',
  `dept` varchar(25) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '院系',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('001', '12345678', '李雷雷', '男', '18888888882', '设计学院');
INSERT INTO `teacher` VALUES ('002', '123456', '李土', '男', '18888888882', '物联网工程学院');
INSERT INTO `teacher` VALUES ('003', '123456', '李木', '男', '18888888882', '物联网工程学院');
INSERT INTO `teacher` VALUES ('004', '123456', '李火', '男', '18888888882', '物联网工程学院');
INSERT INTO `teacher` VALUES ('005', '123456', '李水', '男', '18888888882', '物联网工程学院');
INSERT INTO `teacher` VALUES ('006', '123456', '李电', '男', '18888888882', '物联网工程学院');
INSERT INTO `teacher` VALUES ('007', '123456', '李金', '男', '18888888882', '物联网工程学院');
INSERT INTO `teacher` VALUES ('008', '123456', '李风', '女', '18888888882', '物联网工程学院');
INSERT INTO `teacher` VALUES ('009', '123456', '李电', '男', '18888888882', '物联网工程学院');
INSERT INTO `teacher` VALUES ('L008', '123456', '邓肯', '男', '12345678910', '理学院');

SET FOREIGN_KEY_CHECKS = 1;

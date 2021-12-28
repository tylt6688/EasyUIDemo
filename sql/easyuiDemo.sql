/*
 Navicat Premium Data Transfer

 Source Server         : 本地数据库
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : demo2

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 28/12/2021 21:58:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `major` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `studylicense` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `studyclass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学生表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (3, '分低估', '11', '英语系', '67676', '33班');
INSERT INTO `student` VALUES (4, '分隔符', '12', '数学系', '123123', '44班');
INSERT INTO `student` VALUES (9, '具有', '22', '核子系', '53453453', '99班');
INSERT INTO `student` VALUES (10, '讲解', '22', '家里蹲', '5345354', '00班');
INSERT INTO `student` VALUES (11, '马具有', '2', '宿舍', '5243453', '111班');
INSERT INTO `student` VALUES (12, '王讲解聪', '1', '北大物理', '118086', '1111班');
INSERT INTO `student` VALUES (13, '小明', '8', '新疆驾校', '10086', '222班');
INSERT INTO `student` VALUES (35, '㐣', '58', '佛系', '10010', '1班');

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subjectname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ownershipid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES (1, '语文', 1);
INSERT INTO `subject` VALUES (2, '数学', 1);
INSERT INTO `subject` VALUES (3, '英语', 2);
INSERT INTO `subject` VALUES (4, '历史', 3);
INSERT INTO `subject` VALUES (5, '化学', 4);
INSERT INTO `subject` VALUES (6, '物理', 4);
INSERT INTO `subject` VALUES (7, '心理', 3);
INSERT INTO `subject` VALUES (8, '计算机', 12);
INSERT INTO `subject` VALUES (9, '自动化', 11);
INSERT INTO `subject` VALUES (10, '政治', 12);
INSERT INTO `subject` VALUES (11, '物理学', 10086);
INSERT INTO `subject` VALUES (12, '新疆驾校', 13);
INSERT INTO `subject` VALUES (13, '物利', 13);
INSERT INTO `subject` VALUES (14, '精神', 1);
INSERT INTO `subject` VALUES (15, '哈哈', 13);
INSERT INTO `subject` VALUES (16, '联通', 35);
INSERT INTO `subject` VALUES (17, '啊啊啊', 35);
INSERT INTO `subject` VALUES (18, '大学英语', 7);

SET FOREIGN_KEY_CHECKS = 1;

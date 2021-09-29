/*
Navicat MySQL Data Transfer

Source Server         : localhost-mysql
Source Server Version : 50641
Source Host           : localhost:3306
Source Database       : dataanalysis

Target Server Type    : MYSQL
Target Server Version : 50641
File Encoding         : 65001

Date: 2021-06-09 17:40:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `boo_id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `courseName` varchar(255) NOT NULL COMMENT '课程名称',
  `boo_name` varchar(255) NOT NULL COMMENT '教材名称',
  `boo_auther` varchar(255) NOT NULL COMMENT '著作人',
  PRIMARY KEY (`boo_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES ('2', '大数据与数据采集', ' 测试', ' 测试');
INSERT INTO `books` VALUES ('3', '数据可视化', ' 测试', ' 测试');
INSERT INTO `books` VALUES ('4', '机器学习与模式识别', ' 测试', '测试');
INSERT INTO `books` VALUES ('11', '数据分析', '测试1', '测试1');
INSERT INTO `books` VALUES ('12', '数据分析', '测试2', '测试2');
INSERT INTO `books` VALUES ('13', '数据分析', '测试3', '测试3');
INSERT INTO `books` VALUES ('14', '数据分析', '测试4', '测试4');
INSERT INTO `books` VALUES ('15', '数据分析', '测试5', '测试5');
INSERT INTO `books` VALUES ('16', '数据分析', '测试6', '测试6');
INSERT INTO `books` VALUES ('17', '数据分析', '数据分析', 'auther');
INSERT INTO `books` VALUES ('18', '大数据与数据采集', '测试', '测试');
INSERT INTO `books` VALUES ('19', '数据分析', '测试', '测试');
INSERT INTO `books` VALUES ('20', '数据分析', '1', '1');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `com_id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `dis_id` int(255) NOT NULL COMMENT '评论所属主题id',
  `com_user` varchar(255) NOT NULL COMMENT '评论人',
  `com_content` varchar(10000) NOT NULL COMMENT '评论内容',
  `com_date` datetime(6) NOT NULL COMMENT '评论时间',
  `children` varchar(10000) DEFAULT NULL COMMENT '第二级评论',
  `com_show` char(255) NOT NULL COMMENT '回复显示',
  PRIMARY KEY (`com_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '1', 'user1', '这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本', '2021-01-20 21:05:08.000000', null, 'false');
INSERT INTO `comment` VALUES ('2', '1', 'user2', '这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本', '2021-01-20 21:08:21.000000', null, 'false');
INSERT INTO `comment` VALUES ('3', '1', 'user3', '这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本', '2021-01-20 21:08:38.000000', null, 'false');
INSERT INTO `comment` VALUES ('4', '1', 'user4', '这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本', '2021-01-20 21:08:51.000000', null, 'false');
INSERT INTO `comment` VALUES ('5', '1', 'user5', '这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本', '2021-01-20 21:09:05.000000', null, 'false');
INSERT INTO `comment` VALUES ('22', '1', '梅博', '测试', '2021-01-23 22:54:07.000000', null, 'false');
INSERT INTO `comment` VALUES ('23', '1', '梅博', '这是一段文本', '2021-01-23 22:54:21.000000', null, 'false');
INSERT INTO `comment` VALUES ('24', '1', '梅博', '1', '2021-01-23 23:20:36.000000', null, 'false');
INSERT INTO `comment` VALUES ('25', '10', '梅博', '1', '2021-01-24 12:12:27.000000', null, 'false');
INSERT INTO `comment` VALUES ('26', '18', '梅博', '1', '2021-01-24 12:25:28.000000', null, 'false');
INSERT INTO `comment` VALUES ('27', '1', '梅博', '1', '2021-01-24 23:52:46.000000', null, 'false');
INSERT INTO `comment` VALUES ('28', '1', '梅博', '1', '2021-01-28 00:48:49.000000', null, 'false');
INSERT INTO `comment` VALUES ('29', '1', '梅博', '1', '2021-01-29 18:21:25.000000', null, 'false');
INSERT INTO `comment` VALUES ('30', '16', '梅博', '这是一段文本', '2021-01-30 21:59:29.000000', null, 'false');
INSERT INTO `comment` VALUES ('33', '1', '梅博', '1', '2021-01-31 22:05:59.000000', null, 'false');
INSERT INTO `comment` VALUES ('34', '1', '梅博', '测试', '2021-01-31 22:24:46.000000', null, 'false');
INSERT INTO `comment` VALUES ('39', '16', '梅博', '1', '2021-02-01 00:13:43.000000', null, 'false');
INSERT INTO `comment` VALUES ('40', '1', '梅博', '1', '2021-05-25 12:16:55.000000', null, 'false');

-- ----------------------------
-- Table structure for comment2
-- ----------------------------
DROP TABLE IF EXISTS `comment2`;
CREATE TABLE `comment2` (
  `com2_id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `com_id` int(255) NOT NULL COMMENT '父级评论所属主题id',
  `com2_user` varchar(255) NOT NULL COMMENT '二级评论人',
  `com2_content` varchar(10000) NOT NULL COMMENT '二级评论内容',
  `com2_date` datetime(6) NOT NULL COMMENT '二级评论时间',
  PRIMARY KEY (`com2_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of comment2
-- ----------------------------
INSERT INTO `comment2` VALUES ('1', '1', 'user1', '这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本', '2021-01-20 21:05:08.000000');
INSERT INTO `comment2` VALUES ('2', '1', 'user2', '这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本', '2021-01-20 21:08:21.000000');
INSERT INTO `comment2` VALUES ('3', '1', '梅博', '测试', '2021-01-31 22:25:38.000000');
INSERT INTO `comment2` VALUES ('4', '2', '梅博', '1', '2021-01-31 22:26:31.000000');
INSERT INTO `comment2` VALUES ('5', '3', '梅博', '测试', '2021-01-31 22:26:36.000000');
INSERT INTO `comment2` VALUES ('12', '1', '梅博', '1', '2021-02-01 00:12:00.000000');
INSERT INTO `comment2` VALUES ('13', '23', '梅博', '1', '2021-02-01 00:12:09.000000');
INSERT INTO `comment2` VALUES ('14', '30', '梅博', '1', '2021-02-01 00:13:38.000000');
INSERT INTO `comment2` VALUES ('15', '1', '梅博', '2', '2021-05-20 12:04:23.000000');

-- ----------------------------
-- Table structure for contact
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `con_id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `con_teacher` varchar(255) NOT NULL COMMENT ' 任课教师',
  `con_assistant` varchar(255) NOT NULL COMMENT ' 课程助教',
  `con_chat` varchar(255) NOT NULL COMMENT ' 网络互动',
  PRIMARY KEY (`con_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of contact
-- ----------------------------
INSERT INTO `contact` VALUES ('1', '这是一段文本1', '这是一段文本1', ' 这是一段文本1');

-- ----------------------------
-- Table structure for description
-- ----------------------------
DROP TABLE IF EXISTS `description`;
CREATE TABLE `description` (
  `des_id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `courseName` varchar(255) NOT NULL COMMENT '课程名称',
  `des_outline` varchar(2000) NOT NULL COMMENT '教学大纲',
  `des_hour` varchar(2000) NOT NULL COMMENT '课时分配',
  `des_history` varchar(2000) NOT NULL COMMENT '历史沿革',
  PRIMARY KEY (`des_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of description
-- ----------------------------
INSERT INTO `description` VALUES ('1', '数据分析', '教学大纲教学大纲教学大纲教学大纲教学大纲教学大纲教学大纲教学大纲教学大纲教学大纲教学大纲教学大纲教学大纲教学大纲教学大纲教学大纲教学大纲教学大纲教学大纲教学大纲教学大纲教学大纲', '课时分配课时分配课时分配课时分配课时分配课时分配课时分配课时分配课时分配课时分配课时分配课时分配课时分配课时分配课时分配课时分配课时分配课时分配课时分配课时分配课时分配课时分配课时分配课时分配课时分配课时分配课时分配课时分配课时分配课时分配', '历史沿革历史沿革历史沿革历史沿革历史沿革历史沿革历史沿革历史沿革历史沿革历史沿革历史沿革历史沿革历史沿革历史沿革历史沿革历史沿革历史沿革历史沿革历史沿革历史沿革历史沿革历史沿革历史沿革历史沿革历史沿革历史沿革历史沿革历史沿革1');
INSERT INTO `description` VALUES ('2', '大数据与数据采集', '教学大纲教学大纲教学大纲教学大纲教学大纲教学大纲教学大纲教学大纲教学大纲教学大纲教学大纲教学大纲教学大纲教学大纲教学大纲教学大纲教学大纲教学大纲教学大纲教学大纲教学大纲教学大纲', '课时分配', '历史沿革');
INSERT INTO `description` VALUES ('3', '数据可视化', ' 教学大纲', ' 课时分配', '历史沿革');
INSERT INTO `description` VALUES ('4', '机器学习与模式识别', ' 教学大纲', ' 课时分配', ' 历史沿革');

-- ----------------------------
-- Table structure for discuss
-- ----------------------------
DROP TABLE IF EXISTS `discuss`;
CREATE TABLE `discuss` (
  `dis_id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `courseName` varchar(255) NOT NULL COMMENT ' 课程名称',
  `dis_name` varchar(255) NOT NULL COMMENT ' 主题名称',
  `dis_content` varchar(2000) NOT NULL COMMENT ' 主题内容',
  `dis_user` varchar(255) NOT NULL COMMENT ' 用户',
  `dis_date` datetime(6) NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`dis_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of discuss
-- ----------------------------
INSERT INTO `discuss` VALUES ('1', '数据分析', '数据分析', '这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本', 'user1', '2021-01-17 22:47:09.000000');
INSERT INTO `discuss` VALUES ('5', '数据分析', '数据分析工具篇——HQL原理及优化', '这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本', 'user2', '2021-01-17 22:47:09.000000');
INSERT INTO `discuss` VALUES ('6', '数据分析', '数据分析常用6种分析思路', '这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本', 'user3', '2021-01-17 22:47:09.000000');
INSERT INTO `discuss` VALUES ('7', '数据分析', '数据分析工作到底在做什么', '这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本', 'user4', '2021-01-17 22:47:09.000000');
INSERT INTO `discuss` VALUES ('8', '数据分析', 'Python数据分析实例', '这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本', 'user5', '2021-01-17 22:47:09.000000');
INSERT INTO `discuss` VALUES ('17', '数据可视化', '测试', '测试', '梅博', '2021-01-24 12:24:38.000000');
INSERT INTO `discuss` VALUES ('18', '机器学习与模式识别', '测试', '测试', '梅博', '2021-01-24 12:24:45.000000');
INSERT INTO `discuss` VALUES ('19', '数据分析', '测试', '测试', '梅博', '2021-01-24 12:32:11.000000');
INSERT INTO `discuss` VALUES ('21', '数据分析', '1', '1', '梅博', '2021-01-24 23:53:12.000000');
INSERT INTO `discuss` VALUES ('22', '数据分析', '1', '1', '梅博', '2021-01-24 23:53:15.000000');
INSERT INTO `discuss` VALUES ('23', '数据分析', '1', '1', '梅博', '2021-01-24 23:53:17.000000');
INSERT INTO `discuss` VALUES ('24', '数据分析', '1', '1', '梅博', '2021-01-24 23:53:21.000000');
INSERT INTO `discuss` VALUES ('25', '数据分析', '1', '1', '梅博', '2021-01-24 23:53:24.000000');
INSERT INTO `discuss` VALUES ('26', '大数据与数据采集', '1', '1', '梅博', '2021-01-24 23:55:14.000000');
INSERT INTO `discuss` VALUES ('27', '大数据与数据采集', '1', '1', '梅博', '2021-01-24 23:55:17.000000');
INSERT INTO `discuss` VALUES ('28', '大数据与数据采集', '1', '1', '梅博', '2021-01-24 23:55:19.000000');
INSERT INTO `discuss` VALUES ('29', '大数据与数据采集', '1', '1', '梅博', '2021-01-24 23:55:22.000000');
INSERT INTO `discuss` VALUES ('30', '大数据与数据采集', '1', '1', '梅博', '2021-01-24 23:55:26.000000');
INSERT INTO `discuss` VALUES ('31', '数据可视化', '1', '1', '梅博', '2021-01-24 23:55:29.000000');
INSERT INTO `discuss` VALUES ('32', '数据可视化', '1', '1', '梅博', '2021-01-24 23:55:32.000000');
INSERT INTO `discuss` VALUES ('33', '数据可视化', '1', '1', '梅博', '2021-01-24 23:55:35.000000');
INSERT INTO `discuss` VALUES ('34', '数据可视化', '1', '1', '梅博', '2021-01-24 23:55:38.000000');
INSERT INTO `discuss` VALUES ('35', '数据可视化', '1', '1', '梅博', '2021-01-24 23:55:41.000000');
INSERT INTO `discuss` VALUES ('36', '机器学习与模式识别', '1', '1', '梅博', '2021-01-24 23:55:45.000000');
INSERT INTO `discuss` VALUES ('37', '机器学习与模式识别', '1', '1', '梅博', '2021-01-24 23:55:48.000000');
INSERT INTO `discuss` VALUES ('38', '机器学习与模式识别', '1', '1', '梅博', '2021-01-24 23:55:50.000000');
INSERT INTO `discuss` VALUES ('53', '机器学习与模式识别', '测试', '测试', '老师', '2021-01-28 21:23:49.000000');
INSERT INTO `discuss` VALUES ('54', '机器学习与模式识别', '1', '1', '老师', '2021-01-28 21:24:31.000000');
INSERT INTO `discuss` VALUES ('55', '数据分析', '1', '1', '梅博', '2021-05-20 12:04:34.000000');

-- ----------------------------
-- Table structure for evaluate
-- ----------------------------
DROP TABLE IF EXISTS `evaluate`;
CREATE TABLE `evaluate` (
  `eva_id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `courseName` varchar(255) NOT NULL COMMENT '课程名称',
  `eva_student` varchar(5000) NOT NULL COMMENT '学生评价',
  `eva_peer` varchar(5000) NOT NULL COMMENT ' 同行评价',
  `eva_feature` varchar(5000) NOT NULL COMMENT ' 课程特色',
  PRIMARY KEY (`eva_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of evaluate
-- ----------------------------
INSERT INTO `evaluate` VALUES ('1', '数据分析', '测试', '这是一段文本这是一段文本这是一段文本', '这是一段文本这是一段文本这是一段文本');
INSERT INTO `evaluate` VALUES ('2', '大数据与数据采集', ' 这是一段文本', ' 测试', '这是一段文本');
INSERT INTO `evaluate` VALUES ('3', '数据可视化', ' 这是一段文本', ' 这是一段文本', ' 这是一段文本');
INSERT INTO `evaluate` VALUES ('4', '机器学习与模式识别', ' 这是一段文本', ' 这是一段文本', ' 这是一段文本');

-- ----------------------------
-- Table structure for introduce
-- ----------------------------
DROP TABLE IF EXISTS `introduce`;
CREATE TABLE `introduce` (
  `int_id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `courseName` varchar(255) NOT NULL COMMENT '课程名称',
  `int_intro` varchar(2000) NOT NULL COMMENT '课程简介',
  `int_target` varchar(2000) NOT NULL COMMENT '课程目标',
  PRIMARY KEY (`int_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of introduce
-- ----------------------------
INSERT INTO `introduce` VALUES ('1', '数据分析', '所谓模式识别的问题就是用计算的方法根据样本的特征将样本划分到一定的类别中去。 [1]  模式识别就是通过计算机用数学技术方法来研究模式的自动处理和判读，把环境与客体统称为“模式”。随着计算机技术的发展，人类有可能研究复杂的信息处理过程，其过程的一个重要形式是生命体对环境及客体的识别。模式识别以图像处理与计算机视觉、语音语言信息处理、脑网络组、类脑智能等为主要研究方向，研究人类模式识别的机理以及有效的计算方法。', '掌握模式识别的基本概念和方法，有效地运用所学知识和方法解决实际问题，为研究新的模式识别的理论和方法打下基础。 \r\n');
INSERT INTO `introduce` VALUES ('2', '大数据与数据采集', '所谓模式识别的问题就是用计算的方法根据样本的特征将样本划分到一定的类别中去。 [1]  模式识别就是通过计算机用数学技术方法来研究模式的自动处理和判读，把环境与客体统称为“模式”。随着计算机技术的发展，人类有可能研究复杂的信息处理过程，其过程的一个重要形式是生命体对环境及客体的识别。模式识别以图像处理与计算机视觉、语音语言信息处理、脑网络组、类脑智能等为主要研究方向，研究人类模式识别的机理以及有效的计算方法。', '掌握模式识别的基本概念和方法，有效地运用所学知识和方法解决实际问题，为研究新的模式识别的理论和方法打下基础。 ');
INSERT INTO `introduce` VALUES ('3', '数据可视化', '课程简介3', '课程目标3');
INSERT INTO `introduce` VALUES ('4', '机器学习与模式识别', '课程简介4', '课程目标4');

-- ----------------------------
-- Table structure for reform
-- ----------------------------
DROP TABLE IF EXISTS `reform`;
CREATE TABLE `reform` (
  `ref_id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `courseName` varchar(255) NOT NULL COMMENT '课程名称',
  `ref_action` varchar(5000) NOT NULL COMMENT '教学方案与措施',
  `ref_importance` varchar(5000) NOT NULL COMMENT '教学重点与难点',
  `ref_way` varchar(5000) NOT NULL COMMENT '教学方法与手段',
  PRIMARY KEY (`ref_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of reform
-- ----------------------------
INSERT INTO `reform` VALUES ('1', '数据分析', '这是一段文本这是一段文本这是一段文本', ' 这是一段文本这是一段文本这是一段文本', ' 这是一段文本这是一段文本这是一段文本');
INSERT INTO `reform` VALUES ('2', '大数据与数据采集', ' 这是一段文本', ' 这是一段文本', ' 这是一段文本');
INSERT INTO `reform` VALUES ('3', '数据可视化', ' 这是一段文本', ' 这是一段文本', '这是一段文本');
INSERT INTO `reform` VALUES ('4', '机器学习与模式识别', '这是一段文本', ' 这是一段文本', ' 这是一段文本');

-- ----------------------------
-- Table structure for resourse_exam
-- ----------------------------
DROP TABLE IF EXISTS `resourse_exam`;
CREATE TABLE `resourse_exam` (
  `res_id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `courseName` varchar(255) NOT NULL COMMENT ' 课程名称',
  `res_name` varchar(255) NOT NULL COMMENT ' 考试样卷标题',
  `res_date` datetime(6) NOT NULL COMMENT ' 考试样卷上传时间',
  PRIMARY KEY (`res_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of resourse_exam
-- ----------------------------

-- ----------------------------
-- Table structure for resourse_handouts
-- ----------------------------
DROP TABLE IF EXISTS `resourse_handouts`;
CREATE TABLE `resourse_handouts` (
  `res_id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `courseName` varchar(255) NOT NULL COMMENT ' 课程名称',
  `res_name` varchar(255) NOT NULL COMMENT ' 课程讲义标题',
  `res_date` datetime(6) NOT NULL COMMENT ' 课程讲义上传时间',
  PRIMARY KEY (`res_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of resourse_handouts
-- ----------------------------
INSERT INTO `resourse_handouts` VALUES ('3', '数据分析', '第一章.ppt', '2021-05-25 12:18:12.000000');

-- ----------------------------
-- Table structure for resourse_project
-- ----------------------------
DROP TABLE IF EXISTS `resourse_project`;
CREATE TABLE `resourse_project` (
  `res_id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `courseName` varchar(255) NOT NULL COMMENT ' 课程名称',
  `res_name` varchar(255) NOT NULL COMMENT ' 综合项目标题',
  `res_date` datetime(6) NOT NULL COMMENT ' 综合项目上传时间',
  PRIMARY KEY (`res_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of resourse_project
-- ----------------------------

-- ----------------------------
-- Table structure for resourse_test
-- ----------------------------
DROP TABLE IF EXISTS `resourse_test`;
CREATE TABLE `resourse_test` (
  `res_id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `courseName` varchar(255) NOT NULL COMMENT ' 课程名称',
  `res_name` varchar(255) NOT NULL COMMENT ' 实验设计标题',
  `res_date` datetime(6) NOT NULL COMMENT ' 实验设计上传时间',
  PRIMARY KEY (`res_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of resourse_test
-- ----------------------------

-- ----------------------------
-- Table structure for resourse_way
-- ----------------------------
DROP TABLE IF EXISTS `resourse_way`;
CREATE TABLE `resourse_way` (
  `res_id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `courseName` varchar(255) NOT NULL COMMENT ' 课程名称',
  `res_way` varchar(2000) NOT NULL COMMENT ' 考核方式',
  PRIMARY KEY (`res_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of resourse_way
-- ----------------------------
INSERT INTO `resourse_way` VALUES ('1', '数据分析', '考核环节构成：出勤、课后作业、编程小练习、学期末大作业和期末考试，其中课后作业5-6次，编程练习3-4次，课后大作业1次。分数构成：总分=卷面成绩+平时成绩，卷面成绩占比：60%~70%，平时成绩占比：30%~40%。');
INSERT INTO `resourse_way` VALUES ('2', '大数据与数据采集', '考核环节构成：出勤、课后作业、编程小练习、学期末大作业和期末考试，其中课后作业5-6次，编程练习3-4次，课后大作业1次。分数构成：总分=卷面成绩+平时成绩，卷面成绩占比：60%~70%，平时成绩占比：30%~40%。');
INSERT INTO `resourse_way` VALUES ('3', '数据可视化', ' 考核环节构成：出勤、课后作业、编程小练习、学期末大作业和期末考试，其中课后作业5-6次，编程练习3-4次，课后大作业1次。分数构成：总分=卷面成绩+平时成绩，卷面成绩占比：60%~70%，平时成绩占比：30%~40%。');
INSERT INTO `resourse_way` VALUES ('4', '机器学习与模式识别', ' 考核环节构成：出勤、课后作业、编程小练习、学期末大作业和期末考试，其中课后作业5-6次，编程练习3-4次，课后大作业1次。分数构成：总分=卷面成绩+平时成绩，卷面成绩占比：60%~70%，平时成绩占比：30%~40%。');

-- ----------------------------
-- Table structure for team_construction
-- ----------------------------
DROP TABLE IF EXISTS `team_construction`;
CREATE TABLE `team_construction` (
  `tea_id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `tea_construction` varchar(10000) NOT NULL COMMENT '整体结构',
  `tea_train` varchar(1000) NOT NULL COMMENT '师资培训',
  PRIMARY KEY (`tea_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of team_construction
-- ----------------------------
INSERT INTO `team_construction` VALUES ('1', '这是一段文本这是一段文本', '这是一段文本这是一段文本');

-- ----------------------------
-- Table structure for team_teacher
-- ----------------------------
DROP TABLE IF EXISTS `team_teacher`;
CREATE TABLE `team_teacher` (
  `tea_id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `tea_name` varchar(255) NOT NULL COMMENT '教师名称',
  `tea_introduce` varchar(2000) DEFAULT NULL COMMENT '教师简介',
  `tea_course` varchar(2000) DEFAULT NULL COMMENT '主要课程',
  `tea_topic` varchar(2000) DEFAULT NULL COMMENT '研究课题',
  `tea_achivement` varchar(2000) DEFAULT NULL COMMENT '研究成果',
  PRIMARY KEY (`tea_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of team_teacher
-- ----------------------------
INSERT INTO `team_teacher` VALUES ('1', '温长吉', '副教授，工学博士，硕士生导师，数据科学与大数据技术专业负责人。', '模式识别、离散数学', '主要从事可见光和高光谱成像分析与理解技术研究，并在农业病虫害识别与防治、作物胁迫等领域开展相关研究与应用。', '主持承担吉林省自然科学基金等省级项目3项，主要参加人承担国家自然科学基金重点基金、国家自然科学基金面上项目3项，在研国家重点科技研发项目2项，省部级项目5项。在（《电子学报》（英文版）、《农业工程学报》、《农业机械学报》、《计算机学报》等期刊发表论文30余篇。授权发明专利2项，公开实用新型专利2项，软件著作权12项。第一完成人获吉林省自然学术成果三等奖1项，主要完成人获吉林省科技进步二等奖1项。主持吉林省教育厅等省级教研立项3项，主要参加人完成省级优秀课程1项，参编农业部“十二五”规划教材2部。指导学生参加国家大学生数学建模竞赛获奖16项，其中国家二等奖2项，吉林赛区一等奖4项。');
INSERT INTO `team_teacher` VALUES ('2', '测试', '测试', '测试', '测试', '测试');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `username` char(16) NOT NULL COMMENT '用户名，与学号一致',
  `password` char(16) NOT NULL COMMENT '密码',
  `authority` varchar(255) NOT NULL COMMENT '权限',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `sex` varchar(255) DEFAULT NULL COMMENT '性别',
  `grade` varchar(255) DEFAULT NULL COMMENT '年级',
  `major` varchar(255) DEFAULT NULL COMMENT '专业',
  `stu_number` varchar(20) DEFAULT NULL COMMENT '学号',
  PRIMARY KEY (`user_id`,`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin', '123456', 'teacher', null, null, null, null, null);
INSERT INTO `users` VALUES ('3', '12171217', '123456', 'student', '梅博', '男', '2017', '信息与计算科学', '12171217');
INSERT INTO `users` VALUES ('8', '12171218', '123456', 'student', '测试', '男', '2017', '信息', '12171218');
INSERT INTO `users` VALUES ('9', '12171219', '123456', 'student', null, null, null, null, null);
INSERT INTO `users` VALUES ('11', '12171220', '123456', 'student', '测试', '男', '2017', '信息', '12171220');
INSERT INTO `users` VALUES ('18', 'admin1', '123456', 'teacher', '测试', '', '', '', '');

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `vid_id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `courseName` varchar(255) NOT NULL COMMENT '课程名称',
  `vid_name` varchar(255) NOT NULL COMMENT '视频名称',
  `vid_date` datetime(6) NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`vid_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of video
-- ----------------------------

-- ----------------------------
-- Table structure for website
-- ----------------------------
DROP TABLE IF EXISTS `website`;
CREATE TABLE `website` (
  `web_id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `web_name` varchar(255) NOT NULL COMMENT '网站名称',
  `web_link` varchar(255) NOT NULL COMMENT ' 网站链接',
  PRIMARY KEY (`web_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of website
-- ----------------------------
INSERT INTO `website` VALUES ('1', '百度', 'https://www.baidu.com');
INSERT INTO `website` VALUES ('2', 'QQ音乐', 'https://y.qq.com');
INSERT INTO `website` VALUES ('3', '电商后台网站', 'http://www.meibo.design');
INSERT INTO `website` VALUES ('5', '测试', 'https://www.baidu.com');
INSERT INTO `website` VALUES ('6', '测试', 'https://www.baidu.com');
INSERT INTO `website` VALUES ('7', '测试', 'https://www.baidu.com');
INSERT INTO `website` VALUES ('8', '测试', 'https://www.baidu.com');

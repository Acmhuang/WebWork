/*
Navicat MySQL Data Transfer

Source Server         : lfzj
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2021-11-18 09:41:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `books`
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookname` varchar(20) DEFAULT NULL,
  `author` varchar(10) DEFAULT NULL,
  `pub` varchar(20) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES ('1', 'Java程序设计', '张三', '清华大学出版社', '25');
INSERT INTO `books` VALUES ('2', '21天精通Java', '张四', '电子工业出版社', '36');
INSERT INTO `books` VALUES ('3', 'Java编程思想', '李五', '高等教育出版社', '78');
INSERT INTO `books` VALUES ('4', 'Python程序设计', '刘六', '人民邮电出版社', '100000');

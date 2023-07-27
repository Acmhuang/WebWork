/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2021-11-20 09:38:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `pubs`
-- ----------------------------
DROP TABLE IF EXISTS `pubs`;
CREATE TABLE `pubs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pubs
-- ----------------------------
INSERT INTO `pubs` VALUES ('1', '清华大学出版社');
INSERT INTO `pubs` VALUES ('2', '电子工业出版社');
INSERT INTO `pubs` VALUES ('3', '人民邮电出版社');
INSERT INTO `pubs` VALUES ('4', '中国水利水电出版社');
INSERT INTO `pubs` VALUES ('5', '高等教育出版社');
INSERT INTO `pubs` VALUES ('6', '无可奈何花落去');

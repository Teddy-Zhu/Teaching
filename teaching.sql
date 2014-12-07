/*
Navicat MySQL Data Transfer

Source Server         : roomorder
Source Server Version : 50610
Source Host           : localhost:3306
Source Database       : teaching

Target Server Type    : MYSQL
Target Server Version : 50610
File Encoding         : 65001

Date: 2014-12-07 15:10:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `intBookId` int(11) NOT NULL,
  `strBookCoding` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '教材代码',
  `strBookSN` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'isbn号',
  `intBookTypeId` int(11) NOT NULL COMMENT '教材类型',
  `strPrice` varchar(255) NOT NULL,
  `strPress` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '出版社',
  `strAuthor` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `intPriceDiscount` int(11) NOT NULL,
  `intSupplierId` int(11) NOT NULL,
  PRIMARY KEY (`intBookId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of book
-- ----------------------------

-- ----------------------------
-- Table structure for bookEnter
-- ----------------------------
DROP TABLE IF EXISTS `bookEnter`;
CREATE TABLE `bookEnter` (
  `intBookEnterId` int(11) NOT NULL,
  `intBookId` int(11) NOT NULL,
  `intUserId` int(11) NOT NULL,
  `intCount` varchar(255) COLLATE utf8_bin NOT NULL,
  `dateEnter` datetime NOT NULL,
  `strUseYear` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`intBookEnterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of bookEnter
-- ----------------------------

-- ----------------------------
-- Table structure for bookOut
-- ----------------------------
DROP TABLE IF EXISTS `bookOut`;
CREATE TABLE `bookOut` (
  `intBookOutId` int(11) NOT NULL,
  `intUserId` int(11) NOT NULL,
  `intForId` int(11) NOT NULL,
  `dateOut` datetime NOT NULL,
  `intOutCount` int(11) NOT NULL,
  `intStudentId` int(11) DEFAULT NULL COMMENT '学生必填',
  `intStudentName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `intSex` tinyint(4) NOT NULL COMMENT '0 女 1 男',
  `intClassId` int(11) NOT NULL,
  PRIMARY KEY (`intBookOutId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of bookOut
-- ----------------------------

-- ----------------------------
-- Table structure for bookReturn
-- ----------------------------
DROP TABLE IF EXISTS `bookReturn`;
CREATE TABLE `bookReturn` (
  `intBookReturnId` int(11) NOT NULL,
  `intUserId` int(11) NOT NULL,
  `intForId` int(11) NOT NULL,
  `intReturnCount` int(11) NOT NULL,
  `dateReturnTime` datetime NOT NULL,
  `intOperationPersionId` int(11) NOT NULL,
  PRIMARY KEY (`intBookReturnId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of bookReturn
-- ----------------------------

-- ----------------------------
-- Table structure for bookType
-- ----------------------------
DROP TABLE IF EXISTS `bookType`;
CREATE TABLE `bookType` (
  `intBookTypeId` int(11) NOT NULL,
  `strBookTypeName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`intBookTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bookType
-- ----------------------------
INSERT INTO `bookType` VALUES ('1', '出版社教材');
INSERT INTO `bookType` VALUES ('2', '自编教材');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `intDepartmentId` int(11) NOT NULL,
  `strDepartmentName` varchar(255) COLLATE utf8_bin NOT NULL,
  `strDepartmentPhone` varchar(255) COLLATE utf8_bin NOT NULL,
  `intDepartmentCoding` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`intDepartmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of department
-- ----------------------------

-- ----------------------------
-- Table structure for forType
-- ----------------------------
DROP TABLE IF EXISTS `forType`;
CREATE TABLE `forType` (
  `intForId` int(11) NOT NULL,
  `strUseName` varchar(255) COLLATE utf8_bin NOT NULL,
  `intUserId` int(11) NOT NULL,
  PRIMARY KEY (`intForId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of forType
-- ----------------------------
INSERT INTO `forType` VALUES ('1', '教师领用', '3');
INSERT INTO `forType` VALUES ('2', '学生领用', '4');
INSERT INTO `forType` VALUES ('3', '书商回收', '0');
INSERT INTO `forType` VALUES ('4', '学生退回', '4');
INSERT INTO `forType` VALUES ('5', '教师退回', '3');

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `intLogId` int(11) NOT NULL,
  `intOperationId` varchar(255) COLLATE utf8_bin NOT NULL,
  `dateOperationTime` datetime NOT NULL,
  `intUserId` int(11) NOT NULL,
  PRIMARY KEY (`intLogId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of logs
-- ----------------------------

-- ----------------------------
-- Table structure for moneyResult
-- ----------------------------
DROP TABLE IF EXISTS `moneyResult`;
CREATE TABLE `moneyResult` (
  `intResultId` int(11) NOT NULL,
  `intUserId` int(11) NOT NULL,
  `intOperationUserId` int(11) NOT NULL COMMENT '结算人',
  `intResultTypeId` int(11) NOT NULL,
  `strPrice` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`intResultId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of moneyResult
-- ----------------------------

-- ----------------------------
-- Table structure for operation
-- ----------------------------
DROP TABLE IF EXISTS `operation`;
CREATE TABLE `operation` (
  `intOperationId` int(11) NOT NULL,
  `strOperationName` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`intOperationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of operation
-- ----------------------------

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `intSupplierId` int(11) NOT NULL,
  `intCoding` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '供应商代码',
  `strName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '供应商名称',
  `strAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `strCompanyPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `strHandlePersonName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sttHandlePhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `strContactPersonName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `strContactPersonPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`intSupplierId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of supplier
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `intId` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `strName` varchar(255) NOT NULL,
  `strTypeId` int(11) NOT NULL,
  `strPhone` varchar(255) DEFAULT NULL,
  `strMail` varchar(255) NOT NULL,
  PRIMARY KEY (`intId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for userType
-- ----------------------------
DROP TABLE IF EXISTS `userType`;
CREATE TABLE `userType` (
  `intIdentityId` int(11) NOT NULL,
  `strName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`intIdentityId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of userType
-- ----------------------------
INSERT INTO `userType` VALUES ('1', '管理员');
INSERT INTO `userType` VALUES ('2', '图书管理员');
INSERT INTO `userType` VALUES ('3', '教师');
INSERT INTO `userType` VALUES ('4', '学生');

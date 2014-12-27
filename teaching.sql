/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50610
Source Host           : localhost:3306
Source Database       : teaching

Target Server Type    : MYSQL
Target Server Version : 50610
File Encoding         : 65001

Date: 2014-12-27 16:00:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `intBookId` int(11) NOT NULL AUTO_INCREMENT,
  `strBookName` varchar(255) COLLATE utf8_bin NOT NULL,
  `strBookCoding` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '教材代码',
  `strBookSN` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'isbn号',
  `intBookTypeId` int(11) NOT NULL COMMENT '教材类型',
  `strPrice` double(11,3) NOT NULL,
  `strPress` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '出版社',
  `strAuthor` varchar(255) COLLATE utf8_bin NOT NULL,
  `intPriceDiscount` double(11,3) NOT NULL COMMENT '折扣',
  `intSupplierId` int(11) NOT NULL COMMENT '供应商',
  `dateAddTime` datetime NOT NULL,
  PRIMARY KEY (`intBookId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', '阿斯达3', 'B20202', '454545', '1', '41.500', 'XX出版社', '阿斯达斯', '5.600', '1', '2014-12-11 17:54:55');
INSERT INTO `book` VALUES ('2', 'AAA', 'B22190', '11912030', '2', '22.200', '22行详细', 'AA', '7.800', '2', '2014-12-12 12:47:47');
INSERT INTO `book` VALUES ('3', 'ASC', 'b2000', '125030', '2', '12.050', '阿斯dad', '22sss', '5.400', '1', '2014-12-22 16:34:18');
INSERT INTO `book` VALUES ('4', 'XXXX', 'B122', '45145', '2', '101.000', 'SDF', 'SSDFF', '4.000', '2', '2014-12-25 10:01:19');
INSERT INTO `book` VALUES ('5', '1222', 'B1212', '2222', '1', '120.000', '2222', '1111', '6.000', '1', '2014-12-25 10:43:01');
INSERT INTO `book` VALUES ('6', 'xxxx', 'Bookaa', 'xxxzx', '1', '12.900', '121', 'azzz', '1.500', '1', '2014-12-25 13:46:50');
INSERT INTO `book` VALUES ('7', '啊啊啊1', 'B122122', '2S2A2S', '1', '33.100', '阿斯顿的', '砸死是', '9.800', '3', '2014-12-25 14:06:13');
INSERT INTO `book` VALUES ('8', '121a2', 'Baaa11', 'asa', '2', '12.014', '1231', 'za', '2.500', '1', '2014-12-25 14:57:12');
INSERT INTO `book` VALUES ('9', 'aasd', 'asasas', 'as12312', '1', '123.000', '122d', '123', '1.300', '1', '2014-12-25 15:19:45');
INSERT INTO `book` VALUES ('10', '多少岁', 'Baaas', '23', '2', '15.010', 'zsss', 'ssdd', '10.000', '1', '2014-12-25 15:20:15');
INSERT INTO `book` VALUES ('13', '打底裤', 'B12022', '221323', '1', '100.300', '爱思考思考', '可可豆', '9.300', '2', '2014-12-27 13:39:53');

-- ----------------------------
-- Table structure for bookEnter
-- ----------------------------
DROP TABLE IF EXISTS `bookEnter`;
CREATE TABLE `bookEnter` (
  `intBookEnterId` int(11) NOT NULL AUTO_INCREMENT,
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
  `intBookOutId` int(11) NOT NULL AUTO_INCREMENT,
  `intUserId` int(11) NOT NULL,
  `intForId` int(11) NOT NULL,
  `dateOut` datetime NOT NULL,
  `intOutCount` int(11) NOT NULL,
  `intStudentId` int(11) DEFAULT NULL COMMENT '学生必填',
  `intStudentName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `intSex` int(11) NOT NULL COMMENT '0 女 1 男',
  `intClassId` int(11) NOT NULL,
  `dateOutTime` datetime NOT NULL,
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
  `intBookReturnId` int(11) NOT NULL AUTO_INCREMENT,
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
  `intBookTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `strBookTypeName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`intBookTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bookType
-- ----------------------------
INSERT INTO `bookType` VALUES ('1', '出版社教材');
INSERT INTO `bookType` VALUES ('2', '自编教材');

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `intConfigId` int(11) NOT NULL AUTO_INCREMENT,
  `strName` varchar(255) COLLATE utf8_bin NOT NULL,
  `strValue` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`intConfigId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('1', 'version', '1');
INSERT INTO `config` VALUES ('2', 'funcversion', '0003');
INSERT INTO `config` VALUES ('3', 'buildversion', '00');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `intDepartmentId` int(11) NOT NULL AUTO_INCREMENT,
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
  `intForId` int(11) NOT NULL AUTO_INCREMENT,
  `strUseName` varchar(255) COLLATE utf8_bin NOT NULL,
  `intUserId` int(11) NOT NULL,
  PRIMARY KEY (`intForId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
  `intLogId` int(11) NOT NULL AUTO_INCREMENT,
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
  `intResultId` int(11) NOT NULL AUTO_INCREMENT,
  `intUserId` int(11) NOT NULL,
  `intOperationUserId` int(11) NOT NULL COMMENT '结算人',
  `intResultTypeId` int(11) NOT NULL,
  `strPrice` double(11,0) NOT NULL,
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
  `intOperationId` int(11) NOT NULL AUTO_INCREMENT,
  `strOperationName` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`intOperationId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of operation
-- ----------------------------
INSERT INTO `operation` VALUES ('1', '录入图书');
INSERT INTO `operation` VALUES ('2', '登录');

-- ----------------------------
-- Table structure for power
-- ----------------------------
DROP TABLE IF EXISTS `power`;
CREATE TABLE `power` (
  `intPowerId` int(11) NOT NULL AUTO_INCREMENT,
  `intUserTypeId` int(11) NOT NULL,
  `strAuthName` varchar(11) COLLATE utf8_bin NOT NULL DEFAULT '1',
  `intAuthValue` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`intPowerId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of power
-- ----------------------------
INSERT INTO `power` VALUES ('1', '1', 'Login', '1');
INSERT INTO `power` VALUES ('2', '2', 'Login', '1');
INSERT INTO `power` VALUES ('3', '3', 'Login', '1');
INSERT INTO `power` VALUES ('4', '4', 'Login', '1');
INSERT INTO `power` VALUES ('5', '1', 'querybook', '1');
INSERT INTO `power` VALUES ('6', '2', 'querybook', '1');
INSERT INTO `power` VALUES ('7', '3', 'querybook', '1');
INSERT INTO `power` VALUES ('8', '4', 'querybook', '1');
INSERT INTO `power` VALUES ('9', '1', 'addbook', '0');
INSERT INTO `power` VALUES ('10', '2', 'addbook', '1');
INSERT INTO `power` VALUES ('11', '3', 'addbook', '0');
INSERT INTO `power` VALUES ('12', '4', 'addbook', '0');
INSERT INTO `power` VALUES ('13', '1', 'rmbook', '0');
INSERT INTO `power` VALUES ('14', '2', 'rmbook', '1');
INSERT INTO `power` VALUES ('15', '3', 'rmbook', '0');
INSERT INTO `power` VALUES ('16', '4', 'rmbook', '0');
INSERT INTO `power` VALUES ('17', '1', 'editbook', '0');
INSERT INTO `power` VALUES ('18', '2', 'eidtbook', '1');
INSERT INTO `power` VALUES ('19', '3', 'editbook', '0');
INSERT INTO `power` VALUES ('20', '4', 'eidtbook', '0');
INSERT INTO `power` VALUES ('21', '1', 'managebook', '0');
INSERT INTO `power` VALUES ('22', '2', 'managebook', '1');
INSERT INTO `power` VALUES ('23', '3', 'managebook', '0');
INSERT INTO `power` VALUES ('24', '4', 'managebook', '0');

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `intSupplierId` int(11) NOT NULL AUTO_INCREMENT,
  `intCoding` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '供应商代码',
  `strName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '供应商名称',
  `strAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `strCompanyPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `strHandlePersonName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sttHandlePhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `strContactPersonName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `strContactPersonPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`intSupplierId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('1', 'S11050', '测试供应商1', '2aaaa', '111', '控制人', '189111', '联系人', '120580');
INSERT INTO `supplier` VALUES ('2', 'S15033', 'testSupplier2', '2202sd', '22165', 'controllerPersion', '126980', 'CONTACT', '1222222222');
INSERT INTO `supplier` VALUES ('3', 'S88212', 'aaaa', 'AAA', '0223030', '111', '20302', '12ass', '2223050');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `intId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `strName` varchar(255) NOT NULL,
  `intTypeId` int(11) NOT NULL,
  `strPhone` varchar(255) DEFAULT NULL,
  `strMail` varchar(255) NOT NULL,
  `dateRegTime` datetime NOT NULL,
  PRIMARY KEY (`intId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'Admin', 'a', 'www', '1', '1111', '2123', '2014-12-07 18:32:09');
INSERT INTO `user` VALUES ('2', 'Troevil', '123456', 'SSSF', '2', '18994323', '2121@qq.com', '2014-12-07 18:58:27');
INSERT INTO `user` VALUES ('3', 'TestUser', 'TestUser', 'TestUser', '3', 'asd', 'TestUser@qq.com', '2014-12-07 19:23:43');
INSERT INTO `user` VALUES ('4', 'AAAA', 'AAAAAAAA', 'AAAA', '4', 'AAAA', 'AAAA', '2014-12-07 19:25:29');
INSERT INTO `user` VALUES ('5', 'aasf', 'aasfaasf', 'aasf', '3', 'aasf', 'aasf', '2014-12-07 19:27:02');
INSERT INTO `user` VALUES ('6', 'qqq', 'qqqqqq', 'qqq', '3', '1111178888', 'qqq@11.com', '2014-12-07 20:01:39');

-- ----------------------------
-- Table structure for userType
-- ----------------------------
DROP TABLE IF EXISTS `userType`;
CREATE TABLE `userType` (
  `intIdentityId` int(11) NOT NULL AUTO_INCREMENT,
  `strName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `intAllowReg` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`intIdentityId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of userType
-- ----------------------------
INSERT INTO `userType` VALUES ('1', 'Admin', '0');
INSERT INTO `userType` VALUES ('2', 'BookManager', '0');
INSERT INTO `userType` VALUES ('3', 'Teacher', '1');
INSERT INTO `userType` VALUES ('4', 'Student', '1');

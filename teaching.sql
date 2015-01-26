/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50610
Source Host           : localhost:3306
Source Database       : teaching

Target Server Type    : MYSQL
Target Server Version : 50610
File Encoding         : 65001

Date: 2015-01-26 08:21:45
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', '阿斯达3', 'B20202', '454545', '1', '41.500', 'XX出版社', '阿斯达斯', '5.600', '1', '2014-12-11 17:54:55');
INSERT INTO `book` VALUES ('3', 'ASC', 'B2000', '125030', '2', '12.050', '阿斯dad', '22sss', '5.410', '1', '2015-01-23 14:13:17');
INSERT INTO `book` VALUES ('4', 'XXXX', 'B122', '45145', '2', '101.000', 'SDF', 'SSDFF', '4.000', '2', '2014-12-25 10:01:19');
INSERT INTO `book` VALUES ('5', '1222', 'B1212', '2222', '1', '120.000', '2222', '1111', '6.000', '1', '2014-12-25 10:43:01');
INSERT INTO `book` VALUES ('6', 'xxxx', 'Bookaa', 'xxxzx', '1', '12.900', '121', 'azzz', '1.500', '1', '2014-12-25 13:46:50');
INSERT INTO `book` VALUES ('7', '啊啊啊1', 'B122122', '2S2A2S', '1', '33.100', '阿斯顿的', '砸死是', '9.800', '3', '2014-12-25 14:06:13');
INSERT INTO `book` VALUES ('8', '121a2', 'Baaa11', 'asa', '2', '12.014', '1231', 'za', '2.500', '1', '2014-12-25 14:57:12');
INSERT INTO `book` VALUES ('9', 'aasd', 'asasas', 'as12312', '1', '123.000', '122d', '123', '1.300', '1', '2014-12-25 15:19:45');
INSERT INTO `book` VALUES ('10', '多少岁', 'Baaas', '23', '2', '15.010', 'zsss', 'ssdd', '10.000', '1', '2014-12-25 15:20:15');
INSERT INTO `book` VALUES ('13', '打底裤', 'B12022', '221323', '1', '100.300', '爱思考思考', '可可豆', '9.300', '2', '2014-12-27 13:39:53');
INSERT INTO `book` VALUES ('14', 'ass', 'A44556', 'aaa22254', '1', '100.230', 'Self', 'AAAx', '9.800', '2', '2014-12-30 18:42:35');

-- ----------------------------
-- Table structure for bookenter
-- ----------------------------
DROP TABLE IF EXISTS `bookenter`;
CREATE TABLE `bookenter` (
  `intBookEnterId` int(11) NOT NULL AUTO_INCREMENT,
  `intBookId` int(11) NOT NULL,
  `intUserId` int(11) NOT NULL,
  `intCount` varchar(255) COLLATE utf8_bin NOT NULL,
  `dateEnter` datetime NOT NULL,
  `strUseYear` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`intBookEnterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of bookenter
-- ----------------------------

-- ----------------------------
-- Table structure for bookout
-- ----------------------------
DROP TABLE IF EXISTS `bookout`;
CREATE TABLE `bookout` (
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
-- Records of bookout
-- ----------------------------

-- ----------------------------
-- Table structure for bookplan
-- ----------------------------
DROP TABLE IF EXISTS `bookplan`;
CREATE TABLE `bookplan` (
  `intPlanId` int(11) NOT NULL AUTO_INCREMENT,
  `intCourseId` int(11) NOT NULL,
  `strClass` varchar(255) NOT NULL,
  `intCountAll` int(11) NOT NULL,
  `intStudCount` int(11) NOT NULL,
  `intTeacCount` int(11) NOT NULL,
  `intOrderAllCount` int(11) NOT NULL,
  `intBookId` int(11) NOT NULL,
  `strMark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`intPlanId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bookplan
-- ----------------------------

-- ----------------------------
-- Table structure for bookreturn
-- ----------------------------
DROP TABLE IF EXISTS `bookreturn`;
CREATE TABLE `bookreturn` (
  `intBookReturnId` int(11) NOT NULL AUTO_INCREMENT,
  `intUserId` int(11) NOT NULL,
  `intForId` int(11) NOT NULL,
  `intReturnCount` int(11) NOT NULL,
  `dateReturnTime` datetime NOT NULL,
  `intOperationPersionId` int(11) NOT NULL,
  PRIMARY KEY (`intBookReturnId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of bookreturn
-- ----------------------------

-- ----------------------------
-- Table structure for booktype
-- ----------------------------
DROP TABLE IF EXISTS `booktype`;
CREATE TABLE `booktype` (
  `intBookTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `strBookTypeName` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`intBookTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of booktype
-- ----------------------------
INSERT INTO `booktype` VALUES ('1', '出版社教材');
INSERT INTO `booktype` VALUES ('2', '自编教材');

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
INSERT INTO `config` VALUES ('3', 'buildversion', '03');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `intCourseId` int(11) NOT NULL AUTO_INCREMENT,
  `intCourseType` int(11) NOT NULL,
  PRIMARY KEY (`intCourseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------

-- ----------------------------
-- Table structure for coursetype
-- ----------------------------
DROP TABLE IF EXISTS `coursetype`;
CREATE TABLE `coursetype` (
  `intCourseTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `strCourseTypeName` varchar(255) NOT NULL,
  PRIMARY KEY (`intCourseTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coursetype
-- ----------------------------

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
-- Table structure for fortype
-- ----------------------------
DROP TABLE IF EXISTS `fortype`;
CREATE TABLE `fortype` (
  `intForId` int(11) NOT NULL AUTO_INCREMENT,
  `strUseName` varchar(255) COLLATE utf8_bin NOT NULL,
  `intUserId` int(11) NOT NULL,
  PRIMARY KEY (`intForId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of fortype
-- ----------------------------
INSERT INTO `fortype` VALUES ('1', '教师领用', '3');
INSERT INTO `fortype` VALUES ('2', '学生领用', '4');
INSERT INTO `fortype` VALUES ('3', '书商回收', '0');
INSERT INTO `fortype` VALUES ('4', '学生退回', '4');
INSERT INTO `fortype` VALUES ('5', '教师退回', '3');

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
-- Table structure for moneyresult
-- ----------------------------
DROP TABLE IF EXISTS `moneyresult`;
CREATE TABLE `moneyresult` (
  `intResultId` int(11) NOT NULL AUTO_INCREMENT,
  `intUserId` int(11) NOT NULL,
  `intOperationUserId` int(11) NOT NULL COMMENT '结算人',
  `intResultTypeId` int(11) NOT NULL,
  `strPrice` double(11,0) NOT NULL,
  PRIMARY KEY (`intResultId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of moneyresult
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
INSERT INTO `power` VALUES ('18', '2', 'editbook', '1');
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
  `intCoding` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '供应商代码',
  `strName` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '供应商名称',
  `strAddress` varchar(255) COLLATE utf8_bin NOT NULL,
  `strCompanyPhone` varchar(255) COLLATE utf8_bin NOT NULL,
  `strHandlePersonName` varchar(255) COLLATE utf8_bin NOT NULL,
  `sttHandlePhone` varchar(255) COLLATE utf8_bin NOT NULL,
  `strContactPersonName` varchar(255) COLLATE utf8_bin NOT NULL,
  `strContactPersonPhone` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`intSupplierId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
  `username` varchar(255) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `strName` varchar(255) CHARACTER SET latin1 NOT NULL,
  `intTypeId` int(11) NOT NULL,
  `intUserDepartment` int(255) NOT NULL,
  `strStuNum` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '学号或教师号',
  `strPhone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `strMail` varchar(255) CHARACTER SET latin1 NOT NULL,
  `dateRegTime` datetime NOT NULL,
  PRIMARY KEY (`intId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'Admin', 'a', 'www', '1', '0', '222', '1111', '2123', '2014-12-07 18:32:09');
INSERT INTO `user` VALUES ('2', 'Troevil', '123456', 'SSSF', '2', '0', '1234234', '18994323', '2121@qq.com', '2014-12-07 18:58:27');
INSERT INTO `user` VALUES ('3', 'TestUser', 'TestUser', 'TestUser', '3', '0', '2342342', 'asd', 'TestUser@qq.com', '2014-12-07 19:23:43');
INSERT INTO `user` VALUES ('4', 'AAAA', 'AAAAAAAA', 'AAAA', '4', '0', '363464', 'AAAA', 'AAAA', '2014-12-07 19:25:29');
INSERT INTO `user` VALUES ('5', 'aasf', 'aasfaasf', 'aasf', '3', '0', '34432453', 'aasf', 'aasf', '2014-12-07 19:27:02');
INSERT INTO `user` VALUES ('6', 'qqq', 'qqqqqq', 'qqq', '3', '0', '2342343', '1111178888', 'qqq@11.com', '2014-12-07 20:01:39');

-- ----------------------------
-- Table structure for userdepartment
-- ----------------------------
DROP TABLE IF EXISTS `userdepartment`;
CREATE TABLE `userdepartment` (
  `intId` int(11) NOT NULL AUTO_INCREMENT,
  `intParentId` int(11) NOT NULL,
  `strName` varchar(255) NOT NULL,
  `isLeaf` int(11) NOT NULL,
  PRIMARY KEY (`intId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userdepartment
-- ----------------------------
INSERT INTO `userdepartment` VALUES ('1', '0', 'System', '0');
INSERT INTO `userdepartment` VALUES ('2', '1', '信息工程', '0');
INSERT INTO `userdepartment` VALUES ('3', '2', '软件工程', '1');
INSERT INTO `userdepartment` VALUES ('4', '1', '机电工程', '0');
INSERT INTO `userdepartment` VALUES ('5', '4', '机械工程及自动化', '1');
INSERT INTO `userdepartment` VALUES ('6', '4', '车辆工程', '1');

-- ----------------------------
-- Table structure for usertype
-- ----------------------------
DROP TABLE IF EXISTS `usertype`;
CREATE TABLE `usertype` (
  `intIdentityId` int(11) NOT NULL AUTO_INCREMENT,
  `strName` varchar(255) COLLATE utf8_bin NOT NULL,
  `intAllowReg` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`intIdentityId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of usertype
-- ----------------------------
INSERT INTO `usertype` VALUES ('1', 'Admin', '0');
INSERT INTO `usertype` VALUES ('2', 'BookManager', '0');
INSERT INTO `usertype` VALUES ('3', 'Teacher', '1');
INSERT INTO `usertype` VALUES ('4', 'Student', '1');

-- ----------------------------
-- Table structure for versionlog
-- ----------------------------
DROP TABLE IF EXISTS `versionlog`;
CREATE TABLE `versionlog` (
  `intId` int(11) NOT NULL AUTO_INCREMENT,
  `strFunVersion` varchar(255) NOT NULL,
  `strBuildVersion` varchar(255) NOT NULL,
  `strVersion` varchar(255) NOT NULL,
  `strUpdateComment` varchar(255) NOT NULL,
  `dateUpdateTime` datetime NOT NULL,
  PRIMARY KEY (`intId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of versionlog
-- ----------------------------
INSERT INTO `versionlog` VALUES ('1', '0003', '03', '1', 'none', '2015-01-08 15:19:17');
INSERT INTO `versionlog` VALUES ('2', '0004', '00', '1', '新增version log 查阅', '2015-01-22 15:20:07');
INSERT INTO `versionlog` VALUES ('3', '0004', '01', '1', '修复批量编辑book的bug', '2015-01-23 14:05:24');

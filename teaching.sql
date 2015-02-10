/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : teaching

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2015-02-10 15:30:36
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('4', '电子商务与物流管理第2版', 'B122', '45145', '1', '101.000', '纷纭出版社', 'SSDFF', '4.000', '1', '2015-02-02 17:37:54');
INSERT INTO `book` VALUES ('5', '一分钟探案高手', 'B1212', '2222', '1', '120.000', '2222', '1111', '6.000', '1', '2015-02-02 16:06:25');
INSERT INTO `book` VALUES ('6', '驼峰航线', 'Bookaa', 'xxxzx', '1', '12.900', '121', 'azzz', '1.500', '1', '2015-02-02 16:06:38');
INSERT INTO `book` VALUES ('8', '中南海备忘录', 'Baaa233', 'asa', '1', '12.014', '1231', 'za', '2.500', '4', '2015-02-10 13:19:00');
INSERT INTO `book` VALUES ('13', 'SQL Server 2008 商业智能完美解决方案', 'B12022', '221323', '1', '100.300', '爱思考思考', '可可豆', '9.300', '1', '2015-02-02 16:01:37');
INSERT INTO `book` VALUES ('15', '英语口语短句大王', 'B1230', '45', '1', '458.400', '45', '4545', '6.000', '1', '2015-02-02 16:06:25');
INSERT INTO `book` VALUES ('16', '跟毛泽东学思维', 'B1230', '45', '1', '458.400', '45', '4545', '7.000', '1', '2015-02-10 11:29:20');
INSERT INTO `book` VALUES ('17', '图书汉字的故事', 'B1230ss', '45', '1', '458.400', '45', '4545', '7.000', '1', '2015-02-02 16:06:25');
INSERT INTO `book` VALUES ('18', 'CSS HTML ·XHTML语法与范例辞典', 'B2015256', 'aaa', '1', '199.000', '45454', 'ssss', '10.000', '1', '2015-02-02 15:59:57');
INSERT INTO `book` VALUES ('19', '公务员电子政务技 术实用指南', 'A25554', '45AS3', '1', '222.000', '猜猜猜', 'none', '5.000', '1', '2015-02-02 16:07:46');
INSERT INTO `book` VALUES ('20', '母亲杨沫', 'A25554', '45AS3', '1', '222.000', '猜猜猜', 'none', '5.000', '1', '2015-02-02 16:07:33');
INSERT INTO `book` VALUES ('21', '国家电网公司电力安全工作规程', 'B22206', '9787508391311', '1', '100.000', '中国电力出版社', '国家电网公司', '10.000', '1', '2015-02-10 14:28:13');
INSERT INTO `book` VALUES ('22', '电力安全监督管理工作手册', 'B22205', '9787512348660', '1', '100.000', '中国电力出版社', '国家电网公司', '10.000', '5', '2015-02-10 14:28:40');
INSERT INTO `book` VALUES ('23', '谁动了我的奶酪', 'Z4005', '44545', '1', '17.400', 'none', '斯宾塞.约翰逊', '10.000', '3', '2015-02-10 14:29:51');

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
  `intUserId` int(11) NOT NULL COMMENT '申请人',
  `strMark` varchar(255) DEFAULT NULL,
  `isAllow` int(11) NOT NULL DEFAULT '0' COMMENT '0 审核 1 通过 2 拒绝 3 作废',
  `dateaddtime` datetime NOT NULL,
  PRIMARY KEY (`intPlanId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bookplan
-- ----------------------------
INSERT INTO `bookplan` VALUES ('1', '1', '121', '12', '12', '12', '121', '4', '0', null, '0', '2015-02-10 14:03:34');

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
  `strAuthName` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '1',
  `intAuthValue` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`intPowerId`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
INSERT INTO `power` VALUES ('9', '1', 'addbook', '1');
INSERT INTO `power` VALUES ('10', '2', 'addbook', '1');
INSERT INTO `power` VALUES ('11', '3', 'addbook', '0');
INSERT INTO `power` VALUES ('12', '4', 'addbook', '0');
INSERT INTO `power` VALUES ('13', '1', 'rmbook', '1');
INSERT INTO `power` VALUES ('14', '2', 'rmbook', '1');
INSERT INTO `power` VALUES ('15', '3', 'rmbook', '0');
INSERT INTO `power` VALUES ('16', '4', 'rmbook', '0');
INSERT INTO `power` VALUES ('17', '1', 'editbook', '1');
INSERT INTO `power` VALUES ('18', '2', 'editbook', '1');
INSERT INTO `power` VALUES ('19', '3', 'editbook', '0');
INSERT INTO `power` VALUES ('20', '4', 'eidtbook', '0');
INSERT INTO `power` VALUES ('21', '1', 'managebook', '1');
INSERT INTO `power` VALUES ('22', '2', 'managebook', '1');
INSERT INTO `power` VALUES ('23', '3', 'managebook', '0');
INSERT INTO `power` VALUES ('24', '4', 'managebook', '0');
INSERT INTO `power` VALUES ('25', '1', 'getalluser', '1');
INSERT INTO `power` VALUES ('26', '1', 'getallusertype', '1');
INSERT INTO `power` VALUES ('27', '1', 'adduser', '1');
INSERT INTO `power` VALUES ('28', '1', 'edituser', '1');
INSERT INTO `power` VALUES ('29', '1', 'rmuser', '1');
INSERT INTO `power` VALUES ('30', '1', 'getallsupplier', '1');
INSERT INTO `power` VALUES ('31', '1', 'addsupplier', '1');
INSERT INTO `power` VALUES ('32', '1', 'editsupplier', '1');
INSERT INTO `power` VALUES ('33', '1', 'rmsupplier', '1');
INSERT INTO `power` VALUES ('34', '1', 'adduserdepart', '1');
INSERT INTO `power` VALUES ('35', '1', 'edituserdepart', '1');
INSERT INTO `power` VALUES ('36', '1', 'rmuserdepart', '1');

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
  `strHandlePhone` varchar(255) COLLATE utf8_bin NOT NULL,
  `strContactPersonName` varchar(255) COLLATE utf8_bin NOT NULL,
  `strContactPersonPhone` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`intSupplierId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('1', 'S11050', '测试供应商1', '2aaaa', '111', '负责人', '189111', '联系人', '120580');
INSERT INTO `supplier` VALUES ('3', 'S88212', '才是实现信息', 'AAA', '0223030', '111', '20302', '12ass', '2223050');
INSERT INTO `supplier` VALUES ('4', 'SSSS', '阿瑟斯', '阿阿水的', '1894111', '房改房1', '房改房1', '斯蒂芬森', '454545');
INSERT INTO `supplier` VALUES ('5', 'S102556', '供应商2', '不知道', '111111', '无人', '1116880', '爱学习', '18994160911');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `intId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `strName` varchar(255) COLLATE utf8_bin NOT NULL,
  `intTypeId` int(11) NOT NULL,
  `intUserMajor` int(11) NOT NULL,
  `intUserDepartment` int(11) NOT NULL,
  `strStuNum` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '学号或教师号',
  `strPhone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `strMail` varchar(255) COLLATE utf8_bin NOT NULL,
  `dateRegTime` datetime NOT NULL,
  PRIMARY KEY (`intId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'Admin', 'a', 'www', '1', '6', '4', '222', '1111', 'administrator@qq.com', '2015-02-05 15:21:41');
INSERT INTO `user` VALUES ('2', 'Troevil', '123456', 'SSSFF', '2', '3', '2', '1234234', '18994323', '2121@qq.com', '2015-02-09 16:07:07');
INSERT INTO `user` VALUES ('3', 'TestUser', 'TestUser', 'TestUser', '3', '5', '4', '2342342', 'asd', 'TestUser@qq.com', '2015-02-04 17:20:53');
INSERT INTO `user` VALUES ('4', 'AAAA', 'AAAAAAAA', 'AAAA', '4', '6', '4', '363464', 'AAAA', 'AAAA', '2014-12-07 19:25:29');
INSERT INTO `user` VALUES ('5', 'aasf', 'aasfaasf', 'aasf', '3', '6', '4', '34432453', 'aasf', 'aasf', '2014-12-07 19:27:02');
INSERT INTO `user` VALUES ('6', 'qqq', 'qqqqqq', 'qqq', '3', '5', '4', '2342343', '1111178888', 'qqq@11.com', '2014-12-07 20:01:39');
INSERT INTO `user` VALUES ('7', 'TestForInject', 'TestForInject', 'TestForInject', '4', '6', '4', '1112232', '1111', 'TestForInject', '2015-02-04 17:54:08');
INSERT INTO `user` VALUES ('8', 'TestForAddUser', 'TestForAddUser', 'TestForAddUser', '1', '5', '4', 'TestForAddUser', '111111', 'TestForAddUser@qq.com', '2015-02-02 17:24:57');
INSERT INTO `user` VALUES ('9', 'TestForAddUser2', 'TestForAddUser2', 'TestForAddUser2', '1', '6', '4', '121231231', '111111', 'TestForAddUser2@qq.com', '2015-02-02 17:25:44');
INSERT INTO `user` VALUES ('11', 'Test', '1asasds', 'ss222', '3', '6', '4', '656564', '11111', '655', '2015-02-05 10:02:07');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of versionlog
-- ----------------------------
INSERT INTO `versionlog` VALUES ('1', '0003', '03', '1', 'none', '2015-01-08 15:19:17');
INSERT INTO `versionlog` VALUES ('2', '0004', '00', '1', '新增version log 查阅', '2015-01-22 15:20:07');
INSERT INTO `versionlog` VALUES ('3', '0004', '01', '1', '修复批量编辑book的bug', '2015-01-23 14:05:24');
INSERT INTO `versionlog` VALUES ('4', '0005', '00', '1', '新增管理员管理用户功能【添加】，【批量查询修改用户】<br> 修复若干Bug', '2015-02-04 18:02:02');
INSERT INTO `versionlog` VALUES ('5', '0006', '00', '1', '新增批量删除用户 <br> 新增用户个人信息管理 。<br> 完善界面UI', '2015-02-05 15:19:50');
INSERT INTO `versionlog` VALUES ('6', '0007', '00', '1', '【新增】Nprogress进度条插件', '2015-02-05 16:48:10');
INSERT INTO `versionlog` VALUES ('7', '0007', '01', '1', '修复管理员更新user信息时判断用户名重复的bug', '2015-02-06 20:24:18');
INSERT INTO `versionlog` VALUES ('8', '0008', '00', '1', '新增供应商管理功能。 <br> 修复删除书籍，删除用户时关联表问题，当删除记录被使用是禁止删除<br> 修复若干其他Bug', '2015-02-10 15:18:47');

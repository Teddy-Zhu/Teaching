/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : teaching

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2015-03-05 16:44:23
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
INSERT INTO `book` VALUES ('5', '一分钟探案高手', 'B1212', '2222', '1', '120.000', '2222', '1111', '6.000', '4', '2015-03-05 15:39:43');
INSERT INTO `book` VALUES ('13', 'SQL Server 2008 商业智能完美解决方案', 'B12022', '221323', '1', '100.300', '爱思考思考', '可可豆', '9.300', '1', '2015-02-02 16:01:37');
INSERT INTO `book` VALUES ('15', '英语口语短句大王', 'B1230', '45', '4', '458.400', '45', '4545', '6.000', '3', '2015-03-05 16:39:40');
INSERT INTO `book` VALUES ('16', '跟毛泽东学思维', 'B1230', '45', '1', '458.400', '45', '4545', '7.000', '5', '2015-03-05 15:32:15');
INSERT INTO `book` VALUES ('17', '图书汉字的故事', 'B1230ss', '45', '1', '458.400', '45', '4545', '7.000', '1', '2015-02-02 16:06:25');
INSERT INTO `book` VALUES ('18', 'CSS HTML ·XHTML语法与范例辞典', 'B2015256', 'aaa', '1', '199.000', '45454', 'ssss', '10.000', '4', '2015-03-05 15:39:43');
INSERT INTO `book` VALUES ('19', '公务员电子政务技 术实用指南', 'A25554', '45AS3', '4', '222.000', '猜猜猜', 'none', '5.000', '6', '2015-03-05 16:30:09');
INSERT INTO `book` VALUES ('20', '母亲杨沫', 'A25554', '45AS3', '4', '222.000', '猜猜猜', 'none', '5.000', '1', '2015-03-05 16:30:25');
INSERT INTO `book` VALUES ('21', '国家电网公司电力安全工作规程', 'B22206', '9787508391311', '1', '100.000', '中国电力出版社', '国家电网公司', '10.000', '5', '2015-03-05 16:39:48');
INSERT INTO `book` VALUES ('22', '电力安全监督管理工作手册', 'B22205', '9787512348660', '1', '100.000', '中国电力出版社', '国家电网公司', '10.000', '5', '2015-02-10 14:28:40');
INSERT INTO `book` VALUES ('23', '谁动了我的奶酪', 'Z4005', '44545', '1', '17.400', 'none', '斯宾塞.约翰逊', '10.000', '3', '2015-02-10 14:29:51');

-- ----------------------------
-- Table structure for bookplan
-- ----------------------------
DROP TABLE IF EXISTS `bookplan`;
CREATE TABLE `bookplan` (
  `intPlanId` int(11) NOT NULL AUTO_INCREMENT,
  `strCourseName` varchar(255) NOT NULL COMMENT '课程名称',
  `intCourseTypeId` int(11) NOT NULL COMMENT '课程类别',
  `strClass` varchar(255) NOT NULL COMMENT '班级',
  `intStudCount` int(11) NOT NULL,
  `intTeacCount` int(11) NOT NULL,
  `intBookId` int(11) NOT NULL,
  `intUserId` int(11) NOT NULL COMMENT '申请人',
  `intPlanStatusId` int(11) NOT NULL DEFAULT '1' COMMENT 'planstatus',
  `intFromYear` int(11) NOT NULL COMMENT '起始年度',
  `intToYear` int(11) NOT NULL COMMENT '结束',
  `intTerm` int(11) NOT NULL COMMENT '学年 0 上半学年 1 下半学期',
  `dateCreateTime` datetime NOT NULL,
  `strMark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`intPlanId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bookplan
-- ----------------------------
INSERT INTO `bookplan` VALUES ('1', '2011023217', '0', '软件工程', '12', '12', '4', '0', '0', '0', '0', '0', '2015-02-10 14:03:34', null);

-- ----------------------------
-- Table structure for bookplanchange
-- ----------------------------
DROP TABLE IF EXISTS `bookplanchange`;
CREATE TABLE `bookplanchange` (
  `intBookChangeId` int(11) NOT NULL,
  `intPlanId` int(11) NOT NULL,
  `intIncreaseStudent` int(11) NOT NULL,
  `intDecreaseStudent` int(11) NOT NULL,
  `intIncreaseTeacher` int(11) NOT NULL,
  `intDecreaseTeacher` int(11) NOT NULL,
  `strChangeReason` varchar(255) COLLATE utf8_bin NOT NULL,
  `dateChangeTime` date NOT NULL,
  PRIMARY KEY (`intBookChangeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of bookplanchange
-- ----------------------------

-- ----------------------------
-- Table structure for bookplanlog
-- ----------------------------
DROP TABLE IF EXISTS `bookplanlog`;
CREATE TABLE `bookplanlog` (
  `intPlanLogId` int(11) NOT NULL,
  `intPlanId` int(11) NOT NULL,
  `intOperateId` int(11) NOT NULL,
  `intUserId` int(11) NOT NULL,
  `dateCreateTime` datetime NOT NULL,
  PRIMARY KEY (`intPlanLogId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of bookplanlog
-- ----------------------------

-- ----------------------------
-- Table structure for bookplanstatus
-- ----------------------------
DROP TABLE IF EXISTS `bookplanstatus`;
CREATE TABLE `bookplanstatus` (
  `intPlanStatusId` int(11) NOT NULL AUTO_INCREMENT,
  `strName` varchar(255) COLLATE utf8_bin NOT NULL,
  `strMark` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`intPlanStatusId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of bookplanstatus
-- ----------------------------
INSERT INTO `bookplanstatus` VALUES ('1', 'pending', '审核');
INSERT INTO `bookplanstatus` VALUES ('2', 'reject', '驳回');
INSERT INTO `bookplanstatus` VALUES ('3', 'fail', '失败');
INSERT INTO `bookplanstatus` VALUES ('4', 'cancel', '取消');
INSERT INTO `bookplanstatus` VALUES ('5', 'pass', '通过');
INSERT INTO `bookplanstatus` VALUES ('6', 'overdue', '过期');

-- ----------------------------
-- Table structure for booktype
-- ----------------------------
DROP TABLE IF EXISTS `booktype`;
CREATE TABLE `booktype` (
  `intBookTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `strBookTypeName` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`intBookTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of booktype
-- ----------------------------
INSERT INTO `booktype` VALUES ('1', '出版社教材');
INSERT INTO `booktype` VALUES ('4', '自编教材');

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
-- Table structure for coursetype
-- ----------------------------
DROP TABLE IF EXISTS `coursetype`;
CREATE TABLE `coursetype` (
  `intCourseTypeId` int(11) NOT NULL,
  `strCourseName` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`intCourseTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of coursetype
-- ----------------------------
INSERT INTO `coursetype` VALUES ('1', '必修');
INSERT INTO `coursetype` VALUES ('2', '系定选修');

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
-- Table structure for operation
-- ----------------------------
DROP TABLE IF EXISTS `operation`;
CREATE TABLE `operation` (
  `intOperationId` int(11) NOT NULL AUTO_INCREMENT,
  `strOperationName` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`intOperationId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of operation
-- ----------------------------
INSERT INTO `operation` VALUES ('1', '录入图书');
INSERT INTO `operation` VALUES ('2', '登录');
INSERT INTO `operation` VALUES ('3', '提交教学计划审核');

-- ----------------------------
-- Table structure for power
-- ----------------------------
DROP TABLE IF EXISTS `power`;
CREATE TABLE `power` (
  `intPowerId` int(11) NOT NULL AUTO_INCREMENT,
  `intParentId` int(11) NOT NULL,
  `strName` varchar(255) COLLATE utf8_bin NOT NULL,
  `intUserTypeId` int(11) NOT NULL,
  `strAuthName` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '1',
  `intAuthValue` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`intPowerId`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of power
-- ----------------------------
INSERT INTO `power` VALUES ('1', '0', '权限表', '0', '1', '1');
INSERT INTO `power` VALUES ('2', '1', '登录', '1', 'Login', '1');
INSERT INTO `power` VALUES ('3', '1', '权限控管', '1', 'accesscontrol', '1');
INSERT INTO `power` VALUES ('4', '1', '管理用户', '1', 'manageuser', '1');
INSERT INTO `power` VALUES ('5', '1', '管理用户类型', '1', 'manageusertype', '1');
INSERT INTO `power` VALUES ('6', '1', '管理书籍类型', '1', 'managebooktype', '1');
INSERT INTO `power` VALUES ('7', '1', '管理供应商', '1', 'managesupplier', '1');
INSERT INTO `power` VALUES ('8', '1', '管理用户系部', '1', 'manageuserdepart', '1');
INSERT INTO `power` VALUES ('9', '1', '管理书籍', '1', 'managebook', '1');
INSERT INTO `power` VALUES ('10', '1', '系统设置', '1', 'setting', '1');
INSERT INTO `power` VALUES ('11', '9', '查询书籍', '1', 'querybook', '1');
INSERT INTO `power` VALUES ('12', '9', '添加书籍', '1', 'addbook', '1');
INSERT INTO `power` VALUES ('13', '9', '删除书籍', '1', 'rmbook', '1');
INSERT INTO `power` VALUES ('14', '9', '编辑书籍', '1', 'editbook', '1');
INSERT INTO `power` VALUES ('15', '4', '查询用户', '1', 'queryuser', '1');
INSERT INTO `power` VALUES ('16', '4', '添加用户', '1', 'adduser', '1');
INSERT INTO `power` VALUES ('17', '4', '编辑用户', '1', 'edituser', '1');
INSERT INTO `power` VALUES ('18', '4', '删除用户', '1', 'rmuser', '1');
INSERT INTO `power` VALUES ('19', '7', '查询供应商', '1', 'querysupplier', '1');
INSERT INTO `power` VALUES ('20', '7', '添加供应商', '1', 'addsupplier', '1');
INSERT INTO `power` VALUES ('21', '7', '编辑供应商', '1', 'editsupplier', '1');
INSERT INTO `power` VALUES ('22', '7', '删除供应商', '1', 'rmsupplier', '1');
INSERT INTO `power` VALUES ('23', '8', '添加用户系部', '1', 'adduserdepart', '1');
INSERT INTO `power` VALUES ('24', '8', '编辑用户系部', '1', 'edituserdepart', '1');
INSERT INTO `power` VALUES ('25', '8', '删除用户系部', '1', 'rmuserdepart', '1');
INSERT INTO `power` VALUES ('26', '8', '查询用户系部', '1', 'queryuserdepart', '1');
INSERT INTO `power` VALUES ('27', '5', '查询用户类型', '1', 'queryusertype', '1');
INSERT INTO `power` VALUES ('28', '5', '添加用户类型', '1', 'addusertype', '1');
INSERT INTO `power` VALUES ('29', '5', '编辑用户类型', '1', 'editusertype', '1');
INSERT INTO `power` VALUES ('30', '5', '删除用户类型', '1', 'rmusertype', '1');
INSERT INTO `power` VALUES ('31', '6', '添加书籍类型', '1', 'addbooktype', '1');
INSERT INTO `power` VALUES ('32', '6', '编辑书记类型', '1', 'editbooktype', '1');
INSERT INTO `power` VALUES ('33', '6', '删除书籍类型', '1', 'rmbooktype', '1');
INSERT INTO `power` VALUES ('34', '6', '查询书籍类型', '1', 'querybooktype', '1');
INSERT INTO `power` VALUES ('35', '1', '登录', '2', 'Login', '1');
INSERT INTO `power` VALUES ('36', '1', '权限控管', '2', 'accesscontrol', '0');
INSERT INTO `power` VALUES ('37', '1', '管理用户', '2', 'manageuser', '1');
INSERT INTO `power` VALUES ('38', '37', '查询用户', '2', 'queryuser', '1');
INSERT INTO `power` VALUES ('39', '37', '添加用户', '2', 'adduser', '0');
INSERT INTO `power` VALUES ('40', '37', '编辑用户', '2', 'edituser', '0');
INSERT INTO `power` VALUES ('41', '37', '删除用户', '2', 'rmuser', '0');
INSERT INTO `power` VALUES ('42', '1', '管理用户类型', '2', 'manageusertype', '1');
INSERT INTO `power` VALUES ('43', '42', '查询用户类型', '2', 'queryusertype', '1');
INSERT INTO `power` VALUES ('44', '42', '添加用户类型', '2', 'addusertype', '0');
INSERT INTO `power` VALUES ('45', '42', '编辑用户类型', '2', 'editusertype', '0');
INSERT INTO `power` VALUES ('46', '42', '删除用户类型', '2', 'rmusertype', '0');
INSERT INTO `power` VALUES ('47', '1', '管理书籍类型', '2', 'managebooktype', '1');
INSERT INTO `power` VALUES ('48', '47', '添加书籍类型', '2', 'addbooktype', '0');
INSERT INTO `power` VALUES ('49', '47', '编辑书记类型', '2', 'editbooktype', '0');
INSERT INTO `power` VALUES ('50', '47', '删除书籍类型', '2', 'rmbooktype', '0');
INSERT INTO `power` VALUES ('51', '47', '查询书籍类型', '2', 'querybooktype', '1');
INSERT INTO `power` VALUES ('52', '1', '管理供应商', '2', 'managesupplier', '1');
INSERT INTO `power` VALUES ('53', '52', '查询供应商', '2', 'querysupplier', '1');
INSERT INTO `power` VALUES ('54', '52', '添加供应商', '2', 'addsupplier', '0');
INSERT INTO `power` VALUES ('55', '52', '编辑供应商', '2', 'editsupplier', '0');
INSERT INTO `power` VALUES ('56', '52', '删除供应商', '2', 'rmsupplier', '0');
INSERT INTO `power` VALUES ('57', '1', '管理用户系部', '2', 'manageuserdepart', '1');
INSERT INTO `power` VALUES ('58', '57', '添加用户系部', '2', 'adduserdepart', '0');
INSERT INTO `power` VALUES ('59', '57', '编辑用户系部', '2', 'edituserdepart', '0');
INSERT INTO `power` VALUES ('60', '57', '删除用户系部', '2', 'rmuserdepart', '0');
INSERT INTO `power` VALUES ('61', '57', '查询用户系部', '2', 'queryuserdepart', '1');
INSERT INTO `power` VALUES ('62', '1', '管理书籍', '2', 'managebook', '1');
INSERT INTO `power` VALUES ('63', '62', '查询书籍', '2', 'querybook', '1');
INSERT INTO `power` VALUES ('64', '62', '添加书籍', '2', 'addbook', '0');
INSERT INTO `power` VALUES ('65', '62', '删除书籍', '2', 'rmbook', '0');
INSERT INTO `power` VALUES ('66', '62', '编辑书籍', '2', 'editbook', '0');
INSERT INTO `power` VALUES ('67', '1', '系统设置', '2', 'setting', '1');
INSERT INTO `power` VALUES ('68', '1', '登录', '3', 'Login', '0');
INSERT INTO `power` VALUES ('69', '1', '权限控管', '3', 'accesscontrol', '0');
INSERT INTO `power` VALUES ('70', '1', '管理用户', '3', 'manageuser', '0');
INSERT INTO `power` VALUES ('71', '70', '查询用户', '3', 'queryuser', '0');
INSERT INTO `power` VALUES ('72', '70', '添加用户', '3', 'adduser', '0');
INSERT INTO `power` VALUES ('73', '70', '编辑用户', '3', 'edituser', '0');
INSERT INTO `power` VALUES ('74', '70', '删除用户', '3', 'rmuser', '0');
INSERT INTO `power` VALUES ('75', '1', '管理用户类型', '3', 'manageusertype', '0');
INSERT INTO `power` VALUES ('76', '75', '查询用户类型', '3', 'queryusertype', '0');
INSERT INTO `power` VALUES ('77', '75', '添加用户类型', '3', 'addusertype', '0');
INSERT INTO `power` VALUES ('78', '75', '编辑用户类型', '3', 'editusertype', '0');
INSERT INTO `power` VALUES ('79', '75', '删除用户类型', '3', 'rmusertype', '0');
INSERT INTO `power` VALUES ('80', '1', '管理书籍类型', '3', 'managebooktype', '0');
INSERT INTO `power` VALUES ('81', '80', '添加书籍类型', '3', 'addbooktype', '0');
INSERT INTO `power` VALUES ('82', '80', '编辑书记类型', '3', 'editbooktype', '0');
INSERT INTO `power` VALUES ('83', '80', '删除书籍类型', '3', 'rmbooktype', '0');
INSERT INTO `power` VALUES ('84', '80', '查询书籍类型', '3', 'querybooktype', '0');
INSERT INTO `power` VALUES ('85', '1', '管理供应商', '3', 'managesupplier', '0');
INSERT INTO `power` VALUES ('86', '85', '查询供应商', '3', 'querysupplier', '0');
INSERT INTO `power` VALUES ('87', '85', '添加供应商', '3', 'addsupplier', '0');
INSERT INTO `power` VALUES ('88', '85', '编辑供应商', '3', 'editsupplier', '0');
INSERT INTO `power` VALUES ('89', '85', '删除供应商', '3', 'rmsupplier', '0');
INSERT INTO `power` VALUES ('90', '1', '管理用户系部', '3', 'manageuserdepart', '0');
INSERT INTO `power` VALUES ('91', '90', '添加用户系部', '3', 'adduserdepart', '0');
INSERT INTO `power` VALUES ('92', '90', '编辑用户系部', '3', 'edituserdepart', '0');
INSERT INTO `power` VALUES ('93', '90', '删除用户系部', '3', 'rmuserdepart', '0');
INSERT INTO `power` VALUES ('94', '90', '查询用户系部', '3', 'queryuserdepart', '0');
INSERT INTO `power` VALUES ('95', '1', '管理书籍', '3', 'managebook', '0');
INSERT INTO `power` VALUES ('96', '95', '查询书籍', '3', 'querybook', '0');
INSERT INTO `power` VALUES ('97', '95', '添加书籍', '3', 'addbook', '0');
INSERT INTO `power` VALUES ('98', '95', '删除书籍', '3', 'rmbook', '0');
INSERT INTO `power` VALUES ('99', '95', '编辑书籍', '3', 'editbook', '0');
INSERT INTO `power` VALUES ('100', '1', '系统设置', '3', 'setting', '0');
INSERT INTO `power` VALUES ('101', '1', '登录', '4', 'Login', '0');
INSERT INTO `power` VALUES ('102', '1', '权限控管', '4', 'accesscontrol', '0');
INSERT INTO `power` VALUES ('103', '1', '管理用户', '4', 'manageuser', '0');
INSERT INTO `power` VALUES ('104', '103', '查询用户', '4', 'queryuser', '0');
INSERT INTO `power` VALUES ('105', '103', '添加用户', '4', 'adduser', '0');
INSERT INTO `power` VALUES ('106', '103', '编辑用户', '4', 'edituser', '0');
INSERT INTO `power` VALUES ('107', '103', '删除用户', '4', 'rmuser', '0');
INSERT INTO `power` VALUES ('108', '1', '管理用户类型', '4', 'manageusertype', '0');
INSERT INTO `power` VALUES ('109', '108', '查询用户类型', '4', 'queryusertype', '0');
INSERT INTO `power` VALUES ('110', '108', '添加用户类型', '4', 'addusertype', '0');
INSERT INTO `power` VALUES ('111', '108', '编辑用户类型', '4', 'editusertype', '0');
INSERT INTO `power` VALUES ('112', '108', '删除用户类型', '4', 'rmusertype', '0');
INSERT INTO `power` VALUES ('113', '1', '管理书籍类型', '4', 'managebooktype', '0');
INSERT INTO `power` VALUES ('114', '113', '添加书籍类型', '4', 'addbooktype', '0');
INSERT INTO `power` VALUES ('115', '113', '编辑书记类型', '4', 'editbooktype', '0');
INSERT INTO `power` VALUES ('116', '113', '删除书籍类型', '4', 'rmbooktype', '0');
INSERT INTO `power` VALUES ('117', '113', '查询书籍类型', '4', 'querybooktype', '0');
INSERT INTO `power` VALUES ('118', '1', '管理供应商', '4', 'managesupplier', '0');
INSERT INTO `power` VALUES ('119', '118', '查询供应商', '4', 'querysupplier', '0');
INSERT INTO `power` VALUES ('120', '118', '添加供应商', '4', 'addsupplier', '0');
INSERT INTO `power` VALUES ('121', '118', '编辑供应商', '4', 'editsupplier', '0');
INSERT INTO `power` VALUES ('122', '118', '删除供应商', '4', 'rmsupplier', '0');
INSERT INTO `power` VALUES ('123', '1', '管理用户系部', '4', 'manageuserdepart', '0');
INSERT INTO `power` VALUES ('124', '123', '添加用户系部', '4', 'adduserdepart', '0');
INSERT INTO `power` VALUES ('125', '123', '编辑用户系部', '4', 'edituserdepart', '0');
INSERT INTO `power` VALUES ('126', '123', '删除用户系部', '4', 'rmuserdepart', '0');
INSERT INTO `power` VALUES ('127', '123', '查询用户系部', '4', 'queryuserdepart', '0');
INSERT INTO `power` VALUES ('128', '1', '管理书籍', '4', 'managebook', '0');
INSERT INTO `power` VALUES ('129', '128', '查询书籍', '4', 'querybook', '0');
INSERT INTO `power` VALUES ('130', '128', '添加书籍', '4', 'addbook', '0');
INSERT INTO `power` VALUES ('131', '128', '删除书籍', '4', 'rmbook', '0');
INSERT INTO `power` VALUES ('132', '128', '编辑书籍', '4', 'editbook', '0');
INSERT INTO `power` VALUES ('133', '1', '系统设置', '4', 'setting', '0');
INSERT INTO `power` VALUES ('134', '1', '登录', '5', 'Login', '0');
INSERT INTO `power` VALUES ('135', '1', '权限控管', '5', 'accesscontrol', '0');
INSERT INTO `power` VALUES ('136', '1', '管理用户', '5', 'manageuser', '0');
INSERT INTO `power` VALUES ('137', '1', '管理用户类型', '5', 'manageusertype', '0');
INSERT INTO `power` VALUES ('138', '1', '管理书籍类型', '5', 'managebooktype', '0');
INSERT INTO `power` VALUES ('139', '1', '管理供应商', '5', 'managesupplier', '0');
INSERT INTO `power` VALUES ('140', '1', '管理用户系部', '5', 'manageuserdepart', '0');
INSERT INTO `power` VALUES ('141', '1', '管理书籍', '5', 'managebook', '0');
INSERT INTO `power` VALUES ('142', '1', '系统设置', '5', 'setting', '0');
INSERT INTO `power` VALUES ('143', '136', '查询用户', '5', 'queryuser', '0');
INSERT INTO `power` VALUES ('144', '136', '添加用户', '5', 'adduser', '0');
INSERT INTO `power` VALUES ('145', '136', '编辑用户', '5', 'edituser', '0');
INSERT INTO `power` VALUES ('146', '136', '删除用户', '5', 'rmuser', '0');
INSERT INTO `power` VALUES ('147', '137', '查询用户类型', '5', 'queryusertype', '0');
INSERT INTO `power` VALUES ('148', '137', '添加用户类型', '5', 'addusertype', '0');
INSERT INTO `power` VALUES ('149', '137', '编辑用户类型', '5', 'editusertype', '0');
INSERT INTO `power` VALUES ('150', '137', '删除用户类型', '5', 'rmusertype', '0');
INSERT INTO `power` VALUES ('151', '138', '添加书籍类型', '5', 'addbooktype', '0');
INSERT INTO `power` VALUES ('152', '138', '编辑书记类型', '5', 'editbooktype', '0');
INSERT INTO `power` VALUES ('153', '138', '删除书籍类型', '5', 'rmbooktype', '0');
INSERT INTO `power` VALUES ('154', '138', '查询书籍类型', '5', 'querybooktype', '0');
INSERT INTO `power` VALUES ('155', '139', '查询供应商', '5', 'querysupplier', '0');
INSERT INTO `power` VALUES ('156', '139', '添加供应商', '5', 'addsupplier', '0');
INSERT INTO `power` VALUES ('157', '139', '编辑供应商', '5', 'editsupplier', '0');
INSERT INTO `power` VALUES ('158', '139', '删除供应商', '5', 'rmsupplier', '0');
INSERT INTO `power` VALUES ('159', '140', '添加用户系部', '5', 'adduserdepart', '0');
INSERT INTO `power` VALUES ('160', '140', '编辑用户系部', '5', 'edituserdepart', '0');
INSERT INTO `power` VALUES ('161', '140', '删除用户系部', '5', 'rmuserdepart', '0');
INSERT INTO `power` VALUES ('162', '140', '查询用户系部', '5', 'queryuserdepart', '0');
INSERT INTO `power` VALUES ('163', '141', '查询书籍', '5', 'querybook', '0');
INSERT INTO `power` VALUES ('164', '141', '添加书籍', '5', 'addbook', '0');
INSERT INTO `power` VALUES ('165', '141', '删除书籍', '5', 'rmbook', '0');
INSERT INTO `power` VALUES ('166', '141', '编辑书籍', '5', 'editbook', '0');
INSERT INTO `power` VALUES ('167', '172', '教材计划申请', '1', 'submitplan', '1');
INSERT INTO `power` VALUES ('168', '1', '教材计划管理', '1', 'manageplan', '1');
INSERT INTO `power` VALUES ('169', '168', '教材计划查询(所有)', '1', 'queryallplan', '1');
INSERT INTO `power` VALUES ('170', '168', '教材计划审核', '1', 'auditplan', '1');
INSERT INTO `power` VALUES ('171', '1', '教材计划查询(个人)', '1', 'queryplan', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('1', 'S11050', '测试供应商1', '2aaaa', '111', '负责人', '189111', '联系人', '120580');
INSERT INTO `supplier` VALUES ('3', 'S88212', '才是实现信息', 'AAA', '0223030', '111', '20302', '12ass', '2223050');
INSERT INTO `supplier` VALUES ('4', 'SSSS', '阿瑟斯', '阿阿水的', '1894111', '房改房1', '房改房1', '斯蒂芬森', '454545');
INSERT INTO `supplier` VALUES ('5', 'S102556', '供应商2', '不知道', '111111', '无人', '1116880', '爱学习', '18994160911');
INSERT INTO `supplier` VALUES ('6', 'None', '自编', 'None', '0', 'None', '0', 'None', '0');

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
INSERT INTO `user` VALUES ('1', 'Admin', 'a', 'www', '1', '16', '14', '222', '1111', 'administrator@qq.com', '2015-02-28 15:34:22');
INSERT INTO `user` VALUES ('2', 'Troevil', '123456', 'SSSFF', '2', '3', '2', '1234234', '18994323', '2121@qq.com', '2015-02-28 20:44:02');
INSERT INTO `user` VALUES ('3', 'TestUser', 'TestUser', 'TestUser', '3', '5', '4', '2342342', 'asd', 'TestUser@qq.com', '2015-02-28 20:44:52');
INSERT INTO `user` VALUES ('4', 'AAAA', 'AAAAAAAA', 'AAAA', '4', '10', '9', '363464', 'AAAA', 'AAAA', '2015-02-28 20:56:49');
INSERT INTO `user` VALUES ('5', 'aasf', 'aasfaasf', 'aasf', '3', '6', '4', '34432453', 'aasf', 'aasf', '2015-02-28 20:56:01');
INSERT INTO `user` VALUES ('6', 'qqq', 'qqqqqq', 'qqq', '5', '12', '11', '2342343', '1111178888', 'qqq@11.com', '2015-02-28 20:56:39');
INSERT INTO `user` VALUES ('7', 'TestForInject', 'TestForInject', 'TestForInject', '5', '6', '4', '1112232', '1111', 'TestForInject', '2015-02-28 20:56:23');
INSERT INTO `user` VALUES ('8', 'TestForAddUser', 'TestForAddUser', 'TestForAddUser', '4', '5', '4', 'TestForAddUser', '111111', 'TestForAddUser@qq.com', '2015-02-28 20:56:23');
INSERT INTO `user` VALUES ('9', 'TestForAddUser2', 'TestForAddUser2', 'TestForAddUser2', '5', '16', '14', '121231231', '111111', 'TestForAddUser2@qq.com', '2015-02-28 20:57:00');
INSERT INTO `user` VALUES ('11', 'Test', '1asasds', 'ss222', '4', '6', '4', '656564', '11111', '655', '2015-02-28 20:56:23');

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userdepartment
-- ----------------------------
INSERT INTO `userdepartment` VALUES ('1', '0', 'System', '0');
INSERT INTO `userdepartment` VALUES ('2', '1', '信息工程', '0');
INSERT INTO `userdepartment` VALUES ('3', '2', '软件工程', '1');
INSERT INTO `userdepartment` VALUES ('4', '1', '机电工程', '0');
INSERT INTO `userdepartment` VALUES ('5', '4', '机械工程及自动化', '1');
INSERT INTO `userdepartment` VALUES ('6', '4', '车辆工程', '1');
INSERT INTO `userdepartment` VALUES ('7', '4', '工业设计', '0');
INSERT INTO `userdepartment` VALUES ('9', '1', '自动化', '0');
INSERT INTO `userdepartment` VALUES ('10', '9', '电气工程与自动化', '0');
INSERT INTO `userdepartment` VALUES ('11', '1', '管理', '0');
INSERT INTO `userdepartment` VALUES ('12', '11', '市场营销', '0');
INSERT INTO `userdepartment` VALUES ('13', '11', '工商管理', '0');
INSERT INTO `userdepartment` VALUES ('14', '1', '英语', '0');
INSERT INTO `userdepartment` VALUES ('16', '14', '英语(商务翻译)', '0');
INSERT INTO `userdepartment` VALUES ('17', '4', '产品设计', '0');

-- ----------------------------
-- Table structure for usertype
-- ----------------------------
DROP TABLE IF EXISTS `usertype`;
CREATE TABLE `usertype` (
  `intIdentityId` int(11) NOT NULL AUTO_INCREMENT,
  `strName` varchar(255) COLLATE utf8_bin NOT NULL,
  `intAllowReg` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`intIdentityId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of usertype
-- ----------------------------
INSERT INTO `usertype` VALUES ('1', 'Admin', '0');
INSERT INTO `usertype` VALUES ('2', 'BookManager', '0');
INSERT INTO `usertype` VALUES ('3', 'Teacher', '1');
INSERT INTO `usertype` VALUES ('4', 'Student', '1');
INSERT INTO `usertype` VALUES ('5', 'TestUser', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

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
INSERT INTO `versionlog` VALUES ('9', '0009', '00', '1', '新增学生系部信息浏览.', '2015-02-10 20:07:43');
INSERT INTO `versionlog` VALUES ('10', '0010', '00', '1', '新增学生系部管理', '2015-02-11 13:43:13');
INSERT INTO `versionlog` VALUES ('11', '0011', '00', '1', '新增用户类型管理，书籍类型管理', '2015-02-12 17:01:59');
INSERT INTO `versionlog` VALUES ('12', '0011', '02', '1', '修复注册是多个用户类型错位Bug,<br>修复unix下数据库大小写敏感的BUG', '2015-02-12 20:57:56');
INSERT INTO `versionlog` VALUES ('13', '0012', '01', '1', '新增UI权限控制<br>更新调整权限数据库,<br>[future] 权限控管', '2015-02-12 22:52:45');
INSERT INTO `versionlog` VALUES ('14', '0013', '00', '1', '新增/完善权限控管<br>[future] 教学书籍订购计划管理', '2015-03-02 21:03:45');
INSERT INTO `versionlog` VALUES ('15', '0014', '04', '1', '新增书籍条件查询<br>修复UI等错位<br>修复编辑书籍类型，供应商类型丢失bug<br>修复删除用户是自身删除bug<br>修复权限控管部分失效bug<br>[feture]继续完善教学计划提交Plan Submit', '2015-03-05 16:42:26');

/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50610
Source Host           : localhost:3306
Source Database       : teaching

Target Server Type    : MYSQL
Target Server Version : 50610
File Encoding         : 65001

Date: 2015-04-04 04:52:42
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
INSERT INTO `book` VALUES ('1', '电子商务与物流管理第2版', 'B122', '45145', '1', '101.000', '纷纭出版社', 'SSDFF', '4.000', '1', '2015-02-02 17:37:54');
INSERT INTO `book` VALUES ('2', '一分钟探案高手', 'B1212', '2222', '1', '120.000', '2222', '1111', '6.000', '4', '2015-03-05 15:39:43');
INSERT INTO `book` VALUES ('3', 'SQL Server 2008 商业智能完美解决方案', 'B12022', '221323', '1', '100.300', '爱思考思考', '可可豆', '9.300', '1', '2015-02-02 16:01:37');
INSERT INTO `book` VALUES ('4', '英语口语短句大王', 'B1230', '45', '4', '458.400', '45', '4545', '6.000', '3', '2015-03-05 16:39:40');
INSERT INTO `book` VALUES ('5', '跟毛泽东学思维', 'B1230', '45', '1', '458.400', '45', '4545', '7.000', '5', '2015-03-05 15:32:15');
INSERT INTO `book` VALUES ('6', '图书汉字的故事', 'B1230ss', '45', '1', '458.400', '45', '4545', '7.000', '1', '2015-02-02 16:06:25');
INSERT INTO `book` VALUES ('7', 'CSS HTML ·XHTML语法与范例辞典', 'B2015256', 'aaa', '1', '199.000', '45454', 'ssss', '10.000', '4', '2015-03-05 15:39:43');
INSERT INTO `book` VALUES ('8', '公务员电子政务技 术实用指南', 'A25554', '45AS3', '4', '222.000', '猜猜猜', 'none', '5.000', '6', '2015-03-05 16:30:09');
INSERT INTO `book` VALUES ('9', '母亲杨沫', 'A25554', '45AS3', '4', '222.000', '猜猜猜', 'none', '5.000', '1', '2015-03-05 16:30:25');
INSERT INTO `book` VALUES ('10', '国家电网公司电力安全工作规程', 'B22206', '9787508391311', '1', '100.000', '中国电力出版社', '国家电网公司', '10.000', '5', '2015-03-05 16:39:48');
INSERT INTO `book` VALUES ('11', '电力安全监督管理工作手册', 'B22205', '9787512348660', '1', '100.000', '中国电力出版社', '国家电网公司', '10.000', '5', '2015-02-10 14:28:40');
INSERT INTO `book` VALUES ('12', '谁动了我的奶酪', 'Z4005', '44545', '1', '17.400', 'none', '斯宾塞.约翰逊', '10.000', '3', '2015-02-10 14:29:51');
INSERT INTO `book` VALUES ('13', '中国历史', 'bSSS', 'SN190203', '1', '100.000', '自编', '暂无', '5.000', '1', '2015-04-04 04:50:47');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bookplan
-- ----------------------------
INSERT INTO `bookplan` VALUES ('1', '计算机网络', '1', '20120221', '35', '1', '3', '1', '5', '2014', '2015', '0', '2015-03-15 13:12:22', '附言测试');
INSERT INTO `bookplan` VALUES ('2', '计算机网络', '2', '20120211', '32', '1', '2', '1', '4', '2014', '2015', '0', '2015-03-19 16:43:17', 'none');

-- ----------------------------
-- Table structure for bookplanchange
-- ----------------------------
DROP TABLE IF EXISTS `bookplanchange`;
CREATE TABLE `bookplanchange` (
  `intBookChangeId` int(11) NOT NULL AUTO_INCREMENT,
  `intPlanId` int(11) NOT NULL,
  `intBookPlanLogId` int(11) NOT NULL,
  `intStudent` int(11) NOT NULL,
  `intTeacher` int(11) NOT NULL,
  `strChangeReason` varchar(255) COLLATE utf8_bin NOT NULL,
  `dateChangeTime` datetime NOT NULL,
  PRIMARY KEY (`intBookChangeId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of bookplanchange
-- ----------------------------
INSERT INTO `bookplanchange` VALUES ('1', '1', '2', '10', '1', 'none', '2015-03-15 13:12:40');
INSERT INTO `bookplanchange` VALUES ('2', '1', '3', '0', '3', 'none', '2015-03-18 12:32:33');
INSERT INTO `bookplanchange` VALUES ('3', '1', '4', '0', '3', 'none', '2015-03-18 12:37:09');
INSERT INTO `bookplanchange` VALUES ('4', '2', '7', '0', '3', 'none', '2015-03-19 16:51:35');
INSERT INTO `bookplanchange` VALUES ('5', '2', '8', '-4', '-3', 'none', '2015-03-19 16:51:41');

-- ----------------------------
-- Table structure for bookplanlog
-- ----------------------------
DROP TABLE IF EXISTS `bookplanlog`;
CREATE TABLE `bookplanlog` (
  `intPlanLogId` int(11) NOT NULL AUTO_INCREMENT,
  `intPlanId` int(11) NOT NULL,
  `intOperateId` int(11) NOT NULL,
  `intUserId` int(11) NOT NULL,
  `dateCreateTime` datetime NOT NULL,
  PRIMARY KEY (`intPlanLogId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of bookplanlog
-- ----------------------------
INSERT INTO `bookplanlog` VALUES ('1', '1', '3', '1', '2015-03-15 13:12:22');
INSERT INTO `bookplanlog` VALUES ('2', '1', '6', '1', '2015-03-15 13:12:40');
INSERT INTO `bookplanlog` VALUES ('3', '1', '6', '1', '2015-03-18 12:32:33');
INSERT INTO `bookplanlog` VALUES ('4', '1', '6', '1', '2015-03-18 12:37:09');
INSERT INTO `bookplanlog` VALUES ('5', '1', '7', '1', '2015-03-19 16:25:21');
INSERT INTO `bookplanlog` VALUES ('6', '2', '3', '1', '2015-03-19 16:43:17');
INSERT INTO `bookplanlog` VALUES ('7', '2', '6', '1', '2015-03-19 16:51:35');
INSERT INTO `bookplanlog` VALUES ('8', '2', '6', '1', '2015-03-19 16:51:41');
INSERT INTO `bookplanlog` VALUES ('9', '2', '7', '1', '2015-03-27 13:03:10');
INSERT INTO `bookplanlog` VALUES ('10', '1', '8', '1', '2015-03-27 15:32:34');

-- ----------------------------
-- Table structure for bookplanstatus
-- ----------------------------
DROP TABLE IF EXISTS `bookplanstatus`;
CREATE TABLE `bookplanstatus` (
  `intPlanStatusId` int(11) NOT NULL AUTO_INCREMENT,
  `strName` varchar(255) COLLATE utf8_bin NOT NULL,
  `strMark` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`intPlanStatusId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of bookplanstatus
-- ----------------------------
INSERT INTO `bookplanstatus` VALUES ('1', 'pending', '审核');
INSERT INTO `bookplanstatus` VALUES ('2', 'reject', '驳回');
INSERT INTO `bookplanstatus` VALUES ('3', 'refuse', '失败');
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
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('1', 'AdminMenu', 'planui');
INSERT INTO `config` VALUES ('2', 'AdminMenu', 'queryplan');
INSERT INTO `config` VALUES ('3', 'AdminMenu', 'manageplan');
INSERT INTO `config` VALUES ('4', 'AdminMenu', 'submitplan');
INSERT INTO `config` VALUES ('5', 'AdminMenu', 'managebook');
INSERT INTO `config` VALUES ('6', 'AdminMenu', 'managebooktype');
INSERT INTO `config` VALUES ('7', 'AdminMenu', 'managesupplier');
INSERT INTO `config` VALUES ('8', 'AdminMenu', 'setting');
INSERT INTO `config` VALUES ('9', 'AdminMenu', 'manageusertype');
INSERT INTO `config` VALUES ('10', 'AdminMenu', 'manageuserdepart');
INSERT INTO `config` VALUES ('11', 'AdminMenu', 'manageuser');
INSERT INTO `config` VALUES ('12', 'AdminMenu', 'accesscontrol');
INSERT INTO `config` VALUES ('13', 'AdminMenu', 'systemsetting');
INSERT INTO `config` VALUES ('14', 'book_manage', 'addbook');
INSERT INTO `config` VALUES ('15', 'book_manage', 'editbook');
INSERT INTO `config` VALUES ('16', 'book_manage', 'rmbook');
INSERT INTO `config` VALUES ('17', 'book_manage', 'querybook');
INSERT INTO `config` VALUES ('18', 'book_manage', 'managebook');
INSERT INTO `config` VALUES ('19', 'userinfo_manage', 'adduser');
INSERT INTO `config` VALUES ('20', 'userinfo_manage', 'edituser');
INSERT INTO `config` VALUES ('21', 'userinfo_manage', 'rmuser');
INSERT INTO `config` VALUES ('22', 'userinfo_manage', 'queryuser');
INSERT INTO `config` VALUES ('23', 'userinfo_manage', 'manageuser');
INSERT INTO `config` VALUES ('24', 'supplier_manage', 'addsupplier');
INSERT INTO `config` VALUES ('25', 'supplier_manage', 'editsupplier');
INSERT INTO `config` VALUES ('26', 'supplier_manage', 'rmsupplier');
INSERT INTO `config` VALUES ('27', 'supplier_manage', 'querysupplier');
INSERT INTO `config` VALUES ('28', 'supplier_manage', 'managesupplier');
INSERT INTO `config` VALUES ('29', 'department_manage', 'adduserdepart');
INSERT INTO `config` VALUES ('30', 'department_manage', 'edituserdepart');
INSERT INTO `config` VALUES ('31', 'department_manage', 'rmuserdepart');
INSERT INTO `config` VALUES ('32', 'department_manage', 'queryuserdepart');
INSERT INTO `config` VALUES ('33', 'department_manage', 'manageuserdepart');
INSERT INTO `config` VALUES ('34', 'type_manage', 'addusertype');
INSERT INTO `config` VALUES ('35', 'type_manage', 'editusertype');
INSERT INTO `config` VALUES ('36', 'type_manage', 'rmusertype');
INSERT INTO `config` VALUES ('37', 'type_manage', 'queryusertype');
INSERT INTO `config` VALUES ('38', 'type_manage', 'querybooktype');
INSERT INTO `config` VALUES ('39', 'type_manage', 'addbooktype');
INSERT INTO `config` VALUES ('40', 'type_manage', 'editbooktype');
INSERT INTO `config` VALUES ('41', 'type_manage', 'rmbooktype');
INSERT INTO `config` VALUES ('42', 'type_manage', 'managebooktype');
INSERT INTO `config` VALUES ('43', 'type_manage', 'manageusertype');
INSERT INTO `config` VALUES ('44', 'access_manage', 'accesscontrol');
INSERT INTO `config` VALUES ('45', 'plan_submit', 'submitplan');
INSERT INTO `config` VALUES ('46', 'plan_query', 'queryplan');
INSERT INTO `config` VALUES ('47', 'personal_setting', 'querybook');
INSERT INTO `config` VALUES ('48', 'personal_setting', 'queryplan');
INSERT INTO `config` VALUES ('49', 'personal_setting', 'querysupplier');
INSERT INTO `config` VALUES ('50', 'personal_setting', 'queryuser');
INSERT INTO `config` VALUES ('51', 'plan_manage', 'manageplan');
INSERT INTO `config` VALUES ('52', 'plan_manage', 'aduitplan');
INSERT INTO `config` VALUES ('53', 'plan_manage', 'queryallplan');
INSERT INTO `config` VALUES ('54', 'system_settings', 'systemsetting');
INSERT INTO `config` VALUES ('55', 'AllowPlanSubmit', '1');
INSERT INTO `config` VALUES ('56', 'menu_manage', 'menumanage');
INSERT INTO `config` VALUES ('57', 'AdminMenu', 'menumanage');
INSERT INTO `config` VALUES ('58', 'GlobalTitle', 'Teaching ManageMent System');
INSERT INTO `config` VALUES ('59', 'BackGroundTitle', 'JC ManageMent');
INSERT INTO `config` VALUES ('60', 'LoginPageTitle', 'Teaching ManageMent System');
INSERT INTO `config` VALUES ('61', 'LoginPageSTitle', 'It\'s a System For Teaching');
INSERT INTO `config` VALUES ('62', 'DialogClassSpeed', 'animated-fast');
INSERT INTO `config` VALUES ('63', 'DialogClassAnimation', 'bounceIn');
INSERT INTO `config` VALUES ('64', 'DialogClassSelect', 'bounce');
INSERT INTO `config` VALUES ('65', 'DialogClassSelect', 'flash');
INSERT INTO `config` VALUES ('66', 'DialogClassSelect', 'pulse');
INSERT INTO `config` VALUES ('67', 'DialogClassSelect', 'rubberBand');
INSERT INTO `config` VALUES ('68', 'DialogClassSelect', 'shake');
INSERT INTO `config` VALUES ('69', 'DialogClassSelect', 'swing');
INSERT INTO `config` VALUES ('70', 'DialogClassSelect', 'tada');
INSERT INTO `config` VALUES ('71', 'DialogClassSelect', 'wobble');
INSERT INTO `config` VALUES ('72', 'DialogClassSelect', 'bounceIn');
INSERT INTO `config` VALUES ('73', 'DialogClassSelect', 'bounceInDown');
INSERT INTO `config` VALUES ('74', 'DialogClassSelect', 'bounceInLeft');
INSERT INTO `config` VALUES ('75', 'DialogClassSelect', 'bounceInRight');
INSERT INTO `config` VALUES ('76', 'DialogClassSelect', 'bounceInUp');
INSERT INTO `config` VALUES ('77', 'DialogClassSelect', 'bounceOut');
INSERT INTO `config` VALUES ('78', 'DialogClassSelect', 'bounceOutDown');
INSERT INTO `config` VALUES ('79', 'DialogClassSelect', 'bounceOutLeft');
INSERT INTO `config` VALUES ('80', 'DialogClassSelect', 'bounceOutRight');
INSERT INTO `config` VALUES ('81', 'DialogClassSelect', 'bounceOutUp');
INSERT INTO `config` VALUES ('82', 'DialogClassSelect', 'fadeIn');
INSERT INTO `config` VALUES ('83', 'DialogClassSelect', 'fadeInDown');
INSERT INTO `config` VALUES ('84', 'DialogClassSelect', 'fadeInLeft');
INSERT INTO `config` VALUES ('85', 'DialogClassSelect', 'fadeInRight');
INSERT INTO `config` VALUES ('86', 'DialogClassSelect', 'fadeInUp');
INSERT INTO `config` VALUES ('87', 'DialogClassSelect', 'fadeOut');
INSERT INTO `config` VALUES ('88', 'DialogClassSelect', 'fadeOutDown');
INSERT INTO `config` VALUES ('89', 'DialogClassSelect', 'fadeOutLeft');
INSERT INTO `config` VALUES ('90', 'DialogClassSelect', 'fadeOutRight');
INSERT INTO `config` VALUES ('91', 'DialogClassSelect', 'fadeOutUp');
INSERT INTO `config` VALUES ('92', 'DialogClassSelect', 'flipInX');
INSERT INTO `config` VALUES ('93', 'DialogClassSelect', 'flipInY');
INSERT INTO `config` VALUES ('94', 'DialogClassSelect', 'flipOutX');
INSERT INTO `config` VALUES ('95', 'DialogClassSelect', 'flipOutY');
INSERT INTO `config` VALUES ('96', 'DialogClassSelect', 'lightSpeedIn');
INSERT INTO `config` VALUES ('97', 'DialogClassSelect', 'lightSpeedOut');
INSERT INTO `config` VALUES ('98', 'DialogClassSelect', 'rotateIn');
INSERT INTO `config` VALUES ('99', 'DialogClassSelect', 'rotateInDownLeft');
INSERT INTO `config` VALUES ('100', 'DialogClassSelect', 'rotateInDownRight');
INSERT INTO `config` VALUES ('101', 'DialogClassSelect', 'rotateInUpLeft');
INSERT INTO `config` VALUES ('102', 'DialogClassSelect', 'rotateInUpRight');
INSERT INTO `config` VALUES ('103', 'DialogClassSelect', 'rotateOut');
INSERT INTO `config` VALUES ('104', 'DialogClassSelect', 'rotateOutDownLeft');
INSERT INTO `config` VALUES ('105', 'DialogClassSelect', 'rotateOutDownRight');
INSERT INTO `config` VALUES ('106', 'DialogClassSelect', 'rotateOutUpLeft');
INSERT INTO `config` VALUES ('107', 'DialogClassSelect', 'rotateOutUpRight');
INSERT INTO `config` VALUES ('108', 'DialogClassSelect', 'hinge');
INSERT INTO `config` VALUES ('109', 'DialogClassSelect', 'rollIn');
INSERT INTO `config` VALUES ('110', 'DialogClassSelect', 'rollOut');
INSERT INTO `config` VALUES ('111', 'DialogClassSelect', 'zoomIn');
INSERT INTO `config` VALUES ('112', 'DialogClassSelect', 'zoomInDown');
INSERT INTO `config` VALUES ('113', 'DialogClassSelect', 'zoomInLeft');
INSERT INTO `config` VALUES ('114', 'DialogClassSelect', 'zoomInRight');
INSERT INTO `config` VALUES ('115', 'DialogClassSelect', 'zoomInUp');
INSERT INTO `config` VALUES ('116', 'DialogClassSelect', 'zoomOut');
INSERT INTO `config` VALUES ('117', 'DialogClassSelect', 'zoomOutDown');
INSERT INTO `config` VALUES ('118', 'DialogClassSelect', 'zoomOutLeft');
INSERT INTO `config` VALUES ('119', 'DialogClassSelect', 'zoomOutRight');
INSERT INTO `config` VALUES ('120', 'DialogClassSelect', 'zoomOutUp');
INSERT INTO `config` VALUES ('121', 'DialogClassSelect', 'slideInDown');
INSERT INTO `config` VALUES ('123', 'DialogClassSelect', 'slideInLeft');
INSERT INTO `config` VALUES ('124', 'DialogClassSelect', 'slideInRight');
INSERT INTO `config` VALUES ('125', 'DialogClassSelect', 'slideInUp');
INSERT INTO `config` VALUES ('126', 'DialogClassSelect', 'slideOutDown');
INSERT INTO `config` VALUES ('127', 'DialogClassSelect', 'slideOutLeft');
INSERT INTO `config` VALUES ('128', 'DialogClassSelect', 'slideOutRight');
INSERT INTO `config` VALUES ('129', 'DialogClassSelect', 'slideOutUp');

-- ----------------------------
-- Table structure for coursetype
-- ----------------------------
DROP TABLE IF EXISTS `coursetype`;
CREATE TABLE `coursetype` (
  `intCourseTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `strCourseName` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`intCourseTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `intMenuId` int(11) NOT NULL AUTO_INCREMENT,
  `intParentMenuId` int(11) NOT NULL,
  `strMenuValue` varchar(255) COLLATE utf8_bin NOT NULL,
  `strMenuName` varchar(255) COLLATE utf8_bin NOT NULL,
  `strMenuIconClass` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`intMenuId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES ('1', '0', 'menu', 'Menu', 'fa');
INSERT INTO `menus` VALUES ('2', '1', 'dashboard', 'Dashboard', 'fa fa-dashboard');
INSERT INTO `menus` VALUES ('3', '1', 'books', 'Books', 'fa fa-book');
INSERT INTO `menus` VALUES ('4', '1', 'plans', 'Plans', 'fa fa-calculator');
INSERT INTO `menus` VALUES ('5', '1', 'usermanage', 'User Manage', 'fa fa-suitcase');
INSERT INTO `menus` VALUES ('6', '1', 'personsetting', 'Person Setting', 'fa fa-user');
INSERT INTO `menus` VALUES ('7', '1', 'systemsettings', 'System Settings', 'fa fa-cogs');
INSERT INTO `menus` VALUES ('8', '1', 'javascript:logout();', 'Log Out', 'fa fa-sign-out');
INSERT INTO `menus` VALUES ('9', '3', 'book_manage', 'Book Manage', 'fa fa-bookmark');
INSERT INTO `menus` VALUES ('10', '3', 'supplier_manage', 'Supplier Manage', 'fa fa-bus');
INSERT INTO `menus` VALUES ('11', '4', 'plan_submit', 'Plan Sumbit', 'fa fa-paper-plane-o');
INSERT INTO `menus` VALUES ('12', '4', 'plan_query', 'Plan Query', 'fa fa-file-archive-o');
INSERT INTO `menus` VALUES ('13', '4', 'plan_manage', 'Plan Manage', 'fa fa-bar-chart');
INSERT INTO `menus` VALUES ('14', '5', 'userinfo_manage', 'User Manage', 'fa fa-group');
INSERT INTO `menus` VALUES ('15', '6', 'personinfo_manage', 'Info Manage', 'fa fa-pencil-square-o');
INSERT INTO `menus` VALUES ('16', '6', 'personal_setting', 'Setting Manage', 'fa fa-folder');
INSERT INTO `menus` VALUES ('17', '7', 'department_manage', 'Depart Manage', 'fa fa-clipboard');
INSERT INTO `menus` VALUES ('18', '7', 'type_manage', 'Type Manage', 'fa fa-street-view');
INSERT INTO `menus` VALUES ('19', '7', 'access_manage', 'Access Manage', 'fa fa-key');
INSERT INTO `menus` VALUES ('20', '7', 'system_settings', 'System Setting', 'fa fa-clipboard');
INSERT INTO `menus` VALUES ('21', '7', 'menu_manage', 'Menu Setting', 'fa fa-server');

-- ----------------------------
-- Table structure for operation
-- ----------------------------
DROP TABLE IF EXISTS `operation`;
CREATE TABLE `operation` (
  `intOperationId` int(11) NOT NULL AUTO_INCREMENT,
  `strOperationName` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`intOperationId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of operation
-- ----------------------------
INSERT INTO `operation` VALUES ('1', '录入图书');
INSERT INTO `operation` VALUES ('2', '登录');
INSERT INTO `operation` VALUES ('3', '提交教学计划审核');
INSERT INTO `operation` VALUES ('4', '再次教学计划提交审核');
INSERT INTO `operation` VALUES ('5', '驳回教学计划申请');
INSERT INTO `operation` VALUES ('6', '更改教学计划');
INSERT INTO `operation` VALUES ('7', '取消教学计划');
INSERT INTO `operation` VALUES ('8', '通过了教学计划审核');
INSERT INTO `operation` VALUES ('9', '教学计划过期');
INSERT INTO `operation` VALUES ('10', '拒绝教学计划申请');

-- ----------------------------
-- Table structure for personalconfig
-- ----------------------------
DROP TABLE IF EXISTS `personalconfig`;
CREATE TABLE `personalconfig` (
  `intPersonConfigId` int(11) NOT NULL AUTO_INCREMENT,
  `intUserId` int(11) NOT NULL,
  `strConfigName` varchar(255) COLLATE utf8_bin NOT NULL,
  `intConfigValue` int(11) NOT NULL,
  PRIMARY KEY (`intPersonConfigId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of personalconfig
-- ----------------------------
INSERT INTO `personalconfig` VALUES ('1', '1', '33', '0');
INSERT INTO `personalconfig` VALUES ('2', '1', 'openAnimation', '1');
INSERT INTO `personalconfig` VALUES ('3', '1', 'bookgridsize', '18');
INSERT INTO `personalconfig` VALUES ('4', '1', 'usergridsize', '12');
INSERT INTO `personalconfig` VALUES ('5', '1', 'suppliergridsize', '16');
INSERT INTO `personalconfig` VALUES ('6', '1', 'plangridsize', '12');

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
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
INSERT INTO `power` VALUES ('10', '1', '教材计划管理(UI)', '1', 'manageplan', '1');
INSERT INTO `power` VALUES ('11', '1', '教材计划申请(个人)', '1', 'submitplan', '1');
INSERT INTO `power` VALUES ('12', '1', '教材计划查询(个人)', '1', 'queryplan', '1');
INSERT INTO `power` VALUES ('13', '1', '教材计划(UI)', '1', 'planui', '1');
INSERT INTO `power` VALUES ('14', '1', '系统设置(UI)', '1', 'setting', '1');
INSERT INTO `power` VALUES ('15', '9', '查询书籍', '1', 'querybook', '1');
INSERT INTO `power` VALUES ('16', '9', '添加书籍', '1', 'addbook', '1');
INSERT INTO `power` VALUES ('17', '9', '删除书籍', '1', 'rmbook', '1');
INSERT INTO `power` VALUES ('18', '9', '编辑书籍', '1', 'editbook', '1');
INSERT INTO `power` VALUES ('19', '4', '查询用户', '1', 'queryuser', '1');
INSERT INTO `power` VALUES ('20', '4', '添加用户', '1', 'adduser', '1');
INSERT INTO `power` VALUES ('21', '4', '编辑用户', '1', 'edituser', '1');
INSERT INTO `power` VALUES ('22', '4', '删除用户', '1', 'rmuser', '1');
INSERT INTO `power` VALUES ('23', '7', '查询供应商', '1', 'querysupplier', '1');
INSERT INTO `power` VALUES ('24', '7', '添加供应商', '1', 'addsupplier', '1');
INSERT INTO `power` VALUES ('25', '7', '编辑供应商', '1', 'editsupplier', '1');
INSERT INTO `power` VALUES ('26', '7', '删除供应商', '1', 'rmsupplier', '1');
INSERT INTO `power` VALUES ('27', '8', '添加用户系部', '1', 'adduserdepart', '1');
INSERT INTO `power` VALUES ('28', '8', '编辑用户系部', '1', 'edituserdepart', '1');
INSERT INTO `power` VALUES ('29', '8', '删除用户系部', '1', 'rmuserdepart', '1');
INSERT INTO `power` VALUES ('30', '8', '查询用户系部', '1', 'queryuserdepart', '1');
INSERT INTO `power` VALUES ('31', '5', '查询用户类型', '1', 'queryusertype', '1');
INSERT INTO `power` VALUES ('32', '5', '添加用户类型', '1', 'addusertype', '1');
INSERT INTO `power` VALUES ('33', '5', '编辑用户类型', '1', 'editusertype', '1');
INSERT INTO `power` VALUES ('34', '5', '删除用户类型', '1', 'rmusertype', '1');
INSERT INTO `power` VALUES ('35', '6', '添加书籍类型', '1', 'addbooktype', '1');
INSERT INTO `power` VALUES ('36', '6', '编辑书记类型', '1', 'editbooktype', '1');
INSERT INTO `power` VALUES ('37', '6', '删除书籍类型', '1', 'rmbooktype', '1');
INSERT INTO `power` VALUES ('38', '6', '查询书籍类型', '1', 'querybooktype', '1');
INSERT INTO `power` VALUES ('39', '10', '教材计划查询(管理)', '1', 'queryallplan', '1');
INSERT INTO `power` VALUES ('40', '10', '教材计划管理', '1', 'auditplan', '1');
INSERT INTO `power` VALUES ('41', '14', '全局设置', '1', 'systemsetting', '1');
INSERT INTO `power` VALUES ('42', '1', '登录', '2', 'Login', '0');
INSERT INTO `power` VALUES ('43', '1', '权限控管', '2', 'accesscontrol', '0');
INSERT INTO `power` VALUES ('44', '1', '管理用户', '2', 'manageuser', '0');
INSERT INTO `power` VALUES ('45', '1', '管理用户类型', '2', 'manageusertype', '0');
INSERT INTO `power` VALUES ('46', '1', '管理书籍类型', '2', 'managebooktype', '0');
INSERT INTO `power` VALUES ('47', '1', '管理供应商', '2', 'managesupplier', '0');
INSERT INTO `power` VALUES ('48', '1', '管理用户系部', '2', 'manageuserdepart', '0');
INSERT INTO `power` VALUES ('49', '1', '管理书籍', '2', 'managebook', '0');
INSERT INTO `power` VALUES ('50', '1', '教材计划管理(UI)', '2', 'manageplan', '0');
INSERT INTO `power` VALUES ('51', '1', '教材计划申请(个人)', '2', 'submitplan', '0');
INSERT INTO `power` VALUES ('52', '1', '教材计划查询(个人)', '2', 'queryplan', '0');
INSERT INTO `power` VALUES ('53', '1', '教材计划(UI)', '2', 'planui', '0');
INSERT INTO `power` VALUES ('54', '1', '系统设置(UI)', '2', 'setting', '0');
INSERT INTO `power` VALUES ('55', '44', '查询用户', '2', 'queryuser', '0');
INSERT INTO `power` VALUES ('56', '44', '添加用户', '2', 'adduser', '0');
INSERT INTO `power` VALUES ('57', '44', '编辑用户', '2', 'edituser', '0');
INSERT INTO `power` VALUES ('58', '44', '删除用户', '2', 'rmuser', '0');
INSERT INTO `power` VALUES ('59', '45', '查询用户类型', '2', 'queryusertype', '0');
INSERT INTO `power` VALUES ('60', '45', '添加用户类型', '2', 'addusertype', '0');
INSERT INTO `power` VALUES ('61', '45', '编辑用户类型', '2', 'editusertype', '0');
INSERT INTO `power` VALUES ('62', '45', '删除用户类型', '2', 'rmusertype', '0');
INSERT INTO `power` VALUES ('63', '46', '添加书籍类型', '2', 'addbooktype', '0');
INSERT INTO `power` VALUES ('64', '46', '编辑书记类型', '2', 'editbooktype', '0');
INSERT INTO `power` VALUES ('65', '46', '删除书籍类型', '2', 'rmbooktype', '0');
INSERT INTO `power` VALUES ('66', '46', '查询书籍类型', '2', 'querybooktype', '0');
INSERT INTO `power` VALUES ('67', '47', '查询供应商', '2', 'querysupplier', '0');
INSERT INTO `power` VALUES ('68', '47', '添加供应商', '2', 'addsupplier', '0');
INSERT INTO `power` VALUES ('69', '47', '编辑供应商', '2', 'editsupplier', '0');
INSERT INTO `power` VALUES ('70', '47', '删除供应商', '2', 'rmsupplier', '0');
INSERT INTO `power` VALUES ('71', '48', '添加用户系部', '2', 'adduserdepart', '0');
INSERT INTO `power` VALUES ('72', '48', '编辑用户系部', '2', 'edituserdepart', '0');
INSERT INTO `power` VALUES ('73', '48', '删除用户系部', '2', 'rmuserdepart', '0');
INSERT INTO `power` VALUES ('74', '48', '查询用户系部', '2', 'queryuserdepart', '0');
INSERT INTO `power` VALUES ('75', '49', '查询书籍', '2', 'querybook', '0');
INSERT INTO `power` VALUES ('76', '49', '添加书籍', '2', 'addbook', '0');
INSERT INTO `power` VALUES ('77', '49', '删除书籍', '2', 'rmbook', '0');
INSERT INTO `power` VALUES ('78', '49', '编辑书籍', '2', 'editbook', '0');
INSERT INTO `power` VALUES ('79', '50', '教材计划查询(管理)', '2', 'queryallplan', '0');
INSERT INTO `power` VALUES ('80', '50', '教材计划管理', '2', 'auditplan', '0');
INSERT INTO `power` VALUES ('81', '1', '登录', '3', 'Login', '0');
INSERT INTO `power` VALUES ('82', '1', '权限控管', '3', 'accesscontrol', '0');
INSERT INTO `power` VALUES ('83', '1', '管理用户', '3', 'manageuser', '0');
INSERT INTO `power` VALUES ('84', '1', '管理用户类型', '3', 'manageusertype', '0');
INSERT INTO `power` VALUES ('85', '1', '管理书籍类型', '3', 'managebooktype', '0');
INSERT INTO `power` VALUES ('86', '1', '管理供应商', '3', 'managesupplier', '0');
INSERT INTO `power` VALUES ('87', '1', '管理用户系部', '3', 'manageuserdepart', '0');
INSERT INTO `power` VALUES ('88', '1', '管理书籍', '3', 'managebook', '0');
INSERT INTO `power` VALUES ('89', '1', '教材计划管理(UI)', '3', 'manageplan', '0');
INSERT INTO `power` VALUES ('90', '1', '教材计划申请(个人)', '3', 'submitplan', '0');
INSERT INTO `power` VALUES ('91', '1', '教材计划查询(个人)', '3', 'queryplan', '0');
INSERT INTO `power` VALUES ('92', '1', '教材计划(UI)', '3', 'planui', '0');
INSERT INTO `power` VALUES ('93', '1', '系统设置(UI)', '3', 'setting', '0');
INSERT INTO `power` VALUES ('94', '83', '查询用户', '3', 'queryuser', '0');
INSERT INTO `power` VALUES ('95', '83', '添加用户', '3', 'adduser', '0');
INSERT INTO `power` VALUES ('96', '83', '编辑用户', '3', 'edituser', '0');
INSERT INTO `power` VALUES ('97', '83', '删除用户', '3', 'rmuser', '0');
INSERT INTO `power` VALUES ('98', '84', '查询用户类型', '3', 'queryusertype', '0');
INSERT INTO `power` VALUES ('99', '84', '添加用户类型', '3', 'addusertype', '0');
INSERT INTO `power` VALUES ('100', '84', '编辑用户类型', '3', 'editusertype', '0');
INSERT INTO `power` VALUES ('101', '84', '删除用户类型', '3', 'rmusertype', '0');
INSERT INTO `power` VALUES ('102', '85', '添加书籍类型', '3', 'addbooktype', '0');
INSERT INTO `power` VALUES ('103', '85', '编辑书记类型', '3', 'editbooktype', '0');
INSERT INTO `power` VALUES ('104', '85', '删除书籍类型', '3', 'rmbooktype', '0');
INSERT INTO `power` VALUES ('105', '85', '查询书籍类型', '3', 'querybooktype', '0');
INSERT INTO `power` VALUES ('106', '86', '查询供应商', '3', 'querysupplier', '0');
INSERT INTO `power` VALUES ('107', '86', '添加供应商', '3', 'addsupplier', '0');
INSERT INTO `power` VALUES ('108', '86', '编辑供应商', '3', 'editsupplier', '0');
INSERT INTO `power` VALUES ('109', '86', '删除供应商', '3', 'rmsupplier', '0');
INSERT INTO `power` VALUES ('110', '87', '添加用户系部', '3', 'adduserdepart', '0');
INSERT INTO `power` VALUES ('111', '87', '编辑用户系部', '3', 'edituserdepart', '0');
INSERT INTO `power` VALUES ('112', '87', '删除用户系部', '3', 'rmuserdepart', '0');
INSERT INTO `power` VALUES ('113', '87', '查询用户系部', '3', 'queryuserdepart', '0');
INSERT INTO `power` VALUES ('114', '88', '查询书籍', '3', 'querybook', '0');
INSERT INTO `power` VALUES ('115', '88', '添加书籍', '3', 'addbook', '0');
INSERT INTO `power` VALUES ('116', '88', '删除书籍', '3', 'rmbook', '0');
INSERT INTO `power` VALUES ('117', '88', '编辑书籍', '3', 'editbook', '0');
INSERT INTO `power` VALUES ('118', '89', '教材计划查询(管理)', '3', 'queryallplan', '0');
INSERT INTO `power` VALUES ('119', '89', '教材计划管理', '3', 'auditplan', '0');
INSERT INTO `power` VALUES ('120', '1', '登录', '4', 'Login', '0');
INSERT INTO `power` VALUES ('121', '1', '权限控管', '4', 'accesscontrol', '0');
INSERT INTO `power` VALUES ('122', '1', '管理用户', '4', 'manageuser', '0');
INSERT INTO `power` VALUES ('123', '1', '管理用户类型', '4', 'manageusertype', '0');
INSERT INTO `power` VALUES ('124', '1', '管理书籍类型', '4', 'managebooktype', '0');
INSERT INTO `power` VALUES ('125', '1', '管理供应商', '4', 'managesupplier', '0');
INSERT INTO `power` VALUES ('126', '1', '管理用户系部', '4', 'manageuserdepart', '0');
INSERT INTO `power` VALUES ('127', '1', '管理书籍', '4', 'managebook', '0');
INSERT INTO `power` VALUES ('128', '1', '教材计划管理(UI)', '4', 'manageplan', '0');
INSERT INTO `power` VALUES ('129', '1', '教材计划申请(个人)', '4', 'submitplan', '0');
INSERT INTO `power` VALUES ('130', '1', '教材计划查询(个人)', '4', 'queryplan', '0');
INSERT INTO `power` VALUES ('131', '1', '教材计划(UI)', '4', 'planui', '0');
INSERT INTO `power` VALUES ('132', '1', '系统设置(UI)', '4', 'setting', '0');
INSERT INTO `power` VALUES ('133', '122', '查询用户', '4', 'queryuser', '0');
INSERT INTO `power` VALUES ('134', '122', '添加用户', '4', 'adduser', '0');
INSERT INTO `power` VALUES ('135', '122', '编辑用户', '4', 'edituser', '0');
INSERT INTO `power` VALUES ('136', '122', '删除用户', '4', 'rmuser', '0');
INSERT INTO `power` VALUES ('137', '123', '查询用户类型', '4', 'queryusertype', '0');
INSERT INTO `power` VALUES ('138', '123', '添加用户类型', '4', 'addusertype', '0');
INSERT INTO `power` VALUES ('139', '123', '编辑用户类型', '4', 'editusertype', '0');
INSERT INTO `power` VALUES ('140', '123', '删除用户类型', '4', 'rmusertype', '0');
INSERT INTO `power` VALUES ('141', '124', '添加书籍类型', '4', 'addbooktype', '0');
INSERT INTO `power` VALUES ('142', '124', '编辑书记类型', '4', 'editbooktype', '0');
INSERT INTO `power` VALUES ('143', '124', '删除书籍类型', '4', 'rmbooktype', '0');
INSERT INTO `power` VALUES ('144', '124', '查询书籍类型', '4', 'querybooktype', '0');
INSERT INTO `power` VALUES ('145', '125', '查询供应商', '4', 'querysupplier', '0');
INSERT INTO `power` VALUES ('146', '125', '添加供应商', '4', 'addsupplier', '0');
INSERT INTO `power` VALUES ('147', '125', '编辑供应商', '4', 'editsupplier', '0');
INSERT INTO `power` VALUES ('148', '125', '删除供应商', '4', 'rmsupplier', '0');
INSERT INTO `power` VALUES ('149', '126', '添加用户系部', '4', 'adduserdepart', '0');
INSERT INTO `power` VALUES ('150', '126', '编辑用户系部', '4', 'edituserdepart', '0');
INSERT INTO `power` VALUES ('151', '126', '删除用户系部', '4', 'rmuserdepart', '0');
INSERT INTO `power` VALUES ('152', '126', '查询用户系部', '4', 'queryuserdepart', '0');
INSERT INTO `power` VALUES ('153', '127', '查询书籍', '4', 'querybook', '0');
INSERT INTO `power` VALUES ('154', '127', '添加书籍', '4', 'addbook', '0');
INSERT INTO `power` VALUES ('155', '127', '删除书籍', '4', 'rmbook', '0');
INSERT INTO `power` VALUES ('156', '127', '编辑书籍', '4', 'editbook', '0');
INSERT INTO `power` VALUES ('157', '128', '教材计划查询(管理)', '4', 'queryallplan', '0');
INSERT INTO `power` VALUES ('158', '128', '教材计划管理', '4', 'auditplan', '0');
INSERT INTO `power` VALUES ('159', '1', '登录', '5', 'Login', '0');
INSERT INTO `power` VALUES ('160', '1', '权限控管', '5', 'accesscontrol', '0');
INSERT INTO `power` VALUES ('161', '1', '管理用户', '5', 'manageuser', '0');
INSERT INTO `power` VALUES ('162', '1', '管理用户类型', '5', 'manageusertype', '0');
INSERT INTO `power` VALUES ('163', '1', '管理书籍类型', '5', 'managebooktype', '0');
INSERT INTO `power` VALUES ('164', '1', '管理供应商', '5', 'managesupplier', '0');
INSERT INTO `power` VALUES ('165', '1', '管理用户系部', '5', 'manageuserdepart', '0');
INSERT INTO `power` VALUES ('166', '1', '管理书籍', '5', 'managebook', '0');
INSERT INTO `power` VALUES ('167', '1', '教材计划管理(UI)', '5', 'manageplan', '0');
INSERT INTO `power` VALUES ('168', '1', '教材计划申请(个人)', '5', 'submitplan', '0');
INSERT INTO `power` VALUES ('169', '1', '教材计划查询(个人)', '5', 'queryplan', '0');
INSERT INTO `power` VALUES ('170', '1', '教材计划(UI)', '5', 'planui', '0');
INSERT INTO `power` VALUES ('171', '1', '系统设置(UI)', '5', 'setting', '0');
INSERT INTO `power` VALUES ('172', '161', '查询用户', '5', 'queryuser', '0');
INSERT INTO `power` VALUES ('173', '161', '添加用户', '5', 'adduser', '0');
INSERT INTO `power` VALUES ('174', '161', '编辑用户', '5', 'edituser', '0');
INSERT INTO `power` VALUES ('175', '161', '删除用户', '5', 'rmuser', '0');
INSERT INTO `power` VALUES ('176', '162', '查询用户类型', '5', 'queryusertype', '0');
INSERT INTO `power` VALUES ('177', '162', '添加用户类型', '5', 'addusertype', '0');
INSERT INTO `power` VALUES ('178', '162', '编辑用户类型', '5', 'editusertype', '0');
INSERT INTO `power` VALUES ('179', '162', '删除用户类型', '5', 'rmusertype', '0');
INSERT INTO `power` VALUES ('180', '163', '添加书籍类型', '5', 'addbooktype', '0');
INSERT INTO `power` VALUES ('181', '163', '编辑书记类型', '5', 'editbooktype', '0');
INSERT INTO `power` VALUES ('182', '163', '删除书籍类型', '5', 'rmbooktype', '0');
INSERT INTO `power` VALUES ('183', '163', '查询书籍类型', '5', 'querybooktype', '0');
INSERT INTO `power` VALUES ('184', '164', '查询供应商', '5', 'querysupplier', '0');
INSERT INTO `power` VALUES ('185', '164', '添加供应商', '5', 'addsupplier', '0');
INSERT INTO `power` VALUES ('186', '164', '编辑供应商', '5', 'editsupplier', '0');
INSERT INTO `power` VALUES ('187', '164', '删除供应商', '5', 'rmsupplier', '0');
INSERT INTO `power` VALUES ('188', '165', '添加用户系部', '5', 'adduserdepart', '0');
INSERT INTO `power` VALUES ('189', '165', '编辑用户系部', '5', 'edituserdepart', '0');
INSERT INTO `power` VALUES ('190', '165', '删除用户系部', '5', 'rmuserdepart', '0');
INSERT INTO `power` VALUES ('191', '165', '查询用户系部', '5', 'queryuserdepart', '0');
INSERT INTO `power` VALUES ('192', '166', '查询书籍', '5', 'querybook', '0');
INSERT INTO `power` VALUES ('193', '166', '添加书籍', '5', 'addbook', '0');
INSERT INTO `power` VALUES ('194', '166', '删除书籍', '5', 'rmbook', '0');
INSERT INTO `power` VALUES ('195', '166', '编辑书籍', '5', 'editbook', '0');
INSERT INTO `power` VALUES ('196', '167', '教材计划查询(管理)', '5', 'queryallplan', '0');
INSERT INTO `power` VALUES ('197', '167', '教材计划管理', '5', 'auditplan', '0');
INSERT INTO `power` VALUES ('198', '14', '菜单管理', '1', 'menumanage', '1');

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
  `strPhone` varchar(255) COLLATE utf8_bin NOT NULL,
  `strMail` varchar(255) COLLATE utf8_bin NOT NULL,
  `strPic` varchar(255) COLLATE utf8_bin NOT NULL,
  `dateRegTime` datetime NOT NULL,
  PRIMARY KEY (`intId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'Admin', 'a', '管理员', '1', '13', '11', '222', '1111', 'administrator@qq.com', 'avatar.jpg', '2015-04-04 04:52:29');
INSERT INTO `user` VALUES ('2', 'Troevil', '123456', 'SSSFF', '2', '3', '2', '1234234', '18994323', '2121@qq.com', 'avatar.jpg', '2015-02-28 20:44:02');
INSERT INTO `user` VALUES ('3', 'TestUser', 'TestUser', 'TestUser', '3', '5', '4', '2342342', 'asd', 'TestUser@qq.com', 'avatar.jpg', '2015-03-29 17:01:52');
INSERT INTO `user` VALUES ('4', 'AAAA', 'AAAAAAAA', 'AAAA', '4', '10', '9', '363464', 'AAAA', 'AAAA', 'avatar.jpg', '2015-02-28 20:56:49');
INSERT INTO `user` VALUES ('5', 'aasf', 'aasfaasf', 'aasf', '3', '6', '4', '34432453', 'aasf', 'aasf', 'avatar.jpg', '2015-02-28 20:56:01');
INSERT INTO `user` VALUES ('6', 'qqq', 'qqqqqq', 'qqq', '5', '12', '11', '2342343', '1111178888', 'qqq@11.com', 'avatar.jpg', '2015-02-28 20:56:39');
INSERT INTO `user` VALUES ('7', 'TestForInject', 'TestForInject', 'TestForInject', '5', '6', '4', '1112232', '1111', 'TestForInject', 'avatar.jpg', '2015-02-28 20:56:23');
INSERT INTO `user` VALUES ('8', 'TestForAddUser', 'TestForAddUser', 'TestForAddUser', '4', '5', '4', 'TestForAddUser', '111111', 'TestForAddUser@qq.com', 'avatar.jpg', '2015-02-28 20:56:23');
INSERT INTO `user` VALUES ('9', 'TestForAddUser2', 'TestForAddUser2', 'TestForAddUser2', '5', '16', '14', '121231231', '111111', 'TestForAddUser2@qq.com', 'avatar.jpg', '2015-02-28 20:57:00');
INSERT INTO `user` VALUES ('11', 'Test', '1asasds', 'ss222', '4', '13', '11', '656564', '11111', '655', 'resources/img/userpic/avatar.jpg', '2015-03-29 17:02:12');

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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

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
INSERT INTO `versionlog` VALUES ('13', '0012', '01', '1', '新增UI权限控制<br>更新调整权限数据库,<br>[feature] 权限控管', '2015-02-12 22:52:45');
INSERT INTO `versionlog` VALUES ('14', '0013', '00', '1', '新增/完善权限控管<br>[feature] 教学书籍订购计划管理', '2015-03-02 21:03:45');
INSERT INTO `versionlog` VALUES ('15', '0014', '04', '1', '新增书籍条件查询<br>修复UI等错位<br>修复编辑书籍类型，供应商类型丢失bug<br>修复删除用户是自身删除bug<br>修复权限控管部分失效bug<br>[feture]继续完善教学计划提交Plan Submit', '2015-03-05 16:42:26');
INSERT INTO `versionlog` VALUES ('16', '0014', '05', '1', '修复编辑用户个人信息参数错误bug', '2015-03-06 13:14:36');
INSERT INTO `versionlog` VALUES ('17', '0015', '01', '1', '新增教学计划提交<br>改善权限控制机制,优化读取逻辑<br>[feature]教学计划查询与更变', '2015-03-11 13:05:16');
INSERT INTO `versionlog` VALUES ('18', '0015', '04', '1', '新增个人计划查询<br>修复多出数据处理BUG<br>改善后台逻辑,优化web性能<br>优化js,css,移除不必要的css', '2015-03-12 16:59:31');
INSERT INTO `versionlog` VALUES ('19', '0016', '00', '1', '新增个人设置', '2015-03-13 13:41:45');
INSERT INTO `versionlog` VALUES ('20', '0017', '00', '1', '新增个人计划变更', '2015-03-13 16:21:35');
INSERT INTO `versionlog` VALUES ('21', '0020', '00', '1', '新增用户头像上传与变更<br>变更权限控制,session控制方式<br>缩减无用html,js,java代码', '2015-03-18 21:55:35');
INSERT INTO `versionlog` VALUES ('22', '0021', '00', '1', '调整UI,兼容IE[不支持低版本IE678],FF,Chrome.', '2015-03-19 20:55:05');
INSERT INTO `versionlog` VALUES ('23', '0022', '00', '1', '使用Jenkins自动化持续化部署.', '2015-03-21 14:33:15');
INSERT INTO `versionlog` VALUES ('34', '0023', '00', '1', '修复部分BUG,移除SunBase64', '2015-03-26 22:57:56');
INSERT INTO `versionlog` VALUES ('35', '0023', '02', '1', '修复个人设置界面快速切换500错误<br>新增user filter(未完成)', '2015-03-28 14:56:41');
INSERT INTO `versionlog` VALUES ('36', '0024', '00', '1', '新增教师申请导出到excel<br>新增用户查询详细filter<br>新增修改个人设置实时生效<br>继续完善计划管理', '2015-03-29 20:03:36');
INSERT INTO `versionlog` VALUES ('37', '0025', '2', '1', '新增菜单搜索<br>完善细节功能', '2015-04-03 16:15:08');

-- ----------------------------
-- Procedure structure for AddOrUpdatePersonalConfig
-- ----------------------------
DROP PROCEDURE IF EXISTS `AddOrUpdatePersonalConfig`;
DELIMITER ;;
CREATE PROCEDURE `AddOrUpdatePersonalConfig`(IN `configName` varchar(255),IN `userId` int(11),IN `configValue` int(11))
BEGIN
	DECLARE i int(11);
	SET i = -1;
	SELECT intPersonConfigId INTO i FROM personalconfig WHERE strConfigName = configName AND intUserId = userId ;
	IF i <> -1 THEN
		UPDATE personalconfig SET intConfigValue = configValue WHERE intPersonConfigId = i ;
	ELSE
		INSERT INTO personalconfig (strConfigName,intUserId,intConfigValue) VALUES(configName,userId,configValue);
		SET i = LAST_INSERT_ID();
END IF;
	SELECT * FROM personalconfig WHERE intPersonConfigId = i ;
END
;;
DELIMITER ;

/*
Navicat MySQL Data Transfer

Source Server         : mydb
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : mydb

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2019-07-03 22:58:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_privilege
-- ----------------------------
DROP TABLE IF EXISTS `admin_privilege`;
CREATE TABLE `admin_privilege` (
  `privilege_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `privilege_resource_id` int(11) NOT NULL DEFAULT '0' COMMENT '资源id',
  `privilege_role_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色id',
  `privilege_create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `privilege_update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`privilege_id`),
  KEY `idx_privilege_resource_id` (`privilege_resource_id`),
  KEY `idx_privilege_role_id` (`privilege_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COMMENT='权限表';

-- ----------------------------
-- Records of admin_privilege
-- ----------------------------
INSERT INTO `admin_privilege` VALUES ('42', '6', '3', '2019-07-03 22:16:36', '2019-07-03 22:16:35');
INSERT INTO `admin_privilege` VALUES ('43', '9', '3', '2019-07-03 22:16:36', '2019-07-03 22:16:35');
INSERT INTO `admin_privilege` VALUES ('44', '13', '3', '2019-07-03 22:16:36', '2019-07-03 22:16:35');
INSERT INTO `admin_privilege` VALUES ('45', '5', '4', '2019-07-03 22:54:27', '2019-07-03 22:54:26');
INSERT INTO `admin_privilege` VALUES ('46', '6', '4', '2019-07-03 22:54:27', '2019-07-03 22:54:26');
INSERT INTO `admin_privilege` VALUES ('47', '7', '4', '2019-07-03 22:54:27', '2019-07-03 22:54:26');
INSERT INTO `admin_privilege` VALUES ('48', '9', '4', '2019-07-03 22:54:27', '2019-07-03 22:54:26');
INSERT INTO `admin_privilege` VALUES ('49', '13', '4', '2019-07-03 22:54:27', '2019-07-03 22:54:26');
INSERT INTO `admin_privilege` VALUES ('50', '14', '4', '2019-07-03 22:54:27', '2019-07-03 22:54:26');
INSERT INTO `admin_privilege` VALUES ('51', '15', '4', '2019-07-03 22:54:27', '2019-07-03 22:54:26');

-- ----------------------------
-- Table structure for admin_resource
-- ----------------------------
DROP TABLE IF EXISTS `admin_resource`;
CREATE TABLE `admin_resource` (
  `resource_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源id',
  `resource_parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '资源父id',
  `resource_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '资源类型 0-菜单 1-功能',
  `resource_target` varchar(64) NOT NULL DEFAULT '' COMMENT '语义化索引',
  `resource_data` varchar(1024) NOT NULL DEFAULT '' COMMENT '资源data，json格式',
  `resource_create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `resource_update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`resource_id`),
  KEY `idx_resource_parent_id` (`resource_parent_id`),
  KEY `idx_resource_target` (`resource_target`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COMMENT='资源(菜单/接口)表';

-- ----------------------------
-- Records of admin_resource
-- ----------------------------
INSERT INTO `admin_resource` VALUES ('1', '0', '0', '', '{\"path\":\"/system\",\"icon\":\"\",\"title\":\"系统管理\",\"type\":\"layout\",\"seq\":100}', '2019-05-09 15:16:57', '2019-06-18 10:54:26');
INSERT INTO `admin_resource` VALUES ('2', '1', '0', '', '{\"title\":\"菜单管理\",\"path\":\"system/menu\",\"icon\":\"\",\"seq\":9,\"type\":\"default\"}', '2019-05-09 15:16:57', '2019-05-09 15:16:57');
INSERT INTO `admin_resource` VALUES ('3', '1', '0', '', '{\"title\":\"用户管理\",\"path\":\"system/user\",\"icon\":\"\",\"seq\":8,\"type\":\"default\"}', '2019-05-09 15:16:57', '2019-05-09 15:16:57');
INSERT INTO `admin_resource` VALUES ('4', '1', '0', '', '{\"title\":\"角色管理\",\"path\":\"system/role\",\"icon\":\"\",\"seq\":7,\"type\":\"default\"}', '2019-05-09 15:16:57', '2019-05-09 15:16:57');
INSERT INTO `admin_resource` VALUES ('5', '0', '0', '', '{\"path\":\"/course\",\"icon\":null,\"title\":\"课程管理\",\"type\":\"layout\",\"seq\":70}', '2019-05-09 15:50:30', '2019-06-18 10:54:56');
INSERT INTO `admin_resource` VALUES ('6', '5', '0', '', '{\"path\":\"course/courseInfo\",\"icon\":null,\"title\":\"课程信息\",\"type\":\"default\",\"seq\":0}', '2019-05-09 17:22:25', '2019-06-11 10:56:50');
INSERT INTO `admin_resource` VALUES ('7', '5', '0', '', '{\"path\":\"course/check\",\"icon\":null,\"title\":\"签到管理\",\"type\":\"default\",\"seq\":0}', '2019-06-10 17:28:43', '2019-06-11 10:57:18');
INSERT INTO `admin_resource` VALUES ('9', '0', '0', '', '{\"path\":\"/student\",\"icon\":null,\"title\":\"学生管理\",\"type\":\"layout\",\"seq\":90}', '2019-06-18 10:52:30', '2019-06-18 11:05:36');
INSERT INTO `admin_resource` VALUES ('10', '8', '0', '', '{\"path\":\"student/student\",\"icon\":null,\"title\":\"学生信息\",\"type\":\"iframe\",\"seq\":0}', '2019-06-18 10:52:58', '2019-06-18 10:52:58');
INSERT INTO `admin_resource` VALUES ('13', '9', '0', '', '{\"path\":\"student/student\",\"icon\":null,\"title\":\"学生信息\",\"type\":\"default\",\"seq\":0}', '2019-06-18 11:06:00', '2019-06-18 11:06:00');
INSERT INTO `admin_resource` VALUES ('14', '0', '0', '', '{\"path\":\"/teacher\",\"icon\":null,\"title\":\"教师管理\",\"type\":\"layout\",\"seq\":80}', '2019-06-18 11:16:35', '2019-06-18 11:16:35');
INSERT INTO `admin_resource` VALUES ('15', '14', '0', '', '{\"path\":\"teacher/teacher\",\"icon\":null,\"title\":\"教师信息\",\"type\":\"default\",\"seq\":0}', '2019-06-18 11:17:08', '2019-06-18 11:17:08');
INSERT INTO `admin_resource` VALUES ('16', '0', '0', '', '{\"path\":\"/resource\",\"icon\":null,\"title\":\"资源配置\",\"type\":\"layout\",\"seq\":60}', '2019-06-18 11:17:48', '2019-06-18 11:17:47');
INSERT INTO `admin_resource` VALUES ('18', '16', '0', '', '{\"path\":\"resource/404\",\"icon\":null,\"title\":\"404\",\"type\":\"default\",\"seq\":0}', '2019-06-18 11:27:49', '2019-06-18 11:27:49');
INSERT INTO `admin_resource` VALUES ('19', '16', '0', '', '{\"path\":\"resource/401\",\"icon\":null,\"title\":\"401\",\"type\":\"default\",\"seq\":0}', '2019-06-18 11:28:05', '2019-06-18 11:28:05');
INSERT INTO `admin_resource` VALUES ('20', '16', '0', '', '{\"path\":\"system/configure\",\"icon\":null,\"title\":\"应用配置\",\"type\":\"default\",\"seq\":10}', '2019-06-21 11:07:56', '2019-06-21 11:07:58');
INSERT INTO `admin_resource` VALUES ('21', '16', '0', '', '{\"path\":\"resource/example\",\"icon\":null,\"title\":\"图表样例\",\"type\":\"default\",\"seq\":9}', '2019-06-22 12:50:28', '2019-06-22 12:51:02');

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父角色id',
  `role_name` varchar(16) NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '角色描述',
  `role_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0-正常 1-停用',
  `role_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型 0-成员角色member 1-群组角色group',
  `role_create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `role_update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `uniq_role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='后台角色表';

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES ('1', '0', '超级管理员', '拥有所有权限', '0', '1', '2019-05-09 15:16:56', '2019-05-09 15:16:56');
INSERT INTO `admin_role` VALUES ('3', '1', '学生', '查看课程信息，修改个人信息', '0', '0', '2019-05-09 15:41:07', '2019-05-09 15:41:06');
INSERT INTO `admin_role` VALUES ('4', '1', '老师', '修改课程信息，发起签到', '0', '0', '2019-05-09 15:45:26', '2019-05-09 15:45:25');
INSERT INTO `admin_role` VALUES ('5', '1', '系统维护员工', '维护系统', '0', '1', '2019-06-17 17:38:21', '2019-06-17 17:38:22');

-- ----------------------------
-- Table structure for admin_role_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_user`;
CREATE TABLE `admin_role_user` (
  `role_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_user_role_id` int(11) NOT NULL COMMENT '角色id',
  `role_user_user_id` int(11) NOT NULL COMMENT '用户id',
  `role_user_create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `role_user_update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`role_user_id`),
  KEY `idx_role_user_role_id` (`role_user_role_id`),
  KEY `idx_role_user_user_id` (`role_user_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='角色用户关联表';

-- ----------------------------
-- Records of admin_role_user
-- ----------------------------
INSERT INTO `admin_role_user` VALUES ('1', '1', '1', '2019-05-09 15:16:56', '2019-05-09 15:16:56');
INSERT INTO `admin_role_user` VALUES ('2', '4', '2', '2019-05-09 15:47:27', '2019-05-09 15:47:27');
INSERT INTO `admin_role_user` VALUES ('3', '3', '3', '2019-05-09 15:48:12', '2019-05-09 15:48:12');

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_phone` char(11) NOT NULL COMMENT '手机号',
  `user_name` varchar(16) NOT NULL DEFAULT '' COMMENT '姓名',
  `user_email` varchar(64) NOT NULL DEFAULT '' COMMENT '邮箱',
  `user_password` varchar(64) NOT NULL DEFAULT '' COMMENT '密码',
  `user_token` varchar(64) NOT NULL DEFAULT '' COMMENT '登录的token',
  `user_avatar` varchar(128) NOT NULL DEFAULT '' COMMENT '用户头像',
  `user_login_count` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `user_last_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `user_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0-正常 1-停用',
  `user_create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `user_update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `uniq_user_phone` (`user_phone`),
  UNIQUE KEY `uniq_user_email` (`user_email`),
  KEY `idx_user_token` (`user_token`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='管理后台用户表';

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES ('1', '15659155560', '超级管理员', 'admin@admin.com', '$2a$10$wHZ./auX3n2slewakRNfzui33oqEaXLbPQU5mKgy.DTuvcUW0CIxu', '624fc5269f9b4e9ba2ea076af34bd9fd', '', '0', '0:0:0:0:0:0:0:1', '0', '2019-05-09 15:17:29', '2019-05-09 15:17:29');
INSERT INTO `admin_user` VALUES ('2', '12323232323', '李老师', '123@sina.com', '$2a$10$1JfHCKV6NOxH2FvJ4qsn/O3XGB2/EpJHJjPUfrddoI/11O2mACqxC', '8f12a77212534330b0d5862fb232c020', '', '1', '0:0:0:0:0:0:0:1', '0', '2019-05-09 15:47:27', '2019-05-09 15:47:27');
INSERT INTO `admin_user` VALUES ('3', '18072972981', '白白', '729@sina.com', '$2a$10$yQZ8nrWOfXjyONa8DQTA3./KBa4nVbJ.o.hY0ylUkkRyulNNPzAbO', 'd3fdff2bb56e4ca9a67121f1124dc2e9', '', '1', '0:0:0:0:0:0:0:1', '0', '2019-05-09 15:48:13', '2019-05-09 15:48:12');

-- ----------------------------
-- Table structure for check_information
-- ----------------------------
DROP TABLE IF EXISTS `check_information`;
CREATE TABLE `check_information` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `status` enum('checked','unchecked') NOT NULL DEFAULT 'checked' COMMENT '是否签到',
  `student` varchar(11) NOT NULL,
  `teacher` varchar(10) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `check_ibfk_1` (`student`),
  KEY `check_ibfk_2` (`teacher`),
  KEY `cname` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of check_information
-- ----------------------------
INSERT INTO `check_information` VALUES ('1', '智能技术', 'unchecked', '烦烦', '叶老师', '2019-06-29 17:48:46', '2019-06-29 17:48:46');
INSERT INTO `check_information` VALUES ('2', '计算机可视化技术', 'checked', '阿白', '娜娜老师', '2019-06-29 17:49:20', '2019-06-29 17:49:20');

-- ----------------------------
-- Table structure for configure
-- ----------------------------
DROP TABLE IF EXISTS `configure`;
CREATE TABLE `configure` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '配置项名',
  `value` text NOT NULL COMMENT '配置项值',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '配置项中文描述',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='系统及参数配置项表';

-- ----------------------------
-- Records of configure
-- ----------------------------
INSERT INTO `configure` VALUES ('1', 'student_sex', '{\n  \"male\": \"男\",\n  \"female\": \"女\"\n}', '学生性别配置', '2019-06-21 11:08:54', '2019-06-21 11:08:54');
INSERT INTO `configure` VALUES ('2', 'teacher_sex', '{\n  \"male\": \"男\",\n  \"female\": \"女\"\n}', '教师性别配置', '2019-06-21 18:32:58', '2019-06-21 18:32:58');
INSERT INTO `configure` VALUES ('3', 'course_start', '{\n  \"08:00-9:40\": \"08:00-9:40\",\n  \"10:00-11:40\": \"10:00-11:40\",\n  \"14:00-15:40\": \"14:00-15:40\",\n  \"16:00-17:40\": \"16:00-17:40\",\n  \"19:00-20:40\": \"19:00-20:40\"\n}', '上课时间配置', '2019-06-29 15:20:23', '2019-06-29 15:20:23');
INSERT INTO `configure` VALUES ('4', 'check_status', '{\n  \"checked\": \"已签到\",\n  \"unchecked\": \"未签到\"\n}', '签到状态', '2019-06-29 17:13:50', '2019-06-29 17:13:50');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `number` varchar(20) NOT NULL,
  `name` varchar(25) NOT NULL,
  `start` enum('08:00-9:40','10:00-11:40','14:00-15:40','16:00-17:40','19:00-20:40') NOT NULL DEFAULT '08:00-9:40' COMMENT '上课时间',
  `week` varchar(25) NOT NULL,
  `grade` varchar(32) NOT NULL,
  `teacher` varchar(10) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `cname` (`name`),
  KEY `student` (`grade`),
  KEY `teacher` (`teacher`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '50001', '智能技术', '14:00-15:40', '18周', '2班', '周老师', '2019-06-29 15:28:28', '2019-06-29 15:28:28');
INSERT INTO `course` VALUES ('2', '50002', '高级机器学习', '19:00-20:40', '19周', '2班', '李老师', '2019-06-29 15:42:46', '2019-06-29 15:42:46');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `number` varchar(64) NOT NULL DEFAULT '' COMMENT '学生学号',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '学生姓名',
  `sex` enum('male','female') NOT NULL DEFAULT 'male' COMMENT '学生性别',
  `age` tinyint(4) NOT NULL DEFAULT '0' COMMENT '资源类型 0-菜单 1-功能',
  `grade` varchar(32) NOT NULL DEFAULT '' COMMENT '所属班级',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_number` (`number`),
  KEY `grade` (`grade`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='学生信息表';

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '10001', '白起', 'male', '22', '1班', '2019-06-18 10:58:13', '2019-06-18 10:58:13');
INSERT INTO `student` VALUES ('2', '10002', '叶叶', 'male', '25', '1班', '2019-06-18 10:59:14', '2019-06-18 10:59:14');
INSERT INTO `student` VALUES ('3', '10003', '白娜', 'female', '17', '5班', '2019-06-21 10:12:48', '2019-06-21 10:12:48');
INSERT INTO `student` VALUES ('4', '10004', '尤娜', 'female', '16', '8班', '2019-07-03 22:18:05', '2019-07-03 22:18:05');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `number` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `sex` enum('male','female') CHARACTER SET utf8mb4 NOT NULL DEFAULT 'male' COMMENT '教师性别',
  `email` varchar(50) NOT NULL,
  `job` varchar(10) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('2', '80002', '叶子老师', 'female', '328191847@qq..com', '日语', '2019-06-22 11:42:29', '2019-06-22 11:42:29');
INSERT INTO `teacher` VALUES ('3', '80003', '少天老师', 'male', '164983741@qq.com', '体育', '2019-06-22 12:22:51', '2019-06-22 12:22:51');

-- ----------------------------
-- Procedure structure for addRoleUser
-- ----------------------------
DROP PROCEDURE IF EXISTS `addRoleUser`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addRoleUser`(IN roleId INT, in userIds_source varchar(50))
BEGIN
	DECLARE s int DEFAULT 0;
	DECLARE userId int;
	DECLARE userId_add varchar(11) default '';
	DECLARE i int;
	DECLARE num int;
	DECLARE userIds_data varchar(50) default '';
	DECLARE userIds_del varchar(50) default '';
	DECLARE userIds_add varchar(50) default '';
	DECLARE del_sql varchar(200) default '';

	DECLARE userRole CURSOR FOR SELECT role_user_user_id FROM admin_role_user WHERE role_user_role_id=roleId;
  	DECLARE CONTINUE HANDLER FOR NOT FOUND SET s=1;

  	OPEN userRole;
  		FETCH userRole INTO userId;
  		WHILE s <> 1 DO
  			SET userIds_data = CONCAT(userIds_data, CONCAT(userId, ','));
  			FETCH userRole INTO userId;
  		END WHILE;
  	CLOSE userRole;
  	SET userIds_data = CONCAT(',', userIds_data);

  	SET userIds_del = userIds_data;
  	SET num = (length(userIds_source) - length(replace(userIds_source,',','')));
  	SET i = 1;
  	WHILE i <= num DO
  		SET userIds_del = replace(userIds_del,CONCAT(',', reverse(substring_index(reverse(substring_index(userIds_source,',', i)),',',1)), ','), ',');
  		SET i = i + 1;
  	END WHILE;

  	SET num = (length(userIds_del) - length(replace(userIds_del,',','')));
  	SET userIds_del = substring_index(userIds_del,',', num);
  	SET userIds_del = reverse(substring_index(reverse(userIds_del), ',', num - 1));

  	SET userIds_add = userIds_source;
  	SET num = (length(userIds_data) - length(replace(userIds_data,',','')));
  	SET i = 1;
  	WHILE i <= num DO
  		SET userIds_add = replace(userIds_add,CONCAT(',', reverse(substring_index(reverse(substring_index(userIds_data,',', i)),',',1)), ','), ',');
  		SET i = i + 1;
  	END WHILE;

  	SET num = (length(userIds_add) - length(replace(userIds_add,',','')));
  	SET userIds_add = substring_index(userIds_add,',', num);
  	SET userIds_add = reverse(substring_index(reverse(userIds_add), ',', num - 1));

  	if userIds_del != '' then
  		SET @del_sql = CONCAT("delete from admin_role_user where role_user_user_id in (", userIds_del, ") and role_user_role_id=", roleId);
  		prepare mainStmt from @del_sql;
  		execute mainStmt;
  		deallocate prepare mainStmt;
  	end if;

  	if userIds_add != '' then
    	SET num = (length(userIds_add) - length(replace(userIds_add,',',''))) + 1;
  		SET i = 1;
  		WHILE i <= num DO
  			SET userId_add = reverse(substring_index(reverse(substring_index(userIds_add,',', i)),',',1));
  			insert into admin_role_user(role_user_role_id, role_user_user_id) values(roleId, userId_add);
  			SET i = i + 1;
  		END WHILE;
  	end if;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for addUserRole
-- ----------------------------
DROP PROCEDURE IF EXISTS `addUserRole`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addUserRole`(IN userId INT, in roleIds_source varchar(50))
BEGIN
	DECLARE s int DEFAULT 0;
	DECLARE roleId int;
	DECLARE roleId_add varchar(11) default '';
	DECLARE i int;
	DECLARE num int;
	DECLARE roleIds_data varchar(50) default '';
	DECLARE roleIds_del varchar(50) default '';
	DECLARE roleIds_add varchar(50) default '';
	DECLARE del_sql varchar(200) default '';

	DECLARE roleUser CURSOR FOR SELECT role_user_role_id FROM admin_role_user WHERE role_user_user_id=userId;
  	DECLARE CONTINUE HANDLER FOR NOT FOUND SET s=1;

  	OPEN roleUser;
  		FETCH roleUser INTO roleId;
  		WHILE s <> 1 DO
  			SET roleIds_data = CONCAT(roleIds_data, CONCAT(roleId, ','));
  			FETCH roleUser INTO roleId;
  		END WHILE;
  	CLOSE roleUser;
  	SET roleIds_data = CONCAT(',', roleIds_data);

  	SET roleIds_del = roleIds_data;
  	SET num = (length(roleIds_source) - length(replace(roleIds_source,',','')));
  	SET i = 1;
  	WHILE i <= num DO
  		SET roleIds_del = replace(roleIds_del,CONCAT(',', reverse(substring_index(reverse(substring_index(roleIds_source,',', i)),',',1)), ','), ',');
  		SET i = i + 1;
  	END WHILE;

  	SET num = (length(roleIds_del) - length(replace(roleIds_del,',','')));
  	SET roleIds_del = substring_index(roleIds_del,',', num);
  	SET roleIds_del = reverse(substring_index(reverse(roleIds_del), ',', num - 1));

  	SET roleIds_add = roleIds_source;
  	SET num = (length(roleIds_data) - length(replace(roleIds_data,',','')));
  	SET i = 1;
  	WHILE i <= num DO
  		SET roleIds_add = replace(roleIds_add,CONCAT(',', reverse(substring_index(reverse(substring_index(roleIds_data,',', i)),',',1)), ','), ',');
  		SET i = i + 1;
  	END WHILE;

  	SET num = (length(roleIds_add) - length(replace(roleIds_add,',','')));
  	SET roleIds_add = substring_index(roleIds_add,',', num);
  	SET roleIds_add = reverse(substring_index(reverse(roleIds_add), ',', num - 1));

  	if roleIds_del != '' then
  	  SET @del_sql = CONCAT("delete from admin_role_user where role_user_role_id in (", roleIds_del, ") and role_user_user_id=", userId);
  		prepare mainStmt from @del_sql;
  		execute mainStmt;
  		deallocate prepare mainStmt;
  	end if;

  	if roleIds_add != '' then
    	SET num = (length(roleIds_add) - length(replace(roleIds_add,',',''))) + 1;
  		SET i = 1;
  		WHILE i <= num DO
  			SET roleId_add = reverse(substring_index(reverse(substring_index(roleIds_add,',', i)),',',1));
  			insert into admin_role_user(role_user_role_id, role_user_user_id) values(roleId_add, userId);
  			SET i = i + 1;
  		END WHILE;
  	end if;
END
;;
DELIMITER ;

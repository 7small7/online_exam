/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.13304@docker
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : 127.0.01:3304
 Source Schema         : exam_wechat

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 19/05/2021 10:17:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for exam_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `exam_admin_menu`;
CREATE TABLE `exam_admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of exam_admin_menu
-- ----------------------------
BEGIN;
INSERT INTO `exam_admin_menu` VALUES (1, 0, 1, '系统总览', 'fa-bar-chart', '/', NULL, NULL, '2021-03-07 07:51:36');
INSERT INTO `exam_admin_menu` VALUES (2, 0, 19, '后台管理', 'fa-tasks', NULL, NULL, NULL, '2021-03-14 20:13:22');
INSERT INTO `exam_admin_menu` VALUES (3, 2, 20, '人员管理', 'fa-users', 'auth/users', NULL, NULL, '2021-03-14 20:13:23');
INSERT INTO `exam_admin_menu` VALUES (4, 2, 21, '角色管理', 'fa-user', 'auth/roles', NULL, NULL, '2021-03-14 20:13:23');
INSERT INTO `exam_admin_menu` VALUES (5, 2, 22, '权限管理', 'fa-ban', 'auth/permissions', NULL, NULL, '2021-03-14 20:13:23');
INSERT INTO `exam_admin_menu` VALUES (6, 2, 23, '菜单管理', 'fa-bars', 'auth/menu', NULL, NULL, '2021-03-14 20:13:23');
INSERT INTO `exam_admin_menu` VALUES (7, 2, 24, '操作日志', 'fa-history', 'auth/logs', NULL, NULL, '2021-03-14 20:13:23');
INSERT INTO `exam_admin_menu` VALUES (8, 0, 10, '试题管理', 'fa-bars', NULL, NULL, '2021-03-07 06:43:52', '2021-03-14 00:23:55');
INSERT INTO `exam_admin_menu` VALUES (9, 8, 11, '试题类型', 'fa-bars', 'exam/category', NULL, '2021-03-07 06:44:02', '2021-03-14 00:23:55');
INSERT INTO `exam_admin_menu` VALUES (10, 8, 13, '试卷标签', 'fa-bars', 'exam/tag', NULL, '2021-03-07 07:33:13', '2021-03-17 21:39:44');
INSERT INTO `exam_admin_menu` VALUES (11, 0, 2, '系统配置', 'fa-bars', NULL, NULL, '2021-03-07 07:51:00', '2021-03-07 07:51:36');
INSERT INTO `exam_admin_menu` VALUES (12, 11, 5, '轮播图管理', 'fa-bars', 'platform/banner', NULL, '2021-03-07 07:51:15', '2021-03-14 00:23:54');
INSERT INTO `exam_admin_menu` VALUES (13, 8, 15, '搜索历史', 'fa-bars', 'exam/search/history', NULL, '2021-03-07 08:23:11', '2021-03-14 20:13:22');
INSERT INTO `exam_admin_menu` VALUES (14, 0, 16, '用户管理', 'fa-bars', NULL, NULL, '2021-03-07 08:54:20', '2021-03-14 20:13:22');
INSERT INTO `exam_admin_menu` VALUES (15, 14, 17, '微信用户', 'fa-bars', 'wechat/user', NULL, '2021-03-07 08:54:29', '2021-03-14 20:13:22');
INSERT INTO `exam_admin_menu` VALUES (16, 11, 6, '系统消息', 'fa-bars', NULL, NULL, '2021-03-07 09:40:27', '2021-03-14 00:23:54');
INSERT INTO `exam_admin_menu` VALUES (17, 16, 7, '消息分类', 'fa-bars', 'platform/message/category', NULL, '2021-03-07 09:40:41', '2021-03-14 00:23:54');
INSERT INTO `exam_admin_menu` VALUES (18, 16, 8, '消息内容', 'fa-bars', 'platform/message/content', NULL, '2021-03-07 09:40:54', '2021-03-14 00:23:54');
INSERT INTO `exam_admin_menu` VALUES (19, 11, 4, '积分配置', 'fa-bars', 'platform/score/setting', NULL, '2021-03-13 14:18:40', '2021-03-14 00:23:54');
INSERT INTO `exam_admin_menu` VALUES (20, 14, 18, '积分历史', 'fa-bars', 'wechat/user/score', NULL, '2021-03-13 15:06:18', '2021-03-14 20:13:22');
INSERT INTO `exam_admin_menu` VALUES (21, 11, 9, '参数配置', 'fa-bars', 'platform/const/setting', NULL, '2021-03-13 22:30:05', '2021-03-14 00:23:54');
INSERT INTO `exam_admin_menu` VALUES (22, 11, 3, '平台文章', 'fa-bars', 'platform/content', NULL, '2021-03-13 22:41:41', '2021-03-14 00:23:54');
INSERT INTO `exam_admin_menu` VALUES (23, 8, 12, '试题选项', 'fa-bars', 'exam', NULL, '2021-03-14 15:01:54', '2021-03-17 21:39:44');
INSERT INTO `exam_admin_menu` VALUES (24, 8, 14, '试卷管理', 'fa-bars', 'exam/collection', NULL, '2021-03-14 20:10:27', '2021-03-14 20:13:22');
COMMIT;

-- ----------------------------
-- Table structure for exam_admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `exam_admin_operation_log`;
CREATE TABLE `exam_admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of exam_admin_operation_log
-- ----------------------------
BEGIN;
INSERT INTO `exam_admin_operation_log` VALUES (1, 1, 'admin', 'GET', '172.18.0.1', '[]', '2021-03-05 02:54:59', '2021-03-05 02:54:59');
INSERT INTO `exam_admin_operation_log` VALUES (2, 1, 'admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-05 02:55:13', '2021-03-05 02:55:13');
INSERT INTO `exam_admin_operation_log` VALUES (3, 1, 'admin/auth/menu/2/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-05 02:55:17', '2021-03-05 02:55:17');
INSERT INTO `exam_admin_operation_log` VALUES (4, 1, 'admin/auth/menu/2', 'PUT', '172.18.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u540e\\u53f0\\u7ba1\\u7406\",\"icon\":\"fa-tasks\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"bRmY7IqsgqLRQmEPFsIMjglAK6QjOosQQenhC5xb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/admin\\/auth\\/menu\"}', '2021-03-05 02:55:29', '2021-03-05 02:55:29');
INSERT INTO `exam_admin_operation_log` VALUES (5, 1, 'admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-05 02:55:30', '2021-03-05 02:55:30');
INSERT INTO `exam_admin_operation_log` VALUES (6, 1, 'admin/auth/menu/3/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-05 02:55:34', '2021-03-05 02:55:34');
INSERT INTO `exam_admin_operation_log` VALUES (7, 1, 'admin/auth/menu/3', 'PUT', '172.18.0.1', '{\"parent_id\":\"2\",\"title\":\"\\u4eba\\u5458\\u7ba1\\u7406\",\"icon\":\"fa-users\",\"uri\":\"auth\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"bRmY7IqsgqLRQmEPFsIMjglAK6QjOosQQenhC5xb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/admin\\/auth\\/menu\"}', '2021-03-05 02:55:40', '2021-03-05 02:55:40');
INSERT INTO `exam_admin_operation_log` VALUES (8, 1, 'admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-05 02:55:41', '2021-03-05 02:55:41');
INSERT INTO `exam_admin_operation_log` VALUES (9, 1, 'admin/auth/menu/4/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-05 02:55:44', '2021-03-05 02:55:44');
INSERT INTO `exam_admin_operation_log` VALUES (10, 1, 'admin/auth/menu/4', 'PUT', '172.18.0.1', '{\"parent_id\":\"2\",\"title\":\"\\u89d2\\u8272\\u7ba1\\u7406\",\"icon\":\"fa-user\",\"uri\":\"auth\\/roles\",\"roles\":[null],\"permission\":null,\"_token\":\"bRmY7IqsgqLRQmEPFsIMjglAK6QjOosQQenhC5xb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/admin\\/auth\\/menu\"}', '2021-03-05 02:55:48', '2021-03-05 02:55:48');
INSERT INTO `exam_admin_operation_log` VALUES (11, 1, 'admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-05 02:55:49', '2021-03-05 02:55:49');
INSERT INTO `exam_admin_operation_log` VALUES (12, 1, 'admin/auth/menu/6/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-05 02:55:55', '2021-03-05 02:55:55');
INSERT INTO `exam_admin_operation_log` VALUES (13, 1, 'admin/auth/menu/6', 'PUT', '172.18.0.1', '{\"parent_id\":\"2\",\"title\":\"\\u83dc\\u5355\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"auth\\/menu\",\"roles\":[null],\"permission\":null,\"_token\":\"bRmY7IqsgqLRQmEPFsIMjglAK6QjOosQQenhC5xb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/admin\\/auth\\/menu\"}', '2021-03-05 02:56:04', '2021-03-05 02:56:04');
INSERT INTO `exam_admin_operation_log` VALUES (14, 1, 'admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-05 02:56:05', '2021-03-05 02:56:05');
INSERT INTO `exam_admin_operation_log` VALUES (15, 1, 'admin/auth/menu/7/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-05 02:56:07', '2021-03-05 02:56:07');
INSERT INTO `exam_admin_operation_log` VALUES (16, 1, 'admin/auth/menu/7', 'PUT', '172.18.0.1', '{\"parent_id\":\"2\",\"title\":\"\\u64cd\\u4f5c\\u65e5\\u5fd7\",\"icon\":\"fa-history\",\"uri\":\"auth\\/logs\",\"roles\":[null],\"permission\":null,\"_token\":\"bRmY7IqsgqLRQmEPFsIMjglAK6QjOosQQenhC5xb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/admin\\/auth\\/menu\"}', '2021-03-05 02:56:12', '2021-03-05 02:56:12');
INSERT INTO `exam_admin_operation_log` VALUES (17, 1, 'admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-05 02:56:12', '2021-03-05 02:56:12');
INSERT INTO `exam_admin_operation_log` VALUES (18, 1, 'admin/auth/menu/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-05 02:56:17', '2021-03-05 02:56:17');
INSERT INTO `exam_admin_operation_log` VALUES (19, 1, 'admin/auth/menu/1', 'PUT', '172.18.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u7cfb\\u7edf\\u603b\\u89c8\",\"icon\":\"fa-bar-chart\",\"uri\":\"\\/\",\"roles\":[null],\"permission\":null,\"_token\":\"bRmY7IqsgqLRQmEPFsIMjglAK6QjOosQQenhC5xb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/admin\\/auth\\/menu\"}', '2021-03-05 02:56:22', '2021-03-05 02:56:22');
INSERT INTO `exam_admin_operation_log` VALUES (20, 1, 'admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-05 02:56:22', '2021-03-05 02:56:22');
INSERT INTO `exam_admin_operation_log` VALUES (21, 1, 'admin/auth/menu/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-05 02:56:25', '2021-03-05 02:56:25');
INSERT INTO `exam_admin_operation_log` VALUES (22, 1, 'admin/auth/menu/1', 'PUT', '172.18.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u7cfb\\u7edf\\u603b\\u89c8\",\"icon\":\"fa-bar-chart\",\"uri\":\"\\/\",\"roles\":[null],\"permission\":null,\"_token\":\"bRmY7IqsgqLRQmEPFsIMjglAK6QjOosQQenhC5xb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/admin\\/auth\\/menu\"}', '2021-03-05 02:56:29', '2021-03-05 02:56:29');
INSERT INTO `exam_admin_operation_log` VALUES (23, 1, 'admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-05 02:56:29', '2021-03-05 02:56:29');
INSERT INTO `exam_admin_operation_log` VALUES (24, 1, 'admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-05 02:56:31', '2021-03-05 02:56:31');
INSERT INTO `exam_admin_operation_log` VALUES (25, 1, 'admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-05 02:57:27', '2021-03-05 02:57:27');
INSERT INTO `exam_admin_operation_log` VALUES (26, 1, 'admin', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-05 02:57:31', '2021-03-05 02:57:31');
INSERT INTO `exam_admin_operation_log` VALUES (27, 1, 'admin/auth/users', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-05 02:57:33', '2021-03-05 02:57:33');
INSERT INTO `exam_admin_operation_log` VALUES (28, 1, 'admin/auth/roles', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-05 02:57:34', '2021-03-05 02:57:34');
INSERT INTO `exam_admin_operation_log` VALUES (29, 1, 'admin/auth/permissions', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-05 02:57:35', '2021-03-05 02:57:35');
INSERT INTO `exam_admin_operation_log` VALUES (30, 1, 'admin/auth/permissions', 'GET', '172.18.0.1', '[]', '2021-03-05 02:57:36', '2021-03-05 02:57:36');
INSERT INTO `exam_admin_operation_log` VALUES (31, 1, 'admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-05 02:57:38', '2021-03-05 02:57:38');
INSERT INTO `exam_admin_operation_log` VALUES (32, 1, 'admin/auth/menu/5/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-05 02:57:41', '2021-03-05 02:57:41');
INSERT INTO `exam_admin_operation_log` VALUES (33, 1, 'admin/auth/menu/5', 'PUT', '172.18.0.1', '{\"parent_id\":\"2\",\"title\":\"\\u6743\\u9650\\u7ba1\\u7406\",\"icon\":\"fa-ban\",\"uri\":\"auth\\/permissions\",\"roles\":[null],\"permission\":null,\"_token\":\"bRmY7IqsgqLRQmEPFsIMjglAK6QjOosQQenhC5xb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/admin\\/auth\\/menu\"}', '2021-03-05 02:57:49', '2021-03-05 02:57:49');
INSERT INTO `exam_admin_operation_log` VALUES (34, 1, 'admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-05 02:57:50', '2021-03-05 02:57:50');
INSERT INTO `exam_admin_operation_log` VALUES (35, 1, 'admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-05 02:57:51', '2021-03-05 02:57:51');
INSERT INTO `exam_admin_operation_log` VALUES (36, 1, 'admin/auth/users', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-05 02:57:54', '2021-03-05 02:57:54');
INSERT INTO `exam_admin_operation_log` VALUES (37, 1, 'admin', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-05 02:57:56', '2021-03-05 02:57:56');
INSERT INTO `exam_admin_operation_log` VALUES (38, 1, 'admin', 'GET', '172.18.0.1', '[]', '2021-03-06 11:15:53', '2021-03-06 11:15:53');
INSERT INTO `exam_admin_operation_log` VALUES (39, 1, 'admin/auth/users', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-06 11:15:59', '2021-03-06 11:15:59');
INSERT INTO `exam_admin_operation_log` VALUES (40, 1, 'admin/auth/users', 'GET', '172.18.0.1', '[]', '2021-03-06 11:16:08', '2021-03-06 11:16:08');
INSERT INTO `exam_admin_operation_log` VALUES (41, 1, 'admin/auth/setting', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-06 11:16:11', '2021-03-06 11:16:11');
INSERT INTO `exam_admin_operation_log` VALUES (42, 1, 'admin/auth/setting', 'GET', '172.18.0.1', '[]', '2021-03-06 11:33:34', '2021-03-06 11:33:34');
INSERT INTO `exam_admin_operation_log` VALUES (43, 1, 'admin/auth/setting', 'GET', '172.18.0.1', '[]', '2021-03-06 11:33:42', '2021-03-06 11:33:42');
INSERT INTO `exam_admin_operation_log` VALUES (44, 1, 'admin/auth/setting', 'PUT', '172.18.0.1', '{\"name\":\"Administrator\",\"password\":\"$2y$10$vn2Xqa\\/\\/NqOmsptQ1a9\\/beVRNa5WrrcZVmqW1JSOAGIv8LxqqbKOq\",\"password_confirmation\":\"$2y$10$vn2Xqa\\/\\/NqOmsptQ1a9\\/beVRNa5WrrcZVmqW1JSOAGIv8LxqqbKOq\",\"_token\":\"7kS6pnzwqvwqKmKV7Uf6rm0BEZzRxbluOX3t7K9J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/admin\\/auth\\/login\"}', '2021-03-06 11:33:50', '2021-03-06 11:33:50');
INSERT INTO `exam_admin_operation_log` VALUES (45, 1, 'admin/auth/setting', 'GET', '172.18.0.1', '[]', '2021-03-06 11:33:51', '2021-03-06 11:33:51');
INSERT INTO `exam_admin_operation_log` VALUES (46, 1, 'admin', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-06 11:34:04', '2021-03-06 11:34:04');
INSERT INTO `exam_admin_operation_log` VALUES (47, 1, 'admin', 'GET', '172.18.0.1', '[]', '2021-03-06 11:34:06', '2021-03-06 11:34:06');
INSERT INTO `exam_admin_operation_log` VALUES (48, 1, 'admin', 'GET', '172.18.0.1', '[]', '2021-03-06 11:39:38', '2021-03-06 11:39:38');
INSERT INTO `exam_admin_operation_log` VALUES (49, 1, 'admin/auth/setting', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-06 11:39:44', '2021-03-06 11:39:44');
INSERT INTO `exam_admin_operation_log` VALUES (50, 1, 'admin/auth/setting', 'PUT', '172.18.0.1', '{\"name\":\"Administrator\",\"password\":\"$2y$10$vn2Xqa\\/\\/NqOmsptQ1a9\\/beVRNa5WrrcZVmqW1JSOAGIv8LxqqbKOq\",\"password_confirmation\":\"$2y$10$vn2Xqa\\/\\/NqOmsptQ1a9\\/beVRNa5WrrcZVmqW1JSOAGIv8LxqqbKOq\",\"_token\":\"7kS6pnzwqvwqKmKV7Uf6rm0BEZzRxbluOX3t7K9J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/admin\"}', '2021-03-06 11:39:51', '2021-03-06 11:39:51');
INSERT INTO `exam_admin_operation_log` VALUES (51, 1, 'admin/auth/setting', 'GET', '172.18.0.1', '[]', '2021-03-06 11:39:52', '2021-03-06 11:39:52');
INSERT INTO `exam_admin_operation_log` VALUES (52, 1, 'admin/auth/setting', 'GET', '172.18.0.1', '[]', '2021-03-06 11:39:55', '2021-03-06 11:39:55');
INSERT INTO `exam_admin_operation_log` VALUES (53, 1, 'admin/auth/setting', 'GET', '172.18.0.1', '[]', '2021-03-06 11:40:22', '2021-03-06 11:40:22');
INSERT INTO `exam_admin_operation_log` VALUES (54, 1, 'admin/auth/setting', 'PUT', '172.18.0.1', '{\"name\":\"Administrator\",\"password\":\"$2y$10$vn2Xqa\\/\\/NqOmsptQ1a9\\/beVRNa5WrrcZVmqW1JSOAGIv8LxqqbKOq\",\"password_confirmation\":\"$2y$10$vn2Xqa\\/\\/NqOmsptQ1a9\\/beVRNa5WrrcZVmqW1JSOAGIv8LxqqbKOq\",\"_token\":\"7kS6pnzwqvwqKmKV7Uf6rm0BEZzRxbluOX3t7K9J\",\"_method\":\"PUT\"}', '2021-03-06 11:40:36', '2021-03-06 11:40:36');
INSERT INTO `exam_admin_operation_log` VALUES (55, 1, 'admin/auth/setting', 'GET', '172.18.0.1', '[]', '2021-03-06 11:40:36', '2021-03-06 11:40:36');
INSERT INTO `exam_admin_operation_log` VALUES (56, 1, 'admin/auth/setting', 'GET', '172.18.0.1', '[]', '2021-03-06 11:40:42', '2021-03-06 11:40:42');
INSERT INTO `exam_admin_operation_log` VALUES (57, 1, 'admin', 'GET', '172.18.0.1', '[]', '2021-03-06 11:42:14', '2021-03-06 11:42:14');
INSERT INTO `exam_admin_operation_log` VALUES (58, 1, 'admin', 'GET', '172.18.0.1', '[]', '2021-03-06 13:13:46', '2021-03-06 13:13:46');
INSERT INTO `exam_admin_operation_log` VALUES (59, 1, 'admin', 'GET', '172.18.0.1', '[]', '2021-03-06 13:14:15', '2021-03-06 13:14:15');
INSERT INTO `exam_admin_operation_log` VALUES (60, 1, 'admin', 'GET', '172.18.0.1', '[]', '2021-03-06 13:14:40', '2021-03-06 13:14:40');
INSERT INTO `exam_admin_operation_log` VALUES (61, 1, 'admin', 'GET', '172.18.0.1', '[]', '2021-03-06 13:14:45', '2021-03-06 13:14:45');
INSERT INTO `exam_admin_operation_log` VALUES (62, 1, 'admin', 'GET', '172.18.0.1', '[]', '2021-03-06 13:15:01', '2021-03-06 13:15:01');
INSERT INTO `exam_admin_operation_log` VALUES (63, 1, 'admin', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-06 13:15:05', '2021-03-06 13:15:05');
INSERT INTO `exam_admin_operation_log` VALUES (64, 1, 'admin', 'GET', '172.18.0.1', '[]', '2021-03-06 13:15:41', '2021-03-06 13:15:41');
INSERT INTO `exam_admin_operation_log` VALUES (65, 1, 'admin', 'GET', '172.18.0.1', '[]', '2021-03-06 13:15:45', '2021-03-06 13:15:45');
INSERT INTO `exam_admin_operation_log` VALUES (66, 1, 'admin', 'GET', '172.18.0.1', '[]', '2021-03-06 13:15:58', '2021-03-06 13:15:58');
INSERT INTO `exam_admin_operation_log` VALUES (67, 1, 'admin', 'GET', '172.18.0.1', '[]', '2021-03-06 13:16:07', '2021-03-06 13:16:07');
INSERT INTO `exam_admin_operation_log` VALUES (68, 1, 'admin/auth/users', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-06 13:16:24', '2021-03-06 13:16:24');
INSERT INTO `exam_admin_operation_log` VALUES (69, 1, 'admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-06 13:16:25', '2021-03-06 13:16:25');
INSERT INTO `exam_admin_operation_log` VALUES (70, 1, 'admin', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-06 13:16:28', '2021-03-06 13:16:28');
INSERT INTO `exam_admin_operation_log` VALUES (71, 1, 'admin', 'GET', '172.18.0.1', '[]', '2021-03-06 14:58:00', '2021-03-06 14:58:00');
INSERT INTO `exam_admin_operation_log` VALUES (72, 1, 'exam/admin', 'GET', '172.18.0.1', '[]', '2021-03-06 15:01:25', '2021-03-06 15:01:25');
INSERT INTO `exam_admin_operation_log` VALUES (73, 1, 'exam/admin', 'GET', '172.18.0.1', '[]', '2021-03-06 15:01:28', '2021-03-06 15:01:28');
INSERT INTO `exam_admin_operation_log` VALUES (74, 1, 'exam/admin/auth/users', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-06 15:01:31', '2021-03-06 15:01:31');
INSERT INTO `exam_admin_operation_log` VALUES (75, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-06 15:01:32', '2021-03-06 15:01:32');
INSERT INTO `exam_admin_operation_log` VALUES (76, 1, 'exam/admin/auth/logs', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-06 15:01:33', '2021-03-06 15:01:33');
INSERT INTO `exam_admin_operation_log` VALUES (77, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-06 15:01:33', '2021-03-06 15:01:33');
INSERT INTO `exam_admin_operation_log` VALUES (78, 1, 'exam/admin/auth/permissions', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-06 15:01:34', '2021-03-06 15:01:34');
INSERT INTO `exam_admin_operation_log` VALUES (79, 1, 'exam/admin/auth/permissions', 'GET', '172.18.0.1', '[]', '2021-03-06 15:02:44', '2021-03-06 15:02:44');
INSERT INTO `exam_admin_operation_log` VALUES (80, 1, 'exam/admin/auth/users', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-06 15:02:46', '2021-03-06 15:02:46');
INSERT INTO `exam_admin_operation_log` VALUES (81, 1, 'exam/admin/auth/roles', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-06 15:02:47', '2021-03-06 15:02:47');
INSERT INTO `exam_admin_operation_log` VALUES (82, 1, 'exam/admin/auth/users', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-06 15:02:49', '2021-03-06 15:02:49');
INSERT INTO `exam_admin_operation_log` VALUES (83, 1, 'exam/admin/auth/roles', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-06 15:02:52', '2021-03-06 15:02:52');
INSERT INTO `exam_admin_operation_log` VALUES (84, 1, 'exam/admin/auth/roles/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-06 15:02:55', '2021-03-06 15:02:55');
INSERT INTO `exam_admin_operation_log` VALUES (85, 1, 'exam/admin/auth/roles/1', 'PUT', '172.18.0.1', '{\"slug\":\"administrator\",\"name\":\"\\u7cfb\\u7edf\\u7ba1\\u7406\\u5458\",\"permissions\":[\"1\",\"2\",\"3\",\"4\",\"5\",null],\"_token\":\"7kS6pnzwqvwqKmKV7Uf6rm0BEZzRxbluOX3t7K9J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/exam\\/admin\\/auth\\/roles\"}', '2021-03-06 15:03:05', '2021-03-06 15:03:05');
INSERT INTO `exam_admin_operation_log` VALUES (86, 1, 'exam/admin/auth/roles', 'GET', '172.18.0.1', '[]', '2021-03-06 15:03:05', '2021-03-06 15:03:05');
INSERT INTO `exam_admin_operation_log` VALUES (87, 1, 'exam/admin/auth/roles', 'GET', '172.18.0.1', '[]', '2021-03-06 15:03:08', '2021-03-06 15:03:08');
INSERT INTO `exam_admin_operation_log` VALUES (88, 1, 'exam/admin/auth/roles/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-06 15:03:10', '2021-03-06 15:03:10');
INSERT INTO `exam_admin_operation_log` VALUES (89, 1, 'exam/admin/auth/roles/1', 'PUT', '172.18.0.1', '{\"slug\":\"administrator\",\"name\":\"\\u7cfb\\u7edf\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\",\"permissions\":[\"1\",\"2\",\"3\",\"4\",\"5\",null],\"_token\":\"7kS6pnzwqvwqKmKV7Uf6rm0BEZzRxbluOX3t7K9J\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/exam\\/admin\\/auth\\/roles\"}', '2021-03-06 15:03:17', '2021-03-06 15:03:17');
INSERT INTO `exam_admin_operation_log` VALUES (90, 1, 'exam/admin/auth/roles', 'GET', '172.18.0.1', '[]', '2021-03-06 15:03:17', '2021-03-06 15:03:17');
INSERT INTO `exam_admin_operation_log` VALUES (91, 1, 'exam/admin/auth/permissions', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-06 15:03:21', '2021-03-06 15:03:21');
INSERT INTO `exam_admin_operation_log` VALUES (92, 1, 'exam/admin/auth/roles', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-06 15:03:27', '2021-03-06 15:03:27');
INSERT INTO `exam_admin_operation_log` VALUES (93, 1, 'exam/admin/auth/users', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-06 15:03:29', '2021-03-06 15:03:29');
INSERT INTO `exam_admin_operation_log` VALUES (94, 1, 'exam/admin', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-06 15:03:33', '2021-03-06 15:03:33');
INSERT INTO `exam_admin_operation_log` VALUES (95, 1, 'exam/admin', 'GET', '172.18.0.1', '[]', '2021-03-06 15:03:36', '2021-03-06 15:03:36');
INSERT INTO `exam_admin_operation_log` VALUES (96, 1, 'exam/admin/auth/roles', 'GET', '172.18.0.1', '[]', '2021-03-07 05:59:51', '2021-03-07 05:59:51');
INSERT INTO `exam_admin_operation_log` VALUES (97, 1, 'exam/admin/auth/roles', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 05:59:56', '2021-03-07 05:59:56');
INSERT INTO `exam_admin_operation_log` VALUES (98, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 05:59:58', '2021-03-07 05:59:58');
INSERT INTO `exam_admin_operation_log` VALUES (99, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 06:00:04', '2021-03-07 06:00:04');
INSERT INTO `exam_admin_operation_log` VALUES (100, 1, 'exam/admin', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 06:00:06', '2021-03-07 06:00:06');
INSERT INTO `exam_admin_operation_log` VALUES (101, 1, 'exam/admin', 'GET', '172.18.0.1', '[]', '2021-03-07 06:00:32', '2021-03-07 06:00:32');
INSERT INTO `exam_admin_operation_log` VALUES (102, 1, 'exam/admin', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 06:00:34', '2021-03-07 06:00:34');
INSERT INTO `exam_admin_operation_log` VALUES (103, 1, 'exam/admin/auth/users', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 06:00:35', '2021-03-07 06:00:35');
INSERT INTO `exam_admin_operation_log` VALUES (104, 1, 'exam/admin', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 06:00:37', '2021-03-07 06:00:37');
INSERT INTO `exam_admin_operation_log` VALUES (105, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 06:43:42', '2021-03-07 06:43:42');
INSERT INTO `exam_admin_operation_log` VALUES (106, 1, 'exam/admin/auth/menu', 'POST', '172.18.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u8bd5\\u9898\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\"}', '2021-03-07 06:43:52', '2021-03-07 06:43:52');
INSERT INTO `exam_admin_operation_log` VALUES (107, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-07 06:43:52', '2021-03-07 06:43:52');
INSERT INTO `exam_admin_operation_log` VALUES (108, 1, 'exam/admin/auth/menu', 'POST', '172.18.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u8bd5\\u9898\\u7c7b\\u578b\",\"icon\":\"fa-bars\",\"uri\":\"exam\\/category\",\"roles\":[null],\"permission\":null,\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\"}', '2021-03-07 06:44:01', '2021-03-07 06:44:01');
INSERT INTO `exam_admin_operation_log` VALUES (109, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-07 06:44:02', '2021-03-07 06:44:02');
INSERT INTO `exam_admin_operation_log` VALUES (110, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-07 06:44:05', '2021-03-07 06:44:05');
INSERT INTO `exam_admin_operation_log` VALUES (111, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 06:44:07', '2021-03-07 06:44:07');
INSERT INTO `exam_admin_operation_log` VALUES (112, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-07 06:44:08', '2021-03-07 06:44:08');
INSERT INTO `exam_admin_operation_log` VALUES (113, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-07 06:44:34', '2021-03-07 06:44:34');
INSERT INTO `exam_admin_operation_log` VALUES (114, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-07 06:45:13', '2021-03-07 06:45:13');
INSERT INTO `exam_admin_operation_log` VALUES (115, 1, 'exam/admin/auth/menu', 'POST', '172.18.0.1', '{\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8,\\\"children\\\":[{\\\"id\\\":9}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2021-03-07 06:45:19', '2021-03-07 06:45:19');
INSERT INTO `exam_admin_operation_log` VALUES (116, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 06:45:20', '2021-03-07 06:45:20');
INSERT INTO `exam_admin_operation_log` VALUES (117, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-07 06:45:21', '2021-03-07 06:45:21');
INSERT INTO `exam_admin_operation_log` VALUES (118, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 06:45:23', '2021-03-07 06:45:23');
INSERT INTO `exam_admin_operation_log` VALUES (119, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-07 06:45:24', '2021-03-07 06:45:24');
INSERT INTO `exam_admin_operation_log` VALUES (120, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-07 06:46:10', '2021-03-07 06:46:10');
INSERT INTO `exam_admin_operation_log` VALUES (121, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 06:46:12', '2021-03-07 06:46:12');
INSERT INTO `exam_admin_operation_log` VALUES (122, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-07 06:46:12', '2021-03-07 06:46:12');
INSERT INTO `exam_admin_operation_log` VALUES (123, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-07 06:47:27', '2021-03-07 06:47:27');
INSERT INTO `exam_admin_operation_log` VALUES (124, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 06:47:30', '2021-03-07 06:47:30');
INSERT INTO `exam_admin_operation_log` VALUES (125, 1, 'exam/admin/exam/category/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 06:47:32', '2021-03-07 06:47:32');
INSERT INTO `exam_admin_operation_log` VALUES (126, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-07 06:47:32', '2021-03-07 06:47:32');
INSERT INTO `exam_admin_operation_log` VALUES (127, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-07 06:47:53', '2021-03-07 06:47:53');
INSERT INTO `exam_admin_operation_log` VALUES (128, 1, 'exam/admin/exam/category/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 06:47:54', '2021-03-07 06:47:54');
INSERT INTO `exam_admin_operation_log` VALUES (129, 1, 'exam/admin/exam/category', 'POST', '172.18.0.1', '{\"parent_id\":\"0\",\"title\":\"12\",\"remark\":\"12\",\"is_show\":\"on\",\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-07 06:48:09', '2021-03-07 06:48:09');
INSERT INTO `exam_admin_operation_log` VALUES (130, 1, 'exam/admin/exam/category/create', 'GET', '172.18.0.1', '[]', '2021-03-07 06:48:10', '2021-03-07 06:48:10');
INSERT INTO `exam_admin_operation_log` VALUES (131, 1, 'exam/admin/exam/category/create', 'GET', '172.18.0.1', '[]', '2021-03-07 06:50:41', '2021-03-07 06:50:41');
INSERT INTO `exam_admin_operation_log` VALUES (132, 1, 'exam/admin/exam/category', 'POST', '172.18.0.1', '{\"uuid\":null,\"parent_id\":\"0\",\"title\":\"\\u67e5\\u8def\\u7ebf\",\"remark\":null,\"is_show\":\"on\",\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-07 06:50:49', '2021-03-07 06:50:49');
INSERT INTO `exam_admin_operation_log` VALUES (133, 1, 'exam/admin/exam/category/create', 'GET', '172.18.0.1', '[]', '2021-03-07 06:50:50', '2021-03-07 06:50:50');
INSERT INTO `exam_admin_operation_log` VALUES (134, 1, 'exam/admin/exam/category/create', 'GET', '172.18.0.1', '[]', '2021-03-07 06:51:49', '2021-03-07 06:51:49');
INSERT INTO `exam_admin_operation_log` VALUES (135, 1, 'exam/admin/exam/category/create', 'GET', '172.18.0.1', '[]', '2021-03-07 06:52:12', '2021-03-07 06:52:12');
INSERT INTO `exam_admin_operation_log` VALUES (136, 1, 'exam/admin/exam/category/create', 'GET', '172.18.0.1', '[]', '2021-03-07 06:52:21', '2021-03-07 06:52:21');
INSERT INTO `exam_admin_operation_log` VALUES (137, 1, 'exam/admin/exam/category', 'POST', '172.18.0.1', '{\"uuid\":\"71fda9120b7112437696c1b8d017a17f\",\"parent_id\":\"0\",\"title\":\"123\",\"remark\":\"123\",\"is_show\":\"off\",\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\"}', '2021-03-07 06:52:31', '2021-03-07 06:52:31');
INSERT INTO `exam_admin_operation_log` VALUES (138, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-07 06:52:32', '2021-03-07 06:52:32');
INSERT INTO `exam_admin_operation_log` VALUES (139, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 06:52:40', '2021-03-07 06:52:40');
INSERT INTO `exam_admin_operation_log` VALUES (140, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-07 07:02:27', '2021-03-07 07:02:27');
INSERT INTO `exam_admin_operation_log` VALUES (141, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-07 07:04:07', '2021-03-07 07:04:07');
INSERT INTO `exam_admin_operation_log` VALUES (142, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-07 07:05:08', '2021-03-07 07:05:08');
INSERT INTO `exam_admin_operation_log` VALUES (143, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-07 07:05:11', '2021-03-07 07:05:11');
INSERT INTO `exam_admin_operation_log` VALUES (144, 1, 'exam/admin/exam/category/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 07:05:16', '2021-03-07 07:05:16');
INSERT INTO `exam_admin_operation_log` VALUES (145, 1, 'exam/admin/exam/category/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-07 07:06:19', '2021-03-07 07:06:19');
INSERT INTO `exam_admin_operation_log` VALUES (146, 1, 'exam/admin/exam/category/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-07 07:06:33', '2021-03-07 07:06:33');
INSERT INTO `exam_admin_operation_log` VALUES (147, 1, 'exam/admin/exam/category/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-07 07:07:10', '2021-03-07 07:07:10');
INSERT INTO `exam_admin_operation_log` VALUES (148, 1, 'exam/admin/exam/category/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-07 07:07:27', '2021-03-07 07:07:27');
INSERT INTO `exam_admin_operation_log` VALUES (149, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 07:07:36', '2021-03-07 07:07:36');
INSERT INTO `exam_admin_operation_log` VALUES (150, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-07 07:07:56', '2021-03-07 07:07:56');
INSERT INTO `exam_admin_operation_log` VALUES (151, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-07 07:10:18', '2021-03-07 07:10:18');
INSERT INTO `exam_admin_operation_log` VALUES (152, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-07 07:10:21', '2021-03-07 07:10:21');
INSERT INTO `exam_admin_operation_log` VALUES (153, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-07 07:12:49', '2021-03-07 07:12:49');
INSERT INTO `exam_admin_operation_log` VALUES (154, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-07 07:13:45', '2021-03-07 07:13:45');
INSERT INTO `exam_admin_operation_log` VALUES (155, 1, 'exam/admin/exam/category/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 07:13:48', '2021-03-07 07:13:48');
INSERT INTO `exam_admin_operation_log` VALUES (156, 1, 'exam/admin/exam/category/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-07 07:13:51', '2021-03-07 07:13:51');
INSERT INTO `exam_admin_operation_log` VALUES (157, 1, 'exam/admin/exam/category/1', 'PUT', '172.18.0.1', '{\"uuid\":\"71fda9120b7112437696c1b8d017a17f\",\"parent_id\":\"0\",\"title\":\"123\",\"remark\":\"123\",\"is_show\":\"on\",\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-07 07:13:55', '2021-03-07 07:13:55');
INSERT INTO `exam_admin_operation_log` VALUES (158, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-07 07:13:55', '2021-03-07 07:13:55');
INSERT INTO `exam_admin_operation_log` VALUES (159, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-07 07:14:04', '2021-03-07 07:14:04');
INSERT INTO `exam_admin_operation_log` VALUES (160, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-07 07:14:15', '2021-03-07 07:14:15');
INSERT INTO `exam_admin_operation_log` VALUES (161, 1, 'exam/admin/exam/category/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 07:14:21', '2021-03-07 07:14:21');
INSERT INTO `exam_admin_operation_log` VALUES (162, 1, 'exam/admin/exam/category/create', 'GET', '172.18.0.1', '[]', '2021-03-07 07:14:27', '2021-03-07 07:14:27');
INSERT INTO `exam_admin_operation_log` VALUES (163, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 07:14:32', '2021-03-07 07:14:32');
INSERT INTO `exam_admin_operation_log` VALUES (164, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 07:14:49', '2021-03-07 07:14:49');
INSERT INTO `exam_admin_operation_log` VALUES (165, 1, 'exam/admin/auth/users', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 07:15:13', '2021-03-07 07:15:13');
INSERT INTO `exam_admin_operation_log` VALUES (166, 1, 'exam/admin/auth/roles', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 07:15:18', '2021-03-07 07:15:18');
INSERT INTO `exam_admin_operation_log` VALUES (167, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 07:15:21', '2021-03-07 07:15:21');
INSERT INTO `exam_admin_operation_log` VALUES (168, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-07 07:15:36', '2021-03-07 07:15:36');
INSERT INTO `exam_admin_operation_log` VALUES (169, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-07 07:15:42', '2021-03-07 07:15:42');
INSERT INTO `exam_admin_operation_log` VALUES (170, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-07 07:15:48', '2021-03-07 07:15:48');
INSERT INTO `exam_admin_operation_log` VALUES (171, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-07 07:16:28', '2021-03-07 07:16:28');
INSERT INTO `exam_admin_operation_log` VALUES (172, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-07 07:16:56', '2021-03-07 07:16:56');
INSERT INTO `exam_admin_operation_log` VALUES (173, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-07 07:18:06', '2021-03-07 07:18:06');
INSERT INTO `exam_admin_operation_log` VALUES (174, 1, 'exam/admin/auth/roles', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 07:18:13', '2021-03-07 07:18:13');
INSERT INTO `exam_admin_operation_log` VALUES (175, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 07:18:15', '2021-03-07 07:18:15');
INSERT INTO `exam_admin_operation_log` VALUES (176, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-07 07:18:54', '2021-03-07 07:18:54');
INSERT INTO `exam_admin_operation_log` VALUES (177, 1, 'exam/admin/auth/users', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 07:32:48', '2021-03-07 07:32:48');
INSERT INTO `exam_admin_operation_log` VALUES (178, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 07:32:49', '2021-03-07 07:32:49');
INSERT INTO `exam_admin_operation_log` VALUES (179, 1, 'exam/admin/auth/menu', 'POST', '172.18.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u8bd5\\u9898\\u6807\\u7b7e\",\"icon\":\"fa-bars\",\"uri\":\"exam\\/tag\",\"roles\":[null],\"permission\":null,\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\"}', '2021-03-07 07:33:13', '2021-03-07 07:33:13');
INSERT INTO `exam_admin_operation_log` VALUES (180, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-07 07:33:13', '2021-03-07 07:33:13');
INSERT INTO `exam_admin_operation_log` VALUES (181, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-07 07:33:16', '2021-03-07 07:33:16');
INSERT INTO `exam_admin_operation_log` VALUES (182, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 07:33:19', '2021-03-07 07:33:19');
INSERT INTO `exam_admin_operation_log` VALUES (183, 1, 'exam/admin/exam/tag/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 07:33:21', '2021-03-07 07:33:21');
INSERT INTO `exam_admin_operation_log` VALUES (184, 1, 'exam/admin/exam/tag', 'POST', '172.18.0.1', '{\"uuid\":\"31707ff9a527199e008d988b83756fb3\",\"title\":\"\\u67e5\\u8def\\u7ebf\",\"remark\":\"12\",\"is_show\":\"on\",\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/exam\\/admin\\/exam\\/tag\"}', '2021-03-07 07:33:26', '2021-03-07 07:33:26');
INSERT INTO `exam_admin_operation_log` VALUES (185, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '[]', '2021-03-07 07:33:27', '2021-03-07 07:33:27');
INSERT INTO `exam_admin_operation_log` VALUES (186, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '[]', '2021-03-07 07:33:53', '2021-03-07 07:33:53');
INSERT INTO `exam_admin_operation_log` VALUES (187, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '[]', '2021-03-07 07:46:55', '2021-03-07 07:46:55');
INSERT INTO `exam_admin_operation_log` VALUES (188, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '[]', '2021-03-07 07:47:51', '2021-03-07 07:47:51');
INSERT INTO `exam_admin_operation_log` VALUES (189, 1, 'exam/admin', 'GET', '172.18.0.1', '[]', '2021-03-07 07:49:34', '2021-03-07 07:49:34');
INSERT INTO `exam_admin_operation_log` VALUES (190, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 07:49:45', '2021-03-07 07:49:45');
INSERT INTO `exam_admin_operation_log` VALUES (191, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-07 07:50:30', '2021-03-07 07:50:30');
INSERT INTO `exam_admin_operation_log` VALUES (192, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 07:50:33', '2021-03-07 07:50:33');
INSERT INTO `exam_admin_operation_log` VALUES (193, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 07:50:35', '2021-03-07 07:50:35');
INSERT INTO `exam_admin_operation_log` VALUES (194, 1, 'exam/admin/exam/tag/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 07:50:37', '2021-03-07 07:50:37');
INSERT INTO `exam_admin_operation_log` VALUES (195, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 07:50:50', '2021-03-07 07:50:50');
INSERT INTO `exam_admin_operation_log` VALUES (196, 1, 'exam/admin/auth/menu', 'POST', '172.18.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u7cfb\\u7edf\\u914d\\u7f6e\",\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\"}', '2021-03-07 07:51:00', '2021-03-07 07:51:00');
INSERT INTO `exam_admin_operation_log` VALUES (197, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-07 07:51:01', '2021-03-07 07:51:01');
INSERT INTO `exam_admin_operation_log` VALUES (198, 1, 'exam/admin/auth/menu', 'POST', '172.18.0.1', '{\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_order\":\"[{\\\"id\\\":11},{\\\"id\\\":1},{\\\"id\\\":8,\\\"children\\\":[{\\\"id\\\":10},{\\\"id\\\":9}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2021-03-07 07:51:04', '2021-03-07 07:51:04');
INSERT INTO `exam_admin_operation_log` VALUES (199, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 07:51:05', '2021-03-07 07:51:05');
INSERT INTO `exam_admin_operation_log` VALUES (200, 1, 'exam/admin/auth/menu', 'POST', '172.18.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u8f6e\\u64ad\\u56fe\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"platform\\/banner\",\"roles\":[null],\"permission\":null,\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\"}', '2021-03-07 07:51:15', '2021-03-07 07:51:15');
INSERT INTO `exam_admin_operation_log` VALUES (201, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-07 07:51:15', '2021-03-07 07:51:15');
INSERT INTO `exam_admin_operation_log` VALUES (202, 1, 'exam/admin/auth/menu/12/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 07:51:22', '2021-03-07 07:51:22');
INSERT INTO `exam_admin_operation_log` VALUES (203, 1, 'exam/admin/auth/menu/12', 'PUT', '172.18.0.1', '{\"parent_id\":\"11\",\"title\":\"\\u8f6e\\u64ad\\u56fe\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"platform\\/banner\",\"roles\":[null],\"permission\":null,\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/exam\\/admin\\/auth\\/menu\"}', '2021-03-07 07:51:27', '2021-03-07 07:51:27');
INSERT INTO `exam_admin_operation_log` VALUES (204, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-07 07:51:27', '2021-03-07 07:51:27');
INSERT INTO `exam_admin_operation_log` VALUES (205, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-07 07:51:30', '2021-03-07 07:51:30');
INSERT INTO `exam_admin_operation_log` VALUES (206, 1, 'exam/admin/auth/menu', 'POST', '172.18.0.1', '{\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":11,\\\"children\\\":[{\\\"id\\\":12}]},{\\\"id\\\":8,\\\"children\\\":[{\\\"id\\\":10},{\\\"id\\\":9}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2021-03-07 07:51:35', '2021-03-07 07:51:35');
INSERT INTO `exam_admin_operation_log` VALUES (207, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 07:51:36', '2021-03-07 07:51:36');
INSERT INTO `exam_admin_operation_log` VALUES (208, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-07 07:51:39', '2021-03-07 07:51:39');
INSERT INTO `exam_admin_operation_log` VALUES (209, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 07:51:44', '2021-03-07 07:51:44');
INSERT INTO `exam_admin_operation_log` VALUES (210, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-07 07:51:44', '2021-03-07 07:51:44');
INSERT INTO `exam_admin_operation_log` VALUES (211, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 07:52:17', '2021-03-07 07:52:17');
INSERT INTO `exam_admin_operation_log` VALUES (212, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 07:52:17', '2021-03-07 07:52:17');
INSERT INTO `exam_admin_operation_log` VALUES (213, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '[]', '2021-03-07 07:53:56', '2021-03-07 07:53:56');
INSERT INTO `exam_admin_operation_log` VALUES (214, 1, 'exam/admin/platform/banner/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 07:54:00', '2021-03-07 07:54:00');
INSERT INTO `exam_admin_operation_log` VALUES (215, 1, 'exam/admin/platform/banner/create', 'GET', '172.18.0.1', '[]', '2021-03-07 07:55:07', '2021-03-07 07:55:07');
INSERT INTO `exam_admin_operation_log` VALUES (216, 1, 'exam/admin/platform/banner/create', 'GET', '172.18.0.1', '[]', '2021-03-07 07:55:24', '2021-03-07 07:55:24');
INSERT INTO `exam_admin_operation_log` VALUES (217, 1, 'exam/admin/platform/banner/create', 'GET', '172.18.0.1', '[]', '2021-03-07 07:55:49', '2021-03-07 07:55:49');
INSERT INTO `exam_admin_operation_log` VALUES (218, 1, 'exam/admin/platform/banner/create', 'GET', '172.18.0.1', '[]', '2021-03-07 07:56:53', '2021-03-07 07:56:53');
INSERT INTO `exam_admin_operation_log` VALUES (219, 1, 'exam/admin/platform/banner/create', 'GET', '172.18.0.1', '[]', '2021-03-07 07:57:03', '2021-03-07 07:57:03');
INSERT INTO `exam_admin_operation_log` VALUES (220, 1, 'exam/admin/platform/banner/create', 'GET', '172.18.0.1', '[]', '2021-03-07 07:57:39', '2021-03-07 07:57:39');
INSERT INTO `exam_admin_operation_log` VALUES (221, 1, 'exam/admin/platform/banner/create', 'GET', '172.18.0.1', '[]', '2021-03-07 07:58:48', '2021-03-07 07:58:48');
INSERT INTO `exam_admin_operation_log` VALUES (222, 1, 'exam/admin/platform/banner/create', 'GET', '172.18.0.1', '[]', '2021-03-07 08:00:18', '2021-03-07 08:00:18');
INSERT INTO `exam_admin_operation_log` VALUES (223, 1, 'exam/admin/platform/banner/create', 'GET', '172.18.0.1', '[]', '2021-03-07 08:02:55', '2021-03-07 08:02:55');
INSERT INTO `exam_admin_operation_log` VALUES (224, 1, 'exam/admin/platform/banner/create', 'GET', '172.18.0.1', '[]', '2021-03-07 08:03:28', '2021-03-07 08:03:28');
INSERT INTO `exam_admin_operation_log` VALUES (225, 1, 'exam/admin/platform/banner/create', 'GET', '172.18.0.1', '[]', '2021-03-07 08:04:12', '2021-03-07 08:04:12');
INSERT INTO `exam_admin_operation_log` VALUES (226, 1, 'exam/admin/platform/banner/create', 'GET', '172.18.0.1', '[]', '2021-03-07 08:04:24', '2021-03-07 08:04:24');
INSERT INTO `exam_admin_operation_log` VALUES (227, 1, 'exam/admin/platform/banner/create', 'GET', '172.18.0.1', '[]', '2021-03-07 08:04:55', '2021-03-07 08:04:55');
INSERT INTO `exam_admin_operation_log` VALUES (228, 1, 'exam/admin/platform/banner', 'POST', '172.18.0.1', '{\"uuid\":\"130b87fe09eafd60658aa26555e8ce68\",\"title\":\"Redis\\u5b9e\\u73b0\\u5217\\u8868\\u6570\\u636e\\u67e5\\u8be2\\u8bbe\\u8ba1\",\"url\":null,\"position\":\"4\",\"is_show\":\"on\",\"orders\":\"0\",\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\"}', '2021-03-07 08:05:18', '2021-03-07 08:05:18');
INSERT INTO `exam_admin_operation_log` VALUES (229, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '[]', '2021-03-07 08:05:18', '2021-03-07 08:05:18');
INSERT INTO `exam_admin_operation_log` VALUES (230, 1, 'exam/admin/platform/banner/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:05:23', '2021-03-07 08:05:23');
INSERT INTO `exam_admin_operation_log` VALUES (231, 1, 'exam/admin/platform/banner/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-07 08:05:57', '2021-03-07 08:05:57');
INSERT INTO `exam_admin_operation_log` VALUES (232, 1, 'exam/admin/platform/banner/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-07 08:06:10', '2021-03-07 08:06:10');
INSERT INTO `exam_admin_operation_log` VALUES (233, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:06:17', '2021-03-07 08:06:17');
INSERT INTO `exam_admin_operation_log` VALUES (234, 1, 'exam/admin/platform/banner/1', 'PUT', '172.18.0.1', '{\"name\":\"orders\",\"value\":\"10\",\"pk\":\"1\",\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-03-07 08:06:23', '2021-03-07 08:06:23');
INSERT INTO `exam_admin_operation_log` VALUES (235, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\",\"title\":\"MySQL\\u51fd\\u6570sum\\u4f7f\\u7528\\u573a\\u666f\\u89e3\\u8bfb\",\"is_show\":null}', '2021-03-07 08:06:28', '2021-03-07 08:06:28');
INSERT INTO `exam_admin_operation_log` VALUES (236, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:07:55', '2021-03-07 08:07:55');
INSERT INTO `exam_admin_operation_log` VALUES (237, 1, 'exam/admin/exam/tag/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:07:57', '2021-03-07 08:07:57');
INSERT INTO `exam_admin_operation_log` VALUES (238, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:08:17', '2021-03-07 08:08:17');
INSERT INTO `exam_admin_operation_log` VALUES (239, 1, 'exam/admin/exam/category/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:08:19', '2021-03-07 08:08:19');
INSERT INTO `exam_admin_operation_log` VALUES (240, 1, 'exam/admin/exam/category/create', 'GET', '172.18.0.1', '[]', '2021-03-07 08:08:43', '2021-03-07 08:08:43');
INSERT INTO `exam_admin_operation_log` VALUES (241, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:08:51', '2021-03-07 08:08:51');
INSERT INTO `exam_admin_operation_log` VALUES (242, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:08:54', '2021-03-07 08:08:54');
INSERT INTO `exam_admin_operation_log` VALUES (243, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:08:56', '2021-03-07 08:08:56');
INSERT INTO `exam_admin_operation_log` VALUES (244, 1, 'exam/admin/exam/tag/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:08:59', '2021-03-07 08:08:59');
INSERT INTO `exam_admin_operation_log` VALUES (245, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:09:03', '2021-03-07 08:09:03');
INSERT INTO `exam_admin_operation_log` VALUES (246, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:09:05', '2021-03-07 08:09:05');
INSERT INTO `exam_admin_operation_log` VALUES (247, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:23:01', '2021-03-07 08:23:01');
INSERT INTO `exam_admin_operation_log` VALUES (248, 1, 'exam/admin/auth/menu', 'POST', '172.18.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u641c\\u7d22\\u5386\\u53f2\",\"icon\":\"fa-bars\",\"uri\":\"exam\\/search\\/history\",\"roles\":[null],\"permission\":null,\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\"}', '2021-03-07 08:23:11', '2021-03-07 08:23:11');
INSERT INTO `exam_admin_operation_log` VALUES (249, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-07 08:23:11', '2021-03-07 08:23:11');
INSERT INTO `exam_admin_operation_log` VALUES (250, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-07 08:23:20', '2021-03-07 08:23:20');
INSERT INTO `exam_admin_operation_log` VALUES (251, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:23:24', '2021-03-07 08:23:24');
INSERT INTO `exam_admin_operation_log` VALUES (252, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-07 08:23:52', '2021-03-07 08:23:52');
INSERT INTO `exam_admin_operation_log` VALUES (253, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-07 08:24:07', '2021-03-07 08:24:07');
INSERT INTO `exam_admin_operation_log` VALUES (254, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-07 08:25:43', '2021-03-07 08:25:43');
INSERT INTO `exam_admin_operation_log` VALUES (255, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-07 08:26:10', '2021-03-07 08:26:10');
INSERT INTO `exam_admin_operation_log` VALUES (256, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-07 08:26:35', '2021-03-07 08:26:35');
INSERT INTO `exam_admin_operation_log` VALUES (257, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-07 08:26:50', '2021-03-07 08:26:50');
INSERT INTO `exam_admin_operation_log` VALUES (258, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-07 08:27:11', '2021-03-07 08:27:11');
INSERT INTO `exam_admin_operation_log` VALUES (259, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-07 08:30:11', '2021-03-07 08:30:11');
INSERT INTO `exam_admin_operation_log` VALUES (260, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Admin_Exam_SearchHistory\",\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_action\":\"App_Admin_Actions_Common_ShowStatus\"}', '2021-03-07 08:30:14', '2021-03-07 08:30:14');
INSERT INTO `exam_admin_operation_log` VALUES (261, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:30:15', '2021-03-07 08:30:15');
INSERT INTO `exam_admin_operation_log` VALUES (262, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-07 08:32:00', '2021-03-07 08:32:00');
INSERT INTO `exam_admin_operation_log` VALUES (263, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Admin_Exam_SearchHistory\",\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_action\":\"App_Admin_Actions_Common_ShowStatus\"}', '2021-03-07 08:32:04', '2021-03-07 08:32:04');
INSERT INTO `exam_admin_operation_log` VALUES (264, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Admin_Exam_SearchHistory\",\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_action\":\"App_Admin_Actions_Common_ShowStatus\"}', '2021-03-07 08:32:09', '2021-03-07 08:32:09');
INSERT INTO `exam_admin_operation_log` VALUES (265, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-07 08:34:33', '2021-03-07 08:34:33');
INSERT INTO `exam_admin_operation_log` VALUES (266, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Admin_Exam_SearchHistory\",\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_action\":\"App_Admin_Actions_Common_ShowStatus\"}', '2021-03-07 08:34:37', '2021-03-07 08:34:37');
INSERT INTO `exam_admin_operation_log` VALUES (267, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-07 08:34:59', '2021-03-07 08:34:59');
INSERT INTO `exam_admin_operation_log` VALUES (268, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Admin_Exam_SearchHistory\",\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_action\":\"App_Admin_Actions_Common_ShowStatus\"}', '2021-03-07 08:35:02', '2021-03-07 08:35:02');
INSERT INTO `exam_admin_operation_log` VALUES (269, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-07 08:36:01', '2021-03-07 08:36:01');
INSERT INTO `exam_admin_operation_log` VALUES (270, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Admin_Exam_SearchHistory\",\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_action\":\"App_Admin_Actions_Common_ShowStatus\"}', '2021-03-07 08:36:05', '2021-03-07 08:36:05');
INSERT INTO `exam_admin_operation_log` VALUES (271, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:36:06', '2021-03-07 08:36:06');
INSERT INTO `exam_admin_operation_log` VALUES (272, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-07 08:36:11', '2021-03-07 08:36:11');
INSERT INTO `exam_admin_operation_log` VALUES (273, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-07 08:36:34', '2021-03-07 08:36:34');
INSERT INTO `exam_admin_operation_log` VALUES (274, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Admin_Exam_SearchHistory\",\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_action\":\"App_Admin_Actions_Common_ShowStatus\"}', '2021-03-07 08:36:38', '2021-03-07 08:36:38');
INSERT INTO `exam_admin_operation_log` VALUES (275, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:36:38', '2021-03-07 08:36:38');
INSERT INTO `exam_admin_operation_log` VALUES (276, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-07 08:36:57', '2021-03-07 08:36:57');
INSERT INTO `exam_admin_operation_log` VALUES (277, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Admin_Exam_SearchHistory\",\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_action\":\"App_Admin_Actions_Common_ShowStatus\"}', '2021-03-07 08:37:01', '2021-03-07 08:37:01');
INSERT INTO `exam_admin_operation_log` VALUES (278, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:37:02', '2021-03-07 08:37:02');
INSERT INTO `exam_admin_operation_log` VALUES (279, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-07 08:39:08', '2021-03-07 08:39:08');
INSERT INTO `exam_admin_operation_log` VALUES (280, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Admin_Exam_SearchHistory\",\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_action\":\"App_Admin_Actions_Common_ShowStatus\"}', '2021-03-07 08:39:10', '2021-03-07 08:39:10');
INSERT INTO `exam_admin_operation_log` VALUES (281, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:39:11', '2021-03-07 08:39:11');
INSERT INTO `exam_admin_operation_log` VALUES (282, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Admin_Exam_SearchHistory\",\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_action\":\"App_Admin_Actions_Common_ShowStatus\"}', '2021-03-07 08:39:14', '2021-03-07 08:39:14');
INSERT INTO `exam_admin_operation_log` VALUES (283, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:39:14', '2021-03-07 08:39:14');
INSERT INTO `exam_admin_operation_log` VALUES (284, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-07 08:40:25', '2021-03-07 08:40:25');
INSERT INTO `exam_admin_operation_log` VALUES (285, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-07 08:40:36', '2021-03-07 08:40:36');
INSERT INTO `exam_admin_operation_log` VALUES (286, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Admin_Exam_SearchHistory\",\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_action\":\"App_Admin_Actions_Common_ShowStatus\"}', '2021-03-07 08:40:39', '2021-03-07 08:40:39');
INSERT INTO `exam_admin_operation_log` VALUES (287, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:40:40', '2021-03-07 08:40:40');
INSERT INTO `exam_admin_operation_log` VALUES (288, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-07 08:40:46', '2021-03-07 08:40:46');
INSERT INTO `exam_admin_operation_log` VALUES (289, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Admin_Exam_SearchHistory\",\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_action\":\"App_Admin_Actions_Common_ShowStatus\"}', '2021-03-07 08:40:48', '2021-03-07 08:40:48');
INSERT INTO `exam_admin_operation_log` VALUES (290, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:40:49', '2021-03-07 08:40:49');
INSERT INTO `exam_admin_operation_log` VALUES (291, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-07 08:41:13', '2021-03-07 08:41:13');
INSERT INTO `exam_admin_operation_log` VALUES (292, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Admin_Exam_SearchHistory\",\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_action\":\"App_Admin_Actions_Common_ShowStatus\"}', '2021-03-07 08:41:17', '2021-03-07 08:41:17');
INSERT INTO `exam_admin_operation_log` VALUES (293, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:41:18', '2021-03-07 08:41:18');
INSERT INTO `exam_admin_operation_log` VALUES (294, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Admin_Exam_SearchHistory\",\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_action\":\"App_Admin_Actions_Common_ShowStatus\"}', '2021-03-07 08:41:21', '2021-03-07 08:41:21');
INSERT INTO `exam_admin_operation_log` VALUES (295, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:41:21', '2021-03-07 08:41:21');
INSERT INTO `exam_admin_operation_log` VALUES (296, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:41:25', '2021-03-07 08:41:25');
INSERT INTO `exam_admin_operation_log` VALUES (297, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:41:28', '2021-03-07 08:41:28');
INSERT INTO `exam_admin_operation_log` VALUES (298, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '[]', '2021-03-07 08:42:13', '2021-03-07 08:42:13');
INSERT INTO `exam_admin_operation_log` VALUES (299, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:42:25', '2021-03-07 08:42:25');
INSERT INTO `exam_admin_operation_log` VALUES (300, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '[]', '2021-03-07 08:42:27', '2021-03-07 08:42:27');
INSERT INTO `exam_admin_operation_log` VALUES (301, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:43:01', '2021-03-07 08:43:01');
INSERT INTO `exam_admin_operation_log` VALUES (302, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:43:28', '2021-03-07 08:43:28');
INSERT INTO `exam_admin_operation_log` VALUES (303, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:44:44', '2021-03-07 08:44:44');
INSERT INTO `exam_admin_operation_log` VALUES (304, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-07 08:44:47', '2021-03-07 08:44:47');
INSERT INTO `exam_admin_operation_log` VALUES (305, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-07 08:45:27', '2021-03-07 08:45:27');
INSERT INTO `exam_admin_operation_log` VALUES (306, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-07 08:45:55', '2021-03-07 08:45:55');
INSERT INTO `exam_admin_operation_log` VALUES (307, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-07 08:46:08', '2021-03-07 08:46:08');
INSERT INTO `exam_admin_operation_log` VALUES (308, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-07 08:48:54', '2021-03-07 08:48:54');
INSERT INTO `exam_admin_operation_log` VALUES (309, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-07 08:48:57', '2021-03-07 08:48:57');
INSERT INTO `exam_admin_operation_log` VALUES (310, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:49:00', '2021-03-07 08:49:00');
INSERT INTO `exam_admin_operation_log` VALUES (311, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:49:03', '2021-03-07 08:49:03');
INSERT INTO `exam_admin_operation_log` VALUES (312, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:49:04', '2021-03-07 08:49:04');
INSERT INTO `exam_admin_operation_log` VALUES (313, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:49:05', '2021-03-07 08:49:05');
INSERT INTO `exam_admin_operation_log` VALUES (314, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:49:09', '2021-03-07 08:49:09');
INSERT INTO `exam_admin_operation_log` VALUES (315, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:49:11', '2021-03-07 08:49:11');
INSERT INTO `exam_admin_operation_log` VALUES (316, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:49:16', '2021-03-07 08:49:16');
INSERT INTO `exam_admin_operation_log` VALUES (317, 1, 'exam/admin/auth/menu', 'POST', '172.18.0.1', '{\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":11,\\\"children\\\":[{\\\"id\\\":12}]},{\\\"id\\\":8,\\\"children\\\":[{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":13}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2021-03-07 08:49:30', '2021-03-07 08:49:30');
INSERT INTO `exam_admin_operation_log` VALUES (318, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:49:31', '2021-03-07 08:49:31');
INSERT INTO `exam_admin_operation_log` VALUES (319, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-07 08:49:33', '2021-03-07 08:49:33');
INSERT INTO `exam_admin_operation_log` VALUES (320, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:49:38', '2021-03-07 08:49:38');
INSERT INTO `exam_admin_operation_log` VALUES (321, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:54:07', '2021-03-07 08:54:07');
INSERT INTO `exam_admin_operation_log` VALUES (322, 1, 'exam/admin/auth/menu', 'POST', '172.18.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\"}', '2021-03-07 08:54:20', '2021-03-07 08:54:20');
INSERT INTO `exam_admin_operation_log` VALUES (323, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-07 08:54:20', '2021-03-07 08:54:20');
INSERT INTO `exam_admin_operation_log` VALUES (324, 1, 'exam/admin/auth/menu', 'POST', '172.18.0.1', '{\"parent_id\":\"14\",\"title\":\"\\u5fae\\u4fe1\\u7528\\u6237\",\"icon\":\"fa-bars\",\"uri\":\"wechat\\/user\",\"roles\":[null],\"permission\":null,\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\"}', '2021-03-07 08:54:29', '2021-03-07 08:54:29');
INSERT INTO `exam_admin_operation_log` VALUES (325, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-07 08:54:29', '2021-03-07 08:54:29');
INSERT INTO `exam_admin_operation_log` VALUES (326, 1, 'exam/admin/auth/menu', 'POST', '172.18.0.1', '{\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":11,\\\"children\\\":[{\\\"id\\\":12}]},{\\\"id\\\":8,\\\"children\\\":[{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":13}]},{\\\"id\\\":14,\\\"children\\\":[{\\\"id\\\":15}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2021-03-07 08:54:45', '2021-03-07 08:54:45');
INSERT INTO `exam_admin_operation_log` VALUES (327, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:54:46', '2021-03-07 08:54:46');
INSERT INTO `exam_admin_operation_log` VALUES (328, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-07 08:54:47', '2021-03-07 08:54:47');
INSERT INTO `exam_admin_operation_log` VALUES (329, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:54:52', '2021-03-07 08:54:52');
INSERT INTO `exam_admin_operation_log` VALUES (330, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-07 08:55:40', '2021-03-07 08:55:40');
INSERT INTO `exam_admin_operation_log` VALUES (331, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-07 08:56:09', '2021-03-07 08:56:09');
INSERT INTO `exam_admin_operation_log` VALUES (332, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_key\":\"157\",\"_model\":\"App_Models_Admin_User_WeChat\",\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_action\":\"App_Admin_Actions_Common_ShowStatus\"}', '2021-03-07 08:56:12', '2021-03-07 08:56:12');
INSERT INTO `exam_admin_operation_log` VALUES (333, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:56:13', '2021-03-07 08:56:13');
INSERT INTO `exam_admin_operation_log` VALUES (334, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_key\":\"157\",\"_model\":\"App_Models_Admin_User_WeChat\",\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_action\":\"App_Admin_Actions_Common_ShowStatus\"}', '2021-03-07 08:56:16', '2021-03-07 08:56:16');
INSERT INTO `exam_admin_operation_log` VALUES (335, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:56:16', '2021-03-07 08:56:16');
INSERT INTO `exam_admin_operation_log` VALUES (336, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_key\":\"157\",\"_model\":\"App_Models_Admin_User_WeChat\",\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_action\":\"App_Admin_Actions_Common_ShowStatus\"}', '2021-03-07 08:56:56', '2021-03-07 08:56:56');
INSERT INTO `exam_admin_operation_log` VALUES (337, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:56:56', '2021-03-07 08:56:56');
INSERT INTO `exam_admin_operation_log` VALUES (338, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_key\":\"157\",\"_model\":\"App_Models_Admin_User_WeChat\",\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_action\":\"App_Admin_Actions_Common_ShowStatus\"}', '2021-03-07 08:57:05', '2021-03-07 08:57:05');
INSERT INTO `exam_admin_operation_log` VALUES (339, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:57:05', '2021-03-07 08:57:05');
INSERT INTO `exam_admin_operation_log` VALUES (340, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_key\":\"157\",\"_model\":\"App_Models_Admin_User_WeChat\",\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_action\":\"App_Admin_Actions_Common_ShowStatus\"}', '2021-03-07 08:57:42', '2021-03-07 08:57:42');
INSERT INTO `exam_admin_operation_log` VALUES (341, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:57:42', '2021-03-07 08:57:42');
INSERT INTO `exam_admin_operation_log` VALUES (342, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_key\":\"157\",\"_model\":\"App_Models_Admin_User_WeChat\",\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_action\":\"App_Admin_Actions_Common_ShowStatus\"}', '2021-03-07 08:57:45', '2021-03-07 08:57:45');
INSERT INTO `exam_admin_operation_log` VALUES (343, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:57:45', '2021-03-07 08:57:45');
INSERT INTO `exam_admin_operation_log` VALUES (344, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:57:52', '2021-03-07 08:57:52');
INSERT INTO `exam_admin_operation_log` VALUES (345, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Admin_Exam_SearchHistory\",\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_action\":\"App_Admin_Actions_Common_ShowStatus\"}', '2021-03-07 08:57:54', '2021-03-07 08:57:54');
INSERT INTO `exam_admin_operation_log` VALUES (346, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:57:54', '2021-03-07 08:57:54');
INSERT INTO `exam_admin_operation_log` VALUES (347, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Admin_Exam_SearchHistory\",\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_action\":\"App_Admin_Actions_Common_ShowStatus\"}', '2021-03-07 08:57:56', '2021-03-07 08:57:56');
INSERT INTO `exam_admin_operation_log` VALUES (348, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:57:56', '2021-03-07 08:57:56');
INSERT INTO `exam_admin_operation_log` VALUES (349, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-07 08:58:18', '2021-03-07 08:58:18');
INSERT INTO `exam_admin_operation_log` VALUES (350, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 08:58:21', '2021-03-07 08:58:21');
INSERT INTO `exam_admin_operation_log` VALUES (351, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-07 09:00:37', '2021-03-07 09:00:37');
INSERT INTO `exam_admin_operation_log` VALUES (352, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-07 09:02:10', '2021-03-07 09:02:10');
INSERT INTO `exam_admin_operation_log` VALUES (353, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-07 09:02:47', '2021-03-07 09:02:47');
INSERT INTO `exam_admin_operation_log` VALUES (354, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-07 09:03:22', '2021-03-07 09:03:22');
INSERT INTO `exam_admin_operation_log` VALUES (355, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-07 09:03:44', '2021-03-07 09:03:44');
INSERT INTO `exam_admin_operation_log` VALUES (356, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_key\":\"157\",\"_model\":\"App_Models_Admin_User_WeChat\",\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_action\":\"App_Admin_Actions_Common_ShowStatus\"}', '2021-03-07 09:03:52', '2021-03-07 09:03:52');
INSERT INTO `exam_admin_operation_log` VALUES (357, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 09:03:52', '2021-03-07 09:03:52');
INSERT INTO `exam_admin_operation_log` VALUES (358, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-07 09:03:54', '2021-03-07 09:03:54');
INSERT INTO `exam_admin_operation_log` VALUES (359, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-07 09:04:16', '2021-03-07 09:04:16');
INSERT INTO `exam_admin_operation_log` VALUES (360, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-03-07 09:04:50', '2021-03-07 09:04:50');
INSERT INTO `exam_admin_operation_log` VALUES (361, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-03-07 09:04:53', '2021-03-07 09:04:53');
INSERT INTO `exam_admin_operation_log` VALUES (362, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-03-07 09:04:55', '2021-03-07 09:04:55');
INSERT INTO `exam_admin_operation_log` VALUES (363, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 09:04:57', '2021-03-07 09:04:57');
INSERT INTO `exam_admin_operation_log` VALUES (364, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 09:04:58', '2021-03-07 09:04:58');
INSERT INTO `exam_admin_operation_log` VALUES (365, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 09:04:59', '2021-03-07 09:04:59');
INSERT INTO `exam_admin_operation_log` VALUES (366, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-07 09:06:11', '2021-03-07 09:06:11');
INSERT INTO `exam_admin_operation_log` VALUES (367, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 09:06:15', '2021-03-07 09:06:15');
INSERT INTO `exam_admin_operation_log` VALUES (368, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-07 09:12:55', '2021-03-07 09:12:55');
INSERT INTO `exam_admin_operation_log` VALUES (369, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 09:40:14', '2021-03-07 09:40:14');
INSERT INTO `exam_admin_operation_log` VALUES (370, 1, 'exam/admin/auth/menu', 'POST', '172.18.0.1', '{\"parent_id\":\"11\",\"title\":\"\\u7cfb\\u7edf\\u6d88\\u606f\",\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\"}', '2021-03-07 09:40:26', '2021-03-07 09:40:26');
INSERT INTO `exam_admin_operation_log` VALUES (371, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-07 09:40:27', '2021-03-07 09:40:27');
INSERT INTO `exam_admin_operation_log` VALUES (372, 1, 'exam/admin/auth/menu', 'POST', '172.18.0.1', '{\"parent_id\":\"16\",\"title\":\"\\u6d88\\u606f\\u5206\\u7c7b\",\"icon\":\"fa-bars\",\"uri\":\"platform\\/message\\/category\",\"roles\":[null],\"permission\":null,\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\"}', '2021-03-07 09:40:41', '2021-03-07 09:40:41');
INSERT INTO `exam_admin_operation_log` VALUES (373, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-07 09:40:41', '2021-03-07 09:40:41');
INSERT INTO `exam_admin_operation_log` VALUES (374, 1, 'exam/admin/auth/menu', 'POST', '172.18.0.1', '{\"parent_id\":\"16\",\"title\":\"\\u6d88\\u606f\\u5185\\u5bb9\",\"icon\":\"fa-bars\",\"uri\":\"platform\\/message\\/content\",\"roles\":[null],\"permission\":null,\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\"}', '2021-03-07 09:40:54', '2021-03-07 09:40:54');
INSERT INTO `exam_admin_operation_log` VALUES (375, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-07 09:40:54', '2021-03-07 09:40:54');
INSERT INTO `exam_admin_operation_log` VALUES (376, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-07 09:40:55', '2021-03-07 09:40:55');
INSERT INTO `exam_admin_operation_log` VALUES (377, 1, 'exam/admin/platform/message/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 09:41:00', '2021-03-07 09:41:00');
INSERT INTO `exam_admin_operation_log` VALUES (378, 1, 'exam/admin/platform/message/category/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 09:41:02', '2021-03-07 09:41:02');
INSERT INTO `exam_admin_operation_log` VALUES (379, 1, 'exam/admin/platform/message/category', 'POST', '172.18.0.1', '{\"uuid\":\"48ca0e1f15f5f7e8188205d58f5d73b3\",\"title\":\"\\u67e5\\u8def\\u7ebf\",\"is_show\":\"on\",\"orders\":\"0\",\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/exam\\/admin\\/platform\\/message\\/category\"}', '2021-03-07 09:41:12', '2021-03-07 09:41:12');
INSERT INTO `exam_admin_operation_log` VALUES (380, 1, 'exam/admin/platform/message/category/create', 'GET', '172.18.0.1', '[]', '2021-03-07 09:41:13', '2021-03-07 09:41:13');
INSERT INTO `exam_admin_operation_log` VALUES (381, 1, 'exam/admin/platform/message/category', 'POST', '172.18.0.1', '{\"uuid\":\"d09a54b0f96c8fa49f424e3bfa0efbeb\",\"title\":\"\\u67e5\\u8def\\u7ebf\",\"is_show\":\"on\",\"orders\":\"0\",\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\"}', '2021-03-07 09:41:28', '2021-03-07 09:41:28');
INSERT INTO `exam_admin_operation_log` VALUES (382, 1, 'exam/admin/platform/message/category', 'GET', '172.18.0.1', '[]', '2021-03-07 09:41:29', '2021-03-07 09:41:29');
INSERT INTO `exam_admin_operation_log` VALUES (383, 1, 'exam/admin/platform/message/category/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 09:41:33', '2021-03-07 09:41:33');
INSERT INTO `exam_admin_operation_log` VALUES (384, 1, 'exam/admin/platform/message/category/1', 'PUT', '172.18.0.1', '{\"uuid\":\"d09a54b0f96c8fa49f424e3bfa0efbeb\",\"title\":\"\\u67e5\\u8def\\u7ebf\",\"is_show\":\"on\",\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/exam\\/admin\\/platform\\/message\\/category\"}', '2021-03-07 09:44:54', '2021-03-07 09:44:54');
INSERT INTO `exam_admin_operation_log` VALUES (385, 1, 'exam/admin/platform/message/category', 'GET', '172.18.0.1', '[]', '2021-03-07 09:44:54', '2021-03-07 09:44:54');
INSERT INTO `exam_admin_operation_log` VALUES (386, 1, 'exam/admin/platform/message/content', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 09:44:56', '2021-03-07 09:44:56');
INSERT INTO `exam_admin_operation_log` VALUES (387, 1, 'exam/admin/platform/message/content/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 09:44:58', '2021-03-07 09:44:58');
INSERT INTO `exam_admin_operation_log` VALUES (388, 1, 'exam/admin/platform/message/content', 'POST', '172.18.0.1', '{\"uuid\":\"ae4434a39261708697f7f2b4a63cf436\",\"platform_message_category_uuid\":\"d09a54b0f96c8fa49f424e3bfa0efbeb\",\"title\":\"MySQL\\u51fd\\u6570sum\\u4f7f\\u7528\\u573a\\u666f\\u89e3\\u8bfb\",\"content\":\"<p>12312312321<br\\/><\\/p>\",\"is_show\":\"on\",\"_token\":\"N2FsBzmYsh3CniZ3ccGs3G35N4TxGgnz45EqUsu5\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/exam\\/admin\\/platform\\/message\\/content\"}', '2021-03-07 09:45:07', '2021-03-07 09:45:07');
INSERT INTO `exam_admin_operation_log` VALUES (389, 1, 'exam/admin/platform/message/content', 'GET', '172.18.0.1', '[]', '2021-03-07 09:45:07', '2021-03-07 09:45:07');
INSERT INTO `exam_admin_operation_log` VALUES (390, 1, 'exam/admin/platform/message/content', 'GET', '172.18.0.1', '[]', '2021-03-07 09:45:10', '2021-03-07 09:45:10');
INSERT INTO `exam_admin_operation_log` VALUES (391, 1, 'exam/admin/platform/message/content/1', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 09:45:14', '2021-03-07 09:45:14');
INSERT INTO `exam_admin_operation_log` VALUES (392, 1, 'exam/admin/platform/message/content', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 09:45:16', '2021-03-07 09:45:16');
INSERT INTO `exam_admin_operation_log` VALUES (393, 1, 'exam/admin/platform/message/content/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 09:45:19', '2021-03-07 09:45:19');
INSERT INTO `exam_admin_operation_log` VALUES (394, 1, 'exam/admin/platform/message/content/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-07 09:45:41', '2021-03-07 09:45:41');
INSERT INTO `exam_admin_operation_log` VALUES (395, 1, 'exam/admin/platform/message/content/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-07 09:47:23', '2021-03-07 09:47:23');
INSERT INTO `exam_admin_operation_log` VALUES (396, 1, 'exam/admin/platform/message/content/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-07 09:56:37', '2021-03-07 09:56:37');
INSERT INTO `exam_admin_operation_log` VALUES (397, 1, 'exam/admin/platform/message/content/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-07 10:01:23', '2021-03-07 10:01:23');
INSERT INTO `exam_admin_operation_log` VALUES (398, 1, 'exam/admin/platform/message/content/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-07 10:07:50', '2021-03-07 10:07:50');
INSERT INTO `exam_admin_operation_log` VALUES (399, 1, 'exam/admin/platform/message/content/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-07 10:11:13', '2021-03-07 10:11:13');
INSERT INTO `exam_admin_operation_log` VALUES (400, 1, 'exam/admin/platform/message/content/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-07 10:15:33', '2021-03-07 10:15:33');
INSERT INTO `exam_admin_operation_log` VALUES (401, 1, 'exam/admin/platform/message/content', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 10:16:00', '2021-03-07 10:16:00');
INSERT INTO `exam_admin_operation_log` VALUES (402, 1, 'exam/admin', 'GET', '172.18.0.1', '[]', '2021-03-07 10:16:49', '2021-03-07 10:16:49');
INSERT INTO `exam_admin_operation_log` VALUES (403, 1, 'exam/admin/platform/message/content', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 10:17:05', '2021-03-07 10:17:05');
INSERT INTO `exam_admin_operation_log` VALUES (404, 1, 'exam/admin/platform/message/content/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 10:17:08', '2021-03-07 10:17:08');
INSERT INTO `exam_admin_operation_log` VALUES (405, 1, 'exam/admin/platform/message/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 10:24:10', '2021-03-07 10:24:10');
INSERT INTO `exam_admin_operation_log` VALUES (406, 1, 'exam/admin/platform/message/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 10:24:21', '2021-03-07 10:24:21');
INSERT INTO `exam_admin_operation_log` VALUES (407, 1, 'exam/admin/platform/message/content', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 10:24:21', '2021-03-07 10:24:21');
INSERT INTO `exam_admin_operation_log` VALUES (408, 1, 'exam/admin/platform/message/content/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 10:24:26', '2021-03-07 10:24:26');
INSERT INTO `exam_admin_operation_log` VALUES (409, 1, 'exam/admin/platform/message/content', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 10:24:31', '2021-03-07 10:24:31');
INSERT INTO `exam_admin_operation_log` VALUES (410, 1, 'exam/admin/platform/message/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 10:40:15', '2021-03-07 10:40:15');
INSERT INTO `exam_admin_operation_log` VALUES (411, 1, 'exam/admin/platform/message/content', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 10:40:15', '2021-03-07 10:40:15');
INSERT INTO `exam_admin_operation_log` VALUES (412, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 10:40:20', '2021-03-07 10:40:20');
INSERT INTO `exam_admin_operation_log` VALUES (413, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 10:40:22', '2021-03-07 10:40:22');
INSERT INTO `exam_admin_operation_log` VALUES (414, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 10:40:24', '2021-03-07 10:40:24');
INSERT INTO `exam_admin_operation_log` VALUES (415, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 10:40:25', '2021-03-07 10:40:25');
INSERT INTO `exam_admin_operation_log` VALUES (416, 1, 'exam/admin/platform/message/content', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\",\"title\":\"\\u73a9\\u8f6cdnmp\\u4e4bport\\u7bc7\",\"is_show\":null}', '2021-03-07 10:41:02', '2021-03-07 10:41:02');
INSERT INTO `exam_admin_operation_log` VALUES (417, 1, 'exam/admin/platform/message/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 10:41:04', '2021-03-07 10:41:04');
INSERT INTO `exam_admin_operation_log` VALUES (418, 1, 'exam/admin/platform/message/content', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 10:51:46', '2021-03-07 10:51:46');
INSERT INTO `exam_admin_operation_log` VALUES (419, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 10:51:50', '2021-03-07 10:51:50');
INSERT INTO `exam_admin_operation_log` VALUES (420, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 10:52:14', '2021-03-07 10:52:14');
INSERT INTO `exam_admin_operation_log` VALUES (421, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 10:52:16', '2021-03-07 10:52:16');
INSERT INTO `exam_admin_operation_log` VALUES (422, 1, 'exam/admin/platform/message/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 10:53:38', '2021-03-07 10:53:38');
INSERT INTO `exam_admin_operation_log` VALUES (423, 1, 'exam/admin/platform/message/category/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 10:53:40', '2021-03-07 10:53:40');
INSERT INTO `exam_admin_operation_log` VALUES (424, 1, 'exam/admin/platform/message/category/1', 'PUT', '172.18.0.1', '{\"uuid\":\"d09a54b0f96c8fa49f424e3bfa0efbeb\",\"title\":\"\\u67e5\\u8def\\u7ebf\",\"is_show\":\"on\",\"_token\":\"qrUxZU50DrgjXbDPzEEiVwf2Zn0ExtnMUfk8pBP5\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/exam\\/admin\\/platform\\/message\\/category\"}', '2021-03-07 10:53:50', '2021-03-07 10:53:50');
INSERT INTO `exam_admin_operation_log` VALUES (425, 1, 'exam/admin/platform/message/category/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-07 10:53:51', '2021-03-07 10:53:51');
INSERT INTO `exam_admin_operation_log` VALUES (426, 1, 'exam/admin/platform/message/category/1', 'PUT', '172.18.0.1', '{\"uuid\":\"d09a54b0f96c8fa49f424e3bfa0efbeb\",\"title\":\"\\u67e5\\u8def\\u7ebf\",\"is_show\":\"on\",\"_token\":\"qrUxZU50DrgjXbDPzEEiVwf2Zn0ExtnMUfk8pBP5\",\"_method\":\"PUT\"}', '2021-03-07 10:54:01', '2021-03-07 10:54:01');
INSERT INTO `exam_admin_operation_log` VALUES (427, 1, 'exam/admin/platform/message/category', 'GET', '172.18.0.1', '[]', '2021-03-07 10:54:01', '2021-03-07 10:54:01');
INSERT INTO `exam_admin_operation_log` VALUES (428, 1, 'exam/admin/platform/message/category/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 10:55:02', '2021-03-07 10:55:02');
INSERT INTO `exam_admin_operation_log` VALUES (429, 1, 'exam/admin/platform/message/category/1', 'PUT', '172.18.0.1', '{\"uuid\":\"d09a54b0f96c8fa49f424e3bfa0efbeb\",\"title\":\"\\u67e5\\u8def\\u7ebf\",\"is_show\":\"on\",\"_token\":\"qrUxZU50DrgjXbDPzEEiVwf2Zn0ExtnMUfk8pBP5\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/exam\\/admin\\/platform\\/message\\/category\"}', '2021-03-07 10:55:09', '2021-03-07 10:55:09');
INSERT INTO `exam_admin_operation_log` VALUES (430, 1, 'exam/admin/platform/message/category/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-07 10:55:10', '2021-03-07 10:55:10');
INSERT INTO `exam_admin_operation_log` VALUES (431, 1, 'exam/admin/platform/message/category/1', 'PUT', '172.18.0.1', '{\"uuid\":\"d09a54b0f96c8fa49f424e3bfa0efbeb\",\"title\":\"\\u67e5\\u8def\\u7ebf\",\"is_show\":\"on\",\"_token\":\"qrUxZU50DrgjXbDPzEEiVwf2Zn0ExtnMUfk8pBP5\",\"_method\":\"PUT\"}', '2021-03-07 10:55:21', '2021-03-07 10:55:21');
INSERT INTO `exam_admin_operation_log` VALUES (432, 1, 'exam/admin/platform/message/category', 'GET', '172.18.0.1', '[]', '2021-03-07 10:55:22', '2021-03-07 10:55:22');
INSERT INTO `exam_admin_operation_log` VALUES (433, 1, 'exam/admin/platform/message/category/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 10:57:30', '2021-03-07 10:57:30');
INSERT INTO `exam_admin_operation_log` VALUES (434, 1, 'exam/admin/platform/message/category', 'POST', '172.18.0.1', '{\"uuid\":\"8e43d0b66d6f3a94a27c20c9acc636ec\",\"title\":\"\\u5ba2\\u670d\\u6d88\\u606f\",\"is_show\":\"on\",\"_token\":\"qrUxZU50DrgjXbDPzEEiVwf2Zn0ExtnMUfk8pBP5\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/exam\\/admin\\/platform\\/message\\/category\"}', '2021-03-07 10:57:42', '2021-03-07 10:57:42');
INSERT INTO `exam_admin_operation_log` VALUES (435, 1, 'exam/admin/platform/message/category', 'GET', '172.18.0.1', '[]', '2021-03-07 10:57:43', '2021-03-07 10:57:43');
INSERT INTO `exam_admin_operation_log` VALUES (436, 1, 'exam/admin/platform/message/category/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 10:57:53', '2021-03-07 10:57:53');
INSERT INTO `exam_admin_operation_log` VALUES (437, 1, 'exam/admin/platform/message/category/1', 'PUT', '172.18.0.1', '{\"uuid\":\"d09a54b0f96c8fa49f424e3bfa0efbeb\",\"title\":\"\\u7cfb\\u7edf\\u6d88\\u606f\",\"is_show\":\"on\",\"_token\":\"qrUxZU50DrgjXbDPzEEiVwf2Zn0ExtnMUfk8pBP5\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/exam\\/admin\\/platform\\/message\\/category\"}', '2021-03-07 10:58:00', '2021-03-07 10:58:00');
INSERT INTO `exam_admin_operation_log` VALUES (438, 1, 'exam/admin/platform/message/category', 'GET', '172.18.0.1', '[]', '2021-03-07 10:58:01', '2021-03-07 10:58:01');
INSERT INTO `exam_admin_operation_log` VALUES (439, 1, 'exam/admin/platform/message/content', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 10:58:03', '2021-03-07 10:58:03');
INSERT INTO `exam_admin_operation_log` VALUES (440, 1, 'exam/admin/platform/message/content/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 10:58:04', '2021-03-07 10:58:04');
INSERT INTO `exam_admin_operation_log` VALUES (441, 1, 'exam/admin/platform/message/content', 'POST', '172.18.0.1', '{\"uuid\":\"feead688b17d70f5d1503156504f391d\",\"platform_message_category_uuid\":\"d09a54b0f96c8fa49f424e3bfa0efbeb\",\"title\":\"\\u73a9\\u8f6cdnmp\\u4e4bport\\u7bc7\",\"content\":\"<p>123123<\\/p>\",\"is_show\":\"on\",\"_token\":\"qrUxZU50DrgjXbDPzEEiVwf2Zn0ExtnMUfk8pBP5\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/exam\\/admin\\/platform\\/message\\/content\"}', '2021-03-07 10:58:11', '2021-03-07 10:58:11');
INSERT INTO `exam_admin_operation_log` VALUES (442, 1, 'exam/admin/platform/message/content', 'GET', '172.18.0.1', '[]', '2021-03-07 10:58:11', '2021-03-07 10:58:11');
INSERT INTO `exam_admin_operation_log` VALUES (443, 1, 'exam/admin/platform/message/content/2/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 10:58:15', '2021-03-07 10:58:15');
INSERT INTO `exam_admin_operation_log` VALUES (444, 1, 'exam/admin/platform/message/content/2', 'PUT', '172.18.0.1', '{\"uuid\":\"feead688b17d70f5d1503156504f391d\",\"platform_message_category_uuid\":\"d09a54b0f96c8fa49f424e3bfa0efbeb\",\"title\":\"\\u73a9\\u8f6cdnmp\\u4e4bport\\u7bc7\",\"content\":\"<p>123123<\\/p>\",\"is_show\":\"on\",\"_token\":\"qrUxZU50DrgjXbDPzEEiVwf2Zn0ExtnMUfk8pBP5\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/exam\\/admin\\/platform\\/message\\/content\"}', '2021-03-07 10:58:18', '2021-03-07 10:58:18');
INSERT INTO `exam_admin_operation_log` VALUES (445, 1, 'exam/admin/platform/message/content', 'GET', '172.18.0.1', '[]', '2021-03-07 10:58:18', '2021-03-07 10:58:18');
INSERT INTO `exam_admin_operation_log` VALUES (446, 1, 'exam/admin/platform/message/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-07 10:59:41', '2021-03-07 10:59:41');
INSERT INTO `exam_admin_operation_log` VALUES (447, 1, 'exam/admin/auth/roles', 'GET', '172.18.0.1', '[]', '2021-03-08 15:40:24', '2021-03-08 15:40:24');
INSERT INTO `exam_admin_operation_log` VALUES (448, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-08 15:40:30', '2021-03-08 15:40:30');
INSERT INTO `exam_admin_operation_log` VALUES (449, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-08 15:40:42', '2021-03-08 15:40:42');
INSERT INTO `exam_admin_operation_log` VALUES (450, 1, 'exam/admin/auth/users', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-08 15:40:45', '2021-03-08 15:40:45');
INSERT INTO `exam_admin_operation_log` VALUES (451, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-08 15:41:35', '2021-03-08 15:41:35');
INSERT INTO `exam_admin_operation_log` VALUES (452, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-08 15:41:40', '2021-03-08 15:41:40');
INSERT INTO `exam_admin_operation_log` VALUES (453, 1, 'exam/admin', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-08 15:45:59', '2021-03-08 15:45:59');
INSERT INTO `exam_admin_operation_log` VALUES (454, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-08 15:46:01', '2021-03-08 15:46:01');
INSERT INTO `exam_admin_operation_log` VALUES (455, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-08 15:46:03', '2021-03-08 15:46:03');
INSERT INTO `exam_admin_operation_log` VALUES (456, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-08 15:46:42', '2021-03-08 15:46:42');
INSERT INTO `exam_admin_operation_log` VALUES (457, 1, 'exam/admin/platform/message/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-08 15:46:44', '2021-03-08 15:46:44');
INSERT INTO `exam_admin_operation_log` VALUES (458, 1, 'exam/admin/platform/message/content', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-08 15:46:49', '2021-03-08 15:46:49');
INSERT INTO `exam_admin_operation_log` VALUES (459, 1, 'exam/admin/platform/message/content', 'GET', '172.18.0.1', '[]', '2021-03-09 00:26:56', '2021-03-09 00:26:56');
INSERT INTO `exam_admin_operation_log` VALUES (460, 1, 'exam/admin', 'GET', '172.18.0.1', '[]', '2021-03-10 05:30:19', '2021-03-10 05:30:19');
INSERT INTO `exam_admin_operation_log` VALUES (461, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-10 05:30:25', '2021-03-10 05:30:25');
INSERT INTO `exam_admin_operation_log` VALUES (462, 1, 'exam/admin/platform/banner/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-10 05:30:27', '2021-03-10 05:30:27');
INSERT INTO `exam_admin_operation_log` VALUES (463, 1, 'exam/admin/platform/banner', 'POST', '172.18.0.1', '{\"uuid\":\"C1863440-7120-6C8E-8E6F-5F2802D759EB\",\"position\":\"2\",\"title\":\"Redis\\u4e8b\\u52a1\\u5904\\u7406\\u673a\\u5236\\u5206\\u6790\\u4e0e\\u603b\\u7ed3\",\"url\":null,\"is_show\":\"off\",\"orders\":\"0\",\"_token\":\"EjHJsFAV6UOCAOZrGDOTBnupKWq83GvBiSFYyh57\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/exam\\/admin\\/platform\\/banner\"}', '2021-03-10 05:30:44', '2021-03-10 05:30:44');
INSERT INTO `exam_admin_operation_log` VALUES (464, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '[]', '2021-03-10 05:30:47', '2021-03-10 05:30:47');
INSERT INTO `exam_admin_operation_log` VALUES (465, 1, 'exam/admin', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-10 05:30:53', '2021-03-10 05:30:53');
INSERT INTO `exam_admin_operation_log` VALUES (466, 1, 'exam/admin/platform/message/category', 'GET', '172.18.0.1', '[]', '2021-03-10 13:27:59', '2021-03-10 13:27:59');
INSERT INTO `exam_admin_operation_log` VALUES (467, 1, 'exam/admin', 'GET', '114.92.228.33', '[]', '2021-03-10 14:05:54', '2021-03-10 14:05:54');
INSERT INTO `exam_admin_operation_log` VALUES (468, 1, 'exam/admin', 'GET', '114.92.228.33', '{\"_pjax\":\"#pjax-container\"}', '2021-03-10 14:05:57', '2021-03-10 14:05:57');
INSERT INTO `exam_admin_operation_log` VALUES (469, 1, 'exam/admin/platform/message/category', 'GET', '114.92.228.33', '{\"_pjax\":\"#pjax-container\"}', '2021-03-10 14:06:04', '2021-03-10 14:06:04');
INSERT INTO `exam_admin_operation_log` VALUES (470, 1, 'exam/admin/platform/message/category', 'GET', '114.92.228.33', '[]', '2021-03-10 14:06:19', '2021-03-10 14:06:19');
INSERT INTO `exam_admin_operation_log` VALUES (471, 1, 'exam/admin/platform/message/category', 'GET', '114.92.228.33', '[]', '2021-03-10 14:06:47', '2021-03-10 14:06:47');
INSERT INTO `exam_admin_operation_log` VALUES (472, 1, 'exam/admin/platform/message/category', 'GET', '114.92.228.33', '[]', '2021-03-10 14:06:52', '2021-03-10 14:06:52');
INSERT INTO `exam_admin_operation_log` VALUES (473, 1, 'exam/admin/wechat/user', 'GET', '114.92.228.33', '{\"_pjax\":\"#pjax-container\"}', '2021-03-10 22:25:45', '2021-03-10 22:25:45');
INSERT INTO `exam_admin_operation_log` VALUES (474, 1, 'exam/admin/exam/search/history', 'GET', '114.92.228.33', '{\"_pjax\":\"#pjax-container\"}', '2021-03-10 22:27:35', '2021-03-10 22:27:35');
INSERT INTO `exam_admin_operation_log` VALUES (475, 1, 'exam/admin/auth/logs', 'GET', '114.92.228.33', '{\"_pjax\":\"#pjax-container\"}', '2021-03-10 22:27:40', '2021-03-10 22:27:40');
INSERT INTO `exam_admin_operation_log` VALUES (476, 1, 'exam/admin/auth/logs', 'GET', '114.92.228.33', '{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}', '2021-03-10 22:28:10', '2021-03-10 22:28:10');
INSERT INTO `exam_admin_operation_log` VALUES (477, 1, 'exam/admin/auth/menu', 'GET', '114.92.228.33', '{\"_pjax\":\"#pjax-container\"}', '2021-03-10 22:28:16', '2021-03-10 22:28:16');
INSERT INTO `exam_admin_operation_log` VALUES (478, 1, 'exam/admin/exam/tag', 'GET', '114.92.228.33', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 00:12:11', '2021-03-11 00:12:11');
INSERT INTO `exam_admin_operation_log` VALUES (479, 1, 'exam/admin/auth/roles', 'GET', '114.92.228.33', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 00:12:15', '2021-03-11 00:12:15');
INSERT INTO `exam_admin_operation_log` VALUES (480, 1, 'exam/admin/auth/roles', 'GET', '114.92.228.33', '[]', '2021-03-11 00:13:07', '2021-03-11 00:13:07');
INSERT INTO `exam_admin_operation_log` VALUES (481, 1, 'exam/admin/auth/menu', 'GET', '114.92.228.33', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 00:13:11', '2021-03-11 00:13:11');
INSERT INTO `exam_admin_operation_log` VALUES (482, 1, 'exam/admin/wechat/user', 'GET', '114.92.228.33', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 00:13:16', '2021-03-11 00:13:16');
INSERT INTO `exam_admin_operation_log` VALUES (483, 1, 'exam/admin/wechat/user', 'GET', '114.92.228.33', '{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}', '2021-03-11 00:13:20', '2021-03-11 00:13:20');
INSERT INTO `exam_admin_operation_log` VALUES (484, 1, 'exam/admin', 'GET', '172.18.0.1', '[]', '2021-03-11 00:19:04', '2021-03-11 00:19:04');
INSERT INTO `exam_admin_operation_log` VALUES (485, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 00:19:11', '2021-03-11 00:19:11');
INSERT INTO `exam_admin_operation_log` VALUES (486, 1, 'exam/admin/auth/roles', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 00:19:13', '2021-03-11 00:19:13');
INSERT INTO `exam_admin_operation_log` VALUES (487, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 00:19:15', '2021-03-11 00:19:15');
INSERT INTO `exam_admin_operation_log` VALUES (488, 1, 'exam/admin/wechat/user', 'GET', '114.92.228.33', '{\"page\":\"2\"}', '2021-03-11 00:21:10', '2021-03-11 00:21:10');
INSERT INTO `exam_admin_operation_log` VALUES (489, 1, 'exam/admin/wechat/user', 'GET', '114.92.228.33', '{\"page\":\"2\"}', '2021-03-11 00:21:42', '2021-03-11 00:21:42');
INSERT INTO `exam_admin_operation_log` VALUES (490, 1, 'exam/admin/wechat/user', 'GET', '114.92.228.33', '{\"page\":\"2\"}', '2021-03-11 00:21:46', '2021-03-11 00:21:46');
INSERT INTO `exam_admin_operation_log` VALUES (491, 1, 'exam/admin/auth/menu', 'GET', '114.92.228.33', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 00:21:51', '2021-03-11 00:21:51');
INSERT INTO `exam_admin_operation_log` VALUES (492, 1, 'exam/admin/auth/setting', 'GET', '114.92.228.33', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 00:21:55', '2021-03-11 00:21:55');
INSERT INTO `exam_admin_operation_log` VALUES (493, 1, 'exam/admin/wechat/user', 'GET', '114.92.228.33', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 00:21:59', '2021-03-11 00:21:59');
INSERT INTO `exam_admin_operation_log` VALUES (494, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 00:22:57', '2021-03-11 00:22:57');
INSERT INTO `exam_admin_operation_log` VALUES (495, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 20:39:03', '2021-03-11 20:39:03');
INSERT INTO `exam_admin_operation_log` VALUES (496, 1, 'exam/admin/platform/banner/2/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 20:39:06', '2021-03-11 20:39:06');
INSERT INTO `exam_admin_operation_log` VALUES (497, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '[]', '2021-03-11 20:39:06', '2021-03-11 20:39:06');
INSERT INTO `exam_admin_operation_log` VALUES (498, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '[]', '2021-03-11 20:40:23', '2021-03-11 20:40:23');
INSERT INTO `exam_admin_operation_log` VALUES (499, 1, 'exam/admin/platform/banner/2/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 20:40:27', '2021-03-11 20:40:27');
INSERT INTO `exam_admin_operation_log` VALUES (500, 1, 'exam/admin/platform/banner/2', 'PUT', '172.18.0.1', '{\"uuid\":\"C1863440-7120-6C8E-8E6F-5F2802D759EB\",\"position\":\"2\",\"title\":\"Redis\\u4e8b\\u52a1\\u5904\\u7406\\u673a\\u5236\\u5206\\u6790\\u4e0e\\u603b\\u7ed3\",\"url\":null,\"is_show\":\"on\",\"orders\":\"0\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/platform\\/banner\"}', '2021-03-11 20:40:30', '2021-03-11 20:40:30');
INSERT INTO `exam_admin_operation_log` VALUES (501, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '[]', '2021-03-11 20:40:31', '2021-03-11 20:40:31');
INSERT INTO `exam_admin_operation_log` VALUES (502, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '[]', '2021-03-11 20:40:34', '2021-03-11 20:40:34');
INSERT INTO `exam_admin_operation_log` VALUES (503, 1, 'exam/admin/platform/banner/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 20:40:49', '2021-03-11 20:40:49');
INSERT INTO `exam_admin_operation_log` VALUES (504, 1, 'exam/admin/platform/banner/1', 'PUT', '172.18.0.1', '{\"uuid\":\"130b87fe09eafd60658aa26555e8ce68\",\"position\":\"2\",\"title\":\"Redis\\u5b9e\\u73b0\\u5217\\u8868\\u6570\\u636e\\u67e5\\u8be2\\u8bbe\\u8ba1\",\"url\":null,\"is_show\":\"on\",\"orders\":\"10\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/platform\\/banner\"}', '2021-03-11 20:40:54', '2021-03-11 20:40:54');
INSERT INTO `exam_admin_operation_log` VALUES (505, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '[]', '2021-03-11 20:40:55', '2021-03-11 20:40:55');
INSERT INTO `exam_admin_operation_log` VALUES (506, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 21:05:10', '2021-03-11 21:05:10');
INSERT INTO `exam_admin_operation_log` VALUES (507, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Admin_Exam_SearchHistory\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_action\":\"App_Admin_Actions_Common_ShowStatus\"}', '2021-03-11 21:05:14', '2021-03-11 21:05:14');
INSERT INTO `exam_admin_operation_log` VALUES (508, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 21:05:14', '2021-03-11 21:05:14');
INSERT INTO `exam_admin_operation_log` VALUES (509, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-11 21:05:18', '2021-03-11 21:05:18');
INSERT INTO `exam_admin_operation_log` VALUES (510, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-11 21:24:16', '2021-03-11 21:24:16');
INSERT INTO `exam_admin_operation_log` VALUES (511, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-11 21:24:38', '2021-03-11 21:24:38');
INSERT INTO `exam_admin_operation_log` VALUES (512, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-11 21:35:02', '2021-03-11 21:35:02');
INSERT INTO `exam_admin_operation_log` VALUES (513, 1, 'exam/admin/exam/search/history/4/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 21:35:05', '2021-03-11 21:35:05');
INSERT INTO `exam_admin_operation_log` VALUES (514, 1, 'exam/admin/exam/search/history/4', 'PUT', '172.18.0.1', '{\"title\":\"\\u9ad8\\u8003\",\"is_show\":\"on\",\"position\":\"2\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/search\\/history\"}', '2021-03-11 21:35:09', '2021-03-11 21:35:09');
INSERT INTO `exam_admin_operation_log` VALUES (515, 1, 'exam/admin/exam/search/history/4/edit', 'GET', '172.18.0.1', '[]', '2021-03-11 21:35:10', '2021-03-11 21:35:10');
INSERT INTO `exam_admin_operation_log` VALUES (516, 1, 'exam/admin/exam/search/history/4', 'PUT', '172.18.0.1', '{\"title\":\"\\u9ad8\\u8003\",\"is_show\":\"on\",\"position\":\"2\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\"}', '2021-03-11 21:36:03', '2021-03-11 21:36:03');
INSERT INTO `exam_admin_operation_log` VALUES (517, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-11 21:36:03', '2021-03-11 21:36:03');
INSERT INTO `exam_admin_operation_log` VALUES (518, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-11 21:36:44', '2021-03-11 21:36:44');
INSERT INTO `exam_admin_operation_log` VALUES (519, 1, 'exam/admin/exam/search/history/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 21:36:49', '2021-03-11 21:36:49');
INSERT INTO `exam_admin_operation_log` VALUES (520, 1, 'exam/admin/exam/search/history/1', 'PUT', '172.18.0.1', '{\"title\":\"1\",\"is_show\":\"on\",\"position\":\"2\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/search\\/history\"}', '2021-03-11 21:36:53', '2021-03-11 21:36:53');
INSERT INTO `exam_admin_operation_log` VALUES (521, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-11 21:36:53', '2021-03-11 21:36:53');
INSERT INTO `exam_admin_operation_log` VALUES (522, 1, 'exam/admin/exam/search/history/6/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 21:36:57', '2021-03-11 21:36:57');
INSERT INTO `exam_admin_operation_log` VALUES (523, 1, 'exam/admin/exam/search/history/6', 'PUT', '172.18.0.1', '{\"title\":\"\\u9ad8\\u4e09\\u8bed\\u6587\\u8bd5\\u9898\",\"is_show\":\"on\",\"position\":\"2\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/search\\/history\"}', '2021-03-11 21:37:00', '2021-03-11 21:37:00');
INSERT INTO `exam_admin_operation_log` VALUES (524, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-11 21:37:01', '2021-03-11 21:37:01');
INSERT INTO `exam_admin_operation_log` VALUES (525, 1, 'exam/admin/exam/search/history/2/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 21:41:05', '2021-03-11 21:41:05');
INSERT INTO `exam_admin_operation_log` VALUES (526, 1, 'exam/admin/exam/search/history/2', 'PUT', '172.18.0.1', '{\"title\":\"1\",\"is_show\":\"on\",\"position\":\"2\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/search\\/history\"}', '2021-03-11 21:41:08', '2021-03-11 21:41:08');
INSERT INTO `exam_admin_operation_log` VALUES (527, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-11 21:41:09', '2021-03-11 21:41:09');
INSERT INTO `exam_admin_operation_log` VALUES (528, 1, 'exam/admin/exam/search/history/8/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 21:41:14', '2021-03-11 21:41:14');
INSERT INTO `exam_admin_operation_log` VALUES (529, 1, 'exam/admin/exam/search/history/8', 'PUT', '172.18.0.1', '{\"title\":\"\\u5386\\u53f2\",\"is_show\":\"on\",\"position\":\"2\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/search\\/history\"}', '2021-03-11 21:41:18', '2021-03-11 21:41:18');
INSERT INTO `exam_admin_operation_log` VALUES (530, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-11 21:41:18', '2021-03-11 21:41:18');
INSERT INTO `exam_admin_operation_log` VALUES (531, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-11 21:42:03', '2021-03-11 21:42:03');
INSERT INTO `exam_admin_operation_log` VALUES (532, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '{\"title\":null,\"is_show\":null,\"position\":\"2\",\"_pjax\":\"#pjax-container\"}', '2021-03-11 21:42:06', '2021-03-11 21:42:06');
INSERT INTO `exam_admin_operation_log` VALUES (533, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\",\"title\":null,\"is_show\":null,\"position\":\"1\"}', '2021-03-11 21:42:09', '2021-03-11 21:42:09');
INSERT INTO `exam_admin_operation_log` VALUES (534, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 21:43:18', '2021-03-11 21:43:18');
INSERT INTO `exam_admin_operation_log` VALUES (535, 1, 'exam/admin/exam/category/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 21:43:21', '2021-03-11 21:43:21');
INSERT INTO `exam_admin_operation_log` VALUES (536, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 21:46:11', '2021-03-11 21:46:11');
INSERT INTO `exam_admin_operation_log` VALUES (537, 1, 'exam/admin/exam/category/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 21:46:15', '2021-03-11 21:46:15');
INSERT INTO `exam_admin_operation_log` VALUES (538, 1, 'exam/admin/exam/category/1', 'PUT', '172.18.0.1', '{\"uuid\":\"71fda9120b7112437696c1b8d017a17f\",\"parent_id\":\"0\",\"title\":\"\\u9ad8\\u4e2d\\u6559\\u80b2\",\"remark\":\"123\",\"is_show\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-11 21:46:21', '2021-03-11 21:46:21');
INSERT INTO `exam_admin_operation_log` VALUES (539, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-11 21:46:21', '2021-03-11 21:46:21');
INSERT INTO `exam_admin_operation_log` VALUES (540, 1, 'exam/admin/exam/category/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 21:46:23', '2021-03-11 21:46:23');
INSERT INTO `exam_admin_operation_log` VALUES (541, 1, 'exam/admin/exam/category', 'POST', '172.18.0.1', '{\"uuid\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"parent_id\":\"1\",\"title\":\"\\u6570\\u5b66\\u5b66\\u4e60\",\"remark\":null,\"is_show\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-11 21:46:36', '2021-03-11 21:46:36');
INSERT INTO `exam_admin_operation_log` VALUES (542, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-11 21:46:39', '2021-03-11 21:46:39');
INSERT INTO `exam_admin_operation_log` VALUES (543, 1, 'exam/admin/exam/category/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 21:46:40', '2021-03-11 21:46:40');
INSERT INTO `exam_admin_operation_log` VALUES (544, 1, 'exam/admin/exam/category', 'POST', '172.18.0.1', '{\"uuid\":\"FB5D6E18-50EB-038E-8E71-9C3E17698A9F\",\"parent_id\":\"1\",\"title\":\"\\u5386\\u53f2\\u5b66\\u4e60\",\"remark\":null,\"is_show\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-11 21:46:53', '2021-03-11 21:46:53');
INSERT INTO `exam_admin_operation_log` VALUES (545, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-11 21:46:54', '2021-03-11 21:46:54');
INSERT INTO `exam_admin_operation_log` VALUES (546, 1, 'exam/admin/exam/category/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 21:46:57', '2021-03-11 21:46:57');
INSERT INTO `exam_admin_operation_log` VALUES (547, 1, 'exam/admin/exam/category', 'POST', '172.18.0.1', '{\"uuid\":\"4174470B-320E-8E5E-5EDF-A71758F3B65C\",\"parent_id\":\"0\",\"title\":\"\\u5916\\u8bed\\u5b66\\u4e60\",\"remark\":null,\"is_show\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-11 21:47:06', '2021-03-11 21:47:06');
INSERT INTO `exam_admin_operation_log` VALUES (548, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-11 21:47:07', '2021-03-11 21:47:07');
INSERT INTO `exam_admin_operation_log` VALUES (549, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-11 21:53:55', '2021-03-11 21:53:55');
INSERT INTO `exam_admin_operation_log` VALUES (550, 1, 'exam/admin/exam/category/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 21:53:57', '2021-03-11 21:53:57');
INSERT INTO `exam_admin_operation_log` VALUES (551, 1, 'exam/admin/exam/category/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-11 21:54:21', '2021-03-11 21:54:21');
INSERT INTO `exam_admin_operation_log` VALUES (552, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 21:54:23', '2021-03-11 21:54:23');
INSERT INTO `exam_admin_operation_log` VALUES (553, 1, 'exam/admin/exam/category/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 21:54:25', '2021-03-11 21:54:25');
INSERT INTO `exam_admin_operation_log` VALUES (554, 1, 'exam/admin/exam/category/create', 'GET', '172.18.0.1', '[]', '2021-03-11 21:54:49', '2021-03-11 21:54:49');
INSERT INTO `exam_admin_operation_log` VALUES (555, 1, 'exam/admin/exam/category/create', 'GET', '172.18.0.1', '[]', '2021-03-11 21:55:38', '2021-03-11 21:55:38');
INSERT INTO `exam_admin_operation_log` VALUES (556, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 21:56:05', '2021-03-11 21:56:05');
INSERT INTO `exam_admin_operation_log` VALUES (557, 1, 'exam/admin/exam/category/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 21:56:07', '2021-03-11 21:56:07');
INSERT INTO `exam_admin_operation_log` VALUES (558, 1, 'exam/admin/exam/category/1', 'PUT', '172.18.0.1', '{\"uuid\":\"71fda9120b7112437696c1b8d017a17f\",\"parent_id\":null,\"title\":\"\\u9ad8\\u4e2d\\u6559\\u80b2\",\"remark\":\"123\",\"is_show\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-11 21:56:17', '2021-03-11 21:56:17');
INSERT INTO `exam_admin_operation_log` VALUES (559, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-11 21:56:18', '2021-03-11 21:56:18');
INSERT INTO `exam_admin_operation_log` VALUES (560, 1, 'exam/admin/exam/category/2/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 21:56:20', '2021-03-11 21:56:20');
INSERT INTO `exam_admin_operation_log` VALUES (561, 1, 'exam/admin/exam/category/2/edit', 'GET', '172.18.0.1', '[]', '2021-03-11 21:56:52', '2021-03-11 21:56:52');
INSERT INTO `exam_admin_operation_log` VALUES (562, 1, 'exam/admin/exam/category/2/edit', 'GET', '172.18.0.1', '[]', '2021-03-11 21:57:12', '2021-03-11 21:57:12');
INSERT INTO `exam_admin_operation_log` VALUES (563, 1, 'exam/admin/exam/category/2/edit', 'GET', '172.18.0.1', '[]', '2021-03-11 21:57:46', '2021-03-11 21:57:46');
INSERT INTO `exam_admin_operation_log` VALUES (564, 1, 'exam/admin/exam/category/2', 'PUT', '172.18.0.1', '{\"uuid\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"parent_id\":\"71\",\"title\":\"\\u6570\\u5b66\\u5b66\\u4e60\",\"remark\":null,\"is_show\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\"}', '2021-03-11 21:58:10', '2021-03-11 21:58:10');
INSERT INTO `exam_admin_operation_log` VALUES (565, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-11 21:58:10', '2021-03-11 21:58:10');
INSERT INTO `exam_admin_operation_log` VALUES (566, 1, 'exam/admin/exam/category/2/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 21:58:13', '2021-03-11 21:58:13');
INSERT INTO `exam_admin_operation_log` VALUES (567, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 21:58:15', '2021-03-11 21:58:15');
INSERT INTO `exam_admin_operation_log` VALUES (568, 1, 'exam/admin/exam/category/3/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 21:58:19', '2021-03-11 21:58:19');
INSERT INTO `exam_admin_operation_log` VALUES (569, 1, 'exam/admin/exam/category/3', 'PUT', '172.18.0.1', '{\"uuid\":\"FB5D6E18-50EB-038E-8E71-9C3E17698A9F\",\"parent_id\":\"71\",\"title\":\"\\u5386\\u53f2\\u5b66\\u4e60\",\"remark\":null,\"is_show\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-11 21:58:23', '2021-03-11 21:58:23');
INSERT INTO `exam_admin_operation_log` VALUES (570, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-11 21:58:23', '2021-03-11 21:58:23');
INSERT INTO `exam_admin_operation_log` VALUES (571, 1, 'exam/admin/exam/category/4/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 21:58:26', '2021-03-11 21:58:26');
INSERT INTO `exam_admin_operation_log` VALUES (572, 1, 'exam/admin/exam/category/4', 'PUT', '172.18.0.1', '{\"uuid\":\"4174470B-320E-8E5E-5EDF-A71758F3B65C\",\"parent_id\":\"71\",\"title\":\"\\u5916\\u8bed\\u5b66\\u4e60\",\"remark\":null,\"is_show\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-11 21:58:30', '2021-03-11 21:58:30');
INSERT INTO `exam_admin_operation_log` VALUES (573, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-11 21:58:31', '2021-03-11 21:58:31');
INSERT INTO `exam_admin_operation_log` VALUES (574, 1, 'exam/admin/exam/category/2/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 21:59:23', '2021-03-11 21:59:23');
INSERT INTO `exam_admin_operation_log` VALUES (575, 1, 'exam/admin/exam/category/2', 'PUT', '172.18.0.1', '{\"uuid\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"parent_id\":\"6\",\"title\":\"\\u6570\\u5b66\\u5b66\\u4e60\",\"remark\":null,\"is_show\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-11 21:59:27', '2021-03-11 21:59:27');
INSERT INTO `exam_admin_operation_log` VALUES (576, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-11 21:59:27', '2021-03-11 21:59:27');
INSERT INTO `exam_admin_operation_log` VALUES (577, 1, 'exam/admin/exam/category/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-11 22:00:32', '2021-03-11 22:00:32');
INSERT INTO `exam_admin_operation_log` VALUES (578, 1, 'exam/admin/exam/category/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-11 22:01:05', '2021-03-11 22:01:05');
INSERT INTO `exam_admin_operation_log` VALUES (579, 1, 'exam/admin/exam/category/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-11 22:01:14', '2021-03-11 22:01:14');
INSERT INTO `exam_admin_operation_log` VALUES (580, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 22:01:18', '2021-03-11 22:01:18');
INSERT INTO `exam_admin_operation_log` VALUES (581, 1, 'exam/admin/exam/category/2/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 22:01:20', '2021-03-11 22:01:20');
INSERT INTO `exam_admin_operation_log` VALUES (582, 1, 'exam/admin/exam/category/2', 'PUT', '172.18.0.1', '{\"uuid\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"parent_id\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDF\",\"title\":\"\\u6570\\u5b66\\u5b66\\u4e60\",\"remark\":null,\"is_show\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-11 22:01:24', '2021-03-11 22:01:24');
INSERT INTO `exam_admin_operation_log` VALUES (583, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-11 22:01:25', '2021-03-11 22:01:25');
INSERT INTO `exam_admin_operation_log` VALUES (584, 1, 'exam/admin/exam/category/3/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 22:01:28', '2021-03-11 22:01:28');
INSERT INTO `exam_admin_operation_log` VALUES (585, 1, 'exam/admin/exam/category/3', 'PUT', '172.18.0.1', '{\"uuid\":\"FB5D6E18-50EB-038E-8E71-9C3E17698A9F\",\"parent_id\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDF\",\"title\":\"\\u5386\\u53f2\\u5b66\\u4e60\",\"remark\":null,\"is_show\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-11 22:01:31', '2021-03-11 22:01:31');
INSERT INTO `exam_admin_operation_log` VALUES (586, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-11 22:01:32', '2021-03-11 22:01:32');
INSERT INTO `exam_admin_operation_log` VALUES (587, 1, 'exam/admin/exam/category/4/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 22:01:34', '2021-03-11 22:01:34');
INSERT INTO `exam_admin_operation_log` VALUES (588, 1, 'exam/admin/exam/category/4', 'PUT', '172.18.0.1', '{\"uuid\":\"4174470B-320E-8E5E-5EDF-A71758F3B65C\",\"parent_id\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDF\",\"title\":\"\\u5916\\u8bed\\u5b66\\u4e60\",\"remark\":null,\"is_show\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-11 22:01:36', '2021-03-11 22:01:36');
INSERT INTO `exam_admin_operation_log` VALUES (589, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-11 22:01:37', '2021-03-11 22:01:37');
INSERT INTO `exam_admin_operation_log` VALUES (590, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 22:27:54', '2021-03-11 22:27:54');
INSERT INTO `exam_admin_operation_log` VALUES (591, 1, 'exam/admin/platform/banner/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 22:27:56', '2021-03-11 22:27:56');
INSERT INTO `exam_admin_operation_log` VALUES (592, 1, 'exam/admin/platform/banner', 'POST', '172.18.0.1', '{\"uuid\":\"A5DEB43E-4573-0B9D-9D1C-B223AD091B34\",\"position\":\"4\",\"title\":\"\\u73a9\\u8f6cdnmp\\u4e4bport\\u7bc7\",\"url\":\"https:\\/\\/www.runoob.com\\/\",\"is_show\":\"on\",\"orders\":\"0\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/platform\\/banner\"}', '2021-03-11 22:28:08', '2021-03-11 22:28:08');
INSERT INTO `exam_admin_operation_log` VALUES (593, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '[]', '2021-03-11 22:28:08', '2021-03-11 22:28:08');
INSERT INTO `exam_admin_operation_log` VALUES (594, 1, 'exam/admin/platform/banner/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 22:28:10', '2021-03-11 22:28:10');
INSERT INTO `exam_admin_operation_log` VALUES (595, 1, 'exam/admin/platform/banner', 'POST', '172.18.0.1', '{\"uuid\":\"A8C816B2-B0A0-130D-0D12-2144F4277C64\",\"position\":\"4\",\"title\":\"\\u73a9\\u8f6cdnmp\\u4e4bport\\u7bc7\",\"url\":null,\"is_show\":\"on\",\"orders\":\"2\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/platform\\/banner\"}', '2021-03-11 22:28:21', '2021-03-11 22:28:21');
INSERT INTO `exam_admin_operation_log` VALUES (596, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '[]', '2021-03-11 22:28:22', '2021-03-11 22:28:22');
INSERT INTO `exam_admin_operation_log` VALUES (597, 1, 'exam/admin/platform/banner/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 22:28:24', '2021-03-11 22:28:24');
INSERT INTO `exam_admin_operation_log` VALUES (598, 1, 'exam/admin/platform/banner', 'POST', '172.18.0.1', '{\"uuid\":\"DC411D67-D00D-D500-00EC-505217ADA238\",\"position\":\"4\",\"title\":\"\\u73a9\\u8f6cdnmp\\u4e4bport\\u7bc7\",\"url\":null,\"is_show\":\"on\",\"orders\":\"1\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/platform\\/banner\"}', '2021-03-11 22:28:34', '2021-03-11 22:28:34');
INSERT INTO `exam_admin_operation_log` VALUES (599, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '[]', '2021-03-11 22:28:36', '2021-03-11 22:28:36');
INSERT INTO `exam_admin_operation_log` VALUES (600, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 22:48:04', '2021-03-11 22:48:04');
INSERT INTO `exam_admin_operation_log` VALUES (601, 1, 'exam/admin/platform/banner/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 22:48:07', '2021-03-11 22:48:07');
INSERT INTO `exam_admin_operation_log` VALUES (602, 1, 'exam/admin/platform/banner', 'POST', '172.18.0.1', '{\"uuid\":\"44980D4F-4CE5-CD7E-7E4C-1184688DDC13\",\"position\":\"1\",\"title\":\"\\u73a9\\u8f6cdnmp\\u4e4bport\\u7bc7\",\"url\":null,\"is_show\":\"on\",\"orders\":\"0\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/platform\\/banner\"}', '2021-03-11 22:48:22', '2021-03-11 22:48:22');
INSERT INTO `exam_admin_operation_log` VALUES (603, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '[]', '2021-03-11 22:48:24', '2021-03-11 22:48:24');
INSERT INTO `exam_admin_operation_log` VALUES (604, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '[]', '2021-03-11 22:48:43', '2021-03-11 22:48:43');
INSERT INTO `exam_admin_operation_log` VALUES (605, 1, 'exam/admin/platform/banner/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 22:48:45', '2021-03-11 22:48:45');
INSERT INTO `exam_admin_operation_log` VALUES (606, 1, 'exam/admin/platform/banner', 'POST', '172.18.0.1', '{\"uuid\":\"6325A538-A704-51F1-F16E-C3221AED1E9D\",\"position\":\"1\",\"title\":\"\\u73a9\\u8f6cdnmp\\u4e4bport\\u7bc7\",\"url\":null,\"is_show\":\"on\",\"orders\":\"0\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/platform\\/banner\"}', '2021-03-11 22:48:55', '2021-03-11 22:48:55');
INSERT INTO `exam_admin_operation_log` VALUES (607, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '[]', '2021-03-11 22:48:55', '2021-03-11 22:48:55');
INSERT INTO `exam_admin_operation_log` VALUES (608, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 22:56:05', '2021-03-11 22:56:05');
INSERT INTO `exam_admin_operation_log` VALUES (609, 1, 'exam/admin/exam/search/history/7/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 22:56:09', '2021-03-11 22:56:09');
INSERT INTO `exam_admin_operation_log` VALUES (610, 1, 'exam/admin/exam/search/history/7', 'PUT', '172.18.0.1', '{\"title\":\"\\u5386\\u53f2\",\"is_show\":\"on\",\"position\":\"1\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/search\\/history\"}', '2021-03-11 22:56:14', '2021-03-11 22:56:14');
INSERT INTO `exam_admin_operation_log` VALUES (611, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-11 22:56:15', '2021-03-11 22:56:15');
INSERT INTO `exam_admin_operation_log` VALUES (612, 1, 'exam/admin/exam/search/history/5/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 22:56:18', '2021-03-11 22:56:18');
INSERT INTO `exam_admin_operation_log` VALUES (613, 1, 'exam/admin/exam/search/history/5', 'PUT', '172.18.0.1', '{\"title\":\"\\u5386\\u53f2\",\"is_show\":\"on\",\"position\":\"1\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/search\\/history\"}', '2021-03-11 22:56:21', '2021-03-11 22:56:21');
INSERT INTO `exam_admin_operation_log` VALUES (614, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-11 22:56:21', '2021-03-11 22:56:21');
INSERT INTO `exam_admin_operation_log` VALUES (615, 1, 'exam/admin/exam/search/history/3/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 22:56:23', '2021-03-11 22:56:23');
INSERT INTO `exam_admin_operation_log` VALUES (616, 1, 'exam/admin/exam/search/history/3', 'PUT', '172.18.0.1', '{\"title\":\"45\",\"is_show\":\"on\",\"position\":\"1\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/search\\/history\"}', '2021-03-11 22:56:27', '2021-03-11 22:56:27');
INSERT INTO `exam_admin_operation_log` VALUES (617, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-11 22:56:27', '2021-03-11 22:56:27');
INSERT INTO `exam_admin_operation_log` VALUES (618, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 23:43:44', '2021-03-11 23:43:44');
INSERT INTO `exam_admin_operation_log` VALUES (619, 1, 'exam/admin/exam/category/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 23:43:48', '2021-03-11 23:43:48');
INSERT INTO `exam_admin_operation_log` VALUES (620, 1, 'exam/admin/exam/category/1', 'PUT', '172.18.0.1', '{\"uuid\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDF\",\"parent_id\":null,\"title\":\"\\u9ad8\\u4e2d\\u6559\\u80b2\",\"orders\":\"0\",\"remark\":\"123\",\"is_show\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-11 23:44:26', '2021-03-11 23:44:26');
INSERT INTO `exam_admin_operation_log` VALUES (621, 1, 'exam/admin/exam/category/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-11 23:44:28', '2021-03-11 23:44:28');
INSERT INTO `exam_admin_operation_log` VALUES (622, 1, 'exam/admin/exam/category/1', 'PUT', '172.18.0.1', '{\"uuid\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDF\",\"parent_id\":null,\"title\":\"\\u9ad8\\u4e2d\\u6559\\u80b2\",\"orders\":\"0\",\"remark\":\"123\",\"is_show\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\"}', '2021-03-11 23:44:39', '2021-03-11 23:44:39');
INSERT INTO `exam_admin_operation_log` VALUES (623, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-11 23:44:40', '2021-03-11 23:44:40');
INSERT INTO `exam_admin_operation_log` VALUES (624, 1, 'exam/admin/exam/category/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 23:44:45', '2021-03-11 23:44:45');
INSERT INTO `exam_admin_operation_log` VALUES (625, 1, 'exam/admin/exam/category/1', 'PUT', '172.18.0.1', '{\"uuid\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDF\",\"parent_id\":null,\"title\":\"\\u9ad8\\u4e2d\\u6559\\u80b2\",\"orders\":\"0\",\"remark\":\"123\",\"is_show\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-11 23:44:59', '2021-03-11 23:44:59');
INSERT INTO `exam_admin_operation_log` VALUES (626, 1, 'exam/admin/exam/category/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-11 23:45:01', '2021-03-11 23:45:01');
INSERT INTO `exam_admin_operation_log` VALUES (627, 1, 'exam/admin/exam/category/1', 'PUT', '172.18.0.1', '{\"uuid\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDF\",\"parent_id\":null,\"title\":\"\\u9ad8\\u4e2d\\u6559\\u80b2\",\"orders\":\"0\",\"remark\":\"123\",\"is_show\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\"}', '2021-03-11 23:45:04', '2021-03-11 23:45:04');
INSERT INTO `exam_admin_operation_log` VALUES (628, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-11 23:45:04', '2021-03-11 23:45:04');
INSERT INTO `exam_admin_operation_log` VALUES (629, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-11 23:47:39', '2021-03-11 23:47:39');
INSERT INTO `exam_admin_operation_log` VALUES (630, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-11 23:47:59', '2021-03-11 23:47:59');
INSERT INTO `exam_admin_operation_log` VALUES (631, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-11 23:48:28', '2021-03-11 23:48:28');
INSERT INTO `exam_admin_operation_log` VALUES (632, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-11 23:48:43', '2021-03-11 23:48:43');
INSERT INTO `exam_admin_operation_log` VALUES (633, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-11 23:49:13', '2021-03-11 23:49:13');
INSERT INTO `exam_admin_operation_log` VALUES (634, 1, 'exam/admin/exam/category/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 23:49:18', '2021-03-11 23:49:18');
INSERT INTO `exam_admin_operation_log` VALUES (635, 1, 'exam/admin/exam/category/1', 'PUT', '172.18.0.1', '{\"uuid\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDF\",\"parent_id\":null,\"title\":\"\\u9ad8\\u4e2d\\u6559\\u80b2\",\"orders\":\"0\",\"remark\":\"123\",\"is_show\":\"on\",\"is_home\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-11 23:49:22', '2021-03-11 23:49:22');
INSERT INTO `exam_admin_operation_log` VALUES (636, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-11 23:49:22', '2021-03-11 23:49:22');
INSERT INTO `exam_admin_operation_log` VALUES (637, 1, 'exam/admin/exam/category/2/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 23:49:25', '2021-03-11 23:49:25');
INSERT INTO `exam_admin_operation_log` VALUES (638, 1, 'exam/admin/exam/category/2', 'PUT', '172.18.0.1', '{\"uuid\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"parent_id\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDF\",\"title\":\"\\u6570\\u5b66\\u5b66\\u4e60\",\"orders\":\"0\",\"remark\":null,\"is_show\":\"on\",\"is_home\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-11 23:49:34', '2021-03-11 23:49:34');
INSERT INTO `exam_admin_operation_log` VALUES (639, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-11 23:49:35', '2021-03-11 23:49:35');
INSERT INTO `exam_admin_operation_log` VALUES (640, 1, 'exam/admin/exam/category/3/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 23:49:37', '2021-03-11 23:49:37');
INSERT INTO `exam_admin_operation_log` VALUES (641, 1, 'exam/admin/exam/category/3/edit', 'GET', '172.18.0.1', '[]', '2021-03-11 23:49:48', '2021-03-11 23:49:48');
INSERT INTO `exam_admin_operation_log` VALUES (642, 1, 'exam/admin/exam/category/3', 'PUT', '172.18.0.1', '{\"uuid\":\"FB5D6E18-50EB-038E-8E71-9C3E17698A9F\",\"parent_id\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDF\",\"title\":\"\\u5386\\u53f2\\u5b66\\u4e60\",\"orders\":\"0\",\"remark\":null,\"is_show\":\"on\",\"is_home\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-11 23:49:55', '2021-03-11 23:49:55');
INSERT INTO `exam_admin_operation_log` VALUES (643, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-11 23:49:56', '2021-03-11 23:49:56');
INSERT INTO `exam_admin_operation_log` VALUES (644, 1, 'exam/admin/exam/category/4/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 23:49:59', '2021-03-11 23:49:59');
INSERT INTO `exam_admin_operation_log` VALUES (645, 1, 'exam/admin/exam/category/4', 'PUT', '172.18.0.1', '{\"uuid\":\"4174470B-320E-8E5E-5EDF-A71758F3B65C\",\"parent_id\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDF\",\"title\":\"\\u5916\\u8bed\\u5b66\\u4e60\",\"orders\":\"0\",\"remark\":null,\"is_show\":\"on\",\"is_home\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-11 23:50:08', '2021-03-11 23:50:08');
INSERT INTO `exam_admin_operation_log` VALUES (646, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-11 23:50:09', '2021-03-11 23:50:09');
INSERT INTO `exam_admin_operation_log` VALUES (647, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-11 23:50:28', '2021-03-11 23:50:28');
INSERT INTO `exam_admin_operation_log` VALUES (648, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-11 23:56:56', '2021-03-11 23:56:56');
INSERT INTO `exam_admin_operation_log` VALUES (649, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-12 00:14:00', '2021-03-12 00:14:00');
INSERT INTO `exam_admin_operation_log` VALUES (650, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-12 00:18:13', '2021-03-12 00:18:13');
INSERT INTO `exam_admin_operation_log` VALUES (651, 1, 'exam/admin/exam/category/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-12 00:18:20', '2021-03-12 00:18:20');
INSERT INTO `exam_admin_operation_log` VALUES (652, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-12 00:18:42', '2021-03-12 00:18:42');
INSERT INTO `exam_admin_operation_log` VALUES (653, 1, 'exam/admin/exam/category/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-12 00:18:43', '2021-03-12 00:18:43');
INSERT INTO `exam_admin_operation_log` VALUES (654, 1, 'exam/admin/exam/category', 'POST', '172.18.0.1', '{\"uuid\":\"60CA1FCF-F8EB-2DE1-E1DB-5DDB8D0CED89\",\"parent_id\":null,\"title\":\"\\u521d\\u4e2d\\u6559\\u80b2\",\"orders\":\"0\",\"remark\":null,\"is_show\":\"on\",\"is_home\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-12 00:19:05', '2021-03-12 00:19:05');
INSERT INTO `exam_admin_operation_log` VALUES (655, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-12 00:19:07', '2021-03-12 00:19:07');
INSERT INTO `exam_admin_operation_log` VALUES (656, 1, 'exam/admin/exam/category/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-12 00:19:09', '2021-03-12 00:19:09');
INSERT INTO `exam_admin_operation_log` VALUES (657, 1, 'exam/admin/exam/category/1', 'PUT', '172.18.0.1', '{\"uuid\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDF\",\"parent_id\":null,\"title\":\"\\u9ad8\\u4e2d\\u6559\\u80b2\",\"orders\":\"0\",\"remark\":\"123\",\"is_show\":\"on\",\"is_home\":\"off\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-12 00:19:13', '2021-03-12 00:19:13');
INSERT INTO `exam_admin_operation_log` VALUES (658, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-12 00:19:13', '2021-03-12 00:19:13');
INSERT INTO `exam_admin_operation_log` VALUES (659, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-12 00:19:16', '2021-03-12 00:19:16');
INSERT INTO `exam_admin_operation_log` VALUES (660, 1, 'exam/admin/exam/category/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-12 00:19:50', '2021-03-12 00:19:50');
INSERT INTO `exam_admin_operation_log` VALUES (661, 1, 'exam/admin/exam/category', 'POST', '172.18.0.1', '{\"uuid\":\"B7723424-2516-6479-799C-48147489616F\",\"parent_id\":\"60CA1FCF-F8EB-2DE1-E1DB-5DDB8D0CED89\",\"title\":\"\\u6570\\u5b66\\u5b66\\u4e60\",\"orders\":\"0\",\"remark\":null,\"is_show\":\"on\",\"is_home\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-12 00:20:18', '2021-03-12 00:20:18');
INSERT INTO `exam_admin_operation_log` VALUES (662, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-12 00:20:19', '2021-03-12 00:20:19');
INSERT INTO `exam_admin_operation_log` VALUES (663, 1, 'exam/admin/exam/category/5/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-12 00:20:21', '2021-03-12 00:20:21');
INSERT INTO `exam_admin_operation_log` VALUES (664, 1, 'exam/admin/exam/category/5', 'PUT', '172.18.0.1', '{\"uuid\":\"60CA1FCF-F8EB-2DE1-E1DB-5DDB8D0CED89\",\"parent_id\":null,\"title\":\"\\u521d\\u4e2d\\u6559\\u80b2\",\"orders\":\"0\",\"remark\":null,\"is_show\":\"on\",\"is_home\":\"off\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-12 00:20:25', '2021-03-12 00:20:25');
INSERT INTO `exam_admin_operation_log` VALUES (665, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-12 00:20:25', '2021-03-12 00:20:25');
INSERT INTO `exam_admin_operation_log` VALUES (666, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-12 00:20:28', '2021-03-12 00:20:28');
INSERT INTO `exam_admin_operation_log` VALUES (667, 1, 'exam/admin/exam/category/6/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-12 00:20:30', '2021-03-12 00:20:30');
INSERT INTO `exam_admin_operation_log` VALUES (668, 1, 'exam/admin/exam/category/6', 'PUT', '172.18.0.1', '{\"uuid\":\"B7723424-2516-6479-799C-48147489616F\",\"parent_id\":\"60CA1FCF-F8EB-2DE1-E1DB-5DDB8D0CED89\",\"title\":\"\\u6570\\u5b66\\u5b66\\u4e60\",\"orders\":\"0\",\"remark\":null,\"is_show\":\"on\",\"is_home\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-12 00:20:38', '2021-03-12 00:20:38');
INSERT INTO `exam_admin_operation_log` VALUES (669, 1, 'exam/admin/exam/category/6/edit', 'GET', '172.18.0.1', '[]', '2021-03-12 00:20:39', '2021-03-12 00:20:39');
INSERT INTO `exam_admin_operation_log` VALUES (670, 1, 'exam/admin/exam/category/6', 'PUT', '172.18.0.1', '{\"uuid\":\"B7723424-2516-6479-799C-48147489616F\",\"parent_id\":\"60CA1FCF-F8EB-2DE1-E1DB-5DDB8D0CED89\",\"title\":\"\\u6570\\u5b66\\u5b66\\u4e60\",\"orders\":\"0\",\"remark\":null,\"is_show\":\"on\",\"is_home\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\"}', '2021-03-12 00:21:00', '2021-03-12 00:21:00');
INSERT INTO `exam_admin_operation_log` VALUES (671, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-12 00:21:00', '2021-03-12 00:21:00');
INSERT INTO `exam_admin_operation_log` VALUES (672, 1, 'exam/admin/exam/category/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-12 00:21:06', '2021-03-12 00:21:06');
INSERT INTO `exam_admin_operation_log` VALUES (673, 1, 'exam/admin/exam/category', 'POST', '172.18.0.1', '{\"uuid\":\"3EDC7F23-1329-1B4A-4AEC-009768BD627C\",\"parent_id\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDF\",\"title\":\"\\u7269\\u7406\",\"orders\":\"0\",\"remark\":null,\"is_show\":\"on\",\"is_home\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-12 00:21:27', '2021-03-12 00:21:27');
INSERT INTO `exam_admin_operation_log` VALUES (674, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-12 00:21:28', '2021-03-12 00:21:28');
INSERT INTO `exam_admin_operation_log` VALUES (675, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-12 00:23:14', '2021-03-12 00:23:14');
INSERT INTO `exam_admin_operation_log` VALUES (676, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-12 00:23:15', '2021-03-12 00:23:15');
INSERT INTO `exam_admin_operation_log` VALUES (677, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-12 00:23:15', '2021-03-12 00:23:15');
INSERT INTO `exam_admin_operation_log` VALUES (678, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-12 00:23:18', '2021-03-12 00:23:18');
INSERT INTO `exam_admin_operation_log` VALUES (679, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-12 00:24:02', '2021-03-12 00:24:02');
INSERT INTO `exam_admin_operation_log` VALUES (680, 1, 'exam/admin/exam/category/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-12 00:24:04', '2021-03-12 00:24:04');
INSERT INTO `exam_admin_operation_log` VALUES (681, 1, 'exam/admin/exam/category', 'POST', '172.18.0.1', '{\"uuid\":\"7B958AC1-1BF8-2251-5157-EECA9E8A56DB\",\"parent_id\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDF\",\"title\":\"123123\",\"orders\":\"0\",\"remark\":null,\"is_show\":\"on\",\"is_home\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-12 00:24:26', '2021-03-12 00:24:26');
INSERT INTO `exam_admin_operation_log` VALUES (682, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-12 00:24:27', '2021-03-12 00:24:27');
INSERT INTO `exam_admin_operation_log` VALUES (683, 1, 'exam/admin/exam/category/4/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-12 00:24:30', '2021-03-12 00:24:30');
INSERT INTO `exam_admin_operation_log` VALUES (684, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-12 00:24:35', '2021-03-12 00:24:35');
INSERT INTO `exam_admin_operation_log` VALUES (685, 1, 'exam/admin/exam/category/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-12 00:24:40', '2021-03-12 00:24:40');
INSERT INTO `exam_admin_operation_log` VALUES (686, 1, 'exam/admin/exam/category/1', 'PUT', '172.18.0.1', '{\"uuid\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDF\",\"parent_id\":null,\"title\":\"\\u9ad8\\u4e2d\\u6559\\u80b2\",\"orders\":\"0\",\"remark\":\"123\",\"is_show\":\"on\",\"is_home\":\"off\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-12 00:24:47', '2021-03-12 00:24:47');
INSERT INTO `exam_admin_operation_log` VALUES (687, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-12 00:24:48', '2021-03-12 00:24:48');
INSERT INTO `exam_admin_operation_log` VALUES (688, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-12 00:31:17', '2021-03-12 00:31:17');
INSERT INTO `exam_admin_operation_log` VALUES (689, 1, 'exam/admin/exam/category/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-12 00:31:22', '2021-03-12 00:31:22');
INSERT INTO `exam_admin_operation_log` VALUES (690, 1, 'exam/admin/exam/category/1', 'PUT', '172.18.0.1', '{\"uuid\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDF\",\"parent_id\":null,\"title\":\"\\u9ad8\\u4e2d\\u6559\\u80b2\",\"orders\":\"0\",\"remark\":\"123\",\"is_show\":\"on\",\"is_home\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-12 00:31:26', '2021-03-12 00:31:26');
INSERT INTO `exam_admin_operation_log` VALUES (691, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-12 00:31:27', '2021-03-12 00:31:27');
INSERT INTO `exam_admin_operation_log` VALUES (692, 1, 'exam/admin/exam/category/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-12 00:31:30', '2021-03-12 00:31:30');
INSERT INTO `exam_admin_operation_log` VALUES (693, 1, 'exam/admin/exam/category/1', 'PUT', '172.18.0.1', '{\"uuid\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDF\",\"parent_id\":null,\"title\":\"\\u9ad8\\u4e2d\\u6559\\u80b2\",\"orders\":\"0\",\"remark\":\"123\",\"is_show\":\"on\",\"is_home\":\"off\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-12 00:31:34', '2021-03-12 00:31:34');
INSERT INTO `exam_admin_operation_log` VALUES (694, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-12 00:31:34', '2021-03-12 00:31:34');
INSERT INTO `exam_admin_operation_log` VALUES (695, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-12 00:32:43', '2021-03-12 00:32:43');
INSERT INTO `exam_admin_operation_log` VALUES (696, 1, 'exam/admin/exam/category/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-12 00:32:46', '2021-03-12 00:32:46');
INSERT INTO `exam_admin_operation_log` VALUES (697, 1, 'exam/admin/exam/category/1', 'PUT', '172.18.0.1', '{\"uuid\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDF\",\"parent_id\":null,\"title\":\"\\u9ad8\\u4e2d\\u6559\\u80b2\",\"orders\":\"0\",\"remark\":\"123\",\"is_show\":\"on\",\"is_home\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-12 00:32:50', '2021-03-12 00:32:50');
INSERT INTO `exam_admin_operation_log` VALUES (698, 1, 'exam/admin/exam/category/1', 'GET', '172.18.0.1', '[]', '2021-03-12 00:33:16', '2021-03-12 00:33:16');
INSERT INTO `exam_admin_operation_log` VALUES (699, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-12 00:33:19', '2021-03-12 00:33:19');
INSERT INTO `exam_admin_operation_log` VALUES (700, 1, 'exam/admin/exam/category/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-12 00:33:21', '2021-03-12 00:33:21');
INSERT INTO `exam_admin_operation_log` VALUES (701, 1, 'exam/admin/exam/category/1', 'PUT', '172.18.0.1', '{\"uuid\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDF\",\"parent_id\":null,\"title\":\"\\u9ad8\\u4e2d\\u6559\\u80b2\",\"orders\":\"0\",\"remark\":\"123\",\"is_show\":\"on\",\"is_home\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-12 00:33:23', '2021-03-12 00:33:23');
INSERT INTO `exam_admin_operation_log` VALUES (702, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-12 00:33:24', '2021-03-12 00:33:24');
INSERT INTO `exam_admin_operation_log` VALUES (703, 1, 'exam/admin/exam/category/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-12 00:33:27', '2021-03-12 00:33:27');
INSERT INTO `exam_admin_operation_log` VALUES (704, 1, 'exam/admin/exam/category/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-12 00:34:00', '2021-03-12 00:34:00');
INSERT INTO `exam_admin_operation_log` VALUES (705, 1, 'exam/admin/exam/category/1', 'PUT', '172.18.0.1', '{\"uuid\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDF\",\"parent_id\":null,\"title\":\"\\u9ad8\\u4e2d\\u6559\\u80b2\",\"orders\":\"0\",\"remark\":\"123\",\"is_show\":\"on\",\"is_home\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-12 00:34:03', '2021-03-12 00:34:03');
INSERT INTO `exam_admin_operation_log` VALUES (706, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-12 00:34:04', '2021-03-12 00:34:04');
INSERT INTO `exam_admin_operation_log` VALUES (707, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-12 00:34:23', '2021-03-12 00:34:23');
INSERT INTO `exam_admin_operation_log` VALUES (708, 1, 'exam/admin/exam/category/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-12 00:34:34', '2021-03-12 00:34:34');
INSERT INTO `exam_admin_operation_log` VALUES (709, 1, 'exam/admin/exam/category/1', 'PUT', '172.18.0.1', '{\"uuid\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDF\",\"parent_id\":null,\"title\":\"\\u9ad8\\u4e2d\\u6559\\u80b2\",\"orders\":\"0\",\"remark\":\"123\",\"is_show\":\"on\",\"is_home\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-12 00:34:36', '2021-03-12 00:34:36');
INSERT INTO `exam_admin_operation_log` VALUES (710, 1, 'exam/admin/exam/category/1', 'GET', '172.18.0.1', '[]', '2021-03-12 00:34:59', '2021-03-12 00:34:59');
INSERT INTO `exam_admin_operation_log` VALUES (711, 1, 'exam/admin/exam/category/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-12 00:35:02', '2021-03-12 00:35:02');
INSERT INTO `exam_admin_operation_log` VALUES (712, 1, 'exam/admin/exam/category/1', 'PUT', '172.18.0.1', '{\"uuid\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDF\",\"parent_id\":null,\"title\":\"\\u9ad8\\u4e2d\\u6559\\u80b2\",\"orders\":\"0\",\"remark\":\"123\",\"is_show\":\"on\",\"is_home\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\\/1\"}', '2021-03-12 00:35:05', '2021-03-12 00:35:05');
INSERT INTO `exam_admin_operation_log` VALUES (713, 1, 'exam/admin/exam/category/1', 'GET', '172.18.0.1', '[]', '2021-03-12 00:35:39', '2021-03-12 00:35:39');
INSERT INTO `exam_admin_operation_log` VALUES (714, 1, 'exam/admin/exam/category/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-12 00:35:41', '2021-03-12 00:35:41');
INSERT INTO `exam_admin_operation_log` VALUES (715, 1, 'exam/admin/exam/category/1', 'PUT', '172.18.0.1', '{\"uuid\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDF\",\"parent_id\":null,\"title\":\"\\u9ad8\\u4e2d\\u6559\\u80b2\",\"orders\":\"0\",\"remark\":\"123\",\"is_show\":\"on\",\"is_home\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\\/1\"}', '2021-03-12 00:35:44', '2021-03-12 00:35:44');
INSERT INTO `exam_admin_operation_log` VALUES (716, 1, 'exam/admin/exam/category/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-12 00:35:44', '2021-03-12 00:35:44');
INSERT INTO `exam_admin_operation_log` VALUES (717, 1, 'exam/admin/exam/category/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-12 00:36:14', '2021-03-12 00:36:14');
INSERT INTO `exam_admin_operation_log` VALUES (718, 1, 'exam/admin/exam/category/1', 'PUT', '172.18.0.1', '{\"uuid\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDF\",\"parent_id\":null,\"title\":\"\\u9ad8\\u4e2d\\u6559\\u80b2\",\"orders\":\"0\",\"remark\":\"123\",\"is_show\":\"on\",\"is_home\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-12 00:36:17', '2021-03-12 00:36:17');
INSERT INTO `exam_admin_operation_log` VALUES (719, 1, 'exam/admin/exam/category/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-12 00:36:17', '2021-03-12 00:36:17');
INSERT INTO `exam_admin_operation_log` VALUES (720, 1, 'exam/admin/exam/category/1', 'PUT', '172.18.0.1', '{\"uuid\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDF\",\"parent_id\":null,\"title\":\"\\u9ad8\\u4e2d\\u6559\\u80b2\",\"orders\":\"0\",\"remark\":\"123\",\"is_show\":\"off\",\"is_home\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\"}', '2021-03-12 00:36:25', '2021-03-12 00:36:25');
INSERT INTO `exam_admin_operation_log` VALUES (721, 1, 'exam/admin/exam/category/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-12 00:36:25', '2021-03-12 00:36:25');
INSERT INTO `exam_admin_operation_log` VALUES (722, 1, 'exam/admin/exam/category/1', 'PUT', '172.18.0.1', '{\"uuid\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDF\",\"parent_id\":null,\"title\":\"\\u9ad8\\u4e2d\\u6559\\u80b2\",\"orders\":\"0\",\"remark\":\"123\",\"is_show\":\"on\",\"is_home\":\"off\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\"}', '2021-03-12 00:36:30', '2021-03-12 00:36:30');
INSERT INTO `exam_admin_operation_log` VALUES (723, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-12 00:36:30', '2021-03-12 00:36:30');
INSERT INTO `exam_admin_operation_log` VALUES (724, 1, 'exam/admin/exam/category/5/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-12 00:36:34', '2021-03-12 00:36:34');
INSERT INTO `exam_admin_operation_log` VALUES (725, 1, 'exam/admin/exam/category/5', 'PUT', '172.18.0.1', '{\"uuid\":\"60CA1FCF-F8EB-2DE1-E1DB-5DDB8D0CED89\",\"parent_id\":null,\"title\":\"\\u521d\\u4e2d\\u6559\\u80b2\",\"orders\":\"0\",\"remark\":null,\"is_show\":\"on\",\"is_home\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-12 00:36:37', '2021-03-12 00:36:37');
INSERT INTO `exam_admin_operation_log` VALUES (726, 1, 'exam/admin/exam/category/5/edit', 'GET', '172.18.0.1', '[]', '2021-03-12 00:36:37', '2021-03-12 00:36:37');
INSERT INTO `exam_admin_operation_log` VALUES (727, 1, 'exam/admin/exam/category/5', 'PUT', '172.18.0.1', '{\"uuid\":\"60CA1FCF-F8EB-2DE1-E1DB-5DDB8D0CED89\",\"parent_id\":null,\"title\":\"\\u521d\\u4e2d\\u6559\\u80b2\",\"orders\":\"0\",\"remark\":null,\"is_show\":\"on\",\"is_home\":\"off\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\"}', '2021-03-12 00:36:42', '2021-03-12 00:36:42');
INSERT INTO `exam_admin_operation_log` VALUES (728, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-12 00:36:43', '2021-03-12 00:36:43');
INSERT INTO `exam_admin_operation_log` VALUES (729, 1, 'exam/admin/exam/category/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-12 00:36:52', '2021-03-12 00:36:52');
INSERT INTO `exam_admin_operation_log` VALUES (730, 1, 'exam/admin/exam/category', 'POST', '172.18.0.1', '{\"uuid\":\"80DE0211-2E2E-32F2-F2ED-2BAF5EF85684\",\"parent_id\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDF\",\"title\":\"12312\",\"orders\":\"0\",\"remark\":null,\"is_show\":\"on\",\"is_home\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-12 00:37:13', '2021-03-12 00:37:13');
INSERT INTO `exam_admin_operation_log` VALUES (731, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-12 00:37:14', '2021-03-12 00:37:14');
INSERT INTO `exam_admin_operation_log` VALUES (732, 1, 'exam/admin/exam/category/8/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-12 00:37:32', '2021-03-12 00:37:32');
INSERT INTO `exam_admin_operation_log` VALUES (733, 1, 'exam/admin/exam/category/8', 'PUT', '172.18.0.1', '{\"uuid\":\"7B958AC1-1BF8-2251-5157-EECA9E8A56DB\",\"parent_id\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDF\",\"title\":\"123123\",\"orders\":\"0\",\"remark\":null,\"is_show\":\"off\",\"is_home\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-12 00:37:36', '2021-03-12 00:37:36');
INSERT INTO `exam_admin_operation_log` VALUES (734, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-12 00:37:36', '2021-03-12 00:37:36');
INSERT INTO `exam_admin_operation_log` VALUES (735, 1, 'exam/admin/exam/category/9/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-12 00:37:38', '2021-03-12 00:37:38');
INSERT INTO `exam_admin_operation_log` VALUES (736, 1, 'exam/admin/exam/category/9', 'PUT', '172.18.0.1', '{\"uuid\":\"80DE0211-2E2E-32F2-F2ED-2BAF5EF85684\",\"parent_id\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDF\",\"title\":\"12312\",\"orders\":\"0\",\"remark\":null,\"is_show\":\"off\",\"is_home\":\"on\",\"_token\":\"2bgQc7x5Of1hRYTOQYBXcFNG4AJEyM6h5KQYxzyn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-12 00:37:42', '2021-03-12 00:37:42');
INSERT INTO `exam_admin_operation_log` VALUES (737, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-12 00:37:42', '2021-03-12 00:37:42');
INSERT INTO `exam_admin_operation_log` VALUES (738, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-12 00:37:52', '2021-03-12 00:37:52');
INSERT INTO `exam_admin_operation_log` VALUES (739, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-12 00:37:52', '2021-03-12 00:37:52');
INSERT INTO `exam_admin_operation_log` VALUES (740, 1, 'exam/admin/platform/message/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-12 23:11:25', '2021-03-12 23:11:25');
INSERT INTO `exam_admin_operation_log` VALUES (741, 1, 'exam/admin/platform/message/content', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-12 23:11:26', '2021-03-12 23:11:26');
INSERT INTO `exam_admin_operation_log` VALUES (742, 1, 'exam/admin', 'GET', '172.18.0.1', '[]', '2021-03-13 12:30:40', '2021-03-13 12:30:40');
INSERT INTO `exam_admin_operation_log` VALUES (743, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 13:06:33', '2021-03-13 13:06:33');
INSERT INTO `exam_admin_operation_log` VALUES (744, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 13:06:42', '2021-03-13 13:06:42');
INSERT INTO `exam_admin_operation_log` VALUES (745, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 13:06:51', '2021-03-13 13:06:51');
INSERT INTO `exam_admin_operation_log` VALUES (746, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 13:06:54', '2021-03-13 13:06:54');
INSERT INTO `exam_admin_operation_log` VALUES (747, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 13:07:36', '2021-03-13 13:07:36');
INSERT INTO `exam_admin_operation_log` VALUES (748, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 13:08:10', '2021-03-13 13:08:10');
INSERT INTO `exam_admin_operation_log` VALUES (749, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 13:08:17', '2021-03-13 13:08:17');
INSERT INTO `exam_admin_operation_log` VALUES (750, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 13:08:29', '2021-03-13 13:08:29');
INSERT INTO `exam_admin_operation_log` VALUES (751, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 13:09:04', '2021-03-13 13:09:04');
INSERT INTO `exam_admin_operation_log` VALUES (752, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 13:09:45', '2021-03-13 13:09:45');
INSERT INTO `exam_admin_operation_log` VALUES (753, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 13:11:39', '2021-03-13 13:11:39');
INSERT INTO `exam_admin_operation_log` VALUES (754, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 13:22:16', '2021-03-13 13:22:16');
INSERT INTO `exam_admin_operation_log` VALUES (755, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 13:23:36', '2021-03-13 13:23:36');
INSERT INTO `exam_admin_operation_log` VALUES (756, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 13:29:02', '2021-03-13 13:29:02');
INSERT INTO `exam_admin_operation_log` VALUES (757, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 14:18:27', '2021-03-13 14:18:27');
INSERT INTO `exam_admin_operation_log` VALUES (758, 1, 'exam/admin/auth/menu', 'POST', '172.18.0.1', '{\"parent_id\":\"11\",\"title\":\"\\u79ef\\u5206\\u914d\\u7f6e\",\"icon\":\"fa-bars\",\"uri\":\"platform\\/score\\/setting\",\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"CRLmyk5a1bnRSpnR5heYs2Z9mKGWoAVl3dKssLel\"}', '2021-03-13 14:18:40', '2021-03-13 14:18:40');
INSERT INTO `exam_admin_operation_log` VALUES (759, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-13 14:18:40', '2021-03-13 14:18:40');
INSERT INTO `exam_admin_operation_log` VALUES (760, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-13 14:18:43', '2021-03-13 14:18:43');
INSERT INTO `exam_admin_operation_log` VALUES (761, 1, 'exam/admin/platform/score/setting', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 14:18:49', '2021-03-13 14:18:49');
INSERT INTO `exam_admin_operation_log` VALUES (762, 1, 'exam/admin/platform/score/setting/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 14:18:52', '2021-03-13 14:18:52');
INSERT INTO `exam_admin_operation_log` VALUES (763, 1, 'exam/admin/platform/score/setting', 'POST', '172.18.0.1', '{\"uuid\":\"353F4DD4-9E0D-E0BF-BFB8-4AC77DE4FEE4\",\"key\":\"register\",\"score\":\"1.2\",\"is_show\":\"on\",\"_token\":\"CRLmyk5a1bnRSpnR5heYs2Z9mKGWoAVl3dKssLel\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/platform\\/score\\/setting\"}', '2021-03-13 14:19:01', '2021-03-13 14:19:01');
INSERT INTO `exam_admin_operation_log` VALUES (764, 1, 'exam/admin/platform/score/setting', 'GET', '172.18.0.1', '[]', '2021-03-13 14:19:02', '2021-03-13 14:19:02');
INSERT INTO `exam_admin_operation_log` VALUES (765, 1, 'exam/admin/platform/score/setting/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 14:19:04', '2021-03-13 14:19:04');
INSERT INTO `exam_admin_operation_log` VALUES (766, 1, 'exam/admin/platform/score/setting', 'POST', '172.18.0.1', '{\"uuid\":\"A8FA6FE7-9CF5-8884-846F-1FB2C7C5A039\",\"key\":\"sign\",\"score\":\"5\",\"is_show\":\"off\",\"_token\":\"CRLmyk5a1bnRSpnR5heYs2Z9mKGWoAVl3dKssLel\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/platform\\/score\\/setting\"}', '2021-03-13 14:19:10', '2021-03-13 14:19:10');
INSERT INTO `exam_admin_operation_log` VALUES (767, 1, 'exam/admin/platform/score/setting', 'GET', '172.18.0.1', '[]', '2021-03-13 14:19:10', '2021-03-13 14:19:10');
INSERT INTO `exam_admin_operation_log` VALUES (768, 1, 'exam/admin/platform/score/setting/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 14:19:12', '2021-03-13 14:19:12');
INSERT INTO `exam_admin_operation_log` VALUES (769, 1, 'exam/admin/platform/score/setting', 'POST', '172.18.0.1', '{\"uuid\":\"DF2C3022-8ED0-52DD-DD84-21F100193357\",\"key\":\"share\",\"score\":\"5\",\"is_show\":\"on\",\"_token\":\"CRLmyk5a1bnRSpnR5heYs2Z9mKGWoAVl3dKssLel\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/platform\\/score\\/setting\"}', '2021-03-13 14:19:17', '2021-03-13 14:19:17');
INSERT INTO `exam_admin_operation_log` VALUES (770, 1, 'exam/admin/platform/score/setting', 'GET', '172.18.0.1', '[]', '2021-03-13 14:19:18', '2021-03-13 14:19:18');
INSERT INTO `exam_admin_operation_log` VALUES (771, 1, 'exam/admin/platform/score/setting', 'GET', '172.18.0.1', '[]', '2021-03-13 14:19:46', '2021-03-13 14:19:46');
INSERT INTO `exam_admin_operation_log` VALUES (772, 1, 'exam/admin/platform/score/setting', 'GET', '172.18.0.1', '[]', '2021-03-13 14:19:51', '2021-03-13 14:19:51');
INSERT INTO `exam_admin_operation_log` VALUES (773, 1, 'exam/admin/platform/score/setting/2/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 14:19:56', '2021-03-13 14:19:56');
INSERT INTO `exam_admin_operation_log` VALUES (774, 1, 'exam/admin/platform/score/setting/2', 'PUT', '172.18.0.1', '{\"uuid\":\"A8FA6FE7-9CF5-8884-846F-1FB2C7C5A039\",\"key\":\"sign\",\"score\":\"5\",\"is_show\":\"on\",\"_token\":\"CRLmyk5a1bnRSpnR5heYs2Z9mKGWoAVl3dKssLel\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/platform\\/score\\/setting\"}', '2021-03-13 14:19:58', '2021-03-13 14:19:58');
INSERT INTO `exam_admin_operation_log` VALUES (775, 1, 'exam/admin/platform/score/setting', 'GET', '172.18.0.1', '[]', '2021-03-13 14:19:58', '2021-03-13 14:19:58');
INSERT INTO `exam_admin_operation_log` VALUES (776, 1, 'exam/admin/platform/score/setting', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 15:01:09', '2021-03-13 15:01:09');
INSERT INTO `exam_admin_operation_log` VALUES (777, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 15:01:11', '2021-03-13 15:01:11');
INSERT INTO `exam_admin_operation_log` VALUES (778, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 15:04:34', '2021-03-13 15:04:34');
INSERT INTO `exam_admin_operation_log` VALUES (779, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 15:06:05', '2021-03-13 15:06:05');
INSERT INTO `exam_admin_operation_log` VALUES (780, 1, 'exam/admin/auth/menu', 'POST', '172.18.0.1', '{\"parent_id\":\"14\",\"title\":\"\\u79ef\\u5206\\u5386\\u53f2\",\"icon\":\"fa-bars\",\"uri\":\"wechat\\/user\\/score\",\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"CRLmyk5a1bnRSpnR5heYs2Z9mKGWoAVl3dKssLel\"}', '2021-03-13 15:06:18', '2021-03-13 15:06:18');
INSERT INTO `exam_admin_operation_log` VALUES (781, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-13 15:06:18', '2021-03-13 15:06:18');
INSERT INTO `exam_admin_operation_log` VALUES (782, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-13 15:06:21', '2021-03-13 15:06:21');
INSERT INTO `exam_admin_operation_log` VALUES (783, 1, 'exam/admin/wechat/user/score', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 15:06:24', '2021-03-13 15:06:24');
INSERT INTO `exam_admin_operation_log` VALUES (784, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-13 15:06:24', '2021-03-13 15:06:24');
INSERT INTO `exam_admin_operation_log` VALUES (785, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-13 15:06:40', '2021-03-13 15:06:40');
INSERT INTO `exam_admin_operation_log` VALUES (786, 1, 'exam/admin/wechat/user/score', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 15:06:44', '2021-03-13 15:06:44');
INSERT INTO `exam_admin_operation_log` VALUES (787, 1, 'exam/admin/wechat/user/score', 'GET', '172.18.0.1', '[]', '2021-03-13 15:07:11', '2021-03-13 15:07:11');
INSERT INTO `exam_admin_operation_log` VALUES (788, 1, 'exam/admin/wechat/user/score', 'GET', '172.18.0.1', '[]', '2021-03-13 15:08:43', '2021-03-13 15:08:43');
INSERT INTO `exam_admin_operation_log` VALUES (789, 1, 'exam/admin/wechat/user/score', 'GET', '172.18.0.1', '[]', '2021-03-13 15:10:24', '2021-03-13 15:10:24');
INSERT INTO `exam_admin_operation_log` VALUES (790, 1, 'exam/admin/wechat/user/score', 'GET', '172.18.0.1', '[]', '2021-03-13 15:11:55', '2021-03-13 15:11:55');
INSERT INTO `exam_admin_operation_log` VALUES (791, 1, 'exam/admin/wechat/user/score', 'GET', '172.18.0.1', '{\"type\":\"1\",\"key\":null,\"_pjax\":\"#pjax-container\"}', '2021-03-13 15:11:59', '2021-03-13 15:11:59');
INSERT INTO `exam_admin_operation_log` VALUES (792, 1, 'exam/admin/wechat/user/score', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 15:12:01', '2021-03-13 15:12:01');
INSERT INTO `exam_admin_operation_log` VALUES (793, 1, 'exam/admin/wechat/user/score', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\",\"type\":\"2\",\"key\":null}', '2021-03-13 15:12:04', '2021-03-13 15:12:04');
INSERT INTO `exam_admin_operation_log` VALUES (794, 1, 'exam/admin/wechat/user/score', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 15:12:06', '2021-03-13 15:12:06');
INSERT INTO `exam_admin_operation_log` VALUES (795, 1, 'exam/admin/wechat/user/score', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\",\"type\":null,\"key\":\"sign\"}', '2021-03-13 15:12:11', '2021-03-13 15:12:11');
INSERT INTO `exam_admin_operation_log` VALUES (796, 1, 'exam/admin/wechat/user/score', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 15:12:13', '2021-03-13 15:12:13');
INSERT INTO `exam_admin_operation_log` VALUES (797, 1, 'exam/admin/platform/score/setting', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 15:15:19', '2021-03-13 15:15:19');
INSERT INTO `exam_admin_operation_log` VALUES (798, 1, 'exam/admin/wechat/user/score', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 15:15:24', '2021-03-13 15:15:24');
INSERT INTO `exam_admin_operation_log` VALUES (799, 1, 'exam/admin/wechat/user/score', 'GET', '172.18.0.1', '[]', '2021-03-13 15:16:03', '2021-03-13 15:16:03');
INSERT INTO `exam_admin_operation_log` VALUES (800, 1, 'exam/admin/platform/score/setting', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 15:16:12', '2021-03-13 15:16:12');
INSERT INTO `exam_admin_operation_log` VALUES (801, 1, 'exam/admin/platform/message/content', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 15:48:24', '2021-03-13 15:48:24');
INSERT INTO `exam_admin_operation_log` VALUES (802, 1, 'exam/admin/platform/message/content/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 15:48:27', '2021-03-13 15:48:27');
INSERT INTO `exam_admin_operation_log` VALUES (803, 1, 'exam/admin/platform/message/content', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 15:48:31', '2021-03-13 15:48:31');
INSERT INTO `exam_admin_operation_log` VALUES (804, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 16:51:37', '2021-03-13 16:51:37');
INSERT INTO `exam_admin_operation_log` VALUES (805, 1, 'exam/admin/wechat/user/score', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 16:51:37', '2021-03-13 16:51:37');
INSERT INTO `exam_admin_operation_log` VALUES (806, 1, 'exam/admin/wechat/user/score', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 16:51:38', '2021-03-13 16:51:38');
INSERT INTO `exam_admin_operation_log` VALUES (807, 1, 'exam/admin/platform/score/setting', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 16:58:24', '2021-03-13 16:58:24');
INSERT INTO `exam_admin_operation_log` VALUES (808, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 17:09:17', '2021-03-13 17:09:17');
INSERT INTO `exam_admin_operation_log` VALUES (809, 1, 'exam/admin/wechat/user/score', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 17:09:18', '2021-03-13 17:09:18');
INSERT INTO `exam_admin_operation_log` VALUES (810, 1, 'exam/admin/wechat/user/score', 'GET', '172.18.0.1', '[]', '2021-03-13 17:12:06', '2021-03-13 17:12:06');
INSERT INTO `exam_admin_operation_log` VALUES (811, 1, 'exam/admin/wechat/user/score', 'GET', '172.18.0.1', '[]', '2021-03-13 17:12:09', '2021-03-13 17:12:09');
INSERT INTO `exam_admin_operation_log` VALUES (812, 1, 'exam/admin/wechat/user/score', 'GET', '172.18.0.1', '[]', '2021-03-13 17:17:54', '2021-03-13 17:17:54');
INSERT INTO `exam_admin_operation_log` VALUES (813, 1, 'exam/admin/wechat/user/score', 'GET', '172.18.0.1', '[]', '2021-03-13 17:18:34', '2021-03-13 17:18:34');
INSERT INTO `exam_admin_operation_log` VALUES (814, 1, 'exam/admin/wechat/user/score', 'GET', '172.18.0.1', '[]', '2021-03-13 18:25:31', '2021-03-13 18:25:31');
INSERT INTO `exam_admin_operation_log` VALUES (815, 1, 'exam/admin/wechat/user/score', 'GET', '172.18.0.1', '[]', '2021-03-13 18:29:14', '2021-03-13 18:29:14');
INSERT INTO `exam_admin_operation_log` VALUES (816, 1, 'exam/admin/wechat/user/score', 'GET', '172.18.0.1', '[]', '2021-03-13 20:01:16', '2021-03-13 20:01:16');
INSERT INTO `exam_admin_operation_log` VALUES (817, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 20:01:17', '2021-03-13 20:01:17');
INSERT INTO `exam_admin_operation_log` VALUES (818, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 20:01:43', '2021-03-13 20:01:43');
INSERT INTO `exam_admin_operation_log` VALUES (819, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 20:02:25', '2021-03-13 20:02:25');
INSERT INTO `exam_admin_operation_log` VALUES (820, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 20:02:54', '2021-03-13 20:02:54');
INSERT INTO `exam_admin_operation_log` VALUES (821, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 20:03:15', '2021-03-13 20:03:15');
INSERT INTO `exam_admin_operation_log` VALUES (822, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 20:03:39', '2021-03-13 20:03:39');
INSERT INTO `exam_admin_operation_log` VALUES (823, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 20:03:45', '2021-03-13 20:03:45');
INSERT INTO `exam_admin_operation_log` VALUES (824, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 20:03:55', '2021-03-13 20:03:55');
INSERT INTO `exam_admin_operation_log` VALUES (825, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 20:04:00', '2021-03-13 20:04:00');
INSERT INTO `exam_admin_operation_log` VALUES (826, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 20:04:27', '2021-03-13 20:04:27');
INSERT INTO `exam_admin_operation_log` VALUES (827, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 20:04:31', '2021-03-13 20:04:31');
INSERT INTO `exam_admin_operation_log` VALUES (828, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 20:04:46', '2021-03-13 20:04:46');
INSERT INTO `exam_admin_operation_log` VALUES (829, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 20:05:36', '2021-03-13 20:05:36');
INSERT INTO `exam_admin_operation_log` VALUES (830, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 20:12:42', '2021-03-13 20:12:42');
INSERT INTO `exam_admin_operation_log` VALUES (831, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 20:12:46', '2021-03-13 20:12:46');
INSERT INTO `exam_admin_operation_log` VALUES (832, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 20:13:07', '2021-03-13 20:13:07');
INSERT INTO `exam_admin_operation_log` VALUES (833, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 20:13:10', '2021-03-13 20:13:10');
INSERT INTO `exam_admin_operation_log` VALUES (834, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 20:19:58', '2021-03-13 20:19:58');
INSERT INTO `exam_admin_operation_log` VALUES (835, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 20:40:37', '2021-03-13 20:40:37');
INSERT INTO `exam_admin_operation_log` VALUES (836, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 20:47:35', '2021-03-13 20:47:35');
INSERT INTO `exam_admin_operation_log` VALUES (837, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 20:47:39', '2021-03-13 20:47:39');
INSERT INTO `exam_admin_operation_log` VALUES (838, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 20:47:42', '2021-03-13 20:47:42');
INSERT INTO `exam_admin_operation_log` VALUES (839, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 20:49:46', '2021-03-13 20:49:46');
INSERT INTO `exam_admin_operation_log` VALUES (840, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 20:49:53', '2021-03-13 20:49:53');
INSERT INTO `exam_admin_operation_log` VALUES (841, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 20:50:57', '2021-03-13 20:50:57');
INSERT INTO `exam_admin_operation_log` VALUES (842, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 20:51:37', '2021-03-13 20:51:37');
INSERT INTO `exam_admin_operation_log` VALUES (843, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 20:54:02', '2021-03-13 20:54:02');
INSERT INTO `exam_admin_operation_log` VALUES (844, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 20:56:28', '2021-03-13 20:56:28');
INSERT INTO `exam_admin_operation_log` VALUES (845, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 20:57:13', '2021-03-13 20:57:13');
INSERT INTO `exam_admin_operation_log` VALUES (846, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 20:57:16', '2021-03-13 20:57:16');
INSERT INTO `exam_admin_operation_log` VALUES (847, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 20:57:29', '2021-03-13 20:57:29');
INSERT INTO `exam_admin_operation_log` VALUES (848, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 20:57:42', '2021-03-13 20:57:42');
INSERT INTO `exam_admin_operation_log` VALUES (849, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 20:57:47', '2021-03-13 20:57:47');
INSERT INTO `exam_admin_operation_log` VALUES (850, 1, 'exam/admin/platform/score/setting', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 20:57:50', '2021-03-13 20:57:50');
INSERT INTO `exam_admin_operation_log` VALUES (851, 1, 'exam/admin/platform/score/setting', 'GET', '172.18.0.1', '[]', '2021-03-13 21:07:02', '2021-03-13 21:07:02');
INSERT INTO `exam_admin_operation_log` VALUES (852, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 21:07:06', '2021-03-13 21:07:06');
INSERT INTO `exam_admin_operation_log` VALUES (853, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 21:07:55', '2021-03-13 21:07:55');
INSERT INTO `exam_admin_operation_log` VALUES (854, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 21:40:43', '2021-03-13 21:40:43');
INSERT INTO `exam_admin_operation_log` VALUES (855, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 21:50:45', '2021-03-13 21:50:45');
INSERT INTO `exam_admin_operation_log` VALUES (856, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '[]', '2021-03-13 21:56:31', '2021-03-13 21:56:31');
INSERT INTO `exam_admin_operation_log` VALUES (857, 1, 'exam/admin/wechat/user/score', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 22:06:36', '2021-03-13 22:06:36');
INSERT INTO `exam_admin_operation_log` VALUES (858, 1, 'exam/admin/auth/users', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 22:06:40', '2021-03-13 22:06:40');
INSERT INTO `exam_admin_operation_log` VALUES (859, 1, 'exam/admin/auth/roles', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 22:06:42', '2021-03-13 22:06:42');
INSERT INTO `exam_admin_operation_log` VALUES (860, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 22:06:45', '2021-03-13 22:06:45');
INSERT INTO `exam_admin_operation_log` VALUES (861, 1, 'exam/admin/auth/users', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 22:06:53', '2021-03-13 22:06:53');
INSERT INTO `exam_admin_operation_log` VALUES (862, 1, 'exam/admin/auth/users/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 22:06:57', '2021-03-13 22:06:57');
INSERT INTO `exam_admin_operation_log` VALUES (863, 1, 'exam/admin/auth/users/1', 'PUT', '172.18.0.1', '{\"username\":\"admin\",\"name\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\",\"password\":\"$2y$10$vn2Xqa\\/\\/NqOmsptQ1a9\\/beVRNa5WrrcZVmqW1JSOAGIv8LxqqbKOq\",\"password_confirmation\":\"$2y$10$vn2Xqa\\/\\/NqOmsptQ1a9\\/beVRNa5WrrcZVmqW1JSOAGIv8LxqqbKOq\",\"roles\":[\"1\",null],\"permissions\":[null],\"_token\":\"CRLmyk5a1bnRSpnR5heYs2Z9mKGWoAVl3dKssLel\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/auth\\/users\"}', '2021-03-13 22:07:05', '2021-03-13 22:07:05');
INSERT INTO `exam_admin_operation_log` VALUES (864, 1, 'exam/admin/auth/users', 'GET', '172.18.0.1', '[]', '2021-03-13 22:07:06', '2021-03-13 22:07:06');
INSERT INTO `exam_admin_operation_log` VALUES (865, 1, 'exam/admin/auth/users', 'GET', '172.18.0.1', '[]', '2021-03-13 22:07:08', '2021-03-13 22:07:08');
INSERT INTO `exam_admin_operation_log` VALUES (866, 1, 'exam/admin/platform/message/content', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 22:25:34', '2021-03-13 22:25:34');
INSERT INTO `exam_admin_operation_log` VALUES (867, 1, 'exam/admin/platform/message/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 22:25:34', '2021-03-13 22:25:34');
INSERT INTO `exam_admin_operation_log` VALUES (868, 1, 'exam/admin/auth/permissions', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 22:29:52', '2021-03-13 22:29:52');
INSERT INTO `exam_admin_operation_log` VALUES (869, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 22:29:53', '2021-03-13 22:29:53');
INSERT INTO `exam_admin_operation_log` VALUES (870, 1, 'exam/admin/auth/menu', 'POST', '172.18.0.1', '{\"parent_id\":\"11\",\"title\":\"\\u53c2\\u6570\\u914d\\u7f6e\",\"icon\":\"fa-bars\",\"uri\":\"platform\\/const\\/setting\",\"roles\":[null],\"permission\":null,\"_token\":\"CRLmyk5a1bnRSpnR5heYs2Z9mKGWoAVl3dKssLel\"}', '2021-03-13 22:30:05', '2021-03-13 22:30:05');
INSERT INTO `exam_admin_operation_log` VALUES (871, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-13 22:30:06', '2021-03-13 22:30:06');
INSERT INTO `exam_admin_operation_log` VALUES (872, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-13 22:30:08', '2021-03-13 22:30:08');
INSERT INTO `exam_admin_operation_log` VALUES (873, 1, 'exam/admin/platform/const/setting', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 22:30:15', '2021-03-13 22:30:15');
INSERT INTO `exam_admin_operation_log` VALUES (874, 1, 'exam/admin/platform/const/setting', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}', '2021-03-13 22:30:18', '2021-03-13 22:30:18');
INSERT INTO `exam_admin_operation_log` VALUES (875, 1, 'exam/admin/platform/const/setting', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"1\"}', '2021-03-13 22:30:22', '2021-03-13 22:30:22');
INSERT INTO `exam_admin_operation_log` VALUES (876, 1, 'exam/admin/platform/const/setting', 'GET', '172.18.0.1', '{\"page\":\"1\"}', '2021-03-13 22:32:26', '2021-03-13 22:32:26');
INSERT INTO `exam_admin_operation_log` VALUES (877, 1, 'exam/admin/platform/const/setting', 'GET', '172.18.0.1', '{\"page\":\"1\"}', '2021-03-13 22:32:53', '2021-03-13 22:32:53');
INSERT INTO `exam_admin_operation_log` VALUES (878, 1, 'exam/admin/platform/const/setting', 'GET', '172.18.0.1', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2021-03-13 22:32:57', '2021-03-13 22:32:57');
INSERT INTO `exam_admin_operation_log` VALUES (879, 1, 'exam/admin/platform/const/setting', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"3\"}', '2021-03-13 22:33:00', '2021-03-13 22:33:00');
INSERT INTO `exam_admin_operation_log` VALUES (880, 1, 'exam/admin/platform/const/setting/24/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 22:33:02', '2021-03-13 22:33:02');
INSERT INTO `exam_admin_operation_log` VALUES (881, 1, 'exam/admin/platform/const/setting', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 22:33:06', '2021-03-13 22:33:06');
INSERT INTO `exam_admin_operation_log` VALUES (882, 1, 'exam/admin/platform/const/setting', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"3\"}', '2021-03-13 22:33:10', '2021-03-13 22:33:10');
INSERT INTO `exam_admin_operation_log` VALUES (883, 1, 'exam/admin/platform/const/setting', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}', '2021-03-13 22:33:15', '2021-03-13 22:33:15');
INSERT INTO `exam_admin_operation_log` VALUES (884, 1, 'exam/admin/platform/const/setting', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"1\"}', '2021-03-13 22:33:19', '2021-03-13 22:33:19');
INSERT INTO `exam_admin_operation_log` VALUES (885, 1, 'exam/admin/platform/const/setting/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 22:33:22', '2021-03-13 22:33:22');
INSERT INTO `exam_admin_operation_log` VALUES (886, 1, 'exam/admin/platform/const/setting', 'POST', '172.18.0.1', '{\"key\":\"document\",\"values\":\"1\",\"describe\":\"\\u5173\\u4e8e\\u6211\\u4eec\\u6587\\u7ae0\",\"_token\":\"CRLmyk5a1bnRSpnR5heYs2Z9mKGWoAVl3dKssLel\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/platform\\/const\\/setting?&page=1\"}', '2021-03-13 22:33:39', '2021-03-13 22:33:39');
INSERT INTO `exam_admin_operation_log` VALUES (887, 1, 'exam/admin/platform/const/setting', 'GET', '172.18.0.1', '{\"page\":\"1\"}', '2021-03-13 22:33:39', '2021-03-13 22:33:39');
INSERT INTO `exam_admin_operation_log` VALUES (888, 1, 'exam/admin/platform/const/setting', 'GET', '172.18.0.1', '{\"page\":\"3\",\"_pjax\":\"#pjax-container\"}', '2021-03-13 22:33:45', '2021-03-13 22:33:45');
INSERT INTO `exam_admin_operation_log` VALUES (889, 1, 'exam/admin/platform/const/setting', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}', '2021-03-13 22:35:19', '2021-03-13 22:35:19');
INSERT INTO `exam_admin_operation_log` VALUES (890, 1, 'exam/admin/platform/const/setting', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"1\"}', '2021-03-13 22:35:21', '2021-03-13 22:35:21');
INSERT INTO `exam_admin_operation_log` VALUES (891, 1, 'exam/admin/platform/const/setting', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"3\"}', '2021-03-13 22:40:54', '2021-03-13 22:40:54');
INSERT INTO `exam_admin_operation_log` VALUES (892, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 22:41:29', '2021-03-13 22:41:29');
INSERT INTO `exam_admin_operation_log` VALUES (893, 1, 'exam/admin/auth/menu', 'POST', '172.18.0.1', '{\"parent_id\":\"11\",\"title\":\"\\u5e73\\u53f0\\u6587\\u7ae0\",\"icon\":\"fa-bars\",\"uri\":\"platform\\/content\",\"roles\":[null],\"permission\":null,\"_token\":\"CRLmyk5a1bnRSpnR5heYs2Z9mKGWoAVl3dKssLel\"}', '2021-03-13 22:41:41', '2021-03-13 22:41:41');
INSERT INTO `exam_admin_operation_log` VALUES (894, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-13 22:41:41', '2021-03-13 22:41:41');
INSERT INTO `exam_admin_operation_log` VALUES (895, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-13 22:41:47', '2021-03-13 22:41:47');
INSERT INTO `exam_admin_operation_log` VALUES (896, 1, 'exam/admin/platform/content', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 22:41:53', '2021-03-13 22:41:53');
INSERT INTO `exam_admin_operation_log` VALUES (897, 1, 'exam/admin/platform/content/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 22:41:55', '2021-03-13 22:41:55');
INSERT INTO `exam_admin_operation_log` VALUES (898, 1, 'exam/admin/platform/content', 'POST', '172.18.0.1', '{\"uuid\":\"97C2D6A9-B93E-2692-92F4-CD6C2CF9CD16\",\"position\":\"1\",\"content\":\"<p>123123123123<\\/p>\",\"is_show\":\"on\",\"_token\":\"CRLmyk5a1bnRSpnR5heYs2Z9mKGWoAVl3dKssLel\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/platform\\/content\"}', '2021-03-13 22:42:02', '2021-03-13 22:42:02');
INSERT INTO `exam_admin_operation_log` VALUES (899, 1, 'exam/admin/platform/content', 'GET', '172.18.0.1', '[]', '2021-03-13 22:42:02', '2021-03-13 22:42:02');
INSERT INTO `exam_admin_operation_log` VALUES (900, 1, 'exam/admin/platform/content', 'GET', '172.18.0.1', '[]', '2021-03-13 22:42:41', '2021-03-13 22:42:41');
INSERT INTO `exam_admin_operation_log` VALUES (901, 1, 'exam/admin/platform/score/setting', 'GET', '172.18.0.1', '[]', '2021-03-13 23:06:06', '2021-03-13 23:06:06');
INSERT INTO `exam_admin_operation_log` VALUES (902, 1, 'exam/admin/platform/const/setting', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 23:06:10', '2021-03-13 23:06:10');
INSERT INTO `exam_admin_operation_log` VALUES (903, 1, 'exam/admin/platform/const/setting', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"3\"}', '2021-03-13 23:06:13', '2021-03-13 23:06:13');
INSERT INTO `exam_admin_operation_log` VALUES (904, 1, 'exam/admin/platform/content', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 23:11:14', '2021-03-13 23:11:14');
INSERT INTO `exam_admin_operation_log` VALUES (905, 1, 'exam/admin/platform/content/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-13 23:11:17', '2021-03-13 23:11:17');
INSERT INTO `exam_admin_operation_log` VALUES (906, 1, 'exam/admin/platform/content/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-13 23:11:42', '2021-03-13 23:11:42');
INSERT INTO `exam_admin_operation_log` VALUES (907, 1, 'exam/admin/platform/content/1', 'PUT', '172.18.0.1', '{\"uuid\":\"97C2D6A9-B93E-2692-92F4-CD6C2CF9CD16\",\"position\":\"1\",\"content\":\"<p>123123123123123123123123123123123123&nbsp;123123123123 123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123&nbsp;123123123123 123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123&nbsp;123123123123 123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123&nbsp;123123123123 123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123&nbsp;123123123123 123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123&nbsp;123123123123 123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123&nbsp;123123123123 123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123&nbsp;123123123123 123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123&nbsp;123123123123 123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123&nbsp;123123123123 123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123&nbsp;123123123123 123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123&nbsp;123123123123 123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123&nbsp;123123123123 123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123&nbsp;123123123123 123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123&nbsp;123123123123 123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123&nbsp;123123123123 123123123123123123123123123123123123123123123123123123123123<\\/p><div id=\\\"baidu_pastebin\\\" style=\\\"position: absolute; width: 1px; height: 1px; overflow: hidden; left: -1000px; white-space: nowrap; top: 296px;\\\"><span style=\\\"white-space: normal;\\\">123123123123<\\/span><span style=\\\"white-space: normal;\\\">123123123123<\\/span><span style=\\\"white-space: normal;\\\">123123123123&nbsp;123123123123 123123123123<\\/span><span style=\\\"white-space: normal;\\\">123123123123<\\/span><span style=\\\"white-space: normal;\\\">123123123123<\\/span><span style=\\\"white-space: normal;\\\">123123123123<\\/span><span style=\\\"white-space: normal;\\\">123123123123<\\/span><br\\/><\\/div>\",\"is_show\":\"on\",\"_token\":\"CRLmyk5a1bnRSpnR5heYs2Z9mKGWoAVl3dKssLel\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/platform\\/content\"}', '2021-03-13 23:12:14', '2021-03-13 23:12:14');
INSERT INTO `exam_admin_operation_log` VALUES (908, 1, 'exam/admin/platform/content/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-13 23:12:15', '2021-03-13 23:12:15');
INSERT INTO `exam_admin_operation_log` VALUES (909, 1, 'exam/admin/platform/content', 'GET', '172.18.0.1', '[]', '2021-03-13 23:12:15', '2021-03-13 23:12:15');
INSERT INTO `exam_admin_operation_log` VALUES (910, 1, 'exam/admin/platform/content/1', 'PUT', '172.18.0.1', '{\"uuid\":\"97C2D6A9-B93E-2692-92F4-CD6C2CF9CD16\",\"position\":\"1\",\"content\":\"<p style=\\\"margin: 10px auto; padding: 0px; color: rgb(73, 73, 73); font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(244, 237, 227);\\\"><span style=\\\"margin: 0px; padding: 0px; font-size: 18px;\\\"><strong style=\\\"margin: 0px; padding: 0px;\\\">\\u4e8c\\u3001\\u5c06\\u5176\\u4ed6\\u6570\\u636e\\u7c7b\\u578b\\u8f6c\\u6362\\u4e3aNumber\\u7c7b\\u578b<\\/strong><\\/span><\\/p><p style=\\\"margin: 10px auto; padding: 0px; color: rgb(73, 73, 73); font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(244, 237, 227);\\\"><span style=\\\"margin: 0px; padding: 0px; font-size: 18px;\\\">\\u65b9\\u6cd51\\u3001\\u4f7f\\u7528Number()\\u51fd\\u6570<\\/span><\\/p><p style=\\\"margin: 10px auto; padding: 0px; color: rgb(73, 73, 73); font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(244, 237, 227);\\\"><span style=\\\"margin: 0px; padding: 0px; font-size: 18px;\\\">\\u5b57\\u7b26\\u4e32\\u8f6c\\u6362\\u6210\\u6570\\u5b57\\u65f6\\uff0c\\u5982\\u679c\\u662f\\u7eaf\\u6570\\u5b57\\u7684\\u5b57\\u7b26\\u4e32\\uff0c\\u76f4\\u63a5\\u5c06\\u5176\\u8f6c\\u6362\\u6210\\u6570\\u5b57\\uff1b\\u5982\\u679c\\u5b57\\u7b26\\u4e32\\u4e2d\\u6709\\u975e\\u6570\\u5b57\\u7684\\u5185\\u5bb9\\uff0c\\u5219\\u8f6c\\u6362\\u4e3aNaN.<\\/span><\\/p><p style=\\\"margin: 10px auto; padding: 0px; color: rgb(73, 73, 73); font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(244, 237, 227);\\\"><span style=\\\"margin: 0px; padding: 0px; font-size: 18px;\\\">\\u5982\\u679c\\u5b57\\u7b26\\u4e32\\u662f\\u4e00\\u4e2a\\u7a7a\\u4e32\\u6216\\u8005\\u662f\\u4e00\\u4e2a\\u5168\\u662f\\u7a7a\\u683c\\u7684\\u5b57\\u7b26\\u4e32\\uff0c\\u5219\\u8f6c\\u6362\\u4e3a0\\u3002null\\u8f6c\\u6362\\u6210number\\u7c7b\\u578b\\u4e3a0\\uff1bundefined\\u8f6c\\u6362\\u4e3anumber\\u7c7b\\u578b\\u4e3aNaN<\\/span><\\/p><p><br\\/><\\/p>\",\"is_show\":\"on\",\"_token\":\"CRLmyk5a1bnRSpnR5heYs2Z9mKGWoAVl3dKssLel\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/platform\\/content\"}', '2021-03-13 23:12:39', '2021-03-13 23:12:39');
INSERT INTO `exam_admin_operation_log` VALUES (911, 1, 'exam/admin/platform/content', 'GET', '172.18.0.1', '[]', '2021-03-13 23:12:40', '2021-03-13 23:12:40');
INSERT INTO `exam_admin_operation_log` VALUES (912, 1, 'exam/admin/wechat/user/score', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 00:04:26', '2021-03-14 00:04:26');
INSERT INTO `exam_admin_operation_log` VALUES (913, 1, 'exam/admin/platform/message/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 00:04:39', '2021-03-14 00:04:39');
INSERT INTO `exam_admin_operation_log` VALUES (914, 1, 'exam/admin/platform/message/content', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 00:04:42', '2021-03-14 00:04:42');
INSERT INTO `exam_admin_operation_log` VALUES (915, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 00:23:10', '2021-03-14 00:23:10');
INSERT INTO `exam_admin_operation_log` VALUES (916, 1, 'exam/admin/wechat/user/score', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 00:23:11', '2021-03-14 00:23:11');
INSERT INTO `exam_admin_operation_log` VALUES (917, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 00:23:30', '2021-03-14 00:23:30');
INSERT INTO `exam_admin_operation_log` VALUES (918, 1, 'exam/admin/auth/menu', 'POST', '172.18.0.1', '{\"_token\":\"CRLmyk5a1bnRSpnR5heYs2Z9mKGWoAVl3dKssLel\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":11,\\\"children\\\":[{\\\"id\\\":22},{\\\"id\\\":19},{\\\"id\\\":12},{\\\"id\\\":16,\\\"children\\\":[{\\\"id\\\":17},{\\\"id\\\":18}]},{\\\"id\\\":21}]},{\\\"id\\\":8,\\\"children\\\":[{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":13}]},{\\\"id\\\":14,\\\"children\\\":[{\\\"id\\\":15},{\\\"id\\\":20}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2021-03-14 00:23:54', '2021-03-14 00:23:54');
INSERT INTO `exam_admin_operation_log` VALUES (919, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 00:23:55', '2021-03-14 00:23:55');
INSERT INTO `exam_admin_operation_log` VALUES (920, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-14 00:23:57', '2021-03-14 00:23:57');
INSERT INTO `exam_admin_operation_log` VALUES (921, 1, 'exam/admin/platform/content', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 00:24:04', '2021-03-14 00:24:04');
INSERT INTO `exam_admin_operation_log` VALUES (922, 1, 'exam/admin/platform/score/setting', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 00:24:05', '2021-03-14 00:24:05');
INSERT INTO `exam_admin_operation_log` VALUES (923, 1, 'exam/admin/platform/const/setting', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 00:24:08', '2021-03-14 00:24:08');
INSERT INTO `exam_admin_operation_log` VALUES (924, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 00:24:18', '2021-03-14 00:24:18');
INSERT INTO `exam_admin_operation_log` VALUES (925, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-14 14:40:21', '2021-03-14 14:40:21');
INSERT INTO `exam_admin_operation_log` VALUES (926, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 14:40:28', '2021-03-14 14:40:28');
INSERT INTO `exam_admin_operation_log` VALUES (927, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 14:40:31', '2021-03-14 14:40:31');
INSERT INTO `exam_admin_operation_log` VALUES (928, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 14:40:32', '2021-03-14 14:40:32');
INSERT INTO `exam_admin_operation_log` VALUES (929, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 14:40:32', '2021-03-14 14:40:32');
INSERT INTO `exam_admin_operation_log` VALUES (930, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 14:47:41', '2021-03-14 14:47:41');
INSERT INTO `exam_admin_operation_log` VALUES (931, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 14:47:41', '2021-03-14 14:47:41');
INSERT INTO `exam_admin_operation_log` VALUES (932, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 14:47:43', '2021-03-14 14:47:43');
INSERT INTO `exam_admin_operation_log` VALUES (933, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 14:47:44', '2021-03-14 14:47:44');
INSERT INTO `exam_admin_operation_log` VALUES (934, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 14:47:45', '2021-03-14 14:47:45');
INSERT INTO `exam_admin_operation_log` VALUES (935, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 15:01:40', '2021-03-14 15:01:40');
INSERT INTO `exam_admin_operation_log` VALUES (936, 1, 'exam/admin/auth/menu', 'POST', '172.18.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u8bd5\\u9898\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"exam\",\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\"}', '2021-03-14 15:01:53', '2021-03-14 15:01:53');
INSERT INTO `exam_admin_operation_log` VALUES (937, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-14 15:01:54', '2021-03-14 15:01:54');
INSERT INTO `exam_admin_operation_log` VALUES (938, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-14 15:01:56', '2021-03-14 15:01:56');
INSERT INTO `exam_admin_operation_log` VALUES (939, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 15:02:01', '2021-03-14 15:02:01');
INSERT INTO `exam_admin_operation_log` VALUES (940, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 15:02:04', '2021-03-14 15:02:04');
INSERT INTO `exam_admin_operation_log` VALUES (941, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 15:08:54', '2021-03-14 15:08:54');
INSERT INTO `exam_admin_operation_log` VALUES (942, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 15:09:19', '2021-03-14 15:09:19');
INSERT INTO `exam_admin_operation_log` VALUES (943, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 15:09:43', '2021-03-14 15:09:43');
INSERT INTO `exam_admin_operation_log` VALUES (944, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 15:10:10', '2021-03-14 15:10:10');
INSERT INTO `exam_admin_operation_log` VALUES (945, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 15:10:22', '2021-03-14 15:10:22');
INSERT INTO `exam_admin_operation_log` VALUES (946, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 15:10:59', '2021-03-14 15:10:59');
INSERT INTO `exam_admin_operation_log` VALUES (947, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 15:11:22', '2021-03-14 15:11:22');
INSERT INTO `exam_admin_operation_log` VALUES (948, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 15:11:40', '2021-03-14 15:11:40');
INSERT INTO `exam_admin_operation_log` VALUES (949, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 15:12:57', '2021-03-14 15:12:57');
INSERT INTO `exam_admin_operation_log` VALUES (950, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 15:13:18', '2021-03-14 15:13:18');
INSERT INTO `exam_admin_operation_log` VALUES (951, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 15:13:39', '2021-03-14 15:13:39');
INSERT INTO `exam_admin_operation_log` VALUES (952, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 15:13:58', '2021-03-14 15:13:58');
INSERT INTO `exam_admin_operation_log` VALUES (953, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 15:14:14', '2021-03-14 15:14:14');
INSERT INTO `exam_admin_operation_log` VALUES (954, 1, 'exam/admin/exam', 'POST', '172.18.0.1', '{\"uuid\":\"D2492076-4914-74F1-F1B7-26DE2BE4E550\",\"title\":\"12\",\"analysis\":\"12\",\"tips\":\"12\",\"options\":{\"new_1\":{\"title\":\"1\",\"check\":\"0\",\"is_check\":[\"0\",null],\"_remove_\":\"0\"},\"new_2\":{\"title\":\"12\",\"check\":\"0\",\"is_check\":[\"0\",null],\"_remove_\":\"0\"},\"new_3\":{\"title\":\"12\",\"check\":\"0\",\"is_check\":[\"0\",null],\"_remove_\":\"0\"},\"new_4\":{\"title\":\"12\",\"check\":\"0\",\"is_check\":[\"0\",null],\"_remove_\":\"0\"}},\"answer\":[\"1\",\"2\",null],\"tips_expend_score\":\"1\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\"}', '2021-03-14 15:14:48', '2021-03-14 15:14:48');
INSERT INTO `exam_admin_operation_log` VALUES (955, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 15:14:49', '2021-03-14 15:14:49');
INSERT INTO `exam_admin_operation_log` VALUES (956, 1, 'exam/admin/exam', 'POST', '172.18.0.1', '{\"uuid\":\"CD8FA71E-7730-FAB6-B61D-7072746EE9A7\",\"title\":\"12\",\"analysis\":\"12\",\"tips\":\"12\",\"options\":{\"new_1\":{\"title\":\"1\",\"check\":\"0\",\"is_check\":[null],\"_remove_\":\"0\"},\"new_2\":{\"title\":\"12\",\"check\":\"0\",\"is_check\":[null],\"_remove_\":\"0\"},\"new_3\":{\"title\":\"12\",\"check\":\"0\",\"is_check\":[null],\"_remove_\":\"0\"},\"new_4\":{\"title\":\"12\",\"check\":\"0\",\"is_check\":[null],\"_remove_\":\"0\"}},\"answer\":[\"1\",\"2\",null],\"tips_expend_score\":\"1\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\"}', '2021-03-14 15:15:23', '2021-03-14 15:15:23');
INSERT INTO `exam_admin_operation_log` VALUES (957, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 15:15:24', '2021-03-14 15:15:24');
INSERT INTO `exam_admin_operation_log` VALUES (958, 1, 'exam/admin/exam', 'POST', '172.18.0.1', '{\"uuid\":\"A94C8D63-0EE1-2EAD-AD8D-5421CB7EB0CF\",\"title\":\"12\",\"analysis\":\"12\",\"tips\":\"12\",\"options\":{\"new_1\":{\"title\":\"1\",\"check\":\"0\",\"is_check\":[null],\"_remove_\":\"0\"},\"new_2\":{\"title\":\"12\",\"check\":\"0\",\"is_check\":[null],\"_remove_\":\"0\"},\"new_3\":{\"title\":\"12\",\"check\":\"0\",\"is_check\":[null],\"_remove_\":\"0\"},\"new_4\":{\"title\":\"12\",\"check\":\"0\",\"is_check\":[null],\"_remove_\":\"0\"}},\"answer\":[\"1\",\"2\",null],\"tips_expend_score\":\"1\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\"}', '2021-03-14 15:15:53', '2021-03-14 15:15:53');
INSERT INTO `exam_admin_operation_log` VALUES (959, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 15:15:54', '2021-03-14 15:15:54');
INSERT INTO `exam_admin_operation_log` VALUES (960, 1, 'exam/admin/exam', 'POST', '172.18.0.1', '{\"uuid\":\"3A200EBE-BA7E-D9D0-D0E6-8DEF3C44B0C4\",\"title\":\"12\",\"analysis\":\"12\",\"tips\":\"12\",\"options\":{\"new_1\":{\"title\":\"1\",\"check\":\"0\",\"is_check\":[null],\"_remove_\":\"0\"},\"new_2\":{\"title\":\"12\",\"check\":\"0\",\"is_check\":[null],\"_remove_\":\"0\"},\"new_3\":{\"title\":\"12\",\"check\":\"0\",\"is_check\":[null],\"_remove_\":\"0\"},\"new_4\":{\"title\":\"12\",\"check\":\"0\",\"is_check\":[null],\"_remove_\":\"0\"}},\"answer\":[\"1\",\"2\",null],\"tips_expend_score\":\"1\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\"}', '2021-03-14 15:17:00', '2021-03-14 15:17:00');
INSERT INTO `exam_admin_operation_log` VALUES (961, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 15:17:01', '2021-03-14 15:17:01');
INSERT INTO `exam_admin_operation_log` VALUES (962, 1, 'exam/admin/exam', 'POST', '172.18.0.1', '{\"uuid\":\"6BEB4A56-94CD-EE43-436E-C5B32B0307DE\",\"title\":\"12\",\"analysis\":\"12\",\"tips\":\"12\",\"options\":{\"new_1\":{\"title\":\"1\",\"check\":\"0\",\"is_check\":[null],\"_remove_\":\"0\"},\"new_2\":{\"title\":\"12\",\"check\":\"0\",\"is_check\":[null],\"_remove_\":\"0\"},\"new_3\":{\"title\":\"12\",\"check\":\"0\",\"is_check\":[null],\"_remove_\":\"0\"},\"new_4\":{\"title\":\"12\",\"check\":\"0\",\"is_check\":[null],\"_remove_\":\"0\"}},\"answer\":[\"1\",\"2\",null],\"tips_expend_score\":\"1\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\"}', '2021-03-14 15:18:06', '2021-03-14 15:18:06');
INSERT INTO `exam_admin_operation_log` VALUES (963, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 15:20:04', '2021-03-14 15:20:04');
INSERT INTO `exam_admin_operation_log` VALUES (964, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 15:20:07', '2021-03-14 15:20:07');
INSERT INTO `exam_admin_operation_log` VALUES (965, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 15:20:19', '2021-03-14 15:20:19');
INSERT INTO `exam_admin_operation_log` VALUES (966, 1, 'exam/admin/exam', 'POST', '172.18.0.1', '{\"uuid\":\"B3DCEE50-06B7-8144-44B6-B54C9D9D403D\",\"title\":\"\\u73a9\\u8f6cdnmp\\u4e4bport\\u7bc7\",\"analysis\":\"123\",\"tips\":\"123\",\"options\":{\"new_1\":{\"title\":\"1\",\"check\":\"0\",\"is_check\":[\"0\",null],\"_remove_\":\"0\"}},\"answer\":[\"1\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\"}', '2021-03-14 15:20:29', '2021-03-14 15:20:29');
INSERT INTO `exam_admin_operation_log` VALUES (967, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 15:21:07', '2021-03-14 15:21:07');
INSERT INTO `exam_admin_operation_log` VALUES (968, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 15:21:09', '2021-03-14 15:21:09');
INSERT INTO `exam_admin_operation_log` VALUES (969, 1, 'exam/admin/exam', 'POST', '172.18.0.1', '{\"uuid\":\"3A4DE2A7-6504-DF8E-8E25-A35619110BDA\",\"title\":\"\\u73a9\\u8f6cdnmp\\u4e4bport\\u7bc7\",\"analysis\":null,\"tips\":null,\"options\":{\"new_1\":{\"title\":\"12\",\"check\":\"0\",\"is_check\":[\"0\",null],\"_remove_\":\"0\"}},\"answer\":[\"1\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\"}', '2021-03-14 15:21:18', '2021-03-14 15:21:18');
INSERT INTO `exam_admin_operation_log` VALUES (970, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 15:21:19', '2021-03-14 15:21:19');
INSERT INTO `exam_admin_operation_log` VALUES (971, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 15:21:50', '2021-03-14 15:21:50');
INSERT INTO `exam_admin_operation_log` VALUES (972, 1, 'exam/admin/exam', 'POST', '172.18.0.1', '{\"uuid\":\"B5077F51-5A65-3B8F-8FFB-A400C2B39E73\",\"title\":\"\\u73a9\\u8f6cdnmp\\u4e4bport\\u7bc7\",\"analysis\":null,\"tips\":null,\"options\":{\"new_1\":{\"title\":\"1\",\"check\":\"0\",\"is_check\":[\"0\",null],\"_remove_\":\"0\"}},\"answer\":[\"2\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\"}', '2021-03-14 15:22:00', '2021-03-14 15:22:00');
INSERT INTO `exam_admin_operation_log` VALUES (973, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 15:22:00', '2021-03-14 15:22:00');
INSERT INTO `exam_admin_operation_log` VALUES (974, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 15:22:59', '2021-03-14 15:22:59');
INSERT INTO `exam_admin_operation_log` VALUES (975, 1, 'exam/admin/exam', 'POST', '172.18.0.1', '{\"uuid\":\"184C3167-AF1C-A4EA-EAF4-70A9ADA66E2A\",\"title\":\"123123\",\"analysis\":null,\"tips\":null,\"options\":{\"new_1\":{\"title\":\"12\",\"check\":\"1\",\"is_check\":[\"0\",\"1\",null],\"_remove_\":\"0\"}},\"answer\":[null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"off\",\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\"}', '2021-03-14 15:23:18', '2021-03-14 15:23:18');
INSERT INTO `exam_admin_operation_log` VALUES (976, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 15:23:18', '2021-03-14 15:23:18');
INSERT INTO `exam_admin_operation_log` VALUES (977, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 15:26:42', '2021-03-14 15:26:42');
INSERT INTO `exam_admin_operation_log` VALUES (978, 1, 'exam/admin/exam', 'POST', '172.18.0.1', '{\"uuid\":\"05BBA7ED-62CD-1E4C-4C5D-5F7B151D3DCA\",\"title\":\"\\u73a9\\u8f6cdnmp\\u4e4bport\\u7bc7\",\"analysis\":null,\"tips\":null,\"option\":{\"new_1\":{\"title\":\"12\",\"check\":\"1\",\"is_check\":[\"0\",\"1\",null],\"_remove_\":\"0\"}},\"answer\":[null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\"}', '2021-03-14 15:26:55', '2021-03-14 15:26:55');
INSERT INTO `exam_admin_operation_log` VALUES (979, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 15:26:55', '2021-03-14 15:26:55');
INSERT INTO `exam_admin_operation_log` VALUES (980, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 15:27:28', '2021-03-14 15:27:28');
INSERT INTO `exam_admin_operation_log` VALUES (981, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 15:28:01', '2021-03-14 15:28:01');
INSERT INTO `exam_admin_operation_log` VALUES (982, 1, 'exam/admin/exam', 'POST', '172.18.0.1', '{\"uuid\":\"58F90DDB-3075-6C3B-3B82-B77CF046E5CC\",\"title\":\"12\",\"analysis\":null,\"tips\":null,\"option\":{\"new_1\":{\"title\":\"1\",\"check\":\"0\",\"is_check\":[\"0\",\"1\",null],\"_remove_\":\"0\"}},\"answer\":[null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\"}', '2021-03-14 15:28:13', '2021-03-14 15:28:13');
INSERT INTO `exam_admin_operation_log` VALUES (983, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 15:29:09', '2021-03-14 15:29:09');
INSERT INTO `exam_admin_operation_log` VALUES (984, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 15:29:11', '2021-03-14 15:29:11');
INSERT INTO `exam_admin_operation_log` VALUES (985, 1, 'exam/admin/exam', 'POST', '172.18.0.1', '{\"uuid\":\"3DC58F12-C7F1-7B13-1373-250D2B2F8B90\",\"title\":\"\\u73a9\\u8f6cdnmp\\u4e4bport\\u7bc7\",\"analysis\":\"123\",\"tips\":\"123\",\"option\":{\"new_1\":{\"title\":\"12\",\"check\":\"0\",\"is_check\":\"0\",\"_remove_\":\"0\"}},\"answer\":[\"2\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"off\",\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\"}', '2021-03-14 15:29:24', '2021-03-14 15:29:24');
INSERT INTO `exam_admin_operation_log` VALUES (986, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 15:29:32', '2021-03-14 15:29:32');
INSERT INTO `exam_admin_operation_log` VALUES (987, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 15:29:35', '2021-03-14 15:29:35');
INSERT INTO `exam_admin_operation_log` VALUES (988, 1, 'exam/admin/exam', 'POST', '172.18.0.1', '{\"uuid\":\"A07B6985-1F7C-0F35-35D4-99D007B76E60\",\"title\":\"\\u73a9\\u8f6cdnmp\\u4e4bport\\u7bc7\",\"analysis\":null,\"tips\":null,\"answer\":[\"0\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"off\",\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\"}', '2021-03-14 15:29:45', '2021-03-14 15:29:45');
INSERT INTO `exam_admin_operation_log` VALUES (989, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 15:29:45', '2021-03-14 15:29:45');
INSERT INTO `exam_admin_operation_log` VALUES (990, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 15:31:32', '2021-03-14 15:31:32');
INSERT INTO `exam_admin_operation_log` VALUES (991, 1, 'exam/admin/exam', 'POST', '172.18.0.1', '{\"uuid\":\"F7495EDB-E89D-F12B-2BEA-E249BAA616D7\",\"title\":\"iTerm2 + Oh My Zsh \\u6253\\u9020\\u8212\\u9002\\u7ec8\\u7aef\\u4f53\\u9a8c\",\"analysis\":null,\"tips\":null,\"option\":{\"new_1\":{\"title\":\"1\",\"check\":\"0\",\"is_check\":\"0\",\"_remove_\":\"0\"}},\"answer\":[null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"off\",\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\"}', '2021-03-14 15:31:40', '2021-03-14 15:31:40');
INSERT INTO `exam_admin_operation_log` VALUES (992, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 15:31:40', '2021-03-14 15:31:40');
INSERT INTO `exam_admin_operation_log` VALUES (993, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 15:35:27', '2021-03-14 15:35:27');
INSERT INTO `exam_admin_operation_log` VALUES (994, 1, 'exam/admin/exam', 'POST', '172.18.0.1', '{\"uuid\":\"7ECF2B1F-90D5-4C18-187B-C8956530D9A8\",\"title\":\"\\u73a9\\u8f6cdnmp\\u4e4bport\\u7bc7\",\"analysis\":null,\"tips\":null,\"option\":{\"new_1\":{\"title\":\"1\",\"check\":\"0\",\"is_check\":\"0\",\"_remove_\":\"0\"}},\"answer\":[null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"off\",\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\"}', '2021-03-14 15:35:33', '2021-03-14 15:35:33');
INSERT INTO `exam_admin_operation_log` VALUES (995, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 15:35:34', '2021-03-14 15:35:34');
INSERT INTO `exam_admin_operation_log` VALUES (996, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 15:37:04', '2021-03-14 15:37:04');
INSERT INTO `exam_admin_operation_log` VALUES (997, 1, 'exam/admin/exam', 'POST', '172.18.0.1', '{\"uuid\":\"F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE\",\"title\":\"\\u73a9\\u8f6cdnmp\\u4e4bport\\u7bc7\",\"analysis\":null,\"tips\":null,\"option\":{\"new_1\":{\"title\":\"1\",\"check\":\"0\",\"is_check\":\"1\",\"_remove_\":\"0\"}},\"answer\":\"0\",\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\"}', '2021-03-14 15:37:12', '2021-03-14 15:37:12');
INSERT INTO `exam_admin_operation_log` VALUES (998, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 15:37:13', '2021-03-14 15:37:13');
INSERT INTO `exam_admin_operation_log` VALUES (999, 1, 'exam/admin/exam/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 15:37:23', '2021-03-14 15:37:23');
INSERT INTO `exam_admin_operation_log` VALUES (1000, 1, 'exam/admin/exam/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-14 15:39:51', '2021-03-14 15:39:51');
INSERT INTO `exam_admin_operation_log` VALUES (1001, 1, 'exam/admin/exam/1', 'PUT', '172.18.0.1', '{\"uuid\":\"F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE\",\"title\":\"\\u73a9\\u8f6cdnmp\\u4e4bport\\u7bc7\",\"analysis\":null,\"tips\":null,\"option\":[{\"title\":\"1\",\"check\":\"0\",\"is_check\":\"1\",\"_remove_\":\"0\"}],\"answer\":[\"0\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/create\"}', '2021-03-14 15:39:59', '2021-03-14 15:39:59');
INSERT INTO `exam_admin_operation_log` VALUES (1002, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 15:39:59', '2021-03-14 15:39:59');
INSERT INTO `exam_admin_operation_log` VALUES (1003, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 15:40:01', '2021-03-14 15:40:01');
INSERT INTO `exam_admin_operation_log` VALUES (1004, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 15:40:18', '2021-03-14 15:40:18');
INSERT INTO `exam_admin_operation_log` VALUES (1005, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 15:40:31', '2021-03-14 15:40:31');
INSERT INTO `exam_admin_operation_log` VALUES (1006, 1, 'exam/admin/exam/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 15:40:34', '2021-03-14 15:40:34');
INSERT INTO `exam_admin_operation_log` VALUES (1007, 1, 'exam/admin/exam/1', 'PUT', '172.18.0.1', '{\"uuid\":\"F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE\",\"title\":\"\\u73a9\\u8f6cdnmp\\u4e4bport\\u7bc7\",\"analysis\":null,\"tips\":null,\"option\":{\"0\":{\"title\":\"1\",\"check\":\"0\",\"is_check\":\"1\",\"_remove_\":\"0\"},\"new_1\":{\"title\":\"2\",\"check\":\"0\",\"is_check\":\"0\",\"_remove_\":\"0\"}},\"answer\":[\"0\",\"1\",\"2\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\"}', '2021-03-14 15:40:44', '2021-03-14 15:40:44');
INSERT INTO `exam_admin_operation_log` VALUES (1008, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 15:40:44', '2021-03-14 15:40:44');
INSERT INTO `exam_admin_operation_log` VALUES (1009, 1, 'exam/admin/exam/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 15:40:47', '2021-03-14 15:40:47');
INSERT INTO `exam_admin_operation_log` VALUES (1010, 1, 'exam/admin/exam/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-14 15:41:42', '2021-03-14 15:41:42');
INSERT INTO `exam_admin_operation_log` VALUES (1011, 1, 'exam/admin/exam/1', 'PUT', '172.18.0.1', '{\"uuid\":\"F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE\",\"title\":\"\\u73a9\\u8f6cdnmp\\u4e4bport\\u7bc7\",\"analysis\":null,\"tips\":null,\"option\":[{\"title\":\"1\",\"check\":\"0\",\"is_check\":\"1\",\"_remove_\":\"0\"},{\"title\":\"2\",\"check\":\"0\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":[\"1\",\"2\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\"}', '2021-03-14 15:41:47', '2021-03-14 15:41:47');
INSERT INTO `exam_admin_operation_log` VALUES (1012, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 15:41:47', '2021-03-14 15:41:47');
INSERT INTO `exam_admin_operation_log` VALUES (1013, 1, 'exam/admin/exam/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 15:41:49', '2021-03-14 15:41:49');
INSERT INTO `exam_admin_operation_log` VALUES (1014, 1, 'exam/admin/exam/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-14 15:42:58', '2021-03-14 15:42:58');
INSERT INTO `exam_admin_operation_log` VALUES (1015, 1, 'exam/admin/exam/1', 'PUT', '172.18.0.1', '{\"uuid\":\"F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE\",\"title\":\"\\u73a9\\u8f6cdnmp\\u4e4bport\\u7bc7\",\"analysis\":null,\"tips\":null,\"option\":[{\"title\":\"1\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"2\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":[\"A\",\"C\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_method\":\"PUT\"}', '2021-03-14 15:43:10', '2021-03-14 15:43:10');
INSERT INTO `exam_admin_operation_log` VALUES (1016, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 15:43:11', '2021-03-14 15:43:11');
INSERT INTO `exam_admin_operation_log` VALUES (1017, 1, 'exam/admin/exam/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 15:43:26', '2021-03-14 15:43:26');
INSERT INTO `exam_admin_operation_log` VALUES (1018, 1, 'exam/admin/exam/1', 'PUT', '172.18.0.1', '{\"uuid\":\"F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE\",\"title\":\"\\u73a9\\u8f6cdnmp\\u4e4bport\\u7bc7\",\"analysis\":null,\"tips\":null,\"option\":{\"0\":{\"title\":\"1\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"1\":{\"title\":\"2\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_1\":{\"title\":\"1\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_2\":{\"title\":\"3\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}},\"answer\":[\"A\",\"B\",\"C\",\"D\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\"}', '2021-03-14 15:43:48', '2021-03-14 15:43:48');
INSERT INTO `exam_admin_operation_log` VALUES (1019, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 15:43:49', '2021-03-14 15:43:49');
INSERT INTO `exam_admin_operation_log` VALUES (1020, 1, 'exam/admin/exam/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 15:43:51', '2021-03-14 15:43:51');
INSERT INTO `exam_admin_operation_log` VALUES (1021, 1, 'exam/admin/exam/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-14 15:44:51', '2021-03-14 15:44:51');
INSERT INTO `exam_admin_operation_log` VALUES (1022, 1, 'exam/admin/exam/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-14 15:44:55', '2021-03-14 15:44:55');
INSERT INTO `exam_admin_operation_log` VALUES (1023, 1, 'exam/admin/exam/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-14 15:45:13', '2021-03-14 15:45:13');
INSERT INTO `exam_admin_operation_log` VALUES (1024, 1, 'exam/admin/exam/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-14 15:45:34', '2021-03-14 15:45:34');
INSERT INTO `exam_admin_operation_log` VALUES (1025, 1, 'exam/admin/exam/1', 'PUT', '172.18.0.1', '{\"uuid\":\"F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE\",\"title\":\"\\u4e0b\\u9762\\u90a3\\u4e2a\\u7b54\\u6848\\u662f\\u6b63\\u786e\\u7684\\uff1f\",\"option\":[{\"title\":\"\\u9009\\u9879\\u4e00\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\u9009\\u9879\\u4e8c\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\u9009\\u9879\\u4e09\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\u9009\\u9879\\u56db\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":[\"A\",\"B\",\"C\",\"D\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_method\":\"PUT\"}', '2021-03-14 15:52:01', '2021-03-14 15:52:01');
INSERT INTO `exam_admin_operation_log` VALUES (1026, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 15:52:02', '2021-03-14 15:52:02');
INSERT INTO `exam_admin_operation_log` VALUES (1027, 1, 'exam/admin/exam/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 15:52:04', '2021-03-14 15:52:04');
INSERT INTO `exam_admin_operation_log` VALUES (1028, 1, 'exam/admin/exam/1', 'PUT', '172.18.0.1', '{\"uuid\":\"F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE\",\"title\":\"\\u4e0b\\u9762\\u90a3\\u4e2a\\u7b54\\u6848\\u662f\\u6b63\\u786e\\u7684\\uff1f\",\"option\":[{\"title\":\"\\u9009\\u9879\\u4e00\",\"check\":\"A\",\"is_check\":\"1\",\"_remove_\":\"0\"},{\"title\":\"\\u9009\\u9879\\u4e8c\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\u9009\\u9879\\u4e09\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\u9009\\u9879\\u56db\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":[\"A\",\"B\",\"C\",\"D\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\"}', '2021-03-14 15:52:47', '2021-03-14 15:52:47');
INSERT INTO `exam_admin_operation_log` VALUES (1029, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 15:52:47', '2021-03-14 15:52:47');
INSERT INTO `exam_admin_operation_log` VALUES (1030, 1, 'exam/admin/exam/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 15:54:19', '2021-03-14 15:54:19');
INSERT INTO `exam_admin_operation_log` VALUES (1031, 1, 'exam/admin/exam/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-14 15:54:42', '2021-03-14 15:54:42');
INSERT INTO `exam_admin_operation_log` VALUES (1032, 1, 'exam/admin/exam/1', 'PUT', '172.18.0.1', '{\"uuid\":\"F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE\",\"title\":\"\\u4e0b\\u9762\\u90a3\\u4e2a\\u7b54\\u6848\\u662f\\u6b63\\u786e\\u7684\\uff1f\",\"option\":[{\"title\":\"\\u9009\\u9879\\u4e00\",\"check\":\"A\",\"is_check\":\"1\",\"_remove_\":\"0\"},{\"title\":\"\\u9009\\u9879\\u4e8c\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\u9009\\u9879\\u4e09\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\u9009\\u9879\\u56db\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":[\"A\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_method\":\"PUT\"}', '2021-03-14 15:54:48', '2021-03-14 15:54:48');
INSERT INTO `exam_admin_operation_log` VALUES (1033, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 15:54:49', '2021-03-14 15:54:49');
INSERT INTO `exam_admin_operation_log` VALUES (1034, 1, 'exam/admin/exam/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 15:54:52', '2021-03-14 15:54:52');
INSERT INTO `exam_admin_operation_log` VALUES (1035, 1, 'exam/admin/exam/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-14 15:55:14', '2021-03-14 15:55:14');
INSERT INTO `exam_admin_operation_log` VALUES (1036, 1, 'exam/admin/exam/1', 'PUT', '172.18.0.1', '{\"uuid\":\"F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE\",\"title\":\"\\u4e0b\\u9762\\u90a3\\u4e2a\\u7b54\\u6848\\u662f\\u6b63\\u786e\\u7684\\uff1f\",\"option\":[{\"title\":\"\\u9009\\u9879\\u4e00\",\"check\":\"A\",\"is_check\":\"1\",\"_remove_\":\"0\"},{\"title\":\"\\u9009\\u9879\\u4e8c\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\u9009\\u9879\\u4e09\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\u9009\\u9879\\u56db\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":\"A\",\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_method\":\"PUT\"}', '2021-03-14 15:55:18', '2021-03-14 15:55:18');
INSERT INTO `exam_admin_operation_log` VALUES (1037, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 15:55:19', '2021-03-14 15:55:19');
INSERT INTO `exam_admin_operation_log` VALUES (1038, 1, 'exam/admin/exam/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 15:55:26', '2021-03-14 15:55:26');
INSERT INTO `exam_admin_operation_log` VALUES (1039, 1, 'exam/admin/exam/1', 'PUT', '172.18.0.1', '{\"uuid\":\"F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE\",\"title\":\"\\u4e0b\\u9762\\u90a3\\u4e2a\\u7b54\\u6848\\u662f\\u6b63\\u786e\\u7684\\uff1f\",\"option\":[{\"title\":\"\\u9009\\u9879\\u4e00\",\"check\":\"A\",\"is_check\":\"1\",\"_remove_\":\"0\"},{\"title\":\"\\u9009\\u9879\\u4e8c\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\u9009\\u9879\\u4e09\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\u9009\\u9879\\u56db\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":\"C\",\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\"}', '2021-03-14 15:55:30', '2021-03-14 15:55:30');
INSERT INTO `exam_admin_operation_log` VALUES (1040, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 15:55:30', '2021-03-14 15:55:30');
INSERT INTO `exam_admin_operation_log` VALUES (1041, 1, 'exam/admin/exam/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 15:55:41', '2021-03-14 15:55:41');
INSERT INTO `exam_admin_operation_log` VALUES (1042, 1, 'exam/admin/exam/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-14 16:01:16', '2021-03-14 16:01:16');
INSERT INTO `exam_admin_operation_log` VALUES (1043, 1, 'exam/admin/exam/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-14 16:01:40', '2021-03-14 16:01:40');
INSERT INTO `exam_admin_operation_log` VALUES (1044, 1, 'exam/admin/exam/1', 'PUT', '172.18.0.1', '{\"uuid\":\"F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE\",\"exam_category_uuid\":[\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"FB5D6E18-50EB-038E-8E71-9C3E17698A9F\",\"60CA1FCF-F8EB-2DE1-E1DB-5DDB8D0CED89\",null],\"title\":\"\\u4e0b\\u9762\\u90a3\\u4e2a\\u7b54\\u6848\\u662f\\u6b63\\u786e\\u7684\\uff1f\",\"option\":[{\"title\":\"\\u9009\\u9879\\u4e00\",\"check\":\"A\",\"is_check\":\"1\",\"_remove_\":\"0\"},{\"title\":\"\\u9009\\u9879\\u4e8c\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\u9009\\u9879\\u4e09\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\u9009\\u9879\\u56db\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":\"C\",\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_method\":\"PUT\"}', '2021-03-14 16:02:01', '2021-03-14 16:02:01');
INSERT INTO `exam_admin_operation_log` VALUES (1045, 1, 'exam/admin/exam/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-14 16:02:02', '2021-03-14 16:02:02');
INSERT INTO `exam_admin_operation_log` VALUES (1046, 1, 'exam/admin/exam/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-14 16:09:30', '2021-03-14 16:09:30');
INSERT INTO `exam_admin_operation_log` VALUES (1047, 1, 'exam/admin/exam/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-14 16:09:37', '2021-03-14 16:09:37');
INSERT INTO `exam_admin_operation_log` VALUES (1048, 1, 'exam/admin/exam/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-14 16:10:08', '2021-03-14 16:10:08');
INSERT INTO `exam_admin_operation_log` VALUES (1049, 1, 'exam/admin/exam/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-14 16:11:26', '2021-03-14 16:11:26');
INSERT INTO `exam_admin_operation_log` VALUES (1050, 1, 'exam/admin/exam/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-14 16:12:06', '2021-03-14 16:12:06');
INSERT INTO `exam_admin_operation_log` VALUES (1051, 1, 'exam/admin/exam/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-14 16:16:09', '2021-03-14 16:16:09');
INSERT INTO `exam_admin_operation_log` VALUES (1052, 1, 'exam/admin/exam/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-14 16:16:40', '2021-03-14 16:16:40');
INSERT INTO `exam_admin_operation_log` VALUES (1053, 1, 'exam/admin/exam/1/edit', 'GET', '172.18.0.1', '[]', '2021-03-14 16:17:13', '2021-03-14 16:17:13');
INSERT INTO `exam_admin_operation_log` VALUES (1054, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:17:47', '2021-03-14 16:17:47');
INSERT INTO `exam_admin_operation_log` VALUES (1055, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:17:48', '2021-03-14 16:17:48');
INSERT INTO `exam_admin_operation_log` VALUES (1056, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 16:18:08', '2021-03-14 16:18:08');
INSERT INTO `exam_admin_operation_log` VALUES (1057, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:18:16', '2021-03-14 16:18:16');
INSERT INTO `exam_admin_operation_log` VALUES (1058, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:18:17', '2021-03-14 16:18:17');
INSERT INTO `exam_admin_operation_log` VALUES (1059, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 16:18:26', '2021-03-14 16:18:26');
INSERT INTO `exam_admin_operation_log` VALUES (1060, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 16:20:04', '2021-03-14 16:20:04');
INSERT INTO `exam_admin_operation_log` VALUES (1061, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 16:20:28', '2021-03-14 16:20:28');
INSERT INTO `exam_admin_operation_log` VALUES (1062, 1, 'exam/admin/exam', 'POST', '172.18.0.1', '{\"uuid\":\"B9C182FE-E322-80BC-BCCF-E8A18CF59B20\",\"category\":[\"FB5D6E18-50EB-038E-8E71-9C3E17698A9F\",\"60CA1FCF-F8EB-2DE1-E1DB-5DDB8D0CED89\",null],\"title\":\"iTerm2 + Oh My Zsh \\u6253\\u9020\\u8212\\u9002\\u7ec8\\u7aef\\u4f53\\u9a8c\",\"option\":{\"new_1\":{\"title\":\"\\u00b7\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"}},\"answer\":\"A\",\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"off\",\"analysis\":null,\"tips\":null,\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\"}', '2021-03-14 16:20:40', '2021-03-14 16:20:40');
INSERT INTO `exam_admin_operation_log` VALUES (1063, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 16:20:40', '2021-03-14 16:20:40');
INSERT INTO `exam_admin_operation_log` VALUES (1064, 1, 'exam/admin/exam/2/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:21:21', '2021-03-14 16:21:21');
INSERT INTO `exam_admin_operation_log` VALUES (1065, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:22:27', '2021-03-14 16:22:27');
INSERT INTO `exam_admin_operation_log` VALUES (1066, 1, 'exam/admin/exam/2/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:22:29', '2021-03-14 16:22:29');
INSERT INTO `exam_admin_operation_log` VALUES (1067, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:23:42', '2021-03-14 16:23:42');
INSERT INTO `exam_admin_operation_log` VALUES (1068, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:23:43', '2021-03-14 16:23:43');
INSERT INTO `exam_admin_operation_log` VALUES (1069, 1, 'exam/admin/exam', 'POST', '172.18.0.1', '{\"category\":[\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",null],\"title\":\"iTerm2 + Oh My Zsh \\u6253\\u9020\\u8212\\u9002\\u7ec8\\u7aef\\u4f53\\u9a8c\",\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"off\",\"analysis\":null,\"tips\":null,\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\"}', '2021-03-14 16:23:48', '2021-03-14 16:23:48');
INSERT INTO `exam_admin_operation_log` VALUES (1070, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 16:23:49', '2021-03-14 16:23:49');
INSERT INTO `exam_admin_operation_log` VALUES (1071, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 16:24:23', '2021-03-14 16:24:23');
INSERT INTO `exam_admin_operation_log` VALUES (1072, 1, 'exam/admin/exam', 'POST', '172.18.0.1', '{\"category\":[\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",null],\"title\":\"iTerm2 + Oh My Zsh \\u6253\\u9020\\u8212\\u9002\\u7ec8\\u7aef\\u4f53\\u9a8c\",\"answer\":\"C\",\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"off\",\"analysis\":null,\"tips\":null,\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\"}', '2021-03-14 16:24:32', '2021-03-14 16:24:32');
INSERT INTO `exam_admin_operation_log` VALUES (1073, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 16:24:33', '2021-03-14 16:24:33');
INSERT INTO `exam_admin_operation_log` VALUES (1074, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 16:26:10', '2021-03-14 16:26:10');
INSERT INTO `exam_admin_operation_log` VALUES (1075, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:26:13', '2021-03-14 16:26:13');
INSERT INTO `exam_admin_operation_log` VALUES (1076, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:26:14', '2021-03-14 16:26:14');
INSERT INTO `exam_admin_operation_log` VALUES (1077, 1, 'exam/admin/exam', 'POST', '172.18.0.1', '{\"uuid\":\"C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179\",\"category\":[\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",null],\"title\":\"\\u73a9\\u8f6cdnmp\\u4e4bport\\u7bc7\",\"option\":{\"new_1\":{\"title\":\"12\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"}},\"answer\":\"C\",\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\"}', '2021-03-14 16:26:25', '2021-03-14 16:26:25');
INSERT INTO `exam_admin_operation_log` VALUES (1078, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 16:26:26', '2021-03-14 16:26:26');
INSERT INTO `exam_admin_operation_log` VALUES (1079, 1, 'exam/admin/exam/C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:28:01', '2021-03-14 16:28:01');
INSERT INTO `exam_admin_operation_log` VALUES (1080, 1, 'exam/admin/exam/C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179', 'PUT', '172.18.0.1', '{\"uuid\":\"C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179\",\"category\":[\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"4174470B-320E-8E5E-5EDF-A71758F3B65C\",\"60CA1FCF-F8EB-2DE1-E1DB-5DDB8D0CED89\",\"B7723424-2516-6479-799C-48147489616F\",null],\"title\":\"\\u73a9\\u8f6cdnmp\\u4e4bport\\u7bc7\",\"option\":[{\"title\":\"12\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":\"C\",\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\"}', '2021-03-14 16:28:07', '2021-03-14 16:28:07');
INSERT INTO `exam_admin_operation_log` VALUES (1081, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 16:28:08', '2021-03-14 16:28:08');
INSERT INTO `exam_admin_operation_log` VALUES (1082, 1, 'exam/admin/exam/C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:28:11', '2021-03-14 16:28:11');
INSERT INTO `exam_admin_operation_log` VALUES (1083, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:28:25', '2021-03-14 16:28:25');
INSERT INTO `exam_admin_operation_log` VALUES (1084, 1, 'exam/admin/exam/C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:28:28', '2021-03-14 16:28:28');
INSERT INTO `exam_admin_operation_log` VALUES (1085, 1, 'exam/admin/exam/C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179', 'PUT', '172.18.0.1', '{\"uuid\":\"C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179\",\"category\":[\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"FB5D6E18-50EB-038E-8E71-9C3E17698A9F\",\"4174470B-320E-8E5E-5EDF-A71758F3B65C\",\"60CA1FCF-F8EB-2DE1-E1DB-5DDB8D0CED89\",null],\"title\":\"\\u73a9\\u8f6cdnmp\\u4e4bport\\u7bc7\",\"option\":[{\"title\":\"12\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":\"C\",\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\"}', '2021-03-14 16:28:35', '2021-03-14 16:28:35');
INSERT INTO `exam_admin_operation_log` VALUES (1086, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 16:28:35', '2021-03-14 16:28:35');
INSERT INTO `exam_admin_operation_log` VALUES (1087, 1, 'exam/admin/exam/C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:28:38', '2021-03-14 16:28:38');
INSERT INTO `exam_admin_operation_log` VALUES (1088, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:29:12', '2021-03-14 16:29:12');
INSERT INTO `exam_admin_operation_log` VALUES (1089, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 16:29:33', '2021-03-14 16:29:33');
INSERT INTO `exam_admin_operation_log` VALUES (1090, 1, 'exam/admin/exam/C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:29:36', '2021-03-14 16:29:36');
INSERT INTO `exam_admin_operation_log` VALUES (1091, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:29:39', '2021-03-14 16:29:39');
INSERT INTO `exam_admin_operation_log` VALUES (1092, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 16:31:17', '2021-03-14 16:31:17');
INSERT INTO `exam_admin_operation_log` VALUES (1093, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:31:19', '2021-03-14 16:31:19');
INSERT INTO `exam_admin_operation_log` VALUES (1094, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:31:44', '2021-03-14 16:31:44');
INSERT INTO `exam_admin_operation_log` VALUES (1095, 1, 'exam/admin/exam/C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:31:46', '2021-03-14 16:31:46');
INSERT INTO `exam_admin_operation_log` VALUES (1096, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:31:48', '2021-03-14 16:31:48');
INSERT INTO `exam_admin_operation_log` VALUES (1097, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 16:35:53', '2021-03-14 16:35:53');
INSERT INTO `exam_admin_operation_log` VALUES (1098, 1, 'exam/admin/exam/C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:35:55', '2021-03-14 16:35:55');
INSERT INTO `exam_admin_operation_log` VALUES (1099, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 16:35:55', '2021-03-14 16:35:55');
INSERT INTO `exam_admin_operation_log` VALUES (1100, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 16:36:27', '2021-03-14 16:36:27');
INSERT INTO `exam_admin_operation_log` VALUES (1101, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:37:46', '2021-03-14 16:37:46');
INSERT INTO `exam_admin_operation_log` VALUES (1102, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 16:38:00', '2021-03-14 16:38:00');
INSERT INTO `exam_admin_operation_log` VALUES (1103, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 16:38:11', '2021-03-14 16:38:11');
INSERT INTO `exam_admin_operation_log` VALUES (1104, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 16:39:04', '2021-03-14 16:39:04');
INSERT INTO `exam_admin_operation_log` VALUES (1105, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-14 16:39:16', '2021-03-14 16:39:16');
INSERT INTO `exam_admin_operation_log` VALUES (1106, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:39:21', '2021-03-14 16:39:21');
INSERT INTO `exam_admin_operation_log` VALUES (1107, 1, 'exam/admin/exam/C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:39:23', '2021-03-14 16:39:23');
INSERT INTO `exam_admin_operation_log` VALUES (1108, 1, 'exam/admin/exam/C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179', 'PUT', '172.18.0.1', '{\"uuid\":\"C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179\",\"category\":[\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"4174470B-320E-8E5E-5EDF-A71758F3B65C\",null],\"title\":\"\\u73a9\\u8f6cdnmp\\u4e4bport\\u7bc7\",\"option\":[{\"title\":\"12\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":\"C\",\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\"}', '2021-03-14 16:39:26', '2021-03-14 16:39:26');
INSERT INTO `exam_admin_operation_log` VALUES (1109, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 16:39:27', '2021-03-14 16:39:27');
INSERT INTO `exam_admin_operation_log` VALUES (1110, 1, 'exam/admin/exam/C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:39:29', '2021-03-14 16:39:29');
INSERT INTO `exam_admin_operation_log` VALUES (1111, 1, 'exam/admin/exam/C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179/edit', 'GET', '172.18.0.1', '[]', '2021-03-14 16:40:11', '2021-03-14 16:40:11');
INSERT INTO `exam_admin_operation_log` VALUES (1112, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:40:14', '2021-03-14 16:40:14');
INSERT INTO `exam_admin_operation_log` VALUES (1113, 1, 'exam/admin/exam/C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:40:17', '2021-03-14 16:40:17');
INSERT INTO `exam_admin_operation_log` VALUES (1114, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:40:20', '2021-03-14 16:40:20');
INSERT INTO `exam_admin_operation_log` VALUES (1115, 1, 'exam/admin/exam/C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:40:35', '2021-03-14 16:40:35');
INSERT INTO `exam_admin_operation_log` VALUES (1116, 1, 'exam/admin/exam/C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179/edit', 'GET', '172.18.0.1', '[]', '2021-03-14 16:46:15', '2021-03-14 16:46:15');
INSERT INTO `exam_admin_operation_log` VALUES (1117, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:46:19', '2021-03-14 16:46:19');
INSERT INTO `exam_admin_operation_log` VALUES (1118, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 16:46:41', '2021-03-14 16:46:41');
INSERT INTO `exam_admin_operation_log` VALUES (1119, 1, 'exam/admin/exam/C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:46:43', '2021-03-14 16:46:43');
INSERT INTO `exam_admin_operation_log` VALUES (1120, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:47:37', '2021-03-14 16:47:37');
INSERT INTO `exam_admin_operation_log` VALUES (1121, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:47:41', '2021-03-14 16:47:41');
INSERT INTO `exam_admin_operation_log` VALUES (1122, 1, 'exam/admin/exam/category/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:47:43', '2021-03-14 16:47:43');
INSERT INTO `exam_admin_operation_log` VALUES (1123, 1, 'exam/admin/exam/category', 'POST', '172.18.0.1', '{\"uuid\":\"DEE5C484-DA73-EF1A-1AD0-973C1DF9438F\",\"parent_id\":\"60CA1FCF-F8EB-2DE1-E1DB-5DDB8D0CED89\",\"title\":\"\\u73a9\\u8f6cdnmp\\u4e4bport\\u7bc7\",\"orders\":\"0\",\"remark\":null,\"is_show\":\"on\",\"is_home\":\"on\",\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-14 16:47:55', '2021-03-14 16:47:55');
INSERT INTO `exam_admin_operation_log` VALUES (1124, 1, 'exam/admin/exam/category/create', 'GET', '172.18.0.1', '[]', '2021-03-14 16:47:56', '2021-03-14 16:47:56');
INSERT INTO `exam_admin_operation_log` VALUES (1125, 1, 'exam/admin/exam/category', 'POST', '172.18.0.1', '{\"uuid\":\"6BF6707F-E8A9-C0DF-DF72-F3C3DC9C42ED\",\"parent_id\":\"60CA1FCF-F8EB-2DE1-E1DB-5DDB8D0CED89\",\"title\":\"\\u73a9\\u8f6c\",\"orders\":\"0\",\"remark\":null,\"is_show\":\"on\",\"is_home\":\"on\",\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\"}', '2021-03-14 16:48:10', '2021-03-14 16:48:10');
INSERT INTO `exam_admin_operation_log` VALUES (1126, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '[]', '2021-03-14 16:48:12', '2021-03-14 16:48:12');
INSERT INTO `exam_admin_operation_log` VALUES (1127, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:48:16', '2021-03-14 16:48:16');
INSERT INTO `exam_admin_operation_log` VALUES (1128, 1, 'exam/admin/exam/C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:48:18', '2021-03-14 16:48:18');
INSERT INTO `exam_admin_operation_log` VALUES (1129, 1, 'exam/admin/exam/C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179', 'PUT', '172.18.0.1', '{\"uuid\":\"C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179\",\"category\":[\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"4174470B-320E-8E5E-5EDF-A71758F3B65C\",\"6BF6707F-E8A9-C0DF-DF72-F3C3DC9C42ED\",null],\"title\":\"\\u73a9\\u8f6cdnmp\\u4e4bport\\u7bc7\",\"option\":[{\"title\":\"12\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":\"C\",\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\"}', '2021-03-14 16:48:23', '2021-03-14 16:48:23');
INSERT INTO `exam_admin_operation_log` VALUES (1130, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 16:48:24', '2021-03-14 16:48:24');
INSERT INTO `exam_admin_operation_log` VALUES (1131, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 16:48:44', '2021-03-14 16:48:44');
INSERT INTO `exam_admin_operation_log` VALUES (1132, 1, 'exam/admin/exam/C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:48:46', '2021-03-14 16:48:46');
INSERT INTO `exam_admin_operation_log` VALUES (1133, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:48:49', '2021-03-14 16:48:49');
INSERT INTO `exam_admin_operation_log` VALUES (1134, 1, 'exam/admin/exam/B9C182FE-E322-80BC-BCCF-E8A18CF59B20/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:48:53', '2021-03-14 16:48:53');
INSERT INTO `exam_admin_operation_log` VALUES (1135, 1, 'exam/admin/exam/B9C182FE-E322-80BC-BCCF-E8A18CF59B20', 'PUT', '172.18.0.1', '{\"uuid\":\"B9C182FE-E322-80BC-BCCF-E8A18CF59B20\",\"category\":[\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"FB5D6E18-50EB-038E-8E71-9C3E17698A9F\",\"4174470B-320E-8E5E-5EDF-A71758F3B65C\",\"3EDC7F23-1329-1B4A-4AEC-009768BD627C\",null],\"title\":\"iTerm2 + Oh My Zsh \\u6253\\u9020\\u8212\\u9002\\u7ec8\\u7aef\\u4f53\\u9a8c\",\"option\":[{\"title\":\"\\u00b7\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":\"A\",\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\"}', '2021-03-14 16:49:02', '2021-03-14 16:49:02');
INSERT INTO `exam_admin_operation_log` VALUES (1136, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 16:49:02', '2021-03-14 16:49:02');
INSERT INTO `exam_admin_operation_log` VALUES (1137, 1, 'exam/admin/exam/B9C182FE-E322-80BC-BCCF-E8A18CF59B20/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:49:05', '2021-03-14 16:49:05');
INSERT INTO `exam_admin_operation_log` VALUES (1138, 1, 'exam/admin/exam/B9C182FE-E322-80BC-BCCF-E8A18CF59B20/edit', 'GET', '172.18.0.1', '[]', '2021-03-14 16:55:41', '2021-03-14 16:55:41');
INSERT INTO `exam_admin_operation_log` VALUES (1139, 1, 'exam/admin/exam/B9C182FE-E322-80BC-BCCF-E8A18CF59B20', 'PUT', '172.18.0.1', '{\"uuid\":\"B9C182FE-E322-80BC-BCCF-E8A18CF59B20\",\"category\":[\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"FB5D6E18-50EB-038E-8E71-9C3E17698A9F\",\"4174470B-320E-8E5E-5EDF-A71758F3B65C\",\"3EDC7F23-1329-1B4A-4AEC-009768BD627C\",null],\"title\":\"iTerm2 + Oh My Zsh \\u6253\\u9020\\u8212\\u9002\\u7ec8\\u7aef\\u4f53\\u9a8c\",\"option\":[{\"title\":\"\\u00b7\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":[\"A\",\"D\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\"}', '2021-03-14 16:55:45', '2021-03-14 16:55:45');
INSERT INTO `exam_admin_operation_log` VALUES (1140, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 16:55:46', '2021-03-14 16:55:46');
INSERT INTO `exam_admin_operation_log` VALUES (1141, 1, 'exam/admin/exam/C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:55:48', '2021-03-14 16:55:48');
INSERT INTO `exam_admin_operation_log` VALUES (1142, 1, 'exam/admin/exam/C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179', 'PUT', '172.18.0.1', '{\"uuid\":\"C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179\",\"category\":[\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"4174470B-320E-8E5E-5EDF-A71758F3B65C\",\"6BF6707F-E8A9-C0DF-DF72-F3C3DC9C42ED\",null],\"title\":\"\\u73a9\\u8f6cdnmp\\u4e4bport\\u7bc7\",\"option\":[{\"title\":\"12\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":[\"A\",\"C\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\"}', '2021-03-14 16:55:51', '2021-03-14 16:55:51');
INSERT INTO `exam_admin_operation_log` VALUES (1143, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 16:55:52', '2021-03-14 16:55:52');
INSERT INTO `exam_admin_operation_log` VALUES (1144, 1, 'exam/admin/exam/C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:55:54', '2021-03-14 16:55:54');
INSERT INTO `exam_admin_operation_log` VALUES (1145, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:56:10', '2021-03-14 16:56:10');
INSERT INTO `exam_admin_operation_log` VALUES (1146, 1, 'exam/admin/exam/C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 16:56:13', '2021-03-14 16:56:13');
INSERT INTO `exam_admin_operation_log` VALUES (1147, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 17:51:52', '2021-03-14 17:51:52');
INSERT INTO `exam_admin_operation_log` VALUES (1148, 1, 'exam/admin/exam/B9C182FE-E322-80BC-BCCF-E8A18CF59B20/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 17:51:55', '2021-03-14 17:51:55');
INSERT INTO `exam_admin_operation_log` VALUES (1149, 1, 'exam/admin/exam/B9C182FE-E322-80BC-BCCF-E8A18CF59B20', 'PUT', '172.18.0.1', '{\"uuid\":\"B9C182FE-E322-80BC-BCCF-E8A18CF59B20\",\"category\":[\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"FB5D6E18-50EB-038E-8E71-9C3E17698A9F\",\"4174470B-320E-8E5E-5EDF-A71758F3B65C\",\"3EDC7F23-1329-1B4A-4AEC-009768BD627C\",null],\"title\":\"iTerm2 + Oh My Zsh \\u6253\\u9020\\u8212\\u9002\\u7ec8\\u7aef\\u4f53\\u9a8c\",\"option\":[{\"title\":\"\\u00b7\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":[\"A\",\"D\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\"}', '2021-03-14 17:52:02', '2021-03-14 17:52:02');
INSERT INTO `exam_admin_operation_log` VALUES (1150, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 17:52:03', '2021-03-14 17:52:03');
INSERT INTO `exam_admin_operation_log` VALUES (1151, 1, 'exam/admin/exam/F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 18:32:41', '2021-03-14 18:32:41');
INSERT INTO `exam_admin_operation_log` VALUES (1152, 1, 'exam/admin/exam/F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE', 'PUT', '172.18.0.1', '{\"uuid\":\"F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE\",\"category\":[null],\"title\":\"\\u4e0b\\u9762\\u90a3\\u4e2a\\u7b54\\u6848\\u662f\\u6b63\\u786e\\u7684\\uff1f\",\"option\":[{\"title\":\"\\u9009\\u9879\\u4e00\",\"check\":\"A\",\"is_check\":\"1\",\"_remove_\":\"0\"},{\"title\":\"\\u9009\\u9879\\u4e8c\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\u9009\\u9879\\u4e09\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\u9009\\u9879\\u56db\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":[\"C\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\"}', '2021-03-14 18:32:50', '2021-03-14 18:32:50');
INSERT INTO `exam_admin_operation_log` VALUES (1153, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 18:32:51', '2021-03-14 18:32:51');
INSERT INTO `exam_admin_operation_log` VALUES (1154, 1, 'exam/admin/exam/C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 18:32:54', '2021-03-14 18:32:54');
INSERT INTO `exam_admin_operation_log` VALUES (1155, 1, 'exam/admin/exam/C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179', 'PUT', '172.18.0.1', '{\"uuid\":\"C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179\",\"category\":[\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"4174470B-320E-8E5E-5EDF-A71758F3B65C\",\"6BF6707F-E8A9-C0DF-DF72-F3C3DC9C42ED\",null],\"title\":\"\\u73a9\\u8f6cdnmp\\u4e4bport\\u7bc7\",\"option\":[{\"title\":\"12\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":[\"A\",\"C\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\"}', '2021-03-14 18:33:10', '2021-03-14 18:33:10');
INSERT INTO `exam_admin_operation_log` VALUES (1156, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 18:33:11', '2021-03-14 18:33:11');
INSERT INTO `exam_admin_operation_log` VALUES (1157, 1, 'exam/admin/exam/F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 18:34:36', '2021-03-14 18:34:36');
INSERT INTO `exam_admin_operation_log` VALUES (1158, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 18:34:43', '2021-03-14 18:34:43');
INSERT INTO `exam_admin_operation_log` VALUES (1159, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 18:38:26', '2021-03-14 18:38:26');
INSERT INTO `exam_admin_operation_log` VALUES (1160, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 18:39:19', '2021-03-14 18:39:19');
INSERT INTO `exam_admin_operation_log` VALUES (1161, 1, 'exam/admin/auth/menu/10/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 18:39:23', '2021-03-14 18:39:23');
INSERT INTO `exam_admin_operation_log` VALUES (1162, 1, 'exam/admin/auth/menu/10', 'PUT', '172.18.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u8bd5\\u5377\\u6807\\u7b7e\",\"icon\":\"fa-bars\",\"uri\":\"exam\\/tag\",\"roles\":[null],\"permission\":null,\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/auth\\/menu\"}', '2021-03-14 18:39:32', '2021-03-14 18:39:32');
INSERT INTO `exam_admin_operation_log` VALUES (1163, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-14 18:39:33', '2021-03-14 18:39:33');
INSERT INTO `exam_admin_operation_log` VALUES (1164, 1, 'exam/admin/auth/menu', 'POST', '172.18.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u8bd5\\u5377\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"exam\\/collection\",\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\"}', '2021-03-14 20:10:27', '2021-03-14 20:10:27');
INSERT INTO `exam_admin_operation_log` VALUES (1165, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-14 20:10:28', '2021-03-14 20:10:28');
INSERT INTO `exam_admin_operation_log` VALUES (1166, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-14 20:11:34', '2021-03-14 20:11:34');
INSERT INTO `exam_admin_operation_log` VALUES (1167, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-14 20:12:18', '2021-03-14 20:12:18');
INSERT INTO `exam_admin_operation_log` VALUES (1168, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-14 20:12:21', '2021-03-14 20:12:21');
INSERT INTO `exam_admin_operation_log` VALUES (1169, 1, 'exam/admin/auth/menu', 'POST', '172.18.0.1', '{\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":11,\\\"children\\\":[{\\\"id\\\":22},{\\\"id\\\":19},{\\\"id\\\":12},{\\\"id\\\":16,\\\"children\\\":[{\\\"id\\\":17},{\\\"id\\\":18}]},{\\\"id\\\":21}]},{\\\"id\\\":8,\\\"children\\\":[{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":23},{\\\"id\\\":24},{\\\"id\\\":13}]},{\\\"id\\\":14,\\\"children\\\":[{\\\"id\\\":15},{\\\"id\\\":20}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2021-03-14 20:13:22', '2021-03-14 20:13:22');
INSERT INTO `exam_admin_operation_log` VALUES (1170, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 20:13:23', '2021-03-14 20:13:23');
INSERT INTO `exam_admin_operation_log` VALUES (1171, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-14 20:13:27', '2021-03-14 20:13:27');
INSERT INTO `exam_admin_operation_log` VALUES (1172, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 20:13:31', '2021-03-14 20:13:31');
INSERT INTO `exam_admin_operation_log` VALUES (1173, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 20:13:33', '2021-03-14 20:13:33');
INSERT INTO `exam_admin_operation_log` VALUES (1174, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 20:13:35', '2021-03-14 20:13:35');
INSERT INTO `exam_admin_operation_log` VALUES (1175, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 20:13:37', '2021-03-14 20:13:37');
INSERT INTO `exam_admin_operation_log` VALUES (1176, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 20:13:37', '2021-03-14 20:13:37');
INSERT INTO `exam_admin_operation_log` VALUES (1177, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 20:14:31', '2021-03-14 20:14:31');
INSERT INTO `exam_admin_operation_log` VALUES (1178, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 20:14:34', '2021-03-14 20:14:34');
INSERT INTO `exam_admin_operation_log` VALUES (1179, 1, 'exam/admin/exam/collection/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 20:14:36', '2021-03-14 20:14:36');
INSERT INTO `exam_admin_operation_log` VALUES (1180, 1, 'exam/admin/exam/collection/create', 'GET', '172.18.0.1', '[]', '2021-03-14 20:18:55', '2021-03-14 20:18:55');
INSERT INTO `exam_admin_operation_log` VALUES (1181, 1, 'exam/admin/exam/collection/create', 'GET', '172.18.0.1', '[]', '2021-03-14 20:19:12', '2021-03-14 20:19:12');
INSERT INTO `exam_admin_operation_log` VALUES (1182, 1, 'exam/admin/exam/collection/create', 'GET', '172.18.0.1', '[]', '2021-03-14 20:20:30', '2021-03-14 20:20:30');
INSERT INTO `exam_admin_operation_log` VALUES (1183, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 20:28:20', '2021-03-14 20:28:20');
INSERT INTO `exam_admin_operation_log` VALUES (1184, 1, 'exam/admin/exam/collection/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 20:28:24', '2021-03-14 20:28:24');
INSERT INTO `exam_admin_operation_log` VALUES (1185, 1, 'exam/admin/exam/collection', 'POST', '172.18.0.1', '{\"uuid\":\"4737259C-CAB2-8E06-0606-BCC280A5BE38\",\"exam_category_uuid\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"exam_tag_uuid\":\"31707ff9a527199e008d988b83756fb3\",\"title\":\"\\u73a9\\u8f6cdnmp\\u4e4bport\\u7bc7\",\"exam_time\":\"23:58:00\",\"submit_number\":\"0\",\"is_recommend\":\"on\",\"is_show\":\"on\",\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/collection\"}', '2021-03-14 20:28:39', '2021-03-14 20:28:39');
INSERT INTO `exam_admin_operation_log` VALUES (1186, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-14 20:28:40', '2021-03-14 20:28:40');
INSERT INTO `exam_admin_operation_log` VALUES (1187, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-14 20:30:36', '2021-03-14 20:30:36');
INSERT INTO `exam_admin_operation_log` VALUES (1188, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"title\":null,\"is_show\":null,\"exam_category_uuid\":\"4174470B-320E-8E5E-5EDF-A71758F3B65C\",\"exam_tag_uuid\":null,\"_pjax\":\"#pjax-container\"}', '2021-03-14 20:30:41', '2021-03-14 20:30:41');
INSERT INTO `exam_admin_operation_log` VALUES (1189, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 20:30:45', '2021-03-14 20:30:45');
INSERT INTO `exam_admin_operation_log` VALUES (1190, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 20:30:52', '2021-03-14 20:30:52');
INSERT INTO `exam_admin_operation_log` VALUES (1191, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-14 20:31:24', '2021-03-14 20:31:24');
INSERT INTO `exam_admin_operation_log` VALUES (1192, 1, 'exam/admin/exam/collection/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 20:31:29', '2021-03-14 20:31:29');
INSERT INTO `exam_admin_operation_log` VALUES (1193, 1, 'exam/admin/exam/collection', 'POST', '172.18.0.1', '{\"uuid\":\"8718A6B8-FEA1-74E1-E193-AAD53DD5B577\",\"exam_category_uuid\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"exam_tag_uuid\":\"31707ff9a527199e008d988b83756fb3\",\"title\":\"\\u73a9\\u8f6cdnmp\\u4e4bport\\u7bc7\",\"exam_time\":\"23:59:00\",\"submit_number\":\"0\",\"is_recommend\":\"on\",\"is_show\":\"on\",\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/collection\"}', '2021-03-14 20:31:43', '2021-03-14 20:31:43');
INSERT INTO `exam_admin_operation_log` VALUES (1194, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-14 20:31:44', '2021-03-14 20:31:44');
INSERT INTO `exam_admin_operation_log` VALUES (1195, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-03-14 20:31:47', '2021-03-14 20:31:47');
INSERT INTO `exam_admin_operation_log` VALUES (1196, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-03-14 20:31:50', '2021-03-14 20:31:50');
INSERT INTO `exam_admin_operation_log` VALUES (1197, 1, 'exam/admin/exam/collection/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 20:31:54', '2021-03-14 20:31:54');
INSERT INTO `exam_admin_operation_log` VALUES (1198, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 20:32:04', '2021-03-14 20:32:04');
INSERT INTO `exam_admin_operation_log` VALUES (1199, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-14 20:35:28', '2021-03-14 20:35:28');
INSERT INTO `exam_admin_operation_log` VALUES (1200, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 21:02:01', '2021-03-14 21:02:01');
INSERT INTO `exam_admin_operation_log` VALUES (1201, 1, 'exam/admin/auth/menu', 'POST', '172.18.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u8bd5\\u9898\\u7ec4\\u4ef6\",\"icon\":\"fa-bars\",\"uri\":\"widget\\/exam\",\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\"}', '2021-03-14 21:02:21', '2021-03-14 21:02:21');
INSERT INTO `exam_admin_operation_log` VALUES (1202, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-14 21:02:21', '2021-03-14 21:02:21');
INSERT INTO `exam_admin_operation_log` VALUES (1203, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-14 21:02:27', '2021-03-14 21:02:27');
INSERT INTO `exam_admin_operation_log` VALUES (1204, 1, 'exam/admin/widget/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 21:02:31', '2021-03-14 21:02:31');
INSERT INTO `exam_admin_operation_log` VALUES (1205, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 21:02:41', '2021-03-14 21:02:41');
INSERT INTO `exam_admin_operation_log` VALUES (1206, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 21:02:47', '2021-03-14 21:02:47');
INSERT INTO `exam_admin_operation_log` VALUES (1207, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '[]', '2021-03-14 21:03:08', '2021-03-14 21:03:08');
INSERT INTO `exam_admin_operation_log` VALUES (1208, 1, 'exam/admin/widget/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 21:03:14', '2021-03-14 21:03:14');
INSERT INTO `exam_admin_operation_log` VALUES (1209, 1, 'exam/admin/widget/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 21:04:29', '2021-03-14 21:04:29');
INSERT INTO `exam_admin_operation_log` VALUES (1210, 1, 'exam/admin/widget/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 21:05:26', '2021-03-14 21:05:26');
INSERT INTO `exam_admin_operation_log` VALUES (1211, 1, 'exam/admin/widget/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 21:05:35', '2021-03-14 21:05:35');
INSERT INTO `exam_admin_operation_log` VALUES (1212, 1, 'exam/admin/widget/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 21:06:03', '2021-03-14 21:06:03');
INSERT INTO `exam_admin_operation_log` VALUES (1213, 1, 'exam/admin/widget/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 21:06:45', '2021-03-14 21:06:45');
INSERT INTO `exam_admin_operation_log` VALUES (1214, 1, 'exam/admin/widget/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 21:07:46', '2021-03-14 21:07:46');
INSERT INTO `exam_admin_operation_log` VALUES (1215, 1, 'exam/admin/widget/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 21:09:18', '2021-03-14 21:09:18');
INSERT INTO `exam_admin_operation_log` VALUES (1216, 1, 'exam/admin/widget/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 21:12:38', '2021-03-14 21:12:38');
INSERT INTO `exam_admin_operation_log` VALUES (1217, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 21:17:45', '2021-03-14 21:17:45');
INSERT INTO `exam_admin_operation_log` VALUES (1218, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Admin_Exam_Collection\",\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_action\":\"App_Admin_Actions_Exam_Collection\"}', '2021-03-14 21:17:49', '2021-03-14 21:17:49');
INSERT INTO `exam_admin_operation_log` VALUES (1219, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Admin_Exam_Collection\",\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_action\":\"App_Admin_Actions_Exam_Collection\"}', '2021-03-14 21:17:52', '2021-03-14 21:17:52');
INSERT INTO `exam_admin_operation_log` VALUES (1220, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-14 21:18:19', '2021-03-14 21:18:19');
INSERT INTO `exam_admin_operation_log` VALUES (1221, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 21:18:23', '2021-03-14 21:18:23');
INSERT INTO `exam_admin_operation_log` VALUES (1222, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 21:18:31', '2021-03-14 21:18:31');
INSERT INTO `exam_admin_operation_log` VALUES (1223, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Admin_Exam_Collection\",\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_action\":\"App_Admin_Actions_Exam_Collection\"}', '2021-03-14 21:18:34', '2021-03-14 21:18:34');
INSERT INTO `exam_admin_operation_log` VALUES (1224, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Admin_Exam_Collection\",\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_action\":\"App_Admin_Actions_Exam_Collection\"}', '2021-03-14 21:18:42', '2021-03-14 21:18:42');
INSERT INTO `exam_admin_operation_log` VALUES (1225, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Admin_Exam_Collection\",\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_action\":\"App_Admin_Actions_Exam_Collection\"}', '2021-03-14 21:19:11', '2021-03-14 21:19:11');
INSERT INTO `exam_admin_operation_log` VALUES (1226, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-14 21:23:23', '2021-03-14 21:23:23');
INSERT INTO `exam_admin_operation_log` VALUES (1227, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Admin_Exam_Collection\",\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_action\":\"App_Admin_Actions_Exam_Collection\"}', '2021-03-14 21:23:27', '2021-03-14 21:23:27');
INSERT INTO `exam_admin_operation_log` VALUES (1228, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 21:29:31', '2021-03-14 21:29:31');
INSERT INTO `exam_admin_operation_log` VALUES (1229, 1, 'exam/admin/auth/menu/25/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 21:29:38', '2021-03-14 21:29:38');
INSERT INTO `exam_admin_operation_log` VALUES (1230, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 21:30:40', '2021-03-14 21:30:40');
INSERT INTO `exam_admin_operation_log` VALUES (1231, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Admin_Exam_Collection\",\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_action\":\"App_Admin_Actions_Exam_Collection\"}', '2021-03-14 21:30:49', '2021-03-14 21:30:49');
INSERT INTO `exam_admin_operation_log` VALUES (1232, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-14 21:32:09', '2021-03-14 21:32:09');
INSERT INTO `exam_admin_operation_log` VALUES (1233, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-14 21:32:42', '2021-03-14 21:32:42');
INSERT INTO `exam_admin_operation_log` VALUES (1234, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-14 21:33:06', '2021-03-14 21:33:06');
INSERT INTO `exam_admin_operation_log` VALUES (1235, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-14 21:34:36', '2021-03-14 21:34:36');
INSERT INTO `exam_admin_operation_log` VALUES (1236, 1, 'exam/admin/widget/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 21:36:22', '2021-03-14 21:36:22');
INSERT INTO `exam_admin_operation_log` VALUES (1237, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 21:37:05', '2021-03-14 21:37:05');
INSERT INTO `exam_admin_operation_log` VALUES (1238, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-14 21:37:25', '2021-03-14 21:37:25');
INSERT INTO `exam_admin_operation_log` VALUES (1239, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-14 21:37:53', '2021-03-14 21:37:53');
INSERT INTO `exam_admin_operation_log` VALUES (1240, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Admin_Exam_Collection\",\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_action\":\"App_Admin_Actions_Exam_Collection\"}', '2021-03-14 21:37:57', '2021-03-14 21:37:57');
INSERT INTO `exam_admin_operation_log` VALUES (1241, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-14 21:39:59', '2021-03-14 21:39:59');
INSERT INTO `exam_admin_operation_log` VALUES (1242, 1, 'exam/admin/widget/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 21:40:04', '2021-03-14 21:40:04');
INSERT INTO `exam_admin_operation_log` VALUES (1243, 1, 'exam/admin/widget/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 21:40:12', '2021-03-14 21:40:12');
INSERT INTO `exam_admin_operation_log` VALUES (1244, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 21:40:15', '2021-03-14 21:40:15');
INSERT INTO `exam_admin_operation_log` VALUES (1245, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-14 21:40:17', '2021-03-14 21:40:17');
INSERT INTO `exam_admin_operation_log` VALUES (1246, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-14 21:41:46', '2021-03-14 21:41:46');
INSERT INTO `exam_admin_operation_log` VALUES (1247, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-14 21:42:24', '2021-03-14 21:42:24');
INSERT INTO `exam_admin_operation_log` VALUES (1248, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-14 21:42:39', '2021-03-14 21:42:39');
INSERT INTO `exam_admin_operation_log` VALUES (1249, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-14 21:47:03', '2021-03-14 21:47:03');
INSERT INTO `exam_admin_operation_log` VALUES (1250, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 21:47:10', '2021-03-14 21:47:10');
INSERT INTO `exam_admin_operation_log` VALUES (1251, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '[]', '2021-03-14 21:47:42', '2021-03-14 21:47:42');
INSERT INTO `exam_admin_operation_log` VALUES (1252, 1, 'exam/admin/widget/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 21:47:58', '2021-03-14 21:47:58');
INSERT INTO `exam_admin_operation_log` VALUES (1253, 1, 'exam/admin/widget/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 21:48:12', '2021-03-14 21:48:12');
INSERT INTO `exam_admin_operation_log` VALUES (1254, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 21:48:18', '2021-03-14 21:48:18');
INSERT INTO `exam_admin_operation_log` VALUES (1255, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 21:48:23', '2021-03-14 21:48:23');
INSERT INTO `exam_admin_operation_log` VALUES (1256, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '[]', '2021-03-14 21:48:55', '2021-03-14 21:48:55');
INSERT INTO `exam_admin_operation_log` VALUES (1257, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '[]', '2021-03-14 21:49:08', '2021-03-14 21:49:08');
INSERT INTO `exam_admin_operation_log` VALUES (1258, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '[]', '2021-03-14 21:49:13', '2021-03-14 21:49:13');
INSERT INTO `exam_admin_operation_log` VALUES (1259, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 21:49:19', '2021-03-14 21:49:19');
INSERT INTO `exam_admin_operation_log` VALUES (1260, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 21:49:21', '2021-03-14 21:49:21');
INSERT INTO `exam_admin_operation_log` VALUES (1261, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '[]', '2021-03-14 21:49:52', '2021-03-14 21:49:52');
INSERT INTO `exam_admin_operation_log` VALUES (1262, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '[]', '2021-03-14 21:51:05', '2021-03-14 21:51:05');
INSERT INTO `exam_admin_operation_log` VALUES (1263, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '[]', '2021-03-14 21:51:24', '2021-03-14 21:51:24');
INSERT INTO `exam_admin_operation_log` VALUES (1264, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '[]', '2021-03-14 21:52:36', '2021-03-14 21:52:36');
INSERT INTO `exam_admin_operation_log` VALUES (1265, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '[]', '2021-03-14 21:52:54', '2021-03-14 21:52:54');
INSERT INTO `exam_admin_operation_log` VALUES (1266, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '[]', '2021-03-14 21:56:50', '2021-03-14 21:56:50');
INSERT INTO `exam_admin_operation_log` VALUES (1267, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '[]', '2021-03-14 21:57:37', '2021-03-14 21:57:37');
INSERT INTO `exam_admin_operation_log` VALUES (1268, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '[]', '2021-03-14 22:07:08', '2021-03-14 22:07:08');
INSERT INTO `exam_admin_operation_log` VALUES (1269, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '[]', '2021-03-14 22:07:32', '2021-03-14 22:07:32');
INSERT INTO `exam_admin_operation_log` VALUES (1270, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '[]', '2021-03-14 22:07:55', '2021-03-14 22:07:55');
INSERT INTO `exam_admin_operation_log` VALUES (1271, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 22:08:30', '2021-03-14 22:08:30');
INSERT INTO `exam_admin_operation_log` VALUES (1272, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 22:10:17', '2021-03-14 22:10:17');
INSERT INTO `exam_admin_operation_log` VALUES (1273, 1, 'exam/admin/auth/menu/25/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 22:10:23', '2021-03-14 22:10:23');
INSERT INTO `exam_admin_operation_log` VALUES (1274, 1, 'exam/admin/auth/menu/25', 'DELETE', '172.18.0.1', '{\"_method\":\"delete\",\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\"}', '2021-03-14 22:10:34', '2021-03-14 22:10:34');
INSERT INTO `exam_admin_operation_log` VALUES (1275, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 22:10:34', '2021-03-14 22:10:34');
INSERT INTO `exam_admin_operation_log` VALUES (1276, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 22:10:53', '2021-03-14 22:10:53');
INSERT INTO `exam_admin_operation_log` VALUES (1277, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 22:10:59', '2021-03-14 22:10:59');
INSERT INTO `exam_admin_operation_log` VALUES (1278, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 22:11:02', '2021-03-14 22:11:02');
INSERT INTO `exam_admin_operation_log` VALUES (1279, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-14 22:11:02', '2021-03-14 22:11:02');
INSERT INTO `exam_admin_operation_log` VALUES (1280, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 22:14:36', '2021-03-14 22:14:36');
INSERT INTO `exam_admin_operation_log` VALUES (1281, 1, 'exam/admin/auth/menu/23/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 22:14:44', '2021-03-14 22:14:44');
INSERT INTO `exam_admin_operation_log` VALUES (1282, 1, 'exam/admin/auth/menu/23', 'PUT', '172.18.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u8bd5\\u9898\\u9009\\u9879\",\"icon\":\"fa-bars\",\"uri\":\"exam\",\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/auth\\/menu\"}', '2021-03-14 22:14:51', '2021-03-14 22:14:51');
INSERT INTO `exam_admin_operation_log` VALUES (1283, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '[]', '2021-03-14 22:14:51', '2021-03-14 22:14:51');
INSERT INTO `exam_admin_operation_log` VALUES (1284, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 22:17:04', '2021-03-14 22:17:04');
INSERT INTO `exam_admin_operation_log` VALUES (1285, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 22:17:07', '2021-03-14 22:17:07');
INSERT INTO `exam_admin_operation_log` VALUES (1286, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\",\"per_page\":\"100\"}', '2021-03-14 22:17:12', '2021-03-14 22:17:12');
INSERT INTO `exam_admin_operation_log` VALUES (1287, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 22:17:13', '2021-03-14 22:17:13');
INSERT INTO `exam_admin_operation_log` VALUES (1288, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 22:17:18', '2021-03-14 22:17:18');
INSERT INTO `exam_admin_operation_log` VALUES (1289, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 22:17:21', '2021-03-14 22:17:21');
INSERT INTO `exam_admin_operation_log` VALUES (1290, 1, 'exam/admin/exam/F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 22:17:32', '2021-03-14 22:17:32');
INSERT INTO `exam_admin_operation_log` VALUES (1291, 1, 'exam/admin/exam/F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE', 'PUT', '172.18.0.1', '{\"uuid\":\"F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE\",\"category\":[\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",null],\"title\":\"\\u4e0b\\u9762\\u90a3\\u4e2a\\u7b54\\u6848\\u662f\\u6b63\\u786e\\u7684\\uff1f\",\"option\":[{\"title\":\"\\u9009\\u9879\\u4e00\",\"check\":\"A\",\"is_check\":\"1\",\"_remove_\":\"0\"},{\"title\":\"\\u9009\\u9879\\u4e8c\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\u9009\\u9879\\u4e09\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\u9009\\u9879\\u56db\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":[\"C\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\"}', '2021-03-14 22:17:38', '2021-03-14 22:17:38');
INSERT INTO `exam_admin_operation_log` VALUES (1292, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-14 22:17:39', '2021-03-14 22:17:39');
INSERT INTO `exam_admin_operation_log` VALUES (1293, 1, 'exam/admin/exam/B9C182FE-E322-80BC-BCCF-E8A18CF59B20/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 22:17:42', '2021-03-14 22:17:42');
INSERT INTO `exam_admin_operation_log` VALUES (1294, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 22:17:46', '2021-03-14 22:17:46');
INSERT INTO `exam_admin_operation_log` VALUES (1295, 1, 'exam/admin/exam/C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 22:17:49', '2021-03-14 22:17:49');
INSERT INTO `exam_admin_operation_log` VALUES (1296, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 22:17:53', '2021-03-14 22:17:53');
INSERT INTO `exam_admin_operation_log` VALUES (1297, 1, 'exam/admin/exam/collection/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 22:17:55', '2021-03-14 22:17:55');
INSERT INTO `exam_admin_operation_log` VALUES (1298, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 22:17:59', '2021-03-14 22:17:59');
INSERT INTO `exam_admin_operation_log` VALUES (1299, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 22:18:01', '2021-03-14 22:18:01');
INSERT INTO `exam_admin_operation_log` VALUES (1300, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '[]', '2021-03-14 22:19:07', '2021-03-14 22:19:07');
INSERT INTO `exam_admin_operation_log` VALUES (1301, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 22:19:21', '2021-03-14 22:19:21');
INSERT INTO `exam_admin_operation_log` VALUES (1302, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 22:19:24', '2021-03-14 22:19:24');
INSERT INTO `exam_admin_operation_log` VALUES (1303, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 22:19:28', '2021-03-14 22:19:28');
INSERT INTO `exam_admin_operation_log` VALUES (1304, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '[]', '2021-03-14 22:19:56', '2021-03-14 22:19:56');
INSERT INTO `exam_admin_operation_log` VALUES (1305, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 22:21:46', '2021-03-14 22:21:46');
INSERT INTO `exam_admin_operation_log` VALUES (1306, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '[]', '2021-03-14 22:22:21', '2021-03-14 22:22:21');
INSERT INTO `exam_admin_operation_log` VALUES (1307, 1, 'exam/admin/widget/exam/B9C182FE-E322-80BC-BCCF-E8A18CF59B20', 'GET', '172.18.0.1', '[]', '2021-03-14 22:23:27', '2021-03-14 22:23:27');
INSERT INTO `exam_admin_operation_log` VALUES (1308, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '[]', '2021-03-14 22:23:38', '2021-03-14 22:23:38');
INSERT INTO `exam_admin_operation_log` VALUES (1309, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 22:23:45', '2021-03-14 22:23:45');
INSERT INTO `exam_admin_operation_log` VALUES (1310, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 22:23:48', '2021-03-14 22:23:48');
INSERT INTO `exam_admin_operation_log` VALUES (1311, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '[]', '2021-03-14 22:32:27', '2021-03-14 22:32:27');
INSERT INTO `exam_admin_operation_log` VALUES (1312, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '[]', '2021-03-14 22:38:40', '2021-03-14 22:38:40');
INSERT INTO `exam_admin_operation_log` VALUES (1313, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '[]', '2021-03-14 22:42:05', '2021-03-14 22:42:05');
INSERT INTO `exam_admin_operation_log` VALUES (1314, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '[]', '2021-03-14 22:58:06', '2021-03-14 22:58:06');
INSERT INTO `exam_admin_operation_log` VALUES (1315, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 22:58:08', '2021-03-14 22:58:08');
INSERT INTO `exam_admin_operation_log` VALUES (1316, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 23:14:26', '2021-03-14 23:14:26');
INSERT INTO `exam_admin_operation_log` VALUES (1317, 1, 'exam/admin/exam/collection/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-14 23:14:29', '2021-03-14 23:14:29');
INSERT INTO `exam_admin_operation_log` VALUES (1318, 1, 'exam/admin/exam/collection/1', 'PUT', '172.18.0.1', '{\"uuid\":\"4737259C-CAB2-8E06-0606-BCC280A5BE38\",\"exam_category_uuid\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"exam_tag_uuid\":\"31707ff9a527199e008d988b83756fb3\",\"title\":\"\\u73a9\\u8f6cdnmp\\u4e4bport\\u7bc7\",\"exam_time\":\"23:58:00\",\"submit_number\":\"5\",\"is_recommend\":\"on\",\"is_show\":\"on\",\"_token\":\"r1gWsSlKWfDVzOjSzp7OzHoo5dWXvrY2JMXidk4K\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/collection\"}', '2021-03-14 23:14:36', '2021-03-14 23:14:36');
INSERT INTO `exam_admin_operation_log` VALUES (1319, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-14 23:14:36', '2021-03-14 23:14:36');
INSERT INTO `exam_admin_operation_log` VALUES (1320, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-17 20:03:07', '2021-03-17 20:03:07');
INSERT INTO `exam_admin_operation_log` VALUES (1321, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-17 20:03:15', '2021-03-17 20:03:15');
INSERT INTO `exam_admin_operation_log` VALUES (1322, 1, 'exam/admin/exam/collection/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-17 20:03:18', '2021-03-17 20:03:18');
INSERT INTO `exam_admin_operation_log` VALUES (1323, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-17 20:03:24', '2021-03-17 20:03:24');
INSERT INTO `exam_admin_operation_log` VALUES (1324, 1, 'exam/admin/widget/exam/8718A6B8-FEA1-74E1-E193-AAD53DD5B577', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-17 20:03:27', '2021-03-17 20:03:27');
INSERT INTO `exam_admin_operation_log` VALUES (1325, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-17 20:03:35', '2021-03-17 20:03:35');
INSERT INTO `exam_admin_operation_log` VALUES (1326, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-17 20:03:38', '2021-03-17 20:03:38');
INSERT INTO `exam_admin_operation_log` VALUES (1327, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-17 20:03:39', '2021-03-17 20:03:39');
INSERT INTO `exam_admin_operation_log` VALUES (1328, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-17 20:03:41', '2021-03-17 20:03:41');
INSERT INTO `exam_admin_operation_log` VALUES (1329, 1, 'exam/admin/exam/F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-17 20:03:46', '2021-03-17 20:03:46');
INSERT INTO `exam_admin_operation_log` VALUES (1330, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-17 20:03:48', '2021-03-17 20:03:48');
INSERT INTO `exam_admin_operation_log` VALUES (1331, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-17 20:03:50', '2021-03-17 20:03:50');
INSERT INTO `exam_admin_operation_log` VALUES (1332, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-17 20:04:00', '2021-03-17 20:04:00');
INSERT INTO `exam_admin_operation_log` VALUES (1333, 1, 'exam/admin/exam/collection/2/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-17 20:23:22', '2021-03-17 20:23:22');
INSERT INTO `exam_admin_operation_log` VALUES (1334, 1, 'exam/admin/exam/collection/2', 'PUT', '172.18.0.1', '{\"uuid\":\"8718A6B8-FEA1-74E1-E193-AAD53DD5B577\",\"exam_category_uuid\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"exam_tag_uuid\":\"31707ff9a527199e008d988b83756fb3\",\"title\":\"1\",\"exam_time\":\"23:59:00\",\"submit_number\":\"0\",\"is_recommend\":\"on\",\"is_show\":\"on\",\"_token\":\"r2ZMqM5rpGox44RXo87gnVprYhT7YiPIEoPs88FR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/collection\"}', '2021-03-17 20:23:25', '2021-03-17 20:23:25');
INSERT INTO `exam_admin_operation_log` VALUES (1335, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-17 20:23:26', '2021-03-17 20:23:26');
INSERT INTO `exam_admin_operation_log` VALUES (1336, 1, 'exam/admin/exam/collection/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-17 20:23:28', '2021-03-17 20:23:28');
INSERT INTO `exam_admin_operation_log` VALUES (1337, 1, 'exam/admin/exam/collection/1', 'PUT', '172.18.0.1', '{\"uuid\":\"4737259C-CAB2-8E06-0606-BCC280A5BE38\",\"exam_category_uuid\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"exam_tag_uuid\":\"31707ff9a527199e008d988b83756fb3\",\"title\":\"2\",\"exam_time\":\"23:58:00\",\"submit_number\":\"5\",\"is_recommend\":\"on\",\"is_show\":\"on\",\"_token\":\"r2ZMqM5rpGox44RXo87gnVprYhT7YiPIEoPs88FR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/collection\"}', '2021-03-17 20:23:32', '2021-03-17 20:23:32');
INSERT INTO `exam_admin_operation_log` VALUES (1338, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-17 20:23:32', '2021-03-17 20:23:32');
INSERT INTO `exam_admin_operation_log` VALUES (1339, 1, 'exam/admin/exam/collection/1', 'PUT', '172.18.0.1', '{\"name\":\"title\",\"value\":\"1\",\"pk\":\"1\",\"_token\":\"r2ZMqM5rpGox44RXo87gnVprYhT7YiPIEoPs88FR\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-03-17 21:24:15', '2021-03-17 21:24:15');
INSERT INTO `exam_admin_operation_log` VALUES (1340, 1, 'exam/admin/exam/collection/2', 'PUT', '172.18.0.1', '{\"name\":\"title\",\"value\":\"2\",\"pk\":\"2\",\"_token\":\"r2ZMqM5rpGox44RXo87gnVprYhT7YiPIEoPs88FR\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-03-17 21:24:20', '2021-03-17 21:24:20');
INSERT INTO `exam_admin_operation_log` VALUES (1341, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-17 21:24:22', '2021-03-17 21:24:22');
INSERT INTO `exam_admin_operation_log` VALUES (1342, 1, 'exam/admin/exam/collection/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-17 21:29:49', '2021-03-17 21:29:49');
INSERT INTO `exam_admin_operation_log` VALUES (1343, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-17 21:29:51', '2021-03-17 21:29:51');
INSERT INTO `exam_admin_operation_log` VALUES (1344, 1, 'exam/admin/exam/collection/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-17 21:29:53', '2021-03-17 21:29:53');
INSERT INTO `exam_admin_operation_log` VALUES (1345, 1, 'exam/admin/exam/collection', 'POST', '172.18.0.1', '{\"uuid\":\"18774A75-753E-2418-18FF-31521AD2484F\",\"exam_category_uuid\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"exam_tag_uuid\":\"31707ff9a527199e008d988b83756fb3\",\"title\":\"3\",\"exam_time\":\"23:59:00\",\"submit_number\":\"0\",\"is_recommend\":\"on\",\"is_show\":\"on\",\"_token\":\"r2ZMqM5rpGox44RXo87gnVprYhT7YiPIEoPs88FR\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/collection\"}', '2021-03-17 21:30:11', '2021-03-17 21:30:11');
INSERT INTO `exam_admin_operation_log` VALUES (1346, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-17 21:30:26', '2021-03-17 21:30:26');
INSERT INTO `exam_admin_operation_log` VALUES (1347, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-17 21:34:17', '2021-03-17 21:34:17');
INSERT INTO `exam_admin_operation_log` VALUES (1348, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-17 21:34:18', '2021-03-17 21:34:18');
INSERT INTO `exam_admin_operation_log` VALUES (1349, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-17 21:34:19', '2021-03-17 21:34:19');
INSERT INTO `exam_admin_operation_log` VALUES (1350, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-17 21:34:27', '2021-03-17 21:34:27');
INSERT INTO `exam_admin_operation_log` VALUES (1351, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-17 21:34:32', '2021-03-17 21:34:32');
INSERT INTO `exam_admin_operation_log` VALUES (1352, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-17 21:38:23', '2021-03-17 21:38:23');
INSERT INTO `exam_admin_operation_log` VALUES (1353, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-17 21:39:37', '2021-03-17 21:39:37');
INSERT INTO `exam_admin_operation_log` VALUES (1354, 1, 'exam/admin/auth/menu', 'POST', '172.18.0.1', '{\"_token\":\"r2ZMqM5rpGox44RXo87gnVprYhT7YiPIEoPs88FR\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":11,\\\"children\\\":[{\\\"id\\\":22},{\\\"id\\\":19},{\\\"id\\\":12},{\\\"id\\\":16,\\\"children\\\":[{\\\"id\\\":17},{\\\"id\\\":18}]},{\\\"id\\\":21}]},{\\\"id\\\":8,\\\"children\\\":[{\\\"id\\\":9},{\\\"id\\\":23},{\\\"id\\\":10},{\\\"id\\\":24},{\\\"id\\\":13}]},{\\\"id\\\":14,\\\"children\\\":[{\\\"id\\\":15},{\\\"id\\\":20}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2021-03-17 21:39:44', '2021-03-17 21:39:44');
INSERT INTO `exam_admin_operation_log` VALUES (1355, 1, 'exam/admin/auth/menu', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-17 21:39:45', '2021-03-17 21:39:45');
INSERT INTO `exam_admin_operation_log` VALUES (1356, 1, 'exam/admin/exam/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-17 21:39:50', '2021-03-17 21:39:50');
INSERT INTO `exam_admin_operation_log` VALUES (1357, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-17 21:39:56', '2021-03-17 21:39:56');
INSERT INTO `exam_admin_operation_log` VALUES (1358, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-17 21:57:03', '2021-03-17 21:57:03');
INSERT INTO `exam_admin_operation_log` VALUES (1359, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-17 21:57:09', '2021-03-17 21:57:09');
INSERT INTO `exam_admin_operation_log` VALUES (1360, 1, 'exam/admin/exam/collection/3/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-17 21:57:14', '2021-03-17 21:57:14');
INSERT INTO `exam_admin_operation_log` VALUES (1361, 1, 'exam/admin/exam/collection/3', 'PUT', '172.18.0.1', '{\"uuid\":\"18774A75-753E-2418-18FF-31521AD2484F\",\"exam_category_uuid\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"exam_tag_uuid\":\"31707ff9a527199e008d988b83756fb3\",\"title\":\"\\u4e0a\\u6d772019\\u5e74\\u7269\\u7406\\u771f\\u9898\\u6d4b\\u8bd5\",\"exam_time\":\"23:59:00\",\"submit_number\":\"0\",\"is_recommend\":\"on\",\"is_show\":\"on\",\"_token\":\"r2ZMqM5rpGox44RXo87gnVprYhT7YiPIEoPs88FR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/collection\"}', '2021-03-17 21:57:32', '2021-03-17 21:57:32');
INSERT INTO `exam_admin_operation_log` VALUES (1362, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-17 21:57:32', '2021-03-17 21:57:32');
INSERT INTO `exam_admin_operation_log` VALUES (1363, 1, 'exam/admin/exam/collection/3/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-17 21:57:42', '2021-03-17 21:57:42');
INSERT INTO `exam_admin_operation_log` VALUES (1364, 1, 'exam/admin/exam/collection/3', 'PUT', '172.18.0.1', '{\"uuid\":\"18774A75-753E-2418-18FF-31521AD2484F\",\"exam_category_uuid\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"exam_tag_uuid\":\"31707ff9a527199e008d988b83756fb3\",\"title\":\"\\u4e0a\\u6d772019\\u5e74\\u7269\\u7406\\u771f\\u9898\\u6d4b\\u8bd5\\u4e0a\\u6d772019\\u5e74\\u7269\\u7406\\u771f\\u9898\\u6d4b\\u8bd5\",\"exam_time\":\"23:59:00\",\"submit_number\":\"0\",\"is_recommend\":\"on\",\"is_show\":\"on\",\"_token\":\"r2ZMqM5rpGox44RXo87gnVprYhT7YiPIEoPs88FR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/collection\"}', '2021-03-17 21:57:47', '2021-03-17 21:57:47');
INSERT INTO `exam_admin_operation_log` VALUES (1365, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-17 21:57:48', '2021-03-17 21:57:48');
INSERT INTO `exam_admin_operation_log` VALUES (1366, 1, 'exam/admin/exam/collection/3/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-17 21:59:44', '2021-03-17 21:59:44');
INSERT INTO `exam_admin_operation_log` VALUES (1367, 1, 'exam/admin/exam/collection/3', 'PUT', '172.18.0.1', '{\"uuid\":\"18774A75-753E-2418-18FF-31521AD2484F\",\"exam_category_uuid\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"exam_tag_uuid\":\"31707ff9a527199e008d988b83756fb3\",\"title\":\"\\u4e0a\\u6d772019\\u5e74\\u7269\\u7406\\u771f\\u9898\\u6d4b\\u8bd5\\u4e0a\\u6d772019\\u5e74\\u7269\\u7406\\u771f\\u9898\\u6d4b\\u8bd5\\u7406\\u771f\\u9898\\u6d4b\\u8bd5\",\"exam_time\":\"23:59:00\",\"submit_number\":\"0\",\"is_recommend\":\"on\",\"is_show\":\"on\",\"_token\":\"r2ZMqM5rpGox44RXo87gnVprYhT7YiPIEoPs88FR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/collection\"}', '2021-03-17 21:59:51', '2021-03-17 21:59:51');
INSERT INTO `exam_admin_operation_log` VALUES (1368, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-17 21:59:51', '2021-03-17 21:59:51');
INSERT INTO `exam_admin_operation_log` VALUES (1369, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 02:06:44', '2021-03-18 02:06:44');
INSERT INTO `exam_admin_operation_log` VALUES (1370, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 02:06:46', '2021-03-18 02:06:46');
INSERT INTO `exam_admin_operation_log` VALUES (1371, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '[]', '2021-03-18 02:12:26', '2021-03-18 02:12:26');
INSERT INTO `exam_admin_operation_log` VALUES (1372, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '[]', '2021-03-18 02:14:27', '2021-03-18 02:14:27');
INSERT INTO `exam_admin_operation_log` VALUES (1373, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '[]', '2021-03-18 02:15:09', '2021-03-18 02:15:09');
INSERT INTO `exam_admin_operation_log` VALUES (1374, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 02:15:54', '2021-03-18 02:15:54');
INSERT INTO `exam_admin_operation_log` VALUES (1375, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 02:17:27', '2021-03-18 02:17:27');
INSERT INTO `exam_admin_operation_log` VALUES (1376, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 02:17:33', '2021-03-18 02:17:33');
INSERT INTO `exam_admin_operation_log` VALUES (1377, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_model\":\"App_Models_Admin_Exam_Exam\",\"_key\":[\"F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE\",\"B9C182FE-E322-80BC-BCCF-E8A18CF59B20\",\"C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179\"],\"_token\":\"xuyev9E2PzeRSuLO1lmm7Y0LFTZ1AeHMMTgmw4vX\",\"_action\":\"App_Admin_Actions_Exam_BindExam\"}', '2021-03-18 02:17:42', '2021-03-18 02:17:42');
INSERT INTO `exam_admin_operation_log` VALUES (1378, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 02:17:44', '2021-03-18 02:17:44');
INSERT INTO `exam_admin_operation_log` VALUES (1379, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '[]', '2021-03-18 02:17:52', '2021-03-18 02:17:52');
INSERT INTO `exam_admin_operation_log` VALUES (1380, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_model\":\"App_Models_Admin_Exam_Exam\",\"_key\":[\"F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE\",\"B9C182FE-E322-80BC-BCCF-E8A18CF59B20\",\"C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179\"],\"_token\":\"xuyev9E2PzeRSuLO1lmm7Y0LFTZ1AeHMMTgmw4vX\",\"_action\":\"App_Admin_Actions_Exam_BindExam\"}', '2021-03-18 02:18:08', '2021-03-18 02:18:08');
INSERT INTO `exam_admin_operation_log` VALUES (1381, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_model\":\"App_Models_Admin_Exam_Exam\",\"_key\":[\"F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE\",\"B9C182FE-E322-80BC-BCCF-E8A18CF59B20\",\"C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179\"],\"_token\":\"xuyev9E2PzeRSuLO1lmm7Y0LFTZ1AeHMMTgmw4vX\",\"_action\":\"App_Admin_Actions_Exam_BindExam\"}', '2021-03-18 02:18:20', '2021-03-18 02:18:20');
INSERT INTO `exam_admin_operation_log` VALUES (1382, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_model\":\"App_Models_Admin_Exam_Exam\",\"_key\":[\"F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE\",\"B9C182FE-E322-80BC-BCCF-E8A18CF59B20\",\"C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179\"],\"_token\":\"xuyev9E2PzeRSuLO1lmm7Y0LFTZ1AeHMMTgmw4vX\",\"_action\":\"App_Admin_Actions_Exam_BindExam\"}', '2021-03-18 02:19:35', '2021-03-18 02:19:35');
INSERT INTO `exam_admin_operation_log` VALUES (1383, 1, 'exam/admin/widget/exam/4737259C-CAB2-8E06-0606-BCC280A5BE38', 'GET', '172.18.0.1', '[]', '2021-03-18 02:21:13', '2021-03-18 02:21:13');
INSERT INTO `exam_admin_operation_log` VALUES (1384, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_model\":\"App_Models_Admin_Exam_Exam\",\"_key\":[\"F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE\",\"B9C182FE-E322-80BC-BCCF-E8A18CF59B20\",\"C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179\"],\"_token\":\"xuyev9E2PzeRSuLO1lmm7Y0LFTZ1AeHMMTgmw4vX\",\"_action\":\"App_Admin_Actions_Exam_BindExam\"}', '2021-03-18 02:21:18', '2021-03-18 02:21:18');
INSERT INTO `exam_admin_operation_log` VALUES (1385, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_model\":\"App_Models_Admin_Exam_Exam\",\"_key\":[\"F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE\",\"B9C182FE-E322-80BC-BCCF-E8A18CF59B20\",\"C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179\"],\"_token\":\"xuyev9E2PzeRSuLO1lmm7Y0LFTZ1AeHMMTgmw4vX\",\"_action\":\"App_Admin_Actions_Exam_BindExam\"}', '2021-03-18 02:21:34', '2021-03-18 02:21:34');
INSERT INTO `exam_admin_operation_log` VALUES (1386, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 02:21:58', '2021-03-18 02:21:58');
INSERT INTO `exam_admin_operation_log` VALUES (1387, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 02:22:06', '2021-03-18 02:22:06');
INSERT INTO `exam_admin_operation_log` VALUES (1388, 1, 'exam/admin/exam/C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 02:22:15', '2021-03-18 02:22:15');
INSERT INTO `exam_admin_operation_log` VALUES (1389, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 02:31:12', '2021-03-18 02:31:12');
INSERT INTO `exam_admin_operation_log` VALUES (1390, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 02:38:51', '2021-03-18 02:38:51');
INSERT INTO `exam_admin_operation_log` VALUES (1391, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 02:39:24', '2021-03-18 02:39:24');
INSERT INTO `exam_admin_operation_log` VALUES (1392, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 02:39:27', '2021-03-18 02:39:27');
INSERT INTO `exam_admin_operation_log` VALUES (1393, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 02:39:35', '2021-03-18 02:39:35');
INSERT INTO `exam_admin_operation_log` VALUES (1394, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 02:39:36', '2021-03-18 02:39:36');
INSERT INTO `exam_admin_operation_log` VALUES (1395, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 02:39:38', '2021-03-18 02:39:38');
INSERT INTO `exam_admin_operation_log` VALUES (1396, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 02:39:47', '2021-03-18 02:39:47');
INSERT INTO `exam_admin_operation_log` VALUES (1397, 1, 'exam/admin/exam/collection/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 02:39:52', '2021-03-18 02:39:52');
INSERT INTO `exam_admin_operation_log` VALUES (1398, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 02:43:50', '2021-03-18 02:43:50');
INSERT INTO `exam_admin_operation_log` VALUES (1399, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 02:44:06', '2021-03-18 02:44:06');
INSERT INTO `exam_admin_operation_log` VALUES (1400, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 02:51:53', '2021-03-18 02:51:53');
INSERT INTO `exam_admin_operation_log` VALUES (1401, 1, 'exam/admin/exam/collection/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 02:52:02', '2021-03-18 02:52:02');
INSERT INTO `exam_admin_operation_log` VALUES (1402, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 02:52:04', '2021-03-18 02:52:04');
INSERT INTO `exam_admin_operation_log` VALUES (1403, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 02:54:35', '2021-03-18 02:54:35');
INSERT INTO `exam_admin_operation_log` VALUES (1404, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 02:56:03', '2021-03-18 02:56:03');
INSERT INTO `exam_admin_operation_log` VALUES (1405, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 02:57:02', '2021-03-18 02:57:02');
INSERT INTO `exam_admin_operation_log` VALUES (1406, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 02:57:18', '2021-03-18 02:57:18');
INSERT INTO `exam_admin_operation_log` VALUES (1407, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 02:57:25', '2021-03-18 02:57:25');
INSERT INTO `exam_admin_operation_log` VALUES (1408, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 02:57:33', '2021-03-18 02:57:33');
INSERT INTO `exam_admin_operation_log` VALUES (1409, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"type\":[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"190\",\"197\",\"999\",null],\"reason\":null,\"_key\":\"2\",\"_model\":\"App_Models_Admin_Exam_Collection\",\"_token\":\"xuyev9E2PzeRSuLO1lmm7Y0LFTZ1AeHMMTgmw4vX\",\"_action\":\"App_Admin_Actions_Exam_Collection\"}', '2021-03-18 02:58:29', '2021-03-18 02:58:29');
INSERT INTO `exam_admin_operation_log` VALUES (1410, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 03:02:05', '2021-03-18 03:02:05');
INSERT INTO `exam_admin_operation_log` VALUES (1411, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 03:03:02', '2021-03-18 03:03:02');
INSERT INTO `exam_admin_operation_log` VALUES (1412, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 03:04:03', '2021-03-18 03:04:03');
INSERT INTO `exam_admin_operation_log` VALUES (1413, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 03:05:20', '2021-03-18 03:05:20');
INSERT INTO `exam_admin_operation_log` VALUES (1414, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 03:06:41', '2021-03-18 03:06:41');
INSERT INTO `exam_admin_operation_log` VALUES (1415, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 03:07:19', '2021-03-18 03:07:19');
INSERT INTO `exam_admin_operation_log` VALUES (1416, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 03:07:52', '2021-03-18 03:07:52');
INSERT INTO `exam_admin_operation_log` VALUES (1417, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 03:09:02', '2021-03-18 03:09:02');
INSERT INTO `exam_admin_operation_log` VALUES (1418, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:14:16', '2021-03-18 03:14:16');
INSERT INTO `exam_admin_operation_log` VALUES (1419, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:14:21', '2021-03-18 03:14:21');
INSERT INTO `exam_admin_operation_log` VALUES (1420, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:17:12', '2021-03-18 03:17:12');
INSERT INTO `exam_admin_operation_log` VALUES (1421, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 03:17:13', '2021-03-18 03:17:13');
INSERT INTO `exam_admin_operation_log` VALUES (1422, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 03:17:13', '2021-03-18 03:17:13');
INSERT INTO `exam_admin_operation_log` VALUES (1423, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 03:17:14', '2021-03-18 03:17:14');
INSERT INTO `exam_admin_operation_log` VALUES (1424, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 03:17:14', '2021-03-18 03:17:14');
INSERT INTO `exam_admin_operation_log` VALUES (1425, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 03:17:14', '2021-03-18 03:17:14');
INSERT INTO `exam_admin_operation_log` VALUES (1426, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 03:17:15', '2021-03-18 03:17:15');
INSERT INTO `exam_admin_operation_log` VALUES (1427, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 03:17:15', '2021-03-18 03:17:15');
INSERT INTO `exam_admin_operation_log` VALUES (1428, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 03:17:16', '2021-03-18 03:17:16');
INSERT INTO `exam_admin_operation_log` VALUES (1429, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 03:17:16', '2021-03-18 03:17:16');
INSERT INTO `exam_admin_operation_log` VALUES (1430, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 03:17:17', '2021-03-18 03:17:17');
INSERT INTO `exam_admin_operation_log` VALUES (1431, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 03:17:17', '2021-03-18 03:17:17');
INSERT INTO `exam_admin_operation_log` VALUES (1432, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 03:17:17', '2021-03-18 03:17:17');
INSERT INTO `exam_admin_operation_log` VALUES (1433, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 03:17:18', '2021-03-18 03:17:18');
INSERT INTO `exam_admin_operation_log` VALUES (1434, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 03:17:18', '2021-03-18 03:17:18');
INSERT INTO `exam_admin_operation_log` VALUES (1435, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 03:17:19', '2021-03-18 03:17:19');
INSERT INTO `exam_admin_operation_log` VALUES (1436, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 03:17:19', '2021-03-18 03:17:19');
INSERT INTO `exam_admin_operation_log` VALUES (1437, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 03:17:19', '2021-03-18 03:17:19');
INSERT INTO `exam_admin_operation_log` VALUES (1438, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 03:17:20', '2021-03-18 03:17:20');
INSERT INTO `exam_admin_operation_log` VALUES (1439, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 03:17:20', '2021-03-18 03:17:20');
INSERT INTO `exam_admin_operation_log` VALUES (1440, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 03:17:21', '2021-03-18 03:17:21');
INSERT INTO `exam_admin_operation_log` VALUES (1441, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 03:17:21', '2021-03-18 03:17:21');
INSERT INTO `exam_admin_operation_log` VALUES (1442, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 03:22:11', '2021-03-18 03:22:11');
INSERT INTO `exam_admin_operation_log` VALUES (1443, 1, 'exam/admin', 'GET', '172.18.0.1', '[]', '2021-03-18 03:22:14', '2021-03-18 03:22:14');
INSERT INTO `exam_admin_operation_log` VALUES (1444, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:22:18', '2021-03-18 03:22:18');
INSERT INTO `exam_admin_operation_log` VALUES (1445, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:22:19', '2021-03-18 03:22:19');
INSERT INTO `exam_admin_operation_log` VALUES (1446, 1, 'exam/admin/exam/C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:22:29', '2021-03-18 03:22:29');
INSERT INTO `exam_admin_operation_log` VALUES (1447, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 03:22:29', '2021-03-18 03:22:29');
INSERT INTO `exam_admin_operation_log` VALUES (1448, 1, 'exam/admin/exam/C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179', 'PUT', '172.18.0.1', '{\"uuid\":\"C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179\",\"category\":[\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"4174470B-320E-8E5E-5EDF-A71758F3B65C\",\"6BF6707F-E8A9-C0DF-DF72-F3C3DC9C42ED\",null],\"collection\":[\"8718A6B8-FEA1-74E1-E193-AAD53DD5B577\",\"18774A75-753E-2418-18FF-31521AD2484F\",null],\"title\":\"\\u73a9\\u8f6cdnmp\\u4e4bport\\u7bc7\",\"option\":[{\"title\":\"12\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":[\"A\",\"C\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"xuyev9E2PzeRSuLO1lmm7Y0LFTZ1AeHMMTgmw4vX\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\"}', '2021-03-18 03:22:39', '2021-03-18 03:22:39');
INSERT INTO `exam_admin_operation_log` VALUES (1449, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-18 03:22:39', '2021-03-18 03:22:39');
INSERT INTO `exam_admin_operation_log` VALUES (1450, 1, 'exam/admin/exam/C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:22:43', '2021-03-18 03:22:43');
INSERT INTO `exam_admin_operation_log` VALUES (1451, 1, 'exam/admin/exam/C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179', 'PUT', '172.18.0.1', '{\"uuid\":\"C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179\",\"category\":[\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"4174470B-320E-8E5E-5EDF-A71758F3B65C\",\"6BF6707F-E8A9-C0DF-DF72-F3C3DC9C42ED\",null],\"collection\":[\"8718A6B8-FEA1-74E1-E193-AAD53DD5B577\",\"18774A75-753E-2418-18FF-31521AD2484F\",null],\"title\":\"\\u73a9\\u8f6cdnmp\\u4e4bport\\u7bc7\",\"option\":[{\"title\":\"12\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":[\"A\",\"C\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"xuyev9E2PzeRSuLO1lmm7Y0LFTZ1AeHMMTgmw4vX\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\"}', '2021-03-18 03:24:13', '2021-03-18 03:24:13');
INSERT INTO `exam_admin_operation_log` VALUES (1452, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-18 03:24:13', '2021-03-18 03:24:13');
INSERT INTO `exam_admin_operation_log` VALUES (1453, 1, 'exam/admin/exam/C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:24:17', '2021-03-18 03:24:17');
INSERT INTO `exam_admin_operation_log` VALUES (1454, 1, 'exam/admin/exam/C9B1E93E-6CA9-ED0A-0A1E-6AA58360F179/edit', 'GET', '172.18.0.1', '[]', '2021-03-18 03:27:22', '2021-03-18 03:27:22');
INSERT INTO `exam_admin_operation_log` VALUES (1455, 1, 'exam/admin/wechat/user/score', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:27:43', '2021-03-18 03:27:43');
INSERT INTO `exam_admin_operation_log` VALUES (1456, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:27:45', '2021-03-18 03:27:45');
INSERT INTO `exam_admin_operation_log` VALUES (1457, 1, 'exam/admin/wechat/user', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:27:50', '2021-03-18 03:27:50');
INSERT INTO `exam_admin_operation_log` VALUES (1458, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:27:54', '2021-03-18 03:27:54');
INSERT INTO `exam_admin_operation_log` VALUES (1459, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:28:16', '2021-03-18 03:28:16');
INSERT INTO `exam_admin_operation_log` VALUES (1460, 1, 'exam/admin/exam/B9C182FE-E322-80BC-BCCF-E8A18CF59B20/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:28:18', '2021-03-18 03:28:18');
INSERT INTO `exam_admin_operation_log` VALUES (1461, 1, 'exam/admin/exam/B9C182FE-E322-80BC-BCCF-E8A18CF59B20', 'PUT', '172.18.0.1', '{\"uuid\":\"B9C182FE-E322-80BC-BCCF-E8A18CF59B20\",\"category\":[\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"FB5D6E18-50EB-038E-8E71-9C3E17698A9F\",\"4174470B-320E-8E5E-5EDF-A71758F3B65C\",\"3EDC7F23-1329-1B4A-4AEC-009768BD627C\",null],\"collection\":[\"4737259C-CAB2-8E06-0606-BCC280A5BE38\",\"8718A6B8-FEA1-74E1-E193-AAD53DD5B577\",null],\"title\":\"iTerm2 + Oh My Zsh \\u6253\\u9020\\u8212\\u9002\\u7ec8\\u7aef\\u4f53\\u9a8c\",\"option\":[{\"title\":\"\\u00b7\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":[\"A\",\"D\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"xuyev9E2PzeRSuLO1lmm7Y0LFTZ1AeHMMTgmw4vX\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\"}', '2021-03-18 03:28:24', '2021-03-18 03:28:24');
INSERT INTO `exam_admin_operation_log` VALUES (1462, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-18 03:28:24', '2021-03-18 03:28:24');
INSERT INTO `exam_admin_operation_log` VALUES (1463, 1, 'exam/admin/exam/F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:28:27', '2021-03-18 03:28:27');
INSERT INTO `exam_admin_operation_log` VALUES (1464, 1, 'exam/admin/exam/F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE', 'PUT', '172.18.0.1', '{\"uuid\":\"F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE\",\"category\":[\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",null],\"collection\":[\"8718A6B8-FEA1-74E1-E193-AAD53DD5B577\",\"18774A75-753E-2418-18FF-31521AD2484F\",null],\"title\":\"\\u4e0b\\u9762\\u90a3\\u4e2a\\u7b54\\u6848\\u662f\\u6b63\\u786e\\u7684\\uff1f\",\"option\":[{\"title\":\"\\u9009\\u9879\\u4e00\",\"check\":\"A\",\"is_check\":\"1\",\"_remove_\":\"0\"},{\"title\":\"\\u9009\\u9879\\u4e8c\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\u9009\\u9879\\u4e09\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\u9009\\u9879\\u56db\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":[\"C\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"xuyev9E2PzeRSuLO1lmm7Y0LFTZ1AeHMMTgmw4vX\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\"}', '2021-03-18 03:28:33', '2021-03-18 03:28:33');
INSERT INTO `exam_admin_operation_log` VALUES (1465, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-18 03:28:34', '2021-03-18 03:28:34');
INSERT INTO `exam_admin_operation_log` VALUES (1466, 1, 'exam/admin/exam/F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:28:36', '2021-03-18 03:28:36');
INSERT INTO `exam_admin_operation_log` VALUES (1467, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:29:05', '2021-03-18 03:29:05');
INSERT INTO `exam_admin_operation_log` VALUES (1468, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:29:07', '2021-03-18 03:29:07');
INSERT INTO `exam_admin_operation_log` VALUES (1469, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:29:22', '2021-03-18 03:29:22');
INSERT INTO `exam_admin_operation_log` VALUES (1470, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:37:18', '2021-03-18 03:37:18');
INSERT INTO `exam_admin_operation_log` VALUES (1471, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:37:24', '2021-03-18 03:37:24');
INSERT INTO `exam_admin_operation_log` VALUES (1472, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:37:25', '2021-03-18 03:37:25');
INSERT INTO `exam_admin_operation_log` VALUES (1473, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:37:26', '2021-03-18 03:37:26');
INSERT INTO `exam_admin_operation_log` VALUES (1474, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-18 03:37:57', '2021-03-18 03:37:57');
INSERT INTO `exam_admin_operation_log` VALUES (1475, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-18 03:38:42', '2021-03-18 03:38:42');
INSERT INTO `exam_admin_operation_log` VALUES (1476, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '[]', '2021-03-18 03:39:09', '2021-03-18 03:39:09');
INSERT INTO `exam_admin_operation_log` VALUES (1477, 1, 'exam/admin/exam/api/collection', 'GET', '172.18.0.1', '{\"q\":\"4174470B-320E-8E5E-5EDF-A71758F3B65C\"}', '2021-03-18 03:39:17', '2021-03-18 03:39:17');
INSERT INTO `exam_admin_operation_log` VALUES (1478, 1, 'exam/admin/exam/api/collection', 'GET', '172.18.0.1', '{\"q\":\"3EDC7F23-1329-1B4A-4AEC-009768BD627C\"}', '2021-03-18 03:39:32', '2021-03-18 03:39:32');
INSERT INTO `exam_admin_operation_log` VALUES (1479, 1, 'exam/admin/exam/api/collection', 'GET', '172.18.0.1', '{\"q\":\"4174470B-320E-8E5E-5EDF-A71758F3B65C\"}', '2021-03-18 03:43:16', '2021-03-18 03:43:16');
INSERT INTO `exam_admin_operation_log` VALUES (1480, 1, 'exam/admin/exam/api/collection', 'GET', '172.18.0.1', '{\"q\":\"3EDC7F23-1329-1B4A-4AEC-009768BD627C\"}', '2021-03-18 03:43:22', '2021-03-18 03:43:22');
INSERT INTO `exam_admin_operation_log` VALUES (1481, 1, 'exam/admin/exam/api/collection', 'GET', '172.18.0.1', '{\"q\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\"}', '2021-03-18 03:43:26', '2021-03-18 03:43:26');
INSERT INTO `exam_admin_operation_log` VALUES (1482, 1, 'exam/admin/exam/api/collection', 'GET', '172.18.0.1', '{\"q\":\"B7723424-2516-6479-799C-48147489616F\"}', '2021-03-18 03:43:54', '2021-03-18 03:43:54');
INSERT INTO `exam_admin_operation_log` VALUES (1483, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:44:19', '2021-03-18 03:44:19');
INSERT INTO `exam_admin_operation_log` VALUES (1484, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:44:20', '2021-03-18 03:44:20');
INSERT INTO `exam_admin_operation_log` VALUES (1485, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:44:20', '2021-03-18 03:44:20');
INSERT INTO `exam_admin_operation_log` VALUES (1486, 1, 'exam/admin/exam/F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:44:24', '2021-03-18 03:44:24');
INSERT INTO `exam_admin_operation_log` VALUES (1487, 1, 'exam/admin/exam/F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE/edit', 'GET', '172.18.0.1', '[]', '2021-03-18 03:45:34', '2021-03-18 03:45:34');
INSERT INTO `exam_admin_operation_log` VALUES (1488, 1, 'exam/admin/exam/api/collection', 'GET', '172.18.0.1', '{\"q\":\"4174470B-320E-8E5E-5EDF-A71758F3B65C\"}', '2021-03-18 03:45:43', '2021-03-18 03:45:43');
INSERT INTO `exam_admin_operation_log` VALUES (1489, 1, 'exam/admin/exam/api/collection', 'GET', '172.18.0.1', '{\"q\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\"}', '2021-03-18 03:45:46', '2021-03-18 03:45:46');
INSERT INTO `exam_admin_operation_log` VALUES (1490, 1, 'exam/admin/exam/F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE', 'PUT', '172.18.0.1', '{\"uuid\":\"F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE\",\"category\":[\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",null],\"collection_category\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"collection\":[\"2\",\"\\u4e0a\\u6d772019\\u5e74\\u7269\\u7406\\u771f\\u9898\\u6d4b\\u8bd5\\u4e0a\\u6d772019\\u5e74\\u7269\\u7406\\u771f\\u9898\\u6d4b\\u8bd5\\u7406\\u771f\\u9898\\u6d4b\\u8bd5\",null],\"title\":\"\\u4e0b\\u9762\\u90a3\\u4e2a\\u7b54\\u6848\\u662f\\u6b63\\u786e\\u7684\\uff1f\",\"option\":[{\"title\":\"\\u9009\\u9879\\u4e00\",\"check\":\"A\",\"is_check\":\"1\",\"_remove_\":\"0\"},{\"title\":\"\\u9009\\u9879\\u4e8c\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\u9009\\u9879\\u4e09\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\u9009\\u9879\\u56db\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":[\"C\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"xuyev9E2PzeRSuLO1lmm7Y0LFTZ1AeHMMTgmw4vX\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/create\"}', '2021-03-18 03:46:01', '2021-03-18 03:46:01');
INSERT INTO `exam_admin_operation_log` VALUES (1491, 1, 'exam/admin/exam/F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE/edit', 'GET', '172.18.0.1', '[]', '2021-03-18 03:46:02', '2021-03-18 03:46:02');
INSERT INTO `exam_admin_operation_log` VALUES (1492, 1, 'exam/admin/exam/F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE/edit', 'GET', '172.18.0.1', '[]', '2021-03-18 03:46:44', '2021-03-18 03:46:44');
INSERT INTO `exam_admin_operation_log` VALUES (1493, 1, 'exam/admin/exam/api/collection', 'GET', '172.18.0.1', '{\"q\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\"}', '2021-03-18 03:46:54', '2021-03-18 03:46:54');
INSERT INTO `exam_admin_operation_log` VALUES (1494, 1, 'exam/admin/exam/F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE', 'PUT', '172.18.0.1', '{\"uuid\":\"F8F31BD8-00D0-EB4B-4B7F-C2C8C2D558DE\",\"category\":[\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",null],\"collection_category\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"collection\":[\"2\",\"\\u4e0a\\u6d772019\\u5e74\\u7269\\u7406\\u771f\\u9898\\u6d4b\\u8bd5\\u4e0a\\u6d772019\\u5e74\\u7269\\u7406\\u771f\\u9898\\u6d4b\\u8bd5\\u7406\\u771f\\u9898\\u6d4b\\u8bd5\",null],\"title\":\"\\u4e0b\\u9762\\u90a3\\u4e2a\\u7b54\\u6848\\u662f\\u6b63\\u786e\\u7684\\uff1f\",\"option\":[{\"title\":\"\\u9009\\u9879\\u4e00\",\"check\":\"A\",\"is_check\":\"1\",\"_remove_\":\"0\"},{\"title\":\"\\u9009\\u9879\\u4e8c\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\u9009\\u9879\\u4e09\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\u9009\\u9879\\u56db\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":[\"C\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"xuyev9E2PzeRSuLO1lmm7Y0LFTZ1AeHMMTgmw4vX\",\"_method\":\"PUT\"}', '2021-03-18 03:47:01', '2021-03-18 03:47:01');
INSERT INTO `exam_admin_operation_log` VALUES (1495, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-18 03:47:01', '2021-03-18 03:47:01');
INSERT INTO `exam_admin_operation_log` VALUES (1496, 1, 'exam/admin/exam/B9C182FE-E322-80BC-BCCF-E8A18CF59B20/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:47:05', '2021-03-18 03:47:05');
INSERT INTO `exam_admin_operation_log` VALUES (1497, 1, 'exam/admin/exam/api/collection', 'GET', '172.18.0.1', '{\"q\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\"}', '2021-03-18 03:47:08', '2021-03-18 03:47:08');
INSERT INTO `exam_admin_operation_log` VALUES (1498, 1, 'exam/admin/exam/B9C182FE-E322-80BC-BCCF-E8A18CF59B20', 'PUT', '172.18.0.1', '{\"uuid\":\"B9C182FE-E322-80BC-BCCF-E8A18CF59B20\",\"category\":[\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"FB5D6E18-50EB-038E-8E71-9C3E17698A9F\",\"4174470B-320E-8E5E-5EDF-A71758F3B65C\",\"3EDC7F23-1329-1B4A-4AEC-009768BD627C\",null],\"collection_category\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"collection\":[\"2\",\"\\u4e0a\\u6d772019\\u5e74\\u7269\\u7406\\u771f\\u9898\\u6d4b\\u8bd5\\u4e0a\\u6d772019\\u5e74\\u7269\\u7406\\u771f\\u9898\\u6d4b\\u8bd5\\u7406\\u771f\\u9898\\u6d4b\\u8bd5\",null],\"title\":\"iTerm2 + Oh My Zsh \\u6253\\u9020\\u8212\\u9002\\u7ec8\\u7aef\\u4f53\\u9a8c\",\"option\":[{\"title\":\"\\u00b7\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":[\"A\",\"D\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"xuyev9E2PzeRSuLO1lmm7Y0LFTZ1AeHMMTgmw4vX\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\"}', '2021-03-18 03:47:12', '2021-03-18 03:47:12');
INSERT INTO `exam_admin_operation_log` VALUES (1499, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-18 03:47:12', '2021-03-18 03:47:12');
INSERT INTO `exam_admin_operation_log` VALUES (1500, 1, 'exam/admin/exam/B9C182FE-E322-80BC-BCCF-E8A18CF59B20/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:47:15', '2021-03-18 03:47:15');
INSERT INTO `exam_admin_operation_log` VALUES (1501, 1, 'exam/admin/exam/api/collection', 'GET', '172.18.0.1', '{\"q\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\"}', '2021-03-18 03:47:18', '2021-03-18 03:47:18');
INSERT INTO `exam_admin_operation_log` VALUES (1502, 1, 'exam/admin/exam/B9C182FE-E322-80BC-BCCF-E8A18CF59B20', 'PUT', '172.18.0.1', '{\"uuid\":\"B9C182FE-E322-80BC-BCCF-E8A18CF59B20\",\"category\":[\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"FB5D6E18-50EB-038E-8E71-9C3E17698A9F\",\"4174470B-320E-8E5E-5EDF-A71758F3B65C\",\"3EDC7F23-1329-1B4A-4AEC-009768BD627C\",null],\"collection_category\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"collection\":[\"\\u4e0a\\u6d772019\\u5e74\\u7269\\u7406\\u771f\\u9898\\u6d4b\\u8bd5\\u4e0a\\u6d772019\\u5e74\\u7269\\u7406\\u771f\\u9898\\u6d4b\\u8bd5\\u7406\\u771f\\u9898\\u6d4b\\u8bd5\",null],\"title\":\"iTerm2 + Oh My Zsh \\u6253\\u9020\\u8212\\u9002\\u7ec8\\u7aef\\u4f53\\u9a8c\",\"option\":[{\"title\":\"\\u00b7\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":[\"A\",\"D\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"xuyev9E2PzeRSuLO1lmm7Y0LFTZ1AeHMMTgmw4vX\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\"}', '2021-03-18 03:47:21', '2021-03-18 03:47:21');
INSERT INTO `exam_admin_operation_log` VALUES (1503, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-18 03:47:22', '2021-03-18 03:47:22');
INSERT INTO `exam_admin_operation_log` VALUES (1504, 1, 'exam/admin/exam/B9C182FE-E322-80BC-BCCF-E8A18CF59B20/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:47:24', '2021-03-18 03:47:24');
INSERT INTO `exam_admin_operation_log` VALUES (1505, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:48:00', '2021-03-18 03:48:00');
INSERT INTO `exam_admin_operation_log` VALUES (1506, 1, 'exam/admin/exam/B9C182FE-E322-80BC-BCCF-E8A18CF59B20/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:49:05', '2021-03-18 03:49:05');
INSERT INTO `exam_admin_operation_log` VALUES (1507, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-18 03:49:07', '2021-03-18 03:49:07');
INSERT INTO `exam_admin_operation_log` VALUES (1508, 1, 'exam/admin/exam/B9C182FE-E322-80BC-BCCF-E8A18CF59B20/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:49:12', '2021-03-18 03:49:12');
INSERT INTO `exam_admin_operation_log` VALUES (1509, 1, 'exam/admin/exam/api/collection', 'GET', '172.18.0.1', '{\"q\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\"}', '2021-03-18 03:49:19', '2021-03-18 03:49:19');
INSERT INTO `exam_admin_operation_log` VALUES (1510, 1, 'exam/admin/exam/B9C182FE-E322-80BC-BCCF-E8A18CF59B20/edit', 'GET', '172.18.0.1', '[]', '2021-03-18 03:50:36', '2021-03-18 03:50:36');
INSERT INTO `exam_admin_operation_log` VALUES (1511, 1, 'exam/admin/exam/api/collection', 'GET', '172.18.0.1', '{\"q\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\"}', '2021-03-18 03:50:40', '2021-03-18 03:50:40');
INSERT INTO `exam_admin_operation_log` VALUES (1512, 1, 'exam/admin/exam/B9C182FE-E322-80BC-BCCF-E8A18CF59B20/edit', 'GET', '172.18.0.1', '[]', '2021-03-18 03:50:57', '2021-03-18 03:50:57');
INSERT INTO `exam_admin_operation_log` VALUES (1513, 1, 'exam/admin/exam/api/collection', 'GET', '172.18.0.1', '{\"q\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\"}', '2021-03-18 03:51:02', '2021-03-18 03:51:02');
INSERT INTO `exam_admin_operation_log` VALUES (1514, 1, 'exam/admin/exam/B9C182FE-E322-80BC-BCCF-E8A18CF59B20', 'PUT', '172.18.0.1', '{\"uuid\":\"B9C182FE-E322-80BC-BCCF-E8A18CF59B20\",\"category\":[\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"FB5D6E18-50EB-038E-8E71-9C3E17698A9F\",\"4174470B-320E-8E5E-5EDF-A71758F3B65C\",\"3EDC7F23-1329-1B4A-4AEC-009768BD627C\",null],\"collection_category\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"collection\":[\"2\",\"\\u4e0a\\u6d772019\\u5e74\\u7269\\u7406\\u771f\\u9898\\u6d4b\\u8bd5\\u4e0a\\u6d772019\\u5e74\\u7269\\u7406\\u771f\\u9898\\u6d4b\\u8bd5\\u7406\\u771f\\u9898\\u6d4b\\u8bd5\",null],\"title\":\"iTerm2 + Oh My Zsh \\u6253\\u9020\\u8212\\u9002\\u7ec8\\u7aef\\u4f53\\u9a8c\",\"option\":[{\"title\":\"\\u00b7\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":[\"A\",\"D\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"xuyev9E2PzeRSuLO1lmm7Y0LFTZ1AeHMMTgmw4vX\",\"_method\":\"PUT\"}', '2021-03-18 03:51:16', '2021-03-18 03:51:16');
INSERT INTO `exam_admin_operation_log` VALUES (1515, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-18 03:51:17', '2021-03-18 03:51:17');
INSERT INTO `exam_admin_operation_log` VALUES (1516, 1, 'exam/admin/exam/B9C182FE-E322-80BC-BCCF-E8A18CF59B20/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:52:27', '2021-03-18 03:52:27');
INSERT INTO `exam_admin_operation_log` VALUES (1517, 1, 'exam/admin/exam/B9C182FE-E322-80BC-BCCF-E8A18CF59B20/edit', 'GET', '172.18.0.1', '[]', '2021-03-18 03:52:31', '2021-03-18 03:52:31');
INSERT INTO `exam_admin_operation_log` VALUES (1518, 1, 'exam/admin/exam/B9C182FE-E322-80BC-BCCF-E8A18CF59B20', 'PUT', '172.18.0.1', '{\"uuid\":\"B9C182FE-E322-80BC-BCCF-E8A18CF59B20\",\"category\":[\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"FB5D6E18-50EB-038E-8E71-9C3E17698A9F\",\"4174470B-320E-8E5E-5EDF-A71758F3B65C\",\"3EDC7F23-1329-1B4A-4AEC-009768BD627C\",null],\"collection\":[\"18774A75-753E-2418-18FF-31521AD2484F\",null],\"title\":\"iTerm2 + Oh My Zsh \\u6253\\u9020\\u8212\\u9002\\u7ec8\\u7aef\\u4f53\\u9a8c\",\"option\":[{\"title\":\"\\u00b7\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":[\"A\",\"D\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"xuyev9E2PzeRSuLO1lmm7Y0LFTZ1AeHMMTgmw4vX\",\"_method\":\"PUT\"}', '2021-03-18 03:52:39', '2021-03-18 03:52:39');
INSERT INTO `exam_admin_operation_log` VALUES (1519, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-18 03:52:40', '2021-03-18 03:52:40');
INSERT INTO `exam_admin_operation_log` VALUES (1520, 1, 'exam/admin/exam/B9C182FE-E322-80BC-BCCF-E8A18CF59B20/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:52:42', '2021-03-18 03:52:42');
INSERT INTO `exam_admin_operation_log` VALUES (1521, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:53:26', '2021-03-18 03:53:26');
INSERT INTO `exam_admin_operation_log` VALUES (1522, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:54:12', '2021-03-18 03:54:12');
INSERT INTO `exam_admin_operation_log` VALUES (1523, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:54:14', '2021-03-18 03:54:14');
INSERT INTO `exam_admin_operation_log` VALUES (1524, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:54:15', '2021-03-18 03:54:15');
INSERT INTO `exam_admin_operation_log` VALUES (1525, 1, 'exam/admin/exam/collection/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:54:17', '2021-03-18 03:54:17');
INSERT INTO `exam_admin_operation_log` VALUES (1526, 1, 'exam/admin/exam/collection', 'POST', '172.18.0.1', '{\"uuid\":\"6326B8BD-F307-51BF-BFD7-BEA2135C0A0C\",\"exam_category_uuid\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"exam_tag_uuid\":\"31707ff9a527199e008d988b83756fb3\",\"title\":\"\\u6d4b\\u8bd5\\u8bd5\\u5377\\u4e00\",\"exam_time\":\"23:59:00\",\"submit_number\":\"2\",\"is_recommend\":\"on\",\"is_show\":\"on\",\"_token\":\"xuyev9E2PzeRSuLO1lmm7Y0LFTZ1AeHMMTgmw4vX\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/collection\"}', '2021-03-18 03:54:37', '2021-03-18 03:54:37');
INSERT INTO `exam_admin_operation_log` VALUES (1527, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 03:54:38', '2021-03-18 03:54:38');
INSERT INTO `exam_admin_operation_log` VALUES (1528, 1, 'exam/admin/exam/collection/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:54:40', '2021-03-18 03:54:40');
INSERT INTO `exam_admin_operation_log` VALUES (1529, 1, 'exam/admin/exam/collection', 'POST', '172.18.0.1', '{\"uuid\":\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\",\"exam_category_uuid\":\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",\"exam_tag_uuid\":\"31707ff9a527199e008d988b83756fb3\",\"title\":\"\\u6d4b\\u8bd5\\u8bd5\\u5377\\u4e8c\",\"exam_time\":\"23:59:00\",\"submit_number\":\"2\",\"is_recommend\":\"on\",\"is_show\":\"on\",\"_token\":\"xuyev9E2PzeRSuLO1lmm7Y0LFTZ1AeHMMTgmw4vX\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/collection\"}', '2021-03-18 03:54:59', '2021-03-18 03:54:59');
INSERT INTO `exam_admin_operation_log` VALUES (1530, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 03:55:00', '2021-03-18 03:55:00');
INSERT INTO `exam_admin_operation_log` VALUES (1531, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:55:03', '2021-03-18 03:55:03');
INSERT INTO `exam_admin_operation_log` VALUES (1532, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:55:05', '2021-03-18 03:55:05');
INSERT INTO `exam_admin_operation_log` VALUES (1533, 1, 'exam/admin/exam', 'POST', '172.18.0.1', '{\"uuid\":\"F4BA6A17-F24A-DC27-279D-2BD3FBBE575B\",\"category\":[\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",null],\"collection\":[\"6326B8BD-F307-51BF-BFD7-BEA2135C0A0C\",\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\",null],\"title\":\"\\u4e0b\\u9762\\u6700\\u957f\\u7684\\u6c5f\\u662f\\uff1f\",\"option\":{\"new_1\":{\"title\":\"\\u957f\\u6c5f\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_2\":{\"title\":\"\\u9ec4\\u6cb3\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_3\":{\"title\":\"\\u5609\\u9675\\u6c5f\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_4\":{\"title\":\"\\u51c4\\u6c5f\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"}},\"answer\":[\"A\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"xuyev9E2PzeRSuLO1lmm7Y0LFTZ1AeHMMTgmw4vX\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\"}', '2021-03-18 03:55:54', '2021-03-18 03:55:54');
INSERT INTO `exam_admin_operation_log` VALUES (1534, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-18 03:55:54', '2021-03-18 03:55:54');
INSERT INTO `exam_admin_operation_log` VALUES (1535, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 03:55:57', '2021-03-18 03:55:57');
INSERT INTO `exam_admin_operation_log` VALUES (1536, 1, 'exam/admin/exam', 'POST', '172.18.0.1', '{\"uuid\":\"6DCF4D5D-7993-64EB-EB66-83AA9758E7D5\",\"category\":[\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",null],\"collection\":[\"6326B8BD-F307-51BF-BFD7-BEA2135C0A0C\",\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\",null],\"title\":\"\\u534e\\u590f\\u6587\\u660e\\u6709\\u591a\\u5c11\\u5e74\\u4e86\\uff1f\",\"option\":{\"new_1\":{\"title\":\"\\u4e94\\u5343\\u5e74\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_2\":{\"title\":\"\\u56db\\u5343\\u5e74\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_3\":{\"title\":\"\\u4e09\\u5343\\u5e74\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_4\":{\"title\":\"\\u4e8c\\u5343\\u5e74\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}},\"answer\":[\"A\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"xuyev9E2PzeRSuLO1lmm7Y0LFTZ1AeHMMTgmw4vX\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\"}', '2021-03-18 03:56:49', '2021-03-18 03:56:49');
INSERT INTO `exam_admin_operation_log` VALUES (1537, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-18 03:56:49', '2021-03-18 03:56:49');
INSERT INTO `exam_admin_operation_log` VALUES (1538, 1, 'exam/admin', 'GET', '172.18.0.1', '[]', '2021-03-18 16:09:59', '2021-03-18 16:09:59');
INSERT INTO `exam_admin_operation_log` VALUES (1539, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 16:10:06', '2021-03-18 16:10:06');
INSERT INTO `exam_admin_operation_log` VALUES (1540, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 16:10:10', '2021-03-18 16:10:10');
INSERT INTO `exam_admin_operation_log` VALUES (1541, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 16:10:21', '2021-03-18 16:10:21');
INSERT INTO `exam_admin_operation_log` VALUES (1542, 1, 'exam/admin/exam/search/history', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 16:10:22', '2021-03-18 16:10:22');
INSERT INTO `exam_admin_operation_log` VALUES (1543, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 16:10:23', '2021-03-18 16:10:23');
INSERT INTO `exam_admin_operation_log` VALUES (1544, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 16:10:45', '2021-03-18 16:10:45');
INSERT INTO `exam_admin_operation_log` VALUES (1545, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 16:21:36', '2021-03-18 16:21:36');
INSERT INTO `exam_admin_operation_log` VALUES (1546, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 16:22:09', '2021-03-18 16:22:09');
INSERT INTO `exam_admin_operation_log` VALUES (1547, 1, 'exam/admin/exam/collection/exam', 'GET', '172.18.0.1', '{\"collection_id\":\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\",\"_pjax\":\"#pjax-container\"}', '2021-03-18 16:22:11', '2021-03-18 16:22:11');
INSERT INTO `exam_admin_operation_log` VALUES (1548, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 16:22:19', '2021-03-18 16:22:19');
INSERT INTO `exam_admin_operation_log` VALUES (1549, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 16:36:21', '2021-03-18 16:36:21');
INSERT INTO `exam_admin_operation_log` VALUES (1550, 1, 'exam/admin/exam/collection/exam', 'GET', '172.18.0.1', '{\"collection_id\":\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\",\"_pjax\":\"#pjax-container\"}', '2021-03-18 16:36:23', '2021-03-18 16:36:23');
INSERT INTO `exam_admin_operation_log` VALUES (1551, 1, 'exam/admin/exam/collection/exam', 'GET', '172.18.0.1', '{\"collection_id\":\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\"}', '2021-03-18 16:41:49', '2021-03-18 16:41:49');
INSERT INTO `exam_admin_operation_log` VALUES (1552, 1, 'exam/admin/exam/collection/exam', 'GET', '172.18.0.1', '{\"collection_id\":\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\"}', '2021-03-18 16:42:33', '2021-03-18 16:42:33');
INSERT INTO `exam_admin_operation_log` VALUES (1553, 1, 'exam/admin/exam/collection/exam', 'GET', '172.18.0.1', '{\"collection_id\":\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\"}', '2021-03-18 16:42:35', '2021-03-18 16:42:35');
INSERT INTO `exam_admin_operation_log` VALUES (1554, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 16:42:42', '2021-03-18 16:42:42');
INSERT INTO `exam_admin_operation_log` VALUES (1555, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 16:42:44', '2021-03-18 16:42:44');
INSERT INTO `exam_admin_operation_log` VALUES (1556, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 16:42:46', '2021-03-18 16:42:46');
INSERT INTO `exam_admin_operation_log` VALUES (1557, 1, 'exam/admin/exam/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 16:42:48', '2021-03-18 16:42:48');
INSERT INTO `exam_admin_operation_log` VALUES (1558, 1, 'exam/admin/exam', 'POST', '172.18.0.1', '{\"uuid\":\"2C7C38BA-D62E-3A0A-0AAC-828BE7789E56\",\"category\":[\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",null],\"collection\":[null],\"title\":\"1+1\\u7b49\\u4e8e\\u51e0?\",\"option\":{\"new_1\":{\"title\":\"1\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_2\":{\"title\":\"2\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_3\":{\"title\":\"3\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_4\":{\"title\":\"4\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}},\"answer\":[\"A\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"A9Jo1kF164M3o89LWBgjXnqM2Mx6aYTQ0dBMjcju\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/exam\\/admin\\/exam\"}', '2021-03-18 16:43:19', '2021-03-18 16:43:19');
INSERT INTO `exam_admin_operation_log` VALUES (1559, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-18 16:43:20', '2021-03-18 16:43:20');
INSERT INTO `exam_admin_operation_log` VALUES (1560, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 16:43:22', '2021-03-18 16:43:22');
INSERT INTO `exam_admin_operation_log` VALUES (1561, 1, 'exam/admin/exam/collection/exam', 'GET', '172.18.0.1', '{\"collection_id\":\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\",\"_pjax\":\"#pjax-container\"}', '2021-03-18 16:43:28', '2021-03-18 16:43:28');
INSERT INTO `exam_admin_operation_log` VALUES (1562, 1, 'exam/admin/exam/collection/exam', 'GET', '172.18.0.1', '{\"collection_id\":\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\"}', '2021-03-18 16:46:05', '2021-03-18 16:46:05');
INSERT INTO `exam_admin_operation_log` VALUES (1563, 1, 'exam/admin/exam/collection/exam', 'GET', '172.18.0.1', '{\"collection_id\":\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\"}', '2021-03-18 16:47:09', '2021-03-18 16:47:09');
INSERT INTO `exam_admin_operation_log` VALUES (1564, 1, 'exam/admin/exam/collection/exam', 'GET', '172.18.0.1', '{\"collection_id\":\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\"}', '2021-03-18 16:48:50', '2021-03-18 16:48:50');
INSERT INTO `exam_admin_operation_log` VALUES (1565, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 16:49:56', '2021-03-18 16:49:56');
INSERT INTO `exam_admin_operation_log` VALUES (1566, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-03-18 16:49:58', '2021-03-18 16:49:58');
INSERT INTO `exam_admin_operation_log` VALUES (1567, 1, 'exam/admin/exam/collection/exam', 'GET', '172.18.0.1', '{\"collection_id\":\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\",\"_pjax\":\"#pjax-container\"}', '2021-03-18 16:50:02', '2021-03-18 16:50:02');
INSERT INTO `exam_admin_operation_log` VALUES (1568, 1, 'exam/admin/exam/collection/exam', 'GET', '172.18.0.1', '{\"collection_id\":\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\"}', '2021-03-18 16:50:09', '2021-03-18 16:50:09');
INSERT INTO `exam_admin_operation_log` VALUES (1569, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 16:50:15', '2021-03-18 16:50:15');
INSERT INTO `exam_admin_operation_log` VALUES (1570, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 16:50:16', '2021-03-18 16:50:16');
INSERT INTO `exam_admin_operation_log` VALUES (1571, 1, 'exam/admin/exam/collection/exam', 'GET', '172.18.0.1', '{\"collection_id\":\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\",\"_pjax\":\"#pjax-container\"}', '2021-03-18 16:50:19', '2021-03-18 16:50:19');
INSERT INTO `exam_admin_operation_log` VALUES (1572, 1, 'exam/admin/exam/collection/exam', 'GET', '172.18.0.1', '{\"collection_id\":\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\"}', '2021-03-18 16:52:44', '2021-03-18 16:52:44');
INSERT INTO `exam_admin_operation_log` VALUES (1573, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_key\":\"2C7C38BA-D62E-3A0A-0AAC-828BE7789E56\",\"_model\":\"App_Models_Admin_Exam_Exam\",\"_token\":\"A9Jo1kF164M3o89LWBgjXnqM2Mx6aYTQ0dBMjcju\",\"_action\":\"App_Admin_Actions_Exam_CollectionExamBind\"}', '2021-03-18 16:52:47', '2021-03-18 16:52:47');
INSERT INTO `exam_admin_operation_log` VALUES (1574, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_key\":\"2C7C38BA-D62E-3A0A-0AAC-828BE7789E56\",\"_model\":\"App_Models_Admin_Exam_Exam\",\"_token\":\"A9Jo1kF164M3o89LWBgjXnqM2Mx6aYTQ0dBMjcju\",\"_action\":\"App_Admin_Actions_Exam_CollectionExamBind\"}', '2021-03-18 16:52:58', '2021-03-18 16:52:58');
INSERT INTO `exam_admin_operation_log` VALUES (1575, 1, 'exam/admin/exam/collection/exam', 'GET', '172.18.0.1', '{\"collection_id\":\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\"}', '2021-03-18 16:53:38', '2021-03-18 16:53:38');
INSERT INTO `exam_admin_operation_log` VALUES (1576, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"_key\":\"2C7C38BA-D62E-3A0A-0AAC-828BE7789E56\",\"_model\":\"App_Models_Admin_Exam_Exam\",\"_token\":\"A9Jo1kF164M3o89LWBgjXnqM2Mx6aYTQ0dBMjcju\",\"_action\":\"App_Admin_Actions_Exam_CollectionExamBind\"}', '2021-03-18 16:53:42', '2021-03-18 16:53:42');
INSERT INTO `exam_admin_operation_log` VALUES (1577, 1, 'exam/admin/exam/collection/exam', 'GET', '172.18.0.1', '{\"collection_id\":\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\"}', '2021-03-18 16:56:10', '2021-03-18 16:56:10');
INSERT INTO `exam_admin_operation_log` VALUES (1578, 1, 'exam/admin/exam/collection/exam', 'GET', '172.18.0.1', '{\"collection_id\":\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\"}', '2021-03-18 16:56:27', '2021-03-18 16:56:27');
INSERT INTO `exam_admin_operation_log` VALUES (1579, 1, 'exam/admin/exam/collection/exam', 'GET', '172.18.0.1', '{\"collection_id\":\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\"}', '2021-03-18 16:56:35', '2021-03-18 16:56:35');
INSERT INTO `exam_admin_operation_log` VALUES (1580, 1, 'exam/admin/exam/collection/exam', 'GET', '172.18.0.1', '{\"collection_id\":\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\"}', '2021-03-18 16:56:51', '2021-03-18 16:56:51');
INSERT INTO `exam_admin_operation_log` VALUES (1581, 1, 'exam/admin/exam/collection/exam', 'GET', '172.18.0.1', '{\"collection_id\":\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\"}', '2021-03-18 16:58:01', '2021-03-18 16:58:01');
INSERT INTO `exam_admin_operation_log` VALUES (1582, 1, 'exam/admin/exam/collection/exam', 'GET', '172.18.0.1', '{\"collection_id\":\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\"}', '2021-03-18 16:58:24', '2021-03-18 16:58:24');
INSERT INTO `exam_admin_operation_log` VALUES (1583, 1, 'exam/admin/exam/collection/exam', 'GET', '172.18.0.1', '{\"collection_id\":\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\"}', '2021-03-18 16:58:27', '2021-03-18 16:58:27');
INSERT INTO `exam_admin_operation_log` VALUES (1584, 1, 'exam/admin/exam/collection/exam', 'GET', '172.18.0.1', '{\"collection_id\":\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\"}', '2021-03-18 16:59:35', '2021-03-18 16:59:35');
INSERT INTO `exam_admin_operation_log` VALUES (1585, 1, 'exam/admin/exam/collection/exam', 'GET', '172.18.0.1', '{\"collection_id\":\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\"}', '2021-03-18 17:00:34', '2021-03-18 17:00:34');
INSERT INTO `exam_admin_operation_log` VALUES (1586, 1, 'exam/admin/exam/collection/exam', 'GET', '172.18.0.1', '{\"collection_id\":\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\"}', '2021-03-18 17:00:42', '2021-03-18 17:00:42');
INSERT INTO `exam_admin_operation_log` VALUES (1587, 1, 'exam/admin/exam/collection/exam', 'GET', '172.18.0.1', '{\"collection_id\":\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\"}', '2021-03-18 17:01:17', '2021-03-18 17:01:17');
INSERT INTO `exam_admin_operation_log` VALUES (1588, 1, 'exam/admin/exam/collection/exam', 'GET', '172.18.0.1', '{\"collection_id\":\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\"}', '2021-03-18 17:01:31', '2021-03-18 17:01:31');
INSERT INTO `exam_admin_operation_log` VALUES (1589, 1, 'exam/admin/exam/collection/exam', 'GET', '172.18.0.1', '{\"collection_id\":\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\"}', '2021-03-18 17:01:36', '2021-03-18 17:01:36');
INSERT INTO `exam_admin_operation_log` VALUES (1590, 1, 'exam/admin/exam/collection/exam', 'GET', '172.18.0.1', '{\"collection_id\":\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\"}', '2021-03-18 17:01:39', '2021-03-18 17:01:39');
INSERT INTO `exam_admin_operation_log` VALUES (1591, 1, 'exam/admin/exam/collection/exam', 'GET', '172.18.0.1', '{\"collection_id\":\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\"}', '2021-03-18 17:02:34', '2021-03-18 17:02:34');
INSERT INTO `exam_admin_operation_log` VALUES (1592, 1, 'exam/admin/exam/collection/exam', 'GET', '172.18.0.1', '{\"collection_id\":\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\"}', '2021-03-18 17:10:31', '2021-03-18 17:10:31');
INSERT INTO `exam_admin_operation_log` VALUES (1593, 1, 'exam/admin/exam/collection/exam', 'GET', '172.18.0.1', '{\"collection_id\":\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\"}', '2021-03-18 17:12:35', '2021-03-18 17:12:35');
INSERT INTO `exam_admin_operation_log` VALUES (1594, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"collection_uuid\":\"6326B8BD-F307-51BF-BFD7-BEA2135C0A0C\",\"uuid\":\"2C7C38BA-D62E-3A0A-0AAC-828BE7789E56\",\"_key\":\"2C7C38BA-D62E-3A0A-0AAC-828BE7789E56\",\"_model\":\"App_Models_Admin_Exam_Exam\",\"_token\":\"A9Jo1kF164M3o89LWBgjXnqM2Mx6aYTQ0dBMjcju\",\"_action\":\"App_Admin_Actions_Exam_CollectionExamBind\"}', '2021-03-18 17:12:42', '2021-03-18 17:12:42');
INSERT INTO `exam_admin_operation_log` VALUES (1595, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"collection_uuid\":\"6326B8BD-F307-51BF-BFD7-BEA2135C0A0C\",\"uuid\":\"2C7C38BA-D62E-3A0A-0AAC-828BE7789E56\",\"_key\":\"2C7C38BA-D62E-3A0A-0AAC-828BE7789E56\",\"_model\":\"App_Models_Admin_Exam_Exam\",\"_token\":\"A9Jo1kF164M3o89LWBgjXnqM2Mx6aYTQ0dBMjcju\",\"_action\":\"App_Admin_Actions_Exam_CollectionExamBind\"}', '2021-03-18 17:12:49', '2021-03-18 17:12:49');
INSERT INTO `exam_admin_operation_log` VALUES (1596, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"collection_uuid\":\"6326B8BD-F307-51BF-BFD7-BEA2135C0A0C\",\"uuid\":\"2C7C38BA-D62E-3A0A-0AAC-828BE7789E56\",\"_key\":\"2C7C38BA-D62E-3A0A-0AAC-828BE7789E56\",\"_model\":\"App_Models_Admin_Exam_Exam\",\"_token\":\"A9Jo1kF164M3o89LWBgjXnqM2Mx6aYTQ0dBMjcju\",\"_action\":\"App_Admin_Actions_Exam_CollectionExamBind\"}', '2021-03-18 17:14:28', '2021-03-18 17:14:28');
INSERT INTO `exam_admin_operation_log` VALUES (1597, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"collection_uuid\":\"6326B8BD-F307-51BF-BFD7-BEA2135C0A0C\",\"uuid\":\"2C7C38BA-D62E-3A0A-0AAC-828BE7789E56\",\"_key\":\"2C7C38BA-D62E-3A0A-0AAC-828BE7789E56\",\"_model\":\"App_Models_Admin_Exam_Exam\",\"_token\":\"A9Jo1kF164M3o89LWBgjXnqM2Mx6aYTQ0dBMjcju\",\"_action\":\"App_Admin_Actions_Exam_CollectionExamBind\"}', '2021-03-18 17:15:16', '2021-03-18 17:15:16');
INSERT INTO `exam_admin_operation_log` VALUES (1598, 1, 'exam/admin/exam/collection/exam', 'GET', '172.18.0.1', '{\"collection_id\":\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\",\"_pjax\":\"#pjax-container\"}', '2021-03-18 17:15:17', '2021-03-18 17:15:17');
INSERT INTO `exam_admin_operation_log` VALUES (1599, 1, 'exam/admin/_handle_action_', 'POST', '172.18.0.1', '{\"collection_uuid\":\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\",\"uuid\":\"2C7C38BA-D62E-3A0A-0AAC-828BE7789E56\",\"_key\":\"2C7C38BA-D62E-3A0A-0AAC-828BE7789E56\",\"_model\":\"App_Models_Admin_Exam_Exam\",\"_token\":\"A9Jo1kF164M3o89LWBgjXnqM2Mx6aYTQ0dBMjcju\",\"_action\":\"App_Admin_Actions_Exam_CollectionExamBind\"}', '2021-03-18 17:15:26', '2021-03-18 17:15:26');
INSERT INTO `exam_admin_operation_log` VALUES (1600, 1, 'exam/admin/exam/collection/exam', 'GET', '172.18.0.1', '{\"collection_id\":\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\",\"_pjax\":\"#pjax-container\"}', '2021-03-18 17:15:26', '2021-03-18 17:15:26');
INSERT INTO `exam_admin_operation_log` VALUES (1601, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-18 21:25:31', '2021-03-18 21:25:31');
INSERT INTO `exam_admin_operation_log` VALUES (1602, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 21:25:42', '2021-03-18 21:25:42');
INSERT INTO `exam_admin_operation_log` VALUES (1603, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 21:25:43', '2021-03-18 21:25:43');
INSERT INTO `exam_admin_operation_log` VALUES (1604, 1, 'exam/admin/exam/2C7C38BA-D62E-3A0A-0AAC-828BE7789E56/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 21:26:00', '2021-03-18 21:26:00');
INSERT INTO `exam_admin_operation_log` VALUES (1605, 1, 'exam/admin/exam/2C7C38BA-D62E-3A0A-0AAC-828BE7789E56', 'PUT', '172.18.0.1', '{\"uuid\":\"2C7C38BA-D62E-3A0A-0AAC-828BE7789E56\",\"category\":[\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",null],\"collection\":[\"6326B8BD-F307-51BF-BFD7-BEA2135C0A0C\",\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\",null],\"title\":\"1+1\\u7b49\\u4e8e\\u51e0?\",\"option\":[{\"title\":\"1\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"2\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"3\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"4\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":[\"A\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"FkQDwRSsNZiw4kTprAuyJokTBx9b40Cdb15EszrU\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\"}', '2021-03-18 21:26:17', '2021-03-18 21:26:17');
INSERT INTO `exam_admin_operation_log` VALUES (1606, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '[]', '2021-03-18 21:26:25', '2021-03-18 21:26:25');
INSERT INTO `exam_admin_operation_log` VALUES (1607, 1, 'exam/admin/exam/F4BA6A17-F24A-DC27-279D-2BD3FBBE575B/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 21:27:54', '2021-03-18 21:27:54');
INSERT INTO `exam_admin_operation_log` VALUES (1608, 1, 'exam/admin/exam/6DCF4D5D-7993-64EB-EB66-83AA9758E7D5/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 21:28:11', '2021-03-18 21:28:11');
INSERT INTO `exam_admin_operation_log` VALUES (1609, 1, 'exam/admin/exam/F4BA6A17-F24A-DC27-279D-2BD3FBBE575B', 'PUT', '172.18.0.1', '{\"uuid\":\"F4BA6A17-F24A-DC27-279D-2BD3FBBE575B\",\"category\":[\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",null],\"collection\":[\"6326B8BD-F307-51BF-BFD7-BEA2135C0A0C\",\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\",null],\"title\":\"\\u4e0b\\u9762\\u6700\\u957f\\u7684\\u6c5f\\u662f\\uff1f\",\"option\":[{\"title\":\"\\u957f\\u6c5f\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\u9ec4\\u6cb3\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\u5609\\u9675\\u6c5f\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\u51c4\\u6c5f\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":[\"A\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"FkQDwRSsNZiw4kTprAuyJokTBx9b40Cdb15EszrU\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/6DCF4D5D-7993-64EB-EB66-83AA9758E7D5\\/edit\"}', '2021-03-18 21:29:33', '2021-03-18 21:29:33');
INSERT INTO `exam_admin_operation_log` VALUES (1610, 1, 'exam/admin/exam/6DCF4D5D-7993-64EB-EB66-83AA9758E7D5/edit', 'GET', '172.18.0.1', '[]', '2021-03-18 21:29:42', '2021-03-18 21:29:42');
INSERT INTO `exam_admin_operation_log` VALUES (1611, 1, 'exam/admin/exam/6DCF4D5D-7993-64EB-EB66-83AA9758E7D5', 'PUT', '172.18.0.1', '{\"uuid\":\"6DCF4D5D-7993-64EB-EB66-83AA9758E7D5\",\"category\":[\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",null],\"collection\":[\"6326B8BD-F307-51BF-BFD7-BEA2135C0A0C\",\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\",null],\"title\":\"\\u534e\\u590f\\u6587\\u660e\\u6709\\u591a\\u5c11\\u5e74\\u4e86\\uff1f\",\"option\":[{\"title\":\"\\u4e94\\u5343\\u5e74\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\u56db\\u5343\\u5e74\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\u4e09\\u5343\\u5e74\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\u4e8c\\u5343\\u5e74\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":[\"A\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"FkQDwRSsNZiw4kTprAuyJokTBx9b40Cdb15EszrU\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/F4BA6A17-F24A-DC27-279D-2BD3FBBE575B\\/edit\"}', '2021-03-18 21:30:24', '2021-03-18 21:30:24');
INSERT INTO `exam_admin_operation_log` VALUES (1612, 1, 'exam/admin/exam/F4BA6A17-F24A-DC27-279D-2BD3FBBE575B/edit', 'GET', '172.18.0.1', '[]', '2021-03-18 21:30:32', '2021-03-18 21:30:32');
INSERT INTO `exam_admin_operation_log` VALUES (1613, 1, 'exam/admin/exam/F4BA6A17-F24A-DC27-279D-2BD3FBBE575B', 'PUT', '172.18.0.1', '{\"uuid\":\"F4BA6A17-F24A-DC27-279D-2BD3FBBE575B\",\"category\":[\"6F38625D-EC11-646D-6D79-19DFE56F7EDC\",null],\"collection\":[\"6326B8BD-F307-51BF-BFD7-BEA2135C0A0C\",\"270D9480-E84C-A8B5-B5B7-F99F3F12F1D9\",null],\"title\":\"\\u4e0b\\u9762\\u6700\\u957f\\u7684\\u6c5f\\u662f\\uff1f\",\"option\":[{\"title\":\"\\u957f\\u6c5f\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\u9ec4\\u6cb3\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\u5609\\u9675\\u6c5f\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\u51c4\\u6c5f\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":[\"A\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"FkQDwRSsNZiw4kTprAuyJokTBx9b40Cdb15EszrU\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat.exam.com\\/exam\\/admin\\/exam\\/6DCF4D5D-7993-64EB-EB66-83AA9758E7D5\\/edit\"}', '2021-03-18 21:31:14', '2021-03-18 21:31:14');
INSERT INTO `exam_admin_operation_log` VALUES (1614, 1, 'exam/admin/exam/6DCF4D5D-7993-64EB-EB66-83AA9758E7D5/edit', 'GET', '172.18.0.1', '[]', '2021-03-18 21:31:24', '2021-03-18 21:31:24');
INSERT INTO `exam_admin_operation_log` VALUES (1615, 1, 'exam/admin/exam', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-03-18 21:31:48', '2021-03-18 21:31:48');
INSERT INTO `exam_admin_operation_log` VALUES (1616, 1, 'exam/admin/platform/message/category', 'GET', '180.157.122.15', '[]', '2021-03-21 09:57:55', '2021-03-21 09:57:55');
INSERT INTO `exam_admin_operation_log` VALUES (1617, 1, 'exam/admin/platform/content', 'GET', '180.157.122.15', '[]', '2021-03-21 09:58:02', '2021-03-21 09:58:02');
INSERT INTO `exam_admin_operation_log` VALUES (1618, 1, 'exam/admin/auth/setting', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 09:58:12', '2021-03-21 09:58:12');
INSERT INTO `exam_admin_operation_log` VALUES (1619, 1, 'exam/admin/auth/setting', 'PUT', '180.157.122.15', '{\"name\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\",\"password\":\"$2y$10$vn2Xqa\\/\\/NqOmsptQ1a9\\/beVRNa5WrrcZVmqW1JSOAGIv8LxqqbKOq\",\"password_confirmation\":\"$2y$10$vn2Xqa\\/\\/NqOmsptQ1a9\\/beVRNa5WrrcZVmqW1JSOAGIv8LxqqbKOq\",\"_token\":\"TIYSoNPgCZV35dpaAc0lFIrhndkSXBLHwxjBJPU1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/platform\\/content\"}', '2021-03-21 09:58:32', '2021-03-21 09:58:32');
INSERT INTO `exam_admin_operation_log` VALUES (1620, 1, 'exam/admin/auth/setting', 'GET', '180.157.122.15', '[]', '2021-03-21 09:58:35', '2021-03-21 09:58:35');
INSERT INTO `exam_admin_operation_log` VALUES (1621, 1, 'exam/admin/exam/category', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 09:58:39', '2021-03-21 09:58:39');
INSERT INTO `exam_admin_operation_log` VALUES (1622, 1, 'exam/admin/exam/category/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 09:58:43', '2021-03-21 09:58:43');
INSERT INTO `exam_admin_operation_log` VALUES (1623, 1, 'exam/admin', 'GET', '180.157.122.15', '[]', '2021-03-21 10:07:44', '2021-03-21 10:07:44');
INSERT INTO `exam_admin_operation_log` VALUES (1624, 1, 'exam/admin', 'GET', '180.157.122.15', '[]', '2021-03-21 10:07:51', '2021-03-21 10:07:51');
INSERT INTO `exam_admin_operation_log` VALUES (1625, 1, 'exam/admin/exam/category', 'GET', '180.157.122.15', '[]', '2021-03-21 10:08:00', '2021-03-21 10:08:00');
INSERT INTO `exam_admin_operation_log` VALUES (1626, 1, 'exam/admin/exam/category/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:08:02', '2021-03-21 10:08:02');
INSERT INTO `exam_admin_operation_log` VALUES (1627, 1, 'exam/admin/exam/category', 'POST', '180.157.122.15', '{\"uuid\":\"E00EEB43-1FD9-795A-5A1C-5866F252164A\",\"parent_id\":null,\"title\":\"\\u9ad8\\u4e2d\\u77e5\\u8bc6\",\"orders\":\"0\",\"remark\":null,\"is_show\":\"on\",\"is_home\":\"off\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-21 10:08:33', '2021-03-21 10:08:33');
INSERT INTO `exam_admin_operation_log` VALUES (1628, 1, 'exam/admin/exam/category', 'GET', '180.157.122.15', '[]', '2021-03-21 10:08:33', '2021-03-21 10:08:33');
INSERT INTO `exam_admin_operation_log` VALUES (1629, 1, 'exam/admin/exam/category/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:08:36', '2021-03-21 10:08:36');
INSERT INTO `exam_admin_operation_log` VALUES (1630, 1, 'exam/admin/exam/category', 'POST', '180.157.122.15', '{\"uuid\":\"DFDC6859-50A0-9AFA-FA13-5E5DCB6F7049\",\"parent_id\":\"E00EEB43-1FD9-795A-5A1C-5866F252164A\",\"title\":\"\\u8bed\\u6587\",\"orders\":\"0\",\"remark\":null,\"is_show\":\"on\",\"is_home\":\"off\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-21 10:08:57', '2021-03-21 10:08:57');
INSERT INTO `exam_admin_operation_log` VALUES (1631, 1, 'exam/admin/exam/category', 'GET', '180.157.122.15', '[]', '2021-03-21 10:08:58', '2021-03-21 10:08:58');
INSERT INTO `exam_admin_operation_log` VALUES (1632, 1, 'exam/admin/exam/category/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:08:59', '2021-03-21 10:08:59');
INSERT INTO `exam_admin_operation_log` VALUES (1633, 1, 'exam/admin/exam/category', 'POST', '180.157.122.15', '{\"uuid\":\"C715B621-2069-C557-575B-ED04E2C08D77\",\"parent_id\":\"E00EEB43-1FD9-795A-5A1C-5866F252164A\",\"title\":\"\\u6570\\u5b66\",\"orders\":\"0\",\"remark\":null,\"is_show\":\"on\",\"is_home\":\"off\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-21 10:09:18', '2021-03-21 10:09:18');
INSERT INTO `exam_admin_operation_log` VALUES (1634, 1, 'exam/admin/exam/category', 'GET', '180.157.122.15', '[]', '2021-03-21 10:09:19', '2021-03-21 10:09:19');
INSERT INTO `exam_admin_operation_log` VALUES (1635, 1, 'exam/admin/exam/category/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:09:21', '2021-03-21 10:09:21');
INSERT INTO `exam_admin_operation_log` VALUES (1636, 1, 'exam/admin/exam/category', 'POST', '180.157.122.15', '{\"uuid\":\"0D742B8D-C1B7-6C04-04EC-FF67DBA65911\",\"parent_id\":\"E00EEB43-1FD9-795A-5A1C-5866F252164A\",\"title\":\"\\u82f1\\u8bed\",\"orders\":\"0\",\"remark\":null,\"is_show\":\"on\",\"is_home\":\"off\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-21 10:09:38', '2021-03-21 10:09:38');
INSERT INTO `exam_admin_operation_log` VALUES (1637, 1, 'exam/admin/exam/category', 'GET', '180.157.122.15', '[]', '2021-03-21 10:09:38', '2021-03-21 10:09:38');
INSERT INTO `exam_admin_operation_log` VALUES (1638, 1, 'exam/admin/exam/category/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:09:51', '2021-03-21 10:09:51');
INSERT INTO `exam_admin_operation_log` VALUES (1639, 1, 'exam/admin/exam/category', 'POST', '180.157.122.15', '{\"uuid\":\"0E78200F-74E5-D4C6-C6F0-33AC9E436CA4\",\"parent_id\":\"E00EEB43-1FD9-795A-5A1C-5866F252164A\",\"title\":\"\\u5730\\u7406\",\"orders\":\"0\",\"remark\":null,\"is_show\":\"on\",\"is_home\":\"on\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-21 10:12:05', '2021-03-21 10:12:05');
INSERT INTO `exam_admin_operation_log` VALUES (1640, 1, 'exam/admin/exam/category', 'GET', '180.157.122.15', '[]', '2021-03-21 10:12:06', '2021-03-21 10:12:06');
INSERT INTO `exam_admin_operation_log` VALUES (1641, 1, 'exam/admin/exam/category/DFDC6859-50A0-9AFA-FA13-5E5DCB6F7049/edit', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:12:11', '2021-03-21 10:12:11');
INSERT INTO `exam_admin_operation_log` VALUES (1642, 1, 'exam/admin/exam/category/DFDC6859-50A0-9AFA-FA13-5E5DCB6F7049', 'PUT', '180.157.122.15', '{\"uuid\":\"DFDC6859-50A0-9AFA-FA13-5E5DCB6F7049\",\"parent_id\":\"E00EEB43-1FD9-795A-5A1C-5866F252164A\",\"title\":\"\\u8bed\\u6587\",\"orders\":\"0\",\"remark\":null,\"is_show\":\"on\",\"is_home\":\"on\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-21 10:12:14', '2021-03-21 10:12:14');
INSERT INTO `exam_admin_operation_log` VALUES (1643, 1, 'exam/admin/exam/category', 'GET', '180.157.122.15', '[]', '2021-03-21 10:12:14', '2021-03-21 10:12:14');
INSERT INTO `exam_admin_operation_log` VALUES (1644, 1, 'exam/admin/exam/category/C715B621-2069-C557-575B-ED04E2C08D77/edit', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:12:16', '2021-03-21 10:12:16');
INSERT INTO `exam_admin_operation_log` VALUES (1645, 1, 'exam/admin/exam/category/C715B621-2069-C557-575B-ED04E2C08D77', 'PUT', '180.157.122.15', '{\"uuid\":\"C715B621-2069-C557-575B-ED04E2C08D77\",\"parent_id\":\"E00EEB43-1FD9-795A-5A1C-5866F252164A\",\"title\":\"\\u6570\\u5b66\",\"orders\":\"0\",\"remark\":null,\"is_show\":\"on\",\"is_home\":\"on\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-21 10:12:20', '2021-03-21 10:12:20');
INSERT INTO `exam_admin_operation_log` VALUES (1646, 1, 'exam/admin/exam/category', 'GET', '180.157.122.15', '[]', '2021-03-21 10:12:21', '2021-03-21 10:12:21');
INSERT INTO `exam_admin_operation_log` VALUES (1647, 1, 'exam/admin/exam/category/0D742B8D-C1B7-6C04-04EC-FF67DBA65911/edit', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:12:23', '2021-03-21 10:12:23');
INSERT INTO `exam_admin_operation_log` VALUES (1648, 1, 'exam/admin/exam/category/0D742B8D-C1B7-6C04-04EC-FF67DBA65911', 'PUT', '180.157.122.15', '{\"uuid\":\"0D742B8D-C1B7-6C04-04EC-FF67DBA65911\",\"parent_id\":\"E00EEB43-1FD9-795A-5A1C-5866F252164A\",\"title\":\"\\u82f1\\u8bed\",\"orders\":\"0\",\"remark\":null,\"is_show\":\"on\",\"is_home\":\"on\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-21 10:12:26', '2021-03-21 10:12:26');
INSERT INTO `exam_admin_operation_log` VALUES (1649, 1, 'exam/admin/exam/category', 'GET', '180.157.122.15', '[]', '2021-03-21 10:12:26', '2021-03-21 10:12:26');
INSERT INTO `exam_admin_operation_log` VALUES (1650, 1, 'exam/admin/exam/category/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:12:30', '2021-03-21 10:12:30');
INSERT INTO `exam_admin_operation_log` VALUES (1651, 1, 'exam/admin/exam/category', 'POST', '180.157.122.15', '{\"uuid\":\"5EC66557-B8EF-81AE-AE26-318253BB9AAD\",\"parent_id\":\"E00EEB43-1FD9-795A-5A1C-5866F252164A\",\"title\":\"\\u751f\\u7269\",\"orders\":\"0\",\"remark\":null,\"is_show\":\"on\",\"is_home\":\"on\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-21 10:13:08', '2021-03-21 10:13:08');
INSERT INTO `exam_admin_operation_log` VALUES (1652, 1, 'exam/admin/exam/category', 'GET', '180.157.122.15', '[]', '2021-03-21 10:13:09', '2021-03-21 10:13:09');
INSERT INTO `exam_admin_operation_log` VALUES (1653, 1, 'exam/admin/exam/category/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:13:11', '2021-03-21 10:13:11');
INSERT INTO `exam_admin_operation_log` VALUES (1654, 1, 'exam/admin/exam/category', 'POST', '180.157.122.15', '{\"uuid\":\"BED8D8BE-2C44-045D-5DAD-C4F1897DDEA1\",\"parent_id\":\"E00EEB43-1FD9-795A-5A1C-5866F252164A\",\"title\":\"\\u7f8e\\u672f\",\"orders\":\"0\",\"remark\":null,\"is_show\":\"on\",\"is_home\":\"off\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-21 10:13:37', '2021-03-21 10:13:37');
INSERT INTO `exam_admin_operation_log` VALUES (1655, 1, 'exam/admin/exam/category', 'GET', '180.157.122.15', '[]', '2021-03-21 10:13:38', '2021-03-21 10:13:38');
INSERT INTO `exam_admin_operation_log` VALUES (1656, 1, 'exam/admin/exam/category/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:13:40', '2021-03-21 10:13:40');
INSERT INTO `exam_admin_operation_log` VALUES (1657, 1, 'exam/admin/exam/category', 'POST', '180.157.122.15', '{\"uuid\":\"C4E902D5-9A82-87F4-F4E3-834E0D3812E2\",\"parent_id\":\"E00EEB43-1FD9-795A-5A1C-5866F252164A\",\"title\":\"\\u8ba1\\u7b97\\u673a\",\"orders\":\"0\",\"remark\":null,\"is_show\":\"on\",\"is_home\":\"off\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\\/category\"}', '2021-03-21 10:14:12', '2021-03-21 10:14:12');
INSERT INTO `exam_admin_operation_log` VALUES (1658, 1, 'exam/admin/exam/category', 'GET', '180.157.122.15', '[]', '2021-03-21 10:14:13', '2021-03-21 10:14:13');
INSERT INTO `exam_admin_operation_log` VALUES (1659, 1, 'exam/admin/platform/score/setting', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:17:53', '2021-03-21 10:17:53');
INSERT INTO `exam_admin_operation_log` VALUES (1660, 1, 'exam/admin/platform/banner', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:17:53', '2021-03-21 10:17:53');
INSERT INTO `exam_admin_operation_log` VALUES (1661, 1, 'exam/admin/platform/banner/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:17:55', '2021-03-21 10:17:55');
INSERT INTO `exam_admin_operation_log` VALUES (1662, 1, 'exam/admin/platform/banner', 'POST', '180.157.122.15', '{\"uuid\":\"460FE43C-F645-C79F-9F4E-5A11269F6B6E\",\"position\":\"2\",\"title\":\"\\u5f00\\u5b66\\u65b0\\u540c\\u5fd7\",\"url\":null,\"is_show\":\"on\",\"orders\":\"0\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/platform\\/banner\"}', '2021-03-21 10:18:26', '2021-03-21 10:18:26');
INSERT INTO `exam_admin_operation_log` VALUES (1663, 1, 'exam/admin/platform/banner', 'GET', '180.157.122.15', '[]', '2021-03-21 10:18:26', '2021-03-21 10:18:26');
INSERT INTO `exam_admin_operation_log` VALUES (1664, 1, 'exam/admin/platform/banner/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:18:38', '2021-03-21 10:18:38');
INSERT INTO `exam_admin_operation_log` VALUES (1665, 1, 'exam/admin/platform/banner', 'POST', '180.157.122.15', '{\"uuid\":\"70C791B9-1AF8-64D8-D88F-6C86BEECC8AD\",\"position\":\"2\",\"title\":\"\\u5fc5\\u8bfb\\u5728\\u4e0d\\u770b\\u5c31\\u665a\\u4e86\",\"url\":null,\"is_show\":\"on\",\"orders\":\"0\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/platform\\/banner\"}', '2021-03-21 10:19:07', '2021-03-21 10:19:07');
INSERT INTO `exam_admin_operation_log` VALUES (1666, 1, 'exam/admin/platform/banner', 'GET', '180.157.122.15', '[]', '2021-03-21 10:19:08', '2021-03-21 10:19:08');
INSERT INTO `exam_admin_operation_log` VALUES (1667, 1, 'exam/admin/platform/banner/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:19:10', '2021-03-21 10:19:10');
INSERT INTO `exam_admin_operation_log` VALUES (1668, 1, 'exam/admin/platform/banner', 'POST', '180.157.122.15', '{\"uuid\":\"7B6758D0-217F-5E6A-6A49-E7E99E82B992\",\"position\":\"2\",\"title\":\"\\u8fd9\\u5c31\\u6709\\u610f\\u601d\\u4e86\",\"url\":null,\"is_show\":\"on\",\"orders\":\"0\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/platform\\/banner\"}', '2021-03-21 10:19:34', '2021-03-21 10:19:34');
INSERT INTO `exam_admin_operation_log` VALUES (1669, 1, 'exam/admin/platform/banner', 'GET', '180.157.122.15', '[]', '2021-03-21 10:19:35', '2021-03-21 10:19:35');
INSERT INTO `exam_admin_operation_log` VALUES (1670, 1, 'exam/admin/platform/banner/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:19:36', '2021-03-21 10:19:36');
INSERT INTO `exam_admin_operation_log` VALUES (1671, 1, 'exam/admin/platform/banner', 'POST', '180.157.122.15', '{\"uuid\":\"8874A634-8FB2-649E-9E2C-2D2BE23F13FF\",\"position\":\"2\",\"title\":\"2021\\u65b0\\u65b0\\u8ba1\\u5212\",\"url\":null,\"is_show\":\"on\",\"orders\":\"0\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/platform\\/banner\"}', '2021-03-21 10:20:06', '2021-03-21 10:20:06');
INSERT INTO `exam_admin_operation_log` VALUES (1672, 1, 'exam/admin/platform/banner', 'GET', '180.157.122.15', '[]', '2021-03-21 10:20:07', '2021-03-21 10:20:07');
INSERT INTO `exam_admin_operation_log` VALUES (1673, 1, 'exam/admin/platform/banner/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:20:09', '2021-03-21 10:20:09');
INSERT INTO `exam_admin_operation_log` VALUES (1674, 1, 'exam/admin/platform/banner', 'POST', '180.157.122.15', '{\"uuid\":\"D41E9D16-B9F3-1D39-3963-7F9123E00482\",\"position\":\"2\",\"title\":\"2021\\u5e74\\u5ea6\\u5b66\\u4e60\\u76ee\\u6807\",\"url\":null,\"is_show\":\"on\",\"orders\":\"0\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/platform\\/banner\"}', '2021-03-21 10:20:33', '2021-03-21 10:20:33');
INSERT INTO `exam_admin_operation_log` VALUES (1675, 1, 'exam/admin/platform/banner', 'GET', '180.157.122.15', '[]', '2021-03-21 10:20:34', '2021-03-21 10:20:34');
INSERT INTO `exam_admin_operation_log` VALUES (1676, 1, 'exam/admin/platform/banner/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:20:36', '2021-03-21 10:20:36');
INSERT INTO `exam_admin_operation_log` VALUES (1677, 1, 'exam/admin/platform/banner', 'POST', '180.157.122.15', '{\"uuid\":\"4C74EFF8-EC27-5688-88F6-380FE95F94EA\",\"position\":\"4\",\"title\":\"\\u641e\\u5b9a\\u62db\\u751f\\u8ba1\\u5212\",\"url\":null,\"is_show\":\"on\",\"orders\":\"0\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/platform\\/banner\"}', '2021-03-21 10:21:05', '2021-03-21 10:21:05');
INSERT INTO `exam_admin_operation_log` VALUES (1678, 1, 'exam/admin/platform/banner', 'GET', '180.157.122.15', '[]', '2021-03-21 10:21:06', '2021-03-21 10:21:06');
INSERT INTO `exam_admin_operation_log` VALUES (1679, 1, 'exam/admin/platform/banner/5/edit', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:22:29', '2021-03-21 10:22:29');
INSERT INTO `exam_admin_operation_log` VALUES (1680, 1, 'exam/admin/platform/banner/5', 'PUT', '180.157.122.15', '{\"uuid\":\"D41E9D16-B9F3-1D39-3963-7F9123E00482\",\"position\":\"4\",\"title\":\"2021\\u5e74\\u5ea6\\u5b66\\u4e60\\u76ee\\u6807\",\"url\":null,\"is_show\":\"on\",\"orders\":\"0\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/platform\\/banner\"}', '2021-03-21 10:22:33', '2021-03-21 10:22:33');
INSERT INTO `exam_admin_operation_log` VALUES (1681, 1, 'exam/admin/platform/banner', 'GET', '180.157.122.15', '[]', '2021-03-21 10:22:34', '2021-03-21 10:22:34');
INSERT INTO `exam_admin_operation_log` VALUES (1682, 1, 'exam/admin/platform/banner/2/edit', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:22:38', '2021-03-21 10:22:38');
INSERT INTO `exam_admin_operation_log` VALUES (1683, 1, 'exam/admin/platform/banner/2', 'PUT', '180.157.122.15', '{\"uuid\":\"70C791B9-1AF8-64D8-D88F-6C86BEECC8AD\",\"position\":\"4\",\"title\":\"\\u5fc5\\u8bfb\\u5728\\u4e0d\\u770b\\u5c31\\u665a\\u4e86\",\"url\":null,\"is_show\":\"on\",\"orders\":\"0\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/platform\\/banner\"}', '2021-03-21 10:22:42', '2021-03-21 10:22:42');
INSERT INTO `exam_admin_operation_log` VALUES (1684, 1, 'exam/admin/platform/banner', 'GET', '180.157.122.15', '[]', '2021-03-21 10:22:43', '2021-03-21 10:22:43');
INSERT INTO `exam_admin_operation_log` VALUES (1685, 1, 'exam/admin/exam/search/history', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:23:34', '2021-03-21 10:23:34');
INSERT INTO `exam_admin_operation_log` VALUES (1686, 1, 'exam/admin/exam/search/history', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:31:12', '2021-03-21 10:31:12');
INSERT INTO `exam_admin_operation_log` VALUES (1687, 1, 'exam/admin/exam/search/history/1/edit', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:31:16', '2021-03-21 10:31:16');
INSERT INTO `exam_admin_operation_log` VALUES (1688, 1, 'exam/admin/exam/search/history/1', 'PUT', '180.157.122.15', '{\"title\":\"\\u9ad8\\u4e2d\\u5386\\u53f2\",\"is_show\":\"on\",\"position\":\"2\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\\/search\\/history\"}', '2021-03-21 10:31:23', '2021-03-21 10:31:23');
INSERT INTO `exam_admin_operation_log` VALUES (1689, 1, 'exam/admin/exam/search/history', 'GET', '180.157.122.15', '[]', '2021-03-21 10:31:23', '2021-03-21 10:31:23');
INSERT INTO `exam_admin_operation_log` VALUES (1690, 1, 'exam/admin/exam/search/history', 'GET', '180.157.122.15', '[]', '2021-03-21 10:32:04', '2021-03-21 10:32:04');
INSERT INTO `exam_admin_operation_log` VALUES (1691, 1, 'exam/admin/exam/search/history/2/edit', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:32:07', '2021-03-21 10:32:07');
INSERT INTO `exam_admin_operation_log` VALUES (1692, 1, 'exam/admin/exam/search/history/2', 'PUT', '180.157.122.15', '{\"title\":\"\\u7269\\u7406\\u8bd5\\u9898\",\"is_show\":\"on\",\"position\":\"2\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\\/search\\/history\"}', '2021-03-21 10:32:10', '2021-03-21 10:32:10');
INSERT INTO `exam_admin_operation_log` VALUES (1693, 1, 'exam/admin/exam/search/history', 'GET', '180.157.122.15', '[]', '2021-03-21 10:32:11', '2021-03-21 10:32:11');
INSERT INTO `exam_admin_operation_log` VALUES (1694, 1, 'exam/admin/exam/search/history/3/edit', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:32:16', '2021-03-21 10:32:16');
INSERT INTO `exam_admin_operation_log` VALUES (1695, 1, 'exam/admin/exam/search/history/3', 'PUT', '180.157.122.15', '{\"title\":\"\\u751f\\u7269\\u9ad8\\u8003\",\"is_show\":\"on\",\"position\":\"2\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\\/search\\/history\"}', '2021-03-21 10:32:19', '2021-03-21 10:32:19');
INSERT INTO `exam_admin_operation_log` VALUES (1696, 1, 'exam/admin/exam/search/history', 'GET', '180.157.122.15', '[]', '2021-03-21 10:32:19', '2021-03-21 10:32:19');
INSERT INTO `exam_admin_operation_log` VALUES (1697, 1, 'exam/admin/exam/search/history/5/edit', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:32:35', '2021-03-21 10:32:35');
INSERT INTO `exam_admin_operation_log` VALUES (1698, 1, 'exam/admin/exam/search/history/5', 'PUT', '180.157.122.15', '{\"title\":\"\\u7269\\u7406\\u7535\\u5b66\",\"is_show\":\"on\",\"position\":\"2\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\\/search\\/history\"}', '2021-03-21 10:32:38', '2021-03-21 10:32:38');
INSERT INTO `exam_admin_operation_log` VALUES (1699, 1, 'exam/admin/exam/search/history', 'GET', '180.157.122.15', '[]', '2021-03-21 10:32:38', '2021-03-21 10:32:38');
INSERT INTO `exam_admin_operation_log` VALUES (1700, 1, 'exam/admin/platform/score/setting', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:35:13', '2021-03-21 10:35:13');
INSERT INTO `exam_admin_operation_log` VALUES (1701, 1, 'exam/admin/platform/score/setting/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:35:15', '2021-03-21 10:35:15');
INSERT INTO `exam_admin_operation_log` VALUES (1702, 1, 'exam/admin/platform/score/setting', 'POST', '180.157.122.15', '{\"uuid\":\"587D6A8A-152D-7200-0034-A6A5FCC4DC2F\",\"key\":\"register\",\"score\":\"10\",\"is_show\":\"on\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/platform\\/score\\/setting\"}', '2021-03-21 10:35:22', '2021-03-21 10:35:22');
INSERT INTO `exam_admin_operation_log` VALUES (1703, 1, 'exam/admin/platform/score/setting', 'GET', '180.157.122.15', '[]', '2021-03-21 10:35:22', '2021-03-21 10:35:22');
INSERT INTO `exam_admin_operation_log` VALUES (1704, 1, 'exam/admin/platform/score/setting/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:35:24', '2021-03-21 10:35:24');
INSERT INTO `exam_admin_operation_log` VALUES (1705, 1, 'exam/admin/platform/score/setting', 'POST', '180.157.122.15', '{\"uuid\":\"AD0D0419-482E-1398-9861-44731A4CFD59\",\"key\":\"sign\",\"score\":\"10\",\"is_show\":\"on\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/platform\\/score\\/setting\"}', '2021-03-21 10:35:30', '2021-03-21 10:35:30');
INSERT INTO `exam_admin_operation_log` VALUES (1706, 1, 'exam/admin/platform/score/setting', 'GET', '180.157.122.15', '[]', '2021-03-21 10:35:30', '2021-03-21 10:35:30');
INSERT INTO `exam_admin_operation_log` VALUES (1707, 1, 'exam/admin/platform/score/setting/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:35:32', '2021-03-21 10:35:32');
INSERT INTO `exam_admin_operation_log` VALUES (1708, 1, 'exam/admin/platform/score/setting', 'POST', '180.157.122.15', '{\"uuid\":\"6143D455-67FF-7051-5159-43EB6456E6AE\",\"key\":\"share\",\"score\":\"2\",\"is_show\":\"on\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/platform\\/score\\/setting\"}', '2021-03-21 10:35:39', '2021-03-21 10:35:39');
INSERT INTO `exam_admin_operation_log` VALUES (1709, 1, 'exam/admin/platform/score/setting', 'GET', '180.157.122.15', '[]', '2021-03-21 10:35:40', '2021-03-21 10:35:40');
INSERT INTO `exam_admin_operation_log` VALUES (1710, 1, 'exam/admin/exam/search/history', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:36:44', '2021-03-21 10:36:44');
INSERT INTO `exam_admin_operation_log` VALUES (1711, 1, 'exam/admin/exam/search/history/4/edit', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:37:46', '2021-03-21 10:37:46');
INSERT INTO `exam_admin_operation_log` VALUES (1712, 1, 'exam/admin/exam/search/history/4', 'PUT', '180.157.122.15', '{\"title\":\"\\u82f1\\u8bed\\u771f\\u9898\",\"is_show\":\"on\",\"position\":\"1\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\\/search\\/history\"}', '2021-03-21 10:37:50', '2021-03-21 10:37:50');
INSERT INTO `exam_admin_operation_log` VALUES (1713, 1, 'exam/admin/exam/search/history', 'GET', '180.157.122.15', '[]', '2021-03-21 10:37:50', '2021-03-21 10:37:50');
INSERT INTO `exam_admin_operation_log` VALUES (1714, 1, 'exam/admin/exam/search/history/6/edit', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:37:53', '2021-03-21 10:37:53');
INSERT INTO `exam_admin_operation_log` VALUES (1715, 1, 'exam/admin/exam/search/history/6', 'PUT', '180.157.122.15', '{\"title\":\"\\u5386\\u53f2\\u771f\\u9898\",\"is_show\":\"on\",\"position\":\"1\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\\/search\\/history\"}', '2021-03-21 10:37:57', '2021-03-21 10:37:57');
INSERT INTO `exam_admin_operation_log` VALUES (1716, 1, 'exam/admin/exam/search/history', 'GET', '180.157.122.15', '[]', '2021-03-21 10:37:57', '2021-03-21 10:37:57');
INSERT INTO `exam_admin_operation_log` VALUES (1717, 1, 'exam/admin/exam/search/history', 'GET', '180.157.122.15', '[]', '2021-03-21 10:39:35', '2021-03-21 10:39:35');
INSERT INTO `exam_admin_operation_log` VALUES (1718, 1, 'exam/admin/platform/message/category', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:40:19', '2021-03-21 10:40:19');
INSERT INTO `exam_admin_operation_log` VALUES (1719, 1, 'exam/admin/platform/message/category/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:40:20', '2021-03-21 10:40:20');
INSERT INTO `exam_admin_operation_log` VALUES (1720, 1, 'exam/admin/platform/message/category', 'POST', '180.157.122.15', '{\"uuid\":\"A8B89FDA-3F6D-31AE-AE9B-E4C9CEB0F32E\",\"title\":\"\\u7cfb\\u7edf\\u6d88\\u606f\",\"is_show\":\"on\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/platform\\/message\\/category\"}', '2021-03-21 10:40:32', '2021-03-21 10:40:32');
INSERT INTO `exam_admin_operation_log` VALUES (1721, 1, 'exam/admin/platform/message/category', 'GET', '180.157.122.15', '[]', '2021-03-21 10:40:33', '2021-03-21 10:40:33');
INSERT INTO `exam_admin_operation_log` VALUES (1722, 1, 'exam/admin/platform/message/content', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:40:35', '2021-03-21 10:40:35');
INSERT INTO `exam_admin_operation_log` VALUES (1723, 1, 'exam/admin/platform/message/content/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:40:36', '2021-03-21 10:40:36');
INSERT INTO `exam_admin_operation_log` VALUES (1724, 1, 'exam/admin/platform/message/content', 'POST', '180.157.122.15', '{\"uuid\":\"4671A12B-CBFB-DFDB-DB66-B73C9BA9D0AF\",\"platform_message_category_uuid\":\"A8B89FDA-3F6D-31AE-AE9B-E4C9CEB0F32E\",\"title\":\"\\u968f\\u8eab\\u5b66\\u4e60\\u5e93\\u6b63\\u5f0f\\u53d1\\u5e03\\u7b2c\\u4e00\\u4e2a\\u7248\\u672c\",\"content\":\"<p>\\u968f\\u8eab\\u5b66\\u4e60\\u5e93\\u662f\\u4e00\\u6b3e\\u57fa\\u4e8e\\u5fae\\u4fe1\\u5c0f\\u7a0b\\u5e8f\\u7684\\u7b54\\u9898\\u7c7b\\u5c0f\\u7a0b\\u5e8f\\u3002\\u8be5\\u5c0f\\u7a0b\\u5e8f\\u6db5\\u76d6\\u8bd5\\u9898\\u5185\\u5bb9\\u4e30\\u5bcc\\uff0c\\u5305\\u542b\\u9ad8\\u4e2d\\u7684\\u8bed\\u6587\\u3001\\u6570\\u5b66\\u3001\\u5916\\u8bed\\u3001\\u653f\\u6cbb\\u3001\\u5386\\u53f2\\u3001\\u5730\\u7406\\u3001\\u7269\\u7406\\u3001\\u5316\\u5b66\\u548c\\u751f\\u7269\\u7b49\\u8bfe\\u7a0b\\u4fe1\\u606f\\u3002\\u65e8\\u5728\\u4e3a\\u65b9\\u4fbf\\u5927\\u5bb6\\u5e73\\u5e38\\u7684\\u5b66\\u4e60\\u5237\\u9898\\u4f7f\\u7528\\u3002\\u5b9e\\u73b0\\u968f\\u65f6\\u968f\\u5730\\u7684\\u5b66\\u4e60\\u3002\\u6240\\u6709\\u7684\\u8bd5\\u9898\\u90fd\\u662f\\u6839\\u636e\\u76f8\\u5bf9\\u5e94\\u7684\\u6559\\u6750\\u6216\\u8005\\u5386\\u5e74\\u771f\\u9898\\u6c47\\u603b\\u800c\\u6765\\u3002<\\/p>\",\"is_show\":\"on\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/platform\\/message\\/content\"}', '2021-03-21 10:42:57', '2021-03-21 10:42:57');
INSERT INTO `exam_admin_operation_log` VALUES (1725, 1, 'exam/admin/platform/message/content', 'GET', '180.157.122.15', '[]', '2021-03-21 10:42:58', '2021-03-21 10:42:58');
INSERT INTO `exam_admin_operation_log` VALUES (1726, 1, 'exam/admin/platform/message/content', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:45:45', '2021-03-21 10:45:45');
INSERT INTO `exam_admin_operation_log` VALUES (1727, 1, 'exam/admin/platform/message/content/1/edit', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:45:47', '2021-03-21 10:45:47');
INSERT INTO `exam_admin_operation_log` VALUES (1728, 1, 'exam/admin/platform/content', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:45:52', '2021-03-21 10:45:52');
INSERT INTO `exam_admin_operation_log` VALUES (1729, 1, 'exam/admin/platform/content/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 10:45:53', '2021-03-21 10:45:53');
INSERT INTO `exam_admin_operation_log` VALUES (1730, 1, 'exam/admin/platform/content', 'POST', '180.157.122.15', '{\"uuid\":\"A04FA2F8-3275-93C7-C70C-6D6A53884AA3\",\"position\":\"1\",\"content\":\"<p>\\u968f\\u8eab\\u5b66\\u4e60\\u5e93\\u662f\\u4e00\\u6b3e\\u57fa\\u4e8e\\u5fae\\u4fe1\\u5c0f\\u7a0b\\u5e8f\\u7684\\u7b54\\u9898\\u7c7b\\u5c0f\\u7a0b\\u5e8f\\u3002\\u8be5\\u5c0f\\u7a0b\\u5e8f\\u6db5\\u76d6\\u8bd5\\u9898\\u5185\\u5bb9\\u4e30\\u5bcc\\uff0c\\u5305\\u542b\\u9ad8\\u4e2d\\u7684\\u8bed\\u6587\\u3001\\u6570\\u5b66\\u3001\\u5916\\u8bed\\u3001\\u653f\\u6cbb\\u3001\\u5386\\u53f2\\u3001\\u5730\\u7406\\u3001\\u7269\\u7406\\u3001\\u5316\\u5b66\\u548c\\u751f\\u7269\\u7b49\\u8bfe\\u7a0b\\u4fe1\\u606f\\u3002\\u65e8\\u5728\\u4e3a\\u65b9\\u4fbf\\u5927\\u5bb6\\u5e73\\u5e38\\u7684\\u5b66\\u4e60\\u5237\\u9898\\u4f7f\\u7528\\u3002\\u5b9e\\u73b0\\u968f\\u65f6\\u968f\\u5730\\u7684\\u5b66\\u4e60\\u3002\\u6240\\u6709\\u7684\\u8bd5\\u9898\\u90fd\\u662f\\u6839\\u636e\\u76f8\\u5bf9\\u5e94\\u7684\\u6559\\u6750\\u6216\\u8005\\u5386\\u5e74\\u771f\\u9898\\u6c47\\u603b\\u800c\\u6765\\u3002<\\/p>\",\"is_show\":\"on\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/platform\\/content\"}', '2021-03-21 10:45:58', '2021-03-21 10:45:58');
INSERT INTO `exam_admin_operation_log` VALUES (1731, 1, 'exam/admin/platform/content', 'GET', '180.157.122.15', '[]', '2021-03-21 10:45:59', '2021-03-21 10:45:59');
INSERT INTO `exam_admin_operation_log` VALUES (1732, 1, 'exam/admin/exam/category', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:07:24', '2021-03-21 11:07:24');
INSERT INTO `exam_admin_operation_log` VALUES (1733, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:07:25', '2021-03-21 11:07:25');
INSERT INTO `exam_admin_operation_log` VALUES (1734, 1, 'exam/admin/exam/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:07:26', '2021-03-21 11:07:26');
INSERT INTO `exam_admin_operation_log` VALUES (1735, 1, 'exam/admin/exam', 'POST', '180.157.122.15', '{\"uuid\":\"92FB9256-CA96-4046-464F-1FD21F13B58A\",\"category\":[\"C715B621-2069-C557-575B-ED04E2C08D77\",null],\"collection\":[null],\"title\":\"\\u4e0d\\u7b49\\u5f0f\\uff1e0\\u7684\\u89e3\\u96c6\\u662f?\",\"option\":{\"new_1\":{\"title\":\"\\uff08\\uff0c\\uff09\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_2\":{\"title\":\"\\uff084\\uff0c\\uff09\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_3\":{\"title\":\"\\uff08\\uff0c\\uff0d3\\uff09\\u222a\\uff084\\uff0c+\\uff09\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_4\":{\"title\":\"\\uff0c\\uff0d3\\uff09\\u222a\\uff08\\uff0c\\uff09\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}},\"answer\":[\"D\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\"}', '2021-03-21 11:08:27', '2021-03-21 11:08:27');
INSERT INTO `exam_admin_operation_log` VALUES (1736, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '[]', '2021-03-21 11:08:27', '2021-03-21 11:08:27');
INSERT INTO `exam_admin_operation_log` VALUES (1737, 1, 'exam/admin/exam/tag', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:08:32', '2021-03-21 11:08:32');
INSERT INTO `exam_admin_operation_log` VALUES (1738, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:08:33', '2021-03-21 11:08:33');
INSERT INTO `exam_admin_operation_log` VALUES (1739, 1, 'exam/admin/exam/tag', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:08:34', '2021-03-21 11:08:34');
INSERT INTO `exam_admin_operation_log` VALUES (1740, 1, 'exam/admin/exam/tag/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:08:36', '2021-03-21 11:08:36');
INSERT INTO `exam_admin_operation_log` VALUES (1741, 1, 'exam/admin/exam/tag', 'POST', '180.157.122.15', '{\"uuid\":\"22E1D4C0-4D78-0F3B-3BA3-28FB264E3B92\",\"title\":\"\\u6570\\u5b66\\u8bd5\\u5377\",\"remark\":null,\"is_show\":\"on\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\\/tag\"}', '2021-03-21 11:08:47', '2021-03-21 11:08:47');
INSERT INTO `exam_admin_operation_log` VALUES (1742, 1, 'exam/admin/exam/tag', 'GET', '180.157.122.15', '[]', '2021-03-21 11:08:48', '2021-03-21 11:08:48');
INSERT INTO `exam_admin_operation_log` VALUES (1743, 1, 'exam/admin/exam/collection', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:08:49', '2021-03-21 11:08:49');
INSERT INTO `exam_admin_operation_log` VALUES (1744, 1, 'exam/admin/exam/collection/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:08:51', '2021-03-21 11:08:51');
INSERT INTO `exam_admin_operation_log` VALUES (1745, 1, 'exam/admin/exam/collection', 'POST', '180.157.122.15', '{\"uuid\":\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",\"exam_category_uuid\":\"C715B621-2069-C557-575B-ED04E2C08D77\",\"exam_tag_uuid\":\"22E1D4C0-4D78-0F3B-3BA3-28FB264E3B92\",\"title\":\"\\u56db\\u5ddd\\u7709\\u5c71\\u4e00\\u4e2d\\u671f\\u672b\\u8003\\u8bd5\\u8bd5\\u5377\",\"exam_time\":\"23:00:00\",\"submit_number\":\"0\",\"is_recommend\":\"off\",\"is_show\":\"on\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\\/collection\"}', '2021-03-21 11:11:54', '2021-03-21 11:11:54');
INSERT INTO `exam_admin_operation_log` VALUES (1746, 1, 'exam/admin/exam/collection', 'GET', '180.157.122.15', '[]', '2021-03-21 11:11:55', '2021-03-21 11:11:55');
INSERT INTO `exam_admin_operation_log` VALUES (1747, 1, 'exam/admin/exam/collection', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:12:04', '2021-03-21 11:12:04');
INSERT INTO `exam_admin_operation_log` VALUES (1748, 1, 'exam/admin/exam/search/history', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:12:09', '2021-03-21 11:12:09');
INSERT INTO `exam_admin_operation_log` VALUES (1749, 1, 'exam/admin/exam/tag', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:12:10', '2021-03-21 11:12:10');
INSERT INTO `exam_admin_operation_log` VALUES (1750, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:12:11', '2021-03-21 11:12:11');
INSERT INTO `exam_admin_operation_log` VALUES (1751, 1, 'exam/admin/exam/collection', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:12:12', '2021-03-21 11:12:12');
INSERT INTO `exam_admin_operation_log` VALUES (1752, 1, 'exam/admin/exam/collection', 'GET', '180.157.122.15', '[]', '2021-03-21 11:12:14', '2021-03-21 11:12:14');
INSERT INTO `exam_admin_operation_log` VALUES (1753, 1, 'exam/admin/exam/collection', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:12:24', '2021-03-21 11:12:24');
INSERT INTO `exam_admin_operation_log` VALUES (1754, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:12:33', '2021-03-21 11:12:33');
INSERT INTO `exam_admin_operation_log` VALUES (1755, 1, 'exam/admin/exam/92FB9256-CA96-4046-464F-1FD21F13B58A/edit', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:12:39', '2021-03-21 11:12:39');
INSERT INTO `exam_admin_operation_log` VALUES (1756, 1, 'exam/admin/exam/92FB9256-CA96-4046-464F-1FD21F13B58A', 'PUT', '180.157.122.15', '{\"uuid\":\"92FB9256-CA96-4046-464F-1FD21F13B58A\",\"category\":[\"C715B621-2069-C557-575B-ED04E2C08D77\",null],\"collection\":[\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",null],\"title\":\"\\u4e0d\\u7b49\\u5f0f\\uff1e0\\u7684\\u89e3\\u96c6\\u662f?\",\"option\":[{\"title\":\"\\uff08\\uff0c\\uff09\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\uff084\\uff0c\\uff09\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\uff08\\uff0c\\uff0d3\\uff09\\u222a\\uff084\\uff0c+\\uff09\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\uff0c\\uff0d3\\uff09\\u222a\\uff08\\uff0c\\uff09\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":[\"D\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\"}', '2021-03-21 11:12:43', '2021-03-21 11:12:43');
INSERT INTO `exam_admin_operation_log` VALUES (1757, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '[]', '2021-03-21 11:12:43', '2021-03-21 11:12:43');
INSERT INTO `exam_admin_operation_log` VALUES (1758, 1, 'exam/admin/exam/collection', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:12:45', '2021-03-21 11:12:45');
INSERT INTO `exam_admin_operation_log` VALUES (1759, 1, 'exam/admin/exam/search/history', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:12:50', '2021-03-21 11:12:50');
INSERT INTO `exam_admin_operation_log` VALUES (1760, 1, 'exam/admin/exam/tag', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:12:51', '2021-03-21 11:12:51');
INSERT INTO `exam_admin_operation_log` VALUES (1761, 1, 'exam/admin/exam/collection', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:12:52', '2021-03-21 11:12:52');
INSERT INTO `exam_admin_operation_log` VALUES (1762, 1, 'exam/admin/exam/search/history', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:13:22', '2021-03-21 11:13:22');
INSERT INTO `exam_admin_operation_log` VALUES (1763, 1, 'exam/admin/exam/collection', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:13:32', '2021-03-21 11:13:32');
INSERT INTO `exam_admin_operation_log` VALUES (1764, 1, 'exam/admin/auth/menu', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:14:53', '2021-03-21 11:14:53');
INSERT INTO `exam_admin_operation_log` VALUES (1765, 1, 'exam/admin/exam/collection', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:15:02', '2021-03-21 11:15:02');
INSERT INTO `exam_admin_operation_log` VALUES (1766, 1, 'exam/admin/exam/collection', 'GET', '180.157.122.15', '[]', '2021-03-21 11:15:04', '2021-03-21 11:15:04');
INSERT INTO `exam_admin_operation_log` VALUES (1767, 1, 'exam/admin/exam/collection', 'GET', '180.157.122.15', '[]', '2021-03-21 11:15:31', '2021-03-21 11:15:31');
INSERT INTO `exam_admin_operation_log` VALUES (1768, 1, 'exam/admin/exam/collection/exam', 'GET', '180.157.122.15', '{\"collection_id\":\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:15:34', '2021-03-21 11:15:34');
INSERT INTO `exam_admin_operation_log` VALUES (1769, 1, 'exam/admin/exam/tag', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:15:44', '2021-03-21 11:15:44');
INSERT INTO `exam_admin_operation_log` VALUES (1770, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:15:44', '2021-03-21 11:15:44');
INSERT INTO `exam_admin_operation_log` VALUES (1771, 1, 'exam/admin/exam/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:15:46', '2021-03-21 11:15:46');
INSERT INTO `exam_admin_operation_log` VALUES (1772, 1, 'exam/admin/exam', 'POST', '180.157.122.15', '{\"uuid\":\"E6A97DF9-A74D-FB1A-1AFE-2B96F44C4378\",\"category\":[\"C715B621-2069-C557-575B-ED04E2C08D77\",null],\"collection\":[\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",null],\"title\":\"\\u5bf9\\u4e8e\\u5b9a\\u4e49\\u5728R\\u4e0a\\u7684\\u5947\\u51fd\\u6570f\\uff08x\\uff09\\uff0c\\u6ee1\\u8db3f\\uff08\\ufe63x\\uff09f\\uff083x\\uff09=0\\uff0c\\u82e5f\\uff08\\ufe631\\uff09=1\\uff0c\\u5219f\\uff081\\uff09f\\uff082\\uff09f\\uff083\\uff09\\u2026+f\\uff082015\\uff09=\\uff1f\",\"option\":{\"new_1\":{\"title\":\"-1\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_2\":{\"title\":\"0\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_3\":{\"title\":\"1\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_4\":{\"title\":\"2\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}},\"answer\":[\"B\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":\"\\u5229\\u7528\\u51fd\\u6570\\u7684\\u5947\\u5076\\u6027\\uff0c\\u4ee5\\u53ca\\u51fd\\u6570\\u7684\\u5173\\u7cfb\\u5f0f\\uff0c\\u6c42\\u51fa\\u51fd\\u6570\\u7684\\u5468\\u671f\\uff0c\\u7136\\u540e\\u6c42\\u89e3\\u51fd\\u6570\\u503c\\u5373\\u53ef\\uff0e\",\"tips\":null,\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\"}', '2021-03-21 11:18:26', '2021-03-21 11:18:26');
INSERT INTO `exam_admin_operation_log` VALUES (1773, 1, 'exam/admin/exam/create', 'GET', '180.157.122.15', '[]', '2021-03-21 11:18:26', '2021-03-21 11:18:26');
INSERT INTO `exam_admin_operation_log` VALUES (1774, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:18:31', '2021-03-21 11:18:31');
INSERT INTO `exam_admin_operation_log` VALUES (1775, 1, 'exam/admin/exam/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:18:33', '2021-03-21 11:18:33');
INSERT INTO `exam_admin_operation_log` VALUES (1776, 1, 'exam/admin/exam', 'POST', '180.157.122.15', '{\"uuid\":\"25396EE1-F593-2016-16F9-5883D414B33E\",\"category\":[\"C715B621-2069-C557-575B-ED04E2C08D77\",null],\"collection\":[\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",null],\"title\":\"\\u5bf9\\u4e8e\\u5b9a\\u4e49\\u5728R\\u4e0a\\u7684\\u5947\\u51fd\\u6570f\\uff08x\\uff09\\uff0c\\u6ee1\\u8db3f\\uff08\\ufe63x\\uff09f\\uff083x\\uff09=0\\uff0c\\u82e5f\\uff08\\ufe631\\uff09=1\\uff0c\\u5219f\\uff081\\uff09f\\uff082\\uff09f\\uff083\\uff09\\u2026+f\\uff082015\\uff09=\\uff1f\",\"option\":{\"new_1\":{\"title\":\"-1\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_2\":{\"title\":\"0\",\"check\":\"B\",\"is_check\":\"1\",\"_remove_\":\"0\"},\"new_3\":{\"title\":\"1\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_4\":{\"title\":\"2\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}},\"answer\":[\"B\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":\"\\u5229\\u7528\\u51fd\\u6570\\u7684\\u5947\\u5076\\u6027\\uff0c\\u4ee5\\u53ca\\u51fd\\u6570\\u7684\\u5173\\u7cfb\\u5f0f\\uff0c\\u6c42\\u51fa\\u51fd\\u6570\\u7684\\u5468\\u671f\\uff0c\\u7136\\u540e\\u6c42\\u89e3\\u51fd\\u6570\\u503c\\u5373\\u53ef\\uff0e\",\"tips\":null,\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\"}', '2021-03-21 11:19:20', '2021-03-21 11:19:20');
INSERT INTO `exam_admin_operation_log` VALUES (1777, 1, 'exam/admin/exam/create', 'GET', '180.157.122.15', '[]', '2021-03-21 11:19:21', '2021-03-21 11:19:21');
INSERT INTO `exam_admin_operation_log` VALUES (1778, 1, 'exam/admin/exam', 'POST', '180.157.122.15', '{\"uuid\":\"085FB96B-45A1-0207-0737-C930DE05C100\",\"category\":[\"C715B621-2069-C557-575B-ED04E2C08D77\",null],\"collection\":[\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",null],\"title\":\"\\u5bf9\\u4e8e\\u5b9a\\u4e49\\u5728R\\u4e0a\\u7684\\u5947\\u51fd\\u6570f\\uff08x\\uff09\\uff0c\\u6ee1\\u8db3f\\uff08\\ufe63x\\uff09f\\uff083x\\uff09=0\\uff0c\\u82e5f\\uff08\\ufe631\\uff09=1\\uff0c\\u5219f\\uff081\\uff09f\\uff082\\uff09f\\uff083\\uff09\\u2026+f\\uff082015\\uff09=\\uff1f\",\"option\":{\"new_1\":{\"title\":\"-1\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_2\":{\"title\":\"0\",\"check\":\"B\",\"is_check\":\"1\",\"_remove_\":\"0\"},\"new_3\":{\"title\":\"1\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_4\":{\"title\":\"2\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}},\"answer\":[\"B\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":\"\\u5229\\u7528\\u51fd\\u6570\\u7684\\u5947\\u5076\\u6027\\uff0c\\u4ee5\\u53ca\\u51fd\\u6570\\u7684\\u5173\\u7cfb\\u5f0f\\uff0c\\u6c42\\u51fa\\u51fd\\u6570\\u7684\\u5468\\u671f\\uff0c\\u7136\\u540e\\u6c42\\u89e3\\u51fd\\u6570\\u503c\\u5373\\u53ef\\uff0e\",\"tips\":null,\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\"}', '2021-03-21 11:19:32', '2021-03-21 11:19:32');
INSERT INTO `exam_admin_operation_log` VALUES (1779, 1, 'exam/admin/exam/create', 'GET', '180.157.122.15', '[]', '2021-03-21 11:19:32', '2021-03-21 11:19:32');
INSERT INTO `exam_admin_operation_log` VALUES (1780, 1, 'exam/admin/exam', 'POST', '180.157.122.15', '{\"uuid\":\"650B46F1-191A-2997-9728-165C294A857C\",\"category\":[\"C715B621-2069-C557-575B-ED04E2C08D77\",null],\"collection\":[\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",null],\"title\":\"\\u5bf9\\u4e8e\\u5b9a\\u4e49\\u5728R\\u4e0a\\u7684\\u5947\\u51fd\\u6570f\\uff08x\\uff09\\uff0c\\u6ee1\\u8db3f\\uff08\\ufe63x\\uff09f\\uff083x\\uff09=0\\uff0c\\u82e5f\\uff08\\ufe631\\uff09=1\\uff0c\\u5219f\\uff081\\uff09f\\uff082\\uff09f\\uff083\\uff09\\u2026+f\\uff082015\\uff09=\\uff1f\",\"option\":{\"new_1\":{\"title\":\"-1\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_2\":{\"title\":\"0\",\"check\":\"B\",\"is_check\":\"1\",\"_remove_\":\"0\"},\"new_3\":{\"title\":\"1\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_4\":{\"title\":\"2\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}},\"answer\":[\"B\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":\"\\u5229\\u7528\\u51fd\\u6570\\u7684\\u5947\\u5076\\u6027\\uff0c\\u4ee5\\u53ca\\u51fd\\u6570\\u7684\\u5173\\u7cfb\\u5f0f\\uff0c\\u6c42\\u51fa\\u51fd\\u6570\\u7684\\u5468\\u671f\\uff0c\\u7136\\u540e\\u6c42\\u89e3\\u51fd\\u6570\\u503c\\u5373\\u53ef\\uff0e\",\"tips\":null,\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\"}', '2021-03-21 11:19:44', '2021-03-21 11:19:44');
INSERT INTO `exam_admin_operation_log` VALUES (1781, 1, 'exam/admin/exam/create', 'GET', '180.157.122.15', '[]', '2021-03-21 11:19:44', '2021-03-21 11:19:44');
INSERT INTO `exam_admin_operation_log` VALUES (1782, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:19:48', '2021-03-21 11:19:48');
INSERT INTO `exam_admin_operation_log` VALUES (1783, 1, 'exam/admin/exam/92FB9256-CA96-4046-464F-1FD21F13B58A/edit', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:19:51', '2021-03-21 11:19:51');
INSERT INTO `exam_admin_operation_log` VALUES (1784, 1, 'exam/admin/exam/92FB9256-CA96-4046-464F-1FD21F13B58A', 'PUT', '180.157.122.15', '{\"uuid\":\"92FB9256-CA96-4046-464F-1FD21F13B58A\",\"category\":[\"C715B621-2069-C557-575B-ED04E2C08D77\",null],\"collection\":[\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",null],\"title\":\"\\u4e0d\\u7b49\\u5f0f\\uff1e0\\u7684\\u89e3\\u96c6\\u662f?\",\"option\":[{\"title\":\"\\uff08\\uff0c\\uff09\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\uff084\\uff0c\\uff09\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\uff08\\uff0c\\uff0d3\\uff09\\u222a\\uff084\\uff0c+\\uff09\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"\\uff0c\\uff0d3\\uff09\\u222a\\uff08\\uff0c\\uff09\",\"check\":\"D\",\"is_check\":\"1\",\"_remove_\":\"0\"}],\"answer\":[\"D\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\"}', '2021-03-21 11:19:59', '2021-03-21 11:19:59');
INSERT INTO `exam_admin_operation_log` VALUES (1785, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '[]', '2021-03-21 11:20:00', '2021-03-21 11:20:00');
INSERT INTO `exam_admin_operation_log` VALUES (1786, 1, 'exam/admin/exam/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:20:05', '2021-03-21 11:20:05');
INSERT INTO `exam_admin_operation_log` VALUES (1787, 1, 'exam/admin/exam', 'POST', '180.157.122.15', '{\"uuid\":\"EB853839-9EF0-12D5-D576-8752FFDC9F97\",\"category\":[\"C715B621-2069-C557-575B-ED04E2C08D77\",null],\"collection\":[\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",null],\"title\":\"\\u5bf9\\u4e8e\\u5b9a\\u4e49\\u5728R\\u4e0a\\u7684\\u5947\\u51fd\\u6570f\\uff08x\\uff09\\uff0c\\u6ee1\\u8db3f\\uff08\\ufe63x\\uff09f\\uff083x\\uff09=0\\uff0c\\u82e5f\\uff08\\ufe631\\uff09=1\\uff0c\\u5219f\\uff081\\uff09f\\uff082\\uff09f\\uff083\\uff09\\u2026+f\\uff082015\\uff09=\",\"option\":{\"new_1\":{\"title\":\"-1\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_2\":{\"title\":\"0\",\"check\":\"B\",\"is_check\":\"1\",\"_remove_\":\"0\"},\"new_3\":{\"title\":\"1\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_4\":{\"title\":\"2\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}},\"answer\":[\"B\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\"}', '2021-03-21 11:21:22', '2021-03-21 11:21:22');
INSERT INTO `exam_admin_operation_log` VALUES (1788, 1, 'exam/admin/exam/create', 'GET', '180.157.122.15', '[]', '2021-03-21 11:21:23', '2021-03-21 11:21:23');
INSERT INTO `exam_admin_operation_log` VALUES (1789, 1, 'exam/admin/exam', 'POST', '180.157.122.15', '{\"uuid\":\"40366648-9539-5577-77F6-6236DE58C2BB\",\"category\":[\"C715B621-2069-C557-575B-ED04E2C08D77\",null],\"collection\":[\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",null],\"title\":\"\\u5bf9\\u4e8e\\u5b9a\\u4e49\\u5728R\\u4e0a\\u7684\\u5947\\u51fd\\u6570f\\uff08x\\uff09\\uff0c\\u6ee1\\u8db3f\\uff08\\ufe63x\\uff09f\\uff083x\\uff09=0\\uff0c\\u82e5f\\uff08\\ufe631\\uff09=1\\uff0c\\u5219f\\uff081\\uff09f\\uff082\\uff09f\\uff083\\uff09\\u2026+f\\uff082015\\uff09=\",\"option\":{\"new_1\":{\"title\":\"-1\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_2\":{\"title\":\"0\",\"check\":\"B\",\"is_check\":\"1\",\"_remove_\":\"0\"},\"new_3\":{\"title\":\"1\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_4\":{\"title\":\"2\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}},\"answer\":[\"B\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\"}', '2021-03-21 11:22:41', '2021-03-21 11:22:41');
INSERT INTO `exam_admin_operation_log` VALUES (1790, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '[]', '2021-03-21 11:22:41', '2021-03-21 11:22:41');
INSERT INTO `exam_admin_operation_log` VALUES (1791, 1, 'exam/admin/exam/40366648-9539-5577-77F6-6236DE58C2BB/edit', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:22:44', '2021-03-21 11:22:44');
INSERT INTO `exam_admin_operation_log` VALUES (1792, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:22:47', '2021-03-21 11:22:47');
INSERT INTO `exam_admin_operation_log` VALUES (1793, 1, 'exam/admin/exam/92FB9256-CA96-4046-464F-1FD21F13B58A/edit', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:22:49', '2021-03-21 11:22:49');
INSERT INTO `exam_admin_operation_log` VALUES (1794, 1, 'exam/admin/exam/92FB9256-CA96-4046-464F-1FD21F13B58A', 'PUT', '180.157.122.15', '{\"uuid\":\"92FB9256-CA96-4046-464F-1FD21F13B58A\",\"category\":[\"C715B621-2069-C557-575B-ED04E2C08D77\",null],\"collection\":[\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",null],\"title\":\"\\u5df2\\u77e5\\u5b9a\\u4e49\\u5728R\\u4e0a\\u7684\\u5947\\u51fd\\u6570f\\uff08x\\uff09\\u6ee1\\u8db3f\\uff08x\\uff09=f\\uff08x4\\uff09\\u4e14f\\uff083\\uff09=0\\uff0c\\u5219\\u65b9\\u7a0bf\\uff08x\\uff09=0\\u5728\\u533a\\u95f4\\uff080\\uff0c10\\uff09\\u5185\\u6574\\u6570\\u6839\\u6709\",\"option\":[{\"title\":\"4\\u4e2a\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"5\\u4e2a\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"6\\u4e2a\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"7\\u4e2a\",\"check\":\"D\",\"is_check\":\"1\",\"_remove_\":\"0\"}],\"answer\":[\"D\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":\"\\u7531\\u5df2\\u77e5\\u53ef\\u77e5f\\uff083\\uff09=0\\uff0c\\r\\n\\u56e0\\u4e3af\\uff08x\\uff09\\u662fR\\u4e0a\\u7684\\u5947\\u51fd\\u6570\\uff0c\\u6240\\u4ee5f\\uff08\\ufe633\\uff09=\\ufe63f\\uff083\\uff09=0\\uff0cf\\uff080\\uff09=0\\uff0c\\r\\n\\u53c8\\u56e0\\u4e3a\\u51fd\\u6570\\u7684\\u5468\\u671f\\u4e3a4\\uff0c\\u5373f\\uff08x4\\uff09=f\\uff08x\\uff09\\uff0c\\r\\n\\u6240\\u4ee5f\\uff080\\uff09=f\\uff084\\uff09=f\\uff088\\uff09=0\\uff0cf\\uff083\\uff09=f\\uff087\\uff09=0\\uff0cf\\uff08\\ufe633\\uff09=f\\uff081\\uff09=f\\uff085\\uff09=f\\uff089\\uff09=0\\uff0c\\r\\n\\u6240\\u4ee5\\u65b9\\u7a0bf\\uff08x\\uff09=0\\u5728x\\uff080\\uff0c10\\uff09\\u7684\\u6839\\u6709 1\\uff0c3\\uff0c4\\uff0c5\\uff0c7\\uff0c8\\uff0c9\\uff0c\\u51717\\u4e2a\\uff0e\",\"tips\":\"\\u7531\\u5df2\\u77e5\\u51fd\\u6570\\u4e3a\\u5947\\u51fd\\u6570\\uff0c\\u6c42\\u51fa\\u51fd\\u6570\\u7684\\u5468\\u671f\\u4e3a4\\u53ef\\u5f97f\\uff080\\uff09=0f\\uff084\\uff09=f\\uff088\\uff09=0\\uff0c\\u7531f\\uff083\\uff09=0\\uff087\\uff09=0\\uff0c\\u53c8f\\uff08\\ufe633\\uff09=0f\\uff081\\uff09=f\\uff085\\uff09=f\\uff089\\uff09=0\\uff0c\\u4ece\\u800c\\u53ef\\u5f97\\u7ed3\\u679c\\uff0e\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\"}', '2021-03-21 11:23:52', '2021-03-21 11:23:52');
INSERT INTO `exam_admin_operation_log` VALUES (1795, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '[]', '2021-03-21 11:23:52', '2021-03-21 11:23:52');
INSERT INTO `exam_admin_operation_log` VALUES (1796, 1, 'exam/admin/exam/40366648-9539-5577-77F6-6236DE58C2BB/edit', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:23:54', '2021-03-21 11:23:54');
INSERT INTO `exam_admin_operation_log` VALUES (1797, 1, 'exam/admin/exam/40366648-9539-5577-77F6-6236DE58C2BB', 'PUT', '180.157.122.15', '{\"uuid\":\"40366648-9539-5577-77F6-6236DE58C2BB\",\"category\":[\"C715B621-2069-C557-575B-ED04E2C08D77\",null],\"collection\":[\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",null],\"title\":\"\\u5bf9\\u4e8e\\u5b9a\\u4e49\\u5728R\\u4e0a\\u7684\\u5947\\u51fd\\u6570f\\uff08x\\uff09\\uff0c\\u6ee1\\u8db3f\\uff08\\ufe63x\\uff09f\\uff083x\\uff09=0\\uff0c\\u82e5f\\uff08\\ufe631\\uff09=1\\uff0c\\u5219f\\uff081\\uff09f\\uff082\\uff09f\\uff083\\uff09\\u2026+f\\uff082015\\uff09=\",\"option\":[{\"title\":\"-1\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"0\",\"check\":\"B\",\"is_check\":\"1\",\"_remove_\":\"0\"},{\"title\":\"1\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"2\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":[\"B\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":\"\\u5b9a\\u4e49\\u5728R\\u4e0a\\u7684\\u5947\\u51fd\\u6570f\\uff08x\\uff09\\uff0c\\u6ee1\\u8db3f\\uff08\\ufe63x\\uff09f\\uff083x\\uff09=0\\uff0c\\r\\n\\u53ef\\u5f97f\\uff08x\\uff09=f\\uff083x\\uff09\\uff0c\\u6240\\u4ee5\\u51fd\\u6570\\u7684\\u5468\\u671f\\u4e3a3\\uff0e\\r\\n\\u5b9a\\u4e49\\u5728R\\u4e0a\\u7684\\u5947\\u51fd\\u6570f\\uff08x\\uff09\\uff0c\\u53ef\\u77e5f\\uff080\\uff09=0\\uff0c\\r\\n\\u53c8f\\uff08\\ufe631\\uff09=1\\uff0c\\r\\nf\\uff082\\uff09=f\\uff08\\ufe631\\uff09=1\\uff0cf\\uff081\\uff09=\\ufe63f\\uff08\\ufe631\\uff09=\\ufe631\\uff0e\\r\\nf\\uff081\\uff09f\\uff082\\uff09f\\uff083\\uff09=\\ufe6311+0=0\\uff1b\\r\\nf\\uff081\\uff09f\\uff082\\uff09f\\uff083\\uff09\\u2026+f\\uff082015\\uff09=671\\uff08f\\uff081\\uff09f\\uff082\\uff09f\\uff083\\uff09\\uff09f\\uff081\\uff09f\\uff082\\uff09=0\\ufe6311=0\",\"tips\":\"\\u5229\\u7528\\u51fd\\u6570\\u7684\\u5947\\u5076\\u6027\\uff0c\\u4ee5\\u53ca\\u51fd\\u6570\\u7684\\u5173\\u7cfb\\u5f0f\\uff0c\\u6c42\\u51fa\\u51fd\\u6570\\u7684\\u5468\\u671f\\uff0c\\u7136\\u540e\\u6c42\\u89e3\\u51fd\\u6570\\u503c\\u5373\\u53ef\\uff0e\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\"}', '2021-03-21 11:24:17', '2021-03-21 11:24:17');
INSERT INTO `exam_admin_operation_log` VALUES (1798, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '[]', '2021-03-21 11:24:18', '2021-03-21 11:24:18');
INSERT INTO `exam_admin_operation_log` VALUES (1799, 1, 'exam/admin/exam/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:24:27', '2021-03-21 11:24:27');
INSERT INTO `exam_admin_operation_log` VALUES (1800, 1, 'exam/admin/exam', 'POST', '180.157.122.15', '{\"uuid\":\"C0B7E9F0-25B6-7BA7-A734-4E4080727E47\",\"category\":[\"C715B621-2069-C557-575B-ED04E2C08D77\",null],\"collection\":[\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",null],\"title\":\"\\u82e5\\u5b9a\\u4e49\\u5728R\\u4e0a\\u7684\\u5947\\u51fd\\u6570f\\uff08x\\uff09\\u6ee1\\u8db3f\\uff08x\\uff09=f\\uff08x2\\uff09\\uff0c\\u4e14f\\uff081\\uff09=0\\uff0c\\u5219f\\uff08x\\uff09\\u5728\\u533a\\u95f4\\uff080\\uff0c5\\u4e0a\\u5177\\u6709\\u96f6\\u70b9\\u7684\\u6700\\u5c11\\u4e2a\\u6570\\u662f\",\"option\":{\"new_1\":{\"title\":\"5\",\"check\":\"A\",\"is_check\":\"1\",\"_remove_\":\"0\"},\"new_2\":{\"title\":\"4\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_3\":{\"title\":\"3\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_4\":{\"title\":\"2\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}},\"answer\":[\"A\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":\"f\\uff08x\\uff09=f\\uff08x2\\uff09\\uff0c\\r\\n\\u51fd\\u6570f\\uff08x\\uff09\\u7684\\u5468\\u671f\\u662f2\\uff0e\\r\\nf\\uff081\\uff09=0\\uff0c\\r\\nf\\uff081\\uff09=f\\uff083\\uff09=f\\uff085\\uff09=0\\uff0c\\r\\nf\\uff08x\\uff09\\u5b9a\\u4e49\\u5728R\\u4e0a\\u7684\\u5947\\u51fd\\u6570\\uff0c\\r\\nf\\uff080\\uff09=0\\uff0c\\u5373f\\uff080\\uff09=f\\uff082\\uff09=f\\uff084\\uff09=0\\uff0c\\r\\n\\u5728\\u533a\\u95f4\\uff080\\uff0c5\\u4e0a\\u7684\\u96f6\\u70b9\\u81f3\\u5c11\\u67091\\uff0c2\\uff0c3\\uff0c4\\uff0c5\\uff0c\",\"tips\":\"\\u6839\\u636e\\u51fd\\u6570\\u7684\\u5947\\u5076\\u6027\\u548c\\u5468\\u671f\\u6027\\u4e4b\\u95f4\\u7684\\u5173\\u7cfb\\uff0c\\u5373\\u53ef\\u786e\\u5b9a\\u51fd\\u6570\\u96f6\\u70b9\\u7684\\u4e2a\\u6570\\uff0e\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\"}', '2021-03-21 11:25:11', '2021-03-21 11:25:11');
INSERT INTO `exam_admin_operation_log` VALUES (1801, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '[]', '2021-03-21 11:25:11', '2021-03-21 11:25:11');
INSERT INTO `exam_admin_operation_log` VALUES (1802, 1, 'exam/admin/exam/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:25:19', '2021-03-21 11:25:19');
INSERT INTO `exam_admin_operation_log` VALUES (1803, 1, 'exam/admin/exam', 'POST', '180.157.122.15', '{\"uuid\":\"76A02871-4B17-DA21-21D1-92F8058A01D9\",\"category\":[\"C715B621-2069-C557-575B-ED04E2C08D77\",null],\"collection\":[null],\"title\":\"\\u5df2\\u77e5\\u5b9a\\u4e49\\u5728R\\u4e0a\\u7684\\u5947\\u51fd\\u6570f\\uff08x\\uff09\\u6ee1\\u8db3f\\uff08x2\\uff09=\\ufe63f\\uff08x\\uff09\\uff0c\\u5219\\uff0cf\\uff082016\\uff09\\u7684\\u503c\\u4e3a\",\"option\":{\"new_1\":{\"title\":\"-1\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_2\":{\"title\":\"0\",\"check\":\"B\",\"is_check\":\"1\",\"_remove_\":\"0\"},\"new_3\":{\"title\":\"1\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_4\":{\"title\":\"2\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}},\"answer\":[\"B\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":\"\\u6839\\u636e\\u9898\\u610f\\uff0cf\\uff08x\\uff09\\u4e3aR\\u4e0a\\u7684\\u5947\\u51fd\\u6570\\uff0c\\u5219\\u6709f\\uff080\\uff09=\\ufe63f\\uff080\\uff09\\uff0c\\r\\n\\u5373f\\uff080\\uff09=0\\uff0c\\r\\nf\\uff08x\\uff09\\u6ee1\\u8db3f\\uff08x2\\uff09=\\ufe63f\\uff08x\\uff09\\uff0c\\u5219\\u6709f\\uff08x4\\uff09=\\ufe63f\\uff08x2\\uff09=f\\uff08x\\uff09\\uff0c\\r\\n\\u5373\\u51fd\\u6570f\\uff08x\\uff09\\u662f\\u5468\\u671f\\u4e3a4\\u7684\\u51fd\\u6570\\uff0c\\r\\n\\u5219\\u6709f\\uff082016\\uff09=f\\uff084504\\uff09=f\\uff080\\uff09=0\\uff1b\",\"tips\":\"\\u6839\\u636e\\u9898\\u610f\\uff0c\\u7531\\u5947\\u51fd\\u6570\\u7684\\u6027\\u8d28\\u53ef\\u5f97f\\uff080\\uff09=0\\uff0c\\u8fdb\\u800c\\u7531f\\uff08x\\uff09\\u6ee1\\u8db3f\\uff08x2\\uff09=\\ufe63f\\uff08x\\uff09\\uff0c\\u53ef\\u5f97f\\uff08x4\\uff09=\\ufe63f\\uff08x2\\uff09=f\\uff08x\\uff09\\uff0c\\u5373\\u51fd\\u6570f\\uff08x\\uff09\\u662f\\u5468\\u671f\\u4e3a4\\u7684\\u51fd\\u6570\\uff0c\\u5219\\u6709f\\uff082016\\uff09=f\\uff084504\\uff09=f\\uff080\\uff09\\uff0c\\u5373\\u53ef\\u5f97\\u7b54\\u6848\\uff0e\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\"}', '2021-03-21 11:26:04', '2021-03-21 11:26:04');
INSERT INTO `exam_admin_operation_log` VALUES (1804, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '[]', '2021-03-21 11:26:05', '2021-03-21 11:26:05');
INSERT INTO `exam_admin_operation_log` VALUES (1805, 1, 'exam/admin/exam/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:26:13', '2021-03-21 11:26:13');
INSERT INTO `exam_admin_operation_log` VALUES (1806, 1, 'exam/admin/exam', 'POST', '180.157.122.15', '{\"uuid\":\"CE9C04C1-28C0-F29B-9B0F-0326BBB7FBC1\",\"category\":[\"C715B621-2069-C557-575B-ED04E2C08D77\",null],\"collection\":[null],\"title\":\"\\u5bf9\\u4e8e\\u5b9a\\u4e49\\u5728R\\u4e0a\\u7684\\u5947\\u51fd\\u6570f\\uff08x\\uff09\\uff0c\\u6ee1\\u8db3f\\uff08x\\uff09=\\ufe63f\\uff08x\\uff09\\uff0c\\u5219f\\uff081\\uff09f\\uff082\\uff09f\\uff083\\uff09=\",\"option\":{\"new_1\":{\"title\":\"0\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_2\":{\"title\":\"-1\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_3\":{\"title\":\"3\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_4\":{\"title\":\"2\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}},\"answer\":[\"A\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":\"f\\uff08x\\uff09=\\ufe63f\\uff08x\\uff09\\uff0c\\r\\nf\\uff08x3\\uff09=\\ufe63f\\uff08x\\uff09=f\\uff08x\\uff09\\r\\n\\u51fd\\u6570\\u7684\\u5468\\u671f\\u4e3a3\\uff0c\\r\\n\\u53c8\\u51fd\\u6570f\\uff08x\\uff09\\u4e3aR\\u4e0a\\u7684\\u5947\\u51fd\\u6570\\uff0c\\r\\nf\\uff080\\uff09=0\\uff0c\\r\\nf\\uff083\\uff09=\\uff0803\\uff09=f\\uff080\\uff09=0\\uff0c\\r\\nf\\uff082\\uff09=f\\uff08\\ufe6313\\uff09=f\\uff08\\ufe631\\uff09=\\ufe63f\\uff081\\uff09\\uff0c\\r\\nf\\uff081\\uff09f\\uff082\\uff09f\\uff083\\uff09=f\\uff081\\uff09\\ufe63f\\uff081\\uff090=0\",\"tips\":\"\\u7531\\u5df2\\u77e5\\u4e2df\\uff08x\\uff09=\\ufe63f\\uff08x\\uff09\\uff0c\\u53ef\\u5f97\\u51fd\\u6570\\u7684\\u5468\\u671f\\u4e3a3\\uff0c\\u518d\\u7531\\u5947\\u51fd\\u6570\\u7684\\u6027\\u8d28\\u53ef\\u5f97f\\uff083\\uff09=\\uff0cf\\uff080\\uff09=0\\uff0cf\\uff082\\uff09=\\ufe63f\\uff081\\uff09\\uff0c\\u4ee3\\u5165\\u8ba1\\u7b97\\u53ef\\u5f97\\uff0e\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\"}', '2021-03-21 11:27:12', '2021-03-21 11:27:12');
INSERT INTO `exam_admin_operation_log` VALUES (1807, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '[]', '2021-03-21 11:27:12', '2021-03-21 11:27:12');
INSERT INTO `exam_admin_operation_log` VALUES (1808, 1, 'exam/admin/exam/collection', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:27:15', '2021-03-21 11:27:15');
INSERT INTO `exam_admin_operation_log` VALUES (1809, 1, 'exam/admin/exam/collection/exam', 'GET', '180.157.122.15', '{\"collection_id\":\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:27:17', '2021-03-21 11:27:17');
INSERT INTO `exam_admin_operation_log` VALUES (1810, 1, 'exam/admin/_handle_action_', 'POST', '180.157.122.15', '{\"collection_uuid\":\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",\"uuid\":\"76A02871-4B17-DA21-21D1-92F8058A01D9\",\"_key\":\"76A02871-4B17-DA21-21D1-92F8058A01D9\",\"_model\":\"App_Models_Admin_Exam_Exam\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_action\":\"App_Admin_Actions_Exam_CollectionExamBind\"}', '2021-03-21 11:27:32', '2021-03-21 11:27:32');
INSERT INTO `exam_admin_operation_log` VALUES (1811, 1, 'exam/admin/exam/collection/exam', 'GET', '180.157.122.15', '{\"collection_id\":\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:27:32', '2021-03-21 11:27:32');
INSERT INTO `exam_admin_operation_log` VALUES (1812, 1, 'exam/admin/_handle_action_', 'POST', '180.157.122.15', '{\"collection_uuid\":\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",\"uuid\":\"CE9C04C1-28C0-F29B-9B0F-0326BBB7FBC1\",\"_key\":\"CE9C04C1-28C0-F29B-9B0F-0326BBB7FBC1\",\"_model\":\"App_Models_Admin_Exam_Exam\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_action\":\"App_Admin_Actions_Exam_CollectionExamBind\"}', '2021-03-21 11:27:37', '2021-03-21 11:27:37');
INSERT INTO `exam_admin_operation_log` VALUES (1813, 1, 'exam/admin/exam/collection/exam', 'GET', '180.157.122.15', '{\"collection_id\":\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:27:37', '2021-03-21 11:27:37');
INSERT INTO `exam_admin_operation_log` VALUES (1814, 1, 'exam/admin/exam/collection', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:27:43', '2021-03-21 11:27:43');
INSERT INTO `exam_admin_operation_log` VALUES (1815, 1, 'exam/admin/exam/collection/C34E39CD-8C55-655A-5A7B-34DAA423A23B/edit', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:27:46', '2021-03-21 11:27:46');
INSERT INTO `exam_admin_operation_log` VALUES (1816, 1, 'exam/admin/exam/collection/C34E39CD-8C55-655A-5A7B-34DAA423A23B', 'PUT', '180.157.122.15', '{\"uuid\":\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",\"exam_category_uuid\":\"C715B621-2069-C557-575B-ED04E2C08D77\",\"exam_tag_uuid\":\"22E1D4C0-4D78-0F3B-3BA3-28FB264E3B92\",\"title\":\"\\u56db\\u5ddd\\u7709\\u5c71\\u4e00\\u4e2d\\u671f\\u672b\\u8003\\u8bd5\\u8bd5\\u5377\",\"exam_time\":\"23:00:00\",\"submit_number\":\"0\",\"is_recommend\":\"on\",\"is_show\":\"on\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\\/collection\"}', '2021-03-21 11:27:50', '2021-03-21 11:27:50');
INSERT INTO `exam_admin_operation_log` VALUES (1817, 1, 'exam/admin/exam/collection', 'GET', '180.157.122.15', '[]', '2021-03-21 11:27:50', '2021-03-21 11:27:50');
INSERT INTO `exam_admin_operation_log` VALUES (1818, 1, 'exam/admin/exam/tag', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:28:38', '2021-03-21 11:28:38');
INSERT INTO `exam_admin_operation_log` VALUES (1819, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:28:51', '2021-03-21 11:28:51');
INSERT INTO `exam_admin_operation_log` VALUES (1820, 1, 'exam/admin/exam/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:28:52', '2021-03-21 11:28:52');
INSERT INTO `exam_admin_operation_log` VALUES (1821, 1, 'exam/admin/exam', 'POST', '180.157.122.15', '{\"uuid\":\"F1444AD0-56EA-2930-3085-AF167BD16A29\",\"category\":[\"C715B621-2069-C557-575B-ED04E2C08D77\",null],\"collection\":[null],\"title\":\"\\u5bf9\\u4efb\\u610f\\u7684xR\\uff0c\\u5b9a\\u4e49\\u5728R\\u4e0a\\u7684\\u5947\\u51fd\\u6570f\\uff08x\\uff09\\u6ee1\\u8db3\\uff1af\\uff08x3\\uff09=\\ufe63f\\uff08x4\\uff09\\uff0c\\u5219f\\uff081000\\uff09=\",\"option\":{\"new_1\":{\"title\":\"-1\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_2\":{\"title\":\"1\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_3\":{\"title\":\"0\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_4\":{\"title\":\"1000\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}},\"answer\":[\"C\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":\"\\u5b9a\\u4e49\\u5728R\\u4e0a\\u7684\\u5947\\u51fd\\u6570f\\uff08x\\uff09\\u6ee1\\u8db3\\uff1af\\uff08x3\\uff09=\\ufe63f\\uff08x4\\uff09\\uff0c\\r\\nf\\uff08x\\uff09=\\ufe63f\\uff08x1\\uff09\\uff0cf\\uff08x\\uff09=f\\uff08x2\\uff09\\uff0c\\u5373\\u51fd\\u6570f\\uff08x\\uff09\\u662f\\u5468\\u671f\\u7b49\\u4e8e2\\u7684\\u5468\\u671f\\u51fd\\u6570\\uff0e\\r\\nf\\uff081000\\uff09=f\\uff080\\uff09=0\\uff0c\",\"tips\":\"\\u7531\\u9898\\u610f\\u53ef\\u5f97\\uff0cf\\uff08x\\uff09=\\ufe63f\\uff08x1\\uff09\\uff0c\\u6545 f\\uff08x\\uff09=f\\uff08x2\\uff09\\uff0c\\u5373\\u51fd\\u6570 f\\uff08x\\uff09\\u662f\\u5468\\u671f\\u7b49\\u4e8e2\\u7684\\u5468\\u671f\\u51fd\\u6570\\uff0c\\u6545\\u6709f\\uff081000\\uff09=f\\uff080\\uff09=0\\uff0e\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\"}', '2021-03-21 11:29:41', '2021-03-21 11:29:41');
INSERT INTO `exam_admin_operation_log` VALUES (1822, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '[]', '2021-03-21 11:29:42', '2021-03-21 11:29:42');
INSERT INTO `exam_admin_operation_log` VALUES (1823, 1, 'exam/admin/exam/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:29:52', '2021-03-21 11:29:52');
INSERT INTO `exam_admin_operation_log` VALUES (1824, 1, 'exam/admin/exam', 'POST', '180.157.122.15', '{\"uuid\":\"EA3EB9AE-DE4A-99E9-E952-3ED6821137A8\",\"category\":[\"C715B621-2069-C557-575B-ED04E2C08D77\",null],\"collection\":[null],\"title\":\"\\u5df2\\u77e5\\u5b9a\\u4e49\\u5728R\\u4e0a\\u7684\\u5947\\u51fd\\u6570f\\uff08x\\uff09\\u6ee1\\u8db3f\\uff08x\\uff09=f\\uff082\\ufe63x\\uff09\\uff0c\\u4e14f\\uff08\\ufe631\\uff09=2\\uff0c\\u5219f\\uff081\\uff09f\\uff082\\uff09f\\uff083\\uff09\\u2026+f\\uff082017\\uff09\\u7684\\u503c\\u4e3a\",\"option\":{\"new_1\":{\"title\":\"1\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_2\":{\"title\":\"0\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_3\":{\"title\":\"-2\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_4\":{\"title\":\"2\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}},\"answer\":[\"C\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":\"f\\uff082\\ufe63x\\uff09=f\\uff08x\\uff09\\uff0cf[2\\ufe63\\uff082x\\uff09=f\\uff082x\\uff09\\uff0c\\u5373f\\uff08\\ufe63x\\uff09=f\\uff082x\\uff09\\uff0c\\u5373\\ufe63f\\uff08x\\uff09=f\\uff082x\\uff09\\uff0c\\r\\nf\\uff08x4\\uff09=f\\uff084x\\uff09\\uff0c\\u6545\\u51fd\\u6570f\\uff08x\\uff09\\u7684\\u5468\\u671f\\u4e3a4\\uff0e\\r\\n\\u5b9a\\u4e49\\u5728R\\u4e0a\\u7684\\u5947\\u51fd\\u6570f\\uff08x\\uff09\\u6ee1\\u8db3f\\uff082\\ufe63x\\uff09\\ufe63f\\uff08x\\uff09=0\\uff0c\\u4e14f\\uff08\\ufe631\\uff09=2\\uff0c\\r\\nf\\uff080\\uff09=0\\uff0cf\\uff081\\uff09=\\ufe63f\\uff08\\ufe631\\uff09=\\ufe632\\uff0cf\\uff082\\uff09=f\\uff080\\uff09=0\\uff0cf\\uff083\\uff09=f\\uff08\\ufe631\\uff09=2\\uff0cf\\uff084\\uff09=f\\uff080\\uff09=0\\uff0c\\r\\nf\\uff081\\uff09f\\uff082\\uff09f\\uff083\\uff09\\u2026+f\\uff082017\\uff09=504\\u2022f\\uff081\\uff09f\\uff082\\uff09f\\uff083\\uff09f\\uff084\\uff09f\\uff082017\\uff09\\r\\n=504\\uff08\\ufe6320+2+0\\uff09f\\uff081\\uff09=0\\uff08\\ufe632\\uff09=\\ufe632\\uff0c\",\"tips\":\"\\u672c\\u9898\\u901a\\u8fc7\\u8d4b\\u503c\\u6cd5\\u5bf9f\\uff082\\ufe63x\\uff09=f\\uff08x\\uff09\\u4e2d\\u7684x\\u8fdb\\u884c\\u8d4b\\u503c\\u4e3a2x\\uff0c\\u53ef\\u5f97\\ufe63f\\uff08x\\uff09=f\\uff082x\\uff09\\uff0c\\u53ef\\u5f97\\u5230\\u51fd\\u6570f\\uff08x\\uff09\\u7684\\u5468\\u671f\\u4e3a4\\uff0c\\u6839\\u636e\\u5947\\u51fd\\u6570\\u7684\\u6027\\u8d28\\u5f97\\u5230f\\uff080\\uff09=0\\uff0c\\u518d\\u901a\\u8fc7\\u8d4b\\u503c\\u6cd5\\u5f97\\u5230f\\uff081\\uff09\\uff0cf\\uff082\\uff09\\uff0cf\\uff083\\uff09\\uff0cf\\uff084\\uff09\\u7684\\u503c\\uff0c\\u5373\\u53ef\\u6c42\\u89e3\\uff0e\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\"}', '2021-03-21 11:30:36', '2021-03-21 11:30:36');
INSERT INTO `exam_admin_operation_log` VALUES (1825, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '[]', '2021-03-21 11:30:37', '2021-03-21 11:30:37');
INSERT INTO `exam_admin_operation_log` VALUES (1826, 1, 'exam/admin/exam/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:30:39', '2021-03-21 11:30:39');
INSERT INTO `exam_admin_operation_log` VALUES (1827, 1, 'exam/admin/exam', 'POST', '180.157.122.15', '{\"uuid\":\"1EF497D7-BBD4-F6C3-C374-60C225D9B638\",\"category\":[\"C715B621-2069-C557-575B-ED04E2C08D77\",null],\"collection\":[null],\"title\":\"\\u5df2\\u77e5\\u5b9a\\u4e49\\u5728R\\u4e0a\\u7684\\u51fd\\u6570f\\uff08x\\uff09\\u6ee1\\u8db3\\uff1af\\uff08xy\\uff09=f\\uff08x\\uff09f\\uff08y\\uff094xy\\uff08x\\uff0cyR\\uff09\\uff0cf\\uff081\\uff09=2\\uff0e\\u5219f\\uff08\\ufe632\\uff09=\",\"option\":{\"new_1\":{\"title\":\"2\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_2\":{\"title\":\"4\",\"check\":\"B\",\"is_check\":\"1\",\"_remove_\":\"0\"},\"new_3\":{\"title\":\"8\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_4\":{\"title\":\"16\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}},\"answer\":[\"C\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":\"\\u4ee4x=y=0\\u5f97f\\uff080\\uff09=2f\\uff080\\uff09\\uff0cf\\uff080\\uff09=0\\uff0c\\r\\n\\u518d\\u4ee4y=\\ufe63x\\uff0c\\u5f97f\\uff080\\uff09=f\\uff08x\\uff09f\\uff08\\ufe63x\\uff09\\ufe634x2=0\\uff0c\\r\\n\\u4ee4g\\uff08x\\uff09=f\\uff08x\\uff09\\ufe632x2\\uff0c\\u5219g\\uff08x\\uff09g\\uff08\\ufe63x\\uff09=f\\uff08x\\uff09f\\uff08\\ufe63x\\uff09\\ufe634x2=0\\uff0c\\r\\ng\\uff08x\\uff09=f\\uff08x\\uff09\\ufe632x2\\u662f\\u5947\\u51fd\\u6570\\uff0c\\r\\nf\\uff082\\uff09=2f\\uff081\\uff094=8\\uff0cg\\uff082\\uff09=f\\uff082\\uff09\\ufe638=0\\uff0c\\r\\ng\\uff08\\ufe632\\uff09=f\\uff08\\ufe632\\uff09\\ufe638=0\\uff0c\\r\\nf\\uff08\\ufe632\\uff09=8\\uff0e\",\"tips\":\"\\u5148\\u8ba1\\u7b97f\\uff080\\uff09=0\\uff0c\\u518d\\u5f97\\u51faf\\uff08x\\uff09f\\uff08\\ufe63x\\uff09\\ufe634x2=0\\uff0c\\u4ee4g\\uff08x\\uff09=f\\uff08x\\uff09\\ufe632x2\\uff0c\\u5219g\\uff08x\\uff09\\u4e3a\\u5947\\u51fd\\u6570\\uff0c\\u901a\\u8fc7\\u8ba1\\u7b97g\\uff08\\ufe632\\uff09\\u5f97\\u51faf\\uff08\\ufe632\\uff09\\u7684\\u503c\\uff0e\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\"}', '2021-03-21 11:31:27', '2021-03-21 11:31:27');
INSERT INTO `exam_admin_operation_log` VALUES (1828, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '[]', '2021-03-21 11:31:28', '2021-03-21 11:31:28');
INSERT INTO `exam_admin_operation_log` VALUES (1829, 1, 'exam/admin/exam/EA3EB9AE-DE4A-99E9-E952-3ED6821137A8/edit', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:31:30', '2021-03-21 11:31:30');
INSERT INTO `exam_admin_operation_log` VALUES (1830, 1, 'exam/admin/exam/EA3EB9AE-DE4A-99E9-E952-3ED6821137A8', 'PUT', '180.157.122.15', '{\"uuid\":\"EA3EB9AE-DE4A-99E9-E952-3ED6821137A8\",\"category\":[\"C715B621-2069-C557-575B-ED04E2C08D77\",null],\"collection\":[null],\"title\":\"\\u5df2\\u77e5\\u5b9a\\u4e49\\u5728R\\u4e0a\\u7684\\u5947\\u51fd\\u6570f\\uff08x\\uff09\\u6ee1\\u8db3f\\uff08x\\uff09=f\\uff082\\ufe63x\\uff09\\uff0c\\u4e14f\\uff08\\ufe631\\uff09=2\\uff0c\\u5219f\\uff081\\uff09f\\uff082\\uff09f\\uff083\\uff09\\u2026+f\\uff082017\\uff09\\u7684\\u503c\\u4e3a\",\"option\":[{\"title\":\"1\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"0\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"-2\",\"check\":\"C\",\"is_check\":\"1\",\"_remove_\":\"0\"},{\"title\":\"2\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":[\"C\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":\"f\\uff082\\ufe63x\\uff09=f\\uff08x\\uff09\\uff0cf[2\\ufe63\\uff082x\\uff09=f\\uff082x\\uff09\\uff0c\\u5373f\\uff08\\ufe63x\\uff09=f\\uff082x\\uff09\\uff0c\\u5373\\ufe63f\\uff08x\\uff09=f\\uff082x\\uff09\\uff0c\\r\\nf\\uff08x4\\uff09=f\\uff084x\\uff09\\uff0c\\u6545\\u51fd\\u6570f\\uff08x\\uff09\\u7684\\u5468\\u671f\\u4e3a4\\uff0e\\r\\n\\u5b9a\\u4e49\\u5728R\\u4e0a\\u7684\\u5947\\u51fd\\u6570f\\uff08x\\uff09\\u6ee1\\u8db3f\\uff082\\ufe63x\\uff09\\ufe63f\\uff08x\\uff09=0\\uff0c\\u4e14f\\uff08\\ufe631\\uff09=2\\uff0c\\r\\nf\\uff080\\uff09=0\\uff0cf\\uff081\\uff09=\\ufe63f\\uff08\\ufe631\\uff09=\\ufe632\\uff0cf\\uff082\\uff09=f\\uff080\\uff09=0\\uff0cf\\uff083\\uff09=f\\uff08\\ufe631\\uff09=2\\uff0cf\\uff084\\uff09=f\\uff080\\uff09=0\\uff0c\\r\\nf\\uff081\\uff09f\\uff082\\uff09f\\uff083\\uff09\\u2026+f\\uff082017\\uff09=504\\u2022f\\uff081\\uff09f\\uff082\\uff09f\\uff083\\uff09f\\uff084\\uff09f\\uff082017\\uff09\\r\\n=504\\uff08\\ufe6320+2+0\\uff09f\\uff081\\uff09=0\\uff08\\ufe632\\uff09=\\ufe632\\uff0c\",\"tips\":\"\\u672c\\u9898\\u901a\\u8fc7\\u8d4b\\u503c\\u6cd5\\u5bf9f\\uff082\\ufe63x\\uff09=f\\uff08x\\uff09\\u4e2d\\u7684x\\u8fdb\\u884c\\u8d4b\\u503c\\u4e3a2x\\uff0c\\u53ef\\u5f97\\ufe63f\\uff08x\\uff09=f\\uff082x\\uff09\\uff0c\\u53ef\\u5f97\\u5230\\u51fd\\u6570f\\uff08x\\uff09\\u7684\\u5468\\u671f\\u4e3a4\\uff0c\\u6839\\u636e\\u5947\\u51fd\\u6570\\u7684\\u6027\\u8d28\\u5f97\\u5230f\\uff080\\uff09=0\\uff0c\\u518d\\u901a\\u8fc7\\u8d4b\\u503c\\u6cd5\\u5f97\\u5230f\\uff081\\uff09\\uff0cf\\uff082\\uff09\\uff0cf\\uff083\\uff09\\uff0cf\\uff084\\uff09\\u7684\\u503c\\uff0c\\u5373\\u53ef\\u6c42\\u89e3\\uff0e\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\"}', '2021-03-21 11:31:35', '2021-03-21 11:31:35');
INSERT INTO `exam_admin_operation_log` VALUES (1831, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '[]', '2021-03-21 11:31:36', '2021-03-21 11:31:36');
INSERT INTO `exam_admin_operation_log` VALUES (1832, 1, 'exam/admin/exam/F1444AD0-56EA-2930-3085-AF167BD16A29/edit', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:31:38', '2021-03-21 11:31:38');
INSERT INTO `exam_admin_operation_log` VALUES (1833, 1, 'exam/admin/exam/F1444AD0-56EA-2930-3085-AF167BD16A29', 'PUT', '180.157.122.15', '{\"uuid\":\"F1444AD0-56EA-2930-3085-AF167BD16A29\",\"category\":[\"C715B621-2069-C557-575B-ED04E2C08D77\",null],\"collection\":[null],\"title\":\"\\u5bf9\\u4efb\\u610f\\u7684xR\\uff0c\\u5b9a\\u4e49\\u5728R\\u4e0a\\u7684\\u5947\\u51fd\\u6570f\\uff08x\\uff09\\u6ee1\\u8db3\\uff1af\\uff08x3\\uff09=\\ufe63f\\uff08x4\\uff09\\uff0c\\u5219f\\uff081000\\uff09=\",\"option\":[{\"title\":\"-1\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"1\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"0\",\"check\":\"C\",\"is_check\":\"1\",\"_remove_\":\"0\"},{\"title\":\"1000\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":[\"C\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":\"\\u5b9a\\u4e49\\u5728R\\u4e0a\\u7684\\u5947\\u51fd\\u6570f\\uff08x\\uff09\\u6ee1\\u8db3\\uff1af\\uff08x3\\uff09=\\ufe63f\\uff08x4\\uff09\\uff0c\\r\\nf\\uff08x\\uff09=\\ufe63f\\uff08x1\\uff09\\uff0cf\\uff08x\\uff09=f\\uff08x2\\uff09\\uff0c\\u5373\\u51fd\\u6570f\\uff08x\\uff09\\u662f\\u5468\\u671f\\u7b49\\u4e8e2\\u7684\\u5468\\u671f\\u51fd\\u6570\\uff0e\\r\\nf\\uff081000\\uff09=f\\uff080\\uff09=0\\uff0c\",\"tips\":\"\\u7531\\u9898\\u610f\\u53ef\\u5f97\\uff0cf\\uff08x\\uff09=\\ufe63f\\uff08x1\\uff09\\uff0c\\u6545 f\\uff08x\\uff09=f\\uff08x2\\uff09\\uff0c\\u5373\\u51fd\\u6570 f\\uff08x\\uff09\\u662f\\u5468\\u671f\\u7b49\\u4e8e2\\u7684\\u5468\\u671f\\u51fd\\u6570\\uff0c\\u6545\\u6709f\\uff081000\\uff09=f\\uff080\\uff09=0\\uff0e\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\"}', '2021-03-21 11:31:42', '2021-03-21 11:31:42');
INSERT INTO `exam_admin_operation_log` VALUES (1834, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '[]', '2021-03-21 11:31:43', '2021-03-21 11:31:43');
INSERT INTO `exam_admin_operation_log` VALUES (1835, 1, 'exam/admin/exam/CE9C04C1-28C0-F29B-9B0F-0326BBB7FBC1/edit', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:31:46', '2021-03-21 11:31:46');
INSERT INTO `exam_admin_operation_log` VALUES (1836, 1, 'exam/admin/exam/CE9C04C1-28C0-F29B-9B0F-0326BBB7FBC1', 'PUT', '180.157.122.15', '{\"uuid\":\"CE9C04C1-28C0-F29B-9B0F-0326BBB7FBC1\",\"category\":[\"C715B621-2069-C557-575B-ED04E2C08D77\",null],\"collection\":[\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",null],\"title\":\"\\u5bf9\\u4e8e\\u5b9a\\u4e49\\u5728R\\u4e0a\\u7684\\u5947\\u51fd\\u6570f\\uff08x\\uff09\\uff0c\\u6ee1\\u8db3f\\uff08x\\uff09=\\ufe63f\\uff08x\\uff09\\uff0c\\u5219f\\uff081\\uff09f\\uff082\\uff09f\\uff083\\uff09=\",\"option\":[{\"title\":\"0\",\"check\":\"A\",\"is_check\":\"1\",\"_remove_\":\"0\"},{\"title\":\"-1\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"3\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},{\"title\":\"2\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}],\"answer\":[\"A\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":\"f\\uff08x\\uff09=\\ufe63f\\uff08x\\uff09\\uff0c\\r\\nf\\uff08x3\\uff09=\\ufe63f\\uff08x\\uff09=f\\uff08x\\uff09\\r\\n\\u51fd\\u6570\\u7684\\u5468\\u671f\\u4e3a3\\uff0c\\r\\n\\u53c8\\u51fd\\u6570f\\uff08x\\uff09\\u4e3aR\\u4e0a\\u7684\\u5947\\u51fd\\u6570\\uff0c\\r\\nf\\uff080\\uff09=0\\uff0c\\r\\nf\\uff083\\uff09=\\uff0803\\uff09=f\\uff080\\uff09=0\\uff0c\\r\\nf\\uff082\\uff09=f\\uff08\\ufe6313\\uff09=f\\uff08\\ufe631\\uff09=\\ufe63f\\uff081\\uff09\\uff0c\\r\\nf\\uff081\\uff09f\\uff082\\uff09f\\uff083\\uff09=f\\uff081\\uff09\\ufe63f\\uff081\\uff090=0\",\"tips\":\"\\u7531\\u5df2\\u77e5\\u4e2df\\uff08x\\uff09=\\ufe63f\\uff08x\\uff09\\uff0c\\u53ef\\u5f97\\u51fd\\u6570\\u7684\\u5468\\u671f\\u4e3a3\\uff0c\\u518d\\u7531\\u5947\\u51fd\\u6570\\u7684\\u6027\\u8d28\\u53ef\\u5f97f\\uff083\\uff09=\\uff0cf\\uff080\\uff09=0\\uff0cf\\uff082\\uff09=\\ufe63f\\uff081\\uff09\\uff0c\\u4ee3\\u5165\\u8ba1\\u7b97\\u53ef\\u5f97\\uff0e\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\"}', '2021-03-21 11:31:52', '2021-03-21 11:31:52');
INSERT INTO `exam_admin_operation_log` VALUES (1837, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '[]', '2021-03-21 11:31:53', '2021-03-21 11:31:53');
INSERT INTO `exam_admin_operation_log` VALUES (1838, 1, 'exam/admin/exam/76A02871-4B17-DA21-21D1-92F8058A01D9/edit', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:31:58', '2021-03-21 11:31:58');
INSERT INTO `exam_admin_operation_log` VALUES (1839, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:32:01', '2021-03-21 11:32:01');
INSERT INTO `exam_admin_operation_log` VALUES (1840, 1, 'exam/admin/exam/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:32:32', '2021-03-21 11:32:32');
INSERT INTO `exam_admin_operation_log` VALUES (1841, 1, 'exam/admin/exam', 'POST', '180.157.122.15', '{\"uuid\":\"70CB6583-01F3-28EE-EEB0-667BFE1D3169\",\"category\":[\"C715B621-2069-C557-575B-ED04E2C08D77\",null],\"collection\":[null],\"title\":\"\\u5728\\u9510\\u89d2\\u25b3ABC\\u4e2d\\uff0c\\u89d2A\\uff0cB\\uff0cC\\u7684\\u5bf9\\u8fb9\\u5206\\u522b\\u4e3aa\\uff0cb\\uff0cc\\uff0c\\u82e5b\\uff1d2asin B\\uff0c\\u5219A\\uff1d\",\"option\":{\"new_1\":{\"title\":\"30\\u00b0\",\"check\":\"A\",\"is_check\":\"1\",\"_remove_\":\"0\"},\"new_2\":{\"title\":\"45\\u00b0\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_3\":{\"title\":\"60\\u00b0\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_4\":{\"title\":\"75\\u00b0\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}},\"answer\":[\"A\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\"}', '2021-03-21 11:33:30', '2021-03-21 11:33:30');
INSERT INTO `exam_admin_operation_log` VALUES (1842, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '[]', '2021-03-21 11:33:31', '2021-03-21 11:33:31');
INSERT INTO `exam_admin_operation_log` VALUES (1843, 1, 'exam/admin/exam/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:33:33', '2021-03-21 11:33:33');
INSERT INTO `exam_admin_operation_log` VALUES (1844, 1, 'exam/admin/exam', 'POST', '180.157.122.15', '{\"uuid\":\"45F26C9E-C836-5AD0-D005-4AD3F073090E\",\"category\":[\"C715B621-2069-C557-575B-ED04E2C08D77\",null],\"collection\":[null],\"title\":\"\\u5df2\\u77e5\\u7b49\\u5dee\\u6570\\u5217{an}\\u4e2d\\uff0ca5\\uff1d13\\uff0cS5\\uff1d35\\uff0c\\u5219\\u516c\\u5deed\\uff1d\",\"option\":{\"new_1\":{\"title\":\"-2\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_2\":{\"title\":\"-1\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_3\":{\"title\":\"1\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_4\":{\"title\":\"3\",\"check\":\"D\",\"is_check\":\"1\",\"_remove_\":\"0\"}},\"answer\":[\"D\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\"}', '2021-03-21 11:34:10', '2021-03-21 11:34:10');
INSERT INTO `exam_admin_operation_log` VALUES (1845, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '[]', '2021-03-21 11:34:11', '2021-03-21 11:34:11');
INSERT INTO `exam_admin_operation_log` VALUES (1846, 1, 'exam/admin/exam/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:34:18', '2021-03-21 11:34:18');
INSERT INTO `exam_admin_operation_log` VALUES (1847, 1, 'exam/admin/exam', 'POST', '180.157.122.15', '{\"uuid\":\"ED58364A-35BF-1179-791A-C4F96FFA75A5\",\"category\":[\"C715B621-2069-C557-575B-ED04E2C08D77\",null],\"collection\":[null],\"title\":\"\\u67d0\\u4f4d\\u5c45\\u6c11\\u7ad9\\u5728\\u79bb\\u573020 m\\u9ad8\\u7684\\u9633\\u53f0\\u4e0a\\u89c2\\u6d4b\\u5230\\u5bf9\\u9762\\u5c0f\\u9ad8\\u5c42\\u623f\\u9876\\u7684\\u4ef0\\u89d2\\u4e3a60\\u00b0\\uff0c\\u5c0f\\u9ad8\\u5c42\\u5e95\\u90e8\\u7684\\u4fef\\u89d2\\u4e3a45\\u00b0\\uff0c\\u90a3\\u4e48\\u8fd9\\u680b\\u5c0f\\u9ad8\\u5c42\\u7684\\u9ad8\\u5ea6\\u4e3a(\\u3000\\u3000)\",\"option\":{\"new_1\":{\"title\":\"20m\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_2\":{\"title\":\"20(1\\uff0b)m\",\"check\":\"B\",\"is_check\":\"1\",\"_remove_\":\"0\"},\"new_3\":{\"title\":\"10(\\uff0b)m\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_4\":{\"title\":\"20(\\uff0b)m\\u3000\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}},\"answer\":[\"B\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\"}', '2021-03-21 11:35:02', '2021-03-21 11:35:02');
INSERT INTO `exam_admin_operation_log` VALUES (1848, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '[]', '2021-03-21 11:35:02', '2021-03-21 11:35:02');
INSERT INTO `exam_admin_operation_log` VALUES (1849, 1, 'exam/admin/exam/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:35:09', '2021-03-21 11:35:09');
INSERT INTO `exam_admin_operation_log` VALUES (1850, 1, 'exam/admin/exam', 'POST', '180.157.122.15', '{\"uuid\":\"A9664327-2ED8-31B4-B45A-EBD6FDEB2D87\",\"category\":[\"C715B621-2069-C557-575B-ED04E2C08D77\",null],\"collection\":[null],\"title\":\"\\u8bbe\\u25b3ABC\\u7684\\u5185\\u89d2A\\uff0cB\\uff0cC\\u6240\\u5bf9\\u7684\\u8fb9\\u5206\\u522b\\u4e3aa\\uff0cb\\uff0cc\\uff0c\\u82e5bcos C\\uff0bccos B\\uff1dasin A\\uff0c\\u5219\\u25b3ABC\\u7684\\u5f62\\u72b6\\u4e3a\",\"option\":{\"new_1\":{\"title\":\"\\u9510\\u89d2\\u4e09\\u89d2\\u5f62\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_2\":{\"title\":\"\\u76f4\\u89d2\\u4e09\\u89d2\\u5f62\",\"check\":\"B\",\"is_check\":\"1\",\"_remove_\":\"0\"},\"new_3\":{\"title\":\"\\u949d\\u89d2\\u4e09\\u89d2\\u5f62\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_4\":{\"title\":\"\\u4e0d\\u786e\\u5b9a\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}},\"answer\":[\"B\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\"}', '2021-03-21 11:35:57', '2021-03-21 11:35:57');
INSERT INTO `exam_admin_operation_log` VALUES (1851, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '[]', '2021-03-21 11:35:57', '2021-03-21 11:35:57');
INSERT INTO `exam_admin_operation_log` VALUES (1852, 1, 'exam/admin/exam/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:36:00', '2021-03-21 11:36:00');
INSERT INTO `exam_admin_operation_log` VALUES (1853, 1, 'exam/admin/exam', 'POST', '180.157.122.15', '{\"uuid\":\"2E3076B1-84E0-0BA3-A348-F0C83611F6C4\",\"category\":[\"C715B621-2069-C557-575B-ED04E2C08D77\",null],\"collection\":[null],\"title\":\"\\u5df2\\u77e5\\u25b3ABC\\u7684\\u5185\\u89d2A\\uff0cB\\uff0cC\\u7684\\u5bf9\\u8fb9\\u5206\\u522b\\u4e3aa\\uff0cb\\uff0cc\\uff0c\\u82e5cos A\\uff1d\\uff0csin C\\uff1d3sin B\\uff0c\\u4e14S\\u25b3ABC\\uff1d\\uff0c\\u5219b\\uff1d\",\"option\":{\"new_1\":{\"title\":\"1\",\"check\":\"A\",\"is_check\":\"1\",\"_remove_\":\"0\"},\"new_2\":{\"title\":\"2\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_3\":{\"title\":\"3\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_4\":{\"title\":\"4\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}},\"answer\":[\"A\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\"}', '2021-03-21 11:37:02', '2021-03-21 11:37:02');
INSERT INTO `exam_admin_operation_log` VALUES (1854, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '[]', '2021-03-21 11:37:03', '2021-03-21 11:37:03');
INSERT INTO `exam_admin_operation_log` VALUES (1855, 1, 'exam/admin/exam/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:37:05', '2021-03-21 11:37:05');
INSERT INTO `exam_admin_operation_log` VALUES (1856, 1, 'exam/admin/exam', 'POST', '180.157.122.15', '{\"uuid\":\"9A4CF38E-408F-A07D-7DEC-7C5667FCBD24\",\"category\":[\"C715B621-2069-C557-575B-ED04E2C08D77\",null],\"collection\":[null],\"title\":\"\\u5728\\u7b49\\u5dee\\u6570\\u5217{an}\\u4e2d\\uff0ca3\\uff0ba9\\uff1d27\\uff0da6\\uff0cSn\\u8868\\u793a\\u6570\\u5217{an}\\u7684\\u524dn\\u9879\\u548c\\uff0c\\u5219S11\\uff1d\",\"option\":{\"new_1\":{\"title\":\"18\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_2\":{\"title\":\"99\",\"check\":\"B\",\"is_check\":\"1\",\"_remove_\":\"0\"},\"new_3\":{\"title\":\"198\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_4\":{\"title\":\"297\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}},\"answer\":[\"B\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\"}', '2021-03-21 11:37:55', '2021-03-21 11:37:55');
INSERT INTO `exam_admin_operation_log` VALUES (1857, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '[]', '2021-03-21 11:37:56', '2021-03-21 11:37:56');
INSERT INTO `exam_admin_operation_log` VALUES (1858, 1, 'exam/admin/exam/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:37:57', '2021-03-21 11:37:57');
INSERT INTO `exam_admin_operation_log` VALUES (1859, 1, 'exam/admin/exam', 'POST', '180.157.122.15', '{\"uuid\":\"2B44DA65-219A-3F53-5323-594BEAC117DB\",\"category\":[\"C715B621-2069-C557-575B-ED04E2C08D77\",null],\"collection\":[null],\"title\":\"\\u8bbeSn\\u4e3a\\u7b49\\u5dee\\u6570\\u5217{an}\\u7684\\u524dn\\u9879\\u548c\\uff0c\\u82e5a4\\uff1c0\\uff0ca5\\uff1e|a4|\\uff0c\\u5219\\u4f7fSn\\uff1e0\\u6210\\u7acb\\u7684\\u6700\\u5c0f\\u6b63\\u6574\\u6570n\\u4e3a\",\"option\":{\"new_1\":{\"title\":\"6\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_2\":{\"title\":\"7\",\"check\":\"B\",\"is_check\":\"1\",\"_remove_\":\"0\"},\"new_3\":{\"title\":\"8\",\"check\":\"C\",\"is_check\":\"1\",\"_remove_\":\"0\"},\"new_4\":{\"title\":\"9\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}},\"answer\":[\"C\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":null,\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\"}', '2021-03-21 11:38:57', '2021-03-21 11:38:57');
INSERT INTO `exam_admin_operation_log` VALUES (1860, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '[]', '2021-03-21 11:38:57', '2021-03-21 11:38:57');
INSERT INTO `exam_admin_operation_log` VALUES (1861, 1, 'exam/admin/exam/collection', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:39:02', '2021-03-21 11:39:02');
INSERT INTO `exam_admin_operation_log` VALUES (1862, 1, 'exam/admin/exam/collection', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:39:02', '2021-03-21 11:39:02');
INSERT INTO `exam_admin_operation_log` VALUES (1863, 1, 'exam/admin/exam/collection', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:39:05', '2021-03-21 11:39:05');
INSERT INTO `exam_admin_operation_log` VALUES (1864, 1, 'exam/admin/exam/collection/exam', 'GET', '180.157.122.15', '{\"collection_id\":\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:39:07', '2021-03-21 11:39:07');
INSERT INTO `exam_admin_operation_log` VALUES (1865, 1, 'exam/admin/_handle_action_', 'POST', '180.157.122.15', '{\"collection_uuid\":\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",\"uuid\":\"F1444AD0-56EA-2930-3085-AF167BD16A29\",\"_key\":\"F1444AD0-56EA-2930-3085-AF167BD16A29\",\"_model\":\"App_Models_Admin_Exam_Exam\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_action\":\"App_Admin_Actions_Exam_CollectionExamBind\"}', '2021-03-21 11:39:12', '2021-03-21 11:39:12');
INSERT INTO `exam_admin_operation_log` VALUES (1866, 1, 'exam/admin/exam/collection/exam', 'GET', '180.157.122.15', '{\"collection_id\":\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:39:13', '2021-03-21 11:39:13');
INSERT INTO `exam_admin_operation_log` VALUES (1867, 1, 'exam/admin/_handle_action_', 'POST', '180.157.122.15', '{\"collection_uuid\":\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",\"uuid\":\"EA3EB9AE-DE4A-99E9-E952-3ED6821137A8\",\"_key\":\"EA3EB9AE-DE4A-99E9-E952-3ED6821137A8\",\"_model\":\"App_Models_Admin_Exam_Exam\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_action\":\"App_Admin_Actions_Exam_CollectionExamBind\"}', '2021-03-21 11:39:17', '2021-03-21 11:39:17');
INSERT INTO `exam_admin_operation_log` VALUES (1868, 1, 'exam/admin/exam/collection/exam', 'GET', '180.157.122.15', '{\"collection_id\":\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:39:18', '2021-03-21 11:39:18');
INSERT INTO `exam_admin_operation_log` VALUES (1869, 1, 'exam/admin/_handle_action_', 'POST', '180.157.122.15', '{\"collection_uuid\":\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",\"uuid\":\"1EF497D7-BBD4-F6C3-C374-60C225D9B638\",\"_key\":\"1EF497D7-BBD4-F6C3-C374-60C225D9B638\",\"_model\":\"App_Models_Admin_Exam_Exam\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_action\":\"App_Admin_Actions_Exam_CollectionExamBind\"}', '2021-03-21 11:39:22', '2021-03-21 11:39:22');
INSERT INTO `exam_admin_operation_log` VALUES (1870, 1, 'exam/admin/exam/collection/exam', 'GET', '180.157.122.15', '{\"collection_id\":\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:39:22', '2021-03-21 11:39:22');
INSERT INTO `exam_admin_operation_log` VALUES (1871, 1, 'exam/admin/_handle_action_', 'POST', '180.157.122.15', '{\"collection_uuid\":\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",\"uuid\":\"70CB6583-01F3-28EE-EEB0-667BFE1D3169\",\"_key\":\"70CB6583-01F3-28EE-EEB0-667BFE1D3169\",\"_model\":\"App_Models_Admin_Exam_Exam\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_action\":\"App_Admin_Actions_Exam_CollectionExamBind\"}', '2021-03-21 11:39:26', '2021-03-21 11:39:26');
INSERT INTO `exam_admin_operation_log` VALUES (1872, 1, 'exam/admin/exam/collection/exam', 'GET', '180.157.122.15', '{\"collection_id\":\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:39:27', '2021-03-21 11:39:27');
INSERT INTO `exam_admin_operation_log` VALUES (1873, 1, 'exam/admin/_handle_action_', 'POST', '180.157.122.15', '{\"collection_uuid\":\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",\"uuid\":\"45F26C9E-C836-5AD0-D005-4AD3F073090E\",\"_key\":\"45F26C9E-C836-5AD0-D005-4AD3F073090E\",\"_model\":\"App_Models_Admin_Exam_Exam\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_action\":\"App_Admin_Actions_Exam_CollectionExamBind\"}', '2021-03-21 11:39:31', '2021-03-21 11:39:31');
INSERT INTO `exam_admin_operation_log` VALUES (1874, 1, 'exam/admin/exam/collection/exam', 'GET', '180.157.122.15', '{\"collection_id\":\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:39:31', '2021-03-21 11:39:31');
INSERT INTO `exam_admin_operation_log` VALUES (1875, 1, 'exam/admin/_handle_action_', 'POST', '180.157.122.15', '{\"collection_uuid\":\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",\"uuid\":\"2B44DA65-219A-3F53-5323-594BEAC117DB\",\"_key\":\"2B44DA65-219A-3F53-5323-594BEAC117DB\",\"_model\":\"App_Models_Admin_Exam_Exam\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_action\":\"App_Admin_Actions_Exam_CollectionExamBind\"}', '2021-03-21 11:39:36', '2021-03-21 11:39:36');
INSERT INTO `exam_admin_operation_log` VALUES (1876, 1, 'exam/admin/exam/collection/exam', 'GET', '180.157.122.15', '{\"collection_id\":\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:39:36', '2021-03-21 11:39:36');
INSERT INTO `exam_admin_operation_log` VALUES (1877, 1, 'exam/admin/_handle_action_', 'POST', '180.157.122.15', '{\"collection_uuid\":\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",\"uuid\":\"9A4CF38E-408F-A07D-7DEC-7C5667FCBD24\",\"_key\":\"9A4CF38E-408F-A07D-7DEC-7C5667FCBD24\",\"_model\":\"App_Models_Admin_Exam_Exam\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_action\":\"App_Admin_Actions_Exam_CollectionExamBind\"}', '2021-03-21 11:39:40', '2021-03-21 11:39:40');
INSERT INTO `exam_admin_operation_log` VALUES (1878, 1, 'exam/admin/exam/collection/exam', 'GET', '180.157.122.15', '{\"collection_id\":\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:39:40', '2021-03-21 11:39:40');
INSERT INTO `exam_admin_operation_log` VALUES (1879, 1, 'exam/admin/_handle_action_', 'POST', '180.157.122.15', '{\"collection_uuid\":\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",\"uuid\":\"2E3076B1-84E0-0BA3-A348-F0C83611F6C4\",\"_key\":\"2E3076B1-84E0-0BA3-A348-F0C83611F6C4\",\"_model\":\"App_Models_Admin_Exam_Exam\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_action\":\"App_Admin_Actions_Exam_CollectionExamBind\"}', '2021-03-21 11:39:44', '2021-03-21 11:39:44');
INSERT INTO `exam_admin_operation_log` VALUES (1880, 1, 'exam/admin/exam/collection/exam', 'GET', '180.157.122.15', '{\"collection_id\":\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:39:44', '2021-03-21 11:39:44');
INSERT INTO `exam_admin_operation_log` VALUES (1881, 1, 'exam/admin/_handle_action_', 'POST', '180.157.122.15', '{\"collection_uuid\":\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",\"uuid\":\"A9664327-2ED8-31B4-B45A-EBD6FDEB2D87\",\"_key\":\"A9664327-2ED8-31B4-B45A-EBD6FDEB2D87\",\"_model\":\"App_Models_Admin_Exam_Exam\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_action\":\"App_Admin_Actions_Exam_CollectionExamBind\"}', '2021-03-21 11:39:48', '2021-03-21 11:39:48');
INSERT INTO `exam_admin_operation_log` VALUES (1882, 1, 'exam/admin/exam/collection/exam', 'GET', '180.157.122.15', '{\"collection_id\":\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:39:48', '2021-03-21 11:39:48');
INSERT INTO `exam_admin_operation_log` VALUES (1883, 1, 'exam/admin/_handle_action_', 'POST', '180.157.122.15', '{\"collection_uuid\":\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",\"uuid\":\"ED58364A-35BF-1179-791A-C4F96FFA75A5\",\"_key\":\"ED58364A-35BF-1179-791A-C4F96FFA75A5\",\"_model\":\"App_Models_Admin_Exam_Exam\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_action\":\"App_Admin_Actions_Exam_CollectionExamBind\"}', '2021-03-21 11:39:52', '2021-03-21 11:39:52');
INSERT INTO `exam_admin_operation_log` VALUES (1884, 1, 'exam/admin/exam/collection/exam', 'GET', '180.157.122.15', '{\"collection_id\":\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:39:52', '2021-03-21 11:39:52');
INSERT INTO `exam_admin_operation_log` VALUES (1885, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:50:01', '2021-03-21 11:50:01');
INSERT INTO `exam_admin_operation_log` VALUES (1886, 1, 'exam/admin/exam/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:50:03', '2021-03-21 11:50:03');
INSERT INTO `exam_admin_operation_log` VALUES (1887, 1, 'exam/admin/exam/collection', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:50:13', '2021-03-21 11:50:13');
INSERT INTO `exam_admin_operation_log` VALUES (1888, 1, 'exam/admin/exam/collection/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:50:23', '2021-03-21 11:50:23');
INSERT INTO `exam_admin_operation_log` VALUES (1889, 1, 'exam/admin/exam/tag', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:50:28', '2021-03-21 11:50:28');
INSERT INTO `exam_admin_operation_log` VALUES (1890, 1, 'exam/admin/exam/tag/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:50:29', '2021-03-21 11:50:29');
INSERT INTO `exam_admin_operation_log` VALUES (1891, 1, 'exam/admin/exam/tag', 'POST', '180.157.122.15', '{\"uuid\":\"5AAD7B0F-4A56-49EC-EC90-8C3831CCB5A6\",\"title\":\"\\u8bed\\u6587\\u8bd5\\u9898\",\"remark\":null,\"is_show\":\"on\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\\/tag\"}', '2021-03-21 11:50:35', '2021-03-21 11:50:35');
INSERT INTO `exam_admin_operation_log` VALUES (1892, 1, 'exam/admin/exam/tag', 'GET', '180.157.122.15', '[]', '2021-03-21 11:50:36', '2021-03-21 11:50:36');
INSERT INTO `exam_admin_operation_log` VALUES (1893, 1, 'exam/admin/exam/collection', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:50:37', '2021-03-21 11:50:37');
INSERT INTO `exam_admin_operation_log` VALUES (1894, 1, 'exam/admin/exam/collection/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:50:38', '2021-03-21 11:50:38');
INSERT INTO `exam_admin_operation_log` VALUES (1895, 1, 'exam/admin/exam/collection', 'POST', '180.157.122.15', '{\"uuid\":\"BBED2AF1-AA87-C957-57C9-465A146A20A9\",\"exam_category_uuid\":\"DFDC6859-50A0-9AFA-FA13-5E5DCB6F7049\",\"exam_tag_uuid\":\"5AAD7B0F-4A56-49EC-EC90-8C3831CCB5A6\",\"title\":\"\\u9ad8\\u4e8c\\u8bed\\u6587\\u5907\\u8003\\u9ec4\\u91d130\\u9898\",\"exam_time\":\"23:59:00\",\"submit_number\":\"5\",\"is_recommend\":\"on\",\"is_show\":\"on\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\\/collection\"}', '2021-03-21 11:51:56', '2021-03-21 11:51:56');
INSERT INTO `exam_admin_operation_log` VALUES (1896, 1, 'exam/admin/exam/collection', 'GET', '180.157.122.15', '[]', '2021-03-21 11:51:59', '2021-03-21 11:51:59');
INSERT INTO `exam_admin_operation_log` VALUES (1897, 1, 'exam/admin/exam/tag', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:52:02', '2021-03-21 11:52:02');
INSERT INTO `exam_admin_operation_log` VALUES (1898, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:52:04', '2021-03-21 11:52:04');
INSERT INTO `exam_admin_operation_log` VALUES (1899, 1, 'exam/admin/exam/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:52:17', '2021-03-21 11:52:17');
INSERT INTO `exam_admin_operation_log` VALUES (1900, 1, 'exam/admin/exam', 'POST', '180.157.122.15', '{\"uuid\":\"95258A6C-27BB-D1F6-F6CF-76C610D04970\",\"category\":[\"DFDC6859-50A0-9AFA-FA13-5E5DCB6F7049\",null],\"collection\":[\"BBED2AF1-AA87-C957-57C9-465A146A20A9\",null],\"title\":\"\\u4e0b\\u5217\\u8bcd\\u8bed\\uff0c\\u5b57\\u5f62\\u548c\\u52a0\\u70b9\\u5b57\\u7684\\u6ce8\\u97f3\\u5168\\u90e8\\u6b63\\u786e\\u7684\\u4e00\\u9879\\u662f\",\"option\":{\"new_1\":{\"title\":\"\\u517b\\u6b96\\u4e1a \\u4e0e\\u65e5\\u5267\\u589e \\u4fbf\\u7b3a\\uff08ji\\u0101n\\uff09 \\u72ec\\u8f9f\\u8e4a\\uff08x\\u012b\\uff09\\u5f84\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_2\":{\"title\":\"\\u9189\\u91ba\\u91ba \\u8d38\\u7136\\u4ece\\u4e8b \\u6ce5\\u6dd6\\uff08n\\u00e0o\\uff09 \\u5411\\u9685\\uff08y\\u00fa\\uff09\\u800c\\u6ce3\",\"check\":\"B\",\"is_check\":\"1\",\"_remove_\":\"0\"},\"new_3\":{\"title\":\"\\u6ee5\\u644a\\u5b50 \\u81ea\\u7531\\u7ade\\u4e89 \\u5377\\u5e19\\uff08di\\u00e9\\uff09 \\u8fd0\\u7b79\\u5e37\\u5e44\\uff08w\\u00f2\\uff09\",\"check\":\"C\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_4\":{\"title\":\"\\u98a4\\u5dcd\\u5dcd \\u4fe1\\u7b14\\u6d82\\u9e2d \\u8e41\\u8df9\\uff08xi\\u0101n\\uff09 \\u6e6e\\uff08y\\u012bn\\uff09\\u6ca1\\u65e0\\u95fb\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}},\"answer\":[\"B\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":\"\\uff081\\uff09\\u5e38\\u89c1\\u591a\\u97f3\\u5b57\\u6807\\u201c\\u6b21\\u8bfb\\u97f3\\u201d\\u6b63\\u786e\\u7684\\u53ef\\u80fd\\u6027\\u5927\\uff0c\\u6807\\u201c\\u5e38\\u8bfb\\u97f3\\u201d\\u6b63\\u786e\\u7684\\u53ef\\u80fd\\u6027\\u5c0f\\u3002\\u5f62\\u58f0\\u5b57\\u6807\\u201c\\u4e0d\\u540c\\u58f0\\u65c1\\u8bfb\\u97f3\\u201d\\u7684\\u6b63\\u786e\\u53ef\\u80fd\\u6027\\u5927\\uff0c\\u6807\\u201c\\u540c\\u58f0\\u65c1\\u8bfb\\u97f3\\u201d\\u7684\\u6b63\\u786e\\u53ef\\u80fd\\u6027\\u5c0f\\u3002\\u5e38\\u89c1\\u5b57\\u6807\\u97f3\\u6b63\\u786e\\u7684\\u53ef\\u80fd\\u6027\\u5c0f\\u3002\\u751f\\u50fb\\u5b57\\u4e00\\u822c\\u4e0d\\u4f1a\\u6807\\u9519\\u97f3\\u3002\\uff082\\uff09\\u5e7f\\u4e1c\\u4eba\\u533a\\u5206\\u820c\\u5c16\\u524d\\u97f3\\u548c\\u820c\\u5c16\\u540e\\u97f3\\uff0c\\u585e\\u64e6\\u97f3\\u7684\\u9001\\u6c14\\u97f3\\u4e0e\\u4e0d\\u9001\\u6c14\\u97f3\\uff0c\\u540e\\u54cd\\u590d\\u97f5\\u6bcd\\u7684\\u201cie\\u201d\\u4e0e\\u201cu\\u00e8\\u201d\\u96be\\u5ea6\\u5f88\\u5927\\uff0c\\u5fc5\\u987b\\u77eb\\u6b63\\u3002\\uff083\\uff09\\u5584\\u7528\\u6392\\u9664\\u6cd5\\u3002\\u5b57\\u5f62\\u9898\\u7b54\\u9898\\u6280\\u5de7\\uff1a\\u57fa\\u672c\\u65b9\\u6cd5\\u4e3a\\u4ee5\\u201c\\u4e49\\u201d\\u5b9a\\u201c\\u5f62\\u201d\\u3002\\uff081\\uff09\\u4ece\\u5f62\\u65c1\\u5165\\u624b\\u3002\\u5982\\u201c\\u5f29\\u201d\\u548c\\u201c\\u9a7d\\u201d\\uff0c\\u201c\\u8093\\u201d\\u4e0e\\u201c\\u76f2\\u201d\\u3002\\uff082\\uff09\\u4ece\\u8bcd\\u4e49\\u5165\\u6210\\u624b\\uff0c\\u5982\\u201c\\u8feb\\u4e0d\\u53ca\\u5f85\\u201d\\u4e2d\\u7684\\u201c\\u53ca\\u201d\\u662f\\u201c\\u7b49\\u5230\\u201d\\u7684\\u610f\\u601d\\uff0c\\u4e0d\\u662f\\u201c\\u6025\\u8feb\\u201d\\u7684\\u610f\\u601d\\u3002\\uff083\\uff09\\u4ece\\u8bcd\\u8bed\\u7684\\u7ed3\\u6784\\u5165\\u624b\\u3002\\u5982\\u201c\\u6587\\u8fc7\\u9970\\u975e\\uff0c\\u5e7d\\u6101\\u6697\\u6068\\u201d\\uff0c\\u5e76\\u5217\\u5f0f\\u8bcd\\u8bed\\uff0c\\u201c\\u6587\\u201d\\u548c\\u201c\\u9970\\u201d\\uff0c\\u201c\\u5e7d\\u201d\\u4e0e\\u201d\\u6697\\u201d\\u4e92\\u8bad\\u3002\\u518d\\u5982\\uff1a\\u7a77\\u5f62\\u5c3d\\u76f8\\u3001\\u548c\\u989c\\u60a6\\u8272\\u7b49\\u3002\\uff084\\uff09\\u4ece\\u6210\\u8bed\\u7684\\u51fa\\u5904\\u5165\\u624b\\u3002\\u5982\\uff1a\\u5bdf\\u8a00\\u89c2\\u8272\\u3001\\u58a8\\u5b88\\u6210\\u89c4\\u7b49\",\"tips\":\"\\u8bc6\\u8bb0\\u73b0\\u4ee3\\u6c49\\u8bed\\u666e\\u901a\\u8bdd\\u5e38\\u7528\\u5b57\\u7684\\u5b57\\u97f3\\u3002\\u8bc6\\u8bb0\\u5e76\\u6b63\\u786e\\u4e66\\u5199\\u73b0\\u4ee3\\u5e38\\u7528\\u89c4\\u8303\\u6c49\\u5b57\\u3002\\u80fd\\u529b\\u5c42\\u7ea7\\u4e3a\\u8bc6\\u8bb0A\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\"}', '2021-03-21 11:53:50', '2021-03-21 11:53:50');
INSERT INTO `exam_admin_operation_log` VALUES (1901, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '[]', '2021-03-21 11:53:50', '2021-03-21 11:53:50');
INSERT INTO `exam_admin_operation_log` VALUES (1902, 1, 'exam/admin/exam/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:53:53', '2021-03-21 11:53:53');
INSERT INTO `exam_admin_operation_log` VALUES (1903, 1, 'exam/admin/exam', 'POST', '180.157.122.15', '{\"uuid\":\"E0F4377F-259D-5543-43CE-430E562F6D21\",\"category\":[\"DFDC6859-50A0-9AFA-FA13-5E5DCB6F7049\",null],\"collection\":[\"BBED2AF1-AA87-C957-57C9-465A146A20A9\",null],\"title\":\"\\u4e0b\\u5217\\u8bcd\\u8bed\\u4e2d\\u6ca1\\u6709\\u9519\\u522b\\u5b57\\u7684\\u4e00\\u7ec4\\u662f\",\"option\":{\"new_1\":{\"title\":\"\\u5b89\\u7965 \\u6807\\u65b0\\u7acb\\u5f02 \\u8272\\u5f69\\u6591\\u6593 \\u5f00\\u6e90\\u8282\\u6d41\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_2\":{\"title\":\"\\u9500\\u5047 \\u96cd\\u5bb9\\u534e\\u8d35 \\u5927\\u5343\\u4f17\\u76f8 \\u65e2\\u5f80\\u4e0d\\u7a76\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_3\":{\"title\":\"\\u548c\\u8c10 \\u53d1\\u8f6b\\u4e4b\\u4f5c \\u80c1\\u80a9\\u8c04\\u7b11 \\u751f\\u6740\\u4e88\\u593a\",\"check\":\"C\",\"is_check\":\"1\",\"_remove_\":\"0\"},\"new_4\":{\"title\":\"\\u8d4c\\u535a \\u529f\\u4e8f\\u4e00\\u532e \\u55e4\\u4e4b\\u4ee5\\u9f3b \\u4e0d\\u8ba1\\u5176\\u6570\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}},\"answer\":[\"C\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":\"\\u8bc6\\u8bb0\\u5e76\\u6b63\\u786e\\u4e66\\u5199\\u73b0\\u4ee3\\u5e38\\u7528\\u89c4\\u8303\\u6c49\\u5b57\\u3002\\u80fd\\u529b\\u5c42\\u7ea7\\u4e3a\\u8bc6\\u8bb0A\\u3002\\u3010\\u6280\\u5de7\\u70b9\\u62e8\\u3011\\u5b57\\u5f62\\u9898\\u7b54\\u9898\\u6280\\u5de7\\uff1a\\u57fa\\u672c\\u65b9\\u6cd5\\u4e3a\\u4ee5\\u201c\\u4e49\\u201d\\u5b9a\\u201c\\u5f62\\u201d\\u3002\\uff081\\uff09\\u4ece\\u5f62\\u65c1\\u5165\\u624b\\u3002\\u5982\\u201c\\u5f29\\u201d\\u548c\\u201c\\u9a7d\\u201d\\uff0c\\u201c\\u8093\\u201d\\u4e0e\\u201c\\u76f2\\u201d\\u3002\\uff082\\uff09\\u4ece\\u8bcd\\u4e49\\u5165\\u6210\\u624b\\uff0c\\u5982\\u201c\\u8feb\\u4e0d\\u53ca\\u5f85\\u201d\\u4e2d\\u7684\\u201c\\u53ca\\u201d\\u662f\\u201c\\u7b49\\u5230\\u201d\\u7684\\u610f\\u601d\\uff0c\\u4e0d\\u662f\\u201c\\u6025\\u8feb\\u201d\\u7684\\u610f\\u601d\\u3002\\uff083\\uff09\\u4ece\\u8bcd\\u8bed\\u7684\\u7ed3\\u6784\\u5165\\u624b\\u3002\\u5982\\u201c\\u6587\\u8fc7\\u9970\\u975e\\uff0c\\u5e7d\\u6101\\u6697\\u6068\\u201d\\uff0c\\u5e76\\u5217\\u5f0f\\u8bcd\\u8bed\\uff0c\\u201c\\u6587\\u201d\\u548c\\u201c\\u9970\\u201d\\uff0c\\u201c\\u5e7d\\u201d\\u4e0e\\u201d\\u6697\\u201d\\u4e92\\u8bad\\u3002\\u518d\\u5982\\uff1a\\u7a77\\u5f62\\u5c3d\\u76f8\\u3001\\u548c\\u989c\\u60a6\\u8272\\u7b49\\u3002\\uff084\\uff09\\u4ece\\u6210\\u8bed\\u7684\\u51fa\\u5904\\u5165\\u624b\\u3002\\u5982\\uff1a\\u5bdf\\u8a00\\u89c2\\u8272\\u3001\\u58a8\\u5b88\\u6210\\u89c4\\u7b49\",\"tips\":\"\\u9898\\u8003\\u67e5\\u5b57\\u5f62\\u3002A\\u9879\\uff0c\\u5b89\\u7965\\u2014\\u2014\\u5b89\\u8be6\\uff08\\u6307\\u795e\\u6001\\u5e73\\u9759\\u3001\\u4ece\\u5bb9\\u7a33\\u91cd\\uff09\\u3002B\\u9879\\uff0c\\u65e2\\u5f80\\u4e0d\\u7a76\\u2014\\u2014\\u65e2\\u5f80\\u4e0d\\u548e\\uff08\\u548e\\uff1a\\u8d23\\u602a\\u3002\\u539f\\u6307\\u5df2\\u7ecf\\u505a\\u5b8c\\u6216\\u505a\\u8fc7\\u7684\\u4e8b\\uff0c\\u5c31\\u4e0d\\u5fc5\\u518d\\u8d23\\u602a\\u4e86\\u3002\\u73b0\\u6307\\u5bf9\\u4ee5\\u5f80\\u7684\\u8fc7\\u9519\\u4e0d\\u518d\\u8d23\\u5907\\uff09\\u3002D\\u9879\\uff0c\\u529f\\u4e8f\\u4e00\\u532e\\u2014\\u2014\\u529f\\u4e8f\\u4e00\\u7bd1\\uff08\\u7bd1\\uff1a\\u76db\\u571f\\u7684\\u7b50\\u5b50\\u3002\\u5806\\u4e5d\\u4ede\\u9ad8\\u7684\\u5c71\\uff0c\\u53ea\\u7f3a\\u4e00\\u7b50\\u571f\\u800c\\u4e0d\\u80fd\\u5b8c\\u6210\\u3002\\u6bd4\\u55bb\\u505a\\u4e8b\\u60c5\\u53ea\\u5dee\\u6700\\u540e\\u4e00\\u70b9\\u6ca1\\u80fd\\u5b8c\\u6210\\uff09\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\"}', '2021-03-21 11:55:18', '2021-03-21 11:55:18');
INSERT INTO `exam_admin_operation_log` VALUES (1904, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '[]', '2021-03-21 11:55:19', '2021-03-21 11:55:19');
INSERT INTO `exam_admin_operation_log` VALUES (1905, 1, 'exam/admin/exam/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 11:55:21', '2021-03-21 11:55:21');
INSERT INTO `exam_admin_operation_log` VALUES (1906, 1, 'exam/admin/exam', 'POST', '180.157.122.15', '{\"uuid\":\"3A012E92-FFDA-3B09-0959-4C9DA31160B2\",\"category\":[\"DFDC6859-50A0-9AFA-FA13-5E5DCB6F7049\",null],\"collection\":[\"BBED2AF1-AA87-C957-57C9-465A146A20A9\",null],\"title\":\"\\u4e0b\\u5217\\u5404\\u7ec4\\u8bcd\\u8bed\\u4e2d\\u6ca1\\u6709\\u9519\\u522b\\u5b57\\u7684\\u4e00\\u7ec4\\u662f\",\"option\":{\"new_1\":{\"title\":\"\\u63e3\\u6469 \\u5fae\\u8a00\\u5927\\u610f \\u7f8e\\u4ed1\\u7f8e\\u5942 \\u8c08\\u7b11\\u98ce\\u751f\",\"check\":\"A\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_2\":{\"title\":\"\\u6495\\u6253 \\u5473\\u540c\\u56bc\\u8721 \\u7115\\u7136\\u4e00\\u65b0 \\u5fc3\\u6062\\u610f\\u61d2\",\"check\":\"B\",\"is_check\":\"0\",\"_remove_\":\"0\"},\"new_3\":{\"title\":\"\\u5669\\u8017 \\u610f\\u6c14\\u98ce\\u53d1 \\u97ad\\u8f9f\\u5165\\u7406 \\u83ab\\u540d\\u5176\\u5999\",\"check\":\"C\",\"is_check\":\"1\",\"_remove_\":\"0\"},\"new_4\":{\"title\":\"\\u4f38\\u5f20 \\u901a\\u5bb5\\u8fbe\\u65e6 \\u529b\\u633d\\u72c2\\u6f9c \\u7518\\u8d25\\u4e0b\\u98ce\",\"check\":\"D\",\"is_check\":\"0\",\"_remove_\":\"0\"}},\"answer\":[\"C\",null],\"tips_expend_score\":\"0\",\"answer_expend_score\":\"0\",\"tips_income_score\":\"0\",\"answer_income_score\":\"0\",\"is_show\":\"on\",\"analysis\":null,\"tips\":\"A\\u5fae\\u8a00\\u5927\\u4e49 \\u7f8e\\u8f6e\\u7f8e\\u5942B \\u53ae\\u6253 \\u5fc3\\u7070\\u610f\\u61d2D \\u7518\\u62dc\\u4e0b\\u98ce\\u3002\",\"_token\":\"UZB8TArPfKXHunabhlITEeNt8v6nH3zkMnKvsGXE\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\"}', '2021-03-21 11:56:52', '2021-03-21 11:56:52');
INSERT INTO `exam_admin_operation_log` VALUES (1907, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '[]', '2021-03-21 11:56:52', '2021-03-21 11:56:52');
INSERT INTO `exam_admin_operation_log` VALUES (1908, 1, 'exam/admin/exam/category', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 21:04:34', '2021-03-21 21:04:34');
INSERT INTO `exam_admin_operation_log` VALUES (1909, 1, 'exam/admin/exam', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 21:04:35', '2021-03-21 21:04:35');
INSERT INTO `exam_admin_operation_log` VALUES (1910, 1, 'exam/admin/exam/collection', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 21:05:43', '2021-03-21 21:05:43');
INSERT INTO `exam_admin_operation_log` VALUES (1911, 1, 'exam/admin/exam/collection/BBED2AF1-AA87-C957-57C9-465A146A20A9/edit', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 21:05:46', '2021-03-21 21:05:46');
INSERT INTO `exam_admin_operation_log` VALUES (1912, 1, 'exam/admin/exam/collection/BBED2AF1-AA87-C957-57C9-465A146A20A9', 'PUT', '180.157.122.15', '{\"uuid\":\"BBED2AF1-AA87-C957-57C9-465A146A20A9\",\"exam_category_uuid\":\"DFDC6859-50A0-9AFA-FA13-5E5DCB6F7049\",\"exam_tag_uuid\":\"5AAD7B0F-4A56-49EC-EC90-8C3831CCB5A6\",\"title\":\"\\u9ad8\\u4e8c\\u8bed\\u6587\\u5907\\u8003\\u9ec4\\u91d1\\u9898\",\"exam_time\":\"23:59:00\",\"submit_number\":\"5\",\"is_recommend\":\"on\",\"is_show\":\"on\",\"_token\":\"f6V0mydGTTnQuWWlpvZ0zk8LTPcdQqFSjiQcE7qt\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\\/collection\"}', '2021-03-21 21:05:51', '2021-03-21 21:05:51');
INSERT INTO `exam_admin_operation_log` VALUES (1913, 1, 'exam/admin/exam/collection', 'GET', '180.157.122.15', '[]', '2021-03-21 21:05:52', '2021-03-21 21:05:52');
INSERT INTO `exam_admin_operation_log` VALUES (1914, 1, 'exam/admin/exam/collection/exam', 'GET', '180.157.122.15', '{\"collection_id\":\"BBED2AF1-AA87-C957-57C9-465A146A20A9\",\"_pjax\":\"#pjax-container\"}', '2021-03-21 21:05:56', '2021-03-21 21:05:56');
INSERT INTO `exam_admin_operation_log` VALUES (1915, 1, 'exam/admin/platform/banner', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 21:11:02', '2021-03-21 21:11:02');
INSERT INTO `exam_admin_operation_log` VALUES (1916, 1, 'exam/admin/platform/banner/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 21:11:04', '2021-03-21 21:11:04');
INSERT INTO `exam_admin_operation_log` VALUES (1917, 1, 'exam/admin/platform/banner', 'POST', '180.157.122.15', '{\"uuid\":\"26FB4257-0392-E587-87FF-04B59FD69395\",\"position\":\"2\",\"title\":\"\\u65b0\\u5b66\\u671f\\u5b66\\u4e1a\\u817e\\u98de\",\"url\":null,\"is_show\":\"on\",\"orders\":\"5\",\"_token\":\"f6V0mydGTTnQuWWlpvZ0zk8LTPcdQqFSjiQcE7qt\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/platform\\/banner\"}', '2021-03-21 21:12:13', '2021-03-21 21:12:13');
INSERT INTO `exam_admin_operation_log` VALUES (1918, 1, 'exam/admin/platform/banner', 'GET', '180.157.122.15', '[]', '2021-03-21 21:12:14', '2021-03-21 21:12:14');
INSERT INTO `exam_admin_operation_log` VALUES (1919, 1, 'exam/admin/platform/banner/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 21:12:16', '2021-03-21 21:12:16');
INSERT INTO `exam_admin_operation_log` VALUES (1920, 1, 'exam/admin/platform/banner', 'POST', '180.157.122.15', '{\"uuid\":\"59BEC1B1-FDDA-E807-0749-713411A78626\",\"position\":\"1\",\"title\":\"\\u89e3\\u5bc6\\u82f1\\u8bed\\u5b66\\u4e60\\u903b\\u8f91\",\"url\":null,\"is_show\":\"on\",\"orders\":\"0\",\"_token\":\"f6V0mydGTTnQuWWlpvZ0zk8LTPcdQqFSjiQcE7qt\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/platform\\/banner\"}', '2021-03-21 21:12:39', '2021-03-21 21:12:39');
INSERT INTO `exam_admin_operation_log` VALUES (1921, 1, 'exam/admin/platform/banner', 'GET', '180.157.122.15', '[]', '2021-03-21 21:12:39', '2021-03-21 21:12:39');
INSERT INTO `exam_admin_operation_log` VALUES (1922, 1, 'exam/admin/platform/banner/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 21:12:41', '2021-03-21 21:12:41');
INSERT INTO `exam_admin_operation_log` VALUES (1923, 1, 'exam/admin/platform/banner', 'POST', '180.157.122.15', '{\"uuid\":\"18EB0554-B44C-DCE4-E4BC-7493AB06E6D8\",\"position\":\"1\",\"title\":\"\\u5168\\u56fd\\u9ad8\\u8003\\u4f5c\\u6587\\u8bd5\\u9898\\u51fa\\u7089\",\"url\":null,\"is_show\":\"on\",\"orders\":\"0\",\"_token\":\"f6V0mydGTTnQuWWlpvZ0zk8LTPcdQqFSjiQcE7qt\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/platform\\/banner\"}', '2021-03-21 21:13:12', '2021-03-21 21:13:12');
INSERT INTO `exam_admin_operation_log` VALUES (1924, 1, 'exam/admin/platform/banner', 'GET', '180.157.122.15', '[]', '2021-03-21 21:13:13', '2021-03-21 21:13:13');
INSERT INTO `exam_admin_operation_log` VALUES (1925, 1, 'exam/admin/platform/banner/create', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-03-21 21:13:14', '2021-03-21 21:13:14');
INSERT INTO `exam_admin_operation_log` VALUES (1926, 1, 'exam/admin', 'GET', '116.234.6.27', '[]', '2021-03-22 16:20:24', '2021-03-22 16:20:24');
INSERT INTO `exam_admin_operation_log` VALUES (1927, 1, 'exam/admin/wechat/user/score', 'GET', '116.234.6.27', '{\"_pjax\":\"#pjax-container\"}', '2021-03-22 16:20:34', '2021-03-22 16:20:34');
INSERT INTO `exam_admin_operation_log` VALUES (1928, 1, 'exam/admin/wechat/user', 'GET', '116.234.6.27', '{\"_pjax\":\"#pjax-container\"}', '2021-03-22 16:20:40', '2021-03-22 16:20:40');
INSERT INTO `exam_admin_operation_log` VALUES (1929, 1, 'exam/admin/_handle_action_', 'POST', '116.234.6.27', '{\"_key\":\"1\",\"_model\":\"App_Models_Admin_User_WeChat\",\"_token\":\"u2PuHB5cykA0gRCmy7DgTMc4QS2KYB88keJ8eXsb\",\"_action\":\"App_Admin_Actions_Common_ShowStatus\"}', '2021-03-22 16:20:48', '2021-03-22 16:20:48');
INSERT INTO `exam_admin_operation_log` VALUES (1930, 1, 'exam/admin/wechat/user', 'GET', '116.234.6.27', '{\"_pjax\":\"#pjax-container\"}', '2021-03-22 16:20:48', '2021-03-22 16:20:48');
INSERT INTO `exam_admin_operation_log` VALUES (1931, 1, 'exam/admin/_handle_action_', 'POST', '116.234.6.27', '{\"_key\":\"1\",\"_model\":\"App_Models_Admin_User_WeChat\",\"_token\":\"u2PuHB5cykA0gRCmy7DgTMc4QS2KYB88keJ8eXsb\",\"_action\":\"App_Admin_Actions_Common_ShowStatus\"}', '2021-03-22 16:20:52', '2021-03-22 16:20:52');
INSERT INTO `exam_admin_operation_log` VALUES (1932, 1, 'exam/admin/wechat/user', 'GET', '116.234.6.27', '{\"_pjax\":\"#pjax-container\"}', '2021-03-22 16:20:53', '2021-03-22 16:20:53');
INSERT INTO `exam_admin_operation_log` VALUES (1933, 1, 'exam/admin/wechat/user', 'GET', '116.234.6.27', '{\"_pjax\":\"#pjax-container\"}', '2021-03-22 16:20:55', '2021-03-22 16:20:55');
INSERT INTO `exam_admin_operation_log` VALUES (1934, 1, 'exam/admin/wechat/user/score', 'GET', '116.234.6.27', '{\"_pjax\":\"#pjax-container\"}', '2021-03-22 16:20:55', '2021-03-22 16:20:55');
INSERT INTO `exam_admin_operation_log` VALUES (1935, 1, 'exam/admin/exam/category', 'GET', '116.234.6.27', '{\"_pjax\":\"#pjax-container\"}', '2021-03-22 16:20:58', '2021-03-22 16:20:58');
INSERT INTO `exam_admin_operation_log` VALUES (1936, 1, 'exam/admin/exam', 'GET', '116.234.6.27', '{\"_pjax\":\"#pjax-container\"}', '2021-03-22 16:21:01', '2021-03-22 16:21:01');
INSERT INTO `exam_admin_operation_log` VALUES (1937, 1, 'exam/admin/exam/tag', 'GET', '116.234.6.27', '{\"_pjax\":\"#pjax-container\"}', '2021-03-22 16:21:05', '2021-03-22 16:21:05');
INSERT INTO `exam_admin_operation_log` VALUES (1938, 1, 'exam/admin/exam/collection', 'GET', '116.234.6.27', '{\"_pjax\":\"#pjax-container\"}', '2021-03-22 16:21:06', '2021-03-22 16:21:06');
INSERT INTO `exam_admin_operation_log` VALUES (1939, 1, 'exam/admin/exam/collection', 'GET', '116.234.6.27', '[]', '2021-03-22 16:21:09', '2021-03-22 16:21:09');
INSERT INTO `exam_admin_operation_log` VALUES (1940, 1, 'exam/admin', 'GET', '116.234.6.27', '[]', '2021-03-23 13:56:04', '2021-03-23 13:56:04');
INSERT INTO `exam_admin_operation_log` VALUES (1941, 1, 'exam/admin/wechat/user/score', 'GET', '116.234.6.27', '{\"_pjax\":\"#pjax-container\"}', '2021-03-23 13:56:07', '2021-03-23 13:56:07');
INSERT INTO `exam_admin_operation_log` VALUES (1942, 1, 'exam/admin/wechat/user', 'GET', '116.234.6.27', '{\"_pjax\":\"#pjax-container\"}', '2021-03-23 13:56:09', '2021-03-23 13:56:09');
INSERT INTO `exam_admin_operation_log` VALUES (1943, 1, 'exam/admin/platform/message/category', 'GET', '180.157.122.15', '[]', '2021-04-01 21:30:03', '2021-04-01 21:30:03');
INSERT INTO `exam_admin_operation_log` VALUES (1944, 1, 'exam/admin/platform/score/setting', 'GET', '180.157.122.15', '[]', '2021-04-01 21:30:19', '2021-04-01 21:30:19');
INSERT INTO `exam_admin_operation_log` VALUES (1945, 1, 'exam/admin/exam/tag', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-04-01 21:30:32', '2021-04-01 21:30:32');
INSERT INTO `exam_admin_operation_log` VALUES (1946, 1, 'exam/admin/exam/search/history', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-04-01 21:30:40', '2021-04-01 21:30:40');
INSERT INTO `exam_admin_operation_log` VALUES (1947, 1, 'exam/admin/wechat/user/score', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-04-01 21:30:58', '2021-04-01 21:30:58');
INSERT INTO `exam_admin_operation_log` VALUES (1948, 1, 'exam/admin/wechat/user', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-04-01 21:31:59', '2021-04-01 21:31:59');
INSERT INTO `exam_admin_operation_log` VALUES (1949, 1, 'exam/admin/platform/content', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-04-01 21:34:32', '2021-04-01 21:34:32');
INSERT INTO `exam_admin_operation_log` VALUES (1950, 1, 'exam/admin/platform/banner', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-04-01 21:34:34', '2021-04-01 21:34:34');
INSERT INTO `exam_admin_operation_log` VALUES (1951, 1, 'exam/admin', 'GET', '172.18.0.1', '[]', '2021-04-02 22:00:19', '2021-04-02 22:00:19');
INSERT INTO `exam_admin_operation_log` VALUES (1952, 1, 'exam/admin', 'GET', '172.18.0.1', '[]', '2021-04-02 22:00:27', '2021-04-02 22:00:27');
INSERT INTO `exam_admin_operation_log` VALUES (1953, 1, 'exam/admin/platform/message/category', 'GET', '180.157.122.15', '[]', '2021-04-05 14:21:54', '2021-04-05 14:21:54');
INSERT INTO `exam_admin_operation_log` VALUES (1954, 1, 'exam/admin/exam/collection', 'GET', '180.157.122.15', '[]', '2021-04-05 14:22:02', '2021-04-05 14:22:02');
INSERT INTO `exam_admin_operation_log` VALUES (1955, 1, 'exam/admin/exam/collection', 'GET', '180.157.122.15', '[]', '2021-04-05 14:22:06', '2021-04-05 14:22:06');
INSERT INTO `exam_admin_operation_log` VALUES (1956, 1, 'exam/admin/exam/collection/C34E39CD-8C55-655A-5A7B-34DAA423A23B/edit', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-04-05 14:22:11', '2021-04-05 14:22:11');
INSERT INTO `exam_admin_operation_log` VALUES (1957, 1, 'exam/admin/exam/collection/C34E39CD-8C55-655A-5A7B-34DAA423A23B/edit', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-04-05 14:22:27', '2021-04-05 14:22:27');
INSERT INTO `exam_admin_operation_log` VALUES (1958, 1, 'exam/admin/exam/collection/C34E39CD-8C55-655A-5A7B-34DAA423A23B', 'PUT', '180.157.122.15', '{\"uuid\":\"C34E39CD-8C55-655A-5A7B-34DAA423A23B\",\"exam_category_uuid\":\"C715B621-2069-C557-575B-ED04E2C08D77\",\"exam_tag_uuid\":\"22E1D4C0-4D78-0F3B-3BA3-28FB264E3B92\",\"title\":\"\\u56db\\u5ddd\\u7709\\u5c71\\u4e00\\u4e2d\\u671f\\u672b\\u8003\\u8bd5\\u8bd5\\u5377\",\"exam_time\":\"00:05:00\",\"submit_number\":\"4\",\"is_recommend\":\"on\",\"level\":\"5\",\"is_show\":\"on\",\"content\":\"<p>\\u6682\\u65e0\\u8981\\u6c42<\\/p>\",\"_token\":\"jMCmYaL6GyxXUJuDSMJzP5EwBN0gWtf6qNWjxeRt\",\"_method\":\"PUT\"}', '2021-04-05 14:22:43', '2021-04-05 14:22:43');
INSERT INTO `exam_admin_operation_log` VALUES (1959, 1, 'exam/admin/exam/collection', 'GET', '180.157.122.15', '[]', '2021-04-05 14:23:01', '2021-04-05 14:23:01');
INSERT INTO `exam_admin_operation_log` VALUES (1960, 1, 'exam/admin/exam/collection/BBED2AF1-AA87-C957-57C9-465A146A20A9/edit', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-04-05 14:23:04', '2021-04-05 14:23:04');
INSERT INTO `exam_admin_operation_log` VALUES (1961, 1, 'exam/admin/exam/collection/BBED2AF1-AA87-C957-57C9-465A146A20A9', 'PUT', '180.157.122.15', '{\"uuid\":\"BBED2AF1-AA87-C957-57C9-465A146A20A9\",\"exam_category_uuid\":\"DFDC6859-50A0-9AFA-FA13-5E5DCB6F7049\",\"exam_tag_uuid\":\"5AAD7B0F-4A56-49EC-EC90-8C3831CCB5A6\",\"title\":\"\\u9ad8\\u4e8c\\u8bed\\u6587\\u5907\\u8003\\u9ec4\\u91d1\\u9898\",\"exam_time\":\"00:05:00\",\"submit_number\":\"7\",\"is_recommend\":\"on\",\"level\":\"5\",\"is_show\":\"on\",\"content\":\"<p>\\u6682\\u65e0\\u8981\\u6c42<\\/p>\",\"_token\":\"jMCmYaL6GyxXUJuDSMJzP5EwBN0gWtf6qNWjxeRt\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/exam.qqdeveloper.com\\/exam\\/admin\\/exam\\/collection\"}', '2021-04-05 14:23:17', '2021-04-05 14:23:17');
INSERT INTO `exam_admin_operation_log` VALUES (1962, 1, 'exam/admin/exam/collection', 'GET', '180.157.122.15', '[]', '2021-04-05 14:23:18', '2021-04-05 14:23:18');
INSERT INTO `exam_admin_operation_log` VALUES (1963, 1, 'exam/admin', 'GET', '180.157.122.15', '[]', '2021-04-08 19:59:39', '2021-04-08 19:59:39');
INSERT INTO `exam_admin_operation_log` VALUES (1964, 1, 'exam/admin/wechat/user/score', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-04-08 19:59:50', '2021-04-08 19:59:50');
INSERT INTO `exam_admin_operation_log` VALUES (1965, 1, 'exam/admin/wechat/user', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-04-08 19:59:51', '2021-04-08 19:59:51');
INSERT INTO `exam_admin_operation_log` VALUES (1966, 1, 'exam/admin/_handle_action_', 'POST', '180.157.122.15', '{\"_key\":\"4\",\"_model\":\"App_Models_Admin_User_WeChat\",\"_token\":\"p3WQWM6wF52T9XII0qJhfX6q2sAarIruM9YAs2Lq\",\"_action\":\"App_Admin_Actions_Common_ShowStatus\"}', '2021-04-08 20:00:03', '2021-04-08 20:00:03');
INSERT INTO `exam_admin_operation_log` VALUES (1967, 1, 'exam/admin/wechat/user', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-04-08 20:00:03', '2021-04-08 20:00:03');
INSERT INTO `exam_admin_operation_log` VALUES (1968, 1, 'exam/admin/_handle_action_', 'POST', '180.157.122.15', '{\"_key\":\"4\",\"_model\":\"App_Models_Admin_User_WeChat\",\"_token\":\"p3WQWM6wF52T9XII0qJhfX6q2sAarIruM9YAs2Lq\",\"_action\":\"App_Admin_Actions_Common_ShowStatus\"}', '2021-04-08 20:00:06', '2021-04-08 20:00:06');
INSERT INTO `exam_admin_operation_log` VALUES (1969, 1, 'exam/admin/wechat/user', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-04-08 20:00:06', '2021-04-08 20:00:06');
INSERT INTO `exam_admin_operation_log` VALUES (1970, 1, 'exam/admin/wechat/user', 'GET', '180.157.122.15', '[]', '2021-04-08 20:00:08', '2021-04-08 20:00:08');
INSERT INTO `exam_admin_operation_log` VALUES (1971, 1, 'exam/admin/wechat/user', 'GET', '180.157.122.15', '[]', '2021-04-08 20:00:13', '2021-04-08 20:00:13');
INSERT INTO `exam_admin_operation_log` VALUES (1972, 1, 'exam/admin/wechat/user', 'GET', '180.157.122.15', '[]', '2021-04-08 20:11:21', '2021-04-08 20:11:21');
INSERT INTO `exam_admin_operation_log` VALUES (1973, 1, 'exam/admin/platform/content', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-04-08 20:11:27', '2021-04-08 20:11:27');
INSERT INTO `exam_admin_operation_log` VALUES (1974, 1, 'exam/admin/wechat/user/score', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-04-08 20:11:33', '2021-04-08 20:11:33');
INSERT INTO `exam_admin_operation_log` VALUES (1975, 1, 'exam/admin/wechat/user', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-04-08 20:11:38', '2021-04-08 20:11:38');
INSERT INTO `exam_admin_operation_log` VALUES (1976, 1, 'exam/admin/wechat/user/score', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-04-08 20:11:44', '2021-04-08 20:11:44');
INSERT INTO `exam_admin_operation_log` VALUES (1977, 1, 'exam/admin/wechat/user/score', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-04-08 20:11:50', '2021-04-08 20:11:50');
INSERT INTO `exam_admin_operation_log` VALUES (1978, 1, 'exam/admin/wechat/user/score', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-04-08 20:11:52', '2021-04-08 20:11:52');
INSERT INTO `exam_admin_operation_log` VALUES (1979, 1, 'exam/admin', 'GET', '180.157.122.15', '[]', '2021-04-09 18:05:02', '2021-04-09 18:05:02');
INSERT INTO `exam_admin_operation_log` VALUES (1980, 1, 'exam/admin/wechat/user/score', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-04-09 18:05:09', '2021-04-09 18:05:09');
INSERT INTO `exam_admin_operation_log` VALUES (1981, 1, 'exam/admin/wechat/user/score', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-04-09 18:05:19', '2021-04-09 18:05:19');
INSERT INTO `exam_admin_operation_log` VALUES (1982, 1, 'exam/admin/auth/setting', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-04-09 18:05:21', '2021-04-09 18:05:21');
INSERT INTO `exam_admin_operation_log` VALUES (1983, 1, 'exam/admin', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-04-09 18:05:26', '2021-04-09 18:05:26');
INSERT INTO `exam_admin_operation_log` VALUES (1984, 1, 'exam/admin/platform/content', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-04-09 18:05:52', '2021-04-09 18:05:52');
INSERT INTO `exam_admin_operation_log` VALUES (1985, 1, 'exam/admin/platform/score/setting', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-04-09 18:05:52', '2021-04-09 18:05:52');
INSERT INTO `exam_admin_operation_log` VALUES (1986, 1, 'exam/admin/platform/banner', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-04-09 18:05:53', '2021-04-09 18:05:53');
INSERT INTO `exam_admin_operation_log` VALUES (1987, 1, 'exam/admin', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-04-09 18:05:54', '2021-04-09 18:05:54');
INSERT INTO `exam_admin_operation_log` VALUES (1988, 1, 'exam/admin', 'GET', '116.234.6.27', '[]', '2021-04-14 13:23:20', '2021-04-14 13:23:20');
INSERT INTO `exam_admin_operation_log` VALUES (1989, 1, 'exam/admin/exam/collection', 'GET', '116.234.6.27', '{\"_pjax\":\"#pjax-container\"}', '2021-04-14 13:23:33', '2021-04-14 13:23:33');
INSERT INTO `exam_admin_operation_log` VALUES (1990, 1, 'exam/admin/exam', 'GET', '116.234.6.27', '{\"_pjax\":\"#pjax-container\"}', '2021-04-14 13:23:36', '2021-04-14 13:23:36');
INSERT INTO `exam_admin_operation_log` VALUES (1991, 1, 'exam/admin/exam/create', 'GET', '116.234.6.27', '{\"_pjax\":\"#pjax-container\"}', '2021-04-14 13:23:41', '2021-04-14 13:23:41');
INSERT INTO `exam_admin_operation_log` VALUES (1992, 1, 'exam/admin/exam/tag', 'GET', '116.234.6.27', '{\"_pjax\":\"#pjax-container\"}', '2021-04-14 13:24:27', '2021-04-14 13:24:27');
INSERT INTO `exam_admin_operation_log` VALUES (1993, 1, 'exam/admin/exam/category', 'GET', '116.234.6.27', '{\"_pjax\":\"#pjax-container\"}', '2021-04-14 13:24:29', '2021-04-14 13:24:29');
INSERT INTO `exam_admin_operation_log` VALUES (1994, 1, 'exam/admin/exam', 'GET', '116.234.6.27', '{\"_pjax\":\"#pjax-container\"}', '2021-04-14 13:24:37', '2021-04-14 13:24:37');
INSERT INTO `exam_admin_operation_log` VALUES (1995, 1, 'exam/admin/platform/content', 'GET', '116.234.6.27', '{\"_pjax\":\"#pjax-container\"}', '2021-04-14 13:24:40', '2021-04-14 13:24:40');
INSERT INTO `exam_admin_operation_log` VALUES (1996, 1, 'exam/admin/platform/score/setting', 'GET', '116.234.6.27', '{\"_pjax\":\"#pjax-container\"}', '2021-04-14 13:24:42', '2021-04-14 13:24:42');
INSERT INTO `exam_admin_operation_log` VALUES (1997, 1, 'exam/admin/platform/banner', 'GET', '116.234.6.27', '{\"_pjax\":\"#pjax-container\"}', '2021-04-14 13:24:43', '2021-04-14 13:24:43');
INSERT INTO `exam_admin_operation_log` VALUES (1998, 1, 'exam/admin/platform/content', 'GET', '116.234.6.27', '{\"_pjax\":\"#pjax-container\"}', '2021-04-14 13:24:52', '2021-04-14 13:24:52');
INSERT INTO `exam_admin_operation_log` VALUES (1999, 1, 'exam/admin/platform/score/setting', 'GET', '116.234.6.27', '{\"_pjax\":\"#pjax-container\"}', '2021-04-14 13:24:54', '2021-04-14 13:24:54');
INSERT INTO `exam_admin_operation_log` VALUES (2000, 1, 'exam/admin/platform/banner', 'GET', '116.234.6.27', '{\"_pjax\":\"#pjax-container\"}', '2021-04-14 13:24:55', '2021-04-14 13:24:55');
INSERT INTO `exam_admin_operation_log` VALUES (2001, 1, 'exam/admin', 'GET', '116.234.6.27', '[]', '2021-04-15 09:29:13', '2021-04-15 09:29:13');
INSERT INTO `exam_admin_operation_log` VALUES (2002, 1, 'exam/admin/wechat/user', 'GET', '116.234.6.27', '{\"_pjax\":\"#pjax-container\"}', '2021-04-15 09:29:17', '2021-04-15 09:29:17');
INSERT INTO `exam_admin_operation_log` VALUES (2003, 1, 'exam/admin/wechat/user/score', 'GET', '116.234.6.27', '{\"_pjax\":\"#pjax-container\"}', '2021-04-15 09:29:22', '2021-04-15 09:29:22');
INSERT INTO `exam_admin_operation_log` VALUES (2004, 1, 'exam/admin/exam/category', 'GET', '116.234.6.27', '{\"_pjax\":\"#pjax-container\"}', '2021-04-15 09:29:33', '2021-04-15 09:29:33');
INSERT INTO `exam_admin_operation_log` VALUES (2005, 1, 'exam/admin', 'GET', '180.157.122.15', '[]', '2021-04-17 19:37:51', '2021-04-17 19:37:51');
INSERT INTO `exam_admin_operation_log` VALUES (2006, 1, 'exam/admin/platform/content', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 19:38:09', '2021-04-17 19:38:09');
INSERT INTO `exam_admin_operation_log` VALUES (2007, 1, 'exam/admin/platform/message/category', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 19:38:13', '2021-04-17 19:38:13');
INSERT INTO `exam_admin_operation_log` VALUES (2008, 1, 'exam/admin/platform/message/content', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 19:38:16', '2021-04-17 19:38:16');
INSERT INTO `exam_admin_operation_log` VALUES (2009, 1, 'exam/admin/platform/const/setting', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 19:38:19', '2021-04-17 19:38:19');
INSERT INTO `exam_admin_operation_log` VALUES (2010, 1, 'exam/admin/exam/tag', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 19:38:23', '2021-04-17 19:38:23');
INSERT INTO `exam_admin_operation_log` VALUES (2011, 1, 'exam/admin/wechat/user', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 19:38:25', '2021-04-17 19:38:25');
INSERT INTO `exam_admin_operation_log` VALUES (2012, 1, 'exam/admin/wechat/user/score', 'GET', '180.157.122.15', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 19:38:26', '2021-04-17 19:38:26');
INSERT INTO `exam_admin_operation_log` VALUES (2013, 1, 'exam/admin', 'GET', '180.157.122.15', '[]', '2021-04-17 19:42:29', '2021-04-17 19:42:29');
INSERT INTO `exam_admin_operation_log` VALUES (2014, 1, 'exam/admin', 'GET', '172.18.0.1', '[]', '2021-04-17 19:42:37', '2021-04-17 19:42:37');
INSERT INTO `exam_admin_operation_log` VALUES (2015, 1, 'exam/admin/platform/score/setting', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 19:42:43', '2021-04-17 19:42:43');
INSERT INTO `exam_admin_operation_log` VALUES (2016, 1, 'exam/admin/platform/content', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 19:42:47', '2021-04-17 19:42:47');
INSERT INTO `exam_admin_operation_log` VALUES (2017, 1, 'exam/admin/platform/message/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 19:42:50', '2021-04-17 19:42:50');
INSERT INTO `exam_admin_operation_log` VALUES (2018, 1, 'exam/admin/platform/message/category', 'GET', '172.18.0.1', '[]', '2021-04-17 19:44:38', '2021-04-17 19:44:38');
INSERT INTO `exam_admin_operation_log` VALUES (2019, 1, 'exam/admin/platform/message/content', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 19:44:41', '2021-04-17 19:44:41');
INSERT INTO `exam_admin_operation_log` VALUES (2020, 1, 'exam/admin/platform/score/setting', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 19:44:44', '2021-04-17 19:44:44');
INSERT INTO `exam_admin_operation_log` VALUES (2021, 1, 'exam/admin/platform/content', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 19:44:45', '2021-04-17 19:44:45');
INSERT INTO `exam_admin_operation_log` VALUES (2022, 1, 'exam/admin/auth/setting', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 19:44:56', '2021-04-17 19:44:56');
INSERT INTO `exam_admin_operation_log` VALUES (2023, 1, 'exam/admin/auth/setting', 'PUT', '172.18.0.1', '{\"name\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\",\"password\":\"$2y$10$vn2Xqa\\/\\/NqOmsptQ1a9\\/beVRNa5WrrcZVmqW1JSOAGIv8LxqqbKOq\",\"password_confirmation\":\"$2y$10$vn2Xqa\\/\\/NqOmsptQ1a9\\/beVRNa5WrrcZVmqW1JSOAGIv8LxqqbKOq\",\"_token\":\"9y2kvLFSmrd8XapzXI6tg1ITHG6K6a8zZ1OTj9NH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/exam\\/admin\\/platform\\/content\"}', '2021-04-17 19:45:04', '2021-04-17 19:45:04');
INSERT INTO `exam_admin_operation_log` VALUES (2024, 1, 'exam/admin/auth/setting', 'GET', '172.18.0.1', '[]', '2021-04-17 19:45:05', '2021-04-17 19:45:05');
INSERT INTO `exam_admin_operation_log` VALUES (2025, 1, 'exam/admin/auth/setting', 'GET', '172.18.0.1', '[]', '2021-04-17 19:45:08', '2021-04-17 19:45:08');
INSERT INTO `exam_admin_operation_log` VALUES (2026, 1, 'exam/admin/platform/content', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 19:45:12', '2021-04-17 19:45:12');
INSERT INTO `exam_admin_operation_log` VALUES (2027, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 19:45:47', '2021-04-17 19:45:47');
INSERT INTO `exam_admin_operation_log` VALUES (2028, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '[]', '2021-04-17 19:45:50', '2021-04-17 19:45:50');
INSERT INTO `exam_admin_operation_log` VALUES (2029, 1, 'exam/admin/platform/banner/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 19:45:58', '2021-04-17 19:45:58');
INSERT INTO `exam_admin_operation_log` VALUES (2030, 1, 'exam/admin/platform/banner/1', 'PUT', '172.18.0.1', '{\"uuid\":\"460FE43C-F645-C79F-9F4E-5A11269F6B6E\",\"position\":\"2\",\"title\":\"\\u5f00\\u5b66\\u65b0\\u540c\\u5fd7\",\"url\":null,\"is_show\":\"on\",\"orders\":\"0\",\"_token\":\"9y2kvLFSmrd8XapzXI6tg1ITHG6K6a8zZ1OTj9NH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/exam\\/admin\\/platform\\/banner\"}', '2021-04-17 19:46:03', '2021-04-17 19:46:03');
INSERT INTO `exam_admin_operation_log` VALUES (2031, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '[]', '2021-04-17 19:46:04', '2021-04-17 19:46:04');
INSERT INTO `exam_admin_operation_log` VALUES (2032, 1, 'exam/admin/platform/banner/2/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 19:46:08', '2021-04-17 19:46:08');
INSERT INTO `exam_admin_operation_log` VALUES (2033, 1, 'exam/admin/platform/banner/2', 'PUT', '172.18.0.1', '{\"uuid\":\"70C791B9-1AF8-64D8-D88F-6C86BEECC8AD\",\"position\":\"4\",\"title\":\"\\u5fc5\\u8bfb\\u5728\\u4e0d\\u770b\\u5c31\\u665a\\u4e86\",\"url\":null,\"is_show\":\"on\",\"orders\":\"0\",\"_token\":\"9y2kvLFSmrd8XapzXI6tg1ITHG6K6a8zZ1OTj9NH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/exam\\/admin\\/platform\\/banner\"}', '2021-04-17 19:46:13', '2021-04-17 19:46:13');
INSERT INTO `exam_admin_operation_log` VALUES (2034, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '[]', '2021-04-17 19:46:14', '2021-04-17 19:46:14');
INSERT INTO `exam_admin_operation_log` VALUES (2035, 1, 'exam/admin', 'GET', '172.18.0.1', '[]', '2021-04-17 21:53:15', '2021-04-17 21:53:15');
INSERT INTO `exam_admin_operation_log` VALUES (2036, 1, 'exam/admin', 'GET', '172.18.0.1', '[]', '2021-04-17 21:53:33', '2021-04-17 21:53:33');
INSERT INTO `exam_admin_operation_log` VALUES (2037, 1, 'exam/admin', 'GET', '172.18.0.1', '[]', '2021-04-17 21:54:03', '2021-04-17 21:54:03');
INSERT INTO `exam_admin_operation_log` VALUES (2038, 1, 'exam/admin/platform/content', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 21:59:01', '2021-04-17 21:59:01');
INSERT INTO `exam_admin_operation_log` VALUES (2039, 1, 'exam/admin/platform/score/setting', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 21:59:02', '2021-04-17 21:59:02');
INSERT INTO `exam_admin_operation_log` VALUES (2040, 1, 'exam/admin/platform/message/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 21:59:04', '2021-04-17 21:59:04');
INSERT INTO `exam_admin_operation_log` VALUES (2041, 1, 'exam/admin/platform/message/content', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 21:59:04', '2021-04-17 21:59:04');
INSERT INTO `exam_admin_operation_log` VALUES (2042, 1, 'exam/admin/platform/message/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 21:59:05', '2021-04-17 21:59:05');
INSERT INTO `exam_admin_operation_log` VALUES (2043, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 21:59:06', '2021-04-17 21:59:06');
INSERT INTO `exam_admin_operation_log` VALUES (2044, 1, 'exam/admin/platform/score/setting', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 21:59:07', '2021-04-17 21:59:07');
INSERT INTO `exam_admin_operation_log` VALUES (2045, 1, 'exam/admin/platform/message/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 21:59:08', '2021-04-17 21:59:08');
INSERT INTO `exam_admin_operation_log` VALUES (2046, 1, 'exam/admin/platform/message/content', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 21:59:09', '2021-04-17 21:59:09');
INSERT INTO `exam_admin_operation_log` VALUES (2047, 1, 'exam/admin/platform/message/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 21:59:10', '2021-04-17 21:59:10');
INSERT INTO `exam_admin_operation_log` VALUES (2048, 1, 'exam/admin/platform/message/content', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 21:59:12', '2021-04-17 21:59:12');
INSERT INTO `exam_admin_operation_log` VALUES (2049, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 21:59:12', '2021-04-17 21:59:12');
INSERT INTO `exam_admin_operation_log` VALUES (2050, 1, 'exam/admin/platform/score/setting', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 21:59:13', '2021-04-17 21:59:13');
INSERT INTO `exam_admin_operation_log` VALUES (2051, 1, 'exam/admin/platform/content', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 21:59:13', '2021-04-17 21:59:13');
INSERT INTO `exam_admin_operation_log` VALUES (2052, 1, 'exam/admin/platform/message/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 21:59:16', '2021-04-17 21:59:16');
INSERT INTO `exam_admin_operation_log` VALUES (2053, 1, 'exam/admin/platform/message/content', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 21:59:16', '2021-04-17 21:59:16');
INSERT INTO `exam_admin_operation_log` VALUES (2054, 1, 'exam/admin/platform/message/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 21:59:18', '2021-04-17 21:59:18');
INSERT INTO `exam_admin_operation_log` VALUES (2055, 1, 'exam/admin/platform/message/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 21:59:19', '2021-04-17 21:59:19');
INSERT INTO `exam_admin_operation_log` VALUES (2056, 1, 'exam/admin/platform/message/content', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 21:59:19', '2021-04-17 21:59:19');
INSERT INTO `exam_admin_operation_log` VALUES (2057, 1, 'exam/admin/platform/message/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 21:59:23', '2021-04-17 21:59:23');
INSERT INTO `exam_admin_operation_log` VALUES (2058, 1, 'exam/admin/platform/message/category/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 21:59:24', '2021-04-17 21:59:24');
INSERT INTO `exam_admin_operation_log` VALUES (2059, 1, 'exam/admin/platform/message/category/1', 'PUT', '172.18.0.1', '{\"uuid\":\"A8B89FDA-3F6D-31AE-AE9B-E4C9CEB0F32E\",\"title\":\"\\u7cfb\\u7edf\\u6d88\\u606f\",\"is_show\":\"on\",\"_token\":\"e9HKNjgJ8PW5Y67web9V4wrMs9cWxI2dBhTf8w8L\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/exam\\/admin\\/platform\\/message\\/category\"}', '2021-04-17 21:59:31', '2021-04-17 21:59:31');
INSERT INTO `exam_admin_operation_log` VALUES (2060, 1, 'exam/admin/platform/message/category', 'GET', '172.18.0.1', '[]', '2021-04-17 21:59:44', '2021-04-17 21:59:44');
INSERT INTO `exam_admin_operation_log` VALUES (2061, 1, 'exam/admin/platform/message/content', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 21:59:47', '2021-04-17 21:59:47');
INSERT INTO `exam_admin_operation_log` VALUES (2062, 1, 'exam/admin/platform/message/content/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 21:59:49', '2021-04-17 21:59:49');
INSERT INTO `exam_admin_operation_log` VALUES (2063, 1, 'exam/admin/platform/message/content', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 21:59:53', '2021-04-17 21:59:53');
INSERT INTO `exam_admin_operation_log` VALUES (2064, 1, 'exam/admin/platform/message/content/1/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 21:59:58', '2021-04-17 21:59:58');
INSERT INTO `exam_admin_operation_log` VALUES (2065, 1, 'exam/admin/platform/message/content', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 22:00:01', '2021-04-17 22:00:01');
INSERT INTO `exam_admin_operation_log` VALUES (2066, 1, 'exam/admin/platform/message/category', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 22:00:04', '2021-04-17 22:00:04');
INSERT INTO `exam_admin_operation_log` VALUES (2067, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 22:00:07', '2021-04-17 22:00:07');
INSERT INTO `exam_admin_operation_log` VALUES (2068, 1, 'exam/admin/platform/banner/3/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 22:00:10', '2021-04-17 22:00:10');
INSERT INTO `exam_admin_operation_log` VALUES (2069, 1, 'exam/admin/platform/banner/3', 'PUT', '172.18.0.1', '{\"uuid\":\"7B6758D0-217F-5E6A-6A49-E7E99E82B992\",\"position\":\"2\",\"title\":\"\\u8fd9\\u5c31\\u6709\\u610f\\u601d\\u4e86\",\"url\":null,\"is_show\":\"on\",\"orders\":\"0\",\"_token\":\"e9HKNjgJ8PW5Y67web9V4wrMs9cWxI2dBhTf8w8L\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/exam\\/admin\\/platform\\/banner\"}', '2021-04-17 22:00:16', '2021-04-17 22:00:16');
INSERT INTO `exam_admin_operation_log` VALUES (2070, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '[]', '2021-04-17 22:00:39', '2021-04-17 22:00:39');
INSERT INTO `exam_admin_operation_log` VALUES (2071, 1, 'exam/admin/platform/banner/4/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 22:00:43', '2021-04-17 22:00:43');
INSERT INTO `exam_admin_operation_log` VALUES (2072, 1, 'exam/admin/platform/banner/4', 'PUT', '172.18.0.1', '{\"uuid\":\"8874A634-8FB2-649E-9E2C-2D2BE23F13FF\",\"position\":\"2\",\"title\":\"2021\\u65b0\\u65b0\\u8ba1\\u5212\",\"url\":null,\"is_show\":\"on\",\"orders\":\"0\",\"_token\":\"e9HKNjgJ8PW5Y67web9V4wrMs9cWxI2dBhTf8w8L\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/exam\\/admin\\/platform\\/banner\"}', '2021-04-17 22:00:48', '2021-04-17 22:00:48');
INSERT INTO `exam_admin_operation_log` VALUES (2073, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '[]', '2021-04-17 22:01:16', '2021-04-17 22:01:16');
INSERT INTO `exam_admin_operation_log` VALUES (2074, 1, 'exam/admin/platform/banner/5/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 22:02:51', '2021-04-17 22:02:51');
INSERT INTO `exam_admin_operation_log` VALUES (2075, 1, 'exam/admin/platform/banner/5', 'PUT', '172.18.0.1', '{\"uuid\":\"D41E9D16-B9F3-1D39-3963-7F9123E00482\",\"position\":\"4\",\"title\":\"2021\\u5e74\\u5ea6\\u5b66\\u4e60\\u76ee\\u6807\",\"url\":null,\"is_show\":\"on\",\"orders\":\"0\",\"_token\":\"e9HKNjgJ8PW5Y67web9V4wrMs9cWxI2dBhTf8w8L\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/exam\\/admin\\/platform\\/banner\"}', '2021-04-17 22:04:45', '2021-04-17 22:04:45');
INSERT INTO `exam_admin_operation_log` VALUES (2076, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '[]', '2021-04-17 22:06:14', '2021-04-17 22:06:14');
INSERT INTO `exam_admin_operation_log` VALUES (2077, 1, 'exam/admin/platform/banner/6/edit', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-04-17 22:08:54', '2021-04-17 22:08:54');
INSERT INTO `exam_admin_operation_log` VALUES (2078, 1, 'exam/admin/platform/banner/6', 'PUT', '172.18.0.1', '{\"uuid\":\"4C74EFF8-EC27-5688-88F6-380FE95F94EA\",\"position\":\"4\",\"title\":\"\\u641e\\u5b9a\\u62db\\u751f\\u8ba1\\u5212\",\"url\":null,\"is_show\":\"on\",\"orders\":\"0\",\"_token\":\"e9HKNjgJ8PW5Y67web9V4wrMs9cWxI2dBhTf8w8L\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/exam\\/admin\\/platform\\/banner\"}', '2021-04-17 22:09:23', '2021-04-17 22:09:23');
INSERT INTO `exam_admin_operation_log` VALUES (2079, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '[]', '2021-04-17 22:09:27', '2021-04-17 22:09:27');
INSERT INTO `exam_admin_operation_log` VALUES (2080, 1, 'exam/admin/platform/banner', 'GET', '172.18.0.1', '[]', '2021-04-17 22:18:14', '2021-04-17 22:18:14');
INSERT INTO `exam_admin_operation_log` VALUES (2081, 1, 'exam/admin', 'GET', '172.18.0.1', '[]', '2021-05-02 20:06:18', '2021-05-02 20:06:18');
INSERT INTO `exam_admin_operation_log` VALUES (2082, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-05-02 20:06:22', '2021-05-02 20:06:22');
INSERT INTO `exam_admin_operation_log` VALUES (2083, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-05-02 20:06:23', '2021-05-02 20:06:23');
INSERT INTO `exam_admin_operation_log` VALUES (2084, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '[]', '2021-05-02 20:06:24', '2021-05-02 20:06:24');
INSERT INTO `exam_admin_operation_log` VALUES (2085, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '[]', '2021-05-02 20:07:51', '2021-05-02 20:07:51');
INSERT INTO `exam_admin_operation_log` VALUES (2086, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-05-02 20:07:53', '2021-05-02 20:07:53');
INSERT INTO `exam_admin_operation_log` VALUES (2087, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-05-02 20:07:53', '2021-05-02 20:07:53');
INSERT INTO `exam_admin_operation_log` VALUES (2088, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-05-02 20:07:55', '2021-05-02 20:07:55');
INSERT INTO `exam_admin_operation_log` VALUES (2089, 1, 'exam/admin/exam/collection/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-05-02 20:07:56', '2021-05-02 20:07:56');
INSERT INTO `exam_admin_operation_log` VALUES (2090, 1, 'exam/admin/exam/collection/create', 'GET', '172.18.0.1', '[]', '2021-05-02 20:10:04', '2021-05-02 20:10:04');
INSERT INTO `exam_admin_operation_log` VALUES (2091, 1, 'exam/admin/exam/collection/create', 'GET', '172.18.0.1', '[]', '2021-05-02 20:10:07', '2021-05-02 20:10:07');
INSERT INTO `exam_admin_operation_log` VALUES (2092, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-05-02 20:10:37', '2021-05-02 20:10:37');
INSERT INTO `exam_admin_operation_log` VALUES (2093, 1, 'exam/admin/exam/tag/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-05-02 20:10:38', '2021-05-02 20:10:38');
INSERT INTO `exam_admin_operation_log` VALUES (2094, 1, 'exam/admin/exam/tag', 'POST', '172.18.0.1', '{\"uuid\":\"B5C1EF88-5AE5-84FC-FCD5-9850057102CD\",\"title\":\"123er\",\"remark\":\"123\",\"is_show\":\"on\",\"_token\":\"fGv3dsbmGInSbi3YlbBq170EmlbgJUbqGiC1kddO\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/exam\\/admin\\/exam\\/tag\"}', '2021-05-02 20:10:42', '2021-05-02 20:10:42');
INSERT INTO `exam_admin_operation_log` VALUES (2095, 1, 'exam/admin/exam/tag', 'GET', '172.18.0.1', '[]', '2021-05-02 20:10:43', '2021-05-02 20:10:43');
INSERT INTO `exam_admin_operation_log` VALUES (2096, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-05-02 20:10:44', '2021-05-02 20:10:44');
INSERT INTO `exam_admin_operation_log` VALUES (2097, 1, 'exam/admin/exam/collection/create', 'GET', '172.18.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-05-02 20:10:47', '2021-05-02 20:10:47');
INSERT INTO `exam_admin_operation_log` VALUES (2098, 1, 'exam/admin/exam/collection', 'POST', '172.18.0.1', '{\"uuid\":\"8B2BFA68-198B-2CEA-EACB-A0B8DF94BD76\",\"exam_category_uuid\":\"BE5991E1-983F-8440-4070-6E72BC75EBD8\",\"exam_tag_uuid\":\"B5C1EF88-5AE5-84FC-FCD5-9850057102CD\",\"title\":\"\\u4e00\\u5f20\\u56fe\\u5f7b\\u5e95\\u641e\\u61c2 MySQL \\u7684\\u9501\\u673a\\u5236[\\u9762\\u8bd5\\u9898]\",\"exam_time\":\"00:30:00\",\"submit_number\":\"0\",\"is_recommend\":\"on\",\"level\":\"4\",\"is_show\":\"on\",\"content\":\"<p>asdfa<\\/p>\",\"_token\":\"fGv3dsbmGInSbi3YlbBq170EmlbgJUbqGiC1kddO\",\"_previous_\":\"http:\\/\\/wechat_exam.com\\/exam\\/admin\\/exam\\/collection\"}', '2021-05-02 20:11:05', '2021-05-02 20:11:05');
INSERT INTO `exam_admin_operation_log` VALUES (2099, 1, 'exam/admin/exam/collection', 'GET', '172.18.0.1', '[]', '2021-05-02 20:11:19', '2021-05-02 20:11:19');
COMMIT;

-- ----------------------------
-- Table structure for exam_admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `exam_admin_permissions`;
CREATE TABLE `exam_admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`),
  UNIQUE KEY `admin_permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of exam_admin_permissions
-- ----------------------------
BEGIN;
INSERT INTO `exam_admin_permissions` VALUES (1, 'All permission', '*', '', '*', NULL, NULL);
INSERT INTO `exam_admin_permissions` VALUES (2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL);
INSERT INTO `exam_admin_permissions` VALUES (3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL);
INSERT INTO `exam_admin_permissions` VALUES (4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL);
INSERT INTO `exam_admin_permissions` VALUES (5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for exam_admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `exam_admin_role_menu`;
CREATE TABLE `exam_admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of exam_admin_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `exam_admin_role_menu` VALUES (1, 2, NULL, NULL);
INSERT INTO `exam_admin_role_menu` VALUES (1, 19, NULL, NULL);
INSERT INTO `exam_admin_role_menu` VALUES (1, 20, NULL, NULL);
INSERT INTO `exam_admin_role_menu` VALUES (1, 23, NULL, NULL);
INSERT INTO `exam_admin_role_menu` VALUES (1, 24, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for exam_admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `exam_admin_role_permissions`;
CREATE TABLE `exam_admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of exam_admin_role_permissions
-- ----------------------------
BEGIN;
INSERT INTO `exam_admin_role_permissions` VALUES (1, 1, NULL, NULL);
INSERT INTO `exam_admin_role_permissions` VALUES (1, 2, NULL, NULL);
INSERT INTO `exam_admin_role_permissions` VALUES (1, 3, NULL, NULL);
INSERT INTO `exam_admin_role_permissions` VALUES (1, 4, NULL, NULL);
INSERT INTO `exam_admin_role_permissions` VALUES (1, 5, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for exam_admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `exam_admin_role_users`;
CREATE TABLE `exam_admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of exam_admin_role_users
-- ----------------------------
BEGIN;
INSERT INTO `exam_admin_role_users` VALUES (1, 1, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for exam_admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `exam_admin_roles`;
CREATE TABLE `exam_admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`),
  UNIQUE KEY `admin_roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of exam_admin_roles
-- ----------------------------
BEGIN;
INSERT INTO `exam_admin_roles` VALUES (1, '系统超级管理员', 'administrator', '2021-03-05 02:54:48', '2021-03-06 15:03:17');
COMMIT;

-- ----------------------------
-- Table structure for exam_admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `exam_admin_user_permissions`;
CREATE TABLE `exam_admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for exam_admin_users
-- ----------------------------
DROP TABLE IF EXISTS `exam_admin_users`;
CREATE TABLE `exam_admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of exam_admin_users
-- ----------------------------
BEGIN;
INSERT INTO `exam_admin_users` VALUES (1, 'admin', '$2y$10$vn2Xqa//NqOmsptQ1a9/beVRNa5WrrcZVmqW1JSOAGIv8LxqqbKOq', '超级管理员', 'v2-82eefeff8997ff77469f1b9e022333c8_r.jpg', 'KfFgTBFW4j26zTCana08Zyps8TD5PP9uQrOEUekN2BwbgWybI875Lp6rYxAP', '2021-03-05 02:54:48', '2021-04-17 19:45:05');
COMMIT;

-- ----------------------------
-- Table structure for exam_article
-- ----------------------------
DROP TABLE IF EXISTS `exam_article`;
CREATE TABLE `exam_article` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `article_category_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文章分类',
  `store_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商户uuid',
  `title` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `cover` json DEFAULT NULL COMMENT '分类封面',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文章内容',
  `publish_date` date NOT NULL COMMENT '发布日期',
  `author` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发布人',
  `read_number` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '阅读数量',
  `orders` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '显示顺序',
  `is_show` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示1是|2否',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文章';

-- ----------------------------
-- Table structure for exam_article_category
-- ----------------------------
DROP TABLE IF EXISTS `exam_article_category`;
CREATE TABLE `exam_article_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商户uuid',
  `title` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类名称',
  `cover` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类封面',
  `orders` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '显示顺序',
  `is_show` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示1是|2否',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文章分类';

-- ----------------------------
-- Table structure for exam_banner
-- ----------------------------
DROP TABLE IF EXISTS `exam_banner`;
CREATE TABLE `exam_banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '全局唯一id',
  `title` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片描述',
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片地址',
  `orders` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '跳转地址',
  `position` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '图片位置1首页',
  `is_show` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '显示状态1显示|2禁止',
  `wxapp_id` int(10) unsigned DEFAULT '0' COMMENT '微信appid',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `store_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `travel_banner_id_unique` (`id`),
  UNIQUE KEY `travel_banner_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='轮播图配置';

-- ----------------------------
-- Table structure for exam_collection_exam
-- ----------------------------
DROP TABLE IF EXISTS `exam_collection_exam`;
CREATE TABLE `exam_collection_exam` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `exam_collection_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类id',
  `exam_item_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '试题id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `store_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='试卷试题关联';

-- ----------------------------
-- Table structure for exam_exam_category
-- ----------------------------
DROP TABLE IF EXISTS `exam_exam_category`;
CREATE TABLE `exam_exam_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'uuid',
  `title` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类型名称',
  `parent_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '上级分类',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `is_show` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '修改时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类封面',
  `big_cover` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '列表大图',
  `orders` int(10) NOT NULL DEFAULT '0' COMMENT '显示顺序',
  `is_home` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否首页显示',
  `store_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='试题分类';

-- ----------------------------
-- Records of exam_exam_category
-- ----------------------------
BEGIN;
INSERT INTO `exam_exam_category` VALUES (1, '742473D0-10C9-56E5-E573-7C96401D0FE5', '语文', NULL, '备注信息', 1, '2021-04-29 13:43:01', '2021-04-29 14:07:41', '2021-04-29 19:53:34', 'http://qiniucloud.qqdeveloper.com/8c7748705d3040c752981ad90064e6ad.png', 'http://qiniucloud.qqdeveloper.com/8c7748705d3040c752981ad90064e6ad.png', 1, 1, 'EDBCF840-47DA-A545-45E3-17E1EA4458D8');
INSERT INTO `exam_exam_category` VALUES (4, 'BE5991E1-983F-8440-4070-6E72BC75EBD8', '高中教学', '', '备注信息', 1, '2021-04-29 19:53:51', '2021-04-29 19:53:51', NULL, 'http://qiniucloud.qqdeveloper.com/8c7748705d3040c752981ad90064e6ad.png', 'http://qiniucloud.qqdeveloper.com/8c7748705d3040c752981ad90064e6ad.png', 1, 1, 'EDBCF840-47DA-A545-45E3-17E1EA4458D8');
INSERT INTO `exam_exam_category` VALUES (5, '58AABA75-2F87-5151-51A3-1D4710D2647D', '数学', 'BE5991E1-983F-8440-4070-6E72BC75EBD8', '备注信息', 1, '2021-04-29 19:54:11', '2021-04-29 19:54:11', NULL, 'http://qiniucloud.qqdeveloper.com/8c7748705d3040c752981ad90064e6ad.png', 'http://qiniucloud.qqdeveloper.com/8c7748705d3040c752981ad90064e6ad.png', 1, 1, 'EDBCF840-47DA-A545-45E3-17E1EA4458D8');
INSERT INTO `exam_exam_category` VALUES (11, 'C82E57BB-B8FB-ACD1-D140-A2AE6D631D9F', '语文', 'BE5991E1-983F-8440-4070-6E72BC75EBD8', '备注信息', 1, '2021-04-30 11:29:53', '2021-04-30 11:29:53', NULL, 'http://qiniucloud.qqdeveloper.com/8c7748705d3040c752981ad90064e6ad.png', 'http://qiniucloud.qqdeveloper.com/8c7748705d3040c752981ad90064e6ad.png', 1, 1, 'EDBCF840-47DA-A545-45E3-17E1EA4458D8');
INSERT INTO `exam_exam_category` VALUES (12, '48D1F5B7-5D95-9AC5-C5C7-7CA94AE46174', '语文', 'BE5991E1-983F-8440-4070-6E72BC75EBD8', '备注信息', 1, '2021-04-30 11:32:09', '2021-04-30 11:32:09', NULL, 'http://qiniucloud.qqdeveloper.com/8c7748705d3040c752981ad90064e6ad.png', 'http://qiniucloud.qqdeveloper.com/8c7748705d3040c752981ad90064e6ad.png', 1, 1, 'EDBCF840-47DA-A545-45E3-17E1EA4458D8');
INSERT INTO `exam_exam_category` VALUES (13, '041F57D0-1C5E-96E0-E0C4-9D6E3182E612', '语文', 'BE5991E1-983F-8440-4070-6E72BC75EBD8', '备注信息', 1, '2021-04-30 11:32:10', '2021-04-30 11:32:10', NULL, 'http://qiniucloud.qqdeveloper.com/8c7748705d3040c752981ad90064e6ad.png', 'http://qiniucloud.qqdeveloper.com/8c7748705d3040c752981ad90064e6ad.png', 1, 1, 'EDBCF840-47DA-A545-45E3-17E1EA4458D8');
INSERT INTO `exam_exam_category` VALUES (14, 'db530975-5958-c8ab-abcc-afc17681fc53', '语文', 'BE5991E1-983F-8440-4070-6E72BC75EBD8', '备注信息', 1, '2021-05-04 00:06:55', '2021-05-04 00:06:55', NULL, 'http://qiniucloud.qqdeveloper.com/8c7748705d3040c752981ad90064e6ad.png', 'http://qiniucloud.qqdeveloper.com/8c7748705d3040c752981ad90064e6ad.png', 1, 1, 'EDBCF840-47DA-A545-45E3-17E1EA4458D8');
COMMIT;

-- ----------------------------
-- Table structure for exam_exam_category_relation
-- ----------------------------
DROP TABLE IF EXISTS `exam_exam_category_relation`;
CREATE TABLE `exam_exam_category_relation` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `exam_category_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类id',
  `exam_item_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '试题id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `store_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '试题分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='试题分类关联';

-- ----------------------------
-- Table structure for exam_exam_collection
-- ----------------------------
DROP TABLE IF EXISTS `exam_exam_collection`;
CREATE TABLE `exam_exam_collection` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '试题名称',
  `cover` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '试题图片',
  `submit_number` int(10) unsigned NOT NULL COMMENT '答题人数',
  `exam_tag_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '知识点',
  `exam_category_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '试卷标签',
  `exam_time` time NOT NULL COMMENT '答题时间',
  `is_recommend` tinyint(3) unsigned NOT NULL COMMENT '是否推荐',
  `is_show` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示1是|2否',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '试题介绍',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `store_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '出题人',
  `audit_author` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审题人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='试卷';

-- ----------------------------
-- Records of exam_exam_collection
-- ----------------------------
BEGIN;
INSERT INTO `exam_exam_collection` VALUES (1, '8B2BFA68-198B-2CEA-EACB-A0B8DF94BD76', '一张图彻底搞懂 MySQL 的锁机制[面试题]', '5e4bb600c60d488e06b06ea22e34145c.png', 0, 'B5C1EF88-5AE5-84FC-FCD5-9850057102CD', 'BE5991E1-983F-8440-4070-6E72BC75EBD8', '00:30:00', 1, 1, '2021-05-02 20:11:19', '2021-05-02 20:11:19', NULL, '<p>asdfa</p>', 4, '', NULL, NULL);
INSERT INTO `exam_exam_collection` VALUES (2, '5473DF42-4617-BFD7-D783-FC43060B179E', '12', '12', 12, '12', '12', '12:12:12', 1, 1, '2021-05-02 20:57:30', '2021-05-02 20:57:30', NULL, '12', 1, 'EDBCF840-47DA-A545-45E3-17E1EA4458D8', '12', '12');
INSERT INTO `exam_exam_collection` VALUES (3, '84047088-2970-8939-391A-955BBE0E8825', '12', '12', 12, '12', '12', '12:12:12', 1, 1, '2021-05-02 20:57:33', '2021-05-02 20:57:33', NULL, '12', 1, 'EDBCF840-47DA-A545-45E3-17E1EA4458D8', '12', '12');
INSERT INTO `exam_exam_collection` VALUES (4, 'D89935A1-0867-8880-8053-4844C613F615', '12', '12', 12, '12', '12', '12:12:12', 1, 1, '2021-05-02 20:59:34', '2021-05-02 20:59:34', NULL, '12', 1, 'EDBCF840-47DA-A545-45E3-17E1EA4458D8', '12', '12');
COMMIT;

-- ----------------------------
-- Table structure for exam_exam_option
-- ----------------------------
DROP TABLE IF EXISTS `exam_exam_option`;
CREATE TABLE `exam_exam_option` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '试题名称',
  `cover` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '试题图片',
  `answer` json NOT NULL COMMENT '试题答案,根据选项中的option_title取值',
  `analysis` text COLLATE utf8mb4_unicode_ci COMMENT '试题解析',
  `tips` text COLLATE utf8mb4_unicode_ci COMMENT '试题提示',
  `tips_expend_score` decimal(6,2) DEFAULT '0.00' COMMENT '查看提示消耗的积分',
  `answer_expend_score` decimal(6,2) DEFAULT '0.00' COMMENT '查看答案消耗的积分',
  `tips_income_score` decimal(6,2) DEFAULT '0.00' COMMENT '查看提示奖励的积分',
  `answer_income_score` decimal(6,2) DEFAULT '0.00' COMMENT '查看答案奖励的积分',
  `is_show` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示1是|2否',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `option` json NOT NULL COMMENT '试题选项',
  `store_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` tinyint(4) NOT NULL DEFAULT '1' COMMENT '试题难易程度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='选择题';

-- ----------------------------
-- Table structure for exam_exam_search_history
-- ----------------------------
DROP TABLE IF EXISTS `exam_exam_search_history`;
CREATE TABLE `exam_exam_search_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '搜索词',
  `wechat_user_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '搜索用户id',
  `is_show` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `position` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '显示位置',
  `store_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='试题搜索历史';

-- ----------------------------
-- Table structure for exam_exam_submit_history
-- ----------------------------
DROP TABLE IF EXISTS `exam_exam_submit_history`;
CREATE TABLE `exam_exam_submit_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wechat_user_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户uuid',
  `exam_collection_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '试卷uuid',
  `exam_item_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '试题uuid',
  `success_number` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '正确题数',
  `error_number` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '错误题数',
  `score` decimal(6,2) NOT NULL DEFAULT '0.00' COMMENT '最终得分',
  `submit_time` time DEFAULT NULL COMMENT '答题时间',
  `is_show` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示1是|2否',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `answer` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '试题答案',
  `select_answer` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '选择答案',
  `store_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户签到历史';

-- ----------------------------
-- Table structure for exam_exam_tag_relation
-- ----------------------------
DROP TABLE IF EXISTS `exam_exam_tag_relation`;
CREATE TABLE `exam_exam_tag_relation` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `exam_tag_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标签id',
  `exam_item_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '试题id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `store_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '试题类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='试题标签关联';

-- ----------------------------
-- Table structure for exam_failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `exam_failed_jobs`;
CREATE TABLE `exam_failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for exam_migrations
-- ----------------------------
DROP TABLE IF EXISTS `exam_migrations`;
CREATE TABLE `exam_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of exam_migrations
-- ----------------------------
BEGIN;
INSERT INTO `exam_migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `exam_migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `exam_migrations` VALUES (3, '2016_01_04_173148_create_admin_tables', 1);
INSERT INTO `exam_migrations` VALUES (4, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `exam_migrations` VALUES (10, '2021_03_07_040845_create_search_history', 2);
INSERT INTO `exam_migrations` VALUES (11, '2021_03_07_041003_create_item', 2);
INSERT INTO `exam_migrations` VALUES (12, '2021_03_07_042118_create_exam_category_relation', 2);
INSERT INTO `exam_migrations` VALUES (13, '2021_03_07_042139_create_exam_category_tag', 2);
INSERT INTO `exam_migrations` VALUES (14, '2021_03_07_042945_create_exam_item_option', 2);
INSERT INTO `exam_migrations` VALUES (15, '2021_03_07_092331_create_platform_message_category', 3);
INSERT INTO `exam_migrations` VALUES (16, '2021_03_07_092410_create_platform_message_content', 3);
INSERT INTO `exam_migrations` VALUES (17, '2021_03_08_063955_create_platform_message_history', 4);
INSERT INTO `exam_migrations` VALUES (18, '2021_03_13_140122_create_platform_score', 5);
INSERT INTO `exam_migrations` VALUES (19, '2021_03_13_140517_create_user_score_history', 5);
INSERT INTO `exam_migrations` VALUES (20, '2021_03_13_155245_create_user_sign_history', 6);
INSERT INTO `exam_migrations` VALUES (21, '2021_03_13_155356_create_user_sign_collect', 6);
INSERT INTO `exam_migrations` VALUES (22, '2021_03_13_222518_create_platform_content', 7);
INSERT INTO `exam_migrations` VALUES (23, '2021_03_14_183545_create_exam_collection', 8);
INSERT INTO `exam_migrations` VALUES (24, '2021_03_15_114003_create_collection_exam', 9);
INSERT INTO `exam_migrations` VALUES (25, '2021_03_18_045928_create_exam_exam_submit_history', 10);
INSERT INTO `exam_migrations` VALUES (26, '2021_04_02_224857_add_content_field', 11);
INSERT INTO `exam_migrations` VALUES (27, '2021_04_03_004941_add_level_field', 11);
INSERT INTO `exam_migrations` VALUES (28, '2021_05_03_214826_create_platform_setting', 12);
INSERT INTO `exam_migrations` VALUES (29, '2021_05_03_220834_create_platform_file', 13);
INSERT INTO `exam_migrations` VALUES (30, '2021_05_03_233907_create_platform_group', 14);
INSERT INTO `exam_migrations` VALUES (31, '2021_05_18_140744_create_article_category', 15);
INSERT INTO `exam_migrations` VALUES (32, '2021_05_18_140823_create_article', 16);
COMMIT;

-- ----------------------------
-- Table structure for exam_password_resets
-- ----------------------------
DROP TABLE IF EXISTS `exam_password_resets`;
CREATE TABLE `exam_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for exam_platform_const_config
-- ----------------------------
DROP TABLE IF EXISTS `exam_platform_const_config`;
CREATE TABLE `exam_platform_const_config` (
  `key` varchar(30) CHARACTER SET utf8 NOT NULL COMMENT '设置项标示',
  `describe` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '设置项描述',
  `values` mediumtext CHARACTER SET utf8 NOT NULL COMMENT '设置内容（json格式）',
  `wxapp_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '更新时间',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_uuid` char(36) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COMMENT='平台常量配置信息';

-- ----------------------------
-- Records of exam_platform_const_config
-- ----------------------------
BEGIN;
INSERT INTO `exam_platform_const_config` VALUES ('banner', '系统首页', '2', 0, '2020-07-04 21:39:37', '2020-07-04 21:39:37', NULL, 1, '');
INSERT INTO `exam_platform_const_config` VALUES ('banner', '试题列表页', '1', 0, '2020-07-04 21:40:04', '2020-07-04 21:40:04', NULL, 2, '');
INSERT INTO `exam_platform_const_config` VALUES ('notice', '首页公告', '1', 0, '2020-07-04 21:40:31', '2020-07-04 21:40:31', NULL, 3, '');
INSERT INTO `exam_platform_const_config` VALUES ('banner', '景点文章推荐', '3', 0, '2020-07-19 21:21:42', '2020-07-19 21:21:42', '2021-03-07 16:04:37', 4, '');
INSERT INTO `exam_platform_const_config` VALUES ('banner', '试题分类页', '4', 0, '2019-09-25 00:00:00', '2019-10-25 00:00:00', NULL, 5, '');
INSERT INTO `exam_platform_const_config` VALUES ('menu', '首页菜单', '1', 0, '2019-09-25 00:00:00', '2019-10-25 00:00:00', NULL, 6, '');
INSERT INTO `exam_platform_const_config` VALUES ('banner', '站点分类', '5', 0, '2020-08-20 06:53:31', '2020-08-20 06:53:31', '2021-03-07 16:04:44', 7, '');
INSERT INTO `exam_platform_const_config` VALUES ('sex', '男', '1', 0, '2020-08-28 15:45:03', '2020-08-28 15:45:03', NULL, 9, '');
INSERT INTO `exam_platform_const_config` VALUES ('sex', '女', '2', 0, '2020-08-28 15:45:14', '2020-08-28 15:45:14', NULL, 10, '');
INSERT INTO `exam_platform_const_config` VALUES ('sex', '未知', '3', 0, '2020-08-28 15:45:29', '2020-08-28 15:45:29', NULL, 11, '');
INSERT INTO `exam_platform_const_config` VALUES ('college_grade', '小学', '1', 0, '2020-08-28 15:49:32', '2020-08-28 15:49:32', NULL, 12, '');
INSERT INTO `exam_platform_const_config` VALUES ('college_grade', '初中', '2', 0, '2020-08-28 15:49:42', '2020-08-28 15:49:42', NULL, 13, '');
INSERT INTO `exam_platform_const_config` VALUES ('college_grade', '中专', '3', 0, '2020-08-28 15:49:50', '2020-08-28 15:49:50', NULL, 14, '');
INSERT INTO `exam_platform_const_config` VALUES ('college_grade', '高中', '4', 0, '2020-08-28 15:49:59', '2020-08-28 15:49:59', NULL, 15, '');
INSERT INTO `exam_platform_const_config` VALUES ('college_grade', '职业高中', '5', 0, '2020-08-28 15:50:12', '2020-08-28 15:50:24', NULL, 16, '');
INSERT INTO `exam_platform_const_config` VALUES ('college_grade', '职业学院', '6', 0, '2020-08-28 15:51:25', '2020-08-28 15:51:25', NULL, 17, '');
INSERT INTO `exam_platform_const_config` VALUES ('college_grade', '大专', '7', 0, '2020-08-28 15:51:42', '2020-08-28 15:51:42', NULL, 18, '');
INSERT INTO `exam_platform_const_config` VALUES ('college_grade', '本科', '8', 0, '2020-08-28 15:51:54', '2020-08-28 15:51:54', NULL, 19, '');
INSERT INTO `exam_platform_const_config` VALUES ('college_grade', '研究生', '9', 0, '2020-08-28 15:52:05', '2020-08-28 15:52:05', NULL, 20, '');
INSERT INTO `exam_platform_const_config` VALUES ('college_grade', '博士', '10', 0, '2020-08-28 15:52:24', '2020-08-28 15:52:24', NULL, 21, '');
INSERT INTO `exam_platform_const_config` VALUES ('college_system', '四年制', '1', 0, '2020-08-28 15:54:23', '2020-08-28 15:54:23', NULL, 22, '');
INSERT INTO `exam_platform_const_config` VALUES ('college_system', '三年制', '2', 0, '2020-08-28 15:54:33', '2020-08-28 15:55:08', NULL, 23, '');
INSERT INTO `exam_platform_const_config` VALUES ('college_system', '五年制', '3', 0, '2020-08-28 15:54:42', '2020-08-28 15:55:16', NULL, 24, '');
INSERT INTO `exam_platform_const_config` VALUES ('college_system', '八年制', '4', 0, '2020-08-28 15:54:54', '2020-08-28 15:55:24', NULL, 25, '');
INSERT INTO `exam_platform_const_config` VALUES ('menu', '用户页面菜单', '2', 0, '2021-02-21 06:13:11', '2021-02-21 06:13:49', NULL, 26, '');
INSERT INTO `exam_platform_const_config` VALUES ('exam_search', '首页热搜', '2', 0, '2021-02-21 06:13:11', '2021-02-21 06:13:49', NULL, 27, '');
INSERT INTO `exam_platform_const_config` VALUES ('exam_search', '搜索列表页', '1', 0, '2021-02-21 06:13:11', '2021-02-21 06:13:49', NULL, 28, '');
INSERT INTO `exam_platform_const_config` VALUES ('document', '关于我们文章', '1', 0, '2021-03-13 22:33:39', '2021-03-13 22:33:39', NULL, 29, '');
COMMIT;

-- ----------------------------
-- Table structure for exam_platform_content
-- ----------------------------
DROP TABLE IF EXISTS `exam_platform_content`;
CREATE TABLE `exam_platform_content` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint(3) unsigned NOT NULL COMMENT '显示位置',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文章内容',
  `is_show` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示1是|2否',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `store_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='平台文章';

-- ----------------------------
-- Table structure for exam_platform_file
-- ----------------------------
DROP TABLE IF EXISTS `exam_platform_file`;
CREATE TABLE `exam_platform_file` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'uuid',
  `store_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商户uuid',
  `storage` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件存储引擎方式',
  `file_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件url',
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件name',
  `file_size` int(11) NOT NULL COMMENT '文件size',
  `file_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件type',
  `extension` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件扩展名',
  `is_show` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示1是|2否',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='平台文件';

-- ----------------------------
-- Records of exam_platform_file
-- ----------------------------
BEGIN;
INSERT INTO `exam_platform_file` VALUES (1, '7b510bd9-3780-fc42-420d-91739086494e', 'EDBCF840-47DA-A545-45E3-17E1EA4458D8', '', '', '1', 0, '', '', 1, '2021-05-05 17:26:45', '2021-05-05 17:26:45');
COMMIT;

-- ----------------------------
-- Table structure for exam_platform_file_group
-- ----------------------------
DROP TABLE IF EXISTS `exam_platform_file_group`;
CREATE TABLE `exam_platform_file_group` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'uuid',
  `title` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分组名称',
  `store_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商户uuid',
  `parent_uuid` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '上级分类',
  `is_show` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示1是|2否',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='平台文件组';

-- ----------------------------
-- Table structure for exam_platform_message_category
-- ----------------------------
DROP TABLE IF EXISTS `exam_platform_message_category`;
CREATE TABLE `exam_platform_message_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息名称',
  `cover` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '消息封面',
  `is_show` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示1是|2否',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `store_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='消息类型';

-- ----------------------------
-- Table structure for exam_platform_message_content
-- ----------------------------
DROP TABLE IF EXISTS `exam_platform_message_content`;
CREATE TABLE `exam_platform_message_content` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `platform_message_category_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息类型',
  `title` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息标题',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '消息内容',
  `is_show` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示1是|2否',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `store_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='消息内容';

-- ----------------------------
-- Table structure for exam_platform_message_history
-- ----------------------------
DROP TABLE IF EXISTS `exam_platform_message_history`;
CREATE TABLE `exam_platform_message_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `platform_message_content_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息id',
  `wechat_user_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `is_show` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示1是|2否',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `platform_message_category_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_content` (`platform_message_category_uuid`,`platform_message_content_uuid`,`wechat_user_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='消息阅读历史';

-- ----------------------------
-- Table structure for exam_platform_score
-- ----------------------------
DROP TABLE IF EXISTS `exam_platform_score`;
CREATE TABLE `exam_platform_score` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类型key',
  `score` decimal(5,2) NOT NULL COMMENT '积分',
  `is_show` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示1是|2否',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `store_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='积分配置';

-- ----------------------------
-- Table structure for exam_platform_setting
-- ----------------------------
DROP TABLE IF EXISTS `exam_platform_setting`;
CREATE TABLE `exam_platform_setting` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配置名称',
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配置类型',
  `values` json NOT NULL COMMENT '配置信息',
  `store_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商户uuid',
  `is_show` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示1是|2否',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='平台信息配置';

-- ----------------------------
-- Records of exam_platform_setting
-- ----------------------------
BEGIN;
INSERT INTO `exam_platform_setting` VALUES (1, 'cc2d482b-067a-1b8b-8bc7-121d9f880bbd', '1', 'images', '{\"app_key\": \"aaaaaa\", \"app_secret\": \"123sfd33\"}', 'EDBCF840-47DA-A545-45E3-17E1EA4458D8', 1, '2021-05-04 14:07:13', '2021-05-04 14:27:11', '2021-05-04 14:27:11');
INSERT INTO `exam_platform_setting` VALUES (2, '4b0884a6-b0bc-5a25-25b0-f64b241f0b05', '图片配置', 'images', '{\"app_key\": \"123123asdf\", \"app_secret\": \"123sfd33\"}', 'EDBCF840-47DA-A545-45E3-17E1EA4458D8', 1, '2021-05-04 14:09:41', '2021-05-04 14:09:41', NULL);
INSERT INTO `exam_platform_setting` VALUES (3, '6dec0d87-291d-bb14-146b-dd60764486ae', '1', 'images', '{\"app_key\": \"123123asdf\", \"app_secret\": \"123sfd33\"}', 'EDBCF840-47DA-A545-45E3-17E1EA4458D8', 1, '2021-05-04 14:12:10', '2021-05-04 14:12:10', NULL);
COMMIT;

-- ----------------------------
-- Table structure for exam_store_user
-- ----------------------------
DROP TABLE IF EXISTS `exam_store_user`;
CREATE TABLE `exam_store_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rand_slat` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mobile` (`mobile`) USING BTREE,
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商户';

-- ----------------------------
-- Records of exam_store_user
-- ----------------------------
BEGIN;
INSERT INTO `exam_store_user` VALUES (1, '123', NULL, NULL, '9cb31b4cb1de74146aaa4049b0900fed', NULL, '2021-04-29 13:42:45', '2021-04-29 13:42:45', NULL, 'CF616770-ACC7-AB68-687B-365C53F37A68', '18228937997', 'e4043fd0a1e7dd54c7598a95a87ebb1a', 'EDBCF840-47DA-A545-45E3-17E1EA4458D8');
COMMIT;

-- ----------------------------
-- Table structure for exam_tag
-- ----------------------------
DROP TABLE IF EXISTS `exam_tag`;
CREATE TABLE `exam_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'uuid',
  `title` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '知识点名称',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `is_show` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '修改时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  `store_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orders` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='知识点';

-- ----------------------------
-- Records of exam_tag
-- ----------------------------
BEGIN;
INSERT INTO `exam_tag` VALUES (1, 'B0EFB4B5-2756-42C7-C746-6434A2A3B845', '语文', '备注信息', 1, '2021-04-30 11:39:22', '2021-04-30 11:39:59', '2021-04-30 11:39:59', 'EDBCF840-47DA-A545-45E3-17E1EA4458D8', NULL, 1);
INSERT INTO `exam_tag` VALUES (2, '3BFD3D73-7375-8F25-2515-FAC46E298024', '高中语文', '备注信息', 1, '2021-04-30 11:39:40', '2021-04-30 11:39:59', '2021-04-30 11:39:59', 'EDBCF840-47DA-A545-45E3-17E1EA4458D8', 'B0EFB4B5-2756-42C7-C746-6434A2A3B845', 1);
INSERT INTO `exam_tag` VALUES (3, 'B5C1EF88-5AE5-84FC-FCD5-9850057102CD', '123er', '123', 1, '2021-05-02 20:10:43', '2021-05-02 20:10:43', NULL, '', NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for exam_user_feedback
-- ----------------------------
DROP TABLE IF EXISTS `exam_user_feedback`;
CREATE TABLE `exam_user_feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '返回内容',
  `user_id` int(10) unsigned NOT NULL COMMENT '留言用户id',
  `created_at` timestamp NOT NULL COMMENT '创建时间',
  `updated_at` timestamp NOT NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  `store_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `travel_user_feedback_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户反馈';

-- ----------------------------
-- Table structure for exam_user_score_history
-- ----------------------------
DROP TABLE IF EXISTS `exam_user_score_history`;
CREATE TABLE `exam_user_score_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(3) unsigned NOT NULL COMMENT '积分类型1增加|2减少',
  `key` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类型key',
  `score` decimal(5,2) NOT NULL COMMENT '积分',
  `wechat_user_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户uuid',
  `is_show` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示1是|2否',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `store_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户积分历史';

-- ----------------------------
-- Table structure for exam_user_sign_collection
-- ----------------------------
DROP TABLE IF EXISTS `exam_user_sign_collection`;
CREATE TABLE `exam_user_sign_collection` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wechat_user_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `sign_number` int(10) unsigned NOT NULL COMMENT '签到总天数',
  `is_show` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示1是|2否',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `store_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户签到汇总';

-- ----------------------------
-- Table structure for exam_user_sign_history
-- ----------------------------
DROP TABLE IF EXISTS `exam_user_sign_history`;
CREATE TABLE `exam_user_sign_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wechat_user_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户uuid',
  `sign_date` date NOT NULL COMMENT '签到日期',
  `is_show` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示1是|2否',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `store_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_u_d` (`wechat_user_uuid`,`sign_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户签到历史';

-- ----------------------------
-- Table structure for exam_wechat_user
-- ----------------------------
DROP TABLE IF EXISTS `exam_wechat_user`;
CREATE TABLE `exam_wechat_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `openid` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '微信openid(唯一标示)',
  `nickname` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '微信昵称',
  `avatar_url` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '微信头像',
  `gender` tinyint(3) unsigned DEFAULT '0' COMMENT '性别',
  `country` varchar(50) CHARACTER SET utf8 DEFAULT '' COMMENT '国家',
  `province` varchar(50) CHARACTER SET utf8 DEFAULT '' COMMENT '省份',
  `city` varchar(50) CHARACTER SET utf8 DEFAULT '' COMMENT '城市',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '是否删除',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `is_show` tinyint(3) unsigned DEFAULT '1' COMMENT '是否禁用1否2是',
  `uuid` char(36) CHARACTER SET utf8 NOT NULL,
  `language` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '语言',
  `real_name` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '真实姓名',
  `mobile` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '手机号',
  `address` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '真实地址',
  `longitude` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '经度',
  `latitude` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '纬度',
  `district` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '区',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `store_uuid` char(36) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户记录表';

SET FOREIGN_KEY_CHECKS = 1;

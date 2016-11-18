/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50634
Source Host           : localhost:3306
Source Database       : happy_help

Target Server Type    : MYSQL
Target Server Version : 50634
File Encoding         : 65001

Date: 2016-11-17 23:42:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for hh_show
-- ----------------------------
DROP TABLE IF EXISTS `hh_show`;
CREATE TABLE `hh_show` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mname` varchar(45) DEFAULT NULL,
  `image_url` varchar(300) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `mtype` varchar(45) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `is_use` tinyint(4) DEFAULT '0',
  `relate_url` varchar(450) DEFAULT NULL,
  `relate_article_title` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hh_show
-- ----------------------------
INSERT INTO `hh_show` VALUES ('1', '轮播图1', '/pic/Images/show/68bf4ccb-dea8-4d46-aa61-3b2df5dee7e3.jpg', '2016-10-10 14:37:52', 'loadingPic', '1', '1', 'https://zhuanlan.zhihu.com/https://zhuanlan.zhihu.com/p/23732778', 'Google 宣布加入 .NET 基金会');
INSERT INTO `hh_show` VALUES ('2', '轮播图2', '/pic/Images/show/5df674eb-1140-49fa-8e2c-0a5252901028.jpg', '2016-10-10 14:37:52', 'loadingPic', '2', '1', 'http://www.oschina.net/news/79092/nginx-1-11-6', 'Nginx 1.11.6 发布，高性能 Web 服务器');
INSERT INTO `hh_show` VALUES ('3', '轮播图3', '/pic/Images/show/6dc68c14-21b0-4b9b-ae47-4f50730ec115.jpg', '2016-11-15 15:31:06', 'loadingPic', '3', '1', 'http://www.oschina.net/news/79133/linux-new-flaw-to-get-root', 'Linux 爆新漏洞，长按回车 70 秒可获得 root 权限');

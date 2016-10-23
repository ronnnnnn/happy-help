-- MySQL dump 10.13  Distrib 5.7.12, for linux-glibc2.5 (x86_64)
--
-- Host: localhost    Database: happy_help
-- ------------------------------------------------------
-- Server version	5.7.15-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `hh_area_range`
--

DROP TABLE IF EXISTS `hh_area_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_area_range` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_range` varchar(100) DEFAULT NULL,
  `money` double DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_area_range`
--

LOCK TABLES `hh_area_range` WRITE;
/*!40000 ALTER TABLE `hh_area_range` DISABLE KEYS */;
/*!40000 ALTER TABLE `hh_area_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_article`
--

DROP TABLE IF EXISTS `hh_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `context` varchar(45) DEFAULT NULL,
  `image_url` varchar(450) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `visit_click` varchar(100) DEFAULT NULL,
  `is_checked` tinyint(1) DEFAULT '0',
  `is_deleted` tinyint(1) DEFAULT '0',
  `is_pass` varchar(45) DEFAULT NULL,
  `hh_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hh_article_hh_user1_idx` (`hh_user_id`),
  CONSTRAINT `fk_hh_article_hh_user1` FOREIGN KEY (`hh_user_id`) REFERENCES `hh_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_article`
--

LOCK TABLES `hh_article` WRITE;
/*!40000 ALTER TABLE `hh_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `hh_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_category`
--

DROP TABLE IF EXISTS `hh_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_category`
--

LOCK TABLES `hh_category` WRITE;
/*!40000 ALTER TABLE `hh_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `hh_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_comment`
--

DROP TABLE IF EXISTS `hh_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_comment` (
  `id` int(11) NOT NULL,
  `context` varchar(1000) DEFAULT NULL,
  `image_url` varchar(300) DEFAULT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `nick_name` varchar(45) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `type` varchar(45) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_comment`
--

LOCK TABLES `hh_comment` WRITE;
/*!40000 ALTER TABLE `hh_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `hh_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_help_contract`
--

DROP TABLE IF EXISTS `hh_help_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_help_contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT NULL,
  `hh_user_id` int(11) NOT NULL,
  `hh_help_info_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hh_help_contract_hh_user1_idx` (`hh_user_id`),
  KEY `fk_hh_help_contract_hh_help_info1_idx` (`hh_help_info_id`),
  CONSTRAINT `fk_hh_help_contract_hh_help_info1` FOREIGN KEY (`hh_help_info_id`) REFERENCES `hh_help_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hh_help_contract_hh_user1` FOREIGN KEY (`hh_user_id`) REFERENCES `hh_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_help_contract`
--

LOCK TABLES `hh_help_contract` WRITE;
/*!40000 ALTER TABLE `hh_help_contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `hh_help_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_help_info`
--

DROP TABLE IF EXISTS `hh_help_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_help_info` (
  `id` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `context` varchar(500) DEFAULT NULL,
  `image_url` varchar(300) DEFAULT NULL,
  `phome` varchar(50) DEFAULT NULL,
  `publish_area` varchar(100) DEFAULT NULL,
  `area_range` varchar(50) DEFAULT NULL,
  `hh_area_range_id` int(11) NOT NULL,
  `hh_user_id` int(11) NOT NULL,
  `need_user_number` int(11) DEFAULT NULL,
  `apply_user_ids` varchar(100) DEFAULT NULL,
  `use_user_ids` varchar(100) DEFAULT NULL,
  `compeleted_user_ids` varchar(45) DEFAULT NULL,
  `is_compeleted` tinyint(1) DEFAULT '0',
  `is_deleted` tinyint(1) DEFAULT '0',
  `hh_category_id` int(11) NOT NULL,
  `republish_times` int(11) DEFAULT '3',
  PRIMARY KEY (`id`),
  KEY `fk_hh_help_info_hh_area_range1_idx` (`hh_area_range_id`),
  KEY `fk_hh_help_info_hh_user1_idx` (`hh_user_id`),
  KEY `fk_hh_help_info_hh_category1_idx` (`hh_category_id`),
  CONSTRAINT `fk_hh_help_info_hh_area_range1` FOREIGN KEY (`hh_area_range_id`) REFERENCES `hh_area_range` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hh_help_info_hh_category1` FOREIGN KEY (`hh_category_id`) REFERENCES `hh_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hh_help_info_hh_user1` FOREIGN KEY (`hh_user_id`) REFERENCES `hh_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_help_info`
--

LOCK TABLES `hh_help_info` WRITE;
/*!40000 ALTER TABLE `hh_help_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `hh_help_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_judge_record`
--

DROP TABLE IF EXISTS `hh_judge_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_judge_record` (
  `id` int(11) NOT NULL,
  `help_info_id` varchar(45) DEFAULT NULL,
  `require_user_id` varchar(45) DEFAULT NULL,
  `server_user_id` varchar(100) DEFAULT NULL,
  `score` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_judge_record`
--

LOCK TABLES `hh_judge_record` WRITE;
/*!40000 ALTER TABLE `hh_judge_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `hh_judge_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_message`
--

DROP TABLE IF EXISTS `hh_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_message` (
  `id` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `message` varchar(45) DEFAULT NULL,
  `callback_regid` varchar(45) DEFAULT NULL,
  `callback_alias` varchar(45) DEFAULT NULL,
  `callback_topic` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_message`
--

LOCK TABLES `hh_message` WRITE;
/*!40000 ALTER TABLE `hh_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `hh_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_prize`
--

DROP TABLE IF EXISTS `hh_prize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_prize` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prize_num` varchar(45) DEFAULT NULL,
  `prize_money` double DEFAULT NULL,
  `user_names` varchar(45) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_prize`
--

LOCK TABLES `hh_prize` WRITE;
/*!40000 ALTER TABLE `hh_prize` DISABLE KEYS */;
/*!40000 ALTER TABLE `hh_prize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_resource`
--

DROP TABLE IF EXISTS `hh_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mname` varchar(45) DEFAULT NULL,
  `mtype` varchar(45) DEFAULT NULL,
  `priority` varchar(45) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `parent_ids` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `permission` varchar(100) DEFAULT NULL,
  `is_available` int(1) DEFAULT '1',
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_resource`
--

LOCK TABLES `hh_resource` WRITE;
/*!40000 ALTER TABLE `hh_resource` DISABLE KEYS */;
INSERT INTO `hh_resource` VALUES (1,'资源','menu','',0,'0/','',1,''),(40,'用户资源管理','menu','',1,'0/1/','',1,''),(41,'管理员管理','menu',' ',40,'0/1/40/','superuser:*',1,'/user/superuser/list'),(42,'管理员新增','button',' ',41,'0/1/40/41','superuser:create',1,' '),(43,'管理员修改','button',' ',41,'0/1/40/41','superuser:update',1,' '),(44,'管理员删除','button',' ',41,'0/1/40/41','superuser:delete',1,' '),(45,'管理员查看','button',' ',41,'0/1/40/41','superuser:view',1,' '),(50,'用户管理','menu','',40,'0/1/40','user:*',1,'/user/normaluser/list'),(51,'用户新增','button','',50,'0/1/40/50/','user:create',1,''),(52,'用户修改','button','',50,'0/1/40/50/','user:update',1,''),(53,'用户删除','button','',50,'0/1/40/50/','user:delete',1,''),(54,'用户查看','button','',50,'0/1/40/50/','user:view',1,''),(55,'资源管理','menu','',40,'0/1/40/','resource:*',1,'/resources'),(56,'资源新增','button','',55,'0/1/40/55/','resource:create',1,''),(57,'资源修改','button','',55,'0/1/40/55/','resource:update',1,''),(58,'资源删除','button','',55,'0/1/40/55/','resource:delete',1,''),(59,'资源查看','button','',55,'0/1/40/55/','resource:view',1,''),(60,'角色管理','menu','',40,'0/1/40/','role:*',1,'/role'),(61,'角色新增','button','',60,'0/1/40/60/','role:create',1,''),(62,'角色修改','button','',60,'0/1/40/60/','role:update',1,''),(63,'角色删除','button','',60,'0/1/40/60/','role:delete',1,''),(64,'角色查看','button','',60,'0/1/40/60/','role:view',1,''),(65,'排名管理','menu','',1,'0/1/','',1,''),(66,'荣誉值排名','menu','',65,'0/1/65/','honer:*',1,'/user/rank/honer'),(68,'查看荣誉值','button','',66,'0/1/65/66/','honer:view',1,''),(69,'修改荣誉值','button','',66,'0/1/65/66/','honer:update',1,''),(70,'设置中奖人','button','',66,'0/1/65/66/','honer:prize',1,''),(71,'设置随机中奖','button','',66,'0/1/65/66/','honer:ramdom',1,''),(72,'贡献值排名','menu','',65,'0/1/65/','contribute:*',1,'/user/rank/contribute'),(73,'预留1','button','',72,'0/1/65/72/','',1,''),(74,'预留2','button','',72,'0/1/65/72/','',1,''),(75,'预留3','button','',72,'0/1/65/72/','',1,''),(76,'预留4','button','',72,'0/1/65/72/','',1,''),(78,'系统设置','menu','',1,'0/1/','',1,''),(79,'图片管理','menu','',78,'0/1/78/','',1,'/show/list/panel');
/*!40000 ALTER TABLE `hh_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_role`
--

DROP TABLE IF EXISTS `hh_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `resource_ids` varchar(45) DEFAULT NULL,
  `is_available` int(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_role`
--

LOCK TABLES `hh_role` WRITE;
/*!40000 ALTER TABLE `hh_role` DISABLE KEYS */;
INSERT INTO `hh_role` VALUES (1,'admin','超级管理员','41,50,55,60,66,72',1),(2,'normal','普通用户','0',1),(3,'test','水电费','41,50,55,60',1),(4,'test2','呃呃呃','41,55',1);
/*!40000 ALTER TABLE `hh_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_role_resource`
--

DROP TABLE IF EXISTS `hh_role_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_role_resource` (
  `hh_role_id` int(11) NOT NULL,
  `hh_resource_id` int(11) NOT NULL,
  PRIMARY KEY (`hh_role_id`,`hh_resource_id`),
  KEY `fk_hh_role_resource_hh_resource1_idx` (`hh_resource_id`),
  CONSTRAINT `fk_hh_role_resource_hh_resource1` FOREIGN KEY (`hh_resource_id`) REFERENCES `hh_resource` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hh_role_resource_hh_role1` FOREIGN KEY (`hh_role_id`) REFERENCES `hh_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_role_resource`
--

LOCK TABLES `hh_role_resource` WRITE;
/*!40000 ALTER TABLE `hh_role_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `hh_role_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_server_contract`
--

DROP TABLE IF EXISTS `hh_server_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_server_contract` (
  `id` int(11) NOT NULL,
  `detail` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `hh_server_info_id` int(11) NOT NULL,
  `hh_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hh_server_contract_hh_server_info1_idx` (`hh_server_info_id`),
  KEY `fk_hh_server_contract_hh_user1_idx` (`hh_user_id`),
  CONSTRAINT `fk_hh_server_contract_hh_server_info1` FOREIGN KEY (`hh_server_info_id`) REFERENCES `hh_server_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hh_server_contract_hh_user1` FOREIGN KEY (`hh_user_id`) REFERENCES `hh_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_server_contract`
--

LOCK TABLES `hh_server_contract` WRITE;
/*!40000 ALTER TABLE `hh_server_contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `hh_server_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_server_info`
--

DROP TABLE IF EXISTS `hh_server_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_server_info` (
  `id` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `context` varchar(500) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `area` varchar(45) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `hh_user_id` int(11) NOT NULL,
  `is_pass` tinyint(1) DEFAULT '0',
  `is_deleted` tinyint(1) DEFAULT '0',
  `hh_category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hh_suport_server_info_hh_user1_idx` (`hh_user_id`),
  KEY `fk_hh_server_info_hh_category1_idx` (`hh_category_id`),
  CONSTRAINT `fk_hh_server_info_hh_category1` FOREIGN KEY (`hh_category_id`) REFERENCES `hh_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hh_suport_server_info_hh_user1` FOREIGN KEY (`hh_user_id`) REFERENCES `hh_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_server_info`
--

LOCK TABLES `hh_server_info` WRITE;
/*!40000 ALTER TABLE `hh_server_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `hh_server_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_show`
--

DROP TABLE IF EXISTS `hh_show`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_show` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mname` varchar(45) DEFAULT NULL,
  `image_url` varchar(300) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `mtype` varchar(45) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `is_use` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_show`
--

LOCK TABLES `hh_show` WRITE;
/*!40000 ALTER TABLE `hh_show` DISABLE KEYS */;
INSERT INTO `hh_show` VALUES (1,'test','tse','2016-10-10 14:37:52','asd',1,0),(2,'sdfsdf','sdf','2016-10-10 14:37:52','asd',2,0),(3,'是的发送到','ssdf','2016-10-10 14:37:52','阿萨德',3,0),(4,'请问','/home/ron/Documents/happy-help/target/happy-help/../..//productImages//bd2ad2f3-d392-4a01-a761-e1abf51c7707.jpg',NULL,'驱蚊器',2,1),(5,'请问','/home/ron/Documents/happy-help/target/happy-help/../..//productImages//bd2ad2f3-d392-4a01-a761-e1abf51c7707.jpg',NULL,'驱蚊器',2,1),(6,'请问','/home/ron/Documents/happy-help/target/happy-help/../..//productImages//bd2ad2f3-d392-4a01-a761-e1abf51c7707.jpg',NULL,'驱蚊器',2,1),(7,'请问','/home/ron/Documents/happy-help/target/happy-help/../..//productImages//bd2ad2f3-d392-4a01-a761-e1abf51c7707.jpg',NULL,'驱蚊器',2,1),(8,'史蒂芬孙','/home/ron/Documents/happy-help/target/happy-help/../..//productImages//aeddf6ec-6f6b-414e-a54a-d682cf6a6bc0.jpg',NULL,'324',2,0),(9,'水电费','42ebeba5-3dce-4c00-a860-50374df53dee.jpg','2016-10-22 21:41:02','沃尔沃',3,0);
/*!40000 ALTER TABLE `hh_show` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_system_setting`
--

DROP TABLE IF EXISTS `hh_system_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_system_setting` (
  `id` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `value` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_system_setting`
--

LOCK TABLES `hh_system_setting` WRITE;
/*!40000 ALTER TABLE `hh_system_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `hh_system_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_task_comment`
--

DROP TABLE IF EXISTS `hh_task_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_task_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `context` varchar(45) DEFAULT NULL,
  `hh_task_info_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_nickname` varchar(45) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hh_talk_message_hh_task_info1_idx` (`hh_task_info_id`),
  CONSTRAINT `fk_hh_talk_message_hh_task_info1` FOREIGN KEY (`hh_task_info_id`) REFERENCES `hh_task_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_task_comment`
--

LOCK TABLES `hh_task_comment` WRITE;
/*!40000 ALTER TABLE `hh_task_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `hh_task_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_task_comment2`
--

DROP TABLE IF EXISTS `hh_task_comment2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_task_comment2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_user_id` int(11) DEFAULT NULL,
  `child_user_id` int(11) DEFAULT NULL,
  `context` varchar(45) DEFAULT NULL,
  `hh_task_info_id` varchar(45) DEFAULT NULL,
  `hh_task_comment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hh_task_comment2_hh_task_comment1_idx` (`hh_task_comment_id`),
  CONSTRAINT `fk_hh_task_comment2_hh_task_comment1` FOREIGN KEY (`hh_task_comment_id`) REFERENCES `hh_task_comment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_task_comment2`
--

LOCK TABLES `hh_task_comment2` WRITE;
/*!40000 ALTER TABLE `hh_task_comment2` DISABLE KEYS */;
/*!40000 ALTER TABLE `hh_task_comment2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_task_contract`
--

DROP TABLE IF EXISTS `hh_task_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_task_contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT NULL,
  `money` varchar(45) DEFAULT NULL,
  `hh_task_info_id` int(11) NOT NULL,
  `talk_times` int(11) DEFAULT NULL,
  `hh_user_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hh_task_contract_hh_task_info1_idx` (`hh_task_info_id`),
  KEY `fk_hh_task_contract_hh_user1_idx` (`hh_user_id`),
  CONSTRAINT `fk_hh_task_contract_hh_task_info1` FOREIGN KEY (`hh_task_info_id`) REFERENCES `hh_task_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hh_task_contract_hh_user1` FOREIGN KEY (`hh_user_id`) REFERENCES `hh_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_task_contract`
--

LOCK TABLES `hh_task_contract` WRITE;
/*!40000 ALTER TABLE `hh_task_contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `hh_task_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_task_info`
--

DROP TABLE IF EXISTS `hh_task_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_task_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `context` varchar(500) DEFAULT NULL,
  `image_url` varchar(300) DEFAULT NULL,
  `money` double DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `end_time` varchar(45) DEFAULT NULL,
  `is_free` tinyint(1) DEFAULT '1',
  `is_accept` tinyint(1) DEFAULT '0',
  `is_top` tinyint(1) DEFAULT '0',
  `is_compeleted` tinyint(1) DEFAULT '0',
  `is_deleted` tinyint(1) DEFAULT '0',
  `area` varchar(45) DEFAULT NULL,
  `hh_category_id` int(11) NOT NULL,
  `hh_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hh_message_hh_category1_idx` (`hh_category_id`),
  KEY `fk_hh_message_hh_user1_idx` (`hh_user_id`),
  CONSTRAINT `fk_hh_message_hh_category1` FOREIGN KEY (`hh_category_id`) REFERENCES `hh_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hh_message_hh_user1` FOREIGN KEY (`hh_user_id`) REFERENCES `hh_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_task_info`
--

LOCK TABLES `hh_task_info` WRITE;
/*!40000 ALTER TABLE `hh_task_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `hh_task_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_user`
--

DROP TABLE IF EXISTS `hh_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `salt` varchar(50) NOT NULL,
  `is_locked` tinyint(1) DEFAULT '0',
  `role_ids` varchar(45) DEFAULT '2',
  `organization` varchar(45) DEFAULT NULL,
  `nickname` varchar(45) DEFAULT NULL,
  `real_name` varchar(45) DEFAULT NULL,
  `user_identify` varchar(100) DEFAULT NULL,
  `current_area` varchar(45) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  `is_new` tinyint(1) DEFAULT '1',
  `create_time` datetime DEFAULT NULL,
  `account` double DEFAULT NULL,
  `contribute_score` double DEFAULT NULL,
  `honer_score` double DEFAULT NULL,
  `grade_total` varchar(45) DEFAULT NULL,
  `grade_times` int(11) DEFAULT NULL,
  `withdraw_account` varchar(100) DEFAULT NULL,
  `wirhdraw_accont_type` varchar(45) DEFAULT NULL,
  `regId` varchar(45) DEFAULT NULL,
  `alias` varchar(45) DEFAULT NULL,
  `topic` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `province` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `area` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_user`
--

LOCK TABLES `hh_user` WRITE;
/*!40000 ALTER TABLE `hh_user` DISABLE KEYS */;
INSERT INTO `hh_user` VALUES (1,'admin','12345678901','d3c59d25033dbf980d29554025c23a75','8d78869f470951332959580424d4bf4f',0,'1,2,3',NULL,'san','张三','123456789009877654',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'1','1','53ea4fe818098d74c87a6fa4884c4ebd','6007b927c1fc7ecc747f860ceed897ed',0,'1',NULL,NULL,'1','1',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'2','2','918de6877666153c2f429b868b8a8163','d31382211bcab0d013d6209e78c3f76a',0,'1',NULL,NULL,'2','2',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'3','3','d698aa30530af381a82ce34332996ee5','12ae991ac129fb7683f86f2158b25763',0,'1',NULL,NULL,'3222','3',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'4','4','ac64868c8d9ce37fae3ff057ef89e4c0','9cbcc0b6592b9a0a247925eade93dc49',0,'1',NULL,NULL,'4','4',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'5','5','b1bba3b073c062ca3af5ba8c4bc9b8c2','f5e718ee6a98b87c79dce45e64a5ca61',0,'1',NULL,NULL,'552','5',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'6','6','0b85021e22c2d3d8b5734d539add88c3','a3268a17cd029b8de1c613ec510f85fe',0,'2',NULL,'6','6','6',NULL,0,1,NULL,NULL,6,9,'9',9,'9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'7','7','8d3e12385d943b0e5575feed472a29e9','9037ad6899d8650c63d86b4bda54e652',0,'2',NULL,'7','7','7',NULL,0,1,NULL,NULL,7,9,'9',9,'9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'8','8','d3c59d25033dbf980d29554025c23a75','8d78869f470951332959580424d4bf4f',0,'2',NULL,'8','8','8',NULL,0,1,NULL,NULL,8,9,'9',9,'9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'9','9','912ff0c3c0cdd5e9ed23fff35991e3cd','18ee76bb39a55cb24b6242a0c96db597',0,'2',NULL,'9','9','9','9',0,1,NULL,NULL,9,9,'9',9,'9111',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'10','10','d3c59d25033dbf980d29554025c23a75','8d78869f470951332959580424d4bf4f',0,'2',NULL,'10','10','10',NULL,0,1,NULL,NULL,9,9,'9',9,'9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'qwe123qwe','12312312312','e5ce8cc8181c877e5d44a88be8a7c845','18fffee607f3f8b16bfd6c6ec328d669',0,'2',NULL,'123','asd','9','爱仕达多',0,1,NULL,NULL,0,0,'0',0,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'qwet1','12312312310','a09ab74baa8ccb2b67007afff7187acc','61ff3008cdb3df40b7d792e909284e2d',0,'2',NULL,'11q','爱的','9','阿萨德',0,1,NULL,NULL,1,1,'1',1,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'asdf12','123123132222','e0a704c3049b30718c4576eebe1af388','41a1fc2d8d33cc0c4c8ab7f23080c321',0,'2',NULL,'qwe','123','8','qe',0,1,NULL,NULL,1,1,'11',1,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'asdf12w','12312313222221','9794eeb17b076358d0b275af991d30fb','2868351f48f7ae71cf16091d23d06c1d',0,'2',NULL,'qwe','1233333','undefined','qe',0,1,NULL,NULL,1,1,'11',1,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'asdf12w1','123123132222212','afbf49c571b88bd684c03319452ccf2d','6f168dd62b75371c215d2c6b7a8b9d79',0,'2',NULL,'qwe','123q','undefined','qe',0,1,NULL,NULL,1,1,'11',1,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,'1231','123123','e1e34f96c75e5f92f7acee99b75534cc','c2173111727625a5ecf1566129b5c763',0,'1',NULL,NULL,'3','3',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,'234','12312222','04f4056cc6b539541c6283c29b8eaa97','5e1ffc1f8235d9e961ddec6504a89440',0,'1',NULL,NULL,'2','21',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,'1222222','222211111','35351fe8f37660f4c53c7f27a7362afa','e513e355dadbc3a8bcbe4faa569b8a37',0,'1',NULL,NULL,'221q','22',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,'333332222','2122211','9c12240963d1e2915df56641afbf7f5a','fec68ed77691a3ea26b110961edfe7a7',0,'2',NULL,'2','2','2','2',0,1,NULL,NULL,1,1,'1',1,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,'weqw22','1233222111','f0b61cc89212f1059883699adaecdeeb','8885cd761d502ca4257e578e72d9040b',1,'2',NULL,'123','123','123','123',0,1,NULL,NULL,12,12,'1',1,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `hh_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_user_click`
--

DROP TABLE IF EXISTS `hh_user_click`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_user_click` (
  `id` int(11) NOT NULL,
  `user_id` varchar(45) DEFAULT NULL,
  `hh_article_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hh_user_click_hh_article1_idx` (`hh_article_id`),
  CONSTRAINT `fk_hh_user_click_hh_article1` FOREIGN KEY (`hh_article_id`) REFERENCES `hh_article` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_user_click`
--

LOCK TABLES `hh_user_click` WRITE;
/*!40000 ALTER TABLE `hh_user_click` DISABLE KEYS */;
/*!40000 ALTER TABLE `hh_user_click` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_user_role`
--

DROP TABLE IF EXISTS `hh_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_user_role` (
  `hh_user_id` int(11) NOT NULL,
  `hh_role_id` int(11) NOT NULL,
  PRIMARY KEY (`hh_user_id`,`hh_role_id`),
  KEY `fk_hh_user_role_hh_role1_idx` (`hh_role_id`),
  CONSTRAINT `fk_hh_user_role_hh_role1` FOREIGN KEY (`hh_role_id`) REFERENCES `hh_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hh_user_role_hh_user` FOREIGN KEY (`hh_user_id`) REFERENCES `hh_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_user_role`
--

LOCK TABLES `hh_user_role` WRITE;
/*!40000 ALTER TABLE `hh_user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `hh_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-23 10:14:10

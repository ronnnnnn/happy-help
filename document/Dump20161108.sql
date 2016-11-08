-- MySQL dump 10.13  Distrib 5.7.12, for linux-glibc2.5 (x86_64)
--
-- Host: localhost    Database: happy_help
-- ------------------------------------------------------
-- Server version	5.7.16-0ubuntu0.16.04.1

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
  `visit_click` varchar(300) DEFAULT NULL,
  `is_checked` tinyint(1) DEFAULT '0',
  `is_deleted` tinyint(1) DEFAULT '0',
  `is_pass` tinyint(4) DEFAULT '0',
  `hh_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_article`
--

LOCK TABLES `hh_article` WRITE;
/*!40000 ALTER TABLE `hh_article` DISABLE KEYS */;
INSERT INTO `hh_article` VALUES (12,'test22','ddddddddddddtsfsdf','/pic/Images/article/2c36c529-33e5-40ad-bb8d-4b87b72fcd55.jpg','2016-10-23 10:20:32','1,2,3',0,0,1,20);
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
  `category_name` varchar(100) DEFAULT NULL,
  `category_code` varchar(45) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `parent_ids` varchar(45) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_category`
--

LOCK TABLES `hh_category` WRITE;
/*!40000 ALTER TABLE `hh_category` DISABLE KEYS */;
INSERT INTO `hh_category` VALUES (1,'类别','0',0,'0/',1,'demo'),(2,'一级子类别','01',1,'0/1/',2,'demo'),(3,'二级子类别','011',2,'0/1/2/',3,'demo'),(4,'三级子1','0111',3,'0/1/2/3/',4,'demo'),(5,'三级子类别2','0112',3,'0/1/2/3/',5,'demo'),(7,'test','1',1,'0/1/',2,'2二'),(8,'test2','2',1,'0/1/',22,'水电费');
/*!40000 ALTER TABLE `hh_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_comment`
--

DROP TABLE IF EXISTS `hh_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `context` varchar(1000) DEFAULT NULL,
  `image_url` varchar(300) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `type` varchar(45) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `hh_user_id` int(11) DEFAULT NULL,
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `context` varchar(500) DEFAULT NULL,
  `image_url` varchar(300) DEFAULT NULL,
  `phome` varchar(50) DEFAULT NULL,
  `area_range` varchar(50) DEFAULT NULL,
  `hh_area_range_id` int(11) NOT NULL DEFAULT '0',
  `hh_user_id` int(11) NOT NULL,
  `need_user_number` int(11) DEFAULT NULL,
  `apply_user_ids` varchar(100) DEFAULT NULL,
  `use_user_ids` varchar(100) DEFAULT NULL,
  `compeleted_user_ids` varchar(45) DEFAULT NULL,
  `is_compeleted` tinyint(1) DEFAULT '0',
  `is_deleted` tinyint(1) DEFAULT '0',
  `hh_category_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `detail_position` varchar(300) DEFAULT NULL,
  `republish_times` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_hh_help_info_hh_user1_idx` (`hh_user_id`),
  KEY `fk_hh_help_info_hh_category1_idx` (`hh_category_id`),
  CONSTRAINT `fk_hh_help_info_hh_category1` FOREIGN KEY (`hh_category_id`) REFERENCES `hh_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hh_help_info_hh_user1` FOREIGN KEY (`hh_user_id`) REFERENCES `hh_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_help_info`
--

LOCK TABLES `hh_help_info` WRITE;
/*!40000 ALTER TABLE `hh_help_info` DISABLE KEYS */;
INSERT INTO `hh_help_info` VALUES (1,'title','thisiscontext','url','12345678901','全国',0,20,5,NULL,NULL,NULL,0,0,7,'2016-10-10 14:37:52','c','p','c','a','s','d',0),(2,'title','thisiscontext','url','12345678901','全国',0,20,5,NULL,NULL,NULL,0,0,7,'2016-10-10 14:37:52','c','p','c','a','s','d',0),(3,'title','thisiscontext','url','12345678901','全国',0,20,5,NULL,NULL,NULL,0,0,7,'2016-10-10 14:37:52','c','p','c','a','s','d',0),(4,'title','thisiscontext','url','12345678901','全国',0,20,5,NULL,NULL,NULL,0,0,7,'2016-10-10 14:37:52','c','p','c','a','s','d',0),(5,'title','thisiscontext','url','12345678901','全国',0,20,5,NULL,NULL,NULL,0,0,7,'2016-10-10 14:37:52','c','p','c','a','s','d',0),(6,'title','thisiscontext','url','12345678901','全国',0,20,5,NULL,NULL,NULL,0,0,7,'2016-10-10 14:37:52','c','p','c','a','s','d',0),(7,'title','thisiscontext','url','12345678901','全国',0,20,5,NULL,NULL,NULL,0,0,7,'2016-10-10 14:37:52','c','p','c','a','s','d',0),(9,'title','thisiscontext','url','12345678901','全国',0,20,5,NULL,NULL,NULL,0,0,7,'2016-10-10 14:37:52','c','p','c','a','s','d',0),(10,'title','thisiscontext','url','12345678901','全国',0,20,5,NULL,NULL,NULL,0,0,7,'2016-10-10 14:37:52','c','p','c','a','s','d',0),(12,'45',NULL,NULL,NULL,NULL,0,20,NULL,NULL,'9',NULL,0,0,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0);
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
  `user_ids` varchar(45) DEFAULT NULL,
  `user_names` varchar(45) DEFAULT NULL,
  `hh_phones` varchar(45) DEFAULT NULL,
  `is_lottery` tinyint(4) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_prize`
--

LOCK TABLES `hh_prize` WRITE;
/*!40000 ALTER TABLE `hh_prize` DISABLE KEYS */;
INSERT INTO `hh_prize` VALUES (1,'20161024',10000,'19,16','10,7','10,7',1,'2016-10-24 10:55:34'),(2,'20161025',10000,NULL,NULL,NULL,1,'2016-10-24 10:55:34'),(3,'20161026',10000,NULL,NULL,NULL,1,'2016-10-24 10:55:34'),(4,'12312315',23123,NULL,NULL,NULL,1,'2016-10-24 10:55:34'),(5,'23424234',2343,NULL,NULL,NULL,1,'2016-10-24 10:55:34'),(8,'1231233',123123,NULL,NULL,NULL,1,'2016-10-24 22:13:23'),(9,'20161026',10000,'20','qwe123qwe','12312312312',0,'2016-10-26 15:43:51');
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
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_resource`
--

LOCK TABLES `hh_resource` WRITE;
/*!40000 ALTER TABLE `hh_resource` DISABLE KEYS */;
INSERT INTO `hh_resource` VALUES (1,'资源','menu','0',0,'0/','',1,''),(40,'用户资源管理','menu','01',1,'0/1/','',1,''),(41,'管理员管理','menu','0101',40,'0/1/40/','superuser:*',1,'/user/superuser/list'),(42,'管理员新增','button','010101',41,'0/1/40/41','superuser:create',1,' '),(43,'管理员修改','button','010102',41,'0/1/40/41','superuser:update',1,' '),(44,'管理员删除','button','010103',41,'0/1/40/41','superuser:delete',1,' '),(45,'管理员查看','button','010104',41,'0/1/40/41','superuser:view',1,' '),(50,'用户管理','menu','0102',40,'0/1/40','user:*',1,'/user/normaluser/list'),(51,'用户新增','button','010201',50,'0/1/40/50/','user:create',1,''),(52,'用户修改','button','010202',50,'0/1/40/50/','user:update',1,''),(53,'用户删除','button','010203',50,'0/1/40/50/','user:delete',1,''),(54,'用户查看','button','010204',50,'0/1/40/50/','user:view',1,''),(55,'资源管理','menu','0103',40,'0/1/40/','resource:*',1,'/resources'),(56,'资源新增','button','010301',55,'0/1/40/55/','resource:create',1,''),(57,'资源修改','button','010302',55,'0/1/40/55/','resource:update',1,''),(58,'资源删除','button','010303',55,'0/1/40/55/','resource:delete',1,''),(59,'资源查看','button','010304',55,'0/1/40/55/','resource:view',1,''),(60,'角色管理','menu','0104',40,'0/1/40/','role:*',1,'/role'),(61,'角色新增','button','010401',60,'0/1/40/60/','role:create',1,''),(62,'角色修改','button','010402',60,'0/1/40/60/','role:update',1,''),(63,'角色删除','button','010403',60,'0/1/40/60/','role:delete',1,''),(64,'角色查看','button','010404',60,'0/1/40/60/','role:view',1,''),(65,'排名管理','menu','02',1,'0/1/','',1,''),(66,'荣誉值排名','menu','0201',65,'0/1/65/','honer:*',1,'/user/rank/honer'),(68,'查看荣誉值','button','020101',66,'0/1/65/66/','honer:view',1,''),(69,'修改荣誉值','button','020102',66,'0/1/65/66/','honer:update',1,''),(70,'设置中奖人','button','020103',66,'0/1/65/66/','honer:prize',1,''),(71,'设置随机中奖','button','020104',66,'0/1/65/66/','honer:ramdom',1,''),(72,'贡献值排名','menu','0202',65,'0/1/65/','contribute:*',1,'/user/rank/contribute'),(73,'查看贡献值排名','button','020201',72,'0/1/65/72/','contribute:view',1,''),(74,'修改贡献值','button','020202',72,'0/1/65/72/','contribute:update',1,''),(78,'系统设置','menu','09',1,'0/1/','',1,''),(79,'图片设置','menu','0901',78,'0/1/78/','show:*',1,'/show/list/panel'),(80,'查看图片','button','090101',79,'0/1/78/79/','show:view',1,''),(81,'添加图片','button','090102',79,'0/1/78/79/','show:create',1,''),(82,'修改图片','button','090103',79,'0/1/78/79/','show:update',1,''),(83,'删除图片','button','090104',79,'0/1/78/79/','show:delete',1,''),(84,'属性设置','menu','0902',78,'0/1/78/','property:*',1,'/setting/list-panel'),(85,'添加属性','button','090201',84,'0/1/78/84/','property:create',1,''),(86,'修改属性','button','090202',84,'0/1/78/84/','property:update',1,''),(87,'删除属性','button','090203',84,'0/1/78/84/','property:delete',1,''),(88,'查看属性','button','090204',84,'0/1/78/84/','property:view',1,''),(89,'开奖管理','menu','03',1,'0/1/','',1,''),(90,'开奖记录','menu','0301',89,'0/1/89/','prize:*',1,'/prize/list-panel'),(92,'查看开奖记录','button','030101',90,'0/1/89/90/','prize:view',1,''),(93,'删除未开奖记录','button','030102',90,'0/1/89/90/','prize:delete',1,''),(94,'修改未开奖记录','button','030103',90,'0/1/89/90/','prize:update',1,''),(95,'增加开奖记录','button','030104',90,'0/1/89/90/','prize:create',1,''),(98,'类别管理','menu','04',1,'0/1/','',1,''),(99,'类别维护','menu','0401',98,'0/1/98/','category:*',1,'/category/list-panel'),(101,'添加类别','button','040101',99,'0/1/98/99/','category:create',1,''),(102,'删除类别','button','040102',99,'0/1/98/99/','category:delete',1,''),(103,'修改类别','button','040103',99,'0/1/98/99/','category:update',1,''),(104,'查看类别','button','040104',99,'0/1/98/99/','category:view',1,''),(105,'好人好事文章管理','menu','05',1,'0/1/','',1,''),(106,'文章管理','menu','0501',105,'0/1/105/','article:*',1,'/article/list-panel'),(107,'添加文章','button','050101',106,'0/1/105/106/','article:create',1,''),(108,'删除文章','button','050102',106,'0/1/105/106/','article:delete',1,''),(109,'修改文章','button','050103',106,'0/1/105/106/','article:update',1,''),(110,'查看文章','button','050104',106,'0/1/105/106/','article:view',1,''),(111,'评论管理','menu','050105',106,'0/1/105/106/','comment:*',1,''),(112,'添加评论','button','05010501',111,'0/1/105/106/111/','comment:create',1,''),(113,'删除评论','button','05010502',111,'0/1/105/106/111/','comment:delete',1,''),(114,'修改评论','button','05010503',111,'0/1/105/106/111/','comment:update',1,''),(115,'查','button','05010504',111,'0/1/105/106/111/','comment:view',1,''),(116,'普通求助消息管理','menu','06',1,'0/1/',NULL,1,NULL),(117,'求助消息管理','menu','0601',116,'0/1/116/','task:*',1,'/taskinfo/list-panel'),(118,'紧急求助消息管理','menu','07',1,'0/1/','',1,''),(119,'紧急消息管理','menu','0701',118,'0/1/118/','help:*',1,'/helpInfo/list-panel'),(120,'公共服务管理','menu','08',1,'0/1/','',1,''),(121,'服务信息管理','menu','0801',120,'0/1/120/','server:*',1,'/serverInfo/list-panel'),(122,'增加普通求助消息','button','060101',117,'0/1/116/117/','task:create',1,''),(123,'删除普通求助消息','button','060102',117,'0/1/116/117/','task:delete',1,''),(124,'改动普通求助消息','button','060103',117,'0/1/116/117/','task:update',1,''),(125,'查找普通求助消息','button','060104',117,'0/1/116/117/','task:view',1,''),(126,'增加紧急求助消息','button','070101',119,'0/1/118/119/','help:create',1,''),(127,'删除紧急求助消息','button','070102',119,'0/1/118/119/','help:delete',1,''),(128,'改动紧急求助消息','button','070103',119,'0/1/118/119/','help:update',1,''),(129,'查找紧急求助消息','button','070104',119,'0/1/118/119/','help:view',1,''),(130,'增加服务信息','button','080101',121,'0/1/120/121/','server:create',1,''),(131,'删除服务信息','button','080102',121,'0/1/120/121/','server:delete',1,''),(132,'改动服务信息','button','080103',121,'0/1/120/121/','server:update',1,''),(133,'查找服务信息','button','080104',121,'0/1/120/121/','server:view',1,''),(135,'求助消息评论管理','menu','060105',117,'0/1/116/117/','taskComment:*',1,''),(136,'添加求助评论','button','06010501',135,'0/1/116/117/135/','taskComment:create',1,''),(137,'删除求助评论消息','button','06010502',135,'0/1/116/117/135/','taskComment:delete',1,''),(138,'修改求助评论消息','button','06010503',135,'0/1/116/117/135/','taskComment:update',1,''),(139,'删除求助消息评论','button','06010504',135,'0/1/116/117/135/','taskComment:delete',1,''),(140,'二级评论管理','menu','06010505',135,'0/1/116/117/135/','taskComment2:*',1,''),(141,'查看二级评论','button','0601050501',140,'0/1/116/117/135/140/','taskComment2:view',1,''),(142,'删除二级评论','button','0601050502',140,'0/1/116/117/135/140/','taskComment2:delete',1,'');
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
  `role` varchar(450) DEFAULT NULL,
  `description` varchar(450) DEFAULT NULL,
  `resource_ids` varchar(450) DEFAULT NULL,
  `is_available` int(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_role`
--

LOCK TABLES `hh_role` WRITE;
/*!40000 ALTER TABLE `hh_role` DISABLE KEYS */;
INSERT INTO `hh_role` VALUES (1,'admin','超级管理员','41,50,55,60,66,72,79,84,90,99,106,111,117,119,121,135,140',1),(2,'normal','普通用户','110',1),(3,'test','水电费1','41,50,55,60',1),(4,'test2','呃呃呃df','41,55',1);
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
  `create_time` datetime DEFAULT NULL,
  `hh_user_id` int(11) NOT NULL,
  `is_pass` tinyint(1) DEFAULT '0' COMMENT '是否通过审核',
  `is_deleted` tinyint(1) DEFAULT '1' COMMENT '是否下架',
  `hh_category_id` int(11) NOT NULL,
  `country` varchar(100) DEFAULT NULL COMMENT '服务所在国',
  `province` varchar(100) DEFAULT NULL COMMENT '服务所在省',
  `city` varchar(100) DEFAULT NULL,
  `area` varchar(45) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL COMMENT '详细地址',
  `image_url` varchar(450) DEFAULT NULL,
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
INSERT INTO `hh_server_info` VALUES (2,'title','aaaaaaaaaaaaaaaaaaaaaaaaaaa','12345678901',NULL,20,0,0,7,'c','p','c','a','s','a','/pic/Images/article/2c36c529-33e5-40ad-bb8d-4b87b72fcd55.jpg'),(3,'title','aaaaaaaaaaaaaaaaaaaaaaaaaaa','12345678901',NULL,20,0,0,7,'c','p','c','a','s','a','/pic/Images/article/2c36c529-33e5-40ad-bb8d-4b87b72fcd55.jpg'),(4,'title','bbbbbbbbbbbbbbbbbbbbbbbbbbbbb','12345678901',NULL,20,0,0,7,'c','p','c','a','s','a','/pic/Images/article/2c36c529-33e5-40ad-bb8d-4b87b72fcd55.jpg'),(5,'title','ccccccccccccccccccccccccccccccc','12345678901',NULL,20,0,0,7,'c','p','c','a','s','a','/pic/Images/article/2c36c529-33e5-40ad-bb8d-4b87b72fcd55.jpg');
/*!40000 ALTER TABLE `hh_server_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_session`
--

DROP TABLE IF EXISTS `hh_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_session` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cookie` varchar(450) DEFAULT NULL,
  `session` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_session`
--

LOCK TABLES `hh_session` WRITE;
/*!40000 ALTER TABLE `hh_session` DISABLE KEYS */;
INSERT INTO `hh_session` VALUES (222,'8fa7ea28-76df-49ee-9bfa-dcc83ee6e71e','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$8fa7ea28-76df-49ee-9bfa-dcc83ee6e71esr\0java.util.Datehj�KYt\0\0xpw\0\0XC�\�_xsq\0~\0w\0\0XC�Łxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/role/1xx'),(223,'24599533-fe50-400a-aa3e-a7a1d699d027','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$24599533-fe50-400a-aa3e-a7a1d699d027sr\0java.util.Datehj�KYt\0\0xpw\0\0XC�Ŕxsq\0~\0w\0\0XC�ʭxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETt\0_=1478608600000t\0/happy-help/resourcesxx'),(224,'a58da051-977e-4ec3-9920-5e20a280d90a','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$a58da051-977e-4ec3-9920-5e20a280d90asr\0java.util.Datehj�KYt\0\0xpw\0\0XC�̝xsq\0~\0w\0\0XC�\�#xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETt\0_=1478608600002t\0/happy-help/user/superuser/listxx'),(225,'ca2ca199-531b-4191-8862-fa069233827b','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$ca2ca199-531b-4191-8862-fa069233827bsr\0java.util.Datehj�KYt\0\0xpw\0\0XC�\�xsq\0~\0w\0\0XC��xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection�X%ƣJ\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx'),(226,'9969f4bf-a8ea-4645-b6a1-b779591dd180','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$9969f4bf-a8ea-4645-b6a1-b779591dd180sr\0java.util.Datehj�KYt\0\0xpw\0\0XC�Oxsq\0~\0w\0\0XC��\rxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection�X%ƣJ\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx');
/*!40000 ALTER TABLE `hh_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_setting`
--

DROP TABLE IF EXISTS `hh_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sys_type` varchar(45) DEFAULT NULL,
  `type_name` varchar(45) DEFAULT NULL,
  `type_value` varchar(45) DEFAULT NULL,
  `type_description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_setting`
--

LOCK TABLES `hh_setting` WRITE;
/*!40000 ALTER TABLE `hh_setting` DISABLE KEYS */;
INSERT INTO `hh_setting` VALUES (3,'推送范围','全国','80','紧急求助推送范围'),(5,'推送范围','省','45','紧急求助推送范围'),(6,'推送范围','市','20','紧急求助推送范围'),(7,'推送范围','区','10','紧急求助推送范围');
/*!40000 ALTER TABLE `hh_setting` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_show`
--

LOCK TABLES `hh_show` WRITE;
/*!40000 ALTER TABLE `hh_show` DISABLE KEYS */;
INSERT INTO `hh_show` VALUES (1,'test','/pic/Images/show/68bf4ccb-dea8-4d46-aa61-3b2df5dee7e3.jpg','2016-10-10 14:37:52','闪屏页',12,1),(2,'sdfsdf','/pic/Images/show/5df674eb-1140-49fa-8e2c-0a5252901028.jpg','2016-10-10 14:37:52','闪屏页',21,1);
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
  `context` varchar(450) DEFAULT NULL,
  `hh_task_info_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_nickname` varchar(45) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hh_talk_message_hh_task_info1_idx` (`hh_task_info_id`),
  CONSTRAINT `fk_hh_talk_message_hh_task_info1` FOREIGN KEY (`hh_task_info_id`) REFERENCES `hh_task_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_task_comment`
--

LOCK TABLES `hh_task_comment` WRITE;
/*!40000 ALTER TABLE `hh_task_comment` DISABLE KEYS */;
INSERT INTO `hh_task_comment` VALUES (1,'ssssssssssssssssssssssss',1,20,NULL,NULL),(2,'thisiscontext',1,20,NULL,NULL),(3,'thisiscontext',1,20,NULL,NULL),(4,'aaaaaaaaaaaaaaaaa',1,20,NULL,NULL),(5,'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb',1,20,NULL,NULL),(8,'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee',3,20,NULL,NULL),(9,'ffffffffffffffffffffffffffffffffffffffffffffffffff',4,20,NULL,NULL);
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
  `context` varchar(450) DEFAULT NULL,
  `hh_task_info_id` varchar(45) DEFAULT NULL,
  `hh_task_comment_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hh_task_comment2_hh_task_comment1_idx` (`hh_task_comment_id`),
  CONSTRAINT `fk_hh_task_comment2_hh_task_comment1` FOREIGN KEY (`hh_task_comment_id`) REFERENCES `hh_task_comment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_task_comment2`
--

LOCK TABLES `hh_task_comment2` WRITE;
/*!40000 ALTER TABLE `hh_task_comment2` DISABLE KEYS */;
INSERT INTO `hh_task_comment2` VALUES (1,20,1,'thisiscontsxt','1',1,NULL),(2,20,1,'thisiscontsxt','1',1,NULL),(3,20,1,'thisiscontsxt','1',1,NULL),(4,20,1,'aaaaaaaaaaaaaaaaaa','1',2,NULL),(5,20,1,'bbbbbbbbbbbbbbbbbbbbbbbb','1',2,NULL),(6,20,1,'cccccccccccccccc','1',2,NULL),(7,20,1,'ccccccddddd','1',3,NULL),(8,20,1,'dddddddddddddddd','1',3,NULL),(9,20,1,'dddddd','1',3,NULL),(10,20,1,'dddddd','1',4,NULL),(11,20,1,'ddddd','1',4,NULL),(12,20,1,'dddddddd','1',4,NULL),(13,20,1,'ddddddddd','1',5,NULL),(14,20,1,'fffffffffffff','1',5,NULL),(15,20,1,'ffffffffffffff','1',5,NULL),(17,20,1,'fffffffffff','3',8,NULL),(18,20,1,'fffffffffff','4',9,NULL);
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
  `hh_category_id` int(11) NOT NULL,
  `hh_user_id` int(11) NOT NULL,
  `country` varchar(45) DEFAULT NULL,
  `province` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `area` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `detail_position` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hh_message_hh_category1_idx` (`hh_category_id`),
  KEY `fk_hh_message_hh_user1_idx` (`hh_user_id`),
  CONSTRAINT `fk_hh_message_hh_category1` FOREIGN KEY (`hh_category_id`) REFERENCES `hh_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hh_message_hh_user1` FOREIGN KEY (`hh_user_id`) REFERENCES `hh_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_task_info`
--

LOCK TABLES `hh_task_info` WRITE;
/*!40000 ALTER TABLE `hh_task_info` DISABLE KEYS */;
INSERT INTO `hh_task_info` VALUES (1,'title','ssssssssssssssssssss','nono',10000.23,'12345678909',NULL,NULL,1,0,1,1,0,7,20,NULL,NULL,NULL,NULL,NULL,NULL),(3,'title','bbbbbbbbbbbbbbbbbb','nono',10000.23,'12345678909',NULL,NULL,0,0,1,0,0,7,20,NULL,NULL,NULL,NULL,NULL,NULL),(4,'title','ccccccccccccccccccc','nono',10000.23,'12345678909',NULL,NULL,0,1,1,1,0,7,20,NULL,NULL,NULL,NULL,NULL,NULL),(5,'title','this is context','nono',10000.23,'12345678909',NULL,NULL,1,0,1,0,0,7,20,NULL,NULL,NULL,NULL,NULL,NULL),(6,'title','this is context','nono',10000.23,'12345678909',NULL,NULL,0,0,0,0,0,7,20,NULL,NULL,NULL,NULL,NULL,NULL),(9,'title','this is context','nono',10000.23,'12345678909',NULL,NULL,1,0,1,1,0,7,20,NULL,NULL,NULL,NULL,NULL,NULL),(11,'title','this is context','nono',10000.23,'12345678909',NULL,NULL,1,0,1,1,0,7,20,NULL,NULL,NULL,NULL,NULL,NULL),(12,'title','this is context','nono',10000.23,'12345678909',NULL,NULL,1,0,1,1,0,7,20,NULL,NULL,NULL,NULL,NULL,NULL),(13,'title','this is context','nono',10000.23,'12345678909',NULL,NULL,1,0,1,1,0,7,20,NULL,NULL,NULL,NULL,NULL,NULL),(14,'title','this is context','nono',10000.23,'12345678909',NULL,NULL,1,0,1,1,0,7,20,NULL,NULL,NULL,NULL,NULL,NULL),(15,'title','this is context','nono',10000.23,'12345678909',NULL,NULL,1,0,1,1,0,7,20,NULL,NULL,NULL,NULL,NULL,NULL),(16,'title','this is context','nono',10000.23,'12345678909',NULL,NULL,1,0,1,1,0,7,20,NULL,NULL,NULL,NULL,NULL,NULL),(17,'title','this is context','nono',10000.23,'12345678909',NULL,NULL,1,0,1,1,0,7,20,NULL,NULL,NULL,NULL,NULL,NULL),(20,'title','this is context','nono',10000.23,'12345678909',NULL,NULL,1,0,1,1,0,7,20,NULL,NULL,NULL,NULL,NULL,NULL),(21,'title','this is context','nono',10000.23,'12345678909',NULL,NULL,1,0,1,1,0,7,20,NULL,NULL,NULL,NULL,NULL,NULL),(22,'title','this is context','nono',10000.23,'12345678909',NULL,NULL,1,0,1,1,0,7,20,NULL,NULL,NULL,NULL,NULL,NULL),(23,'title','this is context','nono',10000.23,'12345678909',NULL,NULL,1,0,1,1,0,7,20,NULL,NULL,NULL,NULL,NULL,NULL);
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
  `email` varchar(100) DEFAULT NULL,
  `photo` varchar(300) DEFAULT NULL,
  `cookie` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_user`
--

LOCK TABLES `hh_user` WRITE;
/*!40000 ALTER TABLE `hh_user` DISABLE KEYS */;
INSERT INTO `hh_user` VALUES (1,'admin','12345678901','d3c59d25033dbf980d29554025c23a75','8d78869f470951332959580424d4bf4f',0,'1,2,3',NULL,'san','张三','123456789009877654',NULL,1,1,NULL,NULL,NULL,NULL,'18',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ca2ca199-531b-4191-8862-fa069233827b'),(6,'1','1','53ea4fe818098d74c87a6fa4884c4ebd','6007b927c1fc7ecc747f860ceed897ed',0,'2',NULL,NULL,'1','1',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'2','2','918de6877666153c2f429b868b8a8163','d31382211bcab0d013d6209e78c3f76a',0,'1',NULL,NULL,'2','2',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'3','3','d698aa30530af381a82ce34332996ee5','12ae991ac129fb7683f86f2158b25763',0,'1',NULL,NULL,'3222','3',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'4','4','ac64868c8d9ce37fae3ff057ef89e4c0','9cbcc0b6592b9a0a247925eade93dc49',0,'1',NULL,NULL,'4','4',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'5','5','b1bba3b073c062ca3af5ba8c4bc9b8c2','f5e718ee6a98b87c79dce45e64a5ca61',0,'1',NULL,NULL,'552','5',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'6','6','0b85021e22c2d3d8b5734d539add88c3','a3268a17cd029b8de1c613ec510f85fe',0,'2',NULL,'6','6','6','',0,1,NULL,NULL,6,9,'9',9,'9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2','/pic/Images/head/6c9d11a4-5fc8-4f8e-9c40-35ee4ce8b107.jpg',NULL),(16,'7','7','8d3e12385d943b0e5575feed472a29e9','9037ad6899d8650c63d86b4bda54e652',1,'2',NULL,'7','7','7','',0,1,NULL,NULL,7,9,'9',9,'9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','/pic/Images/head/54c17ee5-01f5-463d-a4f7-846e8c6426fb.jpg',NULL),(17,'8','8','d3c59d25033dbf980d29554025c23a75','8d78869f470951332959580424d4bf4f',0,'2',NULL,'8','8','8','',0,1,NULL,NULL,8,9,'9',9,'9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','15660e33-b875-4ecc-b3c9-484b70011591.jpg',NULL),(18,'9','9','912ff0c3c0cdd5e9ed23fff35991e3cd','18ee76bb39a55cb24b6242a0c96db597',0,'2',NULL,'9','9','9','9',0,1,NULL,NULL,9,9,'9',9,'9111',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'10','10','d3c59d25033dbf980d29554025c23a75','8d78869f470951332959580424d4bf4f',0,'2',NULL,'10','10','10',NULL,0,1,NULL,NULL,9,9,'9',9,'9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'qwe123qwe','12312312312','e5ce8cc8181c877e5d44a88be8a7c845','18fffee607f3f8b16bfd6c6ec328d669',0,'2',NULL,'123','asd','9','爱仕达多',0,1,NULL,NULL,0,0,'20',4,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'qwet1','12312312310','a09ab74baa8ccb2b67007afff7187acc','61ff3008cdb3df40b7d792e909284e2d',0,'2',NULL,'11q','爱的','9','阿萨德',0,1,NULL,NULL,1,1,'1',1,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'asdf12','123123132222','e0a704c3049b30718c4576eebe1af388','41a1fc2d8d33cc0c4c8ab7f23080c321',0,'2',NULL,'qwe','123','8','qe',0,1,NULL,NULL,1,1,'11',1,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'asdf12w','12312313222221','9794eeb17b076358d0b275af991d30fb','2868351f48f7ae71cf16091d23d06c1d',0,'2',NULL,'qwe','1233333','undefined','qe',0,1,NULL,NULL,1,1,'11',1,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'asdf12w1','123123132222212','afbf49c571b88bd684c03319452ccf2d','6f168dd62b75371c215d2c6b7a8b9d79',0,'2',NULL,'qwe','123q','234','qe',0,1,NULL,NULL,1,1,'11',1,'1',NULL,NULL,NULL,'234',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,'1231','123123','e1e34f96c75e5f92f7acee99b75534cc','c2173111727625a5ecf1566129b5c763',0,'1',NULL,NULL,'3','3',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,'234','12312222','04f4056cc6b539541c6283c29b8eaa97','5e1ffc1f8235d9e961ddec6504a89440',0,'1',NULL,NULL,'2','21',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2735f2c9-b5ba-475c-a9e7-f0392958f1aa'),(37,'1222222','222211111','35351fe8f37660f4c53c7f27a7362afa','e513e355dadbc3a8bcbe4faa569b8a37',0,'1',NULL,NULL,'221q','22',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,'333332222','2122211','9c12240963d1e2915df56641afbf7f5a','fec68ed77691a3ea26b110961edfe7a7',0,'2',NULL,'2','2','2','2',0,1,NULL,NULL,1,1,'1',1,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,'weqw22','1233222111','f0b61cc89212f1059883699adaecdeeb','8885cd761d502ca4257e578e72d9040b',1,'2',NULL,'123','123','123','123',0,1,NULL,NULL,12,12,'1',1,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,'rty789','098890','5f57ca4fa2ac60c79a5c8a6d53ee718d','22d696029470aa9efdaf47f20875a8a2',0,'2',NULL,'123','123','123','1',0,1,NULL,NULL,1,1,'11',1,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','098890',NULL),(41,'rfv','32221','7396c5a2f73def7d917bd08fa5ea473c','5d1225cae818126f657799e5f67bf4b6',1,'2',NULL,'123','1','1','1',0,1,NULL,NULL,1,1,'1',1,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','32221',NULL);
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

-- Dump completed on 2016-11-08 20:47:21

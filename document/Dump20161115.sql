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
-- Table structure for table `hh_captcha`
--

DROP TABLE IF EXISTS `hh_captcha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_captcha` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `captcha` varchar(45) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_captcha`
--

LOCK TABLES `hh_captcha` WRITE;
/*!40000 ALTER TABLE `hh_captcha` DISABLE KEYS */;
INSERT INTO `hh_captcha` VALUES (1,'1231','2016-11-23 11:12:34'),(2,'1233','2016-10-24 10:55:34'),(3,'2222','2016-10-24 10:55:34'),(4,'1123','2016-10-24 10:55:34'),(5,'3376','2016-11-13 11:51:20'),(6,'6632','2016-11-13 15:10:05');
/*!40000 ALTER TABLE `hh_captcha` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_category`
--

LOCK TABLES `hh_category` WRITE;
/*!40000 ALTER TABLE `hh_category` DISABLE KEYS */;
INSERT INTO `hh_category` VALUES (1,'ç±»åˆ«','0',0,'0/',1,'æ ¹ç±»åˆ«'),(7,'test','1',1,'0/1/',2,'2äºŒ'),(8,'test2','2',1,'0/1/',22,'æ°´ç”µè´¹'),(10,'æ¨è','01',1,'0/1/',NULL,'ç±»åˆ«'),(11,'å¯»ç‰©','02',1,'0/1/',NULL,'ç±»åˆ«'),(12,'æ‰¾äºº','03',1,'0/1/',NULL,'ç±»åˆ«'),(13,'å®¶æ”¿','04',1,'0/1/',NULL,'ç±»åˆ«'),(14,'å‡ºè¡Œ','05',1,'0/1/',NULL,'ç±»åˆ«'),(15,'ç»´ä¿®','06',1,'0/1/',NULL,'ç±»åˆ«'),(16,'æ³•è§„','07',1,'0/1/',NULL,'ç±»åˆ«'),(17,'é—®ç­”','08',1,'0/1/',NULL,'ç±»åˆ«'),(18,'ä¹¦ç±','09',1,'0/1/',NULL,'ç±»åˆ«');
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
INSERT INTO `hh_help_info` VALUES (1,'title','thisiscontext','url','12345678901','å…¨å›½',0,20,5,NULL,NULL,NULL,0,0,7,'2016-10-10 14:37:52','c','p','c','a','s','d',0),(2,'title','thisiscontext','url','12345678901','å…¨å›½',0,20,5,NULL,NULL,NULL,0,0,7,'2016-10-10 14:37:52','c','p','c','a','s','d',0),(3,'title','thisiscontext','url','12345678901','å…¨å›½',0,20,5,NULL,NULL,NULL,0,0,7,'2016-10-10 14:37:52','c','p','c','a','s','d',0),(4,'title','thisiscontext','url','12345678901','å…¨å›½',0,20,5,NULL,NULL,NULL,0,0,7,'2016-10-10 14:37:52','c','p','c','a','s','d',0),(5,'title','thisiscontext','url','12345678901','å…¨å›½',0,20,5,NULL,NULL,NULL,0,0,7,'2016-10-10 14:37:52','c','p','c','a','s','d',0),(6,'title','thisiscontext','url','12345678901','å…¨å›½',0,20,5,NULL,NULL,NULL,0,0,7,'2016-10-10 14:37:52','c','p','c','a','s','d',0),(7,'title','thisiscontext','url','12345678901','å…¨å›½',0,20,5,NULL,NULL,NULL,0,0,7,'2016-10-10 14:37:52','c','p','c','a','s','d',0),(9,'title','thisiscontext','url','12345678901','å…¨å›½',0,20,5,NULL,NULL,NULL,0,0,7,'2016-10-10 14:37:52','c','p','c','a','s','d',0),(10,'title','thisiscontext','url','12345678901','å…¨å›½',0,20,5,NULL,NULL,NULL,0,0,7,'2016-10-10 14:37:52','c','p','c','a','s','d',0),(12,'45',NULL,NULL,NULL,NULL,0,20,NULL,NULL,'9',NULL,0,0,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0);
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
INSERT INTO `hh_prize` VALUES (1,'20161024',10000,'19,16','10,7','10,7',1,'2016-10-24 10:55:34'),(2,'20161025',10000,NULL,NULL,NULL,1,'2016-10-24 10:55:34'),(3,'20161026',10000,NULL,NULL,NULL,1,'2016-10-24 10:55:34'),(4,'12312315',23123,NULL,NULL,NULL,1,'2016-10-24 10:55:34'),(5,'23424234',2343,NULL,NULL,NULL,1,'2016-10-24 10:55:34'),(8,'1231233',123123,NULL,NULL,NULL,1,'2016-10-24 22:13:23'),(9,'20161026',10000,'15,16','6,7','6,7',0,'2016-10-26 15:43:51');
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
INSERT INTO `hh_resource` VALUES (1,'èµ„æº','menu','0',0,'0/','',1,''),(40,'ç”¨æˆ·èµ„æºç®¡ç†','menu','01',1,'0/1/','',1,''),(41,'ç®¡ç†å‘˜ç®¡ç†','menu','0101',40,'0/1/40/','superuser:*',1,'/user/superuser/list'),(42,'ç®¡ç†å‘˜æ–°å¢','button','010101',41,'0/1/40/41','superuser:create',1,' '),(43,'ç®¡ç†å‘˜ä¿®æ”¹','button','010102',41,'0/1/40/41','superuser:update',1,' '),(44,'ç®¡ç†å‘˜åˆ é™¤','button','010103',41,'0/1/40/41','superuser:delete',1,' '),(45,'ç®¡ç†å‘˜æŸ¥çœ‹','button','010104',41,'0/1/40/41','superuser:view',1,' '),(50,'ç”¨æˆ·ç®¡ç†','menu','0102',40,'0/1/40','user:*',1,'/user/normaluser/list'),(51,'ç”¨æˆ·æ–°å¢','button','010201',50,'0/1/40/50/','user:create',1,''),(52,'ç”¨æˆ·ä¿®æ”¹','button','010202',50,'0/1/40/50/','user:update',1,''),(53,'ç”¨æˆ·åˆ é™¤','button','010203',50,'0/1/40/50/','user:delete',1,''),(54,'ç”¨æˆ·æŸ¥çœ‹','button','010204',50,'0/1/40/50/','user:view',1,''),(55,'èµ„æºç®¡ç†','menu','0103',40,'0/1/40/','resource:*',1,'/resources'),(56,'èµ„æºæ–°å¢','button','010301',55,'0/1/40/55/','resource:create',1,''),(57,'èµ„æºä¿®æ”¹','button','010302',55,'0/1/40/55/','resource:update',1,''),(58,'èµ„æºåˆ é™¤','button','010303',55,'0/1/40/55/','resource:delete',1,''),(59,'èµ„æºæŸ¥çœ‹','button','010304',55,'0/1/40/55/','resource:view',1,''),(60,'è§’è‰²ç®¡ç†','menu','0104',40,'0/1/40/','role:*',1,'/role'),(61,'è§’è‰²æ–°å¢','button','010401',60,'0/1/40/60/','role:create',1,''),(62,'è§’è‰²ä¿®æ”¹','button','010402',60,'0/1/40/60/','role:update',1,''),(63,'è§’è‰²åˆ é™¤','button','010403',60,'0/1/40/60/','role:delete',1,''),(64,'è§’è‰²æŸ¥çœ‹','button','010404',60,'0/1/40/60/','role:view',1,''),(65,'æ’åç®¡ç†','menu','02',1,'0/1/','',1,''),(66,'è£èª‰å€¼æ’å','menu','0201',65,'0/1/65/','honer:*',1,'/user/rank/honer'),(68,'æŸ¥çœ‹è£èª‰å€¼','button','020101',66,'0/1/65/66/','honer:view',1,''),(69,'ä¿®æ”¹è£èª‰å€¼','button','020102',66,'0/1/65/66/','honer:update',1,''),(70,'è®¾ç½®ä¸­å¥–äºº','button','020103',66,'0/1/65/66/','honer:prize',1,''),(71,'è®¾ç½®éšæœºä¸­å¥–','button','020104',66,'0/1/65/66/','honer:ramdom',1,''),(72,'è´¡çŒ®å€¼æ’å','menu','0202',65,'0/1/65/','contribute:*',1,'/user/rank/contribute'),(73,'æŸ¥çœ‹è´¡çŒ®å€¼æ’å','button','020201',72,'0/1/65/72/','contribute:view',1,''),(74,'ä¿®æ”¹è´¡çŒ®å€¼','button','020202',72,'0/1/65/72/','contribute:update',1,''),(78,'ç³»ç»Ÿè®¾ç½®','menu','09',1,'0/1/','',1,''),(79,'å›¾ç‰‡è®¾ç½®','menu','0901',78,'0/1/78/','show:*',1,'/show/list/panel'),(80,'æŸ¥çœ‹å›¾ç‰‡','button','090101',79,'0/1/78/79/','show:view',1,''),(81,'æ·»åŠ å›¾ç‰‡','button','090102',79,'0/1/78/79/','show:create',1,''),(82,'ä¿®æ”¹å›¾ç‰‡','button','090103',79,'0/1/78/79/','show:update',1,''),(83,'åˆ é™¤å›¾ç‰‡','button','090104',79,'0/1/78/79/','show:delete',1,''),(84,'å±æ€§è®¾ç½®','menu','0902',78,'0/1/78/','property:*',1,'/setting/list-panel'),(85,'æ·»åŠ å±æ€§','button','090201',84,'0/1/78/84/','property:create',1,''),(86,'ä¿®æ”¹å±æ€§','button','090202',84,'0/1/78/84/','property:update',1,''),(87,'åˆ é™¤å±æ€§','button','090203',84,'0/1/78/84/','property:delete',1,''),(88,'æŸ¥çœ‹å±æ€§','button','090204',84,'0/1/78/84/','property:view',1,''),(89,'å¼€å¥–ç®¡ç†','menu','03',1,'0/1/','',1,''),(90,'å¼€å¥–è®°å½•','menu','0301',89,'0/1/89/','prize:*',1,'/prize/list-panel'),(92,'æŸ¥çœ‹å¼€å¥–è®°å½•','button','030101',90,'0/1/89/90/','prize:view',1,''),(93,'åˆ é™¤æœªå¼€å¥–è®°å½•','button','030102',90,'0/1/89/90/','prize:delete',1,''),(94,'ä¿®æ”¹æœªå¼€å¥–è®°å½•','button','030103',90,'0/1/89/90/','prize:update',1,''),(95,'å¢åŠ å¼€å¥–è®°å½•','button','030104',90,'0/1/89/90/','prize:create',1,''),(98,'ç±»åˆ«ç®¡ç†','menu','04',1,'0/1/','',1,''),(99,'ç±»åˆ«ç»´æŠ¤','menu','0401',98,'0/1/98/','category:*',1,'/category/list-panel'),(101,'æ·»åŠ ç±»åˆ«','button','040101',99,'0/1/98/99/','category:create',1,''),(102,'åˆ é™¤ç±»åˆ«','button','040102',99,'0/1/98/99/','category:delete',1,''),(103,'ä¿®æ”¹ç±»åˆ«','button','040103',99,'0/1/98/99/','category:update',1,''),(104,'æŸ¥çœ‹ç±»åˆ«','button','040104',99,'0/1/98/99/','category:view',1,''),(105,'å¥½äººå¥½äº‹æ–‡ç« ç®¡ç†','menu','05',1,'0/1/','',1,''),(106,'æ–‡ç« ç®¡ç†','menu','0501',105,'0/1/105/','article:*',1,'/article/list-panel'),(107,'æ·»åŠ æ–‡ç« ','button','050101',106,'0/1/105/106/','article:create',1,''),(108,'åˆ é™¤æ–‡ç« ','button','050102',106,'0/1/105/106/','article:delete',1,''),(109,'ä¿®æ”¹æ–‡ç« ','button','050103',106,'0/1/105/106/','article:update',1,''),(110,'æŸ¥çœ‹æ–‡ç« ','button','050104',106,'0/1/105/106/','article:view',1,''),(111,'è¯„è®ºç®¡ç†','menu','050105',106,'0/1/105/106/','comment:*',1,''),(112,'æ·»åŠ è¯„è®º','button','05010501',111,'0/1/105/106/111/','comment:create',1,''),(113,'åˆ é™¤è¯„è®º','button','05010502',111,'0/1/105/106/111/','comment:delete',1,''),(114,'ä¿®æ”¹è¯„è®º','button','05010503',111,'0/1/105/106/111/','comment:update',1,''),(115,'æŸ¥','button','05010504',111,'0/1/105/106/111/','comment:view',1,''),(116,'æ™®é€šæ±‚åŠ©æ¶ˆæ¯ç®¡ç†','menu','06',1,'0/1/',NULL,1,NULL),(117,'æ±‚åŠ©æ¶ˆæ¯ç®¡ç†','menu','0601',116,'0/1/116/','task:*',1,'/taskinfo/list-panel'),(118,'ç´§æ€¥æ±‚åŠ©æ¶ˆæ¯ç®¡ç†','menu','07',1,'0/1/','',1,''),(119,'ç´§æ€¥æ¶ˆæ¯ç®¡ç†','menu','0701',118,'0/1/118/','help:*',1,'/helpInfo/list-panel'),(120,'å…¬å…±æœåŠ¡ç®¡ç†','menu','08',1,'0/1/','',1,''),(121,'æœåŠ¡ä¿¡æ¯ç®¡ç†','menu','0801',120,'0/1/120/','server:*',1,'/serverInfo/list-panel'),(122,'å¢åŠ æ™®é€šæ±‚åŠ©æ¶ˆæ¯','button','060101',117,'0/1/116/117/','task:create',1,''),(123,'åˆ é™¤æ™®é€šæ±‚åŠ©æ¶ˆæ¯','button','060102',117,'0/1/116/117/','task:delete',1,''),(124,'æ”¹åŠ¨æ™®é€šæ±‚åŠ©æ¶ˆæ¯','button','060103',117,'0/1/116/117/','task:update',1,''),(125,'æŸ¥æ‰¾æ™®é€šæ±‚åŠ©æ¶ˆæ¯','button','060104',117,'0/1/116/117/','task:view',1,''),(126,'å¢åŠ ç´§æ€¥æ±‚åŠ©æ¶ˆæ¯','button','070101',119,'0/1/118/119/','help:create',1,''),(127,'åˆ é™¤ç´§æ€¥æ±‚åŠ©æ¶ˆæ¯','button','070102',119,'0/1/118/119/','help:delete',1,''),(128,'æ”¹åŠ¨ç´§æ€¥æ±‚åŠ©æ¶ˆæ¯','button','070103',119,'0/1/118/119/','help:update',1,''),(129,'æŸ¥æ‰¾ç´§æ€¥æ±‚åŠ©æ¶ˆæ¯','button','070104',119,'0/1/118/119/','help:view',1,''),(130,'å¢åŠ æœåŠ¡ä¿¡æ¯','button','080101',121,'0/1/120/121/','server:create',1,''),(131,'åˆ é™¤æœåŠ¡ä¿¡æ¯','button','080102',121,'0/1/120/121/','server:delete',1,''),(132,'æ”¹åŠ¨æœåŠ¡ä¿¡æ¯','button','080103',121,'0/1/120/121/','server:update',1,''),(133,'æŸ¥æ‰¾æœåŠ¡ä¿¡æ¯','button','080104',121,'0/1/120/121/','server:view',1,''),(135,'æ±‚åŠ©æ¶ˆæ¯è¯„è®ºç®¡ç†','menu','060105',117,'0/1/116/117/','taskComment:*',1,''),(136,'æ·»åŠ æ±‚åŠ©è¯„è®º','button','06010501',135,'0/1/116/117/135/','taskComment:create',1,''),(137,'åˆ é™¤æ±‚åŠ©è¯„è®ºæ¶ˆæ¯','button','06010502',135,'0/1/116/117/135/','taskComment:delete',1,''),(138,'ä¿®æ”¹æ±‚åŠ©è¯„è®ºæ¶ˆæ¯','button','06010503',135,'0/1/116/117/135/','taskComment:update',1,''),(139,'åˆ é™¤æ±‚åŠ©æ¶ˆæ¯è¯„è®º','button','06010504',135,'0/1/116/117/135/','taskComment:delete',1,''),(140,'äºŒçº§è¯„è®ºç®¡ç†','menu','06010505',135,'0/1/116/117/135/','taskComment2:*',1,''),(141,'æŸ¥çœ‹äºŒçº§è¯„è®º','button','0601050501',140,'0/1/116/117/135/140/','taskComment2:view',1,''),(142,'åˆ é™¤äºŒçº§è¯„è®º','button','0601050502',140,'0/1/116/117/135/140/','taskComment2:delete',1,'');
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
INSERT INTO `hh_role` VALUES (1,'admin','è¶…çº§ç®¡ç†å‘˜','41,50,55,60,66,72,79,84,90,99,106,111,117,119,121,135,140',1),(2,'normal','æ™®é€šç”¨æˆ·','110',1),(3,'test','æ°´ç”µè´¹1','41,50,55,60',1),(4,'test2','å‘ƒå‘ƒå‘ƒdf','41,55',1);
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
  `is_pass` tinyint(1) DEFAULT '0' COMMENT 'æ˜¯å¦é€šè¿‡å®¡æ ¸',
  `is_deleted` tinyint(1) DEFAULT '1' COMMENT 'æ˜¯å¦ä¸‹æ¶',
  `hh_category_id` int(11) NOT NULL,
  `country` varchar(100) DEFAULT NULL COMMENT 'æœåŠ¡æ‰€åœ¨å›½',
  `province` varchar(100) DEFAULT NULL COMMENT 'æœåŠ¡æ‰€åœ¨çœ',
  `city` varchar(100) DEFAULT NULL,
  `area` varchar(45) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL COMMENT 'è¯¦ç»†åœ°å€',
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
) ENGINE=InnoDB AUTO_INCREMENT=389 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_session`
--

LOCK TABLES `hh_session` WRITE;
/*!40000 ALTER TABLE `hh_session` DISABLE KEYS */;
INSERT INTO `hh_session` VALUES (239,'55f65c27-d54d-4628-86ed-97ec0607b256','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0ÿt\0$55f65c27-d54d-4628-86ed-97ec0607b256sr\0java.util.DatehjKYt\0\0xpw\0\0XG\Ùxsq\0~\0w\0\0XHr±9xsq\0~\0w\0\0XHO\Ñ%xw\Z\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\Í r€Õœú\î\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection¨X%Æ£J\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx'),(240,'05023b96-c3a5-4e8e-a1e5-d9fe03d39988','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0ÿt\0$05023b96-c3a5-4e8e-a1e5-d9fe03d39988sr\0java.util.DatehjKYt\0\0xpw\0\0XG!„xsq\0~\0w\0\0XL%{¸xsq\0~\0w\0\0XK\ïğ\íxw\Z\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\Í r€Õœú\î\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection¨X%Æ£J\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx'),(241,'7eac4561-4432-4deb-bce1-1fb212a0aba1','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0ÿt\0$7eac4561-4432-4deb-bce1-1fb212a0aba1sr\0java.util.DatehjKYt\0\0xpw\0\0XH;\Ã5xsq\0~\0w\0\0XHr±0xsq\0~\0w\0\0XH;Ä’xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx'),(242,'77f9426c-ff92-4d0e-98fb-d0f1b839b461','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0ÿt\0$77f9426c-ff92-4d0e-98fb-d0f1b839b461sr\0java.util.DatehjKYt\0\0xpw\0\0XHP^xsq\0~\0w\0\0XL%{½xsq\0~\0w\0\0XK\îŸFxw\Z\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\Í r€Õœú\î\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection¨X%Æ£J\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx'),(243,'7c3f33dc-e2c4-4699-887b-98868007a9e9','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0ÿt\0$7c3f33dc-e2c4-4699-887b-98868007a9e9sr\0java.util.DatehjKYt\0\0xpw\0\0XKî–xsq\0~\0w\0\0XL%{­xsq\0~\0w\0\0XK\îxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx'),(244,'8a17295b-26b7-45a3-befe-e28b739dde85','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$8a17295b-26b7-45a3-befe-e28b739dde85sr\0java.util.DatehjKYt\0\0xpw\0\0XQ*º¯xsq\0~\0w\0\0XQ*»ªxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(245,'36b6a135-ed19-408d-8586-75be222f20e5','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$36b6a135-ed19-408d-8586-75be222f20e5sr\0java.util.DatehjKYt\0\0xpw\0\0XQ*\Â\Äxsq\0~\0w\0\0XQ\ËTóxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\Í r€Õœú\î\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection¨X%Æ£J\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx'),(246,'9a77f292-6259-42b5-be41-ac485b652373','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0ÿt\0$9a77f292-6259-42b5-be41-ac485b652373sr\0java.util.DatehjKYt\0\0xpw\0\0XQ5„xsq\0~\0w\0\0XQlr:xsq\0~\0w\0\0XQ5…oxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx'),(247,'74cd9cfd-f20c-4185-b5d0-e38a293e1306','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$74cd9cfd-f20c-4185-b5d0-e38a293e1306sr\0java.util.DatehjKYt\0\0xpw\0\0XQ\ËNUxsq\0~\0w\0\0XQ\ËOxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(248,'c0b58194-2dcc-4a02-b83c-280215502acb','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$c0b58194-2dcc-4a02-b83c-280215502acbsr\0java.util.DatehjKYt\0\0xpw\0\0XQ\ÍÜ xsq\0~\0w\0\0XQ\ÍÜ¹xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0B/happy-help/role/1;JSESSIONID=a40a259a-25c6-44a6-98f3-a56b76f92585xx'),(249,'4bd08481-b1ac-407f-a2d1-fa9d77ede258','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$4bd08481-b1ac-407f-a2d1-fa9d77ede258sr\0java.util.DatehjKYt\0\0xpw\0\0XQ\ÎFcxsq\0~\0w\0\0XQğY«xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\Í r€Õœú\î\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection¨X%Æ£J\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx'),(250,'1c6b5d39-1371-4061-bfde-ee9c35c75bc2','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$1c6b5d39-1371-4061-bfde-ee9c35c75bc2sr\0java.util.DatehjKYt\0\0xpw\0\0XQ\á8˜xsq\0~\0w\0\0XQ\á9¸xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(251,'e2ae0543-a26b-498d-8e7f-ec3de810e35c','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$e2ae0543-a26b-498d-8e7f-ec3de810e35csr\0java.util.DatehjKYt\0\0xpw\0\0XQ\åj=xsq\0~\0w\0\0XQ\åk‚xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(252,'bab3e406-b5fa-4579-84b1-c92680f581a5','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$bab3e406-b5fa-4579-84b1-c92680f581a5sr\0java.util.DatehjKYt\0\0xpw\0\0XQğvÁxsq\0~\0w\0\0XQò¨µxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\Í r€Õœú\î\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection¨X%Æ£J\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx'),(253,'9ca7aac6-9240-4fa6-b0c2-5b431cfb836c','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$9ca7aac6-9240-4fa6-b0c2-5b431cfb836csr\0java.util.DatehjKYt\0\0xpw\0\0XQò½¡xsq\0~\0w\0\0XQò\ÚÀxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\Í r€Õœú\î\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection¨X%Æ£J\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx'),(254,'7f42fe5a-7853-45db-b3c9-3293f7dcc9f8','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$7f42fe5a-7853-45db-b3c9-3293f7dcc9f8sr\0java.util.DatehjKYt\0\0xpw\0\0XQò\êxsq\0~\0w\0\0XQó\ëxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\Í r€Õœú\î\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection¨X%Æ£J\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx'),(255,'fc63d222-03b9-41b4-ae74-f78c67dd50b5','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$fc63d222-03b9-41b4-ae74-f78c67dd50b5sr\0java.util.DatehjKYt\0\0xpw\0\0XQókxsq\0~\0w\0\0XQóxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/role/1,2,3xx'),(256,'0dee13c1-e85e-4e88-a60a-7a7605c5509f','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$0dee13c1-e85e-4e88-a60a-7a7605c5509fsr\0java.util.DatehjKYt\0\0xpw\0\0XQó’xsq\0~\0w\0\0XQóªxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/role/2xx'),(257,'d64bc9a0-8a3c-418f-81cf-8a8ad11ec7f2','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$d64bc9a0-8a3c-418f-81cf-8a8ad11ec7f2sr\0java.util.DatehjKYt\0\0xpw\0\0XQó¾xsq\0~\0w\0\0XQó\Ïxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/role/1xx'),(258,'7ee0a963-bd9f-4a84-9648-89633a460f9a','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$7ee0a963-bd9f-4a84-9648-89633a460f9asr\0java.util.DatehjKYt\0\0xpw\0\0XQó\áxsq\0~\0w\0\0XQóñxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/role/1xx'),(259,'c93512f2-96d2-49f5-865d-dd9787ff9c32','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$c93512f2-96d2-49f5-865d-dd9787ff9c32sr\0java.util.DatehjKYt\0\0xpw\0\0XQó\0xsq\0~\0w\0\0XQóxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/role/1xx'),(260,'9649e08d-ca4a-416e-88dc-c8b1abbcccb0','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$9649e08d-ca4a-416e-88dc-c8b1abbcccb0sr\0java.util.DatehjKYt\0\0xpw\0\0XQóxsq\0~\0w\0\0XQó.xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/role/1xx'),(261,'a0d91cda-f33d-497e-a279-452293f783bf','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$a0d91cda-f33d-497e-a279-452293f783bfsr\0java.util.DatehjKYt\0\0xpw\0\0XQóAxsq\0~\0w\0\0XQóWxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/role/1xx'),(262,'4e9eb444-94e9-4354-b321-5a68b1c6d70b','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$4e9eb444-94e9-4354-b321-5a68b1c6d70bsr\0java.util.DatehjKYt\0\0xpw\0\0XQógxsq\0~\0w\0\0XQóxxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/role/1xx'),(263,'0dc8b64a-1352-47c2-918e-d5881fd7c142','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$0dc8b64a-1352-47c2-918e-d5881fd7c142sr\0java.util.DatehjKYt\0\0xpw\0\0XQóˆxsq\0~\0w\0\0XQóxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETt\0_=1478843629327t\0 /happy-help/user/normaluser/listxx'),(264,'faaa066b-5790-405f-81c6-c820435b8007','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$faaa066b-5790-405f-81c6-c820435b8007sr\0java.util.DatehjKYt\0\0xpw\0\0XQóJxsq\0~\0w\0\0XQó\âùxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\Í r€Õœú\î\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection¨X%Æ£J\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx'),(265,'361897a3-7fb0-492e-ac43-d2243d1a44c1','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$361897a3-7fb0-492e-ac43-d2243d1a44c1sr\0java.util.DatehjKYt\0\0xpw\0\0XQó\ãSxsq\0~\0w\0\0XQó\ãdxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/role/1,2,3xx'),(266,'518736de-a99e-4462-895b-1e1a8328baaf','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$518736de-a99e-4462-895b-1e1a8328baafsr\0java.util.DatehjKYt\0\0xpw\0\0XQó\ãpxsq\0~\0w\0\0XQó\ã}xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/role/2xx'),(267,'07c98ed2-bdb5-471c-af02-df18efaa9e11','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$07c98ed2-bdb5-471c-af02-df18efaa9e11sr\0java.util.DatehjKYt\0\0xpw\0\0XQó\ãˆxsq\0~\0w\0\0XQó\ã—xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/role/1xx'),(268,'81d59556-bb48-47e9-9c30-a85a52ce2df3','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$81d59556-bb48-47e9-9c30-a85a52ce2df3sr\0java.util.DatehjKYt\0\0xpw\0\0XQó\ã£xsq\0~\0w\0\0XQó\ã³xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/role/1xx'),(269,'f3fe8712-e891-460e-ac3f-938eea9e8a42','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$f3fe8712-e891-460e-ac3f-938eea9e8a42sr\0java.util.DatehjKYt\0\0xpw\0\0XQó\ã¿xsq\0~\0w\0\0XQó\ã\Íxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/role/1xx'),(270,'5ecee0ce-2301-45f5-81e9-15e7e13e012f','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$5ecee0ce-2301-45f5-81e9-15e7e13e012fsr\0java.util.DatehjKYt\0\0xpw\0\0XQó\ã\Ùxsq\0~\0w\0\0XQó\ã\çxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/role/1xx'),(271,'7b5c1637-65f3-4702-b7d6-15caf43ba68a','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$7b5c1637-65f3-4702-b7d6-15caf43ba68asr\0java.util.DatehjKYt\0\0xpw\0\0XQó\ãóxsq\0~\0w\0\0XQó\ä\0xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/role/1xx'),(272,'4b8eb788-ed66-47f2-abb2-d27d8fd9c6e7','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$4b8eb788-ed66-47f2-abb2-d27d8fd9c6e7sr\0java.util.DatehjKYt\0\0xpw\0\0XQó\ä\rxsq\0~\0w\0\0XQó\äxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/role/1xx'),(273,'c8aa1144-6e84-476e-a6ba-53e1d42e29c2','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$c8aa1144-6e84-476e-a6ba-53e1d42e29c2sr\0java.util.DatehjKYt\0\0xpw\0\0XQó\ä&xsq\0~\0w\0\0XQó\é\Çxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETt\0_=1478843686417t\0/happy-help/resourcesxx'),(274,'dd39d1af-63ae-4b34-b5ee-ecfc7f637697','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$dd39d1af-63ae-4b34-b5ee-ecfc7f637697sr\0java.util.DatehjKYt\0\0xpw\0\0XQó\ë\Âxsq\0~\0w\0\0XQó\ë\Ôxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETt\0_=1478843686418t\0/happy-help/rolexx'),(275,'739ac813-ac17-4dda-ba27-1c654bb68171','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$739ac813-ac17-4dda-ba27-1c654bb68171sr\0java.util.DatehjKYt\0\0xpw\0\0XQô·5xsq\0~\0w\0\0XQô¸¢xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(276,'8d7be03b-5641-4e4e-9d91-b5b5173b1414','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0_t\0$8d7be03b-5641-4e4e-9d91-b5b5173b1414sr\0java.util.DatehjKYt\0\0xpw\0\0XQôÀSxsq\0~\0w\0\0XR#F$xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1x'),(277,'b6b45204-c32d-4f43-a838-742a945c3a05','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$b6b45204-c32d-4f43-a838-742a945c3a05sr\0java.util.DatehjKYt\0\0xpw\0\0XR“´xsq\0~\0w\0\0XR”\Ùxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(278,'37809976-904d-4cb5-9e81-15d03cd6af6d','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$37809976-904d-4cb5-9e81-15d03cd6af6dsr\0java.util.DatehjKYt\0\0xpw\0\0XR\n\èŸxsq\0~\0w\0\0XR\n\é÷xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(279,'0bb9bb9d-4899-41b2-bdbc-f0ceea52ad07','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$0bb9bb9d-4899-41b2-bdbc-f0ceea52ad07sr\0java.util.DatehjKYt\0\0xpw\0\0XR½xsq\0~\0w\0\0XR0xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(280,'1ff190b8-3b7d-47d5-bae4-9cec5c8abfd9','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$1ff190b8-3b7d-47d5-bae4-9cec5c8abfd9sr\0java.util.DatehjKYt\0\0xpw\0\0XR\Z¦xsq\0~\0w\0\0XR\Z§Sxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(281,'1ec6ee36-a55b-48bc-8b8c-ee111a38b992','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$1ec6ee36-a55b-48bc-8b8c-ee111a38b992sr\0java.util.DatehjKYt\0\0xpw\0\0XR#F7xsq\0~\0w\0\0XR#pxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\Í r€Õœú\î\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection¨X%Æ£J\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx'),(282,'93237d1d-5e2b-4b8c-845e-be1442a40652','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$93237d1d-5e2b-4b8c-845e-be1442a40652sr\0java.util.DatehjKYt\0\0xpw\0\0XR%bxsq\0~\0w\0\0XR%~xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\Í r€Õœú\î\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection¨X%Æ£J\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx'),(283,'4ac3c22a-a4af-43db-8cbc-56937bc31252','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$4ac3c22a-a4af-43db-8cbc-56937bc31252sr\0java.util.DatehjKYt\0\0xpw\0\0XR%€øxsq\0~\0w\0\0XR%xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\Í r€Õœú\î\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection¨X%Æ£J\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx'),(284,'94ab21ae-975a-4a1e-9617-1f3b68c33de0','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$94ab21ae-975a-4a1e-9617-1f3b68c33de0sr\0java.util.DatehjKYt\0\0xpw\0\0XR&R¾xsq\0~\0w\0\0XR&R\×xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\Í r€Õœú\î\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection¨X%Æ£J\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx'),(285,'1578fe87-bbda-45d6-a529-6dddf7354d2f','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$1578fe87-bbda-45d6-a529-6dddf7354d2fsr\0java.util.DatehjKYt\0\0xpw\0\0XR&º8xsq\0~\0w\0\0XR&ºQxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\Í r€Õœú\î\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection¨X%Æ£J\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx'),(286,'866badd5-5f31-4ede-b9cf-6790f510dde6','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$866badd5-5f31-4ede-b9cf-6790f510dde6sr\0java.util.DatehjKYt\0\0xpw\0\0XR\'^ xsq\0~\0w\0\0XRP†\àxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\Í r€Õœú\î\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection¨X%Æ£J\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx'),(287,'e18e8818-d765-44b1-922f-e749d5130848','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$e18e8818-d765-44b1-922f-e749d5130848sr\0java.util.DatehjKYt\0\0xpw\0\0XRP÷xsq\0~\0w\0\0XRPxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(288,'8d7cdd20-2096-4e04-b2b0-70f7fcb60042','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$8d7cdd20-2096-4e04-b2b0-70f7fcb60042sr\0java.util.DatehjKYt\0\0xpw\0\0XRPş\Öxsq\0~\0w\0\0XRQ\02xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(289,'76c7bbcb-67f2-4d92-87d1-7cd132577057','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0_t\0$76c7bbcb-67f2-4d92-87d1-7cd132577057sr\0java.util.DatehjKYt\0\0xpw\0\0XRQ·xsq\0~\0w\0\0XRQ\Ûxq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1x'),(290,'00b98cd8-662d-4251-91c0-cb7decca49ed','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$00b98cd8-662d-4251-91c0-cb7decca49edsr\0java.util.DatehjKYt\0\0xpw\0\0XRQ\ìxsq\0~\0w\0\0XRWq\Òxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\Í r€Õœú\î\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection¨X%Æ£J\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\08482063xx\0wq\0~\0xxx'),(291,'0f6b9da0-eefc-4145-931e-497c42105df6','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$0f6b9da0-eefc-4145-931e-497c42105df6sr\0java.util.DatehjKYt\0\0xpw\0\0XRZW\ìxsq\0~\0w\0\0XRq\Çñxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\Í r€Õœú\î\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection¨X%Æ£J\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\08482063xx\0wq\0~\0xxx'),(292,'88221ec1-98c3-496e-902f-5f631fe3037e','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$88221ec1-98c3-496e-902f-5f631fe3037esr\0java.util.DatehjKYt\0\0xpw\0\0XRiSuxsq\0~\0w\0\0XRiU xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(293,'a3e382a9-140d-448a-a04f-54376a046f75','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$a3e382a9-140d-448a-a04f-54376a046f75sr\0java.util.DatehjKYt\0\0xpw\0\0XRjJxsq\0~\0w\0\0XRj2xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\Í r€Õœú\î\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection¨X%Æ£J\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\01xx\0wq\0~\0xxx'),(294,'e732617e-c948-41b7-bdcd-6d75671ea1b9','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$e732617e-c948-41b7-bdcd-6d75671ea1b9sr\0java.util.DatehjKYt\0\0xpw\0\0XRt\'œxsq\0~\0w\0\0XRfxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\Í r€Õœú\î\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection¨X%Æ£J\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx'),(295,'c0b15efc-f031-4ce9-9452-4959e01a338d','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$c0b15efc-f031-4ce9-9452-4959e01a338dsr\0java.util.DatehjKYt\0\0xpw\0\0XRƒsSxsq\0~\0w\0\0XRƒt¥xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(296,'3c3eadef-16dc-4e65-8565-80953810e226','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$3c3eadef-16dc-4e65-8565-80953810e226sr\0java.util.DatehjKYt\0\0xpw\0\0XRƒ|ixsq\0~\0w\0\0XR‡\Æ\Ñxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(297,'55b617e4-34c8-4194-b5c8-0e7b495c02c3','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$55b617e4-34c8-4194-b5c8-0e7b495c02c3sr\0java.util.DatehjKYt\0\0xpw\0\0XR‡º³xsq\0~\0w\0\0XR‡»\Ûxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(298,'57a4c097-a0f9-49e0-9d41-83a0967f2a93','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$57a4c097-a0f9-49e0-9d41-83a0967f2a93sr\0java.util.DatehjKYt\0\0xpw\0\0XRˆlˆxsq\0~\0w\0\0XR\×\àxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(299,'08373f78-42bb-4ad3-94e3-60e7b076ba15','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$08373f78-42bb-4ad3-94e3-60e7b076ba15sr\0java.util.DatehjKYt\0\0xpw\0\0XRŒ\Åxsq\0~\0w\0\0XRŒ\îxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(300,'068e590c-4f83-41ef-8504-0629380c43ae','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$068e590c-4f83-41ef-8504-0629380c43aesr\0java.util.DatehjKYt\0\0xpw\0\0XR•xsq\0~\0w\0\0XR•Fxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(301,'2da27f7b-c9d7-4009-bd7e-ecae2e0bcca9','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0_t\0$2da27f7b-c9d7-4009-bd7e-ecae2e0bcca9sr\0java.util.DatehjKYt\0\0xpw\0\0XR•&\âxsq\0~\0w\0\0XR•“Xxq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1x'),(302,'2007d4d1-4ebb-4c45-96cb-ac95cc1d18c2','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0_t\0$2007d4d1-4ebb-4c45-96cb-ac95cc1d18c2sr\0java.util.DatehjKYt\0\0xpw\0\0XR•“dxsq\0~\0w\0\0XR—v\âxq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1x'),(303,'e75005e8-14ec-494d-8cfc-67270cfbf346','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$e75005e8-14ec-494d-8cfc-67270cfbf346sr\0java.util.DatehjKYt\0\0xpw\0\0XR—v\îxsq\0~\0w\0\0XR˜ª<xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(304,'944cd42f-d110-4095-8d17-34b46b42f2da','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$944cd42f-d110-4095-8d17-34b46b42f2dasr\0java.util.DatehjKYt\0\0xpw\0\0XRŸjxsq\0~\0w\0\0XRŸkzxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(305,'252a8b8d-8e38-42d9-b02d-f0d1427c5b66','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$252a8b8d-8e38-42d9-b02d-f0d1427c5b66sr\0java.util.DatehjKYt\0\0xpw\0\0XRŸƒ\Ñxsq\0~\0w\0\0XRŸ¸²xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(306,'6313ba93-22c5-478b-ac09-8de9a8e8da3e','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$6313ba93-22c5-478b-ac09-8de9a8e8da3esr\0java.util.DatehjKYt\0\0xpw\0\0XR¢B»xsq\0~\0w\0\0XR¢Cıxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(307,'fd96b3dc-d9e7-4191-aaed-332f00d9118a','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$fd96b3dc-d9e7-4191-aaed-332f00d9118asr\0java.util.DatehjKYt\0\0xpw\0\0XR¢`yxsq\0~\0w\0\0XR¤g-xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(308,'61e80a78-36a6-4e81-bb1d-444d9e5de772','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$61e80a78-36a6-4e81-bb1d-444d9e5de772sr\0java.util.DatehjKYt\0\0xpw\0\0XR¨£ƒxsq\0~\0w\0\0XR¨¤¸xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(309,'2efa5361-6693-4fa4-a494-579fff676261','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0ÿt\0$2efa5361-6693-4fa4-a494-579fff676261sr\0java.util.DatehjKYt\0\0xpw\0\0XR¨«@xsq\0~\0w\0\0XS_‡%xsq\0~\0w\0\0XS4-xw\Z\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\Í r€Õœú\î\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection¨X%Æ£J\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx'),(310,'6c17af94-71a7-48fb-ab8f-3e20f2ed687f','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$6c17af94-71a7-48fb-ab8f-3e20f2ed687fsr\0java.util.DatehjKYt\0\0xpw\0\0XR±^fxsq\0~\0w\0\0XR±_|xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(311,'b4de3780-adca-4a1a-b0ed-f5449c6b8b1f','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$b4de3780-adca-4a1a-b0ed-f5449c6b8b1fsr\0java.util.DatehjKYt\0\0xpw\0\0XR¸{†xsq\0~\0w\0\0XR¸|¾xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(312,'f1c30c89-12b9-4948-98dc-fd82651addf3','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0ÿt\0$f1c30c89-12b9-4948-98dc-fd82651addf3sr\0java.util.DatehjKYt\0\0xpw\0\0XRº»ñxsq\0~\0w\0\0XRñª1xsq\0~\0w\0\0XRº½\rxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx'),(313,'8284b9ea-b0cb-4260-bb24-519d2b2ab356','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$8284b9ea-b0cb-4260-bb24-519d2b2ab356sr\0java.util.DatehjKYt\0\0xpw\0\0XV²(“xsq\0~\0w\0\0XV²*Yxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(314,'32f7ca9c-84a6-4328-8c27-5bee368f9a1e','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0ÿt\0$32f7ca9c-84a6-4328-8c27-5bee368f9a1esr\0java.util.DatehjKYt\0\0xpw\0\0XV²GCxsq\0~\0w\0\0XW2:¼xsq\0~\0w\0\0XVûŠ(xw\Z\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx'),(315,'9169a07f-fe36-4e9d-8b04-4ba52e27e875','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$9169a07f-fe36-4e9d-8b04-4ba52e27e875sr\0java.util.DatehjKYt\0\0xpw\0\0XVµ@ÿxsq\0~\0w\0\0XVµBcxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(316,'5cec388f-d4be-414d-8873-fcfb2663c69e','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0ÿt\0$5cec388f-d4be-414d-8873-fcfb2663c69esr\0java.util.DatehjKYt\0\0xpw\0\0XVûL¹xsq\0~\0w\0\0XW2:°xsq\0~\0w\0\0XVûNQxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx'),(317,'061cf0aa-a2ae-428f-9219-d9d6c9174546','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$061cf0aa-a2ae-428f-9219-d9d6c9174546sr\0java.util.DatehjKYt\0\0xpw\0\0XWªImxsq\0~\0w\0\0XWªJ°xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(318,'2d28d72d-a254-491e-b5a3-90eca77f5ef4','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$2d28d72d-a254-491e-b5a3-90eca77f5ef4sr\0java.util.DatehjKYt\0\0xpw\0\0XWªN\èxsq\0~\0w\0\0XW®\äxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\Í r€Õœú\î\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection¨X%Æ£J\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx'),(319,'4e44ad34-b678-4aab-ab41-5d231b23d429','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$4e44ad34-b678-4aab-ab41-5d231b23d429sr\0java.util.DatehjKYt\0\0xpw\0\0XW¯\Û@xsq\0~\0w\0\0XW³M½xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\Í r€Õœú\î\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection¨X%Æ£J\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx'),(320,'5d2e101c-a1d5-41e7-8af4-2b13690d7dc6','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$5d2e101c-a1d5-41e7-8af4-2b13690d7dc6sr\0java.util.DatehjKYt\0\0xpw\0\0XW³Fûxsq\0~\0w\0\0XW³Gùxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(321,'8a457520-752e-4f9c-8eaa-e2a0887a0da7','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$8a457520-752e-4f9c-8eaa-e2a0887a0da7sr\0java.util.DatehjKYt\0\0xpw\0\0XW³spxsq\0~\0w\0\0XWÅšxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\Í r€Õœú\î\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection¨X%Æ£J\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\02303546xx\0wq\0~\0xxx'),(322,'43ade1c0-9540-4fc7-8a9b-3f1a00f9ce29','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$43ade1c0-9540-4fc7-8a9b-3f1a00f9ce29sr\0java.util.DatehjKYt\0\0xpw\0\0XWµD\Íxsq\0~\0w\0\0XWµFxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(323,'8f510937-da88-473e-8129-66ac5c0e7a66','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0ÿt\0$8f510937-da88-473e-8129-66ac5c0e7a66sr\0java.util.DatehjKYt\0\0xpw\0\0XW\Åñ\éxsq\0~\0w\0\0XWü\àxsq\0~\0w\0\0XW\Åóxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx'),(324,'915394f5-2d78-4e4d-ad96-10db8fc806b9','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0ÿt\0$915394f5-2d78-4e4d-ad96-10db8fc806b9sr\0java.util.DatehjKYt\0\0xpw\0\0XW\Å÷yxsq\0~\0w\0\0XWü\ßøxsq\0~\0w\0\0XW\Æ¯xw\Z\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\Í r€Õœú\î\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection¨X%Æ£J\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\03682860xx\0wq\0~\0xxx'),(325,'e47242b6-fa1f-45d3-8925-adf93a214600','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$e47242b6-fa1f-45d3-8925-adf93a214600sr\0java.util.DatehjKYt\0\0xpw\0\0X[\ÇY\Èxsq\0~\0w\0\0X[\Ç\\xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(326,'fdc56a4e-68ae-48d7-b3ed-11d05c8dafea','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0_t\0$fdc56a4e-68ae-48d7-b3ed-11d05c8dafeasr\0java.util.DatehjKYt\0\0xpw\0\0X[\Çd–xsq\0~\0w\0\0X[\Ç\ç_xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1x'),(327,'ddbde4bc-1d71-442f-a480-dc0fc33541e3','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$ddbde4bc-1d71-442f-a480-dc0fc33541e3sr\0java.util.DatehjKYt\0\0xpw\0\0X[\Ç\çjxsq\0~\0w\0\0X[\Ênxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-helpxx'),(328,'1b08905b-fbb3-48f6-9199-f37a16ee9f41','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$1b08905b-fbb3-48f6-9199-f37a16ee9f41sr\0java.util.DatehjKYt\0\0xpw\0\0X[\Êõ`xsq\0~\0w\0\0X[Ë—;xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0POSTpt\0*/happy-help/api/v1/sms/captcha/18159801259xx'),(329,'b2e186ed-3531-4a24-858e-04bbb9429c93','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$b2e186ed-3531-4a24-858e-04bbb9429c93sr\0java.util.DatehjKYt\0\0xpw\0\0X[\ÌŸxsq\0~\0w\0\0X[\Ï-)xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(330,'5b06b14e-c48a-4756-a667-09330ce0a9d5','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$5b06b14e-c48a-4756-a667-09330ce0a9d5sr\0java.util.DatehjKYt\0\0xpw\0\0X[Ì–‡xsq\0~\0w\0\0X[Ì˜<xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(331,'1383aa72-b001-481f-9363-73df4f138e07','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$1383aa72-b001-481f-9363-73df4f138e07sr\0java.util.DatehjKYt\0\0xpw\0\0X[\Ï\'µxsq\0~\0w\0\0X[\Ï(›xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(332,'11229f5b-a504-413a-a216-7b72cea72971','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0ÿt\0$11229f5b-a504-413a-a216-7b72cea72971sr\0java.util.DatehjKYt\0\0xpw\0\0X[Ô,xsq\0~\0w\0\0X\\{xsq\0~\0w\0\0X[Ô]xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx'),(333,'ed443c83-911f-4fcd-9cb1-c382cacc6a75','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0ÿt\0$ed443c83-911f-4fcd-9cb1-c382cacc6a75sr\0java.util.DatehjKYt\0\0xpw\0\0X[Ô”xsq\0~\0w\0\0X\\{xsq\0~\0w\0\0X[Ô”¤xw\Z\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx'),(334,'359cb1ac-f442-49a4-8afd-d062c5cefbc3','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$359cb1ac-f442-49a4-8afd-d062c5cefbc3sr\0java.util.DatehjKYt\0\0xpw\0\0X\\…?xsq\0~\0w\0\0X\\…@¥xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(335,'55484257-6927-4f84-a379-1cc0f0cbd2d3','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$55484257-6927-4f84-a379-1cc0f0cbd2d3sr\0java.util.DatehjKYt\0\0xpw\0\0X\\…GDxsq\0~\0w\0\0X\\j#xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0\'/happy-help/api/v1/anon/show/loadingPicxx'),(336,'afdcf8aa-4df1-41f3-87aa-05fd19c3f213','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$afdcf8aa-4df1-41f3-87aa-05fd19c3f213sr\0java.util.DatehjKYt\0\0xpw\0\0X\\Š\Üxsq\0~\0w\0\0X\\Š	9xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(337,'9da1912a-136e-4e13-96a8-18a2f45e06aa','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$9da1912a-136e-4e13-96a8-18a2f45e06aasr\0java.util.DatehjKYt\0\0xpw\0\0X\\˜xsq\0~\0w\0\0X\\\Ïxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(338,'ab498fc6-1b66-4910-be74-d86357da30c6','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$ab498fc6-1b66-4910-be74-d86357da30c6sr\0java.util.DatehjKYt\0\0xpw\0\0X\\\Í	xsq\0~\0w\0\0X\\Ÿ³¾xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(339,'db93ba58-2284-4a4b-8bf7-c62e2f959cb8','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$db93ba58-2284-4a4b-8bf7-c62e2f959cb8sr\0java.util.DatehjKYt\0\0xpw\0\0X\\Ÿª\Ãxsq\0~\0w\0\0X\\Ÿ¬<xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(340,'74a54438-608c-402b-be6c-1b3794f0d895','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$74a54438-608c-402b-be6c-1b3794f0d895sr\0java.util.DatehjKYt\0\0xpw\0\0X\\ \æxsq\0~\0w\0\0X\\ \çcxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(341,'99d5938d-a051-4767-a744-8d8a619dd992','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$99d5938d-a051-4767-a744-8d8a619dd992sr\0java.util.DatehjKYt\0\0xpw\0\0X\\ \í xsq\0~\0w\0\0X\\ \íFxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(342,'83bd4416-07bb-4779-b742-3baebc00e06d','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$83bd4416-07bb-4779-b742-3baebc00e06dsr\0java.util.DatehjKYt\0\0xpw\0\0X\\Ä¼hxsq\0~\0w\0\0X\\Ä½\Ëxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(343,'140317f4-8a12-4815-8433-d1117de3ad62','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0_t\0$140317f4-8a12-4815-8433-d1117de3ad62sr\0java.util.DatehjKYt\0\0xpw\0\0X\\\ÄÃ¤xsq\0~\0w\0\0X\\\Ên*xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1x'),(344,'9866d3a6-8f73-416e-9dfe-e1d5b6120cdc','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$9866d3a6-8f73-416e-9dfe-e1d5b6120cdcsr\0java.util.DatehjKYt\0\0xpw\0\0X\\\Çöóxsq\0~\0w\0\0X\\\Çø[xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(345,'961fa142-1ea7-4f24-a6da-8ceee7c2d904','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$961fa142-1ea7-4f24-a6da-8ceee7c2d904sr\0java.util.DatehjKYt\0\0xpw\0\0X\\\Ên=xsq\0~\0w\0\0X]ÀÀ\Âxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\Í r€Õœú\î\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection¨X%Æ£J\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx'),(346,'e7413c02-2286-44e0-8c3d-36bdda9491b3','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$e7413c02-2286-44e0-8c3d-36bdda9491b3sr\0java.util.DatehjKYt\0\0xpw\0\0X\\\ÌYZxsq\0~\0w\0\0X\\\ÌZ‰xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(347,'a5261ee2-f843-4ff0-ad28-ac4cba5780bd','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0ÿt\0$a5261ee2-f843-4ff0-ad28-ac4cba5780bdsr\0java.util.DatehjKYt\0\0xpw\0\0X\\÷½xsq\0~\0w\0\0X].«Oxsq\0~\0w\0\0X\\÷¿üxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx'),(348,'73f891ed-d40d-460b-a4b6-4090bdc9f64e','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$73f891ed-d40d-460b-a4b6-4090bdc9f64esr\0java.util.DatehjKYt\0\0xpw\0\0X]Àµ+xsq\0~\0w\0\0X]À¶wxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(349,'2f98f213-5316-4475-b25c-3a7d0f6b111d','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$2f98f213-5316-4475-b25c-3a7d0f6b111dsr\0java.util.DatehjKYt\0\0xpw\0\0X]\Â5$xsq\0~\0w\0\0X]\Â6—xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(350,'afbe47e7-7451-4ef2-9b8b-2ad90726fde5','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$afbe47e7-7451-4ef2-9b8b-2ad90726fde5sr\0java.util.DatehjKYt\0\0xpw\0\0X]\Â<\Âxsq\0~\0w\0\0X]\Ãxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(351,'808de96f-cbd1-40a6-a658-b5e36ccc749f','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$808de96f-cbd1-40a6-a658-b5e36ccc749fsr\0java.util.DatehjKYt\0\0xpw\0\0X]Ä°ğxsq\0~\0w\0\0X]\É\Zxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\Í r€Õœú\î\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection¨X%Æ£J\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\08482063xx\0wq\0~\0xxx'),(352,'1fa416a1-8451-495c-ba5f-34c485abd516','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$1fa416a1-8451-495c-ba5f-34c485abd516sr\0java.util.DatehjKYt\0\0xpw\0\0X]É¨xsq\0~\0w\0\0X]öıùxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\Í r€Õœú\î\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection¨X%Æ£J\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx'),(353,'d4d7089c-26f0-4449-aecb-e0cc7a923f50','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$d4d7089c-26f0-4449-aecb-e0cc7a923f50sr\0java.util.DatehjKYt\0\0xpw\0\0X]öö\çxsq\0~\0w\0\0X]öø%xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(354,'fc343250-d9af-4534-942f-e39c36dd1462','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$fc343250-d9af-4534-942f-e39c36dd1462sr\0java.util.DatehjKYt\0\0xpw\0\0X`´’”xsq\0~\0w\0\0X`´“\åxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(355,'9fee1874-810f-4da4-834c-873a007f9f54','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$9fee1874-810f-4da4-834c-873a007f9f54sr\0java.util.DatehjKYt\0\0xpw\0\0X`´šFxsq\0~\0w\0\0X`Ä xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(356,'08c4c3f9-852f-4cba-8c6c-a49efdcf9781','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$08c4c3f9-852f-4cba-8c6c-a49efdcf9781sr\0java.util.DatehjKYt\0\0xpw\0\0X`½`øxsq\0~\0w\0\0X`½bjxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(357,'a98060b7-69bf-4e5d-8d03-14746cf9b305','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$a98060b7-69bf-4e5d-8d03-14746cf9b305sr\0java.util.DatehjKYt\0\0xpw\0\0X`Áyxsq\0~\0w\0\0X`Ázxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(358,'c2b264db-39d4-4c80-acf7-2f7dcbe02713','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$c2b264db-39d4-4c80-acf7-2f7dcbe02713sr\0java.util.DatehjKYt\0\0xpw\0\0X`\Ä|\ãxsq\0~\0w\0\0X`\Ä~?xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(359,'218a64ea-2e9c-4f29-8fb3-c811bcab11a1','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$218a64ea-2e9c-4f29-8fb3-c811bcab11a1sr\0java.util.DatehjKYt\0\0xpw\0\0X`Æ¬Zxsq\0~\0w\0\0X`Æ­¸xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(360,'4229d05a-ccd8-428e-9805-2f44e5fc2a17','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0ÿt\0$4229d05a-ccd8-428e-9805-2f44e5fc2a17sr\0java.util.DatehjKYt\0\0xpw\0\0X`Æ³exsq\0~\0w\0\0Xa	¡xsq\0~\0w\0\0X`\Ø\äyxw\Z\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx'),(361,'da6cc000-9e68-4e51-acb4-ce612753cd31','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$da6cc000-9e68-4e51-acb4-ce612753cd31sr\0java.util.DatehjKYt\0\0xpw\0\0X`\Ñ#xsq\0~\0w\0\0X`\Ñ%xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(362,'e3df689a-0842-4dfd-af61-9edc08fdd31f','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0ÿt\0$e3df689a-0842-4dfd-af61-9edc08fdd31fsr\0java.util.DatehjKYt\0\0xpw\0\0X`\Ò+ƒxsq\0~\0w\0\0Xa	xsq\0~\0w\0\0X`\Ò,¾xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx'),(363,'628f520f-597b-4719-a90f-938516660743','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$628f520f-597b-4719-a90f-938516660743sr\0java.util.DatehjKYt\0\0xpw\0\0Xa\Â Œxsq\0~\0w\0\0Xa\Â\"\Şxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(364,'ed715ca3-b350-497c-a596-3e723b5b1df9','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0ÿt\0$ed715ca3-b350-497c-a596-3e723b5b1df9sr\0java.util.DatehjKYt\0\0xpw\0\0Xa\Â*\íxsq\0~\0w\0\0Xb½€«xsq\0~\0w\0\0Xb†˜\Òxw\Z\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\Í r€Õœú\î\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection¨X%Æ£J\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx'),(365,'ef115871-07ce-40d5-b53c-2cc2585855a3','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$ef115871-07ce-40d5-b53c-2cc2585855a3sr\0java.util.DatehjKYt\0\0xpw\0\0Xa\ÈWbxsq\0~\0w\0\0Xa\ÈXóxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(366,'4eac328c-c501-4579-b4aa-8c86cf011cc6','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0ÿt\0$4eac328c-c501-4579-b4aa-8c86cf011cc6sr\0java.util.DatehjKYt\0\0xpw\0\0Xa\Ê\Íxsq\0~\0w\0\0Xb\0\Úxsq\0~\0w\0\0Xa\Ê:xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx'),(367,'4d127e02-05ae-425e-a48c-fc150245e588','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0ÿt\0$4d127e02-05ae-425e-a48c-fc150245e588sr\0java.util.DatehjKYt\0\0xpw\0\0Xb†’–xsq\0~\0w\0\0Xb½€¦xsq\0~\0w\0\0Xb†“\æxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx'),(368,'5f5e0f91-5431-45cf-9912-6313fb6eda33','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0_t\0$5f5e0f91-5431-45cf-9912-6313fb6eda33sr\0java.util.DatehjKYt\0\0xpw\0\0Xb™›\ìxsq\0~\0w\0\0Xb²/xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1x'),(369,'e6f2bb87-b0ae-4e90-b3e6-f30e7d74f3b4','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0_t\0$e6f2bb87-b0ae-4e90-b3e6-f30e7d74f3b4sr\0java.util.DatehjKYt\0\0xpw\0\0Xb²@xsq\0~\0w\0\0Xb\åxq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1x'),(370,'1f2b3bbf-0820-4813-945c-ca68138a8960','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$1f2b3bbf-0820-4813-945c-ca68138a8960sr\0java.util.DatehjKYt\0\0xpw\0\0Xb\å›xsq\0~\0w\0\0Xb\âw\Ûxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\Í r€Õœú\î\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection¨X%Æ£J\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx'),(371,'899a0f28-d714-4a0f-ad35-f26e1772ed37','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$899a0f28-d714-4a0f-ad35-f26e1772ed37sr\0java.util.DatehjKYt\0\0xpw\0\0Xb\Ë\İ(xsq\0~\0w\0\0Xb\ËŞxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(372,'b1e4f121-e3c1-4c50-8155-bbe3ca60df8f','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$b1e4f121-e3c1-4c50-8155-bbe3ca60df8fsr\0java.util.DatehjKYt\0\0xpw\0\0Xb\Õÿªxsq\0~\0w\0\0Xb\Ö\0şxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(373,'2ebbc62c-b15a-4b65-b8be-2a21c147709f','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$2ebbc62c-b15a-4b65-b8be-2a21c147709fsr\0java.util.DatehjKYt\0\0xpw\0\0Xb\âM\Ëxsq\0~\0w\0\0Xb\âOxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(374,'465c0a9a-ef01-4003-a1bb-9372d194feb7','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$465c0a9a-ef01-4003-a1bb-9372d194feb7sr\0java.util.DatehjKYt\0\0xpw\0\0Xbû>xsq\0~\0w\0\0Xbûÿxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(375,'e7aa4f49-15a1-4f71-b1ec-f78a0d3f17b2','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$e7aa4f49-15a1-4f71-b1ec-f78a0d3f17b2sr\0java.util.DatehjKYt\0\0xpw\0\0Xbûxsq\0~\0w\0\0Xc#”xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(376,'da870535-7413-4356-970a-207460193f57','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$da870535-7413-4356-970a-207460193f57sr\0java.util.DatehjKYt\0\0xpw\0\0Xbıt0xsq\0~\0w\0\0Xbıuhxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(377,'c16586b3-18d0-45b8-8aa2-5e8e0a8ac7b6','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$c16586b3-18d0-45b8-8aa2-5e8e0a8ac7b6sr\0java.util.DatehjKYt\0\0xpw\0\0Xc/Sxsq\0~\0w\0\0Xc0¸xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(378,'ae49dd17-040a-4d26-8400-58920c64ef23','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$ae49dd17-040a-4d26-8400-58920c64ef23sr\0java.util.DatehjKYt\0\0xpw\0\0Xc›õxsq\0~\0w\0\0Xc)xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(379,'02106559-c7e1-413e-9d0b-4789bf7badfb','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$02106559-c7e1-413e-9d0b-4789bf7badfbsr\0java.util.DatehjKYt\0\0xpw\0\0Xc«Lxsq\0~\0w\0\0Xc¬¹xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(380,'e8dc97af-d698-48e1-b2e5-1cc24a4247a2','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$e8dc97af-d698-48e1-b2e5-1cc24a4247a2sr\0java.util.DatehjKYt\0\0xpw\0\0Xc±Yxsq\0~\0w\0\0Xc³xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(381,'2b3a1b5e-95a3-40d2-bfa6-1c28eee0815b','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$2b3a1b5e-95a3-40d2-bfa6-1c28eee0815bsr\0java.util.DatehjKYt\0\0xpw\0\0Xcº\çxsq\0~\0w\0\0XclAxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(382,'b97a6c21-41e1-4eb1-a449-f0c108d7eecb','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$b97a6c21-41e1-4eb1-a449-f0c108d7eecbsr\0java.util.DatehjKYt\0\0xpw\0\0XcIjxsq\0~\0w\0\0XcKxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(383,'c8cd61ad-19d3-43c6-95f7-10a3d9403b21','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0ÿt\0$c8cd61ad-19d3-43c6-95f7-10a3d9403b21sr\0java.util.DatehjKYt\0\0xpw\0\0XeóOSxsq\0~\0w\0\0Xf*<\çxsq\0~\0w\0\0XeóR…xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx'),(384,'f89a4a0b-464c-412a-a052-25c8da1fec0b','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0ÿt\0$f89a4a0b-464c-412a-a052-25c8da1fec0bsr\0java.util.DatehjKYt\0\0xpw\0\0Xeó\\xsq\0~\0w\0\0Xf{\î\Øxsq\0~\0w\0\0XfWm\äxw\Z\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx'),(385,'ae3d1c40-9f54-47a5-8d45-c8a2bbb28794','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0ÿt\0$ae3d1c40-9f54-47a5-8d45-c8a2bbb28794sr\0java.util.DatehjKYt\0\0xpw\0\0Xf€¸*xsq\0~\0w\0\0Xf·¦,xsq\0~\0w\0\0Xf€¹šxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx'),(386,'46c5f672-a4d3-4937-8fdb-10c2529d32d1','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$46c5f672-a4d3-4937-8fdb-10c2529d32d1sr\0java.util.DatehjKYt\0\0xpw\0\0Xf€Àxsq\0~\0w\0\0Xf\ïP†xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\Í r€Õœú\î\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection¨X%Æ£J\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx'),(387,'0761401c-b534-447d-b3e9-b5ed2d12c474','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$0761401c-b534-447d-b3e9-b5ed2d12c474sr\0java.util.DatehjKYt\0\0xpw\0\0Xfİ¹\Öxsq\0~\0w\0\0Xfİ»\Âxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx'),(388,'2ac8d67d-b9a7-4055-b662-cac2fc7f465c','¬\í\0sr\0*org.apache.shiro.session.mgt.SimpleSession¡¸ÕŒbn\0\0xpw\0\Ût\0$2ac8d67d-b9a7-4055-b662-cac2fc7f465csr\0java.util.DatehjKYt\0\0xpw\0\0Xf\ä?\àxsq\0~\0w\0\0Xf\äA°xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest¯\Î<­y‚Êº\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_setting`
--

LOCK TABLES `hh_setting` WRITE;
/*!40000 ALTER TABLE `hh_setting` DISABLE KEYS */;
INSERT INTO `hh_setting` VALUES (3,'æ¨é€èŒƒå›´','å…¨å›½','80','ç´§æ€¥æ±‚åŠ©æ¨é€èŒƒå›´'),(5,'æ¨é€èŒƒå›´','çœ','45','ç´§æ€¥æ±‚åŠ©æ¨é€èŒƒå›´'),(6,'æ¨é€èŒƒå›´','å¸‚','20','ç´§æ€¥æ±‚åŠ©æ¨é€èŒƒå›´'),(7,'æ¨é€èŒƒå›´','åŒº','10','ç´§æ€¥æ±‚åŠ©æ¨é€èŒƒå›´'),(8,'æµ‹è¯•','æµ‹è¯•','test','test');
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
  `relate_url` varchar(450) DEFAULT NULL,
  `relate_article_title` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_show`
--

LOCK TABLES `hh_show` WRITE;
/*!40000 ALTER TABLE `hh_show` DISABLE KEYS */;
INSERT INTO `hh_show` VALUES (1,'é—ªå±é¡µ','/pic/Images/show/68bf4ccb-dea8-4d46-aa61-3b2df5dee7e3.jpg','2016-10-10 14:37:52','loadingPic',12,1,'nono','test'),(2,'é—ªå±é¡µ','/pic/Images/show/5df674eb-1140-49fa-8e2c-0a5252901028.jpg','2016-10-10 14:37:52','loadingPic',21,1,NULL,NULL),(3,'è½®æ’­å›¾1','/pic/Images/show/6dc68c14-21b0-4b9b-ae47-4f50730ec115.jpg','2016-11-15 15:31:06','è½®æ’­å›¾',1,0,'nono','test');
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
  `image_url` varchar(300) DEFAULT 'nono',
  `money` double DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT '1999-01-01 01:01:01',
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
  `need_user_number` int(11) DEFAULT NULL,
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
INSERT INTO `hh_task_info` VALUES (1,'title','ssssssssssssssssssss','nono',10000.23,'12345678909','1999-01-01 01:01:01','1999-01-01 01:01:01',1,0,1,1,0,7,20,'country','province','city','area','street','detai_position',NULL),(3,'title','bbbbbbbbbbbbbbbbbb','nono',10000.23,'12345678909','1999-01-01 01:01:01','1999-01-01 01:01:01',0,0,1,0,0,7,20,'country','province','city','area','street','detai_position',NULL),(4,'title','ccccccccccccccccccc','nono',10000.23,'12345678909','1999-01-01 01:01:01','1999-01-01 01:01:01',0,1,1,1,0,7,20,'country','province','city','area','street','detai_position',NULL),(5,'title','this is context','nono',10000.23,'12345678909','1999-01-01 01:01:01','1999-01-01 01:01:01',1,0,1,0,0,7,20,'country','province','city','area','street','detai_position',NULL),(6,'title','this is context','nono',10000.23,'12345678909','1999-01-01 01:01:01','1999-01-01 01:01:01',0,0,0,0,0,7,20,'country','province','city','area','street','detai_position',NULL),(9,'title','this is context','nono',10000.23,'12345678909','1999-01-01 01:01:01','1999-01-01 01:01:01',1,0,1,1,0,7,20,'country','province','city','area','street','detai_position',NULL),(11,'title','this is context','nono',10000.23,'12345678909','1999-01-01 01:01:01','1999-01-01 01:01:01',1,0,1,1,0,7,20,'country','province','city','area','street','detai_position',NULL),(12,'title','this is context','nono',10000.23,'12345678909','1999-01-01 01:01:01','1999-01-01 01:01:01',1,0,1,1,0,7,20,'country','province','city','area','street','detai_position',NULL),(13,'title','this is context','nono',10000.23,'12345678909','1999-01-01 01:01:01','1999-01-01 01:01:01',1,0,1,1,0,7,20,'country','province','city','area','street','detai_position',NULL),(14,'title','this is context','nono',10000.23,'12345678909','1999-01-01 01:01:01','1999-01-01 01:01:01',1,0,1,1,0,7,20,'country','province','city','area','street','detai_position',NULL),(15,'title','this is context','nono',10000.23,'12345678909','1999-01-01 01:01:01','1999-01-01 01:01:01',1,0,1,1,0,7,20,'country','province','city','area','street','detai_position',NULL),(16,'title','this is context','nono',10000.23,'12345678909','1999-01-01 01:01:01','1999-01-01 01:01:01',1,0,1,1,0,7,20,'country','province','city','area','street','detai_position',NULL),(17,'title','this is context','nono',10000.23,'12345678909','1999-01-01 01:01:01','1999-01-01 01:01:01',1,0,1,1,0,7,20,'country','province','city','area','street','detai_position',NULL),(20,'title','this is context','nono',10000.23,'12345678909','1999-01-01 01:01:01','1999-01-01 01:01:01',1,0,1,1,0,7,20,'country','province','city','area','street','detai_position',NULL),(21,'title','this is context','nono',10000.23,'12345678909','1999-01-01 01:01:01','1999-01-01 01:01:01',1,0,1,1,0,7,20,'country','province','city','area','street','detai_position',NULL),(22,'title','this is context','nono',10000.23,'12345678909','1999-01-01 01:01:01','1999-01-01 01:01:01',1,0,1,1,0,7,20,'country','province','city','area','street','detai_position',NULL),(23,'title','this is context','nono',10000.23,'12345678909','1999-01-01 01:01:01','1999-01-01 01:01:01',1,0,1,1,0,7,20,'country','province','city','area','street','detai_position',NULL);
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
  `nickname` varchar(45) DEFAULT 'æ˜µç§°',
  `real_name` varchar(45) DEFAULT 'åå­—',
  `user_identify` varchar(100) DEFAULT NULL,
  `current_area` varchar(45) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  `is_new` tinyint(1) DEFAULT '1',
  `create_time` datetime DEFAULT NULL,
  `account` double DEFAULT '0',
  `contribute_score` double DEFAULT '0',
  `honer_score` double DEFAULT '0',
  `grade_total` varchar(45) DEFAULT '0',
  `grade_times` int(11) DEFAULT '0',
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
  `photo` varchar(300) DEFAULT '/happy-help/productImages/moren.jpg',
  `cookie` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_user`
--

LOCK TABLES `hh_user` WRITE;
/*!40000 ALTER TABLE `hh_user` DISABLE KEYS */;
INSERT INTO `hh_user` VALUES (1,'admin','12345678901','d3c59d25033dbf980d29554025c23a75','8d78869f470951332959580424d4bf4f',0,'1,2,3',NULL,'san','å¼ ä¸‰','123456789009877654',NULL,1,1,NULL,NULL,NULL,NULL,'18.0',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/happy-help/productImages/moren.jpg','46c5f672-a4d3-4937-8fdb-10c2529d32d1'),(6,'1','1','53ea4fe818098d74c87a6fa4884c4ebd','6007b927c1fc7ecc747f860ceed897ed',0,'2',NULL,NULL,'1','1',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/happy-help/productImages/moren.jpg','e6f2bb87-b0ae-4e90-b3e6-f30e7d74f3b4'),(7,'2','2','918de6877666153c2f429b868b8a8163','d31382211bcab0d013d6209e78c3f76a',0,'1',NULL,NULL,'2','2',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/happy-help/productImages/moren.jpg',NULL),(8,'3','3','d698aa30530af381a82ce34332996ee5','12ae991ac129fb7683f86f2158b25763',0,'1',NULL,NULL,'3222','3',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/happy-help/productImages/moren.jpg',NULL),(9,'4','4','ac64868c8d9ce37fae3ff057ef89e4c0','9cbcc0b6592b9a0a247925eade93dc49',0,'1',NULL,NULL,'4','4',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/happy-help/productImages/moren.jpg',NULL),(10,'5','5','b1bba3b073c062ca3af5ba8c4bc9b8c2','f5e718ee6a98b87c79dce45e64a5ca61',0,'1',NULL,NULL,'552','5',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/happy-help/productImages/moren.jpg',NULL),(15,'6','6','0b85021e22c2d3d8b5734d539add88c3','a3268a17cd029b8de1c613ec510f85fe',0,'2',NULL,'6','6','6','',0,1,NULL,NULL,6,9,'9',9,'9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2','/pic/Images/head/6c9d11a4-5fc8-4f8e-9c40-35ee4ce8b107.jpg',NULL),(16,'7','7','8d3e12385d943b0e5575feed472a29e9','9037ad6899d8650c63d86b4bda54e652',1,'2',NULL,'7','7','7','',0,1,NULL,NULL,7,9,'9',9,'9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','/pic/Images/head/54c17ee5-01f5-463d-a4f7-846e8c6426fb.jpg',NULL),(17,'8','8','d3c59d25033dbf980d29554025c23a75','8d78869f470951332959580424d4bf4f',0,'2',NULL,'8','8','8','',0,1,NULL,NULL,8,9,'9.0',9,'9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','/pic/Images/head/476cc846-1abf-42c8-a9ce-e5020b51eff0.jpg',NULL),(18,'9','9','912ff0c3c0cdd5e9ed23fff35991e3cd','18ee76bb39a55cb24b6242a0c96db597',0,'2',NULL,'9','9','9','9',0,1,NULL,NULL,9,9,'9',9,'9111',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/happy-help/productImages/moren.jpg',NULL),(19,'10','10','d3c59d25033dbf980d29554025c23a75','8d78869f470951332959580424d4bf4f',0,'2',NULL,'10','10','10',NULL,0,1,NULL,NULL,9,9,'9',9,'9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/happy-help/productImages/moren.jpg',NULL),(20,'qwe123qwe','12312312312','e5ce8cc8181c877e5d44a88be8a7c845','18fffee607f3f8b16bfd6c6ec328d669',0,'2',NULL,'123','asd','9','çˆ±ä»•è¾¾å¤š',0,1,NULL,NULL,0,0,'20',4,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/happy-help/productImages/moren.jpg',NULL),(21,'qwet1','12312312310','a09ab74baa8ccb2b67007afff7187acc','61ff3008cdb3df40b7d792e909284e2d',0,'2',NULL,'11q','çˆ±çš„','9','é˜¿è¨å¾·',0,1,NULL,NULL,1,1,'1',1,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/happy-help/productImages/moren.jpg',NULL),(22,'asdf12','123123132222','e0a704c3049b30718c4576eebe1af388','41a1fc2d8d33cc0c4c8ab7f23080c321',0,'2',NULL,'qwe','123','8','qe',0,1,NULL,NULL,1,1,'11',1,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/happy-help/productImages/moren.jpg',NULL),(23,'asdf12w','12312313222221','9794eeb17b076358d0b275af991d30fb','2868351f48f7ae71cf16091d23d06c1d',0,'2',NULL,'qwe','1233333','undefined','qe',0,1,NULL,NULL,1,1,'11',1,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/happy-help/productImages/moren.jpg',NULL),(24,'asdf12w1','123123132222212','afbf49c571b88bd684c03319452ccf2d','6f168dd62b75371c215d2c6b7a8b9d79',0,'2',NULL,'qwe','123q','234','qe',0,1,NULL,NULL,1,1,'11',1,'1',NULL,NULL,NULL,'234',NULL,NULL,NULL,NULL,NULL,NULL,'/happy-help/productImages/moren.jpg',NULL),(32,'1231','123123','e1e34f96c75e5f92f7acee99b75534cc','c2173111727625a5ecf1566129b5c763',0,'1',NULL,NULL,'3','3',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/happy-help/productImages/moren.jpg',NULL),(36,'234','12312222','04f4056cc6b539541c6283c29b8eaa97','5e1ffc1f8235d9e961ddec6504a89440',0,'1',NULL,NULL,'2','21',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/happy-help/productImages/moren.jpg','2735f2c9-b5ba-475c-a9e7-f0392958f1aa'),(37,'1222222','222211111','35351fe8f37660f4c53c7f27a7362afa','e513e355dadbc3a8bcbe4faa569b8a37',0,'1',NULL,NULL,'221q','22',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/happy-help/productImages/moren.jpg',NULL),(38,'333332222','2122211','9c12240963d1e2915df56641afbf7f5a','fec68ed77691a3ea26b110961edfe7a7',0,'2',NULL,'2','2','2','2',0,1,NULL,NULL,1,1,'1',1,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/happy-help/productImages/moren.jpg',NULL),(39,'weqw22','1233222111','f0b61cc89212f1059883699adaecdeeb','8885cd761d502ca4257e578e72d9040b',1,'2',NULL,'123','123','123','123',0,1,NULL,NULL,12,12,'1',1,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/happy-help/productImages/moren.jpg',NULL),(40,'rty789','098890','5f57ca4fa2ac60c79a5c8a6d53ee718d','22d696029470aa9efdaf47f20875a8a2',0,'2',NULL,'123','123','123','1',0,1,NULL,NULL,1,1,'11',1,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','/happy-help/productImages/moren.jpg',NULL),(41,'rfv','32221','7396c5a2f73def7d917bd08fa5ea473c','5d1225cae818126f657799e5f67bf4b6',1,'2',NULL,'123','1','1','1',0,1,NULL,NULL,1,1,'1',1,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','/happy-help/productImages/moren.jpg',NULL),(42,'8482063','18159801259','60e5aef78849723796c44e17d56d3f79','0d8017bafae5d552eca815a3e769e9c2',0,'2',NULL,'nick',NULL,NULL,NULL,0,1,NULL,NULL,0,0,'0.0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/happy-help/productImages/moren.jpg','808de96f-cbd1-40a6-a658-b5e36ccc749f'),(43,'6069140','18159801211','123d491444893e62ed6a093a9078c231','4aabb821a28d8be9a74c8d024422a2f8',0,'2',NULL,'nick',NULL,NULL,NULL,0,1,NULL,NULL,0,0,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/happy-help/productImages/moren.jpg',NULL),(44,'1698680','18159801212','0933d95785cb6ce84d69fffa1a739441','f2e6e4561b038f83e893abfb8958e6d1',0,'2',NULL,'nick',NULL,NULL,NULL,0,1,NULL,NULL,0,0,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/happy-help/productImages/moren.jpg',NULL),(45,'8757791','18159801001','5836dc60d258b5b463ed87bccb68656d','58d54da521457c74423917b048007af2',0,'2',NULL,'nick',NULL,NULL,NULL,0,1,NULL,NULL,0,0,'0',0,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/happy-help/productImages/moren.jpg',NULL),(46,'2303546','18159801002','3ebbfd647566f9f88954921125bd2ba8','8b3a8f3341b6046a9ad45f0b2e530978',0,'2',NULL,'nick',NULL,NULL,NULL,0,1,NULL,NULL,0,0,'0.0',0,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/happy-help/productImages/moren.jpg','8a457520-752e-4f9c-8eaa-e2a0887a0da7'),(47,'9272096','18159801003','c0bba4c3f7cb5c891a93f2bdf6989c08','fc034420bfd98c320e909d96a5fee7ea',0,'2',NULL,'nick',NULL,NULL,NULL,0,1,NULL,NULL,0,0,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/happy-help/productImages/moren.jpg',NULL),(48,'3682860','18159801004','5987531c33375ec9a3ba88703e14d67f','099c5fcf960e0ec33f3117f44ae0c782',0,'2',NULL,'nick',NULL,NULL,NULL,0,1,NULL,NULL,0,0,'0.0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/happy-help/productImages/moren.jpg','915394f5-2d78-4e4d-ad96-10db8fc806b9'),(49,'2831978','18159800001','c64a666a58bfdf1eeaeb6785c84ec57d','6ec8cc8dc75f7c575fa0de9a2abdec66',0,'2',NULL,NULL,NULL,NULL,NULL,0,1,NULL,0,0,0,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/happy-help/productImages/moren.jpg',NULL),(50,'1875892','18159800003','1df30f8e88d613c9cdeaab13ef8dbe75','051c23ee68286015c68a5ae90d78deac',0,'2',NULL,NULL,NULL,NULL,NULL,0,1,NULL,0,0,0,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/happy-help/productImages/moren.jpg',NULL);
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

-- Dump completed on 2016-11-15 15:42:52

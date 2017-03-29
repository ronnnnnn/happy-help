-- MySQL dump 10.13  Distrib 5.7.16, for Linux (x86_64)
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
  `context` varchar(500) DEFAULT NULL,
  `image_url` varchar(500) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `visit_click` varchar(500) DEFAULT NULL,
  `is_checked` tinyint(1) DEFAULT '0',
  `is_deleted` tinyint(1) DEFAULT '0',
  `is_pass` tinyint(4) DEFAULT '0',
  `hh_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_article`
--

LOCK TABLES `hh_article` WRITE;
/*!40000 ALTER TABLE `hh_article` DISABLE KEYS */;
INSERT INTO `hh_article` VALUES (12,'test22','ddddddddddddtsfsdfddddddddddddtsfsdfddddddddddddtsfsdfddddddddddddtsfsdfddddddddddddtsfsdfddddddddddddtsfsdfddddddddddddtsfsdfddddddddddddtsfsdfddddddddddddtsfsdfddddddddddddtsfsdf','/pic/Images/article/2c36c529-33e5-40ad-bb8d-4b87b72fcd55.jpg,/pic/Images/article/2c36c529-33e5-40ad-bb8d-4b87b72fcd55.jpg,/pic/Images/article/2c36c529-33e5-40ad-bb8d-4b87b72fcd55.jpg','2016-10-23 10:20:32','1,2,3',0,0,1,20);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_captcha`
--

LOCK TABLES `hh_captcha` WRITE;
/*!40000 ALTER TABLE `hh_captcha` DISABLE KEYS */;
INSERT INTO `hh_captcha` VALUES (1,'1231','2016-11-23 11:12:34'),(2,'1233','2016-10-24 10:55:34'),(3,'2222','2016-10-24 10:55:34'),(4,'1123','2016-10-24 10:55:34'),(5,'3376','2016-11-13 11:51:20'),(6,'6632','2016-11-13 15:10:05'),(7,'341851','2016-12-17 10:58:02');
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
  `topic` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_category`
--

LOCK TABLES `hh_category` WRITE;
/*!40000 ALTER TABLE `hh_category` DISABLE KEYS */;
INSERT INTO `hh_category` VALUES (1,'类别','0',0,'0/',1,'根类别',NULL),(7,'乐助圈','10',1,'0/1/',10,'类别',''),(10,'推荐','01',1,'0/1/',NULL,'类别','0'),(11,'寻物','02',1,'0/1/',NULL,'类别','0'),(12,'找人','03',1,'0/1/',NULL,'类别','0'),(13,'家政','04',1,'0/1/',NULL,'类别','0'),(14,'出行','05',1,'0/1/',NULL,'类别','0'),(15,'维修','06',1,'0/1/',NULL,'类别','0'),(16,'法规','07',1,'0/1/',NULL,'类别','0'),(17,'问答','08',1,'0/1/',NULL,'类别','0'),(18,'书籍','09',1,'0/1/',NULL,'类别','0'),(19,'家政服务','1001',7,'0/1/7/',NULL,'乐助圈类别','1'),(20,'维修服务','1002',7,'0/1/7/',NULL,'乐助圈类别','1'),(21,'商务服务','1003',7,'0/1/7/',NULL,'乐助圈类别','1');
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
  `context` varchar(500) DEFAULT NULL,
  `image_url` varchar(300) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `type` varchar(45) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `hh_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_comment`
--

LOCK TABLES `hh_comment` WRITE;
/*!40000 ALTER TABLE `hh_comment` DISABLE KEYS */;
INSERT INTO `hh_comment` VALUES (2,'test',NULL,'2016-12-08 11:48:39',0,'2',6,42),(3,'test   ',NULL,'2016-12-08 11:48:39',0,'1',12,42),(4,'test',NULL,'2016-12-09 16:11:41',0,'1',12,42);
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
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_hh_help_contract_hh_user1_idx` (`hh_user_id`),
  KEY `fk_hh_help_contract_hh_help_info1_idx` (`hh_help_info_id`),
  CONSTRAINT `fk_hh_help_contract_hh_help_info1` FOREIGN KEY (`hh_help_info_id`) REFERENCES `hh_help_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hh_help_contract_hh_user1` FOREIGN KEY (`hh_user_id`) REFERENCES `hh_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_help_contract`
--

LOCK TABLES `hh_help_contract` WRITE;
/*!40000 ALTER TABLE `hh_help_contract` DISABLE KEYS */;
INSERT INTO `hh_help_contract` VALUES (2,3,43,10,'2016-12-14 13:53:25');
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
  `image_url` varchar(500) DEFAULT NULL,
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
  `country` varchar(100) DEFAULT '中国',
  `province` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `detail_position` varchar(300) DEFAULT NULL,
  `republish_times` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_hh_help_info_hh_user1_idx` (`hh_user_id`),
  KEY `fk_hh_help_info_hh_category1_idx` (`hh_category_id`),
  CONSTRAINT `fk_hh_help_info_hh_category1` FOREIGN KEY (`hh_category_id`) REFERENCES `hh_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hh_help_info_hh_user1` FOREIGN KEY (`hh_user_id`) REFERENCES `hh_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_help_info`
--

LOCK TABLES `hh_help_info` WRITE;
/*!40000 ALTER TABLE `hh_help_info` DISABLE KEYS */;
INSERT INTO `hh_help_info` VALUES (1,'title','thisiscontext','url','12345678901','全国',0,20,5,NULL,NULL,NULL,0,1,7,'2016-10-10 14:37:52','c','p','c','a','s','d',0),(2,'title','thisiscontext','url','12345678901','全国',0,20,5,NULL,NULL,NULL,1,1,7,'2016-10-10 14:37:52','c','p','c','a','s','d',0),(3,'title','thisiscontext','url','12345678901','全国',0,20,5,NULL,NULL,NULL,0,1,7,'2016-10-10 14:37:52','c','p','c','a','s','d',0),(4,'title','thisiscontext','url','12345678901','全国',0,20,5,NULL,NULL,NULL,0,1,7,'2016-10-10 14:37:52','c','p','c','a','s','d',0),(5,'title','thisiscontext','url','12345678901','全国',0,20,5,NULL,NULL,NULL,0,1,7,'2016-10-10 14:37:52','c','p','c','a','s','d',0),(6,'title','thisiscontext','url','12345678901','全国',0,20,5,NULL,NULL,NULL,0,1,7,'2016-10-10 14:37:52','c','p','c','a','s','d',0),(7,'title','thisiscontext','url','12345678901','全国',0,20,5,NULL,NULL,NULL,0,1,7,'2016-10-10 14:37:52','c','p','c','a','s','d',0),(9,'title','thisiscontext','url','12345678901','全国',0,20,5,NULL,NULL,NULL,0,1,7,'2016-10-10 14:37:52','c','p','c','a','s','d',0),(10,'title','thisiscontext','url','12345678901','全国',0,20,5,NULL,NULL,NULL,1,0,7,'2016-10-10 14:37:52','c','p','c','a','s','d',0),(12,'45',NULL,NULL,NULL,NULL,0,20,NULL,NULL,'9',NULL,0,1,7,'2016-10-10 14:37:52',NULL,NULL,NULL,NULL,NULL,NULL,0),(13,NULL,'测试内容testcontent','/pic/Images/helpInfo/9c2c1f1b-b999-4a61-bf18-ed7740681d13.jpg','c','全国',0,42,4,NULL,NULL,NULL,1,1,11,'2016-11-19 21:10:39',NULL,'p','p','a',NULL,'详细地址',0),(14,NULL,'eee','nono','18188888','市',0,42,8,NULL,NULL,NULL,0,1,7,'2016-12-15 15:13:44','中国','福建省','泉州市','洛江区',NULL,'ddd',0),(15,NULL,'eee','nono','18188888','市',0,42,8,NULL,NULL,NULL,0,1,7,'2016-12-15 15:28:28','中国','福建省','泉州市','洛江区',NULL,'ddd',0),(16,NULL,'eee','nono','18188888','市',0,42,8,NULL,NULL,NULL,0,1,7,'2016-12-15 15:28:51','中国','福建省','泉州市','洛江区',NULL,'ddd',0),(17,NULL,'eee','nono','18188888','市',0,42,8,NULL,NULL,NULL,1,1,7,'2016-12-15 15:45:31','中国','福建省','泉州市','洛江区',NULL,'ddd',0),(18,NULL,'eee','nono','18188888','市',0,42,8,NULL,NULL,NULL,0,1,7,'2016-12-15 15:48:24','中国','福建省','泉州市','洛江区',NULL,'ddd',0),(19,NULL,'eee','nono','18188888','市',0,42,8,NULL,NULL,NULL,0,1,7,'2016-12-15 15:48:49','中国','福建省','泉州市','洛江区',NULL,'ddd',0),(20,NULL,'eee','nono','18188888','市',0,42,8,NULL,NULL,NULL,0,1,7,'2016-12-15 15:53:06','中国','福建省','泉州市','洛江区',NULL,'ddd',0),(21,NULL,'eee','nono','18188888','市',0,42,8,NULL,NULL,NULL,0,1,7,'2016-12-15 15:56:51','中国','福建省','泉州市','洛江区',NULL,'ddd',0),(22,NULL,'eee','nono','18188888','市',0,42,8,NULL,NULL,NULL,0,1,7,'2016-12-15 15:57:35','中国','福建省','泉州市','洛江区',NULL,'ddd',0),(23,NULL,'eee','nono','18188888','市',0,42,8,NULL,NULL,NULL,0,1,7,'2016-12-15 15:58:41','中国','福建省','泉州市','洛江区',NULL,'ddd',0),(24,NULL,'eee','nono','18188888','市',0,42,8,NULL,NULL,NULL,0,1,7,'2016-12-15 15:59:33','中国','福建省','泉州市','洛江区',NULL,'ddd',0),(25,NULL,'eee','nono','18188888','市',0,42,8,NULL,NULL,NULL,0,1,7,'2016-12-15 16:21:51','中国','福建省','泉州市','洛江区',NULL,'ddd',0),(26,NULL,'eee','nono','18188888','市',0,42,8,NULL,NULL,NULL,0,1,7,'2016-12-15 16:22:46','中国','福建省','泉州市','洛江区',NULL,'ddd',0),(27,NULL,'eee','nono','18188888','市',0,42,8,NULL,NULL,NULL,0,1,7,'2016-12-15 16:24:11','中国','福建省','泉州市','洛江区',NULL,'ddd',0),(28,NULL,'eee','nono','18188888','市',0,42,8,NULL,NULL,NULL,0,1,7,'2016-12-15 16:34:59','中国','福建省','泉州市','洛江区',NULL,'ddd',0),(29,NULL,'eee','nono','18188888','市',0,42,8,NULL,NULL,NULL,0,1,7,'2016-12-15 16:36:49','中国','福建省','泉州市','洛江区',NULL,'ddd',0),(30,NULL,'eee','nono','18188888','市',0,42,8,NULL,NULL,NULL,0,1,7,'2016-12-15 16:36:50','中国','福建省','泉州市','洛江区',NULL,'ddd',0),(31,NULL,'eee','nono','18188888','市',0,42,8,NULL,NULL,NULL,0,1,7,'2016-12-15 16:36:51','中国','福建省','泉州市','洛江区',NULL,'ddd',0),(32,NULL,'eee','nono','18188888','市',0,42,8,NULL,NULL,NULL,0,1,7,'2016-12-15 16:36:52','中国','福建省','泉州市','洛江区',NULL,'ddd',0),(33,NULL,'eee','none','18188888','市',0,42,8,NULL,NULL,NULL,1,1,7,'2016-12-25 17:52:05','中国','福建省','泉州市','洛江区',NULL,'ddd',0);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_message`
--

LOCK TABLES `hh_message` WRITE;
/*!40000 ALTER TABLE `hh_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `hh_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_money_record`
--

DROP TABLE IF EXISTS `hh_money_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_money_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trade_order_no` varchar(45) DEFAULT NULL,
  `hh_user_id` int(11) DEFAULT NULL,
  `money` double DEFAULT NULL,
  `paid_type` varchar(45) DEFAULT NULL,
  `descript` varchar(45) DEFAULT NULL,
  `is_valied` tinyint(4) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_money_record`
--

LOCK TABLES `hh_money_record` WRITE;
/*!40000 ALTER TABLE `hh_money_record` DISABLE KEYS */;
INSERT INTO `hh_money_record` VALUES (1,'120622020416833',42,0.01,'虚拟币','充值虚拟币',1,'2016-12-07 14:03:08');
/*!40000 ALTER TABLE `hh_money_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_order_record`
--

DROP TABLE IF EXISTS `hh_order_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_order_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trade_no` varchar(100) DEFAULT NULL,
  `order_type` varchar(100) DEFAULT NULL,
  `second_type` varchar(45) DEFAULT NULL,
  `pay_user` varchar(100) DEFAULT NULL,
  `accept_user` varchar(100) DEFAULT NULL,
  `deal_money` double DEFAULT NULL,
  `hh_target_id` int(11) DEFAULT NULL,
  `descript` varchar(450) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `is_compeleted` tinyint(4) DEFAULT '0',
  `hh_contract_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_order_record`
--

LOCK TABLES `hh_order_record` WRITE;
/*!40000 ALTER TABLE `hh_order_record` DISABLE KEYS */;
INSERT INTO `hh_order_record` VALUES (1,'20161203173015','普通求助消息','无偿求助','6069140','8482063',0,29,NULL,'2016-12-03 17:30:39',0,NULL),(2,'20161203173240','普通求助消息','无偿求助','6069140','8482063',0,29,NULL,'2016-12-03 17:32:45',0,NULL),(3,'20161203173735','普通求助消息','无偿求助','6069140','8482063',0,29,NULL,'2016-12-03 17:37:39',0,NULL),(4,'20161203174019','普通求助消息','无偿求助','6069140','8482063',0,29,NULL,'2016-12-03 17:40:22',0,NULL),(5,'20161203174229','普通求助消息','无偿求助','6069140','8482063',0,29,NULL,'2016-12-03 17:42:33',0,NULL),(6,'20161210224210','普通求助消息','有偿求助','8482064','9272096',100,1,NULL,'2016-12-10 22:42:14',0,11),(7,'20161215160006','紧急求助','区','8482063','平台',18,24,'系统收入','2016-12-15 16:00:09',1,NULL),(8,'20161215162151','紧急求助','区','8482063','平台',18,25,'系统收入','2016-12-15 16:21:51',1,NULL),(9,'20161215162245','紧急求助','区','8482063','平台',18,26,'系统收入','2016-12-15 16:22:46',1,NULL),(10,'20161215162411','紧急求助','区','8482063','平台',18,27,'系统收入','2016-12-15 16:24:11',1,NULL),(11,'20161215163459','紧急求助','区','8482063','平台',18,28,'系统收入','2016-12-15 16:35:00',1,NULL),(12,'20161215163649','紧急求助','区','8482063','平台',18,29,'系统收入','2016-12-15 16:36:49',1,NULL),(13,'20161215163650','紧急求助','区','8482063','平台',18,30,'系统收入','2016-12-15 16:36:50',1,NULL),(14,'20161215163651','紧急求助','区','8482063','平台',18,31,'系统收入','2016-12-15 16:36:51',1,NULL),(15,'20161215163652','紧急求助','区','8482063','平台',18,32,'系统收入','2016-12-15 16:36:52',1,NULL),(16,'20161222171245','普通求助消息','置顶费用','6069140','平台',200,1,NULL,'2016-12-22 17:12:47',1,NULL);
/*!40000 ALTER TABLE `hh_order_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_platform_record`
--

DROP TABLE IF EXISTS `hh_platform_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_platform_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `record_type` varchar(45) DEFAULT NULL,
  `income_type` varchar(45) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `hh_user_id` int(11) DEFAULT NULL,
  `money` double DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `contract_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_platform_record`
--

LOCK TABLES `hh_platform_record` WRITE;
/*!40000 ALTER TABLE `hh_platform_record` DISABLE KEYS */;
INSERT INTO `hh_platform_record` VALUES (1,'taskInfoFee','收入',1,20,10,'普通求助手续费','2016-12-10 22:42:04',11),(2,'taskInfoTemp','收入',1,20,100,'普通求助服务费暂存平台,交易成功后付给服务方','2016-12-10 22:42:08',11),(3,'helpInfo','收入',24,42,18,'推送消息服务费','2016-12-15 16:00:11',NULL),(4,'helpInfo','收入',25,42,18,'推送消息服务费','2016-12-15 16:21:51',NULL),(5,'helpInfo','收入',26,42,18,'推送消息服务费','2016-12-15 16:22:46',NULL),(6,'helpInfo','收入',27,42,18,'推送消息服务费','2016-12-15 16:24:11',NULL),(7,'helpInfo','收入',28,42,18,'推送消息服务费','2016-12-15 16:35:00',NULL),(8,'helpInfo','收入',29,42,18,'推送消息服务费','2016-12-15 16:36:49',NULL),(9,'helpInfo','收入',30,42,18,'推送消息服务费','2016-12-15 16:36:50',NULL),(10,'helpInfo','收入',31,42,18,'推送消息服务费','2016-12-15 16:36:51',NULL),(11,'helpInfo','收入',32,42,18,'推送消息服务费','2016-12-15 16:36:52',NULL),(12,'taskInfoTemp','支出',1,20,100,'普通求助服务费暂存平台,管理员同意发布者终结任务后退还给发布者','2016-12-19 17:19:45',11),(13,'taskInfoTemp','收入',1,43,200,'普通求助置顶收入,置顶7天','2016-12-22 17:12:44',NULL),(14,'helpInfoReturn','支出',17,42,16,'紧急求助失败,退还金额','2016-12-25 16:15:49',NULL),(15,'helpInfoReturn','支出',2,20,64,'紧急求助失败,退还金额','2016-12-25 16:35:18',NULL),(16,'helpInfoReturn','支出',33,42,16,'紧急求助失败,退还金额','2016-12-25 17:21:17',NULL),(17,'helpInfoReturn','支出',13,42,64,'紧急求助失败,退还金额','2016-12-25 17:27:11',NULL),(18,'helpInfoReturn','支出',33,42,16,'紧急求助失败,退还金额','2016-12-27 20:48:27',NULL),(19,'prize','支出',NULL,20,2000,'','2016-12-30 22:42:48',NULL),(20,'prize','支出',NULL,20,2000,'','2016-12-30 22:42:53',NULL),(21,'prize','支出',NULL,42,2000,'','2016-12-30 22:42:53',NULL),(22,'taskInfoTemp','支出',29,43,200,'交易完成,平台将款项付给服务方','2017-01-11 09:15:59',13),(23,'taskInfoTemp','支出',29,43,200,'交易完成,平台将款项付给服务方','2017-01-11 09:20:04',13),(24,'taskInfoTemp','支出',29,43,200,'交易完成,平台将款项付给服务方','2017-01-11 09:27:02',13),(25,'taskInfoTemp','支出',29,43,200,'交易完成,平台将款项付给服务方','2017-01-11 09:40:01',13),(26,'taskInfoTemp','支出',29,43,200,'交易完成,平台将款项付给服务方','2017-01-11 09:42:23',13),(27,'taskInfoTemp','支出',29,43,200,'交易完成,平台将款项付给服务方','2017-01-11 09:46:19',13);
/*!40000 ALTER TABLE `hh_platform_record` ENABLE KEYS */;
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
  `hh_phones` varchar(200) DEFAULT NULL,
  `article_phones` varchar(200) DEFAULT NULL,
  `is_lottery` tinyint(4) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_prize`
--

LOCK TABLES `hh_prize` WRITE;
/*!40000 ALTER TABLE `hh_prize` DISABLE KEYS */;
INSERT INTO `hh_prize` VALUES (1,'20161019',10000,'19,16','10,7','1234433111,1233222111','12312312312',1,'2016-10-19 10:55:34'),(2,'20161020',10000,'19,16','10,7','1234433111,1233222111','12312312312',1,'2016-10-20 10:55:34'),(3,'20161021',10000,'19,16','10,7','1234433111,1233222111','12312312312',1,'2016-10-21 10:55:34'),(4,'20161022',23123,'19,16','10,7','1234433111,1233222111','12312312312',1,'2016-10-22 10:55:34'),(5,'20161023',2343,'19,16','10,7','1234433111,1233222111','12312312312',1,'2016-10-23 10:55:34'),(8,'20161024',123123,'19,16','10,7','1234433111,1233222111','12312312312',1,'2016-10-24 22:13:23'),(9,'20161026',10000,'42,20','8482063,8482064','18159801259,18159801260','18159801260',1,'2016-10-30 15:43:51'),(10,'20161231',1000,'49,50','2831978,1875892','18159800001,18159800003','18159801260',1,'2016-12-30 20:57:05'),(11,'201612302241',2000,'20,42','8482064,8482063','18159801260,18159801259','18159801260',1,'2016-12-30 22:41:58');
/*!40000 ALTER TABLE `hh_prize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_push`
--

DROP TABLE IF EXISTS `hh_push`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_push` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hh_user_id` int(11) DEFAULT NULL,
  `country` varchar(45) DEFAULT '中国',
  `province` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `area` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `alias` varchar(45) DEFAULT NULL,
  `regId` varchar(45) DEFAULT NULL,
  `topic` varchar(45) DEFAULT '"推荐"',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_push`
--

LOCK TABLES `hh_push` WRITE;
/*!40000 ALTER TABLE `hh_push` DISABLE KEYS */;
INSERT INTO `hh_push` VALUES (1,43,NULL,'福建省','泉州市','洛江区','罗溪','43',NULL,'test,test2'),(2,42,'中国','福建省','泉州市','洛江区','罗溪','42',NULL,'test,test2'),(3,44,'中国','福建省','泉州市','洛江区','罗溪','44',NULL,'test,test2'),(4,45,'中国','福建省','泉州市','洛江区','罗溪','45',NULL,'test,test2'),(5,46,'中国','福建省','泉州市','洛江区','罗溪','46',NULL,'test,test2'),(6,47,'中国','福建省','泉州市','洛江区','罗溪','47',NULL,'test,test2'),(7,48,'中国','福建省','泉州市','洛江区','罗溪','48',NULL,'test,test2'),(8,49,'中国','福建省','泉州市','洛江区','罗溪','49',NULL,'test,test2'),(9,50,'中国','福建省','泉州市','洛江区','罗溪','50',NULL,'test,test2'),(10,52,'中国','福建省','泉州市','洛江区','罗溪','52',NULL,'test,test2'),(11,1,'中国',NULL,NULL,NULL,NULL,'1',NULL,'test,test2'),(12,2,'中国',NULL,NULL,NULL,NULL,'2',NULL,'test,test2'),(13,3,'中国',NULL,NULL,NULL,NULL,'3',NULL,'test,test2'),(14,4,'中国',NULL,NULL,NULL,NULL,'4',NULL,'test,test2'),(15,5,'中国',NULL,NULL,NULL,NULL,'5',NULL,'test,test2'),(16,6,'中国',NULL,NULL,NULL,NULL,'6',NULL,'test,test2'),(17,7,'中国',NULL,NULL,NULL,NULL,'7',NULL,'test,test2'),(18,8,'中国',NULL,NULL,NULL,NULL,'8',NULL,'test,test2'),(19,9,'中国',NULL,NULL,NULL,NULL,'9',NULL,'test,test2'),(20,10,'中国',NULL,NULL,NULL,NULL,'10',NULL,'test,test2'),(21,11,'中国',NULL,NULL,NULL,NULL,'11',NULL,'test,test2'),(22,12,'中国',NULL,NULL,NULL,NULL,'12',NULL,'test,test2'),(23,13,'中国',NULL,NULL,NULL,NULL,'13',NULL,'test,test2'),(24,14,'中国',NULL,NULL,NULL,NULL,'14',NULL,'test,test2'),(25,15,'中国',NULL,NULL,NULL,NULL,'15',NULL,'test,test2');
/*!40000 ALTER TABLE `hh_push` ENABLE KEYS */;
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
  `parent_ids` varchar(100) DEFAULT NULL,
  `permission` varchar(100) DEFAULT NULL,
  `is_available` int(1) DEFAULT '1',
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_resource`
--

LOCK TABLES `hh_resource` WRITE;
/*!40000 ALTER TABLE `hh_resource` DISABLE KEYS */;
INSERT INTO `hh_resource` VALUES (1,'资源','menu','0',0,'0/','',1,''),(40,'用户资源管理','menu','01',1,'0/1/','',1,''),(41,'管理员管理','menu','0101',40,'0/1/40/','superuser:*',1,'/user/superuser/list'),(42,'管理员新增','button','010101',41,'0/1/40/41','superuser:create',1,' '),(43,'管理员修改','button','010102',41,'0/1/40/41','superuser:update',1,' '),(44,'管理员删除','button','010103',41,'0/1/40/41','superuser:delete',1,' '),(45,'管理员查看','button','010104',41,'0/1/40/41','superuser:view',1,' '),(50,'用户管理','menu','0102',40,'0/1/40','user:*',1,'/user/normaluser/list'),(51,'用户新增','button','010201',50,'0/1/40/50/','user:create',1,''),(52,'用户修改','button','010202',50,'0/1/40/50/','user:update',1,''),(53,'用户删除','button','010203',50,'0/1/40/50/','user:delete',1,''),(54,'用户查看','button','010204',50,'0/1/40/50/','user:view',1,''),(55,'资源管理','menu','0103',40,'0/1/40/','resource:*',1,'/resources'),(56,'资源新增','button','010301',55,'0/1/40/55/','resource:create',1,''),(57,'资源修改','button','010302',55,'0/1/40/55/','resource:update',1,''),(58,'资源删除','button','010303',55,'0/1/40/55/','resource:delete',1,''),(59,'资源查看','button','010304',55,'0/1/40/55/','resource:view',1,''),(60,'角色管理','menu','0104',40,'0/1/40/','role:*',1,'/role'),(61,'角色新增','button','010401',60,'0/1/40/60/','role:create',1,''),(62,'角色修改','button','010402',60,'0/1/40/60/','role:update',1,''),(63,'角色删除','button','010403',60,'0/1/40/60/','role:delete',1,''),(64,'角色查看','button','010404',60,'0/1/40/60/','role:view',1,''),(65,'排名管理','menu','02',1,'0/1/','',1,''),(66,'荣誉值排名','menu','0201',65,'0/1/65/','honer:*',1,'/user/rank/honer'),(68,'查看荣誉值','button','020101',66,'0/1/65/66/','honer:view',1,''),(69,'修改荣誉值','button','020102',66,'0/1/65/66/','honer:update',1,''),(70,'设置中奖人','button','020103',66,'0/1/65/66/','honer:prize',1,''),(71,'设置随机中奖','button','020104',66,'0/1/65/66/','honer:ramdom',1,''),(72,'贡献值排名','menu','0202',65,'0/1/65/','contribute:*',1,'/user/rank/contribute'),(73,'查看贡献值排名','button','020201',72,'0/1/65/72/','contribute:view',1,''),(74,'修改贡献值','button','020202',72,'0/1/65/72/','contribute:update',1,''),(78,'系统设置','menu','12',1,'0/1/','',1,''),(79,'图片设置','menu','1201',78,'0/1/78/','show:*',1,'/show/list/panel'),(80,'查看图片','button','120101',79,'0/1/78/79/','show:view',1,''),(81,'添加图片','button','120102',79,'0/1/78/79/','show:create',1,''),(82,'修改图片','button','120103',79,'0/1/78/79/','show:update',1,''),(83,'删除图片','button','120104',79,'0/1/78/79/','show:delete',1,''),(84,'属性设置','menu','1202',78,'0/1/78/','property:*',1,'/setting/list-panel'),(85,'添加属性','button','120201',84,'0/1/78/84/','property:create',1,''),(86,'修改属性','button','120202',84,'0/1/78/84/','property:update',1,''),(87,'删除属性','button','120203',84,'0/1/78/84/','property:delete',1,''),(88,'查看属性','button','120204',84,'0/1/78/84/','property:view',1,''),(89,'开奖管理','menu','03',1,'0/1/','',1,''),(90,'开奖记录','menu','0301',89,'0/1/89/','prize:*',1,'/prize/list-panel'),(92,'查看开奖记录','button','030101',90,'0/1/89/90/','prize:view',1,''),(93,'删除未开奖记录','button','030102',90,'0/1/89/90/','prize:delete',1,''),(94,'修改未开奖记录','button','030103',90,'0/1/89/90/','prize:update',1,''),(95,'增加开奖记录','button','030104',90,'0/1/89/90/','prize:create',1,''),(98,'类别管理','menu','04',1,'0/1/','',1,''),(99,'类别维护','menu','0401',98,'0/1/98/','category:*',1,'/category/list-panel'),(101,'添加类别','button','040101',99,'0/1/98/99/','category:create',1,''),(102,'删除类别','button','040102',99,'0/1/98/99/','category:delete',1,''),(103,'修改类别','button','040103',99,'0/1/98/99/','category:update',1,''),(104,'查看类别','button','040104',99,'0/1/98/99/','category:view',1,''),(105,'好人好事文章管理','menu','05',1,'0/1/','',1,''),(106,'文章管理','menu','0501',105,'0/1/105/','article:*',1,'/article/list-panel'),(107,'添加文章','button','050101',106,'0/1/105/106/','article:create',1,''),(108,'删除文章','button','050102',106,'0/1/105/106/','article:delete',1,''),(109,'修改文章','button','050103',106,'0/1/105/106/','article:update',1,''),(110,'查看文章','button','050104',106,'0/1/105/106/','article:view',1,''),(111,'评论管理','menu','050105',106,'0/1/105/106/','comment:*',1,''),(112,'添加评论','button','05010501',111,'0/1/105/106/111/','comment:create',1,''),(113,'删除评论','button','05010502',111,'0/1/105/106/111/','comment:delete',1,''),(114,'修改评论','button','05010503',111,'0/1/105/106/111/','comment:update',1,''),(115,'查','button','05010504',111,'0/1/105/106/111/','comment:view',1,''),(116,'普通求助消息管理','menu','06',1,'0/1/',NULL,1,NULL),(117,'求助消息管理','menu','0601',116,'0/1/116/','task:*',1,'/taskinfo/list-panel'),(118,'紧急求助消息管理','menu','07',1,'0/1/','',1,''),(119,'紧急消息管理','menu','0701',118,'0/1/118/','help:*',1,'/helpInfo/list-panel'),(120,'公共服务管理','menu','08',1,'0/1/','',1,''),(121,'服务信息管理','menu','0801',120,'0/1/120/','server:*',1,'/serverInfo/list-panel'),(122,'增加普通求助消息','button','060101',117,'0/1/116/117/','task:create',1,''),(123,'删除普通求助消息','button','060102',117,'0/1/116/117/','task:delete',1,''),(124,'改动普通求助消息','button','060103',117,'0/1/116/117/','task:update',1,''),(125,'查找普通求助消息','button','060104',117,'0/1/116/117/','task:view',1,''),(126,'增加紧急求助消息','button','070101',119,'0/1/118/119/','help:create',1,''),(127,'删除紧急求助消息','button','070102',119,'0/1/118/119/','help:delete',1,''),(128,'改动紧急求助消息','button','070103',119,'0/1/118/119/','help:update',1,''),(129,'查找紧急求助消息','button','070104',119,'0/1/118/119/','help:view',1,''),(130,'增加服务信息','button','080101',121,'0/1/120/121/','server:create',1,''),(131,'删除服务信息','button','080102',121,'0/1/120/121/','server:delete',1,''),(132,'改动服务信息','button','080103',121,'0/1/120/121/','server:update',1,''),(133,'查找服务信息','button','080104',121,'0/1/120/121/','server:view',1,''),(135,'求助消息评论管理','menu','060105',117,'0/1/116/117/','taskComment:*',1,''),(136,'添加求助评论','button','06010501',135,'0/1/116/117/135/','taskComment:create',1,''),(137,'删除求助评论消息','button','06010502',135,'0/1/116/117/135/','taskComment:delete',1,''),(138,'修改求助评论消息','button','06010503',135,'0/1/116/117/135/','taskComment:update',1,''),(139,'删除求助消息评论','button','06010504',135,'0/1/116/117/135/','taskComment:delete',1,''),(140,'二级评论管理','menu','06010505',135,'0/1/116/117/135/','taskComment2:*',1,''),(141,'查看二级评论','button','0601050501',140,'0/1/116/117/135/140/','taskComment2:view',1,''),(142,'删除二级评论','button','0601050502',140,'0/1/116/117/135/140/','taskComment2:delete',1,''),(143,'订单管理','menu','09',1,'0/1/','',1,''),(144,'虚拟币充值订单','menu','0901',143,'0/1/143/','money:*',1,'/money/record'),(145,'平台交易订单','menu','0902',143,'0/1/143/','order:*',1,'/order/record'),(146,'提现订单','menu','0904',143,'0/1/143/','withdraw:*',1,'/withdraw/record'),(147,'平台收支情况','menu','0903',143,'0/1/143/','income:*',1,'/platform/record'),(148,'查看','button','090101',144,'0/1/143/144/','',1,''),(149,'查看','button','090201',145,'0/1/143/145/','',1,''),(150,'查看','button','090301',147,'0/1/143/147/','',1,''),(151,'查看','menu','090401',146,'0/1/143/146/','',1,''),(152,'用户留言板','menu','0105',40,'0/1/40/','note:*',1,'/user/note/list');
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_role`
--

LOCK TABLES `hh_role` WRITE;
/*!40000 ALTER TABLE `hh_role` DISABLE KEYS */;
INSERT INTO `hh_role` VALUES (1,'admin','超级管理员','41,50,55,60,66,72,79,84,90,99,106,111,117,119,121,144,145,146,147,152',1),(2,'contentAdmin','内容管理员','99,106,111,117,119,121',1),(3,'userAdmin','用户管理员','41,50,55,60,66,72',1),(4,'resourceAdmin','资源管理源','41,55,79,84,90,99,144,145,146',1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT NULL,
  `hh_server_info_id` int(11) NOT NULL,
  `hh_user_id` int(11) NOT NULL,
  `money` double DEFAULT NULL,
  `content` varchar(450) DEFAULT NULL,
  `detail` varchar(450) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_hh_server_contract_hh_user1_idx` (`hh_user_id`),
  KEY `fk_hh_server_contract_hh_server_info1_idx` (`hh_server_info_id`),
  CONSTRAINT `fk_hh_server_contract_hh_server_info1` FOREIGN KEY (`hh_server_info_id`) REFERENCES `hh_server_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hh_server_contract_hh_user1` FOREIGN KEY (`hh_user_id`) REFERENCES `hh_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_server_contract`
--

LOCK TABLES `hh_server_contract` WRITE;
/*!40000 ALTER TABLE `hh_server_contract` DISABLE KEYS */;
INSERT INTO `hh_server_contract` VALUES (1,3,6,42,100,'test','test',NULL),(2,0,5,42,100,'test','test',NULL),(3,3,6,43,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `hh_server_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_server_info`
--

DROP TABLE IF EXISTS `hh_server_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_server_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `context` varchar(500) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `hh_user_id` int(11) NOT NULL,
  `is_pass` tinyint(1) DEFAULT '0' COMMENT '是否通过审核',
  `is_deleted` tinyint(1) DEFAULT '1' COMMENT '是否下架',
  `hh_category_id` int(11) NOT NULL,
  `country` varchar(100) DEFAULT '中国' COMMENT '服务所在国',
  `province` varchar(100) NOT NULL COMMENT '服务所在省',
  `city` varchar(100) DEFAULT NULL,
  `area` varchar(45) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL COMMENT '详细地址',
  `image_url` varchar(500) DEFAULT '"none"',
  `server_time_start` datetime DEFAULT NULL,
  `server_time_end` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_hh_suport_server_info_hh_user1_idx` (`hh_user_id`),
  KEY `fk_hh_server_info_hh_category1_idx` (`hh_category_id`),
  CONSTRAINT `fk_hh_server_info_hh_category1` FOREIGN KEY (`hh_category_id`) REFERENCES `hh_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hh_suport_server_info_hh_user1` FOREIGN KEY (`hh_user_id`) REFERENCES `hh_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_server_info`
--

LOCK TABLES `hh_server_info` WRITE;
/*!40000 ALTER TABLE `hh_server_info` DISABLE KEYS */;
INSERT INTO `hh_server_info` VALUES (2,'title','这是内容测试','12345678901','2016-10-24 22:13:23',20,0,1,7,'c','p','c','a','s','a','/pic/Images/article/2c36c529-33e5-40ad-bb8d-4b87b72fcd55.jpg',NULL,NULL),(3,'title','这是lunce全文检索内容测试','12345678901','2016-10-24 22:13:23',20,0,0,7,'c','p','c','a','s','a','/pic/Images/article/2c36c529-33e5-40ad-bb8d-4b87b72fcd55.jpg',NULL,NULL),(4,'title','注意注意这是测试','12345678901','2016-10-24 22:13:23',20,0,0,7,'c','p','c','a','s','a','/pic/Images/article/2c36c529-33e5-40ad-bb8d-4b87b72fcd55.jpg',NULL,NULL),(5,'title','测试时关键词','12345678901','2016-10-24 22:13:23',20,0,0,7,'c','p','c','a','s','a','/pic/Images/article/2c36c529-33e5-40ad-bb8d-4b87b72fcd55.jpg',NULL,NULL),(6,NULL,'test','18159801259','2016-12-03 21:12:13',43,0,1,11,'中国','福建省','泉州市','洛江区','s','广桥','/pic/Images/serverInfo/84ef663e-aaee-42b1-aa84-9d54863cf6be.jpg,/pic/Images/serverInfo/e98666f0-2277-4cd0-abc3-0d16b1a4bc23.jpg',NULL,NULL),(7,'ttt','test','12345678901','2016-12-12 14:09:14',43,0,1,7,'中国','省','泉州市','洛江区','s','ddddetail','','2016-10-24 22:13:00','2016-10-25 22:13:00'),(8,'测试','全文检索测试,只是测试,关键词,根据服务内容,服务地址搜索','18159801111','2016-12-23 16:42:47',43,0,1,11,'中国','福建省','泉州市','洛江区',NULL,'详细地址关键词测试','','2016-12-23 13:37:00','2016-12-24 13:37:00'),(9,'测试','全文检索测试,只是测试,关键词,根据服务内容,服务地址搜索','18159801111','2016-12-23 16:44:23',43,0,1,11,'中国','福建省','泉州市','洛江区',NULL,'详细地址关键词测试','','2016-12-23 13:37:00','2016-12-24 13:37:00'),(10,'测试','全文检索测试,只是测试,关键词,根据服务内容,服务地址搜索','18159801111','2016-12-23 16:45:19',43,0,1,11,'中国','福建省','泉州市','洛江区',NULL,'详细地址关键词测试','','2016-12-23 13:37:00','2016-12-24 13:37:00'),(11,'测试','全文检索测试,只是测试,关键词,根据服务内容,服务地址搜索','18159801111','2016-12-23 16:49:29',43,0,1,11,'中国','福建省','泉州市','洛江区',NULL,'详细地址关键词测试','','2016-12-23 13:37:00','2016-12-24 13:37:00'),(12,'测试','全文检索测试,只是测试,关键词,根据服务内容,服务地址搜索','18159801111','2016-12-23 16:57:09',43,0,1,11,'中国','福建省','泉州市','洛江区',NULL,'详细地址关键词测试','','2016-12-23 13:37:00','2016-12-24 13:37:00'),(13,'测试','全文检索测试,只是测试,关键词,根据服务内容,服务地址搜索','18159801111','2016-12-23 17:01:42',43,0,1,11,'中国','福建省','泉州市','洛江区',NULL,'详细地址关键词测试','','2016-12-23 13:37:00','2016-12-24 13:37:00'),(14,'测试','全文检索测试,只是测试,关键词,根据服务内容,服务地址搜索','18159801111','2016-12-23 17:06:56',43,0,1,11,'中国','福建省','泉州市','洛江区',NULL,'详细地址关键词测试','','2016-12-23 13:37:00','2016-12-24 13:37:00'),(15,'测试','全文检索测试,只是测试,嘿嘿,关键词,根据服务内容,服务地址搜索','18159801111','2016-12-23 17:08:29',43,0,1,11,'中国','福建省','泉州市','洛江区',NULL,'详细地址哈哈词测试','','2016-12-23 13:37:00','2016-12-24 13:37:00'),(16,'测试','全文检索他他他测试,嘿嘿,关键词,根据服务内容,服务地址搜索','18159801111','2016-12-23 17:34:22',43,0,1,11,'中国','福建省','龙岩市','新罗区',NULL,'详细地址哈哈词测试','','2016-12-23 13:37:00','2016-12-24 13:37:00'),(17,'测试','全文检索他他他测试,嘿嘿,关键词,根据服务内容,服务地址搜索','18159801111','2016-12-23 17:36:43',43,0,1,11,'中国','福建省','龙岩市','新罗区',NULL,'详细地址哈哈词测试','','2016-12-23 13:37:00','2016-12-24 13:37:00'),(18,'测试','全文检索他他他测试,嘿嘿,关键词,根据服务内容,服务地址搜索','18159801111','2016-12-23 17:38:51',43,0,1,11,'中国','福建省','龙岩市','新罗区',NULL,'详细地址哈哈词测试','','2016-12-23 13:37:00','2016-12-24 13:37:00');
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
  `cookie` varchar(50) DEFAULT NULL,
  `session` blob,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cookie_UNIQUE` (`cookie`)
) ENGINE=InnoDB AUTO_INCREMENT=1158 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_session`
--

LOCK TABLES `hh_session` WRITE;
/*!40000 ALTER TABLE `hh_session` DISABLE KEYS */;
INSERT INTO `hh_session` VALUES (915,'9f85aaf9-556e-4b7c-b71c-56a784936dcc','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$9f85aaf9-556e-4b7c-b71c-56a784936dccsr\0java.util.Datehj�KYt\0\0xpw\0\0Y\0D�xsq\0~\0w\0\0Y\0Fxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx',NULL),(924,'b27b558f-fc90-42bb-8360-65cb956ced98','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$b27b558f-fc90-42bb-8360-65cb956ced98sr\0java.util.Datehj�KYt\0\0xpw\0\0Y�\�\rxsq\0~\0w\0\0Y\�\�$xsq\0~\0w\0\0Y�ׇxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx',NULL),(926,'ece3f216-ed2a-41ee-bec9-0a5204c91b86','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$ece3f216-ed2a-41ee-bec9-0a5204c91b86sr\0java.util.Datehj�KYt\0\0xpw\0\0Y\�xsq\0~\0w\0\0Y\�\�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-16 21:51:12'),(927,'e91f10b3-14a6-451b-950f-b91a1cb69a3e','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$e91f10b3-14a6-451b-950f-b91a1cb69a3esr\0java.util.Datehj�KYt\0\0xpw\0\0Y\�\�xsq\0~\0w\0\0Y\�Ȭxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection�X%ƣJ\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx','2016-12-16 21:51:15'),(928,'9069155d-809e-4c05-a2cc-da708d6052b8','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$9069155d-809e-4c05-a2cc-da708d6052b8sr\0java.util.Datehj�KYt\0\0xpw\0\0Y\n�\�xsq\0~\0w\0\0Y\n\���xsq\0~\0w\0\0Y\n�vxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2016-12-17 10:56:58'),(929,'bea94288-f59a-48c9-9816-798456a26d53','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$bea94288-f59a-48c9-9816-798456a26d53sr\0java.util.Datehj�KYt\0\0xpw\0\0Y\n�\n�xsq\0~\0w\0\0Y\n\��\�xsq\0~\0w\0\0Y\n�9xw\Z\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2016-12-17 10:57:00'),(930,'9214627b-872a-40e9-8346-648975946659','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$9214627b-872a-40e9-8346-648975946659sr\0java.util.Datehj�KYt\0\0xpw\0\0Y��\�xsq\0~\0w\0\0Yé\�xsq\0~\0w\0\0Y���xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2016-12-17 14:51:30'),(931,'08b309e0-c97e-4a10-9d20-2eb8064392c5','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$08b309e0-c97e-4a10-9d20-2eb8064392c5sr\0java.util.Datehj�KYt\0\0xpw\0\0Y�\�Hxsq\0~\0w\0\0Y�2,xsq\0~\0w\0\0Y�Wxw\Z\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2016-12-17 14:51:32'),(932,'03bd8e24-1470-4543-bdb6-9eb31e55d34d','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$03bd8e24-1470-4543-bdb6-9eb31e55d34dsr\0java.util.Datehj�KYt\0\0xpw\0\0Y�2Fxsq\0~\0w\0\0Y\�!xsq\0~\0w\0\0Y��\�xw\Z\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection�X%ƣJ\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx','2016-12-17 15:36:47'),(933,'04e06376-e4e6-454c-b4af-819b961ca2ca','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$04e06376-e4e6-454c-b4af-819b961ca2casr\0java.util.Datehj�KYt\0\0xpw\0\0Y\�%�xsq\0~\0w\0\0Y�xsq\0~\0w\0\0Y\�\'Qxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2016-12-18 10:52:21'),(934,'08fb9c3c-1856-4bf6-a2e3-f1ee3deea506','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$08fb9c3c-1856-4bf6-a2e3-f1ee3deea506sr\0java.util.Datehj�KYt\0\0xpw\0\0Y\�/exsq\0~\0w\0\0Y\�Nvxsq\0~\0w\0\0Y���xw\Z\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection�X%ƣJ\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx','2016-12-18 10:52:23'),(935,'91c6821a-cb0c-464f-8cae-63f74359d80f','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$91c6821a-cb0c-464f-8cae-63f74359d80fsr\0java.util.Datehj�KYt\0\0xpw\0\0Y^��xsq\0~\0w\0\0Y^��xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-18 13:19:16'),(936,'7d5b4219-5603-4271-b63b-7959f9c946ad','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$7d5b4219-5603-4271-b63b-7959f9c946adsr\0java.util.Datehj�KYt\0\0xpw\0\0Y`�kxsq\0~\0w\0\0Y`�\�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-18 13:21:20'),(937,'66783039-33f9-44a6-a0c3-43576d0e68b6','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$66783039-33f9-44a6-a0c3-43576d0e68b6sr\0java.util.Datehj�KYt\0\0xpw\0\0YbWJxsq\0~\0w\0\0YbY7xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-18 13:23:17'),(938,'732aef59-bdad-4ec5-9b30-c71e079f2bcc','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$732aef59-bdad-4ec5-9b30-c71e079f2bccsr\0java.util.Datehj�KYt\0\0xpw\0\0Ys�8xsq\0~\0w\0\0Ys��xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-18 13:42:07'),(939,'3dad6508-b033-46bb-a051-8c2787a9d548','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$3dad6508-b033-46bb-a051-8c2787a9d548sr\0java.util.Datehj�KYt\0\0xpw\0\0Yx!xsq\0~\0w\0\0Yx#8xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-18 13:47:05'),(940,'775b7857-ba34-4792-974d-64adf597bd11','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$775b7857-ba34-4792-974d-64adf597bd11sr\0java.util.Datehj�KYt\0\0xpw\0\0Y��xsq\0~\0w\0\0Y�\�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-18 13:55:20'),(941,'52b3e6b8-af10-4a81-8de6-7fa19a50b318','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$52b3e6b8-af10-4a81-8de6-7fa19a50b318sr\0java.util.Datehj�KYt\0\0xpw\0\0Y�\�xsq\0~\0w\0\0Y�	Pxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-18 13:59:00'),(942,'5ec2279e-a42a-41fe-9628-d8271af52f43','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$5ec2279e-a42a-41fe-9628-d8271af52f43sr\0java.util.Datehj�KYt\0\0xpw\0\0Y��\'xsq\0~\0w\0\0Y���xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-18 14:02:13'),(943,'5795df84-d61d-40bc-a437-6e35a5a900f1','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$5795df84-d61d-40bc-a437-6e35a5a900f1sr\0java.util.Datehj�KYt\0\0xpw\0\0Y��\�xsq\0~\0w\0\0Y�\0wxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-18 14:16:26'),(944,'520bc7a3-ad35-4803-afcf-1931cf37bcdb','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$520bc7a3-ad35-4803-afcf-1931cf37bcdbsr\0java.util.Datehj�KYt\0\0xpw\0\0Y�h�xsq\0~\0w\0\0Y�j�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-18 14:17:59'),(945,'10b472f2-1577-422e-bb1a-3d82978397f0','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$10b472f2-1577-422e-bb1a-3d82978397f0sr\0java.util.Datehj�KYt\0\0xpw\0\0Y�`�xsq\0~\0w\0\0Y\�N�xsq\0~\0w\0\0Y�b\�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2016-12-18 14:23:24'),(946,'a387f688-a1b9-4f1f-af21-97f675473bd1','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$a387f688-a1b9-4f1f-af21-97f675473bd1sr\0java.util.Datehj�KYt\0\0xpw\0\0Y#o�xsq\0~\0w\0\0YZ]\�xsq\0~\0w\0\0Y#q�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2016-12-19 11:32:41'),(947,'a62e1da8-bc1a-4296-a1cf-ec539be33617','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$a62e1da8-bc1a-4296-a1cf-ec539be33617sr\0java.util.Datehj�KYt\0\0xpw\0\0Y#wxsq\0~\0w\0\0Y�z�xsq\0~\0w\0\0Y�z�xw\Z\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection�X%ƣJ\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx','2016-12-19 11:32:43'),(948,'886c973e-2ae4-44d1-a0f3-d7a9b2da9399','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$886c973e-2ae4-44d1-a0f3-d7a9b2da9399sr\0java.util.Datehj�KYt\0\0xpw\0\0Y��\�xsq\0~\0w\0\0Y3\�xsq\0~\0w\0\0Y��Nxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2016-12-19 15:30:17'),(949,'c8c45a0a-3e1b-4af6-bd52-40c983b31f95','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$c8c45a0a-3e1b-4af6-bd52-40c983b31f95sr\0java.util.Datehj�KYt\0\0xpw\0\0Y_��xsq\0~\0w\0\0Y_��xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-19 17:18:03'),(950,'4d3fba89-72f9-45f6-9c3f-c48c3f0d33af','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$4d3fba89-72f9-45f6-9c3f-c48c3f0d33afsr\0java.util.Datehj�KYt\0\0xpw\0\0Y�whxsq\0~\0w\0\0Y�yMxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-19 17:55:01'),(951,'4185f160-03e9-4a6f-bbd4-5815bfca0bd4','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$4185f160-03e9-4a6f-bbd4-5815bfca0bd4sr\0java.util.Datehj�KYt\0\0xpw\0\0Y���xsq\0~\0w\0\0Y�z\�xsq\0~\0w\0\0Y��xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2016-12-19 17:56:12'),(952,'a40decc2-c6b5-4bff-b7dd-52e247571efb','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$a40decc2-c6b5-4bff-b7dd-52e247571efbsr\0java.util.Datehj�KYt\0\0xpw\0\0Ya�xsq\0~\0w\0\0Ya\�xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0POSTt\0(sid=8d7014eb-c21b-465e-83c6-bc4113f04e04t\0/happy-help/api/v1/user/8482063xx','2016-12-19 21:59:14'),(953,'ac1f3bc8-d137-4b0f-b861-e34c7077509d','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$ac1f3bc8-d137-4b0f-b861-e34c7077509dsr\0java.util.Datehj�KYt\0\0xpw\0\0Y<>\�xsq\0~\0w\0\0Y<@�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-20 15:57:30'),(954,'1d0998ee-a0c3-46b2-89d7-dfa876e57725','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$1d0998ee-a0c3-46b2-89d7-dfa876e57725sr\0java.util.Datehj�KYt\0\0xpw\0\0Y<j\�xsq\0~\0w\0\0Y<k<xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-20 15:57:41'),(955,'315983f1-171a-4e4a-9956-3661c630000f','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$315983f1-171a-4e4a-9956-3661c630000fsr\0java.util.Datehj�KYt\0\0xpw\0\0Y_8�xsq\0~\0w\0\0Y_:Gxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-20 16:35:42'),(956,'270089a1-54bd-4254-b58f-5a3ca1b8d798','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0_t\0$270089a1-54bd-4254-b58f-5a3ca1b8d798sr\0java.util.Datehj�KYt\0\0xpw\0\0Y_?gxsq\0~\0w\0\0Ybn\�xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1x','2016-12-20 16:35:44'),(957,'9c4839ea-640d-4905-b080-4141842e0473','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0_t\0$9c4839ea-640d-4905-b080-4141842e0473sr\0java.util.Datehj�KYt\0\0xpw\0\0Ybn�xsq\0~\0w\0\0Yf\�}xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1x','2016-12-20 16:39:13'),(958,'53435891-c9bd-4923-8cf5-2f6c7ab0aa66','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$53435891-c9bd-4923-8cf5-2f6c7ab0aa66sr\0java.util.Datehj�KYt\0\0xpw\0\0Yf�7xsq\0~\0w\0\0Y��%xsq\0~\0w\0\0Yf�exw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2016-12-20 16:43:56'),(959,'7f22c67b-84ae-4f4b-9461-913516a4191e','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$7f22c67b-84ae-4f4b-9461-913516a4191esr\0java.util.Datehj�KYt\0\0xpw\0\0Yf\�xsq\0~\0w\0\0Y��xsq\0~\0w\0\0Yf��xw\Z\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2016-12-20 16:44:05'),(960,'e6a8b7e4-f7d3-41b4-8121-0870a0e7bbb3','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$e6a8b7e4-f7d3-41b4-8121-0870a0e7bbb3sr\0java.util.Datehj�KYt\0\0xpw\0\0Yn��xsq\0~\0w\0\0Y��!xsq\0~\0w\0\0YpG\�xw\Z\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-helpxx','2016-12-20 16:52:54'),(961,'063b9d4f-9af1-48f9-ac1f-ee5d11d6cac3','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$063b9d4f-9af1-48f9-ac1f-ee5d11d6cac3sr\0java.util.Datehj�KYt\0\0xpw\0\0Yp�\nxsq\0~\0w\0\0Y��xsq\0~\0w\0\0Yv�Cxw\Z\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-helpxx','2016-12-20 16:54:39'),(962,'24822e2d-0ff7-46fc-962b-ed42f2b641d4','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$24822e2d-0ff7-46fc-962b-ed42f2b641d4sr\0java.util.Datehj�KYt\0\0xpw\0\0Y�;xsq\0~\0w\0\0Yn��xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection�X%ƣJ\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx','2016-12-20 17:11:35'),(963,'fa75e284-9eb0-4099-bfa5-b80f0c2725ab','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$fa75e284-9eb0-4099-bfa5-b80f0c2725absr\0java.util.Datehj�KYt\0\0xpw\0\0Y�xsq\0~\0w\0\0Y	\�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-20 19:46:39'),(964,'bd558a53-c811-4336-87fb-bf8cedb86cd7','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$bd558a53-c811-4336-87fb-bf8cedb86cd7sr\0java.util.Datehj�KYt\0\0xpw\0\0Y _�xsq\0~\0w\0\0Y aExw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-20 20:06:41'),(965,'0a943d7c-7142-4d44-af19-db900ba6b313','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$0a943d7c-7142-4d44-af19-db900ba6b313sr\0java.util.Datehj�KYt\0\0xpw\0\0Y:\�xsq\0~\0w\0\0Y:��xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-20 20:35:13'),(966,'4527f9db-abcb-4ab6-aa5f-cd2abe2c4789','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$4527f9db-abcb-4ab6-aa5f-cd2abe2c4789sr\0java.util.Datehj�KYt\0\0xpw\0\0Y>�wxsq\0~\0w\0\0Y>�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-20 20:39:49'),(967,'d8084b9f-50dd-4221-b1bd-e68818f21013','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$d8084b9f-50dd-4221-b1bd-e68818f21013sr\0java.util.Datehj�KYt\0\0xpw\0\0Yn\�\�xsq\0~\0w\0\0Yn\�xxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-20 21:32:28'),(968,'ff574320-0753-41aa-9d8c-0b15a31d60c6','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$ff574320-0753-41aa-9d8c-0b15a31d60c6sr\0java.util.Datehj�KYt\0\0xpw\0\0Y$�\'hxsq\0~\0w\0\0Y$�)Sxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-22 13:19:20'),(969,'29fc2e8e-b45a-4c8c-ab1e-7b63206fc27f','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$29fc2e8e-b45a-4c8c-ab1e-7b63206fc27fsr\0java.util.Datehj�KYt\0\0xpw\0\0Y$�1\�xsq\0~\0w\0\0Y$��Nxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection�X%ƣJ\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx','2016-12-22 13:19:23'),(970,'bf6ef652-7e11-42de-a207-0acf74614248','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$bf6ef652-7e11-42de-a207-0acf74614248sr\0java.util.Datehj�KYt\0\0xpw\0\0Y%�xsq\0~\0w\0\0Y%)�\�xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection�X%ƣJ\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx','2016-12-22 13:35:00'),(971,'e3655d1f-9c04-4edc-aa8a-6d44d49ae5c9','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$e3655d1f-9c04-4edc-aa8a-6d44d49ae5c9sr\0java.util.Datehj�KYt\0\0xpw\0\0Y%L�xsq\0~\0w\0\0Y%Oxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-22 13:48:59'),(972,'23b1043b-7524-4bf2-8e61-39cb2644e873','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$23b1043b-7524-4bf2-8e61-39cb2644e873sr\0java.util.Datehj�KYt\0\0xpw\0\0Y%!\�mxsq\0~\0w\0\0Y%!\�Gxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-22 14:04:55'),(973,'bbb58304-eed4-48a6-b52e-434cd41eb8a4','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$bbb58304-eed4-48a6-b52e-434cd41eb8a4sr\0java.util.Datehj�KYt\0\0xpw\0\0Y%%�\�xsq\0~\0w\0\0Y%%�Cxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-22 14:08:56'),(974,'84d4f889-c5e8-4b62-8a34-8cb07e8da47b','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$84d4f889-c5e8-4b62-8a34-8cb07e8da47bsr\0java.util.Datehj�KYt\0\0xpw\0\0Y%)��xsq\0~\0w\0\0Y%)�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-22 14:13:18'),(975,'93154a1e-b8d5-4976-958b-8331ded132f4','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$93154a1e-b8d5-4976-958b-8331ded132f4sr\0java.util.Datehj�KYt\0\0xpw\0\0Y%3�\�xsq\0~\0w\0\0Y&<\�xsq\0~\0w\0\0Y%\�\�xw\Z\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection�X%ƣJ\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx','2016-12-22 14:24:15'),(976,'f813479a-68bd-45e6-a3e3-106beb19f5a7','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$f813479a-68bd-45e6-a3e3-106beb19f5a7sr\0java.util.Datehj�KYt\0\0xpw\0\0Y%I\�xsq\0~\0w\0\0Y%I\�[xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-22 14:48:36'),(977,'33c20758-f47f-4131-97d2-a32ea3ef3065','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$33c20758-f47f-4131-97d2-a32ea3ef3065sr\0java.util.Datehj�KYt\0\0xpw\0\0Y%N\��xsq\0~\0w\0\0Y%Nٞxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-22 14:54:01'),(978,'400a0a39-c7ad-4e0f-85c7-b733b5e41849','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$400a0a39-c7ad-4e0f-85c7-b733b5e41849sr\0java.util.Datehj�KYt\0\0xpw\0\0Y%Y\Z1xsq\0~\0w\0\0Y%Y\�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-22 15:05:14'),(979,'dd468209-06b8-42fb-bfc5-ac800484e80e','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$dd468209-06b8-42fb-bfc5-ac800484e80esr\0java.util.Datehj�KYt\0\0xpw\0\0Y%\\`xsq\0~\0w\0\0Y%\\a�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-22 15:08:48'),(980,'524a1876-9528-4383-aa21-13de70edfa99','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$524a1876-9528-4383-aa21-13de70edfa99sr\0java.util.Datehj�KYt\0\0xpw\0\0Y%_j�xsq\0~\0w\0\0Y%l_\�xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection�X%ƣJ\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx','2016-12-22 15:12:07'),(981,'5eb9aad7-ddd2-4646-8045-e2ab3f4872b0','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$5eb9aad7-ddd2-4646-8045-e2ab3f4872b0sr\0java.util.Datehj�KYt\0\0xpw\0\0Y%m\�xsq\0~\0w\0\0Y%��\�xsq\0~\0w\0\0Y%m[xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2016-12-22 15:27:02'),(982,'5da812be-8a95-4671-b218-b3c8df1c1686','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$5da812be-8a95-4671-b218-b3c8df1c1686sr\0java.util.Datehj�KYt\0\0xpw\0\0Y%\�N�xsq\0~\0w\0\0Y&=[xsq\0~\0w\0\0Y%\�P\�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2016-12-22 17:09:58'),(983,'d4c077ef-5ad3-4484-baa1-8158ef59a5a7','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$d4c077ef-5ad3-4484-baa1-8158ef59a5a7sr\0java.util.Datehj�KYt\0\0xpw\0\0Y&�8�xsq\0~\0w\0\0Y&�;0xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-22 21:02:32'),(984,'fb9f4ce3-26f3-4316-8b66-1d772f4b8b60','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$fb9f4ce3-26f3-4316-8b66-1d772f4b8b60sr\0java.util.Datehj�KYt\0\0xpw\0\0Y&�F\�xsq\0~\0w\0\0Y&Һ�xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-22 21:02:35'),(985,'bffbd817-c430-4fa9-a831-4bbb3a9afdbe','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$bffbd817-c430-4fa9-a831-4bbb3a9afdbesr\0java.util.Datehj�KYt\0\0xpw\0\0Y&�B�xsq\0~\0w\0\0Y&�D2xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-22 21:06:56'),(986,'9a33be97-1e8f-472d-b4ba-c5a534bff206','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$9a33be97-1e8f-472d-b4ba-c5a534bff206sr\0java.util.Datehj�KYt\0\0xpw\0\0Y&�\��xsq\0~\0w\0\0Y&�\�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-22 21:14:10'),(987,'3baa41ff-572b-4020-a710-5f23f11a1e27','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$3baa41ff-572b-4020-a710-5f23f11a1e27sr\0java.util.Datehj�KYt\0\0xpw\0\0Y&�&�xsq\0~\0w\0\0Y&�)�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-22 21:15:33'),(988,'84929322-2e9c-43cf-ae26-5c4bd96d98c1','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$84929322-2e9c-43cf-ae26-5c4bd96d98c1sr\0java.util.Datehj�KYt\0\0xpw\0\0Y&��>xsq\0~\0w\0\0Y&��\�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-22 21:19:13'),(989,'8ffdfafa-9c37-4c4d-9e2a-c1f1e9f7310a','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$8ffdfafa-9c37-4c4d-9e2a-c1f1e9f7310asr\0java.util.Datehj�KYt\0\0xpw\0\0Y&�\rxsq\0~\0w\0\0Y&��xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-22 21:20:55'),(990,'cceb0dc8-5e3d-4c79-bf63-8cf0f5125866','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$cceb0dc8-5e3d-4c79-bf63-8cf0f5125866sr\0java.util.Datehj�KYt\0\0xpw\0\0Y&���xsq\0~\0w\0\0Y&���xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-22 21:22:45'),(991,'e6d92099-8fec-4853-8457-49a671e74c5c','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$e6d92099-8fec-4853-8457-49a671e74c5csr\0java.util.Datehj�KYt\0\0xpw\0\0Y&�#�xsq\0~\0w\0\0Y&�%txw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-22 21:24:17'),(992,'d1cfd6fa-a700-4273-9741-687d13fc6acc','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$d1cfd6fa-a700-4273-9741-687d13fc6accsr\0java.util.Datehj�KYt\0\0xpw\0\0Y&��\�xsq\0~\0w\0\0Y&���xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-22 21:30:21'),(993,'ea2485ab-1446-410c-a377-2812153fec18','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$ea2485ab-1446-410c-a377-2812153fec18sr\0java.util.Datehj�KYt\0\0xpw\0\0Y&ўbxsq\0~\0w\0\0Y&ѡAxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-22 21:56:29'),(994,'b21c3af9-c144-4c5a-b7c2-505be24edb73','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$b21c3af9-c144-4c5a-b7c2-505be24edb73sr\0java.util.Datehj�KYt\0\0xpw\0\0Y)�\"�xsq\0~\0w\0\0Y)�$xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-23 11:31:53'),(995,'1632d26d-f764-471b-9e64-6ed42868f6d5','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$1632d26d-f764-471b-9e64-6ed42868f6d5sr\0java.util.Datehj�KYt\0\0xpw\0\0Y)�+|xsq\0~\0w\0\0Y+-\�xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection�X%ƣJ\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\08482063xx\0wq\0~\0xxx','2016-12-23 11:31:55'),(996,'20815811-b1e2-4a31-8c07-6ebccdd1ebb1','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$20815811-b1e2-4a31-8c07-6ebccdd1ebb1sr\0java.util.Datehj�KYt\0\0xpw\0\0Y)\�Pxsq\0~\0w\0\0Y)\�S�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-23 11:49:33'),(997,'f76f1a14-8cf1-4df3-aea5-1129a1bfd5bd','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$f76f1a14-8cf1-4df3-aea5-1129a1bfd5bdsr\0java.util.Datehj�KYt\0\0xpw\0\0Y)\�\0,xsq\0~\0w\0\0Y)\�\�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-23 12:03:24'),(998,'64552bcc-dbe4-4475-bf44-a4dc89b82c2b','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$64552bcc-dbe4-4475-bf44-a4dc89b82c2bsr\0java.util.Datehj�KYt\0\0xpw\0\0Y)\��mxsq\0~\0w\0\0Y)\��|xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-23 12:27:22'),(999,'91eb45ed-5006-43f4-8704-e6f9d34eee89','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$91eb45ed-5006-43f4-8704-e6f9d34eee89sr\0java.util.Datehj�KYt\0\0xpw\0\0Y)�*�xsq\0~\0w\0\0Y)�,xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-23 12:33:05'),(1000,'fc5c8057-1c76-4038-a4ca-b25b017dcd7c','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$fc5c8057-1c76-4038-a4ca-b25b017dcd7csr\0java.util.Datehj�KYt\0\0xpw\0\0Y*\0\�xsq\0~\0w\0\0Y*^xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-23 12:47:06'),(1001,'fa9f23b4-f29b-4906-96c9-d98ad03d0894','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$fa9f23b4-f29b-4906-96c9-d98ad03d0894sr\0java.util.Datehj�KYt\0\0xpw\0\0Y*\�5xsq\0~\0w\0\0Y*ϊxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-23 12:54:32'),(1002,'e61f4451-c849-4737-a779-80defbbcba15','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$e61f4451-c849-4737-a779-80defbbcba15sr\0java.util.Datehj�KYt\0\0xpw\0\0Y*s�xsq\0~\0w\0\0Y*uuxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-23 12:58:31'),(1003,'503f2075-547f-4e33-be17-253f4e8a0080','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$503f2075-547f-4e33-be17-253f4e8a0080sr\0java.util.Datehj�KYt\0\0xpw\0\0Y*\�\�xsq\0~\0w\0\0Y*\�\�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-23 13:11:02'),(1004,'b9f74e3f-e9ec-45de-ba78-9d0fc87d37b3','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$b9f74e3f-e9ec-45de-ba78-9d0fc87d37b3sr\0java.util.Datehj�KYt\0\0xpw\0\0Y*.\�nxsq\0~\0w\0\0Y*.�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-23 13:37:16'),(1005,'fee91d6f-36be-4078-a134-60fee42e1a6d','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$fee91d6f-36be-4078-a134-60fee42e1a6dsr\0java.util.Datehj�KYt\0\0xpw\0\0Y*;ãxsq\0~\0w\0\0Y*r��xsq\0~\0w\0\0Y*;\��xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2016-12-23 13:51:17'),(1006,'86dfb53a-d55f-48b4-ad61-645a897dcdee','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$86dfb53a-d55f-48b4-ad61-645a897dcdeesr\0java.util.Datehj�KYt\0\0xpw\0\0Y*\�\�xsq\0~\0w\0\0Y*\��xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-23 16:34:13'),(1007,'19aeef36-00ec-4b3f-8bae-de70720b0ac4','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$19aeef36-00ec-4b3f-8bae-de70720b0ac4sr\0java.util.Datehj�KYt\0\0xpw\0\0Y*\�,�xsq\0~\0w\0\0Y*\�/fxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-23 16:38:51'),(1008,'3c19cc7b-521e-4419-81b2-fe70c792b8a1','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$3c19cc7b-521e-4419-81b2-fe70c792b8a1sr\0java.util.Datehj�KYt\0\0xpw\0\0Y*\�\0xsq\0~\0w\0\0Y*\�\�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-23 17:01:36'),(1009,'41b48a31-c01c-48ce-8825-d6ba9a228649','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$41b48a31-c01c-48ce-8825-d6ba9a228649sr\0java.util.Datehj�KYt\0\0xpw\0\0Y*\�\�xsq\0~\0w\0\0Y*xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-23 17:06:41'),(1010,'a462c5e3-06c0-43db-95c0-e097d7d5a7fc','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$a462c5e3-06c0-43db-95c0-e097d7d5a7fcsr\0java.util.Datehj�KYt\0\0xpw\0\0Y+KMxsq\0~\0w\0\0Y+L\�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-23 17:33:35'),(1011,'0127c165-a3d6-476d-8db4-1f1ecba425f5','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$0127c165-a3d6-476d-8db4-1f1ecba425f5sr\0java.util.Datehj�KYt\0\0xpw\0\0Y+	\�Cxsq\0~\0w\0\0Y+	\�@xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-23 17:36:25'),(1012,'293e7bc8-7423-46a4-97d2-c8c5f1c3bf43','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$293e7bc8-7423-46a4-97d2-c8c5f1c3bf43sr\0java.util.Datehj�KYt\0\0xpw\0\0Y+��xsq\0~\0w\0\0Y+�Lxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-23 17:38:43'),(1013,'8686bb69-9e7b-4c93-93f8-63c1caf234c8','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$8686bb69-9e7b-4c93-93f8-63c1caf234c8sr\0java.util.Datehj�KYt\0\0xpw\0\0Y+ixsq\0~\0w\0\0Y+j\�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-23 17:55:34'),(1014,'3d927c98-0426-4009-aa0a-ecee2eb62c40','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$3d927c98-0426-4009-aa0a-ecee2eb62c40sr\0java.util.Datehj�KYt\0\0xpw\0\0Y+-\�[xsq\0~\0w\0\0Y+-\�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-23 18:15:44'),(1015,'34846d29-cf7a-4992-b3fd-2379bc688ba0','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$34846d29-cf7a-4992-b3fd-2379bc688ba0sr\0java.util.Datehj�KYt\0\0xpw\0\0Y/g9xsq\0~\0w\0\0Y/iDxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-24 12:27:29'),(1016,'d4825d5a-eaec-4f23-bc49-0bbe101bb27b','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$d4825d5a-eaec-4f23-bc49-0bbe101bb27bsr\0java.util.Datehj�KYt\0\0xpw\0\0Y/q\�xsq\0~\0w\0\0Y/r\rxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-24 12:27:32'),(1017,'78fb1c87-ee30-4dcf-b738-800e44614004','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$78fb1c87-ee30-4dcf-b738-800e44614004sr\0java.util.Datehj�KYt\0\0xpw\0\0Y/@Rxsq\0~\0w\0\0Y/N.kxsq\0~\0w\0\0Y/A\�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2016-12-24 12:29:30'),(1018,'f42efb88-6294-4130-a353-814df81f5382','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$f42efb88-6294-4130-a353-814df81f5382sr\0java.util.Datehj�KYt\0\0xpw\0\0Y/G\�xsq\0~\0w\0\0Y/N.\\xsq\0~\0w\0\0Y/�Lxw\Z\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2016-12-24 12:29:32'),(1019,'83d08ece-c53b-4b1f-b371-ec6efa7cd46b','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$83d08ece-c53b-4b1f-b371-ec6efa7cd46bsr\0java.util.Datehj�KYt\0\0xpw\0\0Y/i\�\�xsq\0~\0w\0\0Y/i\�=xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-24 13:59:46'),(1020,'909278fb-449e-4f01-bb63-7314a5ebdf84','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$909278fb-449e-4f01-bb63-7314a5ebdf84sr\0java.util.Datehj�KYt\0\0xpw\0\0Y/i\�xsq\0~\0w\0\0Y/\�\�\�xsq\0~\0w\0\0Y/�\�]xw\Z\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection�X%ƣJ\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx','2016-12-24 13:59:48'),(1021,'fccc6f44-535d-45d8-b326-230649fbe269','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$fccc6f44-535d-45d8-b326-230649fbe269sr\0java.util.Datehj�KYt\0\0xpw\0\0Y/x��xsq\0~\0w\0\0Y/x��xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-24 14:15:55'),(1022,'40fdf355-a47b-4d46-8983-cfcd4c1de898','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$40fdf355-a47b-4d46-8983-cfcd4c1de898sr\0java.util.Datehj�KYt\0\0xpw\0\0Y/�߁xsq\0~\0w\0\0Y/�\�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-24 14:37:59'),(1023,'9b8d41b0-a62d-45cd-898f-85e59cb2bcd4','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$9b8d41b0-a62d-45cd-898f-85e59cb2bcd4sr\0java.util.Datehj�KYt\0\0xpw\0\0Y/�Fxsq\0~\0w\0\0Y/�Lxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-24 14:40:23'),(1024,'bc00b9c1-9d38-4e46-ab11-5ca5f92112be','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$bc00b9c1-9d38-4e46-ab11-5ca5f92112besr\0java.util.Datehj�KYt\0\0xpw\0\0Y/��\�xsq\0~\0w\0\0Y/��\\xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-24 14:41:20'),(1025,'c55f0bac-672c-4547-8aeb-64602e7154e9','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$c55f0bac-672c-4547-8aeb-64602e7154e9sr\0java.util.Datehj�KYt\0\0xpw\0\0Y/�\�\�xsq\0~\0w\0\0Y/\�\�\�xsq\0~\0w\0\0Y/�\�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2016-12-24 14:42:24'),(1026,'c4f720fd-49c6-4566-9b66-aa4a0f6967df','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$c4f720fd-49c6-4566-9b66-aa4a0f6967dfsr\0java.util.Datehj�KYt\0\0xpw\0\0Y0��\�xsq\0~\0w\0\0Y0\�\�\�xsq\0~\0w\0\0Y0��-xw\Z\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection�X%ƣJ\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx','2016-12-24 19:06:28'),(1027,'cb56bcc4-543b-42b8-87de-8eb022e2a8e4','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$cb56bcc4-543b-42b8-87de-8eb022e2a8e4sr\0java.util.Datehj�KYt\0\0xpw\0\0Y0�=xsq\0~\0w\0\0Y0�\�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-24 19:17:44'),(1028,'fb27d14b-c9b7-4500-aa9c-ad8ee8a29dfb','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$fb27d14b-c9b7-4500-aa9c-ad8ee8a29dfbsr\0java.util.Datehj�KYt\0\0xpw\0\0Y0���xsq\0~\0w\0\0Y0\�\�xsq\0~\0w\0\0Y0��3xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2016-12-24 19:25:21'),(1029,'5857aad7-f323-4849-be6a-33e6de48570d','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$5857aad7-f323-4849-be6a-33e6de48570dsr\0java.util.Datehj�KYt\0\0xpw\0\0Y4t\�xsq\0~\0w\0\0Y4��xsq\0~\0w\0\0Y4taxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2016-12-25 13:29:00'),(1030,'ae853944-26ef-4f0d-8d90-9d1a3e16f9f2','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$ae853944-26ef-4f0d-8d90-9d1a3e16f9f2sr\0java.util.Datehj�KYt\0\0xpw\0\0Y4t$xsq\0~\0w\0\0Y5k\�xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection�X%ƣJ\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx','2016-12-25 13:29:04'),(1031,'0cbafefa-12c7-46ea-8b3f-2f49b137f15f','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$0cbafefa-12c7-46ea-8b3f-2f49b137f15fsr\0java.util.Datehj�KYt\0\0xpw\0\0Y5\n\�\�xsq\0~\0w\0\0Y5\n\�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-25 16:13:44'),(1032,'1990accd-860f-4a68-abc3-c46404c92bf4','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$1990accd-860f-4a68-abc3-c46404c92bf4sr\0java.util.Datehj�KYt\0\0xpw\0\0Y5[�xsq\0~\0w\0\0Y5]�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-25 16:15:19'),(1033,'1351bbe3-8f3c-4b1d-8eb4-5130d71fa531','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$1351bbe3-8f3c-4b1d-8eb4-5130d71fa531sr\0java.util.Datehj�KYt\0\0xpw\0\0Y5F�fxsq\0~\0w\0\0Y5F��xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-25 17:19:04'),(1034,'5e89f9b6-3b9e-4133-9e50-2ee7cd467316','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$5e89f9b6-3b9e-4133-9e50-2ee7cd467316sr\0java.util.Datehj�KYt\0\0xpw\0\0Y5F½xsq\0~\0w\0\0Y5F\��xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-25 17:19:07'),(1035,'24d1fe67-3660-429e-a0f5-b86e83156c3b','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$24d1fe67-3660-429e-a0f5-b86e83156c3bsr\0java.util.Datehj�KYt\0\0xpw\0\0Y5dQ�xsq\0~\0w\0\0Y5�?�xsq\0~\0w\0\0Y5dSkxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2016-12-25 17:51:24'),(1036,'44761fbd-8bc8-497c-af18-54d1f1e8e8b6','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$44761fbd-8bc8-497c-af18-54d1f1e8e8b6sr\0java.util.Datehj�KYt\0\0xpw\0\0Y5dY�xsq\0~\0w\0\0Y5�?\�xsq\0~\0w\0\0Y5d\��xw\Z\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2016-12-25 17:51:26'),(1037,'c0c7d327-ca9e-44dd-b598-abfd39720a76','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$c0c7d327-ca9e-44dd-b598-abfd39720a76sr\0java.util.Datehj�KYt\0\0xpw\0\0Y@Syxsq\0~\0w\0\0Y@��;xsq\0~\0w\0\0Y@S\r\�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2016-12-27 20:48:20'),(1038,'137c63d8-3dc9-404e-b6b3-e8eed2b14a04','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$137c63d8-3dc9-404e-b6b3-e8eed2b14a04sr\0java.util.Datehj�KYt\0\0xpw\0\0Y@S\Z!xsq\0~\0w\0\0Y@��Jxsq\0~\0w\0\0Y@S�fxw\Z\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection�X%ƣJ\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx','2016-12-27 20:48:25'),(1039,'69cedf16-bfc9-4193-a58b-194ac4b9079f','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$69cedf16-bfc9-4193-a58b-194ac4b9079fsr\0java.util.Datehj�KYt\0\0xpw\0\0YD��\�xsq\0~\0w\0\0YD\�Lxsq\0~\0w\0\0YD��`xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2016-12-28 17:08:01'),(1040,'a8cf6242-7142-4794-b9ad-744abb62f31c','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$a8cf6242-7142-4794-b9ad-744abb62f31csr\0java.util.Datehj�KYt\0\0xpw\0\0YD���xsq\0~\0w\0\0YD朐xsq\0~\0w\0\0YD��5xw\Z\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2016-12-28 17:08:05'),(1041,'2b0d750f-ac81-481d-b5a0-3ee44a02217e','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$2b0d750f-ac81-481d-b5a0-3ee44a02217esr\0java.util.Datehj�KYt\0\0xpw\0\0YE!\�Gxsq\0~\0w\0\0YEX�Xxsq\0~\0w\0\0YE!\�\�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2016-12-28 19:12:40'),(1042,'2f62131d-883c-4cac-91ad-fe95a85932a7','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$2f62131d-883c-4cac-91ad-fe95a85932a7sr\0java.util.Datehj�KYt\0\0xpw\0\0YE!\�Zxsq\0~\0w\0\0YEX�fxsq\0~\0w\0\0YE!ԋxw\Z\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2016-12-28 19:12:42'),(1043,'4c6a9ba7-6336-467f-b496-83fc80c0ee91','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$4c6a9ba7-6336-467f-b496-83fc80c0ee91sr\0java.util.Datehj�KYt\0\0xpw\0\0YI���xsq\0~\0w\0\0YI��@xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-29 16:16:21'),(1044,'2ef857dc-f025-4e12-bbde-380f5c525134','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$2ef857dc-f025-4e12-bbde-380f5c525134sr\0java.util.Datehj�KYt\0\0xpw\0\0YI�\�,xsq\0~\0w\0\0YI�t�xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection�X%ƣJ\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx','2016-12-29 16:16:24'),(1045,'ac204c5f-6fac-4daf-8d53-87943305c4b1','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$ac204c5f-6fac-4daf-8d53-87943305c4b1sr\0java.util.Datehj�KYt\0\0xpw\0\0YI�!�xsq\0~\0w\0\0YI�#�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-29 16:20:04'),(1046,'7cb97e8c-dc6a-4308-a6b3-56819e19ebb9','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$7cb97e8c-dc6a-4308-a6b3-56819e19ebb9sr\0java.util.Datehj�KYt\0\0xpw\0\0YI�(�xsq\0~\0w\0\0YI�*�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-29 16:22:17'),(1047,'68a3c1ce-cfba-4c12-856f-da8abc54f7f6','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0_t\0$68a3c1ce-cfba-4c12-856f-da8abc54f7f6sr\0java.util.Datehj�KYt\0\0xpw\0\0YI�\�xsq\0~\0w\0\0YI�&xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1x','2016-12-29 16:22:56'),(1048,'30249b28-6163-4462-bd13-2080967910ae','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0_t\0$30249b28-6163-4462-bd13-2080967910aesr\0java.util.Datehj�KYt\0\0xpw\0\0YI�5xsq\0~\0w\0\0YI�8+xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1x','2016-12-29 16:23:17'),(1049,'7abcab23-a289-4f62-a3fe-541fc32c3395','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0_t\0$7abcab23-a289-4f62-a3fe-541fc32c3395sr\0java.util.Datehj�KYt\0\0xpw\0\0YI�8<xsq\0~\0w\0\0YI�m=xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1x','2016-12-29 16:23:26'),(1050,'f0cfdfc1-0439-42ea-a806-a1803614f719','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$f0cfdfc1-0439-42ea-a806-a1803614f719sr\0java.util.Datehj�KYt\0\0xpw\0\0YI���xsq\0~\0w\0\0YI\�X\�xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpxx','2016-12-29 16:37:02'),(1051,'bb90c0d4-0ecb-4584-a40b-7ee9ef4b0fd1','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$bb90c0d4-0ecb-4584-a40b-7ee9ef4b0fd1sr\0java.util.Datehj�KYt\0\0xpw\0\0YI\�Pxsq\0~\0w\0\0YI\�Q�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-29 17:10:30'),(1052,'6e80e5cf-d960-4697-be96-27b92aeaec54','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$6e80e5cf-d960-4697-be96-27b92aeaec54sr\0java.util.Datehj�KYt\0\0xpw\0\0YI\��xsq\0~\0w\0\0YI\�\�\�xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpxx','2016-12-29 17:11:18'),(1053,'17bf3525-8903-4094-83b8-2ed0ec78f8a1','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$17bf3525-8903-4094-83b8-2ed0ec78f8a1sr\0java.util.Datehj�KYt\0\0xpw\0\0YI\�X�xsq\0~\0w\0\0YIܰ�xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpxx','2016-12-29 17:11:38'),(1054,'5267efc2-d7b3-4335-9497-a9b2ef76ab13','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$5267efc2-d7b3-4335-9497-a9b2ef76ab13sr\0java.util.Datehj�KYt\0\0xpw\0\0YI\�\n�xsq\0~\0w\0\0YI\��Gxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpt\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYq\0~\0\nt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection�X%ƣJ\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx','2016-12-29 17:12:24'),(1055,'3053b62a-a69b-40fe-84db-afa86a9eedac','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$3053b62a-a69b-40fe-84db-afa86a9eedacsr\0java.util.Datehj�KYt\0\0xpw\0\0YIܰ�xsq\0~\0w\0\0YI\�qLxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpt\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYq\0~\0\nt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection�X%ƣJ\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx','2016-12-29 17:15:17'),(1056,'b686baf7-21c6-49e8-87ee-122bbdf6ee0d','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$b686baf7-21c6-49e8-87ee-122bbdf6ee0dsr\0java.util.Datehj�KYt\0\0xpw\0\0YI\�\�xsq\0~\0w\0\0YI\�\�xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection�X%ƣJ\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx','2016-12-29 17:19:43'),(1057,'6fa36293-4e14-4932-ad7e-f6186446664f','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$6fa36293-4e14-4932-ad7e-f6186446664fsr\0java.util.Datehj�KYt\0\0xpw\0\0YI\�\�;xsq\0~\0w\0\0YI\��(xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpt\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYq\0~\0\nt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection�X%ƣJ\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx','2016-12-29 17:19:54'),(1058,'e30daeb4-8315-4be4-91b5-b2e73a6efbda','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$e30daeb4-8315-4be4-91b5-b2e73a6efbdasr\0java.util.Datehj�KYt\0\0xpw\0\0YI\� ^xsq\0~\0w\0\0YI\�!\�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-29 17:21:13'),(1059,'4e0a35b3-a494-4b29-badb-ca44ec130773','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$4e0a35b3-a494-4b29-badb-ca44ec130773sr\0java.util.Datehj�KYt\0\0xpw\0\0YI\�-!xsq\0~\0w\0\0YI\�g\�xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpxx','2016-12-29 17:21:17'),(1060,'4fabc31c-e741-4649-94db-e8f6508df24e','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$4fabc31c-e741-4649-94db-e8f6508df24esr\0java.util.Datehj�KYt\0\0xpw\0\0YI\�X.xsq\0~\0w\0\0YI\�hxq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpxx','2016-12-29 17:21:28'),(1061,'741cfa55-c855-4e6f-a799-9e043e7b50eb','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$741cfa55-c855-4e6f-a799-9e043e7b50ebsr\0java.util.Datehj�KYt\0\0xpw\0\0YI\�g\�xsq\0~\0w\0\0YI\�\�xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpxx','2016-12-29 17:21:32'),(1062,'ad588630-2adb-4761-abb7-44d30881466c','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$ad588630-2adb-4761-abb7-44d30881466csr\0java.util.Datehj�KYt\0\0xpw\0\0YI\�\�xsq\0~\0w\0\0YI⊧xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpxx','2016-12-29 17:21:39'),(1063,'1befe3d6-f617-4a21-8635-3ad515e61f41','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$1befe3d6-f617-4a21-8635-3ad515e61f41sr\0java.util.Datehj�KYt\0\0xpw\0\0YI⊰xsq\0~\0w\0\0YI\�\�xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpxx','2016-12-29 17:21:41'),(1064,'e434b8de-12df-4c89-91b0-276c8dad1a68','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$e434b8de-12df-4c89-91b0-276c8dad1a68sr\0java.util.Datehj�KYt\0\0xpw\0\0YI\�\�xsq\0~\0w\0\0YI\��xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpxx','2016-12-29 17:21:41'),(1065,'c082864e-8d4b-4cd0-bae2-d9b2d904e99a','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$c082864e-8d4b-4cd0-bae2-d9b2d904e99asr\0java.util.Datehj�KYt\0\0xpw\0\0YI\�xsq\0~\0w\0\0YI\�\�\�xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpxx','2016-12-29 17:21:42'),(1066,'fa17882d-c41d-4309-9d05-6c18a88e700d','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0_t\0$fa17882d-c41d-4309-9d05-6c18a88e700dsr\0java.util.Datehj�KYt\0\0xpw\0\0YI\�nxsq\0~\0w\0\0YI�\�xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1x','2016-12-29 17:21:50'),(1067,'750ebe59-bee1-4715-980d-9f126db96bbe','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$750ebe59-bee1-4715-980d-9f126db96bbesr\0java.util.Datehj�KYt\0\0xpw\0\0YI\�\�\�xsq\0~\0w\0\0YI\�_sxq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpxx','2016-12-29 17:22:02'),(1068,'d86c073c-d00f-4e5e-8bd0-c3991e6d9159','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$d86c073c-d00f-4e5e-8bd0-c3991e6d9159sr\0java.util.Datehj�KYt\0\0xpw\0\0YI\�c}xsq\0~\0w\0\0YI\�l<xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-29 17:22:36'),(1069,'1b2b6b14-f06f-4072-bca6-3c1de4ad2edc','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$1b2b6b14-f06f-4072-bca6-3c1de4ad2edcsr\0java.util.Datehj�KYt\0\0xpw\0\0YI\�\�xsq\0~\0w\0\0YI\��xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-29 17:23:18'),(1070,'3547912f-54e3-4e0d-9e42-4b39de12e4ff','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$3547912f-54e3-4e0d-9e42-4b39de12e4ffsr\0java.util.Datehj�KYt\0\0xpw\0\0YI\�xsq\0~\0w\0\0YI�\�xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpxx','2016-12-29 17:23:24'),(1071,'edbccc35-ba07-4aa1-a35d-22fc67f68b22','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$edbccc35-ba07-4aa1-a35d-22fc67f68b22sr\0java.util.Datehj�KYt\0\0xpw\0\0YI�\�xsq\0~\0w\0\0YI�Gxq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpxx','2016-12-29 17:38:10'),(1072,'085fd3b1-d91d-42e3-ba3e-22da94511739','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$085fd3b1-d91d-42e3-ba3e-22da94511739sr\0java.util.Datehj�KYt\0\0xpw\0\0YI�\�xsq\0~\0w\0\0YI�I\nxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-29 17:40:16'),(1073,'5fa0d9a4-a877-4d86-a5ca-bf40d0e992e0','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$5fa0d9a4-a877-4d86-a5ca-bf40d0e992e0sr\0java.util.Datehj�KYt\0\0xpw\0\0YI�\\oxsq\0~\0w\0\0YI�I\�xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpxx','2016-12-29 17:42:14'),(1074,'892a08f8-e7b3-4836-888c-d93236553a7f','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$892a08f8-e7b3-4836-888c-d93236553a7fsr\0java.util.Datehj�KYt\0\0xpw\0\0YI�Lxsq\0~\0w\0\0YI��\�xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpxx','2016-12-29 17:42:59'),(1075,'20b73577-6c5c-4bd7-9f21-da63df17d12f','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$20b73577-6c5c-4bd7-9f21-da63df17d12fsr\0java.util.Datehj�KYt\0\0xpw\0\0YI�I\�xsq\0~\0w\0\0YI��pxq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpxx','2016-12-29 17:43:15'),(1076,'a28307ae-0a37-4fe9-89b5-d0ef42779894','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$a28307ae-0a37-4fe9-89b5-d0ef42779894sr\0java.util.Datehj�KYt\0\0xpw\0\0YI��\�xsq\0~\0w\0\0YJ\�\��xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpxx','2016-12-29 17:43:42'),(1077,'68d66bfd-c383-4fa9-858e-63b68bece60b','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$68d66bfd-c383-4fa9-858e-63b68bece60bsr\0java.util.Datehj�KYt\0\0xpw\0\0YI�\rUxsq\0~\0w\0\0YJ5�[xsq\0~\0w\0\0YI��xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2016-12-29 17:52:49'),(1078,'ddb90023-0c0b-4747-88b2-d40e57939581','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$ddb90023-0c0b-4747-88b2-d40e57939581sr\0java.util.Datehj�KYt\0\0xpw\0\0YI��vxsq\0~\0w\0\0YJ\�\�xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpxx','2016-12-29 17:53:26'),(1079,'5df0c237-5799-4f51-ab70-b09fe8c09947','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0_t\0$5df0c237-5799-4f51-ab70-b09fe8c09947sr\0java.util.Datehj�KYt\0\0xpw\0\0YJ\�\�xsq\0~\0w\0\0YJ\�}xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1x','2016-12-29 21:41:53'),(1080,'4c627618-3f81-471d-bb27-007ad6576085','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$4c627618-3f81-471d-bb27-007ad6576085sr\0java.util.Datehj�KYt\0\0xpw\0\0YJ\��xsq\0~\0w\0\0YJ\��Nxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-29 21:45:21'),(1081,'6971b969-1877-4c34-877c-e933fe605aa8','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$6971b969-1877-4c34-877c-e933fe605aa8sr\0java.util.Datehj�KYt\0\0xpw\0\0YJ\�}xsq\0~\0w\0\0YJ\�\�xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpxx','2016-12-29 21:45:57'),(1082,'7ed37922-2d43-4bb1-8a70-d35b93a0d60b','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$7ed37922-2d43-4bb1-8a70-d35b93a0d60bsr\0java.util.Datehj�KYt\0\0xpw\0\0YJ\�\��xsq\0~\0w\0\0YJ\�\�xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-29 21:46:18'),(1083,'27be8ea8-8844-4d73-8f9d-257d6cb82a3c','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$27be8ea8-8844-4d73-8f9d-257d6cb82a3csr\0java.util.Datehj�KYt\0\0xpw\0\0YJ\�c�xsq\0~\0w\0\0YJ\�c�xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-helpxx','2016-12-29 21:46:56'),(1084,'13e42f65-02c7-481f-8c88-29c859c1aca3','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$13e42f65-02c7-481f-8c88-29c859c1aca3sr\0java.util.Datehj�KYt\0\0xpw\0\0YJ\�\��xsq\0~\0w\0\0YJ\�ބxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-29 21:49:38'),(1085,'85a79eba-f00d-4821-a0d2-e3312a6a9b6b','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$85a79eba-f00d-4821-a0d2-e3312a6a9b6bsr\0java.util.Datehj�KYt\0\0xpw\0\0YJ\�\�xsq\0~\0w\0\0YJ\�i�xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpxx','2016-12-29 21:49:39'),(1086,'eb27d3ae-ac6e-44ad-a0a0-a2ef0bc20511','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$eb27d3ae-ac6e-44ad-a0a0-a2ef0bc20511sr\0java.util.Datehj�KYt\0\0xpw\0\0YJ\�i�xsq\0~\0w\0\0YJ\�i�xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-29 21:50:14'),(1087,'d795503e-66df-404c-bf85-e67e1b81d4d0','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$d795503e-66df-404c-bf85-e67e1b81d4d0sr\0java.util.Datehj�KYt\0\0xpw\0\0YJ\�\�xsq\0~\0w\0\0YJ\�\�xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpxx','2016-12-29 21:51:49'),(1088,'ef140c47-975f-41a5-931e-8928e2c47ec2','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$ef140c47-975f-41a5-931e-8928e2c47ec2sr\0java.util.Datehj�KYt\0\0xpw\0\0YJ\�\�xsq\0~\0w\0\0YJ\�\�=xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpxx','2016-12-29 21:51:52'),(1089,'9bcd2a2e-af26-43a3-845e-c2570daf33b3','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$9bcd2a2e-af26-43a3-845e-c2570daf33b3sr\0java.util.Datehj�KYt\0\0xpw\0\0YJ\�}�xsq\0~\0w\0\0YJ\�Fxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-29 21:53:36'),(1090,'bf701bcb-0695-407e-8f10-81bff81e67f4','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$bf701bcb-0695-407e-8f10-81bff81e67f4sr\0java.util.Datehj�KYt\0\0xpw\0\0YJݢbxsq\0~\0w\0\0YJݤxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-29 21:55:56'),(1091,'c5bc4afa-7f31-403f-9891-def3c3ca5437','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$c5bc4afa-7f31-403f-9891-def3c3ca5437sr\0java.util.Datehj�KYt\0\0xpw\0\0YJ\�\�xsq\0~\0w\0\0YJ\�m\�xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpxx','2016-12-29 21:57:17'),(1092,'6991f23b-0593-4167-b21a-cf9b0a3ab24d','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$6991f23b-0593-4167-b21a-cf9b0a3ab24dsr\0java.util.Datehj�KYt\0\0xpw\0\0YJ\�\�`xsq\0~\0w\0\0YM�K�xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpxx','2016-12-29 22:00:36'),(1093,'f179a2df-3c5f-4811-ad06-46d9ee4cd563','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$f179a2df-3c5f-4811-ad06-46d9ee4cd563sr\0java.util.Datehj�KYt\0\0xpw\0\0YJ\�q\�xsq\0~\0w\0\0YJ\��xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpxx','2016-12-29 22:02:17'),(1094,'56bc3226-f291-4793-8953-8fa7fabed89c','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$56bc3226-f291-4793-8953-8fa7fabed89csr\0java.util.Datehj�KYt\0\0xpw\0\0YJ\�\�\�xsq\0~\0w\0\0YJ\�\�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-29 22:07:03'),(1095,'7d4020b1-7f15-471d-ba51-220961b8882b','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$7d4020b1-7f15-471d-ba51-220961b8882bsr\0java.util.Datehj�KYt\0\0xpw\0\0YJ\�*xsq\0~\0w\0\0YM�6\�xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpxx','2016-12-29 22:07:59'),(1096,'bcc38f15-5710-4f57-b0b5-7d43e785a959','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$bcc38f15-5710-4f57-b0b5-7d43e785a959sr\0java.util.Datehj�KYt\0\0xpw\0\0YM��xsq\0~\0w\0\0YM��\�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-30 11:07:04'),(1097,'36268bc3-cfcc-44bb-b11d-53d0dfa9977f','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$36268bc3-cfcc-44bb-b11d-53d0dfa9977fsr\0java.util.Datehj�KYt\0\0xpw\0\0YM�P\�xsq\0~\0w\0\0YM�\��xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpxx','2016-12-30 11:08:34'),(1098,'db183655-2ae5-4a1d-a6bf-72024fbf4b07','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$db183655-2ae5-4a1d-a6bf-72024fbf4b07sr\0java.util.Datehj�KYt\0\0xpw\0\0YM�3oxsq\0~\0w\0\0YM�5Gxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-30 11:09:32'),(1099,'7e645e5c-4d79-4832-969d-e4264f0b7dc4','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$7e645e5c-4d79-4832-969d-e4264f0b7dc4sr\0java.util.Datehj�KYt\0\0xpw\0\0YM�;\�xsq\0~\0w\0\0YM���xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpxx','2016-12-30 11:10:40'),(1100,'4fe51a00-6d24-4255-8ab8-5355acd26415','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$4fe51a00-6d24-4255-8ab8-5355acd26415sr\0java.util.Datehj�KYt\0\0xpw\0\0YM�\��xsq\0~\0w\0\0YM�G	xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-30 11:11:19'),(1101,'a74882a9-ca16-41f3-b29f-8acb088cec97','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$a74882a9-ca16-41f3-b29f-8acb088cec97sr\0java.util.Datehj�KYt\0\0xpw\0\0YM��>xsq\0~\0w\0\0YM�?�xsq\0~\0w\0\0YM�\�\�xw\Z\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpt\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsq\0~\0\nt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection�X%ƣJ\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\08482063xx\0wq\0~\0xxx','2016-12-30 11:12:19'),(1102,'4a458500-ba89-4db5-a1fc-10ef57cf1aae','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$4a458500-ba89-4db5-a1fc-10ef57cf1aaesr\0java.util.Datehj�KYt\0\0xpw\0\0YM��+xsq\0~\0w\0\0YM�7�xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpxx','2016-12-30 11:13:25'),(1103,'ec6844ea-4e0e-48ef-bd1d-37bcb4c2e09f','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$ec6844ea-4e0e-48ef-bd1d-37bcb4c2e09fsr\0java.util.Datehj�KYt\0\0xpw\0\0YM�MDxsq\0~\0w\0\0YM�N\�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-30 11:15:07'),(1104,'122f6d24-afa8-41fb-88ee-dc575cb919e5','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$122f6d24-afa8-41fb-88ee-dc575cb919e5sr\0java.util.Datehj�KYt\0\0xpw\0\0YM��7xsq\0~\0w\0\0YM���xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-30 11:16:27'),(1105,'cfe94732-b38e-49f7-9d4b-b8dd32669178','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$cfe94732-b38e-49f7-9d4b-b8dd32669178sr\0java.util.Datehj�KYt\0\0xpw\0\0YM�<xsq\0~\0w\0\0YM�<xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0</happy-help/happy-help/static/errorPage/font-awesome.min.cssxx','2016-12-30 11:17:13'),(1106,'532f13f3-515a-4bb0-b0ea-eaf3ea1f0021','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$532f13f3-515a-4bb0-b0ea-eaf3ea1f0021sr\0java.util.Datehj�KYt\0\0xpw\0\0YM���xsq\0~\0w\0\0YM���xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-30 11:18:37'),(1107,'5cf1b875-aefe-4681-80bf-6d8fc01d30a8','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$5cf1b875-aefe-4681-80bf-6d8fc01d30a8sr\0java.util.Datehj�KYt\0\0xpw\0\0YM�\0\�xsq\0~\0w\0\0YM�Ixw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-30 11:20:15'),(1108,'6c4aa554-3293-4908-b1f7-385d5470cc4a','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$6c4aa554-3293-4908-b1f7-385d5470cc4asr\0java.util.Datehj�KYt\0\0xpw\0\0YM�Q�xsq\0~\0w\0\0YM�?�xsq\0~\0w\0\0YM�Txw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2016-12-30 11:21:41'),(1109,'5db6145d-182c-443f-b064-11ef04af5167','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$5db6145d-182c-443f-b064-11ef04af5167sr\0java.util.Datehj�KYt\0\0xpw\0\0YM�^xsq\0~\0w\0\0YM�\�xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpxx','2016-12-30 11:21:44'),(1110,'03411c8e-df66-4944-865b-a4fecd243851','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$03411c8e-df66-4944-865b-a4fecd243851sr\0java.util.Datehj�KYt\0\0xpw\0\0YM�\n�xsq\0~\0w\0\0YM�?�xsq\0~\0w\0\0YM�dxw\Z\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2016-12-30 11:22:28'),(1111,'47fc6e4a-2c10-4cb4-ab2e-4d12e2e1e166','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$47fc6e4a-2c10-4cb4-ab2e-4d12e2e1e166sr\0java.util.Datehj�KYt\0\0xpw\0\0YM�\�\�xsq\0~\0w\0\0YM���xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpxx','2016-12-30 11:23:22'),(1112,'0489fed6-3ca9-4fd3-bbd3-2210674921ab','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$0489fed6-3ca9-4fd3-bbd3-2210674921absr\0java.util.Datehj�KYt\0\0xpw\0\0YM�xsq\0~\0w\0\0YM�?txsq\0~\0w\0\0YM�y\�xw\Z\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection�X%ƣJ\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\08482063xx\0wq\0~\0xxx','2016-12-30 11:23:37'),(1113,'e9c151f7-ff58-48d4-a0ba-0c1763db53d8','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$e9c151f7-ff58-48d4-a0ba-0c1763db53d8sr\0java.util.Datehj�KYt\0\0xpw\0\0YM��xsq\0~\0w\0\0YM�?�xsq\0~\0w\0\0YM��xw\Z\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-helpxx','2016-12-30 11:24:06'),(1114,'2fc1606c-b340-43a6-9165-3765befbfcf8','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$2fc1606c-b340-43a6-9165-3765befbfcf8sr\0java.util.Datehj�KYt\0\0xpw\0\0YO�P:xsq\0~\0w\0\0YO\�>\nxsq\0~\0w\0\0YO�R�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2016-12-30 19:50:40'),(1115,'97733f7e-a09a-416a-a73c-71795881672d','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0_t\0$97733f7e-a09a-416a-a73c-71795881672dsr\0java.util.Datehj�KYt\0\0xpw\0\0YO�Z�xsq\0~\0w\0\0YO\�MNxq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1x','2016-12-30 19:50:43'),(1116,'b878badf-3d05-4ee9-9856-449b89a38d44','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$b878badf-3d05-4ee9-9856-449b89a38d44sr\0java.util.Datehj�KYt\0\0xpw\0\0YO�\�=xsq\0~\0w\0\0YO�57xq\0~\0w\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0kickoutsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpxx','2016-12-30 19:53:28'),(1117,'f657f9ff-f2f3-40cc-adaa-db12fff20d35','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$f657f9ff-f2f3-40cc-adaa-db12fff20d35sr\0java.util.Datehj�KYt\0\0xpw\0\0YO�5=xsq\0~\0w\0\0YO�^\�xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection�X%ƣJ\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0admin3xx\0wq\0~\0xxx','2016-12-30 19:53:50'),(1118,'fa6d0961-f8e4-4282-aa4f-8dbe88fa5897','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$fa6d0961-f8e4-4282-aa4f-8dbe88fa5897sr\0java.util.Datehj�KYt\0\0xpw\0\0YO\�MYxsq\0~\0w\0\0YP.�Sxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection�X%ƣJ\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx','2016-12-30 20:51:50'),(1119,'d52ba8c7-33fa-4cac-88e0-dd0288f1cca2','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$d52ba8c7-33fa-4cac-88e0-dd0288f1cca2sr\0java.util.Datehj�KYt\0\0xpw\0\0YP�\�xsq\0~\0w\0\0YP��xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-30 22:04:22'),(1120,'f048c831-e518-4752-9459-d451939d5ed0','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$f048c831-e518-4752-9459-d451939d5ed0sr\0java.util.Datehj�KYt\0\0xpw\0\0YP-\�xsq\0~\0w\0\0YP-\�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-30 22:41:42'),(1121,'42e4b7f4-ff8b-4bc2-9bd5-e2fe4e8c65a9','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$42e4b7f4-ff8b-4bc2-9bd5-e2fe4e8c65a9sr\0java.util.Datehj�KYt\0\0xpw\0\0YS\\\�xsq\0~\0w\0\0YS\\\�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-31 13:31:51'),(1122,'43cfb246-0250-4040-9e7b-5521c4e7c47b','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$43cfb246-0250-4040-9e7b-5521c4e7c47bsr\0java.util.Datehj�KYt\0\0xpw\0\0YS\\\�>xsq\0~\0w\0\0YS^Jxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-31 13:31:54'),(1123,'d41cc0ed-5747-4777-87d9-f731fae23502','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$d41cc0ed-5747-4777-87d9-f731fae23502sr\0java.util.Datehj�KYt\0\0xpw\0\0YS��Xxsq\0~\0w\0\0YS���xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-31 14:21:51'),(1124,'c38a43bc-728d-4bf2-a478-1b07adc0bc67','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$c38a43bc-728d-4bf2-a478-1b07adc0bc67sr\0java.util.Datehj�KYt\0\0xpw\0\0YS��xsq\0~\0w\0\0YS�-xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-31 14:21:54'),(1125,'d6ac0c14-6d96-44e1-aff6-e725b3f101b6','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$d6ac0c14-6d96-44e1-aff6-e725b3f101b6sr\0java.util.Datehj�KYt\0\0xpw\0\0YS��Yxsq\0~\0w\0\0YS��nxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2016-12-31 14:29:53'),(1126,'8ef5ec0e-dc23-4392-8a20-9ca6de203fdd','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$8ef5ec0e-dc23-4392-8a20-9ca6de203fddsr\0java.util.Datehj�KYt\0\0xpw\0\0YS�`}xsq\0~\0w\0\0YS\�N�xsq\0~\0w\0\0YS�bxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2016-12-31 14:56:32'),(1127,'4b477a7f-f41a-40cc-b88f-8456b80826b6','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$4b477a7f-f41a-40cc-b88f-8456b80826b6sr\0java.util.Datehj�KYt\0\0xpw\0\0YS�i\�xsq\0~\0w\0\0YS\�N�xsq\0~\0w\0\0YS�jxw\Z\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2016-12-31 14:56:34'),(1128,'4cc8acaf-1231-42b1-8736-24ba149d2065','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$4cc8acaf-1231-42b1-8736-24ba149d2065sr\0java.util.Datehj�KYt\0\0xpw\0\0Y_V�~xsq\0~\0w\0\0Y_V��xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2017-01-02 21:20:30'),(1129,'ba23ccc1-12ae-49ba-890e-f7a31e198511','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$ba23ccc1-12ae-49ba-890e-f7a31e198511sr\0java.util.Datehj�KYt\0\0xpw\0\0Y_V�#xsq\0~\0w\0\0Y__�xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2017-01-02 21:20:34'),(1130,'3111d110-01e0-4740-82a3-4cb09e478439','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$3111d110-01e0-4740-82a3-4cb09e478439sr\0java.util.Datehj�KYt\0\0xpw\0\0Y_h\�\�xsq\0~\0w\0\0Y_h�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2017-01-02 21:40:30'),(1131,'0d9f1b41-c2c1-431f-9fa3-790f536cd694','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$0d9f1b41-c2c1-431f-9fa3-790f536cd694sr\0java.util.Datehj�KYt\0\0xpw\0\0Y_j/�xsq\0~\0w\0\0Y_j1xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2017-01-02 21:41:52'),(1132,'4d0ec8da-2089-42e1-9fa9-db4bb2ef3fcc','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$4d0ec8da-2089-42e1-9fa9-db4bb2ef3fccsr\0java.util.Datehj�KYt\0\0xpw\0\0Y_k�\�xsq\0~\0w\0\0Y_k�.xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2017-01-02 21:43:31'),(1133,'74bcba65-644a-4bc9-a62d-653a8a82f6b0','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$74bcba65-644a-4bc9-a62d-653a8a82f6b0sr\0java.util.Datehj�KYt\0\0xpw\0\0Y_~\�\rxsq\0~\0w\0\0Y_~\�exw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2017-01-02 22:04:28'),(1134,'fb500027-82f7-4374-ab50-770bd0564eb2','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$fb500027-82f7-4374-ab50-770bd0564eb2sr\0java.util.Datehj�KYt\0\0xpw\0\0Yct0�xsq\0~\0w\0\0Yct2xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2017-01-03 16:31:16'),(1135,'840d82e8-4b99-409a-97ae-cccb28bb6b9a','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$840d82e8-4b99-409a-97ae-cccb28bb6b9asr\0java.util.Datehj�KYt\0\0xpw\0\0Yct7\�xsq\0~\0w\0\0Yc�\�Gxsq\0~\0w\0\0Yc�\�xw\Z\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection�X%ƣJ\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx','2017-01-03 16:31:18'),(1136,'c36cc291-cf8e-4f18-bda8-eb784fda909f','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$c36cc291-cf8e-4f18-bda8-eb784fda909fsr\0java.util.Datehj�KYt\0\0xpw\0\0Yc��5xsq\0~\0w\0\0Yc�\�8xsq\0~\0w\0\0Yc��exw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2017-01-03 16:53:58'),(1137,'1e8a1df7-70ae-406f-ac02-79fcfcafa010','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$1e8a1df7-70ae-406f-ac02-79fcfcafa010sr\0java.util.Datehj�KYt\0\0xpw\0\0Ym%\�~xsq\0~\0w\0\0Ym%\�%xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2017-01-05 13:41:51'),(1138,'0e6a68b9-f092-46d6-940b-f93ac6726d38','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$0e6a68b9-f092-46d6-940b-f93ac6726d38sr\0java.util.Datehj�KYt\0\0xpw\0\0Ym%\�0xsq\0~\0w\0\0Ym%\�bxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2017-01-05 13:41:53'),(1139,'6a8eca50-dc8a-4e9b-b0c5-abb153bfe6c6','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$6a8eca50-dc8a-4e9b-b0c5-abb153bfe6c6sr\0java.util.Datehj�KYt\0\0xpw\0\0Ywŭ�xsq\0~\0w\0\0YwŲxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2017-01-07 15:12:41'),(1140,'c14c3ca5-066a-480c-8eea-d0b3f13f80e3','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$c14c3ca5-066a-480c-8eea-d0b3f13f80e3sr\0java.util.Datehj�KYt\0\0xpw\0\0YwŻ\�xsq\0~\0w\0\0Yw\�\�xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection�X%ƣJ\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx','2017-01-07 15:12:45'),(1141,'5cf3fe8d-06b9-4937-8c54-73817db9a8ed','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$5cf3fe8d-06b9-4937-8c54-73817db9a8edsr\0java.util.Datehj�KYt\0\0xpw\0\0Y��\�Vxsq\0~\0w\0\0Y��\�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2017-01-10 12:04:55'),(1142,'2e1ec8b8-643b-46a0-8ed9-3072abd57fcf','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$2e1ec8b8-643b-46a0-8ed9-3072abd57fcfsr\0java.util.Datehj�KYt\0\0xpw\0\0Y��\�xsq\0~\0w\0\0Y��\�\�xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2017-01-10 12:04:57'),(1143,'0dd956fd-35ef-431e-91bc-e1d698aaf4de','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$0dd956fd-35ef-431e-91bc-e1d698aaf4desr\0java.util.Datehj�KYt\0\0xpw\0\0Y�J\�xsq\0~\0w\0\0Y�Lxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2017-01-11 09:13:31'),(1144,'01eac9ac-8cf6-4506-8483-c4aaae0e7d7a','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$01eac9ac-8cf6-4506-8483-c4aaae0e7d7asr\0java.util.Datehj�KYt\0\0xpw\0\0Y�R\�xsq\0~\0w\0\0Y�\��xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2017-01-11 09:13:33'),(1145,'d1e3b576-d7c0-4ddc-afc0-077083e4b601','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$d1e3b576-d7c0-4ddc-afc0-077083e4b601sr\0java.util.Datehj�KYt\0\0xpw\0\0Y�\�\�xsq\0~\0w\0\0Y�\�mxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2017-01-11 09:15:11'),(1146,'088e0d84-7081-4033-aa04-c6fb157bf420','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$088e0d84-7081-4033-aa04-c6fb157bf420sr\0java.util.Datehj�KYt\0\0xpw\0\0Y�/5�xsq\0~\0w\0\0Y�/7xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2017-01-11 09:40:44'),(1147,'cd80e79e-e3a6-44ab-8124-84edaf05b70c','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$cd80e79e-e3a6-44ab-8124-84edaf05b70csr\0java.util.Datehj�KYt\0\0xpw\0\0Y�/<xsq\0~\0w\0\0Y�/<?xw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2017-01-11 09:40:46'),(1148,'7003680a-48ce-4b04-b476-d2544f4f084b','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$7003680a-48ce-4b04-b476-d2544f4f084bsr\0java.util.Datehj�KYt\0\0xpw\0\0Y�3�\�xsq\0~\0w\0\0Y�j\�\�xsq\0~\0w\0\0Y�3��xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2017-01-11 09:45:57'),(1149,'afab3e37-095f-4822-805f-758f5647c46f','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$afab3e37-095f-4822-805f-758f5647c46fsr\0java.util.Datehj�KYt\0\0xpw\0\0Y�4�xsq\0~\0w\0\0Y�j\�\�xsq\0~\0w\0\0Y�4xw\Z\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2017-01-11 09:45:59'),(1150,'fd5899ac-2fed-485d-8b0f-e0ad7991b8be','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$fd5899ac-2fed-485d-8b0f-e0ad7991b8besr\0java.util.Datehj�KYt\0\0xpw\0\0Y���\rxsq\0~\0w\0\0Y�\�x�xsq\0~\0w\0\0Y���\�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2017-01-11 12:07:28'),(1151,'077c2faa-9d18-41a7-9631-2d4438b9897d','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$077c2faa-9d18-41a7-9631-2d4438b9897dsr\0java.util.Datehj�KYt\0\0xpw\0\0Y���\�xsq\0~\0w\0\0Y�\�x	xsq\0~\0w\0\0Y����xw\Z\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2017-01-11 12:07:30'),(1152,'4d336de9-11fc-4120-9db1-7abb36bb9112','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$4d336de9-11fc-4120-9db1-7abb36bb9112sr\0java.util.Datehj�KYt\0\0xpw\0\0Y�1�xsq\0~\0w\0\0Y�2�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2017-01-11 13:56:18'),(1153,'039f673a-0c3f-42c4-840a-0322c8bea987','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$039f673a-0c3f-42c4-840a-0322c8bea987sr\0java.util.Datehj�KYt\0\0xpw\0\0Y�8�xsq\0~\0w\0\0Y�w�xsq\0~\0w\0\0Y�D0xw\Z\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection�X%ƣJ\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx','2017-01-11 13:56:20'),(1154,'95ed5ea5-5d39-4f2f-9c9a-e7e20e292fa6','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$95ed5ea5-5d39-4f2f-9c9a-e7e20e292fa6sr\0java.util.Datehj�KYt\0\0xpw\0\0Y�<3~xsq\0~\0w\0\0Y�<5\�xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2017-01-11 14:34:33'),(1155,'deb99783-815a-4247-838c-39f510e95cec','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0�t\0$deb99783-815a-4247-838c-39f510e95cecsr\0java.util.Datehj�KYt\0\0xpw\0\0Y�@)Vxsq\0~\0w\0\0Y�wxxsq\0~\0w\0\0Y�@+xw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0L\0\nrequestURIq\0~\0xpt\0GETpt\0/happy-help/xx','2017-01-11 14:38:52'),(1156,'0992a1ef-828a-4b7b-9150-7ccbf6a8afc4','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$0992a1ef-828a-4b7b-9150-7ccbf6a8afc4sr\0java.util.Datehj�KYt\0\0xpw\0\0Zjxsq\0~\0w\0\0ZjHxw\0\0\0\0\0w@\0	127.0.0.1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0shiroSavedRequestsr\0&org.apache.shiro.web.util.SavedRequest�\�<�y�ʺ\0L\0methodt\0Ljava/lang/String;L\0queryStringq\0~\0\nL\0\nrequestURIq\0~\0\nxpt\0GETpt\0/happy-help/xx','2017-02-23 16:20:56'),(1157,'2f79d326-fdc8-4965-96e9-ba6ba9b2a140','�\�\0sr\0*org.apache.shiro.session.mgt.SimpleSession���Ռbn\0\0xpw\0\�t\0$2f79d326-fdc8-4965-96e9-ba6ba9b2a140sr\0java.util.Datehj�KYt\0\0xpw\0\0Zj9xsq\0~\0w\0\0ZjFxw\0\0\0\0\0w@\00:0:0:0:0:0:0:1sr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0Porg.apache.shiro.subject.support.DefaultSubjectContext_AUTHENTICATED_SESSION_KEYsr\0java.lang.Boolean\� r�՜�\�\0Z\0valuexpt\0Morg.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEYsr\02org.apache.shiro.subject.SimplePrincipalCollection�X%ƣJ\0L\0realmPrincipalst\0Ljava/util/Map;xpsr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\Zcom.zyfz.realm.UserRealm_0sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0adminxx\0wq\0~\0xxx','2017-02-23 16:20:58');
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
  `type_value` varchar(450) DEFAULT NULL,
  `type_description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_setting`
--

LOCK TABLES `hh_setting` WRITE;
/*!40000 ALTER TABLE `hh_setting` DISABLE KEYS */;
INSERT INTO `hh_setting` VALUES (3,'推送范围','全国','80','(单位:元)紧急求助推送范围'),(5,'推送范围','省','45','(单位:元)紧急求助推送范围'),(6,'推送范围','市','20','(单位:元)紧急求助推送范围'),(7,'推送范围','区','10','(单位:元)紧急求助推送范围'),(9,'公共服务','评星分数','1','(单位:次数)每颗星对应的分数'),(10,'普通求助','手续费','10','(单位:百分比)普通求助交易成功后,平台收取手续费比例'),(11,'紧急求助','失效时间','8','(单位:小时)紧急求助发布后8小时无人接单失效'),(12,'奖池','奖池规则','规则规则规则,','奖池规则'),(13,'置顶费用','7天','29','(单位:元)'),(14,'置顶费用','15天','39','(单位:元)'),(15,'置顶费用','30天','49','(单位:元)'),(16,'荣誉榜分数','无偿帮助','1','(单位:分)无偿帮助1分'),(17,'荣誉榜分数','有偿帮助','0.5','(单位:分)有偿帮助0.5分'),(18,'荣誉榜分数','紧急求助','2','(单位:分)紧急求助2分'),(19,'紧急求助','扣款比例','20','(单位:百分比)紧急求助失败,扣取金额百分比'),(20,'紧急求助','评星分数','2','(单位:分)每颗星增加荣誉值两分'),(21,'普通求助','评星分数','2','(单位:分)每颗星增加荣誉值两分');
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_show`
--

LOCK TABLES `hh_show` WRITE;
/*!40000 ALTER TABLE `hh_show` DISABLE KEYS */;
INSERT INTO `hh_show` VALUES (1,'闪屏页','/pic/Images/show/0b11c351-c83e-47fc-a3b9-2dac67661bf8.jpg','2016-10-10 14:37:52','闪屏页',12,1,'nono','test'),(2,'闪屏页','/pic/Images/show/5df674eb-1140-49fa-8e2c-0a5252901028.jpg','2016-10-10 14:37:52','loadingPic',21,1,NULL,NULL),(3,'轮播图1','/pic/Images/show/6dc68c14-21b0-4b9b-ae47-4f50730ec115.jpg','2016-11-15 15:31:06','轮播图',1,0,'nono','test');
/*!40000 ALTER TABLE `hh_show` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_system_message`
--

DROP TABLE IF EXISTS `hh_system_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_system_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `hhUserId` int(11) DEFAULT NULL,
  `createTime` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `content` varchar(450) DEFAULT NULL,
  `pageMessage` varchar(45) DEFAULT NULL,
  `is_read` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_system_message`
--

LOCK TABLES `hh_system_message` WRITE;
/*!40000 ALTER TABLE `hh_system_message` DISABLE KEYS */;
INSERT INTO `hh_system_message` VALUES (10,'taskInfo',42,'2016-11-28 17:48:54.715','求助消息状态更新','您发布的求助消息有人接受了,快去看看吧!','30',0),(11,'taskInfo',42,'2016-11-28 17:50:16.561','求助消息状态更新','您发布的求助消息有人接受了,快去看看吧!','30',0),(12,'taskInfo',42,'2016-11-28 17:55:25.866','求助消息状态更新','您发布的求助消息要求提价,快去看看吧!','30',1),(13,'taskInfo',42,'2016-11-28 17:57:09.302','求助消息状态更新','您发布的求助消息进行中,快去看看吧!','30',1),(14,'taskInfo',42,'2016-11-28 17:58:24.189','求助消息状态更新','您发布的求助消息进行中,快去看看吧!','30',1),(15,'taskInfo',42,'2016-11-30 16:03:07.98','求助消息状态更新','您发布的求助消息有人接受了,快去看看吧!','29,43',1),(16,'taskInfo',42,'2016-11-30 16:03:22.959','求助消息状态更新','您发布的求助消息进行中,快去看看吧!','29,43',1),(17,'taskinfo',43,'2016-12-03 17:17:52.527','帮助的求助消息状态更新','您想帮助的求助消息,请您去帮忙,快去看看吧!','29',0),(18,'taskinfo',43,'2016-12-03 17:23:59.913','帮助的求助消息状态更新','您想帮助的求助消息,请您去帮忙,快去看看吧!','29',0),(19,'taskinfo',43,'2016-12-03 17:25:52.37','帮助的求助消息状态更新','您想帮助的求助消息,请您去帮忙,快去看看吧!','29',0),(20,'taskinfo',43,'2016-12-03 17:30:09.864','帮助的求助消息状态更新','您想帮助的求助消息已完成,快去看看吧!','29',0),(21,'taskinfo',43,'2016-12-03 17:32:38.9','帮助的求助消息状态更新','您想帮助的求助消息已完成,快去看看吧!','29',0),(22,'taskinfo',43,'2016-12-03 17:37:34.348','帮助的求助消息状态更新','您想帮助的求助消息已完成,快去看看吧!','29',0),(23,'taskinfo',43,'2016-12-03 17:40:17.27','帮助的求助消息状态更新','您想帮助的求助消息已完成,快去看看吧!','29',0),(24,'taskinfo',43,'2016-12-03 17:42:29.104','帮助的求助消息状态更新','您想帮助的求助消息已完成,快去看看吧!','29',0),(25,'taskinfo',43,'2016-12-03 17:45:10.052','帮助的求助消息状态更新','您想帮助的求助消息,要求降价,快去看看吧!','29',0),(26,'taskinfo',43,'2016-12-03 17:45:47.999','帮助的求助消息状态更新','您想帮助的求助消息,要求降价,快去看看吧!','29',0),(27,'taskinfo',43,'2016-12-03 17:46:49.24','帮助的求助消息状态更新','您想帮助的求助消息,要求降价,快去看看吧!','29',0),(28,'taskinfo',43,'2016-12-03 17:48:34.957','帮助的求助消息状态更新','您想帮助的求助消息,有人抢先一步完成了,快去看看吧!','29',0),(29,'serverinfo',43,'2016-12-08 11:13:00.592','发布的服务状态更新','您发布的服务顺利完成了,快去看看吧!','6,42',0),(30,'serverinfo',43,'2016-12-08 11:14:49.375','发布的服务状态更新','您发布的服务顺利完成了,快去看看吧!','6,42',1),(31,'serverinfo',43,'2016-12-08 11:17:35.709','发布的服务状态更新','您发布的服务顺利完成了,快去看看吧!','6,42',0),(32,'serverinfo',43,'2016-12-08 11:48:38.697','发布的服务状态更新','您发布的服务顺利完成了,快去看看吧!','6,42',0),(33,'taskInfo',42,'2016-12-09 19:26:43.369','求助消息状态更新','您发布的求助消息完成了了,快去看看吧!','29,43',0),(34,'taskinfo',43,'2016-12-10 22:16:51.351','帮助的求助消息状态更新','您想帮助的求助消息,有人抢先一步完成了,快去看看吧!','1',0),(35,'taskinfo',47,'2016-12-10 22:16:51.38','帮助的求助消息状态更新','您想帮助的求助消息,请您去帮忙,快去看看吧!','1',0),(36,'taskinfo',43,'2016-12-10 22:23:38.698','帮助的求助消息状态更新','您想帮助的求助消息,有人抢先一步完成了,快去看看吧!','1',0),(37,'taskinfo',47,'2016-12-10 22:23:38.706','帮助的求助消息状态更新','您想帮助的求助消息,请您去帮忙,快去看看吧!','1',0),(38,'taskinfo',43,'2016-12-10 22:31:52.357','帮助的求助消息状态更新','您想帮助的求助消息,有人抢先一步完成了,快去看看吧!','1',0),(39,'taskinfo',47,'2016-12-10 22:31:52.369','帮助的求助消息状态更新','您想帮助的求助消息,请您去帮忙,快去看看吧!','1',0),(40,'taskinfo',43,'2016-12-10 22:32:48.36','帮助的求助消息状态更新','您想帮助的求助消息,有人抢先一步完成了,快去看看吧!','1',0),(41,'taskinfo',47,'2016-12-10 22:32:48.372','帮助的求助消息状态更新','您想帮助的求助消息,请您去帮忙,快去看看吧!','1',0),(42,'taskinfo',43,'2016-12-10 22:37:13.171','帮助的求助消息状态更新','您想帮助的求助消息,有人抢先一步完成了,快去看看吧!','1',0),(43,'taskinfo',47,'2016-12-10 22:37:13.215','帮助的求助消息状态更新','您想帮助的求助消息,请您去帮忙,快去看看吧!','1',0),(44,'taskinfo',43,'2016-12-10 22:41:46.718','帮助的求助消息状态更新','您想帮助的求助消息,有人抢先一步完成了,快去看看吧!','1',0),(45,'taskinfo',47,'2016-12-10 22:41:46.736','帮助的求助消息状态更新','您想帮助的求助消息,请您去帮忙,快去看看吧!','1',0),(46,'userAccount',20,'2016-12-30 22:42:48.791','恭喜您中奖了','恭喜您,中奖了!2000.0元已经转到您的帐号了.',NULL,0),(47,'userAccount',20,'2016-12-30 22:42:53.101','恭喜您中奖了','恭喜您,中奖了!2000.0元已经转到您的帐号了.',NULL,0),(48,'userAccount',42,'2016-12-30 22:42:53.117','恭喜您中奖了','恭喜您,中奖了!2000.0元已经转到您的帐号了.',NULL,0),(49,'userAccount',43,'2017-01-11 09:17:32.885','交易提醒','您的帐户金额变动,账户增加200.0元(普通求助服务费)','29',0),(50,'taskinfo',43,'2017-01-11 09:17:41.415','帮助的求助消息状态更新','您想帮助的求助消息已完成,快去看看吧!','29',0),(51,'userAccount',43,'2017-01-11 09:20:04.087','交易提醒','您的帐户金额变动,账户增加200.0元(普通求助服务费)','29',0),(52,'taskinfo',43,'2017-01-11 09:20:04.091','帮助的求助消息状态更新','您想帮助的求助消息已完成,快去看看吧!','29',0),(53,'userAccount',43,'2017-01-11 09:27:01.884','交易提醒','您的帐户金额变动,账户增加200.0元(普通求助服务费)','29',0),(54,'taskinfo',43,'2017-01-11 09:27:01.891','帮助的求助消息状态更新','您想帮助的求助消息已完成,快去看看吧!','29',0),(55,'userAccount',43,'2017-01-11 09:40:01.27','交易提醒','您的帐户金额变动,账户增加200.0元(普通求助服务费)','29',0),(56,'taskinfo',43,'2017-01-11 09:40:01.275','帮助的求助消息状态更新','您想帮助的求助消息已完成,快去看看吧!','29',0),(57,'userAccount',43,'2017-01-11 09:42:23.095','交易提醒','您的帐户金额变动,账户增加200.0元(普通求助服务费)','29',0),(58,'taskinfo',43,'2017-01-11 09:42:23.102','帮助的求助消息状态更新','您想帮助的求助消息已完成,快去看看吧!','29',0),(59,'userAccount',43,'2017-01-11 09:46:19.193','交易提醒','您的帐户金额变动,账户增加200.0元(普通求助服务费)','29',0),(60,'taskinfo',43,'2017-01-11 09:46:19.2','帮助的求助消息状态更新','您想帮助的求助消息已完成,快去看看吧!','29',0);
/*!40000 ALTER TABLE `hh_system_message` ENABLE KEYS */;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_hh_talk_message_hh_task_info1_idx` (`hh_task_info_id`),
  CONSTRAINT `fk_hh_talk_message_hh_task_info1` FOREIGN KEY (`hh_task_info_id`) REFERENCES `hh_task_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
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
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_hh_task_comment2_hh_task_comment1_idx` (`hh_task_comment_id`),
  CONSTRAINT `fk_hh_task_comment2_hh_task_comment1` FOREIGN KEY (`hh_task_comment_id`) REFERENCES `hh_task_comment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
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
  `money` double DEFAULT '0',
  `content` varchar(450) DEFAULT NULL,
  `hh_task_info_id` int(11) NOT NULL,
  `talk_times` int(11) DEFAULT NULL,
  `hh_user_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_hh_task_contract_hh_task_info1_idx` (`hh_task_info_id`),
  KEY `fk_hh_task_contract_hh_user1_idx` (`hh_user_id`),
  CONSTRAINT `fk_hh_task_contract_hh_task_info1` FOREIGN KEY (`hh_task_info_id`) REFERENCES `hh_task_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hh_task_contract_hh_user1` FOREIGN KEY (`hh_user_id`) REFERENCES `hh_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_task_contract`
--

LOCK TABLES `hh_task_contract` WRITE;
/*!40000 ALTER TABLE `hh_task_contract` DISABLE KEYS */;
INSERT INTO `hh_task_contract` VALUES (11,0,100,'测试',1,1,47,'2016-11-28 17:48:51'),(12,13,1000,'测试',1,2,43,'2016-11-28 17:50:16'),(13,12,200,'test',29,4,43,'2016-11-30 16:03:08');
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
  `image_url` varchar(500) DEFAULT 'none',
  `money` double DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT '1999-01-01 01:01:01',
  `end_time` datetime DEFAULT '1999-01-01 01:01:01',
  `is_free` tinyint(1) DEFAULT '1',
  `is_accept` tinyint(1) DEFAULT '0',
  `is_top` tinyint(1) DEFAULT '0',
  `is_compeleted` tinyint(1) DEFAULT '0',
  `is_deleted` tinyint(1) DEFAULT '0',
  `hh_category_id` int(11) NOT NULL,
  `hh_user_id` int(11) NOT NULL,
  `country` varchar(45) DEFAULT '中国',
  `province` varchar(45) DEFAULT 'P',
  `city` varchar(45) DEFAULT 'C',
  `area` varchar(45) DEFAULT 'A',
  `street` varchar(45) DEFAULT 'S',
  `detail_position` varchar(45) DEFAULT 'D',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_hh_message_hh_category1_idx` (`hh_category_id`),
  KEY `fk_hh_message_hh_user1_idx` (`hh_user_id`),
  CONSTRAINT `fk_hh_message_hh_category1` FOREIGN KEY (`hh_category_id`) REFERENCES `hh_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hh_message_hh_user1` FOREIGN KEY (`hh_user_id`) REFERENCES `hh_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_task_info`
--

LOCK TABLES `hh_task_info` WRITE;
/*!40000 ALTER TABLE `hh_task_info` DISABLE KEYS */;
INSERT INTO `hh_task_info` VALUES (1,'title','ssssssssssssssssssss','/pic/Images/taskinfo/9fc46c6f-f59a-424d-b0cf-cf2463f65b35.jpg',10000.23,'12345678909','1999-01-01 01:01:01','2016-12-29 17:11:44',1,1,1,1,0,7,20,'中国','福建','龙岩','新罗区','东肖北路','东肖北路1号'),(3,'title','bbbbbbbbbbbbbbbbbb','/pic/Images/taskinfo/9fc46c6f-f59a-424d-b0cf-cf2463f65b35.jpg',10000.23,'12345678909','1999-01-01 01:01:01','1999-01-01 01:01:01',0,0,1,0,0,7,20,'中国','福建','龙岩','新罗区','东肖北路','东肖北路1号'),(4,'title','ccccccccccccccccccc','/pic/Images/taskinfo/9fc46c6f-f59a-424d-b0cf-cf2463f65b35.jpg',10000.23,'12345678909','1999-01-01 01:01:01','1999-01-01 01:01:01',0,1,1,1,0,7,20,'中国','福建','龙岩','新罗区','东肖北路','东肖北路1号'),(5,'title','中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test  长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字','/pic/Images/taskinfo/9fc46c6f-f59a-424d-b0cf-cf2463f65b35.jpg',10000.23,'12345678909','1999-01-01 01:01:01','1999-01-01 01:01:01',1,0,1,0,0,7,20,'中国','福建','龙岩','新罗区','东肖北路','东肖北路1号'),(6,'title','中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test  长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字','/pic/Images/taskinfo/9fc46c6f-f59a-424d-b0cf-cf2463f65b35.jpg',10000.23,'12345678909','1999-01-01 01:01:01','1999-01-01 01:01:01',0,0,0,0,0,7,20,'中国','福建','龙岩','新罗区','东肖北路','东肖北路1号'),(9,'title','中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test  长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字','/pic/Images/taskinfo/9fc46c6f-f59a-424d-b0cf-cf2463f65b35.jpg',10000.23,'12345678909','1999-01-01 01:01:01','1999-01-01 01:01:01',1,0,1,1,0,7,20,'中国','福建','龙岩','新罗区','东肖北路','东肖北路1号'),(11,'title','中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test  长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字','/pic/Images/taskinfo/9fc46c6f-f59a-424d-b0cf-cf2463f65b35.jpg',10000.23,'12345678909','1999-01-01 01:01:01','1999-01-01 01:01:01',1,0,1,1,1,7,20,'中国','福建','龙岩','新罗区','东肖北路','东肖北路1号'),(12,'title','中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test  长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字','/pic/Images/taskinfo/9fc46c6f-f59a-424d-b0cf-cf2463f65b35.jpg',10000.23,'12345678909','1999-01-01 01:01:01','1999-01-01 01:01:01',1,0,1,1,0,7,20,'中国','福建','龙岩','新罗区','东肖北路','东肖北路1号'),(13,'title','中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test  长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字','/pic/Images/taskinfo/9fc46c6f-f59a-424d-b0cf-cf2463f65b35.jpg',10000.23,'12345678909','1999-01-01 01:01:01','1999-01-01 01:01:01',1,0,1,1,0,7,20,'中国','福建','龙岩','新罗区','东肖北路','东肖北路1号'),(14,'title','中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test  长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字','/pic/Images/taskinfo/9fc46c6f-f59a-424d-b0cf-cf2463f65b35.jpg',10000.23,'12345678909','1999-01-01 01:01:01','1999-01-01 01:01:01',1,0,1,1,0,7,20,'中国','福建','龙岩','新罗区','东肖北路','东肖北路1号'),(15,'title','中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test  长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字','/pic/Images/taskinfo/9fc46c6f-f59a-424d-b0cf-cf2463f65b35.jpg',10000.23,'12345678909','1999-01-01 01:01:01','1999-01-01 01:01:01',1,0,1,1,0,7,20,'中国','福建','龙岩','新罗区','东肖北路','东肖北路1号'),(16,'title','中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test  长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字','/pic/Images/taskinfo/9fc46c6f-f59a-424d-b0cf-cf2463f65b35.jpg',10000.23,'12345678909','1999-01-01 01:01:01','1999-01-01 01:01:01',1,0,1,1,0,7,20,'中国','福建','龙岩','新罗区','东肖北路','东肖北路1号'),(17,'title','中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test  长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字','/pic/Images/taskinfo/9fc46c6f-f59a-424d-b0cf-cf2463f65b35.jpg',10000.23,'12345678909','1999-01-01 01:01:01','1999-01-01 01:01:01',1,0,1,1,0,7,20,'中国','福建','龙岩','新罗区','东肖北路','东肖北路1号'),(20,'title','中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test  长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字','/pic/Images/taskinfo/9fc46c6f-f59a-424d-b0cf-cf2463f65b35.jpg',10000.23,'12345678909','1999-01-01 01:01:01','1999-01-01 01:01:01',1,0,1,1,0,7,20,'中国','福建','龙岩','新罗区','东肖北路','东肖北路1号'),(21,'title','中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test  长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字','/pic/Images/taskinfo/9fc46c6f-f59a-424d-b0cf-cf2463f65b35.jpg',10000.23,'12345678909','1999-01-01 01:01:01','1999-01-01 01:01:01',1,0,1,1,0,7,20,'中国','福建','龙岩','新罗区','东肖北路','东肖北路1号'),(22,'title','中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test  长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字','/pic/Images/taskinfo/9fc46c6f-f59a-424d-b0cf-cf2463f65b35.jpg',10000.23,'12345678909','1999-01-01 01:01:01','1999-01-01 01:01:01',1,0,1,1,0,7,20,'中国','福建','龙岩','新罗区','东肖北路','东肖北路1号'),(23,'title','中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test  长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字','/pic/Images/taskinfo/9fc46c6f-f59a-424d-b0cf-cf2463f65b35.jpg',10000.23,'12345678909','1999-01-01 01:01:01','1999-01-01 01:01:01',1,0,1,1,0,7,20,'中国','福建','龙岩','新罗区','东肖北路','东肖北路1号'),(24,NULL,'中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test  长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字','/pic/Images/taskinfo/59c77d4e-1549-4da2-933b-652d78c21a05.jpg',1000,'11111111111','2016-11-17 16:51:19',NULL,1,0,0,0,0,11,42,'中国','福建','龙岩','新罗区','东肖北路','东肖北路1号'),(25,NULL,'中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test  长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字','/pic/Images/taskinfo/9fc46c6f-f59a-424d-b0cf-cf2463f65b35.jpg',1000,'11111111111','2016-11-17 16:56:33','2016-11-17 16:56:33',1,0,0,0,0,11,42,'中国','福建','龙岩','新罗区','东肖北路','东肖北路1号'),(26,NULL,'中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test  长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字','/pic/Images/taskinfo/5196dfa0-e099-4b13-bd1c-951be1010e77.jpg',1000,'11111111111','2016-11-17 17:00:37','2016-11-17 17:00:37',1,0,0,0,0,11,42,'中国','福建','ccc','aaa','sss','D'),(27,NULL,'中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test  长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字','/pic/Images/taskinfo/9fc46c6f-f59a-424d-b0cf-cf2463f65b35.jpg',1000,'11111111111','2016-11-18 14:39:29','2016-11-18 14:39:29',1,0,0,0,0,11,42,'中国','福建','ccc','aaa','sss','D'),(28,NULL,'中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test  长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字中文test长文字','/pic/Images/taskinfo/9fc46c6f-f59a-424d-b0cf-cf2463f65b35.jpg',1000,'11111111111','2016-11-18 17:54:57','2016-11-18 17:54:57',1,0,0,0,0,11,42,'中国','福建','ccc','aaa','sss','D'),(29,NULL,'测试2test','/pic/Images/taskinfo/9fc46c6f-f59a-424d-b0cf-cf2463f65b35.jpg',1000,'11111111111','2016-11-18 17:56:20','2016-11-18 17:56:20',1,1,0,1,1,11,42,'中国','福建','ccc','aaa','sss','D'),(30,NULL,'测试','/pic/Images/taskinfo/9fc46c6f-f59a-424d-b0cf-cf2463f65b35.jpg',1000,'11111111111','2016-11-18 17:56:51','2016-11-18 17:56:51',1,1,0,0,0,11,42,'中国','福建','ccc','aaa','sss','D');
/*!40000 ALTER TABLE `hh_task_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_task_trade_record`
--

DROP TABLE IF EXISTS `hh_task_trade_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_task_trade_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hhUserId` int(11) DEFAULT NULL,
  `trade_type` varchar(45) DEFAULT NULL,
  `content` varchar(45) DEFAULT NULL,
  `money` double DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `hh_task_info_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_task_trade_record`
--

LOCK TABLES `hh_task_trade_record` WRITE;
/*!40000 ALTER TABLE `hh_task_trade_record` DISABLE KEYS */;
INSERT INTO `hh_task_trade_record` VALUES (7,47,'愿意进行帮助','测试',100,'2016-11-28 17:48:56',30),(8,43,'愿意进行帮助','测试',100,'2016-11-28 17:50:17',30),(9,43,'愿意进行帮助,但要求涨价','测试',1000,'2016-11-28 17:55:31',30),(10,43,'接受降价,愿意进行帮助,帮助中','测试',1000,'2016-11-28 17:57:11',30),(11,43,'接受降价,愿意进行帮助,帮助中','测试',1000,'2016-11-28 17:58:26',30),(12,43,'愿意进行帮助','测试',800,'2016-11-30 16:03:08',29),(13,43,'接受降价,愿意进行帮助,帮助中','测试',800,'2016-11-30 16:03:23',29),(14,43,'完成帮助',NULL,200,'2016-12-09 19:26:51',29),(15,20,'确认完成','测试',100,'2016-12-10 22:42:18',1),(16,42,'确认完成','test',200,'2017-01-11 09:46:19',29);
/*!40000 ALTER TABLE `hh_task_trade_record` ENABLE KEYS */;
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
  `nickname` varchar(45) DEFAULT '昵称',
  `real_name` varchar(45) DEFAULT '名字',
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
  `description` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_user`
--

LOCK TABLES `hh_user` WRITE;
/*!40000 ALTER TABLE `hh_user` DISABLE KEYS */;
INSERT INTO `hh_user` VALUES (1,'admin','12345678901','d3c59d25033dbf980d29554025c23a75','8d78869f470951332959580424d4bf4f',0,'1,2,3',NULL,'nick1','张三','350000199909091345','东肖北路1号',1,1,NULL,1000,22,22,'18.0',4,'18159801222','支付宝',NULL,NULL,NULL,'中国','福建','龙岩','新罗区','东肖镇','11111@qq.com','/happy-help/productImages/moren.jpg','2f79d326-fdc8-4965-96e9-ba6ba9b2a140','测试账号'),(6,'admin2','12345678902','1a1b54e1e8a1413acb541b9d3f400690','c6e98be2437e0c8d199321abad3562eb',0,'2',NULL,'nick1','真实名字','350000199909091345','东肖北路1号',1,1,NULL,1000,21,21,'12.0',4,'18159801222','支付宝',NULL,NULL,NULL,'中国','福建','龙岩','新罗区','东肖镇','11111@qq.com','/happy-help/productImages/moren.jpg','3125a057-0cad-4739-b54b-f90e1e481990','测试账号'),(7,'admin3','12345678903','2a053192d01761925e25991f112ae286','e5d6902cc9421a3ec65345abc95f301b',0,'3,4',NULL,'nick1','真实名字','350000199909091345','东肖北路1号',1,1,NULL,1000,20,20,'10.0',2,'18159801222','支付宝',NULL,NULL,NULL,'中国','福建','龙岩','新罗区','东肖镇','11111@qq.com','/happy-help/productImages/moren.jpg','f657f9ff-f2f3-40cc-adaa-db12fff20d35','测试账号'),(8,'admin4','12345678904','d698aa30530af381a82ce34332996ee5','12ae991ac129fb7683f86f2158b25763',0,'1',NULL,'nick1','真实名字','350000199909091345','东肖北路1号',1,1,NULL,1000,19,19,'12',3,'18159801222','支付宝',NULL,NULL,NULL,'中国','福建','龙岩','新罗区','东肖镇','11111@qq.com','/happy-help/productImages/moren.jpg',NULL,'测试账号'),(9,'admin5','12345678905','ac64868c8d9ce37fae3ff057ef89e4c0','9cbcc0b6592b9a0a247925eade93dc49',0,'1',NULL,'nick1','真实名字','350000199909091345','东肖北路1号',1,1,NULL,1000,18,18,'12',4,'18159801222','支付宝',NULL,NULL,NULL,'中国','福建','龙岩','新罗区','东肖镇','11111@qq.com','/happy-help/productImages/moren.jpg',NULL,'测试账号'),(10,'admin6','12345678906','b1bba3b073c062ca3af5ba8c4bc9b8c2','f5e718ee6a98b87c79dce45e64a5ca61',0,'1',NULL,'nick1','真实名字','350000199909091345','东肖北路1号',1,1,NULL,1000,17,17,'12',6,'18159801222','支付宝',NULL,NULL,NULL,'中国','福建','龙岩','新罗区','东肖镇','11111@qq.com','/happy-help/productImages/moren.jpg',NULL,'测试账号'),(20,'8482064','18159801260','e5ce8cc8181c877e5d44a88be8a7c845','18fffee607f3f8b16bfd6c6ec328d669',0,'2',NULL,'nick1','真实名字','350000199909091345','东肖北路1号',0,1,NULL,3054,11,11,'20.0',4,'18159801222','支付宝',NULL,NULL,NULL,'中国','福建','龙岩','新罗区','东肖镇','11111@qq.com','/happy-help/productImages/moren.jpg',NULL,'测试账号'),(42,'8482063','18159801259','8dd89c1c8c6e31c67469f19607e5e3ba','6c9bd72402e8ac7289c883bb0daedfe1',0,'2',NULL,'nick1','真实名字','350000199909091234','东肖北路1号',0,0,NULL,2112,10,10,'10.0',2,'18159801222','支付宝',NULL,NULL,NULL,'中国','福建','龙岩','新罗区','东肖镇','11111@qq.com','/pic/Images/head/a301722d-393d-4dd0-86ba-dd3389de98cf.jpg','97733f7e-a09a-416a-a73c-71795881672d','测试账号'),(43,'6069140','18159801211','123d491444893e62ed6a093a9078c231','4aabb821a28d8be9a74c8d024422a2f8',0,'2',NULL,'nick','真实名字','350000199909091345','东肖北路1号',0,1,NULL,29.5,17,29,'28.0',11,'18159801222','支付宝',NULL,NULL,NULL,'中国','福建','龙岩','新罗区','东肖镇','11111@qq.com','/happy-help/productImages/moren.jpg',NULL,'测试账号'),(44,'1698680','18159801212','0933d95785cb6ce84d69fffa1a739441','f2e6e4561b038f83e893abfb8958e6d1',0,'2',NULL,'nick','真实名字','350000199909091345','东肖北路1号',0,1,NULL,1000,8,8,'24',6,'18159801222','支付宝',NULL,NULL,NULL,'中国','福建','龙岩','新罗区','东肖镇','11111@qq.com','/happy-help/productImages/moren.jpg',NULL,'测试账号'),(45,'8757791','18159801001','5836dc60d258b5b463ed87bccb68656d','58d54da521457c74423917b048007af2',0,'2',NULL,'nick','真实名字','350000199909091345','东肖北路1号',0,1,NULL,1000,7,7,'24',24,'18159801222','支付宝',NULL,NULL,NULL,'中国','福建','龙岩','新罗区','东肖镇','11111@qq.com','/happy-help/productImages/moren.jpg','19686147-1130-4f7b-8ce7-6e13d166891d','测试账号'),(46,'2303546','18159801002','3ebbfd647566f9f88954921125bd2ba8','8b3a8f3341b6046a9ad45f0b2e530978',0,'2',NULL,'nick','真实名字','350000199909091345','东肖北路1号',0,1,NULL,1000,6,6,'24',8,'18159801222','支付宝',NULL,NULL,NULL,'中国','福建','龙岩','新罗区','东肖镇','11111@qq.com','/happy-help/productImages/moren.jpg','8a457520-752e-4f9c-8eaa-e2a0887a0da7','测试账号'),(47,'9272096','18159801003','c0bba4c3f7cb5c891a93f2bdf6989c08','fc034420bfd98c320e909d96a5fee7ea',0,'2',NULL,'nick','真实名字','350000199909091345','东肖北路1号',0,1,NULL,1000,5,5,'24',12,'18159801222','支付宝',NULL,NULL,NULL,'中国','福建','龙岩','新罗区','东肖镇','11111@qq.com','/happy-help/productImages/moren.jpg','ee76605b-8b99-4340-9fa1-6da726f3e121','测试账号'),(48,'3682860','18159801004','5987531c33375ec9a3ba88703e14d67f','099c5fcf960e0ec33f3117f44ae0c782',0,'2',NULL,'nick','真实名字','350000199909091345','东肖北路1号',0,1,NULL,1000,4,4,'24',6,'18159801222','支付宝',NULL,NULL,NULL,'中国','福建','龙岩','新罗区','东肖镇','11111@qq.com','/happy-help/productImages/moren.jpg','915394f5-2d78-4e4d-ad96-10db8fc806b9','测试账号'),(49,'2831978','18159800001','c64a666a58bfdf1eeaeb6785c84ec57d','6ec8cc8dc75f7c575fa0de9a2abdec66',0,'2',NULL,'nick1','真实名字','350000199909091345','东肖北路1号',0,1,NULL,1000,3,3,'24',6,'18159801222','支付宝',NULL,NULL,NULL,'中国','福建','龙岩','新罗区','东肖镇','11111@qq.com','/happy-help/productImages/moren.jpg',NULL,'测试账号'),(50,'1875892','18159800003','1df30f8e88d613c9cdeaab13ef8dbe75','051c23ee68286015c68a5ae90d78deac',0,'2',NULL,'nick1','真实名字','350000199909091345','东肖北路1号',0,1,NULL,1000,2,2,'24',8,'18159801222','支付宝',NULL,NULL,NULL,'中国','福建','龙岩','新罗区','东肖镇','11111@qq.com','/happy-help/productImages/moren.jpg','833f3299-7812-4092-8bea-56bcf2f22695','测试账号'),(52,'admin1','12332123123','a20b279521e20953233b5da6796a5b92','219b5372c38901e1b329be128e968f14',0,'1',NULL,'nick1','真实名字','350000199909091345','东肖北路1号',1,1,NULL,1000,1,1,'24',8,'18159801222','支付宝',NULL,NULL,NULL,'中国','福建','龙岩','新罗区','东肖镇','11111@qq.com','/happy-help/productImages/moren.jpg',NULL,'测试账号');
/*!40000 ALTER TABLE `hh_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_user_click`
--

DROP TABLE IF EXISTS `hh_user_click`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_user_click` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(45) DEFAULT NULL,
  `hh_article_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_hh_user_click_hh_article1_idx` (`hh_article_id`),
  CONSTRAINT `fk_hh_user_click_hh_article1` FOREIGN KEY (`hh_article_id`) REFERENCES `hh_article` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_user_click`
--

LOCK TABLES `hh_user_click` WRITE;
/*!40000 ALTER TABLE `hh_user_click` DISABLE KEYS */;
INSERT INTO `hh_user_click` VALUES (2,'43',12),(3,'44',12),(4,'45',12),(6,'42',12);
/*!40000 ALTER TABLE `hh_user_click` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_user_note`
--

DROP TABLE IF EXISTS `hh_user_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_user_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hh_user_id` int(11) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_user_note`
--

LOCK TABLES `hh_user_note` WRITE;
/*!40000 ALTER TABLE `hh_user_note` DISABLE KEYS */;
INSERT INTO `hh_user_note` VALUES (2,43,'test测试','2016-12-20 15:58:38');
/*!40000 ALTER TABLE `hh_user_note` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_user_role`
--

LOCK TABLES `hh_user_role` WRITE;
/*!40000 ALTER TABLE `hh_user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `hh_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hh_user_withdraw`
--

DROP TABLE IF EXISTS `hh_user_withdraw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_user_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` double DEFAULT NULL,
  `hh_user_id` int(11) DEFAULT NULL,
  `withdraw_account` varchar(45) DEFAULT NULL,
  `withdraw_account_type` varchar(45) DEFAULT NULL,
  `withdraw_account_name` varchar(45) DEFAULT NULL,
  `is_hande` tinyint(4) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_user_withdraw`
--

LOCK TABLES `hh_user_withdraw` WRITE;
/*!40000 ALTER TABLE `hh_user_withdraw` DISABLE KEYS */;
INSERT INTO `hh_user_withdraw` VALUES (1,200,43,'18159801259','支付宝','支付宝名字',0,NULL),(2,200,43,'18159801122','支付宝','支付宝帐号名字',1,'2016-12-22 13:26:14'),(3,200,43,'18159801122','支付宝','支付宝帐号名字',0,'2016-12-22 14:13:28');
/*!40000 ALTER TABLE `hh_user_withdraw` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-02 16:21:02

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
-- Table structure for table `hh_server_info`
--

DROP TABLE IF EXISTS `hh_server_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hh_server_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `context` varchar(1000) DEFAULT NULL,
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
  `image_url` varchar(1000) DEFAULT NULL,
  `server_time_start` datetime DEFAULT NULL,
  `server_time_end` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hh_suport_server_info_hh_user1_idx` (`hh_user_id`),
  KEY `fk_hh_server_info_hh_category1_idx` (`hh_category_id`),
  CONSTRAINT `fk_hh_server_info_hh_category1` FOREIGN KEY (`hh_category_id`) REFERENCES `hh_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hh_suport_server_info_hh_user1` FOREIGN KEY (`hh_user_id`) REFERENCES `hh_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_server_info`
--

LOCK TABLES `hh_server_info` WRITE;
/*!40000 ALTER TABLE `hh_server_info` DISABLE KEYS */;
INSERT INTO `hh_server_info` VALUES (2,'title','aaaaaaaaaaaaaaaaaaaaaaaaaaa','12345678901','2016-10-24 22:13:23',20,0,1,7,'c','p','c','a','s','a','/pic/Images/article/2c36c529-33e5-40ad-bb8d-4b87b72fcd55.jpg',NULL,NULL),(3,'title','aaaaaaaaaaaaaaaaaaaaaaaaaaa','12345678901','2016-10-24 22:13:23',20,0,0,7,'c','p','c','a','s','a','/pic/Images/article/2c36c529-33e5-40ad-bb8d-4b87b72fcd55.jpg',NULL,NULL),(4,'title','bbbbbbbbbbbbbbbbbbbbbbbbbbbbb','12345678901','2016-10-24 22:13:23',20,0,0,7,'c','p','c','a','s','a','/pic/Images/article/2c36c529-33e5-40ad-bb8d-4b87b72fcd55.jpg',NULL,NULL),(5,'title','ccccccccccccccccccccccccccccccc','12345678901','2016-10-24 22:13:23',20,0,0,7,'c','p','c','a','s','a','/pic/Images/article/2c36c529-33e5-40ad-bb8d-4b87b72fcd55.jpg',NULL,NULL),(6,NULL,'test','18159801259','2016-12-03 21:12:13',43,0,1,11,NULL,'福建省','泉州市','洛江区',NULL,'广桥','/pic/Images/serverInfo/84ef663e-aaee-42b1-aa84-9d54863cf6be.jpg,/pic/Images/serverInfo/e98666f0-2277-4cd0-abc3-0d16b1a4bc23.jpg',NULL,NULL),(7,'ttt','test','12345678901','2016-12-12 14:09:14',43,0,1,7,'中国','省',NULL,NULL,NULL,'ddddetail','','2016-10-24 22:13:00','2016-10-25 22:13:00');
/*!40000 ALTER TABLE `hh_server_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-12 15:08:20

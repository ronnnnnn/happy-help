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
  `is_compeleted` tinyint(4) DEFAULT NULL,
  `hh_contract_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hh_order_record`
--

LOCK TABLES `hh_order_record` WRITE;
/*!40000 ALTER TABLE `hh_order_record` DISABLE KEYS */;
INSERT INTO `hh_order_record` VALUES (1,'20161203173015','taskInfo','free','43','42',200,29,NULL,'2016-12-03 17:30:39',NULL,NULL),(2,'20161203173240','taskInfo','free','43','42',200,29,NULL,'2016-12-03 17:32:45',NULL,NULL),(3,'20161203173735','taskInfo','free','43','42',200,29,NULL,'2016-12-03 17:37:39',NULL,NULL),(4,'20161203174019','taskInfo','free','43','42',200,29,NULL,'2016-12-03 17:40:22',NULL,NULL),(5,'20161203174229','taskInfo','free','43','42',200,29,NULL,'2016-12-03 17:42:33',NULL,NULL);
/*!40000 ALTER TABLE `hh_order_record` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-06 12:19:48

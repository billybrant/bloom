CREATE DATABASE  IF NOT EXISTS `bloom` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bloom`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: bloom
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `workflow_transitions`
--

DROP TABLE IF EXISTS `workflow_transitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_transitions` (
  `tid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a workflow transition.',
  `sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The workflow_states.sid start state.',
  `target_sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The workflow_states.sid target state.',
  `roles` varchar(255) DEFAULT NULL COMMENT 'The role.sid that a user must have to perform transition.',
  `label` varchar(128) NOT NULL DEFAULT '' COMMENT 'The human-readable name of this transition.',
  `name` varchar(32) DEFAULT '' COMMENT 'The machine-readable name of this transition.',
  PRIMARY KEY (`tid`),
  KEY `sid` (`sid`),
  KEY `target_sid` (`target_sid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_transitions`
--

LOCK TABLES `workflow_transitions` WRITE;
/*!40000 ALTER TABLE `workflow_transitions` DISABLE KEYS */;
INSERT INTO `workflow_transitions` VALUES (1,3,4,'a:4:{i:-1;i:-1;i:2;i:2;i:3;i:3;i:4;i:4;}','','3_4'),(2,4,4,'a:5:{i:-1;i:-1;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;}','','4_4'),(3,4,5,'a:1:{i:4;i:4;}','','4_5'),(4,5,5,'a:5:{i:-1;i:-1;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;}','','5_5'),(5,5,6,'a:1:{i:2;i:2;}','','5_6'),(6,6,6,'a:5:{i:-1;i:-1;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;}','','6_6'),(7,6,7,'a:2:{i:-1;i:-1;i:2;i:2;}','','6_7'),(8,7,7,'a:5:{i:-1;i:-1;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;}','','7_7'),(9,7,9,'a:1:{i:4;i:4;}','','7_9'),(10,9,9,'a:5:{i:-1;i:-1;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;}','','9_9'),(11,9,8,'a:1:{i:4;i:4;}','','9_8'),(12,8,8,'a:5:{i:-1;i:-1;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;}','','8_8'),(13,8,10,'a:2:{i:-1;i:-1;i:2;i:2;}','','8_10'),(14,10,9,'a:1:{i:4;i:4;}','','10_9'),(15,10,10,'a:5:{i:-1;i:-1;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;}','','10_10');
/*!40000 ALTER TABLE `workflow_transitions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-08 11:12:49

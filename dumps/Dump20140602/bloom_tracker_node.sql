CREATE DATABASE  IF NOT EXISTS `bloom` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bloom`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: rit-wamp-dev    Database: bloom
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
-- Table structure for table `tracker_node`
--

DROP TABLE IF EXISTS `tracker_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracker_node` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node.nid this record tracks.',
  `published` tinyint(4) DEFAULT '0' COMMENT 'Boolean indicating whether the node is published.',
  `changed` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the node was most recently saved or commented on.',
  PRIMARY KEY (`nid`),
  KEY `tracker` (`published`,`changed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tracks when nodes were last changed or commented on.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracker_node`
--

LOCK TABLES `tracker_node` WRITE;
/*!40000 ALTER TABLE `tracker_node` DISABLE KEYS */;
INSERT INTO `tracker_node` VALUES (1,1,1397450508),(19,1,1400006171),(24,1,1400006203),(14,1,1400006460),(22,1,1400006502),(21,1,1400006517),(18,1,1400006556),(17,1,1400006572),(12,1,1400006609),(25,1,1400007014),(30,1,1400193432),(33,1,1400205739),(28,1,1400206896),(13,1,1400461164),(20,1,1400461588),(23,1,1400462256),(15,1,1400610080),(36,1,1400686483),(37,1,1400686611),(41,1,1401712068);
/*!40000 ALTER TABLE `tracker_node` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-02 10:00:42

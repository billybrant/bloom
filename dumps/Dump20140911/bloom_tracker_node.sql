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
INSERT INTO `tracker_node` VALUES (162,0,1409930215),(1,1,1397450508),(24,1,1400006203),(14,1,1400006460),(18,1,1400006556),(17,1,1400006572),(25,1,1400007014),(28,1,1400206896),(13,1,1400461164),(20,1,1400461588),(15,1,1400610080),(23,1,1405098532),(42,1,1405536409),(43,1,1408112930),(98,1,1409688644),(12,1,1409767121),(97,1,1409811934),(33,1,1409812247),(161,1,1409814715),(160,1,1409929403),(30,1,1409932569),(163,1,1409933572),(41,1,1410091476),(164,1,1410280813),(19,1,1410281825);
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

-- Dump completed on 2014-09-11 13:45:34

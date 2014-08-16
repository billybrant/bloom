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
-- Table structure for table `workflow_node_history`
--

DROP TABLE IF EXISTS `workflow_node_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_node_history` (
  `hid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The unique ID for this record.',
  `entity_type` varchar(255) NOT NULL DEFAULT '' COMMENT 'The type of entity this transition belongs to.',
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node.nid this record is for.',
  `revision_id` int(10) unsigned DEFAULT NULL,
  `field_name` varchar(32) NOT NULL DEFAULT '' COMMENT 'The name of the field the transition relates to.',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The languages.language of the entity.',
  `delta` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The sequence number for this data item, used for multi-value fields',
  `old_sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The workflow_states.sid this transition started as.',
  `sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The workflow_states.sid this transition transitioned to.',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The users.uid who made this transition.',
  `stamp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The unique stamp for this transition.',
  `comment` longtext COMMENT 'The comment explaining this transition.',
  PRIMARY KEY (`hid`),
  KEY `sid` (`entity_type`,`nid`,`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_node_history`
--

LOCK TABLES `workflow_node_history` WRITE;
/*!40000 ALTER TABLE `workflow_node_history` DISABLE KEYS */;
INSERT INTO `workflow_node_history` VALUES (1,'node',26,27,'','und',0,3,4,1,1400617397,'Pre-existing content set to initial state.'),(2,'node',29,30,'','und',0,3,4,1,1400618167,'Pre-existing content set to initial state.'),(3,'node',34,35,'','und',0,3,4,1,1400618167,'Pre-existing content set to initial state.'),(4,'node',35,36,'','und',0,3,4,1,1400618193,''),(5,'node',35,36,'','und',0,4,5,1,1400618234,''),(6,'node',35,36,'','und',0,5,6,1,1400618322,''),(7,'node',35,36,'','und',0,6,7,1,1400618331,''),(8,'node',35,36,'','und',0,7,9,1,1400618335,''),(9,'node',35,36,'','und',0,9,8,1,1400618339,''),(10,'node',35,36,'','und',0,8,10,1,1400618345,''),(11,'node',35,36,'','und',0,10,10,1,1400618433,'coments for worlow log\r\n'),(12,'node',35,36,'','und',0,10,0,1,1400686998,'Entity deleted.'),(13,'node',34,35,'','und',0,4,0,1,1400687058,'Entity deleted.'),(14,'node',29,30,'','und',0,4,0,1,1400687082,'Entity deleted.'),(15,'node',38,39,'','und',0,3,4,1,1400688725,''),(16,'node',39,40,'','und',0,3,4,1,1400993115,''),(17,'node',40,41,'','und',0,3,4,1,1400993312,''),(18,'node',26,27,'','und',0,4,0,1,1401715310,'Entity deleted.'),(19,'node',40,41,'','und',0,4,0,1,1401715720,'Entity deleted.'),(20,'node',39,40,'','und',0,4,0,1,1401717291,'Entity deleted.'),(21,'node',38,39,'','und',0,4,0,1,1401717296,'Entity deleted.'),(22,'node',43,44,'','und',0,3,4,31,1401907443,''),(23,'node',44,45,'','und',0,3,4,31,1402497260,''),(24,'node',45,46,'','und',0,3,4,31,1402585044,''),(25,'node',46,47,'','und',0,3,4,31,1402585086,'');
/*!40000 ALTER TABLE `workflow_node_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-08 11:12:46

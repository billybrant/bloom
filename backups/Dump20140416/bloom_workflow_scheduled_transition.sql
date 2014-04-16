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
-- Table structure for table `workflow_scheduled_transition`
--

DROP TABLE IF EXISTS `workflow_scheduled_transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_scheduled_transition` (
  `entity_type` varchar(255) NOT NULL DEFAULT '' COMMENT 'The type of entity this transition belongs to.',
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The entity ID of the object this transition belongs to.',
  `field_name` varchar(32) NOT NULL DEFAULT '' COMMENT 'The name of the field the transition relates to.',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The languages.language of the entity.',
  `delta` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The sequence number for this data item, used for multi-value fields',
  `old_sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The workflow_states.sid this state starts at.',
  `sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The workflow_states.sid this state transitions to.',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The user who scheduled this state transition.',
  `scheduled` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The date this transition is scheduled for.',
  `comment` longtext COMMENT 'The comment explaining this transition.',
  KEY `entity_type` (`entity_type`),
  KEY `entity_id` (`entity_type`,`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_scheduled_transition`
--

LOCK TABLES `workflow_scheduled_transition` WRITE;
/*!40000 ALTER TABLE `workflow_scheduled_transition` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_scheduled_transition` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-16 10:31:27

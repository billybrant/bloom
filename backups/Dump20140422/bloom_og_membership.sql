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
-- Table structure for table `og_membership`
--

DROP TABLE IF EXISTS `og_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `og_membership` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The group membership’s unique ID.',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT 'Reference to a group membership type.',
  `etid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The entity ID.',
  `entity_type` varchar(32) NOT NULL DEFAULT '' COMMENT 'The entity type (e.g. node, comment, etc’).',
  `gid` int(11) NOT NULL COMMENT 'The group’s unique ID.',
  `group_type` varchar(32) NOT NULL DEFAULT '' COMMENT 'The group’s entity type (e.g. node, comment, etc’).',
  `state` varchar(255) DEFAULT '' COMMENT 'The state of the group content.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the group content was created.',
  `field_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The name of the field holding the group ID, the OG memebership is associated with.',
  `language` varchar(12) NOT NULL DEFAULT '' COMMENT 'The languages.language of this membership.',
  PRIMARY KEY (`id`),
  KEY `entity` (`etid`,`entity_type`),
  KEY `group` (`gid`,`group_type`),
  KEY `group_type` (`group_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The group membership table.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `og_membership`
--

LOCK TABLES `og_membership` WRITE;
/*!40000 ALTER TABLE `og_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `og_membership` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-22 10:50:16

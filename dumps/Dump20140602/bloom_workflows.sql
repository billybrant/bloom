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
-- Table structure for table `workflows`
--

DROP TABLE IF EXISTS `workflows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflows` (
  `wid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a node.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The name of the workflow (used as machine name for features integration).',
  `tab_roles` varchar(255) NOT NULL DEFAULT '' COMMENT 'The role IDs that can access the workflow tabs on node pages.',
  `options` longtext COMMENT 'Additional settings for the workflow.',
  `label` varchar(255) NOT NULL DEFAULT '' COMMENT 'The human-readable name of this workflow.',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'The exportable status of the entity.',
  `module` varchar(255) DEFAULT NULL COMMENT 'The name of the providing module if the entity has been defined in code.',
  PRIMARY KEY (`wid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Workflows';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflows`
--

LOCK TABLES `workflows` WRITE;
/*!40000 ALTER TABLE `workflows` DISABLE KEYS */;
INSERT INTO `workflows` VALUES (2,'all_defaults','a:1:{i:4;s:1:\"4\";}','a:8:{s:13:\"name_as_title\";s:1:\"0\";s:7:\"options\";s:6:\"radios\";s:8:\"schedule\";s:1:\"1\";s:17:\"schedule_timezone\";s:1:\"1\";s:16:\"comment_log_node\";s:1:\"0\";s:15:\"comment_log_tab\";s:1:\"0\";s:12:\"watchdog_log\";s:1:\"0\";s:16:\"history_tab_show\";i:1;}','all defaults',1,NULL),(3,'bloom_site_creation','a:0:{}','a:8:{s:13:\"name_as_title\";s:1:\"1\";s:7:\"options\";s:6:\"radios\";s:8:\"schedule\";s:1:\"1\";s:17:\"schedule_timezone\";s:1:\"1\";s:16:\"comment_log_node\";s:1:\"1\";s:15:\"comment_log_tab\";s:1:\"1\";s:12:\"watchdog_log\";s:1:\"1\";s:16:\"history_tab_show\";i:1;}','Bloom Site Creation',1,NULL);
/*!40000 ALTER TABLE `workflows` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-02 10:00:41

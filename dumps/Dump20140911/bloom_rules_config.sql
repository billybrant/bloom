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
-- Table structure for table `rules_config`
--

DROP TABLE IF EXISTS `rules_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rules_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The internal identifier for any configuration.',
  `name` varchar(64) NOT NULL COMMENT 'The name of the configuration.',
  `label` varchar(255) NOT NULL DEFAULT 'unlabeled' COMMENT 'The label of the configuration.',
  `plugin` varchar(127) NOT NULL COMMENT 'The name of the plugin of this configuration.',
  `active` int(11) NOT NULL DEFAULT '1' COMMENT 'Boolean indicating whether the configuration is active. Usage depends on how the using module makes use of it.',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Weight of the configuration. Usage depends on how the using module makes use of it.',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'The exportable status of the entity.',
  `dirty` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Dirty configurations fail the integrity check, e.g. due to missing dependencies.',
  `module` varchar(255) DEFAULT NULL COMMENT 'The name of the providing module if the entity has been defined in code.',
  `owner` varchar(255) NOT NULL DEFAULT 'rules' COMMENT 'The name of the module via which the rule has been configured.',
  `access_exposed` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Whether to use a permission to control access for using components.',
  `data` longblob COMMENT 'Everything else, serialized.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `plugin` (`plugin`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rules_config`
--

LOCK TABLES `rules_config` WRITE;
/*!40000 ALTER TABLE `rules_config` DISABLE KEYS */;
INSERT INTO `rules_config` VALUES (5,'rules_deidentify_u_s_zip_codes','Deidentify U.S. Zip Codes','reaction rule',1,0,1,0,'rules','rules',0,'O:17:\"RulesReactionRule\":20:{s:9:\"\0*\0parent\";N;s:2:\"id\";N;s:12:\"\0*\0elementId\";i:1;s:6:\"weight\";i:0;s:8:\"settings\";a:0:{}s:4:\"name\";s:30:\"rules_deidentify_u_s_zip_codes\";s:5:\"label\";s:25:\"Deidentify U.S. Zip Codes\";s:6:\"plugin\";s:13:\"reaction rule\";s:6:\"active\";b:1;s:5:\"dirty\";b:0;s:6:\"module\";s:5:\"rules\";s:5:\"owner\";s:5:\"rules\";s:14:\"access_exposed\";b:0;s:4:\"data\";r:1;s:4:\"tags\";a:0:{}s:11:\"\0*\0children\";a:0:{}s:7:\"\0*\0info\";a:0:{}s:13:\"\0*\0conditions\";O:8:\"RulesAnd\":8:{s:9:\"\0*\0parent\";r:1;s:2:\"id\";N;s:12:\"\0*\0elementId\";i:2;s:6:\"weight\";i:0;s:8:\"settings\";a:0:{}s:11:\"\0*\0children\";a:0:{}s:7:\"\0*\0info\";a:0:{}s:9:\"\0*\0negate\";b:0;}s:9:\"\0*\0events\";a:1:{i:0;s:23:\"node_presave--hipaa_pii\";}s:16:\"\0*\0eventSettings\";a:1:{s:23:\"node_presave--hipaa_pii\";a:1:{s:6:\"bundle\";s:9:\"hipaa_pii\";}}}'),(6,'rules_hipaa_access_log','HIPAA Access Log','reaction rule',1,0,1,0,'rules','rules',0,'O:17:\"RulesReactionRule\":21:{s:9:\"\0*\0parent\";N;s:2:\"id\";s:1:\"6\";s:12:\"\0*\0elementId\";i:1;s:6:\"weight\";s:1:\"0\";s:8:\"settings\";a:0:{}s:4:\"name\";s:22:\"rules_hipaa_access_log\";s:5:\"label\";s:16:\"HIPAA Access Log\";s:6:\"plugin\";s:13:\"reaction rule\";s:6:\"active\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:5:\"dirty\";b:0;s:6:\"module\";s:5:\"rules\";s:5:\"owner\";s:5:\"rules\";s:14:\"access_exposed\";s:1:\"0\";s:4:\"data\";r:1;s:4:\"tags\";a:1:{i:0;s:5:\"HIPAA\";}s:11:\"\0*\0children\";a:0:{}s:7:\"\0*\0info\";a:0:{}s:13:\"\0*\0conditions\";O:8:\"RulesAnd\":8:{s:9:\"\0*\0parent\";r:1;s:2:\"id\";N;s:12:\"\0*\0elementId\";i:2;s:6:\"weight\";i:0;s:8:\"settings\";a:0:{}s:11:\"\0*\0children\";a:0:{}s:7:\"\0*\0info\";a:0:{}s:9:\"\0*\0negate\";b:0;}s:9:\"\0*\0events\";a:2:{i:0;s:20:\"node_view--hipaa_pii\";i:1;s:23:\"node_presave--hipaa_pii\";}s:16:\"\0*\0eventSettings\";a:2:{s:20:\"node_view--hipaa_pii\";a:1:{s:6:\"bundle\";s:9:\"hipaa_pii\";}s:23:\"node_presave--hipaa_pii\";a:1:{s:6:\"bundle\";s:9:\"hipaa_pii\";}}}');
/*!40000 ALTER TABLE `rules_config` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-11 13:45:47

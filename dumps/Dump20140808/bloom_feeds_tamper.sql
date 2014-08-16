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
-- Table structure for table `feeds_tamper`
--

DROP TABLE IF EXISTS `feeds_tamper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feeds_tamper` (
  `id` varchar(128) NOT NULL DEFAULT '' COMMENT 'Id of the feeds tamper instance.',
  `importer` varchar(128) NOT NULL DEFAULT '' COMMENT 'Id of the feeds importer.',
  `source` varchar(128) NOT NULL DEFAULT '' COMMENT 'The source field of the importer.',
  `plugin_id` varchar(128) NOT NULL DEFAULT '' COMMENT 'Id of the tamper plugin.',
  `settings` longtext COMMENT 'A serialized array of options for a Feeds Tamper plugin.',
  `weight` int(10) unsigned NOT NULL COMMENT 'The weight of a plugin instance. Plugins are executed in order.',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT 'Description of this plugin.',
  PRIMARY KEY (`id`),
  KEY `importer` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table storing tamper instances.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feeds_tamper`
--

LOCK TABLES `feeds_tamper` WRITE;
/*!40000 ALTER TABLE `feeds_tamper` DISABLE KEYS */;
/*!40000 ALTER TABLE `feeds_tamper` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-08 11:12:41

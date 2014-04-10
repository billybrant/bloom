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
-- Table structure for table `date_formats`
--

DROP TABLE IF EXISTS `date_formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `date_formats` (
  `dfid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The date format identifier.',
  `format` varchar(100) NOT NULL COMMENT 'The date format string.',
  `type` varchar(64) NOT NULL COMMENT 'The date format type, e.g. medium.',
  `locked` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Whether or not this format can be modified.',
  PRIMARY KEY (`dfid`),
  UNIQUE KEY `formats` (`format`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='Stores configured date formats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date_formats`
--

LOCK TABLES `date_formats` WRITE;
/*!40000 ALTER TABLE `date_formats` DISABLE KEYS */;
INSERT INTO `date_formats` VALUES (1,'Y-m-d H:i','short',1),(2,'m/d/Y - H:i','short',1),(3,'d/m/Y - H:i','short',1),(4,'Y/m/d - H:i','short',1),(5,'d.m.Y - H:i','short',1),(6,'m/d/Y - g:ia','short',1),(7,'d/m/Y - g:ia','short',1),(8,'Y/m/d - g:ia','short',1),(9,'M j Y - H:i','short',1),(10,'j M Y - H:i','short',1),(11,'Y M j - H:i','short',1),(12,'M j Y - g:ia','short',1),(13,'j M Y - g:ia','short',1),(14,'Y M j - g:ia','short',1),(15,'D, Y-m-d H:i','medium',1),(16,'D, m/d/Y - H:i','medium',1),(17,'D, d/m/Y - H:i','medium',1),(18,'D, Y/m/d - H:i','medium',1),(19,'F j, Y - H:i','medium',1),(20,'j F, Y - H:i','medium',1),(21,'Y, F j - H:i','medium',1),(22,'D, m/d/Y - g:ia','medium',1),(23,'D, d/m/Y - g:ia','medium',1),(24,'D, Y/m/d - g:ia','medium',1),(25,'F j, Y - g:ia','medium',1),(26,'j F Y - g:ia','medium',1),(27,'Y, F j - g:ia','medium',1),(28,'j. F Y - G:i','medium',1),(29,'l, F j, Y - H:i','long',1),(30,'l, j F, Y - H:i','long',1),(31,'l, Y,  F j - H:i','long',1),(32,'l, F j, Y - g:ia','long',1),(33,'l, j F Y - g:ia','long',1),(34,'l, Y,  F j - g:ia','long',1),(35,'l, j. F Y - G:i','long',1);
/*!40000 ALTER TABLE `date_formats` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-10 11:54:40

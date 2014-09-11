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
-- Table structure for table `role_watchdog`
--

DROP TABLE IF EXISTS `role_watchdog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_watchdog` (
  `hid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID of the history entry.',
  `aid` int(10) unsigned NOT NULL COMMENT 'User ID of account.',
  `rid` int(10) unsigned NOT NULL COMMENT 'Role ID changed.',
  `action` tinyint(4) NOT NULL COMMENT 'Action (add or remove) performed.',
  `uid` int(10) unsigned NOT NULL COMMENT 'User ID performing action.',
  `stamp` int(10) unsigned NOT NULL COMMENT 'Time action performed.',
  PRIMARY KEY (`hid`),
  KEY `aid` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='Stores log of all role changes.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_watchdog`
--

LOCK TABLES `role_watchdog` WRITE;
/*!40000 ALTER TABLE `role_watchdog` DISABLE KEYS */;
INSERT INTO `role_watchdog` VALUES (1,0,2,1,1,1408463767),(2,0,2,1,1,1408463767),(3,0,2,1,1,1408463767),(4,0,2,1,1,1408463767),(5,0,2,1,1,1408463767),(6,0,2,1,1,1408463767),(7,0,2,1,1,1408463767),(8,0,2,1,1,1408463767),(9,0,2,1,1,1408463767),(10,0,2,1,1,1408463767);
/*!40000 ALTER TABLE `role_watchdog` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-11 13:45:51

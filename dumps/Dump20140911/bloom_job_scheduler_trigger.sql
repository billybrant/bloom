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
-- Table structure for table `job_scheduler_trigger`
--

DROP TABLE IF EXISTS `job_scheduler_trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_scheduler_trigger` (
  `trid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: unique trigger id.',
  `hook` varchar(32) NOT NULL DEFAULT '' COMMENT 'Primary Key: The name of the internal Drupal hook; for example, job_scheduer_100.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'Title for the trigger.',
  `crontab` varchar(255) NOT NULL DEFAULT '' COMMENT 'Crontab line in *NIX format.',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT 'Boolean indicating whether the trigger is active.',
  `last` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Timestamp when it was lat triggered.',
  PRIMARY KEY (`trid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Schedule of triggers to be created.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_scheduler_trigger`
--

LOCK TABLES `job_scheduler_trigger` WRITE;
/*!40000 ALTER TABLE `job_scheduler_trigger` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_scheduler_trigger` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-11 13:45:30

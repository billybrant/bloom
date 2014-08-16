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
-- Table structure for table `job_schedule`
--

DROP TABLE IF EXISTS `job_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_schedule` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique item ID.',
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT 'Name of the schedule.',
  `type` varchar(128) NOT NULL DEFAULT '' COMMENT 'Type identifier of the job.',
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Numeric identifier of the job.',
  `period` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Time period after which job is to be executed.',
  `crontab` varchar(255) NOT NULL DEFAULT '' COMMENT 'Crontab line in *NIX format.',
  `data` longblob COMMENT 'The arbitrary data for the item.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp when job expires.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp when the item was created.',
  `last` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Timestamp when a job was last executed.',
  `periodic` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'If true job will be automatically rescheduled.',
  `next` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Timestamp when a job is to be executed (next = last + period), used for fast ordering.',
  `scheduled` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Timestamp when a job was scheduled. 0 if a job is currently not scheduled.',
  PRIMARY KEY (`item_id`),
  KEY `name_type_id` (`name`,`type`,`id`),
  KEY `name_type` (`name`,`type`),
  KEY `next` (`next`),
  KEY `scheduled` (`scheduled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Schedule of jobs to be executed.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_schedule`
--

LOCK TABLES `job_schedule` WRITE;
/*!40000 ALTER TABLE `job_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_schedule` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-08 11:12:47

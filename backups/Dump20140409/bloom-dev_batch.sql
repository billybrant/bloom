CREATE DATABASE  IF NOT EXISTS `bloom-dev` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bloom-dev`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: rit-wamp-dev    Database: bloom-dev
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
-- Table structure for table `batch`
--

DROP TABLE IF EXISTS `batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch` (
  `bid` int(10) unsigned NOT NULL COMMENT 'Primary Key: Unique batch ID.',
  `token` varchar(64) NOT NULL COMMENT 'A string token generated against the current user’s session id and the batch id, used to ensure that only the user who submitted the batch can effectively access it.',
  `timestamp` int(11) NOT NULL COMMENT 'A Unix timestamp indicating when this batch was submitted for processing. Stale batches are purged at cron time.',
  `batch` longblob COMMENT 'A serialized array containing the processing data for the batch.',
  PRIMARY KEY (`bid`),
  KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores details about batches (processes that run in...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch`
--

LOCK TABLES `batch` WRITE;
/*!40000 ALTER TABLE `batch` DISABLE KEYS */;
INSERT INTO `batch` VALUES (21,'8E5DeygMy0HKJdbW0EdWxO51ZQeJEJU2mqAHxp8Jwy4',1397051567,'a:13:{s:4:\"sets\";a:1:{i:0;a:15:{s:7:\"sandbox\";a:0:{}s:7:\"results\";a:1:{s:8:\"projects\";a:2:{s:6:\"entity\";s:58:\"http://ftp.drupal.org/files/projects/entity-7.x-1.5.tar.gz\";s:16:\"field_validation\";s:68:\"http://ftp.drupal.org/files/projects/field_validation-7.x-2.4.tar.gz\";}}s:7:\"success\";b:1;s:5:\"start\";d:1397051568.567075;s:7:\"elapsed\";d:1564.1600000000001;s:5:\"title\";s:19:\"Downloading updates\";s:12:\"init_message\";s:49:\"Preparing to download selected updates<br/>&nbsp;\";s:8:\"finished\";s:38:\"update_manager_download_batch_finished\";s:4:\"file\";s:33:\"modules/update/update.manager.inc\";s:16:\"progress_message\";s:29:\"Completed @current of @total.\";s:13:\"error_message\";s:22:\"An error has occurred.\";s:3:\"css\";a:0:{}s:5:\"total\";i:2;s:5:\"count\";i:0;s:5:\"queue\";a:2:{s:4:\"name\";s:17:\"drupal_batch:21:0\";s:5:\"class\";s:10:\"BatchQueue\";}}}s:16:\"has_form_submits\";b:0;s:10:\"form_state\";a:3:{s:10:\"programmed\";b:0;s:7:\"rebuild\";b:0;s:8:\"redirect\";N;}s:11:\"progressive\";b:1;s:11:\"current_set\";i:0;s:3:\"url\";s:5:\"batch\";s:11:\"url_options\";a:1:{s:5:\"query\";a:1:{s:6:\"render\";s:7:\"overlay\";}}s:10:\"source_url\";s:28:\"admin/reports/updates/update\";s:8:\"redirect\";N;s:5:\"theme\";s:5:\"seven\";s:17:\"redirect_callback\";s:11:\"drupal_goto\";s:2:\"id\";s:2:\"21\";s:13:\"error_message\";s:83:\"Please continue to <a href=\"/?q=batch&amp;id=21&amp;op=finished\">the error page</a>\";}');
/*!40000 ALTER TABLE `batch` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-09 23:28:37

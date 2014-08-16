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
-- Table structure for table `feeds_importer`
--

DROP TABLE IF EXISTS `feeds_importer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feeds_importer` (
  `id` varchar(128) NOT NULL DEFAULT '' COMMENT 'Id of the fields object.',
  `config` longblob COMMENT 'Configuration of the feeds object.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Configuration of feeds objects.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feeds_importer`
--

LOCK TABLES `feeds_importer` WRITE;
/*!40000 ALTER TABLE `feeds_importer` DISABLE KEYS */;
INSERT INTO `feeds_importer` VALUES ('icd_9','a:11:{s:4:\"name\";s:5:\"ICD-9\";s:11:\"description\";s:0:\"\";s:7:\"fetcher\";a:2:{s:10:\"plugin_key\";s:16:\"FeedsHTTPFetcher\";s:6:\"config\";a:4:{s:17:\"auto_detect_feeds\";b:0;s:16:\"use_pubsubhubbub\";b:0;s:14:\"designated_hub\";s:0:\"\";s:15:\"request_timeout\";N;}}s:6:\"parser\";a:2:{s:10:\"plugin_key\";s:22:\"FeedsSyndicationParser\";s:6:\"config\";a:0:{}}s:9:\"processor\";a:2:{s:10:\"plugin_key\";s:18:\"FeedsNodeProcessor\";s:6:\"config\";a:8:{s:6:\"expire\";i:-1;s:6:\"author\";i:0;s:9:\"authorize\";b:1;s:8:\"mappings\";a:0:{}s:15:\"update_existing\";i:0;s:12:\"input_format\";N;s:15:\"skip_hash_check\";b:0;s:6:\"bundle\";N;}}s:12:\"content_type\";s:0:\"\";s:6:\"update\";i:0;s:13:\"import_period\";s:2:\"-1\";s:13:\"expire_period\";i:3600;s:16:\"import_on_create\";i:1;s:21:\"process_in_background\";i:0;}'),('test','a:11:{s:4:\"name\";s:4:\"test\";s:11:\"description\";s:0:\"\";s:7:\"fetcher\";a:2:{s:10:\"plugin_key\";s:16:\"FeedsFileFetcher\";s:6:\"config\";a:4:{s:6:\"direct\";b:0;s:18:\"allowed_extensions\";s:20:\"txt csv tsv xml opml\";s:9:\"directory\";s:14:\"public://feeds\";s:15:\"allowed_schemes\";a:1:{i:0;s:6:\"public\";}}}s:6:\"parser\";a:2:{s:10:\"plugin_key\";s:14:\"FeedsCSVParser\";s:6:\"config\";a:2:{s:9:\"delimiter\";s:1:\",\";s:10:\"no_headers\";i:0;}}s:9:\"processor\";a:2:{s:10:\"plugin_key\";s:18:\"FeedsNodeProcessor\";s:6:\"config\";a:8:{s:6:\"bundle\";s:7:\"article\";s:15:\"update_existing\";i:1;s:6:\"expire\";s:2:\"-1\";s:8:\"mappings\";a:4:{i:0;a:3:{s:6:\"source\";s:5:\"title\";s:6:\"target\";s:5:\"title\";s:6:\"unique\";b:0;}i:1;a:3:{s:6:\"source\";s:4:\"body\";s:6:\"target\";s:4:\"body\";s:6:\"unique\";b:0;}i:2;a:3:{s:6:\"source\";s:9:\"published\";s:6:\"target\";s:7:\"created\";s:6:\"unique\";b:0;}i:3;a:3:{s:6:\"source\";s:4:\"guid\";s:6:\"target\";s:4:\"guid\";s:6:\"unique\";i:1;}}s:12:\"input_format\";s:10:\"plain_text\";s:6:\"author\";i:0;s:9:\"authorize\";b:1;s:15:\"skip_hash_check\";b:0;}}s:12:\"content_type\";s:0:\"\";s:6:\"update\";i:0;s:13:\"import_period\";s:2:\"-1\";s:13:\"expire_period\";i:3600;s:16:\"import_on_create\";i:1;s:21:\"process_in_background\";b:0;}');
/*!40000 ALTER TABLE `feeds_importer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-08 11:12:45

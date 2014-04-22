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
-- Table structure for table `search_total`
--

DROP TABLE IF EXISTS `search_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_total` (
  `word` varchar(50) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique word in the search index.',
  `count` float DEFAULT NULL COMMENT 'The count of the word in the index using Zipf’s law to equalize the probability distribution.',
  PRIMARY KEY (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores search totals for words.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_total`
--

LOCK TABLES `search_total` WRITE;
/*!40000 ALTER TABLE `search_total` DISABLE KEYS */;
INSERT INTO `search_total` VALUES ('2008',0.30103),('24',0.30103),('55',0.30103),('56',0.30103),('adopted',0.30103),('aged',0.30103),('among',0.30103),('analytical',0.30103),('and',0.0669468),('apache',0.30103),('applications',0.176091),('awareness',0.30103),('became',0.30103),('becoming',0.30103),('bloom',0.0157943),('challenging',0.30103),('cms',0.30103),('colleagues',0.30103),('collecting',0.30103),('common',0.30103),('conduct',0.30103),('configuration',0.30103),('data',0.124939),('deficient',0.30103),('delivering',0.30103),('developing',0.30103),('drupal',0.30103),('ever',0.30103),('excel',0.30103),('expectations',0.30103),('extracting',0.30103),('extremely',0.30103),('for',0.124939),('foxpro',0.30103),('from',0.30103),('grantors',0.30103),('growing',0.30103),('increasingly',0.30103),('initial',0.30103),('into',0.30103),('loading',0.30103),('lots',0.30103),('maintaining',0.30103),('meei',0.30103),('migrate',0.30103),('module',0.30103),('more',0.30103),('motivation',0.30103),('mysql',0.30103),('need',0.30103),('originally',0.30103),('other',0.30103),('out',0.30103),('overview',0.0163904),('paradox',0.30103),('php',0.30103),('platform',0.30103),('proved',0.30103),('radically',0.30103),('requirements',0.30103),('research',0.30103),('researchers',0.30103),('rose',0.30103),('running',0.30103),('scrubbing',0.30103),('security',0.30103),('selection',0.30103),('server',0.30103),('stringent',0.30103),('struggling',0.30103),('task',0.30103),('techies',0.30103),('that',0.176091),('the',0.0669468),('their',0.176091),('there',0.30103),('tools',0.176091),('ultimately',0.30103),('was',0.176091),('web',0.30103),('were',0.30103),('windows',0.30103),('with',0.176091);
/*!40000 ALTER TABLE `search_total` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-22 10:50:11

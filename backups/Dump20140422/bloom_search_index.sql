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
-- Table structure for table `search_index`
--

DROP TABLE IF EXISTS `search_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_index` (
  `word` varchar(50) NOT NULL DEFAULT '' COMMENT 'The search_total.word that is associated with the search item.',
  `sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The search_dataset.sid of the searchable item to which the word belongs.',
  `type` varchar(16) NOT NULL COMMENT 'The search_dataset.type of the searchable item to which the word belongs.',
  `score` float DEFAULT NULL COMMENT 'The numeric score of the word, higher being more important.',
  PRIMARY KEY (`word`,`sid`,`type`),
  KEY `sid_type` (`sid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the search index, associating words, items and...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_index`
--

LOCK TABLES `search_index` WRITE;
/*!40000 ALTER TABLE `search_index` DISABLE KEYS */;
INSERT INTO `search_index` VALUES ('2008',1,'node',1),('24',1,'node',1),('55',1,'node',1),('56',1,'node',1),('adopted',1,'node',1),('aged',1,'node',1),('among',1,'node',1),('analytical',1,'node',1),('and',1,'node',6),('apache',1,'node',1),('applications',1,'node',2),('awareness',1,'node',1),('became',1,'node',1),('becoming',1,'node',1),('bloom',1,'node',27),('challenging',1,'node',1),('cms',1,'node',1),('colleagues',1,'node',1),('collecting',1,'node',1),('common',1,'node',1),('conduct',1,'node',1),('configuration',1,'node',1),('data',1,'node',3),('deficient',1,'node',1),('delivering',1,'node',1),('developing',1,'node',1),('drupal',1,'node',1),('ever',1,'node',1),('excel',1,'node',1),('expectations',1,'node',1),('extracting',1,'node',1),('extremely',1,'node',1),('for',1,'node',3),('foxpro',1,'node',1),('from',1,'node',1),('grantors',1,'node',1),('growing',1,'node',1),('increasingly',1,'node',1),('initial',1,'node',1),('into',1,'node',1),('loading',1,'node',1),('lots',1,'node',1),('maintaining',1,'node',1),('meei',1,'node',1),('migrate',1,'node',1),('module',1,'node',1),('more',1,'node',1),('motivation',1,'node',1),('mysql',1,'node',1),('need',1,'node',1),('originally',1,'node',1),('other',1,'node',1),('out',1,'node',1),('overview',1,'node',26),('paradox',1,'node',1),('php',1,'node',1),('platform',1,'node',1),('proved',1,'node',1),('radically',1,'node',1),('requirements',1,'node',1),('research',1,'node',1),('researchers',1,'node',1),('rose',1,'node',1),('running',1,'node',1),('scrubbing',1,'node',1),('security',1,'node',1),('selection',1,'node',1),('server',1,'node',1),('stringent',1,'node',1),('struggling',1,'node',1),('task',1,'node',1),('techies',1,'node',1),('that',1,'node',2),('the',1,'node',6),('their',1,'node',2),('there',1,'node',1),('tools',1,'node',2),('ultimately',1,'node',1),('was',1,'node',2),('web',1,'node',1),('were',1,'node',1),('windows',1,'node',1),('with',1,'node',2);
/*!40000 ALTER TABLE `search_index` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-22 10:50:10

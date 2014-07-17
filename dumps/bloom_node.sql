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
-- Table structure for table `node`
--

DROP TABLE IF EXISTS `node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node` (
  `nid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a node.',
  `vid` int(10) unsigned DEFAULT NULL COMMENT 'The current node_revision.vid version identifier.',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT 'The node_type.type of this node.',
  `language` varchar(12) NOT NULL DEFAULT '' COMMENT 'The languages.language of this node.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The title of this node, always treated as non-markup plain text.',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid that owns this node; initially, this is the user that created it.',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT 'Boolean indicating whether the node is published (visible to non-administrators).',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the node was created.',
  `changed` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the node was most recently saved.',
  `comment` int(11) NOT NULL DEFAULT '0' COMMENT 'Whether comments are allowed on this node: 0 = no, 1 = closed (read only), 2 = open (read/write).',
  `promote` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node should be displayed on the front page.',
  `sticky` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node should be displayed at the top of lists in which it appears.',
  `tnid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The translation set id for this node, which equals the node id of the source post in each set.',
  `translate` int(11) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this translation page needs to be updated.',
  `uuid` char(36) NOT NULL DEFAULT '' COMMENT 'The Universally Unique Identifier.',
  PRIMARY KEY (`nid`),
  UNIQUE KEY `vid` (`vid`),
  KEY `node_changed` (`changed`),
  KEY `node_created` (`created`),
  KEY `node_frontpage` (`promote`,`status`,`sticky`,`created`),
  KEY `node_status_type` (`status`,`type`,`nid`),
  KEY `node_title_type` (`title`,`type`(4)),
  KEY `node_type` (`type`(4)),
  KEY `uid` (`uid`),
  KEY `tnid` (`tnid`),
  KEY `translate` (`translate`),
  KEY `language` (`language`),
  KEY `uuid` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='The base table for nodes.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node`
--

LOCK TABLES `node` WRITE;
/*!40000 ALTER TABLE `node` DISABLE KEYS */;
INSERT INTO `node` VALUES (1,2,'page','und','Bloom',1,1,1397172780,1397450508,2,1,1,0,0,'7ee1ebef-4fe1-4523-a455-6c52362cb60e'),(12,13,'page','und','Narratives',1,1,1399992399,1400006609,1,0,0,0,0,'e5c077e7-774f-4d7c-a4c0-17f9f2c596c0'),(13,14,'page','und','When do I need to change my dev site and do a new release?',1,1,1399993132,1400461164,1,0,0,0,0,'40634370-61ca-42a8-b9f7-0deea99216a7'),(14,15,'page','und','Bloom Administration Recipes',1,1,1399993200,1400006460,1,0,0,0,0,'ff7250af-80ef-4443-a14a-5a7c1fc36de8'),(15,16,'page','und','How do I create and push a new release of my Bloom site?',1,1,1399995373,1400610080,1,0,0,0,0,'4a08bbaa-2b56-4289-a1f5-92e6e583702c'),(17,18,'page','und','How do I deploy a minor upgrade of drupal to my bloom sites?',1,1,1400003816,1400006572,1,0,0,0,0,'3395c3b2-42a5-4915-9cc6-c963b4e201e6'),(18,19,'page','und','How do I save a snapshot of a Bloom site?',1,1,1400003816,1400006556,1,0,0,0,0,'74ad97dd-27ac-480b-8ea1-2f3ea2fb4371'),(19,20,'page','und','Documentation',1,1,1400003816,1400006171,1,0,0,0,0,'d03e7ca1-711d-41fc-a800-295001a5d759'),(20,21,'page','und','How to Create a New Bloom Development Site',1,1,1400003816,1400461588,1,0,0,0,0,'a8538718-5c85-4d52-aca5-13765b7f30ab'),(21,22,'faq','und','How do I change the site name?',1,1,1400003816,1400006517,2,0,0,0,0,'17d264f4-9567-4790-b3c6-c0f6e340460c'),(22,23,'faq','und','How do I apply updates?',1,1,1400003816,1400006502,2,0,0,0,0,'42671c26-21d5-4c82-9f6c-1deae5ca12a8'),(23,24,'page','und','How to Create a Bloom Infrastructure from Scratch (windows)',1,1,1400003816,1402721502,1,0,0,0,0,'77c9f314-bdbf-42fa-92b8-5ccb6af501f2'),(24,25,'page','und','Bloom User Recipes',1,1,1400003965,1400006203,1,0,0,0,0,'3a617fd8-d549-4dcc-bb87-01333c47831b'),(25,26,'page','und','How do I get a Bloom site?',1,1,1400007014,1400007014,1,0,0,0,0,'9e9cec75-6bb3-4873-bb5e-83879d2f1d83'),(28,29,'page','und','Bloom Permission Objects',1,1,1400033541,1400206896,1,0,0,0,0,'a075c77a-d596-4df3-bc63-767097327efc'),(30,31,'page','und','Reference',1,1,1400193262,1400193432,1,0,0,0,0,'1e8d0108-1836-4f95-8c7a-9d7afa96489d'),(33,34,'page','und','HIPAA Protections',1,1,1400205739,1400205739,1,0,0,0,0,'acf510ef-692c-48da-9df5-95a47087cbca'),(41,42,'page','und','Bloom Presentation',1,1,1401418792,1401712068,1,0,0,0,0,'69e3fc6f-57c7-4487-9beb-928f0c21602d'),(50,52,'hipaa_pii','und','HIPAA_PII',1,0,1403527540,1403527540,1,0,0,0,0,'7f3a6d13-9911-4019-bed0-e0d2978e0a23'),(51,53,'hipaa_pii','und','7812',1,0,1403527756,1403527756,1,0,0,0,0,'bd61d738-9c97-4ace-921f-0c7d86ae5dd1'),(52,54,'hipaa_pii','und','7811',1,0,1403528430,1403528430,1,0,0,0,0,'00c6a464-25bc-4060-b610-89b991b9a31d'),(53,55,'hipaa_pii','und','7812',1,0,1403528685,1403528685,1,0,0,0,0,'f4110178-52b8-4cd2-9f65-451e166e87ae');
/*!40000 ALTER TABLE `node` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-02 20:40:28

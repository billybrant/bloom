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
-- Table structure for table `node_revision`
--

DROP TABLE IF EXISTS `node_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_revision` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node this version belongs to.',
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for this version.',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid that created this version.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The title of this version.',
  `log` longtext NOT NULL COMMENT 'The log entry explaining the changes in this version.',
  `timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when this version was created.',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT 'Boolean indicating whether the node (at the time of this revision) is published (visible to non-administrators).',
  `comment` int(11) NOT NULL DEFAULT '0' COMMENT 'Whether comments are allowed on this node (at the time of this revision): 0 = no, 1 = closed (read only), 2 = open (read/write).',
  `promote` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node (at the time of this revision) should be displayed on the front page.',
  `sticky` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node (at the time of this revision) should be displayed at the top of lists in which it appears.',
  `vuuid` char(36) NOT NULL DEFAULT '' COMMENT 'The Universally Unique Identifier.',
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`),
  KEY `uid` (`uid`),
  KEY `vuuid` (`vuuid`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='Stores information about each saved version of a node.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_revision`
--

LOCK TABLES `node_revision` WRITE;
/*!40000 ALTER TABLE `node_revision` DISABLE KEYS */;
INSERT INTO `node_revision` VALUES (1,1,1,'Bloom','',1397173157,1,2,1,0,'197afaf1-1204-4ebf-973f-14bb241c3a85'),(1,2,31,'Bloom','Added a sentence, and finding out how revisions work.',1397450508,1,2,1,1,'6900c65b-b8bc-4b5c-a8f1-a47bf4a5bbd7'),(12,13,1,'Narratives','',1400006609,1,1,0,0,'73f8ac56-bd6f-44b3-977d-151c6000605d'),(13,14,1,'When do I need to change my dev site and do a new release?','',1400461164,1,1,0,0,'bdc0d34e-9128-4b95-ac0c-62c4a9f8930b'),(14,15,1,'Bloom Administration Recipes','',1400006460,1,1,0,0,'88034f18-afaf-49d5-8cb7-714cb68db32d'),(15,16,37,'How do I create and push a new release of my Bloom site?','',1400610080,1,1,0,0,'46d90d99-1505-43c1-9647-129693d0d3b2'),(17,18,1,'How do I deploy a minor upgrade of drupal to my bloom sites?','',1400006572,1,1,0,0,'b7c7e3f4-bb01-4aad-8c18-583d79a69bcb'),(18,19,1,'How do I save a snapshot of a Bloom site?','',1400006556,1,1,0,0,'f059f0f4-915b-43ed-addc-6880e946a6b6'),(19,20,1,'Documentation','',1400006171,1,1,0,0,'919e098f-5c0c-475e-9362-78ce95b93d6d'),(20,21,1,'How to Create a New Bloom Development Site','',1400461588,1,1,0,0,'0b85f8d7-e7ab-405d-a198-da3018ab19b0'),(21,22,1,'How do I change the site name?','',1400006517,1,2,0,0,'13dce6f5-be0b-48da-aee6-71755d8a7a59'),(22,23,1,'How do I apply updates?','',1400006502,1,2,0,0,'c1cdb5cf-2782-4c5f-b05c-565983cb65a5'),(23,24,1,'How to Create a Bloom Infrastructure from Scratch (windows)','',1400462256,1,1,0,0,'a9de082f-e137-468b-93d3-d1c0720e316a'),(24,25,1,'Bloom User Recipes','',1400006203,1,1,0,0,'e96f285a-167f-432d-8ddc-5bac0956edf2'),(25,26,1,'How do I get a Bloom site?','',1400007014,1,1,0,0,'99e24279-42a0-4317-9851-ad4f94d55c75'),(28,29,1,'Bloom Permission Objects','',1400206896,1,1,0,0,'170dc93f-1079-4992-bcdb-27ccd87d0768'),(30,31,1,'Reference','',1400193432,1,1,0,0,'42e6a608-c705-42e9-a673-1c4450e7da71'),(33,34,1,'HIPAA Protections','',1400205739,1,1,0,0,'585138e5-6cd2-4445-878c-f9efeb00ee93'),(36,37,1,'PII User','',1400686483,1,2,1,0,'daef5a27-d9cd-4a37-884b-2fff2bf794d7'),(37,38,1,'PII User','',1400686611,1,2,1,0,'962cd553-9448-4f92-9004-980856a4f708'),(41,42,1,'Bloom Presentation','',1401712068,1,1,0,0,'75442382-6916-428a-91c3-b8bb5dd026c3');
/*!40000 ALTER TABLE `node_revision` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-02 10:00:39

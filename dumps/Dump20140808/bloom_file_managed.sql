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
-- Table structure for table `file_managed`
--

DROP TABLE IF EXISTS `file_managed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_managed` (
  `fid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'File ID.',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The users.uid of the user who is associated with the file.',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name of the file with no path components. This may differ from the basename of the URI if the file is renamed to avoid overwriting an existing file.',
  `uri` varchar(255) NOT NULL DEFAULT '' COMMENT 'The URI to access the file (either local or remote).',
  `filemime` varchar(255) NOT NULL DEFAULT '' COMMENT 'The file’s MIME type.',
  `filesize` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'The size of the file in bytes.',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A field indicating the status of the file. Two status are defined in core: temporary (0) and permanent (1). Temporary files older than DRUPAL_MAXIMUM_TEMP_FILE_AGE will be removed during a cron run.',
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'UNIX timestamp for when the file was added.',
  `uuid` char(36) NOT NULL DEFAULT '' COMMENT 'The Universally Unique Identifier.',
  PRIMARY KEY (`fid`),
  UNIQUE KEY `uri` (`uri`),
  KEY `uid` (`uid`),
  KEY `status` (`status`),
  KEY `timestamp` (`timestamp`),
  KEY `uuid` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='Stores information for uploaded files.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_managed`
--

LOCK TABLES `file_managed` WRITE;
/*!40000 ALTER TABLE `file_managed` DISABLE KEYS */;
INSERT INTO `file_managed` VALUES (2,31,'slide-1.jpg','public://banner/slide-1.jpg','image/jpeg',201381,1,1398789192,'976328b8-d082-41b2-8ded-01b6ebfe0fed'),(3,0,'1.jpg','public://banner/1.jpg','',171942,1,1398788768,'bb07b0b4-352a-4576-aba0-0dde6b441579'),(4,0,'2.jpg','public://banner/2.jpg','',237663,1,1398788768,'fae8f65c-4b71-4ec2-bf09-fe8f425b3e72'),(5,0,'3.jpg','public://banner/3.jpg','',65267,1,1398788768,'b9064288-bdc8-4496-bbf4-181aa2420efd'),(6,0,'4.jpg','public://banner/4.jpg','',216118,1,1398788768,'1e6eddcd-0e10-48a7-9b38-58503d47e640'),(7,0,'5.jpg','public://banner/5.jpg','',144638,1,1398788768,'0bdd7cf0-b6b2-4cb5-8815-c5b664f0ff2e'),(8,0,'6.jpg','public://banner/6.jpg','',230744,1,1398788768,'0dfacbfe-6bf3-478f-9cca-44bc959953ec'),(11,31,'slide-2.jpg','public://banner/slide-2.jpg','image/jpeg',164490,1,1398789246,'a65c959b-5e3b-4d45-acb7-efe31abe36d8'),(13,31,'slide-3.jpg','public://banner/slide-3.jpg','image/jpeg',130823,1,1398789279,'937c7861-415d-4ce7-b48f-d716a7589f53'),(15,31,'slide-4.jpg','public://banner/slide-4.jpg','image/jpeg',126229,1,1398789286,'cfedc05b-87a4-4971-a3d2-a8e18cdd34a9'),(17,1,'marinelli_banner_1.png','public://banner/marinelli_banner_1.png','image/png',260362,1,1398793624,'4806f82a-7d54-4e11-8148-f972b07d360d'),(19,1,'marinelli_banner_2.png','public://banner/marinelli_banner_2.png','image/png',163969,1,1398793641,'094fddc7-0587-4fe9-9c5f-903e5c548dc5'),(21,1,'marinelli_banner_4.png','public://banner/marinelli_banner_4.png','image/png',194282,1,1398793654,'ffc68e1a-ff9c-408d-9edb-5576b51702c9');
/*!40000 ALTER TABLE `file_managed` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-08 11:12:48

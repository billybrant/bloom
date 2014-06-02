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
-- Table structure for table `cache_path`
--

DROP TABLE IF EXISTS `cache_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_path` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for path alias lookup.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_path`
--

LOCK TABLES `cache_path` WRITE;
/*!40000 ALTER TABLE `cache_path` DISABLE KEYS */;
INSERT INTO `cache_path` VALUES ('admin/config','a:1:{i:0;s:8:\"node/add\";}',1401803674,1401717274,1),('admin/config/development/maintenance','a:1:{i:0;s:8:\"node/add\";}',1401800382,1401713982,1),('admin/content','a:73:{i:0;s:8:\"node/add\";i:1;s:7:\"node/41\";i:2;s:12:\"node/41/edit\";i:3;s:14:\"node/41/delete\";i:4;s:7:\"node/40\";i:5;s:12:\"node/40/edit\";i:6;s:14:\"node/40/delete\";i:7;s:7:\"node/39\";i:8;s:12:\"node/39/edit\";i:9;s:14:\"node/39/delete\";i:10;s:7:\"node/38\";i:11;s:12:\"node/38/edit\";i:12;s:14:\"node/38/delete\";i:13;s:7:\"node/37\";i:14;s:12:\"node/37/edit\";i:15;s:14:\"node/37/delete\";i:16;s:7:\"node/36\";i:17;s:12:\"node/36/edit\";i:18;s:14:\"node/36/delete\";i:19;s:7:\"node/15\";i:20;s:12:\"node/15/edit\";i:21;s:14:\"node/15/delete\";i:22;s:7:\"node/23\";i:23;s:12:\"node/23/edit\";i:24;s:14:\"node/23/delete\";i:25;s:7:\"node/20\";i:26;s:12:\"node/20/edit\";i:27;s:14:\"node/20/delete\";i:28;s:7:\"node/13\";i:29;s:12:\"node/13/edit\";i:30;s:14:\"node/13/delete\";i:31;s:7:\"node/28\";i:32;s:12:\"node/28/edit\";i:33;s:14:\"node/28/delete\";i:34;s:7:\"node/33\";i:35;s:12:\"node/33/edit\";i:36;s:14:\"node/33/delete\";i:37;s:7:\"node/30\";i:38;s:12:\"node/30/edit\";i:39;s:14:\"node/30/delete\";i:40;s:7:\"node/26\";i:41;s:12:\"node/26/edit\";i:42;s:14:\"node/26/delete\";i:43;s:7:\"node/25\";i:44;s:12:\"node/25/edit\";i:45;s:14:\"node/25/delete\";i:46;s:7:\"node/12\";i:47;s:12:\"node/12/edit\";i:48;s:14:\"node/12/delete\";i:49;s:7:\"node/17\";i:50;s:12:\"node/17/edit\";i:51;s:14:\"node/17/delete\";i:52;s:7:\"node/18\";i:53;s:12:\"node/18/edit\";i:54;s:14:\"node/18/delete\";i:55;s:7:\"node/21\";i:56;s:12:\"node/21/edit\";i:57;s:14:\"node/21/delete\";i:58;s:7:\"node/22\";i:59;s:12:\"node/22/edit\";i:60;s:14:\"node/22/delete\";i:61;s:7:\"node/14\";i:62;s:12:\"node/14/edit\";i:63;s:14:\"node/14/delete\";i:64;s:7:\"node/24\";i:65;s:12:\"node/24/edit\";i:66;s:14:\"node/24/delete\";i:67;s:7:\"node/19\";i:68;s:12:\"node/19/edit\";i:69;s:14:\"node/19/delete\";i:70;s:6:\"node/1\";i:71;s:11:\"node/1/edit\";i:72;s:13:\"node/1/delete\";}',1401801658,1401715258,1),('admin/modules','a:2:{i:0;s:14:\"node/add/forum\";i:1;s:8:\"node/add\";}',1401800094,1401713694,1),('admin/modules/uninstall','a:1:{i:0;s:8:\"node/add\";}',1401800102,1401713702,1),('admin/modules/uninstall/confirm','a:1:{i:0;s:8:\"node/add\";}',1401800112,1401713712,1),('admin/reports','a:1:{i:0;s:8:\"node/add\";}',1401800255,1401713855,1),('admin/reports/status','a:1:{i:0;s:8:\"node/add\";}',1401800258,1401713858,1),('admin/reports/updates','a:1:{i:0;s:8:\"node/add\";}',1401803846,1401717446,1),('batch','a:1:{i:0;s:8:\"node/add\";}',1401800267,1401713867,1),('node','a:27:{i:0;s:7:\"node/19\";i:1;s:21:\"node/add/bloomrequest\";i:2;s:6:\"node/1\";i:3;s:11:\"node/1/edit\";i:4;s:13:\"node/1/delete\";i:5;s:18:\"node/1/node_export\";i:6;s:7:\"node/40\";i:7;s:12:\"node/40/edit\";i:8;s:14:\"node/40/delete\";i:9;s:19:\"node/40/node_export\";i:10;s:7:\"node/39\";i:11;s:12:\"node/39/edit\";i:12;s:14:\"node/39/delete\";i:13;s:19:\"node/39/node_export\";i:14;s:7:\"node/38\";i:15;s:12:\"node/38/edit\";i:16;s:14:\"node/38/delete\";i:17;s:19:\"node/38/node_export\";i:18;s:7:\"node/37\";i:19;s:12:\"node/37/edit\";i:20;s:14:\"node/37/delete\";i:21;s:19:\"node/37/node_export\";i:22;s:7:\"node/36\";i:23;s:12:\"node/36/edit\";i:24;s:14:\"node/36/delete\";i:25;s:19:\"node/36/node_export\";i:26;s:8:\"node/add\";}',1401801627,1401715227,1),('node/12','a:15:{i:0;s:7:\"node/12\";i:1;s:7:\"node/19\";i:2;s:21:\"node/add/bloomrequest\";i:3;s:7:\"node/33\";i:4;s:7:\"node/13\";i:5;s:7:\"node/41\";i:6;s:7:\"node/24\";i:7;s:7:\"node/14\";i:8;s:7:\"node/30\";i:9;s:12:\"node/12/edit\";i:10;s:15:\"node/12/outline\";i:11;s:13:\"node/12/track\";i:12;s:19:\"node/12/node_export\";i:13;s:11:\"node/12/log\";i:14;s:8:\"node/add\";}',1401801636,1401715236,1),('node/19','a:12:{i:0;s:7:\"node/19\";i:1;s:21:\"node/add/bloomrequest\";i:2;s:7:\"node/12\";i:3;s:7:\"node/24\";i:4;s:7:\"node/14\";i:5;s:7:\"node/30\";i:6;s:12:\"node/19/edit\";i:7;s:15:\"node/19/outline\";i:8;s:13:\"node/19/track\";i:9;s:19:\"node/19/node_export\";i:10;s:11:\"node/19/log\";i:11;s:8:\"node/add\";}',1401801632,1401715232,1),('node/26','a:10:{i:0;s:7:\"node/26\";i:1;s:7:\"node/19\";i:2;s:21:\"node/add/bloomrequest\";i:3;s:12:\"node/26/edit\";i:4;s:15:\"node/26/outline\";i:5;s:13:\"node/26/track\";i:6;s:16:\"node/26/workflow\";i:7;s:19:\"node/26/node_export\";i:8;s:11:\"node/26/log\";i:9;s:8:\"node/add\";}',1401801682,1401715282,1),('node/26/delete','a:8:{i:0;s:7:\"node/26\";i:1;s:12:\"node/26/edit\";i:2;s:15:\"node/26/outline\";i:3;s:13:\"node/26/track\";i:4;s:16:\"node/26/workflow\";i:5;s:19:\"node/26/node_export\";i:6;s:11:\"node/26/log\";i:7;s:8:\"node/add\";}',1401801706,1401715306,1),('node/28','a:17:{i:0;s:7:\"node/28\";i:1;s:7:\"node/19\";i:2;s:7:\"node/12\";i:3;s:7:\"node/33\";i:4;s:21:\"node/add/bloomrequest\";i:5;s:18:\"node/add/hipaa-pii\";i:6;s:7:\"node/13\";i:7;s:7:\"node/41\";i:8;s:7:\"node/24\";i:9;s:7:\"node/14\";i:10;s:7:\"node/30\";i:11;s:12:\"node/28/edit\";i:12;s:15:\"node/28/outline\";i:13;s:13:\"node/28/track\";i:14;s:19:\"node/28/node_export\";i:15;s:11:\"node/28/log\";i:16;s:8:\"node/add\";}',1401803751,1401717351,1),('node/36','a:9:{i:0;s:7:\"node/36\";i:1;s:7:\"node/19\";i:2;s:21:\"node/add/bloomrequest\";i:3;s:12:\"node/36/edit\";i:4;s:15:\"node/36/outline\";i:5;s:13:\"node/36/track\";i:6;s:19:\"node/36/node_export\";i:7;s:11:\"node/36/log\";i:8;s:8:\"node/add\";}',1401803725,1401717325,1),('node/37','a:9:{i:0;s:7:\"node/37\";i:1;s:7:\"node/19\";i:2;s:21:\"node/add/bloomrequest\";i:3;s:12:\"node/37/edit\";i:4;s:15:\"node/37/outline\";i:5;s:13:\"node/37/track\";i:6;s:19:\"node/37/node_export\";i:7;s:11:\"node/37/log\";i:8;s:8:\"node/add\";}',1401803707,1401717307,1),('node/37/edit','a:7:{i:0;s:7:\"node/37\";i:1;s:12:\"node/37/edit\";i:2;s:15:\"node/37/outline\";i:3;s:13:\"node/37/track\";i:4;s:19:\"node/37/node_export\";i:5;s:11:\"node/37/log\";i:6;s:8:\"node/add\";}',1401803797,1401717397,1),('node/38/delete','a:8:{i:0;s:7:\"node/38\";i:1;s:12:\"node/38/edit\";i:2;s:15:\"node/38/outline\";i:3;s:13:\"node/38/track\";i:4;s:16:\"node/38/workflow\";i:5;s:19:\"node/38/node_export\";i:6;s:11:\"node/38/log\";i:7;s:8:\"node/add\";}',1401803694,1401717294,1),('node/39/delete','a:8:{i:0;s:7:\"node/39\";i:1;s:12:\"node/39/edit\";i:2;s:15:\"node/39/outline\";i:3;s:13:\"node/39/track\";i:4;s:16:\"node/39/workflow\";i:5;s:19:\"node/39/node_export\";i:6;s:11:\"node/39/log\";i:7;s:8:\"node/add\";}',1401803687,1401717287,1),('node/40/delete','a:9:{i:0;s:7:\"node/40\";i:1;s:12:\"node/40/edit\";i:2;s:15:\"node/40/outline\";i:3;s:13:\"node/40/track\";i:4;s:16:\"node/40/workflow\";i:5;s:19:\"node/40/node_export\";i:6;s:11:\"node/40/log\";i:7;s:7:\"node/26\";i:8;s:8:\"node/add\";}',1401802117,1401715717,1),('node/41','a:15:{i:0;s:7:\"node/41\";i:1;s:7:\"node/19\";i:2;s:7:\"node/12\";i:3;s:21:\"node/add/bloomrequest\";i:4;s:7:\"node/33\";i:5;s:7:\"node/13\";i:6;s:7:\"node/24\";i:7;s:7:\"node/14\";i:8;s:7:\"node/30\";i:9;s:12:\"node/41/edit\";i:10;s:15:\"node/41/outline\";i:11;s:13:\"node/41/track\";i:12;s:19:\"node/41/node_export\";i:13;s:11:\"node/41/log\";i:14;s:8:\"node/add\";}',1401801644,1401715244,1);
/*!40000 ALTER TABLE `cache_path` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-02 10:00:47

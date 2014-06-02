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
-- Table structure for table `block`
--

DROP TABLE IF EXISTS `block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block` (
  `bid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique block ID.',
  `module` varchar(64) NOT NULL DEFAULT '' COMMENT 'The module from which the block originates; for example, ’user’ for the Who’s Online block, and ’block’ for any custom blocks.',
  `delta` varchar(32) NOT NULL DEFAULT '0' COMMENT 'Unique ID for block within a module.',
  `theme` varchar(64) NOT NULL DEFAULT '' COMMENT 'The theme under which the block settings apply.',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Block enabled status. (1 = enabled, 0 = disabled)',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Block weight within region.',
  `region` varchar(64) NOT NULL DEFAULT '' COMMENT 'Theme region within which the block is set.',
  `custom` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Flag to indicate how users may control visibility of the block. (0 = Users cannot control, 1 = On by default, but can be hidden, 2 = Hidden by default, but can be shown)',
  `visibility` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Flag to indicate how to show blocks on pages. (0 = Show on all pages except listed pages, 1 = Show only on listed pages, 2 = Use custom PHP code to determine visibility)',
  `pages` text NOT NULL COMMENT 'Contents of the "Pages" block; contains either a list of paths on which to include/exclude the block or PHP code, depending on "visibility" setting.',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT 'Custom title for the block. (Empty string will use block default title, <none> will remove the title, text will cause block to use specified title.)',
  `cache` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Binary flag to indicate block cache mode. (-2: Custom cache, -1: Do not cache, 1: Cache per role, 2: Cache per user, 4: Cache per page, 8: Block cache global) See DRUPAL_CACHE_* constants in ../includes/common.inc for more detailed information.',
  PRIMARY KEY (`bid`),
  UNIQUE KEY `tmd` (`theme`,`module`,`delta`),
  KEY `list` (`theme`,`status`,`region`,`weight`,`module`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8 COMMENT='Stores block settings, such as region and visibility...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block`
--

LOCK TABLES `block` WRITE;
/*!40000 ALTER TABLE `block` DISABLE KEYS */;
INSERT INTO `block` VALUES (1,'system','main','bartik',1,0,'content',0,0,'','',-1),(2,'search','form','bartik',1,-1,'header',0,0,'','',-1),(3,'node','recent','seven',1,10,'dashboard_main',0,0,'','',-1),(4,'user','login','bartik',1,0,'footer_secondcolumn',0,0,'','',-1),(5,'system','navigation','bartik',0,0,'-1',0,0,'','',-1),(6,'system','powered-by','bartik',1,10,'footer',0,0,'','',-1),(7,'system','help','bartik',1,0,'help',0,0,'','',-1),(8,'system','main','seven',1,0,'content',0,0,'','',-1),(9,'system','help','seven',1,0,'help',0,0,'','',-1),(10,'user','login','seven',1,10,'content',0,0,'','',-1),(11,'user','new','seven',1,0,'dashboard_sidebar',0,0,'','',-1),(12,'search','form','seven',1,-10,'dashboard_sidebar',0,0,'','',-1),(13,'comment','recent','bartik',0,0,'-1',0,0,'','',1),(14,'node','syndicate','bartik',0,0,'-1',0,0,'','',-1),(15,'node','recent','bartik',0,0,'-1',0,0,'','',1),(16,'shortcut','shortcuts','bartik',0,0,'-1',0,0,'','',-1),(17,'system','management','bartik',0,0,'-1',0,0,'','',-1),(18,'system','user-menu','bartik',0,0,'-1',0,0,'','',-1),(19,'system','main-menu','bartik',0,0,'-1',0,0,'','',-1),(20,'user','new','bartik',0,0,'-1',0,0,'','',1),(21,'user','online','bartik',0,0,'-1',0,0,'','',-1),(22,'comment','recent','seven',1,0,'dashboard_inactive',0,0,'','',1),(23,'node','syndicate','seven',0,0,'-1',0,0,'','',-1),(24,'shortcut','shortcuts','seven',0,0,'-1',0,0,'','',-1),(25,'system','powered-by','seven',0,10,'-1',0,0,'','',-1),(26,'system','navigation','seven',0,0,'-1',0,0,'','',-1),(27,'system','management','seven',0,0,'-1',0,0,'','',-1),(28,'system','user-menu','seven',0,0,'-1',0,0,'','',-1),(29,'system','main-menu','seven',0,0,'-1',0,0,'','',-1),(30,'user','online','seven',1,0,'dashboard_inactive',0,0,'','',-1),(31,'book','navigation','bartik',0,0,'-1',0,0,'','',5),(32,'forum','active','bartik',0,0,'-1',0,0,'','',-2),(33,'forum','new','bartik',0,0,'-1',0,0,'','',-2),(34,'views','og_members-block_1','bartik',0,0,'-1',0,0,'','',-1),(35,'book','navigation','seven',0,0,'-1',0,0,'','',5),(36,'forum','active','seven',1,0,'dashboard_inactive',0,0,'','',-2),(37,'forum','new','seven',1,0,'dashboard_inactive',0,0,'','',-2),(38,'views','og_members-block_1','seven',0,0,'-1',0,0,'','',-1),(39,'context_ui','editor','bartik',0,0,'-1',0,0,'','',1),(40,'context_ui','editor','seven',0,0,'-1',0,0,'','',1),(41,'menu','features','bartik',0,0,'-1',0,0,'','',-1),(42,'menu','features','seven',0,0,'-1',0,0,'','',-1),(43,'menu_block','1','bartik',0,0,'-1',0,0,'','FAQs',-1),(44,'menu_block','1','seven',0,0,'-1',0,0,'','FAQs',-1),(47,'book','navigation','marinelli',0,0,'-1',0,0,'','',5),(48,'comment','recent','marinelli',0,0,'-1',0,0,'','',1),(49,'context_ui','editor','marinelli',0,0,'-1',0,0,'','',1),(50,'forum','active','marinelli',0,0,'-1',0,0,'','',-2),(51,'forum','new','marinelli',0,0,'-1',0,0,'','',-2),(52,'menu','features','marinelli',0,0,'-1',0,0,'','',-1),(54,'menu_block','1','marinelli',0,0,'-1',0,0,'','FAQs',-1),(55,'node','recent','marinelli',0,0,'-1',0,0,'','',1),(56,'node','syndicate','marinelli',0,0,'-1',0,0,'','',-1),(57,'search','form','marinelli',1,-1,'sidebar_first',0,0,'','',-1),(58,'shortcut','shortcuts','marinelli',0,0,'-1',0,0,'','',-1),(59,'system','help','marinelli',1,0,'topbar',0,0,'','',-1),(60,'system','main','marinelli',1,0,'content',0,0,'','',-1),(61,'system','main-menu','marinelli',0,0,'-1',0,0,'','',-1),(62,'system','management','marinelli',0,0,'-1',0,0,'','',-1),(63,'system','navigation','marinelli',0,0,'-1',0,0,'','',-1),(64,'system','powered-by','marinelli',1,10,'footer',0,0,'','',-1),(65,'system','user-menu','marinelli',0,0,'-1',0,0,'','',-1),(66,'user','login','marinelli',1,0,'sidebar_first',0,0,'','',-1),(67,'user','new','marinelli',0,0,'-1',0,0,'','',1),(68,'user','online','marinelli',0,0,'-1',0,0,'','',-1),(69,'views','og_members-block_1','marinelli',0,0,'-1',0,0,'','',-1),(70,'book','navigation','bloomtheme',0,0,'-1',0,0,'','',5),(71,'comment','recent','bloomtheme',0,0,'-1',0,0,'','',1),(72,'context_ui','editor','bloomtheme',0,0,'-1',0,0,'','',1),(73,'forum','active','bloomtheme',0,0,'-1',0,0,'','',-2),(74,'forum','new','bloomtheme',0,0,'-1',0,0,'','',-2),(75,'menu','features','bloomtheme',0,0,'-1',0,0,'','',-1),(77,'menu_block','1','bloomtheme',0,0,'-1',0,0,'','FAQs',-1),(78,'node','recent','bloomtheme',0,0,'-1',0,0,'','',1),(79,'node','syndicate','bloomtheme',0,0,'-1',0,0,'','',-1),(80,'search','form','bloomtheme',1,-16,'sidebar_first',0,0,'','',-1),(81,'shortcut','shortcuts','bloomtheme',0,0,'-1',0,0,'','',-1),(82,'system','help','bloomtheme',1,-15,'sidebar_first',0,0,'','',-1),(83,'system','main','bloomtheme',1,0,'content',0,0,'','',-1),(84,'system','main-menu','bloomtheme',0,0,'-1',0,0,'','',-1),(85,'system','management','bloomtheme',0,0,'-1',0,0,'','',-1),(86,'system','navigation','bloomtheme',0,0,'-1',0,0,'','',-1),(87,'system','powered-by','bloomtheme',1,10,'footer',0,0,'','',-1),(88,'system','user-menu','bloomtheme',0,0,'-1',0,0,'','',-1),(89,'user','login','bloomtheme',1,-16,'triptych_last',0,0,'','',-1),(90,'user','new','bloomtheme',0,0,'-1',0,0,'','',1),(91,'user','online','bloomtheme',0,0,'-1',0,0,'','',-1),(92,'views','og_members-block_1','bloomtheme',0,0,'-1',0,0,'','',-1),(93,'book','navigation','adaptivetheme_subtheme',0,0,'-1',0,0,'','',5),(94,'comment','recent','adaptivetheme_subtheme',0,0,'-1',0,0,'','',1),(95,'context_ui','editor','adaptivetheme_subtheme',0,0,'-1',0,0,'','',1),(96,'forum','active','adaptivetheme_subtheme',0,0,'-1',0,0,'','',-2),(97,'forum','new','adaptivetheme_subtheme',0,0,'-1',0,0,'','',-2),(98,'menu','features','adaptivetheme_subtheme',0,0,'-1',0,0,'','',-1),(100,'menu_block','1','adaptivetheme_subtheme',0,0,'-1',0,0,'','FAQs',-1),(101,'node','recent','adaptivetheme_subtheme',0,0,'-1',0,0,'','',1),(102,'node','syndicate','adaptivetheme_subtheme',0,0,'-1',0,0,'','',-1),(103,'search','form','adaptivetheme_subtheme',1,-1,'sidebar_first',0,0,'','',-1),(104,'shortcut','shortcuts','adaptivetheme_subtheme',0,0,'-1',0,0,'','',-1),(105,'system','help','adaptivetheme_subtheme',1,0,'sidebar_first',0,0,'','',-1),(106,'system','main','adaptivetheme_subtheme',1,0,'content',0,0,'','',-1),(107,'system','main-menu','adaptivetheme_subtheme',0,0,'-1',0,0,'','',-1),(108,'system','management','adaptivetheme_subtheme',0,0,'-1',0,0,'','',-1),(109,'system','navigation','adaptivetheme_subtheme',0,0,'-1',0,0,'','',-1),(110,'system','powered-by','adaptivetheme_subtheme',1,10,'footer',0,0,'','',-1),(111,'system','user-menu','adaptivetheme_subtheme',0,0,'-1',0,0,'','',-1),(112,'user','login','adaptivetheme_subtheme',1,0,'sidebar_first',0,0,'','',-1),(113,'user','new','adaptivetheme_subtheme',0,0,'-1',0,0,'','',1),(114,'user','online','adaptivetheme_subtheme',0,0,'-1',0,0,'','',-1),(115,'views','og_members-block_1','adaptivetheme_subtheme',0,0,'-1',0,0,'','',-1),(116,'book','navigation','zen',0,0,'-1',0,0,'','',5),(117,'comment','recent','zen',0,0,'-1',0,0,'','',1),(118,'context_ui','editor','zen',0,0,'-1',0,0,'','',1),(119,'forum','active','zen',0,0,'-1',0,0,'','',-2),(120,'forum','new','zen',0,0,'-1',0,0,'','',-2),(121,'menu','features','zen',0,0,'-1',0,0,'','',-1),(123,'menu_block','1','zen',0,0,'-1',0,0,'','FAQs',-1),(124,'node','recent','zen',0,0,'-1',0,0,'','',1),(125,'node','syndicate','zen',0,0,'-1',0,0,'','',-1),(126,'search','form','zen',1,-1,'sidebar_first',0,0,'','',-1),(127,'shortcut','shortcuts','zen',0,0,'-1',0,0,'','',-1),(128,'system','help','zen',1,0,'sidebar_first',0,0,'','',-1),(129,'system','main','zen',1,0,'content',0,0,'','',-1),(130,'system','main-menu','zen',0,0,'-1',0,0,'','',-1),(131,'system','management','zen',0,0,'-1',0,0,'','',-1),(132,'system','navigation','zen',0,0,'-1',0,0,'','',-1),(133,'system','powered-by','zen',1,10,'footer',0,0,'','',-1),(134,'system','user-menu','zen',0,0,'-1',0,0,'','',-1),(135,'user','login','zen',1,0,'sidebar_first',0,0,'','',-1),(136,'user','new','zen',0,0,'-1',0,0,'','',1),(137,'user','online','zen',0,0,'-1',0,0,'','',-1),(138,'views','og_members-block_1','zen',0,0,'-1',0,0,'','',-1),(196,'menu_block','2','bartik',1,0,'sidebar_first',0,0,'','',-1),(197,'menu_block','2','bloomtheme',0,0,'-1',0,0,'','',-1),(198,'menu_block','2','seven',0,0,'-1',0,0,'','',-1);
/*!40000 ALTER TABLE `block` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-02 10:00:45

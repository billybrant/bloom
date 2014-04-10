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
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique item ID.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The queue name.',
  `data` longblob COMMENT 'The arbitrary data for the item.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp when the claim lease expires on the item.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp when the item was created.',
  PRIMARY KEY (`item_id`),
  KEY `name_created` (`name`,`created`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='Stores items in queues.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
INSERT INTO `queue` VALUES (11,'update_fetch_tasks','a:8:{s:4:\"name\";s:15:\"entityreference\";s:4:\"info\";a:6:{s:4:\"name\";s:16:\"Entity Reference\";s:7:\"package\";s:6:\"Fields\";s:7:\"version\";s:7:\"7.x-1.1\";s:7:\"project\";s:15:\"entityreference\";s:9:\"datestamp\";s:10:\"1384973110\";s:16:\"_info_file_ctime\";i:1397051017;}s:9:\"datestamp\";s:10:\"1384973110\";s:8:\"includes\";a:1:{s:15:\"entityreference\";s:16:\"Entity Reference\";}s:12:\"project_type\";s:6:\"module\";s:14:\"project_status\";b:1;s:10:\"sub_themes\";a:0:{}s:11:\"base_themes\";a:0:{}}',0,1397142798),(12,'update_fetch_tasks','a:8:{s:4:\"name\";s:11:\"field_group\";s:4:\"info\";a:6:{s:4:\"name\";s:10:\"Fieldgroup\";s:7:\"package\";s:6:\"Fields\";s:7:\"version\";s:7:\"7.x-1.3\";s:7:\"project\";s:11:\"field_group\";s:9:\"datestamp\";s:10:\"1380124361\";s:16:\"_info_file_ctime\";i:1396982268;}s:9:\"datestamp\";s:10:\"1380124361\";s:8:\"includes\";a:1:{s:11:\"field_group\";s:10:\"Fieldgroup\";}s:12:\"project_type\";s:6:\"module\";s:14:\"project_status\";b:1;s:10:\"sub_themes\";a:0:{}s:11:\"base_themes\";a:0:{}}',0,1397142798),(13,'update_fetch_tasks','a:8:{s:4:\"name\";s:16:\"field_validation\";s:4:\"info\";a:6:{s:4:\"name\";s:16:\"Field Validation\";s:7:\"package\";s:6:\"Fields\";s:7:\"version\";s:7:\"7.x-2.4\";s:7:\"project\";s:16:\"field_validation\";s:9:\"datestamp\";s:10:\"1390724605\";s:16:\"_info_file_ctime\";i:1397051574;}s:9:\"datestamp\";s:10:\"1390724605\";s:8:\"includes\";a:4:{s:16:\"field_validation\";s:16:\"Field Validation\";s:23:\"field_validation_extras\";s:23:\"Field validation extras\";s:19:\"field_validation_ui\";s:19:\"Field Validation UI\";s:19:\"property_validation\";s:19:\"Property Validation\";}s:12:\"project_type\";s:6:\"module\";s:14:\"project_status\";b:1;s:10:\"sub_themes\";a:0:{}s:11:\"base_themes\";a:0:{}}',0,1397142798),(14,'update_fetch_tasks','a:8:{s:4:\"name\";s:2:\"og\";s:4:\"info\";a:6:{s:4:\"name\";s:14:\"Organic groups\";s:7:\"package\";s:14:\"Organic groups\";s:7:\"version\";s:7:\"7.x-2.6\";s:7:\"project\";s:2:\"og\";s:9:\"datestamp\";s:10:\"1395056649\";s:16:\"_info_file_ctime\";i:1396982346;}s:9:\"datestamp\";s:10:\"1395056649\";s:8:\"includes\";a:6:{s:2:\"og\";s:14:\"Organic groups\";s:9:\"og_access\";s:29:\"Organic groups access control\";s:10:\"og_context\";s:22:\"Organic groups context\";s:15:\"og_field_access\";s:27:\"Organic groups field access\";s:11:\"og_register\";s:23:\"Organic groups register\";s:5:\"og_ui\";s:17:\"Organic groups UI\";}s:12:\"project_type\";s:6:\"module\";s:14:\"project_status\";b:1;s:10:\"sub_themes\";a:0:{}s:11:\"base_themes\";a:0:{}}',0,1397142798),(15,'update_fetch_tasks','a:8:{s:4:\"name\";s:5:\"rules\";s:4:\"info\";a:6:{s:4:\"name\";s:5:\"Rules\";s:7:\"package\";s:5:\"Rules\";s:7:\"version\";s:7:\"7.x-2.6\";s:7:\"project\";s:5:\"rules\";s:9:\"datestamp\";s:10:\"1383063052\";s:16:\"_info_file_ctime\";i:1396982122;}s:9:\"datestamp\";s:10:\"1383063052\";s:8:\"includes\";a:3:{s:5:\"rules\";s:5:\"Rules\";s:11:\"rules_admin\";s:8:\"Rules UI\";s:15:\"rules_scheduler\";s:15:\"Rules Scheduler\";}s:12:\"project_type\";s:6:\"module\";s:14:\"project_status\";b:1;s:10:\"sub_themes\";a:0:{}s:11:\"base_themes\";a:0:{}}',0,1397142798),(16,'update_fetch_tasks','a:8:{s:4:\"name\";s:11:\"sliderfield\";s:4:\"info\";a:6:{s:4:\"name\";s:12:\"Slider Field\";s:7:\"package\";s:6:\"Fields\";s:7:\"version\";s:14:\"7.x-2.0-alpha4\";s:7:\"project\";s:11:\"sliderfield\";s:9:\"datestamp\";s:10:\"1370427953\";s:16:\"_info_file_ctime\";i:1396982177;}s:9:\"datestamp\";s:10:\"1370427953\";s:8:\"includes\";a:1:{s:11:\"sliderfield\";s:12:\"Slider Field\";}s:12:\"project_type\";s:6:\"module\";s:14:\"project_status\";b:1;s:10:\"sub_themes\";a:0:{}s:11:\"base_themes\";a:0:{}}',0,1397142798),(17,'update_fetch_tasks','a:8:{s:4:\"name\";s:5:\"views\";s:4:\"info\";a:6:{s:4:\"name\";s:5:\"Views\";s:7:\"package\";s:5:\"Views\";s:7:\"version\";s:7:\"7.x-3.7\";s:7:\"project\";s:5:\"views\";s:9:\"datestamp\";s:10:\"1365499236\";s:16:\"_info_file_ctime\";i:1396982292;}s:9:\"datestamp\";s:10:\"1365499236\";s:8:\"includes\";a:2:{s:5:\"views\";s:5:\"Views\";s:8:\"views_ui\";s:8:\"Views UI\";}s:12:\"project_type\";s:6:\"module\";s:14:\"project_status\";b:1;s:10:\"sub_themes\";a:0:{}s:11:\"base_themes\";a:0:{}}',0,1397142798),(18,'update_fetch_tasks','a:8:{s:4:\"name\";s:17:\"views_data_export\";s:4:\"info\";a:6:{s:4:\"name\";s:17:\"Views Data Export\";s:7:\"package\";s:5:\"Views\";s:7:\"version\";s:13:\"7.x-3.0-beta7\";s:7:\"project\";s:17:\"views_data_export\";s:9:\"datestamp\";s:10:\"1386882544\";s:16:\"_info_file_ctime\";i:1396982310;}s:9:\"datestamp\";s:10:\"1386882544\";s:8:\"includes\";a:1:{s:17:\"views_data_export\";s:17:\"Views Data Export\";}s:12:\"project_type\";s:6:\"module\";s:14:\"project_status\";b:1;s:10:\"sub_themes\";a:0:{}s:11:\"base_themes\";a:0:{}}',0,1397142798),(19,'update_fetch_tasks','a:8:{s:4:\"name\";s:8:\"workflow\";s:4:\"info\";a:6:{s:4:\"name\";s:12:\"Workflow API\";s:7:\"package\";s:8:\"Workflow\";s:7:\"version\";s:7:\"7.x-2.2\";s:7:\"project\";s:8:\"workflow\";s:9:\"datestamp\";s:10:\"1394875406\";s:16:\"_info_file_ctime\";i:1396982102;}s:9:\"datestamp\";s:10:\"1394875406\";s:8:\"includes\";a:12:{s:8:\"workflow\";s:12:\"Workflow API\";s:15:\"workflow_access\";s:15:\"Workflow access\";s:16:\"workflow_actions\";s:29:\"Workflow actions and triggers\";s:17:\"workflow_admin_ui\";s:11:\"Workflow UI\";s:16:\"workflow_cleanup\";s:17:\"Workflow Clean Up\";s:15:\"workflow_revert\";s:15:\"Workflow Revert\";s:14:\"workflow_rules\";s:14:\"Workflow Rules\";s:19:\"workflow_search_api\";s:24:\"Workflow Node Search API\";s:12:\"workflow_vbo\";s:12:\"Workflow VBO\";s:14:\"workflow_views\";s:14:\"Workflow views\";s:13:\"workflowfield\";s:14:\"Workflow Field\";s:12:\"workflownode\";s:13:\"Workflow Node\";}s:12:\"project_type\";s:6:\"module\";s:14:\"project_status\";b:1;s:10:\"sub_themes\";a:0:{}s:11:\"base_themes\";a:0:{}}',0,1397142798);
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-10 11:54:41

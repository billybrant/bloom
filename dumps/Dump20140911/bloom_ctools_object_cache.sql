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
-- Table structure for table `ctools_object_cache`
--

DROP TABLE IF EXISTS `ctools_object_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctools_object_cache` (
  `sid` varchar(64) NOT NULL COMMENT 'The session ID this cache object belongs to.',
  `name` varchar(128) NOT NULL COMMENT 'The name of the object this cache is attached to.',
  `obj` varchar(32) NOT NULL COMMENT 'The type of the object this cache is attached to; this essentially represents the owner so that several sub-systems can use this cache.',
  `updated` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The time this cache was created or updated.',
  `data` longblob COMMENT 'Serialized data being stored.',
  PRIMARY KEY (`sid`,`obj`,`name`),
  KEY `updated` (`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A special cache used to store objects that are being...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctools_object_cache`
--

LOCK TABLES `ctools_object_cache` WRITE;
/*!40000 ALTER TABLE `ctools_object_cache` DISABLE KEYS */;
INSERT INTO `ctools_object_cache` VALUES ('8y5-xLZoxWDvREGLwHz3oUwf8rbfYupFX8GwODTSzPc','eandesymptoms','view',1409935164,'O:4:\"view\":51:{s:8:\"db_table\";s:10:\"views_view\";s:10:\"base_table\";s:18:\"taxonomy_term_data\";s:10:\"base_field\";s:3:\"tid\";s:4:\"name\";s:13:\"eandesymptoms\";s:3:\"vid\";s:3:\"new\";s:11:\"description\";s:0:\"\";s:3:\"tag\";s:7:\"default\";s:10:\"human_name\";s:20:\"Eye and Ear Symptoms\";s:4:\"core\";s:4:\"7.31\";s:11:\"api_version\";N;s:8:\"disabled\";N;s:5:\"built\";b:0;s:8:\"executed\";b:0;s:7:\"editing\";b:0;s:4:\"args\";a:0:{}s:10:\"build_info\";a:0:{}s:8:\"use_ajax\";b:0;s:6:\"result\";a:0:{}s:12:\"current_page\";N;s:14:\"items_per_page\";N;s:6:\"offset\";N;s:10:\"total_rows\";N;s:17:\"attachment_before\";s:0:\"\";s:16:\"attachment_after\";s:0:\"\";s:12:\"exposed_data\";a:0:{}s:13:\"exposed_input\";a:0:{}s:17:\"exposed_raw_input\";a:0:{}s:8:\"old_view\";a:0:{}s:12:\"parent_views\";a:0:{}s:13:\"is_attachment\";N;s:5:\"query\";N;s:7:\"display\";a:2:{s:7:\"default\";O:13:\"views_display\":7:{s:15:\"display_options\";a:12:{s:5:\"query\";a:2:{s:4:\"type\";s:11:\"views_query\";s:7:\"options\";a:0:{}}s:6:\"access\";a:1:{s:4:\"type\";s:4:\"perm\";}s:5:\"cache\";a:1:{s:4:\"type\";s:4:\"none\";}s:12:\"exposed_form\";a:1:{s:4:\"type\";s:5:\"basic\";}s:5:\"pager\";a:2:{s:4:\"type\";s:4:\"full\";s:7:\"options\";a:1:{s:14:\"items_per_page\";s:2:\"10\";}}s:12:\"style_plugin\";s:9:\"jump_menu\";s:10:\"row_plugin\";s:6:\"fields\";s:6:\"fields\";a:1:{s:4:\"name\";a:8:{s:2:\"id\";s:4:\"name\";s:5:\"table\";s:18:\"taxonomy_term_data\";s:5:\"field\";s:4:\"name\";s:5:\"label\";s:0:\"\";s:5:\"alter\";a:8:{s:10:\"alter_text\";i:0;s:9:\"make_link\";i:0;s:8:\"absolute\";i:0;s:4:\"trim\";i:0;s:13:\"word_boundary\";i:0;s:8:\"ellipsis\";i:0;s:10:\"strip_tags\";i:0;s:4:\"html\";i:0;}s:10:\"hide_empty\";i:0;s:10:\"empty_zero\";i:0;s:16:\"link_to_taxonomy\";i:1;}}s:7:\"filters\";a:1:{s:12:\"machine_name\";a:4:{s:2:\"id\";s:12:\"machine_name\";s:5:\"table\";s:19:\"taxonomy_vocabulary\";s:5:\"field\";s:12:\"machine_name\";s:5:\"value\";a:1:{s:5:\"icd_9\";s:5:\"icd_9\";}}}s:5:\"sorts\";a:0:{}s:5:\"title\";s:20:\"Eye and Ear Symptoms\";s:13:\"style_options\";a:8:{s:8:\"grouping\";a:0:{}s:4:\"path\";s:4:\"name\";s:4:\"hide\";i:0;s:4:\"text\";s:2:\"Go\";s:5:\"label\";s:0:\"\";s:6:\"choose\";s:10:\"- Choose -\";s:6:\"inline\";i:1;s:13:\"default_value\";i:0;}}s:8:\"db_table\";s:13:\"views_display\";s:3:\"vid\";i:0;s:2:\"id\";s:7:\"default\";s:13:\"display_title\";s:6:\"Master\";s:14:\"display_plugin\";s:7:\"default\";s:8:\"position\";i:0;}s:4:\"page\";O:13:\"views_display\":7:{s:15:\"display_options\";a:2:{s:5:\"query\";a:2:{s:4:\"type\";s:11:\"views_query\";s:7:\"options\";a:0:{}}s:4:\"path\";s:20:\"eye-and-ear-symptoms\";}s:8:\"db_table\";s:13:\"views_display\";s:3:\"vid\";i:0;s:2:\"id\";s:4:\"page\";s:13:\"display_title\";s:4:\"Page\";s:14:\"display_plugin\";s:4:\"page\";s:8:\"position\";i:0;}}s:12:\"style_plugin\";N;s:13:\"style_options\";N;s:9:\"row_index\";N;s:12:\"override_url\";N;s:13:\"override_path\";N;s:13:\"base_database\";N;s:5:\"field\";N;s:8:\"argument\";N;s:4:\"sort\";N;s:6:\"filter\";N;s:12:\"relationship\";N;s:6:\"header\";N;s:6:\"footer\";N;s:5:\"empty\";N;s:19:\"localization_plugin\";O:30:\"views_plugin_localization_none\":9:{s:9:\"translate\";b:0;s:14:\"export_strings\";a:0:{}s:4:\"view\";R:1;s:7:\"display\";N;s:11:\"plugin_type\";s:12:\"localization\";s:11:\"plugin_name\";s:4:\"none\";s:7:\"options\";a:0:{}s:10:\"definition\";a:11:{s:5:\"title\";s:4:\"None\";s:4:\"help\";s:42:\"Do not pass admin strings for translation.\";s:7:\"handler\";s:30:\"views_plugin_localization_none\";s:10:\"help topic\";s:17:\"localization-none\";s:6:\"module\";s:5:\"views\";s:10:\"theme path\";s:29:\"sites/all/modules/views/theme\";s:10:\"theme file\";s:9:\"theme.inc\";s:4:\"path\";s:31:\"sites/all/modules/views/plugins\";s:4:\"file\";s:34:\"views_plugin_localization_none.inc\";s:6:\"parent\";s:6:\"parent\";s:4:\"name\";s:4:\"none\";}s:9:\"is_plugin\";b:1;}s:14:\"display_errors\";N;s:7:\"changed\";b:1;s:15:\"changed_display\";a:2:{s:7:\"default\";b:1;s:4:\"page\";b:1;}s:5:\"stack\";a:0:{}}');
/*!40000 ALTER TABLE `ctools_object_cache` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-11 13:45:35

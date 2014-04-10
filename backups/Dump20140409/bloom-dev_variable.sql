CREATE DATABASE  IF NOT EXISTS `bloom-dev` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bloom-dev`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: rit-wamp-dev    Database: bloom-dev
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
-- Table structure for table `variable`
--

DROP TABLE IF EXISTS `variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variable` (
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT 'The name of the variable.',
  `value` longblob NOT NULL COMMENT 'The value of the variable.',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Named variable/value pairs created by Drupal core or any...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variable`
--

LOCK TABLES `variable` WRITE;
/*!40000 ALTER TABLE `variable` DISABLE KEYS */;
INSERT INTO `variable` VALUES ('admin_theme','s:5:\"seven\";'),('book_allowed_types','a:1:{i:0;s:4:\"book\";}'),('book_child_type','s:4:\"book\";'),('clean_url','s:1:\"0\";'),('comment_page','i:0;'),('cron_key','s:43:\"ftv1d4Z8LioJzmyuSZlwMgL5NbjASTmZbSUnPRa61m4\";'),('cron_last','i:1397073265;'),('css_js_query_string','s:6:\"n3ro54\";'),('ctools_last_cron','i:1397062123;'),('date_api_version','s:3:\"7.2\";'),('date_default_timezone','s:16:\"America/New_York\";'),('drupal_http_request_fails','b:0;'),('drupal_private_key','s:43:\"p5BmAe3NZx4hcE46cYU1cuUcvZA0L6xpHqKHOiLFSxw\";'),('entityreference:base-tables','a:12:{s:7:\"comment\";a:2:{i:0;s:7:\"comment\";i:1;s:3:\"cid\";}s:4:\"node\";a:2:{i:0;s:4:\"node\";i:1;s:3:\"nid\";}s:18:\"og_membership_type\";a:2:{i:0;s:18:\"og_membership_type\";i:1;s:2:\"id\";}s:13:\"og_membership\";a:2:{i:0;s:13:\"og_membership\";i:1;s:2:\"id\";}s:4:\"file\";a:2:{i:0;s:12:\"file_managed\";i:1;s:3:\"fid\";}s:13:\"taxonomy_term\";a:2:{i:0;s:18:\"taxonomy_term_data\";i:1;s:3:\"tid\";}s:19:\"taxonomy_vocabulary\";a:2:{i:0;s:19:\"taxonomy_vocabulary\";i:1;s:3:\"vid\";}s:4:\"user\";a:2:{i:0;s:5:\"users\";i:1;s:3:\"uid\";}s:8:\"Workflow\";a:2:{i:0;s:9:\"workflows\";i:1;s:3:\"wid\";}s:24:\"WorkflowConfigTransition\";a:2:{i:0;s:20:\"workflow_transitions\";i:1;s:3:\"tid\";}s:18:\"WorkflowTransition\";a:2:{i:0;s:21:\"workflow_node_history\";i:1;s:3:\"hid\";}s:12:\"rules_config\";a:2:{i:0;s:12:\"rules_config\";i:1;s:2:\"id\";}}'),('file_temporary_path','s:37:\"C:\\Users\\goedicw\\AppData\\Local\\Temp\\2\";'),('filter_fallback_format','s:10:\"plain_text\";'),('forum_nav_vocabulary','s:1:\"2\";'),('install_profile','s:8:\"standard\";'),('install_task','s:4:\"done\";'),('install_time','i:1396978578;'),('maintenance_mode','b:0;'),('menu_expanded','a:0:{}'),('menu_masks','a:53:{i:0;i:507;i:1;i:506;i:2;i:501;i:3;i:493;i:4;i:491;i:5;i:253;i:6;i:252;i:7;i:251;i:8;i:250;i:9;i:247;i:10;i:246;i:11;i:245;i:12;i:241;i:13;i:235;i:14;i:126;i:15;i:125;i:16;i:124;i:17;i:123;i:18;i:122;i:19;i:121;i:20;i:117;i:21;i:112;i:22;i:78;i:23;i:77;i:24;i:63;i:25;i:62;i:26;i:61;i:27;i:60;i:28;i:59;i:29;i:58;i:30;i:56;i:31;i:44;i:32;i:39;i:33;i:31;i:34;i:30;i:35;i:29;i:36;i:28;i:37;i:24;i:38;i:21;i:39;i:19;i:40;i:15;i:41;i:14;i:42;i:13;i:43;i:12;i:44;i:11;i:45;i:9;i:46;i:8;i:47;i:7;i:48;i:6;i:49;i:5;i:50;i:3;i:51;i:2;i:52;i:1;}'),('node_admin_theme','s:1:\"1\";'),('node_options_book','a:1:{i:0;s:6:\"status\";}'),('node_options_forum','a:1:{i:0;s:6:\"status\";}'),('node_options_page','a:1:{i:0;s:6:\"status\";}'),('node_submitted_page','b:0;'),('path_alias_whitelist','a:0:{}'),('rules_event_whitelist','a:0:{}'),('site_default_country','s:2:\"US\";'),('site_mail','s:24:\"goedicw@meei.harvard.edu\";'),('site_name','s:26:\"bloom-dev.meei.harvard.edu\";'),('statistics_day_timestamp','i:1397062122;'),('theme_default','s:6:\"bartik\";'),('update_last_check','i:1397051918;'),('update_notify_emails','a:1:{i:0;s:24:\"goedicw@meei.harvard.edu\";}'),('user_admin_role','s:1:\"3\";'),('user_pictures','s:1:\"1\";'),('user_picture_dimensions','s:9:\"1024x1024\";'),('user_picture_file_size','s:3:\"800\";'),('user_picture_style','s:9:\"thumbnail\";'),('user_register','i:2;');
/*!40000 ALTER TABLE `variable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-09 23:28:39

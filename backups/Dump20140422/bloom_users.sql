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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Primary Key: Unique user ID.',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT 'Unique user name.',
  `pass` varchar(128) NOT NULL DEFAULT '' COMMENT 'User’s password (hashed).',
  `mail` varchar(254) DEFAULT '' COMMENT 'User’s e-mail address.',
  `theme` varchar(255) NOT NULL DEFAULT '' COMMENT 'User’s default theme.',
  `signature` varchar(255) NOT NULL DEFAULT '' COMMENT 'User’s signature.',
  `signature_format` varchar(255) DEFAULT NULL COMMENT 'The filter_format.format of the signature.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp for when user was created.',
  `access` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp for previous time user accessed the site.',
  `login` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp for user’s last login.',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Whether the user is active(1) or blocked(0).',
  `timezone` varchar(32) DEFAULT NULL COMMENT 'User’s time zone.',
  `language` varchar(12) NOT NULL DEFAULT '' COMMENT 'User’s default language.',
  `picture` int(11) NOT NULL DEFAULT '0' COMMENT 'Foreign key: file_managed.fid of user’s picture.',
  `init` varchar(254) DEFAULT '' COMMENT 'E-mail address used for initial account creation.',
  `data` longblob COMMENT 'A serialized array of name value pairs that are related to the user. Any form values posted during user edit are stored and are loaded into the $user object during user_load(). Use of this field is discouraged and it will likely disappear in a future...',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `name` (`name`),
  KEY `access` (`access`),
  KEY `created` (`created`),
  KEY `mail` (`mail`),
  KEY `picture` (`picture`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores user data.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (0,'','','','','',NULL,0,0,0,0,NULL,'',0,'',NULL),(1,'admin','$S$DMeELwekUxyABxYwjsqT9LQXdC5UeZKlr0AXUdJj/H2Fdd/UuLMa','goedicw@meei.harvard.edu','','',NULL,1396978494,1397672633,1397659836,1,'America/New_York','',0,'goedicw@meei.harvard.edu','b:0;'),(31,'goedicw','$S$D.KPT5tq/SJ4ZCq6JphcZ1KROC5QcC7H6I1csZHuq61m8pXUzjId','billy@brant-interactive.com','','','filtered_html',1397175946,1398177538,1398175441,1,'America/New_York','',0,'billy@brant-interactive.com','a:6:{s:16:\"ckeditor_default\";s:1:\"t\";s:20:\"ckeditor_show_toggle\";s:1:\"t\";s:14:\"ckeditor_width\";s:4:\"100%\";s:13:\"ckeditor_lang\";s:2:\"en\";s:18:\"ckeditor_auto_lang\";s:1:\"t\";s:7:\"overlay\";i:1;}'),(33,'hilll','$S$DwWVG8zPp6EXBnEP065KI36j1hdbdWVSc.T6Ks7E7XppgBXulMMK','leo_hill@meei.harvard.edu','','','filtered_html',1397658240,1397658328,1397658328,1,'America/New_York','',0,'leo_hill@meei.harvard.edu','a:6:{s:16:\"ckeditor_default\";s:1:\"t\";s:20:\"ckeditor_show_toggle\";s:1:\"t\";s:14:\"ckeditor_width\";s:4:\"100%\";s:13:\"ckeditor_lang\";s:2:\"en\";s:18:\"ckeditor_auto_lang\";s:1:\"t\";s:7:\"overlay\";i:1;}'),(36,'chas','$S$D2ECBStVmiHphlxiYJa3zxs0h6lxc8G9BVNjQE953TRbc40tIUU5','charles_simmons@meei.harvard.edu','','','filtered_html',1397669080,1397669173,1397669173,1,'America/New_York','',0,'charles_simmons@meei.harvard.edu','a:6:{s:16:\"ckeditor_default\";s:1:\"t\";s:20:\"ckeditor_show_toggle\";s:1:\"t\";s:14:\"ckeditor_width\";s:4:\"100%\";s:13:\"ckeditor_lang\";s:2:\"en\";s:18:\"ckeditor_auto_lang\";s:1:\"t\";s:7:\"overlay\";i:1;}'),(37,'andersb','$S$DUGw0BChQdc7ZHYyVUEaNKiBX4e3C38uyECnNAqfRQUT.SvHg3kU','brian_anderson@meei.harvard.edu','','','filtered_html',1397672546,1397672676,1397672676,1,'America/New_York','',0,'brian_anderson@meei.harvard.edu','a:6:{s:16:\"ckeditor_default\";s:1:\"t\";s:20:\"ckeditor_show_toggle\";s:1:\"t\";s:14:\"ckeditor_width\";s:4:\"100%\";s:13:\"ckeditor_lang\";s:2:\"en\";s:18:\"ckeditor_auto_lang\";s:1:\"t\";s:7:\"overlay\";i:1;}');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-22 10:50:16

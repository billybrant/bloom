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
  `uuid` char(36) NOT NULL DEFAULT '' COMMENT 'The Universally Unique Identifier.',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `name` (`name`),
  KEY `access` (`access`),
  KEY `created` (`created`),
  KEY `mail` (`mail`),
  KEY `picture` (`picture`),
  KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores user data.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (0,'','','','','',NULL,0,0,0,0,NULL,'',0,'',NULL,'8342d4f4-0337-4564-b88d-77d2ea4fcf9d'),(1,'admin','$S$DZXdE98wWrH1uzi4N1CWHGpFispoxkVg4k2qLd7QunWuqvrThMdM','goedicw@meei.harvard.edu','','','filtered_html',1396978494,1410457184,1410372815,1,'America/New_York','',0,'goedicw@meei.harvard.edu','a:6:{s:16:\"ckeditor_default\";s:1:\"t\";s:20:\"ckeditor_show_toggle\";s:1:\"t\";s:14:\"ckeditor_width\";s:4:\"100%\";s:13:\"ckeditor_lang\";s:2:\"en\";s:18:\"ckeditor_auto_lang\";s:1:\"t\";s:7:\"overlay\";i:1;}','a7534ab5-619b-401b-b29f-08542acb4f72'),(147,'bloomer','$S$DXjiqVZh5f9b2huhw0yFqi9cM9Uc6MtjBP8LPKBwWWbka7.o0gko','nobody@gmail.com','','','filtered_html',1404238038,1409930393,1409930393,1,'America/New_York','',0,'nobody@gmail.com','a:5:{s:16:\"ckeditor_default\";s:1:\"t\";s:20:\"ckeditor_show_toggle\";s:1:\"t\";s:14:\"ckeditor_width\";s:4:\"100%\";s:13:\"ckeditor_lang\";s:2:\"en\";s:18:\"ckeditor_auto_lang\";s:1:\"t\";}','9121926a-9c83-41b2-825e-ced1c5e29eec'),(177,'slochestutr','$S$D6rBfkzrjANlvcWpDVPME7tEZsqm0FGu62Rx7JFnsr2j5C1AGlyC','slochestutr@bloom-dev.meei.harvard.edu.invalid','','',NULL,1407198130,0,0,1,NULL,'und',22,'','a:5:{s:16:\"ckeditor_default\";s:1:\"t\";s:20:\"ckeditor_show_toggle\";s:1:\"t\";s:14:\"ckeditor_width\";s:4:\"100%\";s:13:\"ckeditor_lang\";s:2:\"en\";s:18:\"ckeditor_auto_lang\";s:1:\"t\";}','64dd6b14-fb97-4eb8-8555-fb831be7d711'),(178,'slochestut','$S$DrJLD/Q3VluMY3lsCo3CD84tz3oR2ZYneaSR510FMDxsIzOveCqH','slochestut@bloom-dev.meei.harvard.edu.invalid','','',NULL,1406328898,0,0,1,NULL,'und',23,'','a:5:{s:16:\"ckeditor_default\";s:1:\"t\";s:20:\"ckeditor_show_toggle\";s:1:\"t\";s:14:\"ckeditor_width\";s:4:\"100%\";s:13:\"ckeditor_lang\";s:2:\"en\";s:18:\"ckeditor_auto_lang\";s:1:\"t\";}','b6980a15-917f-451e-98b6-8d3abf17643b'),(179,'baphanupre','$S$D5pdn.kW9CIF1WHeA8nFC9JRundJLPX6M1R8XqVdub3hqaeqHKbG','baphanupre@bloom-dev.meei.harvard.edu.invalid','','',NULL,1408285513,0,0,1,NULL,'und',24,'','a:5:{s:16:\"ckeditor_default\";s:1:\"t\";s:20:\"ckeditor_show_toggle\";s:1:\"t\";s:14:\"ckeditor_width\";s:4:\"100%\";s:13:\"ckeditor_lang\";s:2:\"en\";s:18:\"ckeditor_auto_lang\";s:1:\"t\";}','fb280aea-28fe-45d6-8fcc-0b38bef32819'),(180,'baphanupr','$S$Du73AJo0Q0aQLPJMcTsyPXJNVZWNnGZqgIltI3lCAC6Xcktu3UzT','baphanupr@bloom-dev.meei.harvard.edu.invalid','','',NULL,1405963910,0,0,1,NULL,'und',25,'','a:5:{s:16:\"ckeditor_default\";s:1:\"t\";s:20:\"ckeditor_show_toggle\";s:1:\"t\";s:14:\"ckeditor_width\";s:4:\"100%\";s:13:\"ckeditor_lang\";s:2:\"en\";s:18:\"ckeditor_auto_lang\";s:1:\"t\";}','28aea35a-c01a-4813-ba9c-8c090c68b2a9'),(181,'wragakacr','$S$DyVlTRWvaHkxb3LyknKnOpu24KkCEnZaZwWKaVbQpMVo0TSFsUWP','wragakacr@bloom-dev.meei.harvard.edu.invalid','','',NULL,1406661546,0,0,1,NULL,'und',26,'','a:5:{s:16:\"ckeditor_default\";s:1:\"t\";s:20:\"ckeditor_show_toggle\";s:1:\"t\";s:14:\"ckeditor_width\";s:4:\"100%\";s:13:\"ckeditor_lang\";s:2:\"en\";s:18:\"ckeditor_auto_lang\";s:1:\"t\";}','25ed6adf-99a2-4ff4-a343-2809b1f30f79'),(182,'wragakac','$S$DZ.XGUZrm.1yJmx8kW.YEW4nuhmUX7tujMSIdUHaL2l435sUMmw3','wragakac@bloom-dev.meei.harvard.edu.invalid','','',NULL,1405954416,0,0,1,NULL,'und',27,'','a:5:{s:16:\"ckeditor_default\";s:1:\"t\";s:20:\"ckeditor_show_toggle\";s:1:\"t\";s:14:\"ckeditor_width\";s:4:\"100%\";s:13:\"ckeditor_lang\";s:2:\"en\";s:18:\"ckeditor_auto_lang\";s:1:\"t\";}','94e6344e-59a9-45c5-93a1-8ff411fe1e2c'),(183,'tutanaje','$S$DjpY2GYm5dT4vw9AmAJgksI0PAf1O5Y/IKA93LdkfxfXWdx0EAjs','tutanaje@bloom-dev.meei.harvard.edu.invalid','','',NULL,1407638022,0,0,1,NULL,'und',28,'','a:5:{s:16:\"ckeditor_default\";s:1:\"t\";s:20:\"ckeditor_show_toggle\";s:1:\"t\";s:14:\"ckeditor_width\";s:4:\"100%\";s:13:\"ckeditor_lang\";s:2:\"en\";s:18:\"ckeditor_auto_lang\";s:1:\"t\";}','ab10d654-34c7-4407-a1be-6478d5fa4248'),(184,'tutanajet','$S$D9bQSgaDyyaahzdpNRaQYDUw3UcVjxrVdl2cJIhv8rEy8FDf55rl','tutanajet@bloom-dev.meei.harvard.edu.invalid','','',NULL,1406592921,0,0,1,NULL,'und',29,'','a:5:{s:16:\"ckeditor_default\";s:1:\"t\";s:20:\"ckeditor_show_toggle\";s:1:\"t\";s:14:\"ckeditor_width\";s:4:\"100%\";s:13:\"ckeditor_lang\";s:2:\"en\";s:18:\"ckeditor_auto_lang\";s:1:\"t\";}','2352a9b6-4d13-4711-9457-ddaef7f27569'),(185,'tutanajetra','$S$DVvZvq5dXszb8JDGl/sSzNT/HgchXsdqlYneSR6MzlJnJk0O/KjT','tutanajetra@bloom-dev.meei.harvard.edu.invalid','','',NULL,1408391509,0,0,1,NULL,'und',30,'','a:5:{s:16:\"ckeditor_default\";s:1:\"t\";s:20:\"ckeditor_show_toggle\";s:1:\"t\";s:14:\"ckeditor_width\";s:4:\"100%\";s:13:\"ckeditor_lang\";s:2:\"en\";s:18:\"ckeditor_auto_lang\";s:1:\"t\";}','68c0a35f-3939-4241-a4bf-bb94da715865'),(186,'fruswumutaw','$S$D0tUk39tcsWTiXCKu13RGJ2.WFkn5Fe.9Vcj9Km5WBXtev.40e9T','fruswumutaw@bloom-dev.meei.harvard.edu.invalid','','',NULL,1406333771,0,0,1,NULL,'und',31,'','a:5:{s:16:\"ckeditor_default\";s:1:\"t\";s:20:\"ckeditor_show_toggle\";s:1:\"t\";s:14:\"ckeditor_width\";s:4:\"100%\";s:13:\"ckeditor_lang\";s:2:\"en\";s:18:\"ckeditor_auto_lang\";s:1:\"t\";}','12046447-05d5-44c8-90cf-d4d80543b064'),(207,'goedsole','$S$D.Cyh3RLMUwbrbNuGCeJT3r5Kd.A0mhPYMPGOZOJHlJr1FgJ5qRQ','goedsole@gmail.com','','','full_html',1410356153,0,0,1,'America/New_York','',0,'goedsole@gmail.com','a:5:{s:16:\"ckeditor_default\";s:1:\"t\";s:20:\"ckeditor_show_toggle\";s:1:\"t\";s:14:\"ckeditor_width\";s:4:\"100%\";s:13:\"ckeditor_lang\";s:2:\"en\";s:18:\"ckeditor_auto_lang\";s:1:\"t\";}','a2fada4b-dbc0-42fb-8b8e-bd0c6db8c20b');
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

-- Dump completed on 2014-09-11 13:45:52

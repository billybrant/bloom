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
-- Table structure for table `ckeditor_settings`
--

DROP TABLE IF EXISTS `ckeditor_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ckeditor_settings` (
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT 'Name of the CKEditor profile',
  `settings` text COMMENT 'Profile settings',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores CKEditor profile settings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ckeditor_settings`
--

LOCK TABLES `ckeditor_settings` WRITE;
/*!40000 ALTER TABLE `ckeditor_settings` DISABLE KEYS */;
INSERT INTO `ckeditor_settings` VALUES ('CKEditor Global Profile','a:10:{s:4:\"skin\";s:5:\"moono\";s:13:\"ckeditor_path\";s:20:\"%m/ckeditor/ckeditor\";s:19:\"ckeditor_local_path\";s:0:\"\";s:21:\"ckeditor_plugins_path\";s:10:\"%m/plugins\";s:27:\"ckeditor_plugins_local_path\";s:0:\"\";s:13:\"ckfinder_path\";s:11:\"%m/ckfinder\";s:19:\"ckfinder_local_path\";s:0:\"\";s:18:\"ckeditor_aggregate\";s:1:\"f\";s:14:\"toolbar_wizard\";s:1:\"t\";s:11:\"loadPlugins\";a:0:{}}'),('Full','a:33:{s:2:\"ss\";s:1:\"2\";s:7:\"toolbar\";s:694:\"[\n    [\'Source\'],\n    [\'Cut\',\'Copy\',\'Paste\',\'PasteText\',\'PasteFromWord\',\'-\',\'SpellChecker\',\'Scayt\'],\n    [\'Undo\',\'Redo\',\'Find\',\'Replace\',\'-\',\'SelectAll\',\'RemoveFormat\'],\n    [\'Image\',\'Flash\',\'Table\',\'HorizontalRule\',\'Smiley\',\'SpecialChar\',\'Iframe\',\'IMCE\'],\n    \'/\',\n    [\'Bold\',\'Italic\',\'Underline\',\'Strike\',\'-\',\'Subscript\',\'Superscript\'],\n    [\'NumberedList\',\'BulletedList\',\'-\',\'Outdent\',\'Indent\',\'Blockquote\',\'CreateDiv\'],\n    [\'JustifyLeft\',\'JustifyCenter\',\'JustifyRight\',\'JustifyBlock\',\'-\',\'BidiLtr\',\'BidiRtl\'],\n    [\'Link\',\'Unlink\',\'Anchor\'],\n    [\'DrupalBreak\'],\n    \'/\',\n    [\'Format\',\'Font\',\'FontSize\'],\n    [\'TextColor\',\'BGColor\'],\n    [\'Maximize\',\'ShowBlocks\',\'Styles\',\'MediaEmbed\']\n]\";s:6:\"expand\";s:1:\"t\";s:7:\"default\";s:1:\"t\";s:11:\"show_toggle\";s:1:\"t\";s:7:\"uicolor\";s:7:\"default\";s:12:\"uicolor_user\";s:7:\"default\";s:5:\"width\";s:4:\"100%\";s:4:\"lang\";s:2:\"en\";s:9:\"auto_lang\";s:1:\"t\";s:18:\"language_direction\";s:7:\"default\";s:15:\"allowed_content\";s:1:\"t\";s:19:\"extraAllowedContent\";s:0:\"\";s:10:\"enter_mode\";s:1:\"p\";s:16:\"shift_enter_mode\";s:2:\"br\";s:11:\"font_format\";s:35:\"p;div;pre;address;h1;h2;h3;h4;h5;h6\";s:17:\"custom_formatting\";s:1:\"f\";s:10:\"formatting\";a:1:{s:25:\"custom_formatting_options\";a:6:{s:6:\"indent\";s:6:\"indent\";s:15:\"breakBeforeOpen\";s:15:\"breakBeforeOpen\";s:14:\"breakAfterOpen\";s:14:\"breakAfterOpen\";s:15:\"breakAfterClose\";s:15:\"breakAfterClose\";s:16:\"breakBeforeClose\";i:0;s:10:\"pre_indent\";i:0;}}s:8:\"css_mode\";s:4:\"none\";s:8:\"css_path\";s:0:\"\";s:9:\"css_style\";s:5:\"theme\";s:11:\"styles_path\";s:0:\"\";s:11:\"filebrowser\";s:4:\"imce\";s:17:\"filebrowser_image\";s:0:\"\";s:17:\"filebrowser_flash\";s:0:\"\";s:13:\"UserFilesPath\";s:5:\"%b%f/\";s:21:\"UserFilesAbsolutePath\";s:7:\"%d%b%f/\";s:21:\"forcePasteAsPlainText\";s:1:\"f\";s:13:\"html_entities\";s:1:\"f\";s:17:\"scayt_autoStartup\";s:1:\"f\";s:15:\"theme_config_js\";s:1:\"f\";s:7:\"js_conf\";s:0:\"\";s:11:\"loadPlugins\";a:1:{s:12:\"drupalbreaks\";a:5:{s:4:\"name\";s:12:\"drupalbreaks\";s:4:\"desc\";s:51:\"Plugin for inserting Drupal teaser and page breaks.\";s:4:\"path\";s:25:\"%plugin_dir%drupalbreaks/\";s:7:\"buttons\";a:1:{s:11:\"DrupalBreak\";a:2:{s:5:\"label\";s:11:\"DrupalBreak\";s:4:\"icon\";s:22:\"images/drupalbreak.png\";}}s:7:\"default\";s:1:\"t\";}}}');
/*!40000 ALTER TABLE `ckeditor_settings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-11 13:45:49

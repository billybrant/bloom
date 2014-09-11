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
-- Table structure for table `field_group`
--

DROP TABLE IF EXISTS `field_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a group',
  `identifier` varchar(255) NOT NULL DEFAULT '' COMMENT 'The unique string identifier for a group.',
  `group_name` varchar(32) NOT NULL DEFAULT '' COMMENT 'The name of this group.',
  `entity_type` varchar(32) NOT NULL DEFAULT '',
  `bundle` varchar(128) NOT NULL DEFAULT '',
  `mode` varchar(128) NOT NULL DEFAULT '',
  `parent_name` varchar(32) NOT NULL DEFAULT '' COMMENT 'The parent name for a group',
  `data` longblob NOT NULL COMMENT 'Serialized data containing the group properties that do not warrant a dedicated column.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifier` (`identifier`),
  KEY `group_name` (`group_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Table that contains field group entries and settings.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_group`
--

LOCK TABLES `field_group` WRITE;
/*!40000 ALTER TABLE `field_group` DISABLE KEYS */;
INSERT INTO `field_group` VALUES (1,'group_contact_info|node|hipaa_pii|form','group_contact_info','node','hipaa_pii','form','','a:5:{s:5:\"label\";s:12:\"Contact Info\";s:6:\"weight\";s:1:\"2\";s:8:\"children\";a:13:{i:0;s:16:\"field_first_name\";i:1;s:15:\"field_last_name\";i:2;s:20:\"field_address_line_1\";i:3;s:20:\"field_address_line_2\";i:4;s:10:\"field_city\";i:5;s:11:\"field_state\";i:6;s:9:\"field_zip\";i:7;s:16:\"field_home_phone\";i:8;s:18:\"field_mobile_phone\";i:9;s:16:\"field_work_phone\";i:10;s:9:\"field_fax\";i:11;s:20:\"field_personal_email\";i:12;s:16:\"field_work_email\";}s:11:\"format_type\";s:8:\"fieldset\";s:15:\"format_settings\";a:3:{s:5:\"label\";s:12:\"Contact Info\";s:17:\"instance_settings\";a:3:{s:15:\"required_fields\";i:1;s:7:\"classes\";s:0:\"\";s:11:\"description\";s:0:\"\";}s:9:\"formatter\";s:9:\"collapsed\";}}'),(3,'group_id_numbers|node|hipaa_pii|form','group_id_numbers','node','hipaa_pii','form','','a:5:{s:5:\"label\";s:10:\"ID Numbers\";s:6:\"weight\";s:1:\"3\";s:8:\"children\";a:10:{i:0;s:9:\"field_ssn\";i:1;s:27:\"field_medical_record_number\";i:2;s:32:\"field_health_plan_beneficiary_nu\";i:3;s:21:\"field_account_numbers\";i:4;s:32:\"field_certificate_license_number\";i:5;s:32:\"field_vehicle_identifiers_and_se\";i:6;s:32:\"field_device_identifiers_and_ser\";i:7;s:32:\"field_web_universal_resource_loc\";i:8;s:32:\"field_internet_protocol_ip_addre\";i:9;s:32:\"field__r_any_other_unique_identi\";}s:11:\"format_type\";s:8:\"fieldset\";s:15:\"format_settings\";a:3:{s:5:\"label\";s:10:\"ID Numbers\";s:17:\"instance_settings\";a:3:{s:15:\"required_fields\";i:1;s:7:\"classes\";s:0:\"\";s:11:\"description\";s:0:\"\";}s:9:\"formatter\";s:9:\"collapsed\";}}'),(4,'group_demographics|node|hipaa_pii|form','group_demographics','node','hipaa_pii','form','','a:5:{s:5:\"label\";s:12:\"Demographics\";s:6:\"weight\";s:1:\"4\";s:8:\"children\";a:3:{i:0;s:16:\"field_birth_date\";i:1;s:32:\"field_full_face_photographs_and_\";i:2;s:32:\"field_biometric_identifiers_incl\";}s:11:\"format_type\";s:8:\"fieldset\";s:15:\"format_settings\";a:3:{s:5:\"label\";s:12:\"Demographics\";s:17:\"instance_settings\";a:3:{s:15:\"required_fields\";i:1;s:7:\"classes\";s:0:\"\";s:11:\"description\";s:0:\"\";}s:9:\"formatter\";s:9:\"collapsed\";}}');
/*!40000 ALTER TABLE `field_group` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-11 13:45:32

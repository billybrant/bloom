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
-- Table structure for table `trigger_assignments`
--

DROP TABLE IF EXISTS `trigger_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trigger_assignments` (
  `hook` varchar(78) NOT NULL DEFAULT '' COMMENT 'Primary Key: The name of the internal Drupal hook; for example, node_insert.',
  `aid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Action’s actions.aid.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The weight of the trigger assignment in relation to other triggers.',
  PRIMARY KEY (`hook`,`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maps trigger to hook and operation assignments from...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trigger_assignments`
--

LOCK TABLES `trigger_assignments` WRITE;
/*!40000 ALTER TABLE `trigger_assignments` DISABLE KEYS */;
INSERT INTO `trigger_assignments` VALUES ('workflow-node-bloomrequest-1','101',1),('workflow-node-hipaa_pii-1','workflow_vbo_next_state_action',1),('workflow-node-hipaa_pii-2','workflow_vbo_next_state_action',1),('workflow-node-hipaa_pii-3','96',1);
/*!40000 ALTER TABLE `trigger_assignments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-08 11:12:49

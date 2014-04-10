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
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_permission` (
  `rid` int(10) unsigned NOT NULL COMMENT 'Foreign Key: role.rid.',
  `permission` varchar(128) NOT NULL DEFAULT '' COMMENT 'A single permission granted to the role identified by rid.',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT 'The module declaring the permission.',
  PRIMARY KEY (`rid`,`permission`),
  KEY `permission` (`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the permissions assigned to user roles.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission`
--

LOCK TABLES `role_permission` WRITE;
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
INSERT INTO `role_permission` VALUES (1,'access comments','comment'),(1,'access content','node'),(1,'participate in workflow','workflow_admin_ui'),(1,'use text format filtered_html','filter'),(2,'access comments','comment'),(2,'access content','node'),(2,'participate in workflow','workflow_admin_ui'),(2,'post comments','comment'),(2,'skip comment approval','comment'),(2,'use text format filtered_html','filter'),(3,'access administration pages','system'),(3,'access all views','views'),(3,'access comments','comment'),(3,'access content','node'),(3,'access content overview','node'),(3,'access contextual links','contextual'),(3,'access dashboard','dashboard'),(3,'access overlay','overlay'),(3,'access printer-friendly version','book'),(3,'access rules debug','rules'),(3,'access site in maintenance mode','system'),(3,'access site reports','system'),(3,'access statistics','statistics'),(3,'access toolbar','toolbar'),(3,'access user profiles','user'),(3,'access workflow summary views','workflow_views'),(3,'add content to books','book'),(3,'administer actions','system'),(3,'administer blocks','block'),(3,'administer book outlines','book'),(3,'administer comments','comment'),(3,'administer content types','node'),(3,'administer contexts','context_ui'),(3,'administer ctools access ruleset','ctools_access_ruleset'),(3,'administer custom content','ctools_custom_content'),(3,'administer date tools','date_tools'),(3,'administer fieldgroups','field_group'),(3,'administer filters','filter'),(3,'administer forums','forum'),(3,'administer group','og'),(3,'administer image styles','image'),(3,'administer menu','menu'),(3,'administer modules','system'),(3,'administer nodes','node'),(3,'administer page manager','page_manager'),(3,'administer permissions','user'),(3,'administer rules','rules'),(3,'administer search','search'),(3,'administer shortcuts','shortcut'),(3,'administer site configuration','system'),(3,'administer software updates','system'),(3,'administer statistics','statistics'),(3,'administer taxonomy','taxonomy'),(3,'administer themes','system'),(3,'administer url aliases','path'),(3,'administer users','user'),(3,'administer views','views'),(3,'administer workflow','workflow_admin_ui'),(3,'block IP addresses','system'),(3,'bypass node access','node'),(3,'bypass rules access','rules'),(3,'cancel account','user'),(3,'change own username','user'),(3,'context ajax block access','context_ui'),(3,'create article content','node'),(3,'create new books','book'),(3,'create page content','node'),(3,'create url aliases','path'),(3,'customize shortcut links','shortcut'),(3,'delete any article content','node'),(3,'delete any page content','node'),(3,'delete own article content','node'),(3,'delete own page content','node'),(3,'delete revisions','node'),(3,'delete terms in 1','taxonomy'),(3,'edit any article content','node'),(3,'edit any page content','node'),(3,'edit own article content','node'),(3,'edit own comments','comment'),(3,'edit own page content','node'),(3,'edit terms in 1','taxonomy'),(3,'execute comment_publish_action','actions_permissions'),(3,'execute comment_save_action','actions_permissions'),(3,'execute comment_unpublish_action','actions_permissions'),(3,'execute comment_unpublish_by_keyword_action','actions_permissions'),(3,'execute node_assign_owner_action','actions_permissions'),(3,'execute node_make_sticky_action','actions_permissions'),(3,'execute node_make_unsticky_action','actions_permissions'),(3,'execute node_promote_action','actions_permissions'),(3,'execute node_publish_action','actions_permissions'),(3,'execute node_save_action','actions_permissions'),(3,'execute node_unpromote_action','actions_permissions'),(3,'execute node_unpublish_action','actions_permissions'),(3,'execute node_unpublish_by_keyword_action','actions_permissions'),(3,'execute og_membership_delete_action','actions_permissions'),(3,'execute og_set_state_action','actions_permissions'),(3,'execute og_user_roles_action','actions_permissions'),(3,'execute system_block_ip_action','actions_permissions'),(3,'execute system_goto_action','actions_permissions'),(3,'execute system_message_action','actions_permissions'),(3,'execute system_send_email_action','actions_permissions'),(3,'execute user_block_user_action','actions_permissions'),(3,'execute views_bulk_operations_archive_action','actions_permissions'),(3,'execute views_bulk_operations_argument_selector_action','actions_permissions'),(3,'execute views_bulk_operations_delete_item','actions_permissions'),(3,'execute views_bulk_operations_delete_revision','actions_permissions'),(3,'execute views_bulk_operations_modify_action','actions_permissions'),(3,'execute views_bulk_operations_move_to_book_action','actions_permissions'),(3,'execute views_bulk_operations_remove_from_book_action','actions_permissions'),(3,'execute views_bulk_operations_script_action','actions_permissions'),(3,'execute views_bulk_operations_user_cancel_action','actions_permissions'),(3,'execute views_bulk_operations_user_roles_action','actions_permissions'),(3,'execute workflow_vbo_given_state_action','actions_permissions'),(3,'execute workflow_vbo_next_state_action','actions_permissions'),(3,'participate in workflow','workflow_admin_ui'),(3,'post comments','comment'),(3,'revert revisions','node'),(3,'revert workflow','workflow_revert'),(3,'schedule workflow transitions','workflow'),(3,'search content','search'),(3,'select account cancellation method','user'),(3,'show workflow state form','workflow'),(3,'skip comment approval','comment'),(3,'switch shortcut sets','shortcut'),(3,'use advanced search','search'),(3,'use bulk exporter','bulk_export'),(3,'use page manager','page_manager'),(3,'use PHP for title patterns','auto_nodetitle'),(3,'use text format filtered_html','filter'),(3,'use text format full_html','filter'),(3,'view date repeats','date_repeat_field'),(3,'view own unpublished content','node'),(3,'view post access counter','statistics'),(3,'view revisions','node'),(3,'view the administration theme','system');
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-10 11:54:40

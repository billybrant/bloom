-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: goedsole_bloom
-- Source Schemata: bloom
-- Created: Sat Aug 16 11:32:15 2014
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;;

-- ----------------------------------------------------------------------------
-- Schema goedsole_bloom
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `goedsole_bloom` ;
CREATE SCHEMA IF NOT EXISTS `goedsole_bloom` ;

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.accesslog
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`accesslog` (
  `aid` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique accesslog ID.',
  `sid` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'Browser session ID of user that visited page.',
  `title` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Title of page visited.',
  `path` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Internal path to page visited (relative to Drupal root.)',
  `url` TEXT NULL DEFAULT NULL COMMENT 'Referrer URI.',
  `hostname` VARCHAR(128) NULL DEFAULT NULL COMMENT 'Hostname of user that visited the page.',
  `uid` INT(10) UNSIGNED NULL DEFAULT '0' COMMENT 'User users.uid that visited the page.',
  `timer` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Time in milliseconds that the page took to load.',
  `timestamp` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Timestamp of when the page was visited.',
  PRIMARY KEY (`aid`),
  INDEX `accesslog_timestamp` (`timestamp` ASC),
  INDEX `uid` (`uid` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 4391
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores site access information for statistics.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.actions
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`actions` (
  `aid` VARCHAR(255) NOT NULL DEFAULT '0' COMMENT 'Primary Key: Unique actions ID.',
  `type` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The object that that action acts on (node, user, comment, system or custom types.)',
  `callback` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The callback function that executes when the action runs.',
  `parameters` LONGBLOB NOT NULL COMMENT 'Parameters to be passed to the callback function.',
  `label` VARCHAR(255) NOT NULL DEFAULT '0' COMMENT 'Label of the action.',
  PRIMARY KEY (`aid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores action information.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.advanced_help_index
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`advanced_help_index` (
  `sid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'The primary key to give to the search engine for this topic.',
  `module` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The module that owns this topic.',
  `topic` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The topic id.',
  `language` VARCHAR(12) NOT NULL DEFAULT '' COMMENT 'The language this search index relates to.',
  PRIMARY KEY (`sid`),
  INDEX `language` (`language` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores search index correlations for advanced help topics.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.authmap
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`authmap` (
  `aid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique authmap ID.',
  `uid` INT(11) NOT NULL DEFAULT '0' COMMENT 'User’s users.uid.',
  `authname` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'Unique authentication name.',
  `module` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'Module which is controlling the authentication.',
  PRIMARY KEY (`aid`),
  UNIQUE INDEX `authname` (`authname` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores distributed authentication mapping.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.batch
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`batch` (
  `bid` INT(10) UNSIGNED NOT NULL COMMENT 'Primary Key: Unique batch ID.',
  `token` VARCHAR(64) NOT NULL COMMENT 'A string token generated against the current user’s session id and the batch id, used to ensure that only the user who submitted the batch can effectively access it.',
  `timestamp` INT(11) NOT NULL COMMENT 'A Unix timestamp indicating when this batch was submitted for processing. Stale batches are purged at cron time.',
  `batch` LONGBLOB NULL DEFAULT NULL COMMENT 'A serialized array containing the processing data for the batch.',
  PRIMARY KEY (`bid`),
  INDEX `token` (`token` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores details about batches (processes that run in...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.block
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`block` (
  `bid` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique block ID.',
  `module` VARCHAR(64) NOT NULL DEFAULT '' COMMENT 'The module from which the block originates; for example, ’user’ for the Who’s Online block, and ’block’ for any custom blocks.',
  `delta` VARCHAR(32) NOT NULL DEFAULT '0' COMMENT 'Unique ID for block within a module.',
  `theme` VARCHAR(64) NOT NULL DEFAULT '' COMMENT 'The theme under which the block settings apply.',
  `status` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'Block enabled status. (1 = enabled, 0 = disabled)',
  `weight` INT(11) NOT NULL DEFAULT '0' COMMENT 'Block weight within region.',
  `region` VARCHAR(64) NOT NULL DEFAULT '' COMMENT 'Theme region within which the block is set.',
  `custom` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'Flag to indicate how users may control visibility of the block. (0 = Users cannot control, 1 = On by default, but can be hidden, 2 = Hidden by default, but can be shown)',
  `visibility` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'Flag to indicate how to show blocks on pages. (0 = Show on all pages except listed pages, 1 = Show only on listed pages, 2 = Use custom PHP code to determine visibility)',
  `pages` TEXT NOT NULL COMMENT 'Contents of the \"Pages\" block; contains either a list of paths on which to include/exclude the block or PHP code, depending on \"visibility\" setting.',
  `title` VARCHAR(64) NOT NULL DEFAULT '' COMMENT 'Custom title for the block. (Empty string will use block default title, <none> will remove the title, text will cause block to use specified title.)',
  `cache` TINYINT(4) NOT NULL DEFAULT '1' COMMENT 'Binary flag to indicate block cache mode. (-2: Custom cache, -1: Do not cache, 1: Cache per role, 2: Cache per user, 4: Cache per page, 8: Block cache global) See DRUPAL_CACHE_* constants in ../includes/common.inc for more detailed information.',
  PRIMARY KEY (`bid`),
  UNIQUE INDEX `tmd` (`theme` ASC, `module` ASC, `delta` ASC),
  INDEX `list` (`theme` ASC, `status` ASC, `region` ASC, `weight` ASC, `module` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 217
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores block settings, such as region and visibility...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.block_custom
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`block_custom` (
  `bid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'The block’s block.bid.',
  `body` LONGTEXT NULL DEFAULT NULL COMMENT 'Block contents.',
  `info` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'Block description.',
  `format` VARCHAR(255) NULL DEFAULT NULL COMMENT 'The filter_format.format of the block body.',
  PRIMARY KEY (`bid`),
  UNIQUE INDEX `info` (`info` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores contents of custom-made blocks.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.block_node_type
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`block_node_type` (
  `module` VARCHAR(64) NOT NULL COMMENT 'The block’s origin module, from block.module.',
  `delta` VARCHAR(32) NOT NULL COMMENT 'The block’s unique delta within module, from block.delta.',
  `type` VARCHAR(32) NOT NULL COMMENT 'The machine-readable name of this type from node_type.type.',
  PRIMARY KEY (`module`, `delta`, `type`),
  INDEX `type` (`type` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Sets up display criteria for blocks based on content types';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.block_role
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`block_role` (
  `module` VARCHAR(64) NOT NULL COMMENT 'The block’s origin module, from block.module.',
  `delta` VARCHAR(32) NOT NULL COMMENT 'The block’s unique delta within module, from block.delta.',
  `rid` INT(10) UNSIGNED NOT NULL COMMENT 'The user’s role ID from users_roles.rid.',
  PRIMARY KEY (`module`, `delta`, `rid`),
  INDEX `rid` (`rid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Sets up access permissions for blocks based on user roles';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.blocked_ips
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`blocked_ips` (
  `iid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: unique ID for IP addresses.',
  `ip` VARCHAR(40) NOT NULL DEFAULT '' COMMENT 'IP address',
  PRIMARY KEY (`iid`),
  INDEX `blocked_ip` (`ip` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores blocked IP addresses.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.book
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`book` (
  `mlid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The book page’s menu_links.mlid.',
  `nid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The book page’s node.nid.',
  `bid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The book ID is the book.nid of the top-level page.',
  PRIMARY KEY (`mlid`),
  UNIQUE INDEX `nid` (`nid` ASC),
  INDEX `bid` (`bid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores book outline information. Uniquely connects each...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.cache
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`cache` (
  `cid` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` LONGBLOB NULL DEFAULT NULL COMMENT 'A collection of data to cache.',
  `expire` INT(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` INT(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` SMALLINT(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  INDEX `expire` (`expire` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Generic cache table for caching things not separated out...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.cache_block
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`cache_block` (
  `cid` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` LONGBLOB NULL DEFAULT NULL COMMENT 'A collection of data to cache.',
  `expire` INT(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` INT(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` SMALLINT(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  INDEX `expire` (`expire` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Cache table for the Block module to store already built...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.cache_bootstrap
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`cache_bootstrap` (
  `cid` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` LONGBLOB NULL DEFAULT NULL COMMENT 'A collection of data to cache.',
  `expire` INT(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` INT(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` SMALLINT(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  INDEX `expire` (`expire` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Cache table for data required to bootstrap Drupal, may be...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.cache_entity_og_membership
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`cache_entity_og_membership` (
  `cid` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` LONGBLOB NULL DEFAULT NULL COMMENT 'A collection of data to cache.',
  `expire` INT(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` INT(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` SMALLINT(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  INDEX `expire` (`expire` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Cache table used to store og_membership entity records.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.cache_entity_og_membership_type
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`cache_entity_og_membership_type` (
  `cid` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` LONGBLOB NULL DEFAULT NULL COMMENT 'A collection of data to cache.',
  `expire` INT(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` INT(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` SMALLINT(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  INDEX `expire` (`expire` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Cache table used to store og_membership_type entity records.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.cache_field
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`cache_field` (
  `cid` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` LONGBLOB NULL DEFAULT NULL COMMENT 'A collection of data to cache.',
  `expire` INT(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` INT(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` SMALLINT(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  INDEX `expire` (`expire` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Generic cache table for caching things not separated out...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.cache_filter
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`cache_filter` (
  `cid` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` LONGBLOB NULL DEFAULT NULL COMMENT 'A collection of data to cache.',
  `expire` INT(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` INT(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` SMALLINT(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  INDEX `expire` (`expire` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Cache table for the Filter module to store already...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.cache_form
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`cache_form` (
  `cid` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` LONGBLOB NULL DEFAULT NULL COMMENT 'A collection of data to cache.',
  `expire` INT(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` INT(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` SMALLINT(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  INDEX `expire` (`expire` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Cache table for the form system to store recently built...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.cache_image
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`cache_image` (
  `cid` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` LONGBLOB NULL DEFAULT NULL COMMENT 'A collection of data to cache.',
  `expire` INT(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` INT(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` SMALLINT(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  INDEX `expire` (`expire` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Cache table used to store information about image...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.cache_menu
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`cache_menu` (
  `cid` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` LONGBLOB NULL DEFAULT NULL COMMENT 'A collection of data to cache.',
  `expire` INT(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` INT(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` SMALLINT(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  INDEX `expire` (`expire` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Cache table for the menu system to store router...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.cache_page
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`cache_page` (
  `cid` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` LONGBLOB NULL DEFAULT NULL COMMENT 'A collection of data to cache.',
  `expire` INT(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` INT(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` SMALLINT(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  INDEX `expire` (`expire` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Cache table used to store compressed pages for anonymous...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.cache_path
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`cache_path` (
  `cid` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` LONGBLOB NULL DEFAULT NULL COMMENT 'A collection of data to cache.',
  `expire` INT(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` INT(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` SMALLINT(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  INDEX `expire` (`expire` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Cache table for path alias lookup.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.cache_rules
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`cache_rules` (
  `cid` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` LONGBLOB NULL DEFAULT NULL COMMENT 'A collection of data to cache.',
  `expire` INT(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` INT(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` SMALLINT(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  INDEX `expire` (`expire` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Cache table for the rules engine to store configured items.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.cache_update
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`cache_update` (
  `cid` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` LONGBLOB NULL DEFAULT NULL COMMENT 'A collection of data to cache.',
  `expire` INT(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` INT(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` SMALLINT(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  INDEX `expire` (`expire` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Cache table for the Update module to store information...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.cache_views
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`cache_views` (
  `cid` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` LONGBLOB NULL DEFAULT NULL COMMENT 'A collection of data to cache.',
  `expire` INT(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` INT(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` SMALLINT(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  INDEX `expire` (`expire` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Generic cache table for caching things not separated out...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.cache_views_data
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`cache_views_data` (
  `cid` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` LONGBLOB NULL DEFAULT NULL COMMENT 'A collection of data to cache.',
  `expire` INT(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` INT(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` SMALLINT(6) NOT NULL DEFAULT '1' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  INDEX `expire` (`expire` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Cache table for views to store pre-rendered queries,...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.ckeditor_input_format
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`ckeditor_input_format` (
  `name` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'Name of the CKEditor role',
  `format` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'Drupal filter format ID',
  PRIMARY KEY (`name`, `format`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores CKEditor input format assignments';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.ckeditor_settings
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`ckeditor_settings` (
  `name` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'Name of the CKEditor profile',
  `settings` TEXT NULL DEFAULT NULL COMMENT 'Profile settings',
  PRIMARY KEY (`name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores CKEditor profile settings';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.comment
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`comment` (
  `cid` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique comment ID.',
  `pid` INT(11) NOT NULL DEFAULT '0' COMMENT 'The comment.cid to which this comment is a reply. If set to 0, this comment is not a reply to an existing comment.',
  `nid` INT(11) NOT NULL DEFAULT '0' COMMENT 'The node.nid to which this comment is a reply.',
  `uid` INT(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid who authored the comment. If set to 0, this comment was created by an anonymous user.',
  `subject` VARCHAR(64) NOT NULL DEFAULT '' COMMENT 'The comment title.',
  `hostname` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The author’s host name.',
  `created` INT(11) NOT NULL DEFAULT '0' COMMENT 'The time that the comment was created, as a Unix timestamp.',
  `changed` INT(11) NOT NULL DEFAULT '0' COMMENT 'The time that the comment was last edited, as a Unix timestamp.',
  `status` TINYINT(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'The published status of a comment. (0 = Not Published, 1 = Published)',
  `thread` VARCHAR(255) NOT NULL COMMENT 'The vancode representation of the comment’s place in a thread.',
  `name` VARCHAR(60) NULL DEFAULT NULL COMMENT 'The comment author’s name. Uses users.name if the user is logged in, otherwise uses the value typed into the comment form.',
  `mail` VARCHAR(64) NULL DEFAULT NULL COMMENT 'The comment author’s e-mail address from the comment form, if user is anonymous, and the ’Anonymous users may/must leave their contact information’ setting is turned on.',
  `homepage` VARCHAR(255) NULL DEFAULT NULL COMMENT 'The comment author’s home page address from the comment form, if user is anonymous, and the ’Anonymous users may/must leave their contact information’ setting is turned on.',
  `language` VARCHAR(12) NOT NULL DEFAULT '' COMMENT 'The languages.language of this comment.',
  `uuid` CHAR(36) NOT NULL DEFAULT '' COMMENT 'The Universally Unique Identifier.',
  PRIMARY KEY (`cid`),
  INDEX `comment_status_pid` (`pid` ASC, `status` ASC),
  INDEX `comment_num_new` (`nid` ASC, `status` ASC, `created` ASC, `cid` ASC, `thread` ASC),
  INDEX `comment_uid` (`uid` ASC),
  INDEX `comment_nid_language` (`nid` ASC, `language` ASC),
  INDEX `comment_created` (`created` ASC),
  INDEX `uuid` (`uuid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores comments and associated data.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.context
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`context` (
  `name` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The primary identifier for a context.',
  `description` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Description for this context.',
  `tag` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Tag for this context.',
  `conditions` TEXT NULL DEFAULT NULL COMMENT 'Serialized storage of all context condition settings.',
  `reactions` TEXT NULL DEFAULT NULL COMMENT 'Serialized storage of all context reaction settings.',
  `condition_mode` INT(11) NULL DEFAULT '0' COMMENT 'Condition mode for this context.',
  PRIMARY KEY (`name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Storage for normal (user-defined) contexts.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.ctools_access_ruleset
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`ctools_access_ruleset` (
  `rsid` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'A database primary key to ensure uniqueness',
  `name` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Unique ID for this ruleset. Used to identify it programmatically.',
  `admin_title` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Administrative title for this ruleset.',
  `admin_description` LONGTEXT NULL DEFAULT NULL COMMENT 'Administrative description for this ruleset.',
  `requiredcontexts` LONGTEXT NULL DEFAULT NULL COMMENT 'Any required contexts for this ruleset.',
  `contexts` LONGTEXT NULL DEFAULT NULL COMMENT 'Any embedded contexts for this ruleset.',
  `relationships` LONGTEXT NULL DEFAULT NULL COMMENT 'Any relationships for this ruleset.',
  `access` LONGTEXT NULL DEFAULT NULL COMMENT 'The actual group of access plugins for this ruleset.',
  PRIMARY KEY (`rsid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Contains exportable customized access rulesets.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.ctools_css_cache
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`ctools_css_cache` (
  `cid` VARCHAR(128) NOT NULL COMMENT 'The CSS ID this cache object belongs to.',
  `filename` VARCHAR(255) NULL DEFAULT NULL COMMENT 'The filename this CSS is stored in.',
  `css` LONGTEXT NULL DEFAULT NULL COMMENT 'CSS being stored.',
  `filter` TINYINT(4) NULL DEFAULT NULL COMMENT 'Whether or not this CSS needs to be filtered.',
  PRIMARY KEY (`cid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'A special cache used to store CSS that must be non-volatile.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.ctools_custom_content
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`ctools_custom_content` (
  `cid` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'A database primary key to ensure uniqueness',
  `name` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Unique ID for this content. Used to identify it programmatically.',
  `admin_title` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Administrative title for this content.',
  `admin_description` LONGTEXT NULL DEFAULT NULL COMMENT 'Administrative description for this content.',
  `category` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Administrative category for this content.',
  `settings` LONGTEXT NULL DEFAULT NULL COMMENT 'Serialized settings for the actual content to be used',
  PRIMARY KEY (`cid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Contains exportable customized content for this site.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.ctools_object_cache
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`ctools_object_cache` (
  `sid` VARCHAR(64) NOT NULL COMMENT 'The session ID this cache object belongs to.',
  `name` VARCHAR(128) NOT NULL COMMENT 'The name of the object this cache is attached to.',
  `obj` VARCHAR(32) NOT NULL COMMENT 'The type of the object this cache is attached to; this essentially represents the owner so that several sub-systems can use this cache.',
  `updated` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The time this cache was created or updated.',
  `data` LONGBLOB NULL DEFAULT NULL COMMENT 'Serialized data being stored.',
  PRIMARY KEY (`sid`, `obj`, `name`),
  INDEX `updated` (`updated` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'A special cache used to store objects that are being...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.date_format_locale
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`date_format_locale` (
  `format` VARCHAR(100) NOT NULL COMMENT 'The date format string.',
  `type` VARCHAR(64) NOT NULL COMMENT 'The date format type, e.g. medium.',
  `language` VARCHAR(12) NOT NULL COMMENT 'A languages.language for this format to be used with.',
  PRIMARY KEY (`type`, `language`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores configured date formats for each locale.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.date_format_type
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`date_format_type` (
  `type` VARCHAR(64) NOT NULL COMMENT 'The date format type, e.g. medium.',
  `title` VARCHAR(255) NOT NULL COMMENT 'The human readable name of the format type.',
  `locked` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'Whether or not this is a system provided format.',
  PRIMARY KEY (`type`),
  INDEX `title` (`title` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores configured date format types.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.date_formats
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`date_formats` (
  `dfid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'The date format identifier.',
  `format` VARCHAR(100) NOT NULL COMMENT 'The date format string.',
  `type` VARCHAR(64) NOT NULL COMMENT 'The date format type, e.g. medium.',
  `locked` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'Whether or not this format can be modified.',
  PRIMARY KEY (`dfid`),
  UNIQUE INDEX `formats` (`format` ASC, `type` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 36
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores configured date formats.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.feeds_importer
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`feeds_importer` (
  `id` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'Id of the fields object.',
  `config` LONGBLOB NULL DEFAULT NULL COMMENT 'Configuration of the feeds object.',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Configuration of feeds objects.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.feeds_item
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`feeds_item` (
  `entity_type` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The entity type.',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The imported entity’s serial id.',
  `id` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The id of the importer that created this item.',
  `feed_nid` INT(10) UNSIGNED NOT NULL COMMENT 'Node id of the source, if available.',
  `imported` INT(11) NOT NULL DEFAULT '0' COMMENT 'Import date of the feed item, as a Unix timestamp.',
  `url` TEXT NOT NULL COMMENT 'Link to the feed item.',
  `guid` TEXT NOT NULL COMMENT 'Unique identifier for the feed item.',
  `hash` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The hash of the source item.',
  PRIMARY KEY (`entity_type`, `entity_id`),
  INDEX `id` (`id` ASC),
  INDEX `feed_nid` (`feed_nid` ASC),
  INDEX `lookup_url` (`entity_type` ASC, `id` ASC, `feed_nid` ASC, `url`(128) ASC),
  INDEX `lookup_guid` (`entity_type` ASC, `id` ASC, `feed_nid` ASC, `guid`(128) ASC),
  INDEX `global_lookup_url` (`entity_type` ASC, `url`(128) ASC),
  INDEX `global_lookup_guid` (`entity_type` ASC, `guid`(128) ASC),
  INDEX `imported` (`imported` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Tracks items such as nodes, terms, users.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.feeds_log
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`feeds_log` (
  `flid` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique feeds event ID.',
  `id` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The id of the importer that logged the event.',
  `feed_nid` INT(10) UNSIGNED NOT NULL COMMENT 'Node id of the source, if available.',
  `log_time` INT(11) NOT NULL DEFAULT '0' COMMENT 'Unix timestamp of when event occurred.',
  `request_time` INT(11) NOT NULL DEFAULT '0' COMMENT 'Unix timestamp of the request when the event occurred.',
  `type` VARCHAR(64) NOT NULL DEFAULT '' COMMENT 'Type of log message, for example \"feeds_import\".\"',
  `message` LONGTEXT NOT NULL COMMENT 'Text of log message to be passed into the t() function.',
  `variables` LONGBLOB NOT NULL COMMENT 'Serialized array of variables that match the message string and that is passed into the t() function.',
  `severity` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The severity level of the event; ranges from 0 (Emergency) to 7 (Debug)',
  PRIMARY KEY (`flid`),
  INDEX `id` (`id` ASC),
  INDEX `id_feed_nid` (`id` ASC, `feed_nid` ASC),
  INDEX `request_time` (`request_time` ASC),
  INDEX `log_time` (`log_time` ASC),
  INDEX `type` (`type` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Table that contains logs of feeds events.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.feeds_push_subscriptions
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`feeds_push_subscriptions` (
  `domain` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'Domain of the subscriber. Corresponds to an importer id.',
  `subscriber_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'ID of the subscriber. Corresponds to a feed nid.',
  `timestamp` INT(11) NOT NULL DEFAULT '0' COMMENT 'Created timestamp.',
  `hub` TEXT NOT NULL COMMENT 'The URL of the hub endpoint of this subscription.',
  `topic` TEXT NOT NULL COMMENT 'The topic URL (feed URL) of this subscription.',
  `secret` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'Shared secret for message authentication.',
  `status` VARCHAR(64) NOT NULL DEFAULT '' COMMENT 'Status of subscription.',
  `post_fields` TEXT NULL DEFAULT NULL COMMENT 'Fields posted.',
  PRIMARY KEY (`domain`, `subscriber_id`),
  INDEX `timestamp` (`timestamp` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'PubSubHubbub subscriptions.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.feeds_source
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`feeds_source` (
  `id` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'Id of the feed configuration.',
  `feed_nid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Node nid if this particular source is attached to a feed node.',
  `config` LONGBLOB NULL DEFAULT NULL COMMENT 'Configuration of the source.',
  `source` TEXT NOT NULL COMMENT 'Main source resource identifier. E. g. a path or a URL.',
  `state` LONGBLOB NULL DEFAULT NULL COMMENT 'State of import or clearing batches.',
  `fetcher_result` LONGBLOB NULL DEFAULT NULL COMMENT 'Cache for fetcher result.',
  `imported` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Timestamp when this source was imported last.',
  PRIMARY KEY (`id`, `feed_nid`),
  INDEX `id` (`id` ASC),
  INDEX `feed_nid` (`feed_nid` ASC),
  INDEX `id_source` (`id` ASC, `source`(128) ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Source definitions for feeds.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.feeds_tamper
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`feeds_tamper` (
  `id` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'Id of the feeds tamper instance.',
  `importer` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'Id of the feeds importer.',
  `source` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The source field of the importer.',
  `plugin_id` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'Id of the tamper plugin.',
  `settings` LONGTEXT NULL DEFAULT NULL COMMENT 'A serialized array of options for a Feeds Tamper plugin.',
  `weight` INT(10) UNSIGNED NOT NULL COMMENT 'The weight of a plugin instance. Plugins are executed in order.',
  `description` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Description of this plugin.',
  PRIMARY KEY (`id`),
  INDEX `importer` (`importer` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Table storing tamper instances.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_config
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_config` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a field',
  `field_name` VARCHAR(32) NOT NULL COMMENT 'The name of this field. Non-deleted field names are unique, but multiple deleted fields can have the same name.',
  `type` VARCHAR(128) NOT NULL COMMENT 'The type of this field.',
  `module` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The module that implements the field type.',
  `active` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the module that implements the field type is enabled.',
  `storage_type` VARCHAR(128) NOT NULL COMMENT 'The storage backend for the field.',
  `storage_module` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The module that implements the storage backend.',
  `storage_active` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the module that implements the storage backend is enabled.',
  `locked` TINYINT(4) NOT NULL DEFAULT '0' COMMENT '@TODO',
  `data` LONGBLOB NOT NULL COMMENT 'Serialized data containing the field properties that do not warrant a dedicated column.',
  `cardinality` TINYINT(4) NOT NULL DEFAULT '0',
  `translatable` TINYINT(4) NOT NULL DEFAULT '0',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  INDEX `field_name` (`field_name` ASC),
  INDEX `active` (`active` ASC),
  INDEX `storage_active` (`storage_active` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `module` (`module` ASC),
  INDEX `storage_module` (`storage_module` ASC),
  INDEX `type` (`type` ASC),
  INDEX `storage_type` (`storage_type` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 76
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_config_instance
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_config_instance` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a field instance',
  `field_id` INT(11) NOT NULL COMMENT 'The identifier of the field attached by this instance',
  `field_name` VARCHAR(32) NOT NULL DEFAULT '',
  `entity_type` VARCHAR(32) NOT NULL DEFAULT '',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '',
  `data` LONGBLOB NOT NULL,
  `deleted` TINYINT(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  INDEX `field_name_bundle` (`field_name` ASC, `entity_type` ASC, `bundle` ASC),
  INDEX `deleted` (`deleted` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 111
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_body
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_body` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `body_value` LONGTEXT NULL DEFAULT NULL,
  `body_summary` LONGTEXT NULL DEFAULT NULL,
  `body_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `body_format` (`body_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 2 (body)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_comment_body
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_comment_body` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `comment_body_value` LONGTEXT NULL DEFAULT NULL,
  `comment_body_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `comment_body_format` (`comment_body_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 1 (comment_body)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field__r_any_other_unique_identi
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field__r_any_other_unique_identi` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field__r_any_other_unique_identi_value` VARCHAR(255) NULL DEFAULT NULL,
  `field__r_any_other_unique_identi_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field__r_any_other_unique_identi_format` (`field__r_any_other_unique_identi_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 40 (field__r_any_other_unique_identi)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_account_numbers
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_account_numbers` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_account_numbers_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_account_numbers_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_account_numbers_format` (`field_account_numbers_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 32 (field_account_numbers)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_address_line_1
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_address_line_1` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_address_line_1_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_address_line_1_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_address_line_1_format` (`field_address_line_1_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 17 (field_address_line_1)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_address_line_2
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_address_line_2` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_address_line_2_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_address_line_2_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_address_line_2_format` (`field_address_line_2_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 18 (field_address_line_2)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_biometric_identifiers_incl
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_biometric_identifiers_incl` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_biometric_identifiers_incl_fid` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `field_biometric_identifiers_incl_display` TINYINT(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Flag to control whether this file should be displayed when viewing content.',
  `field_biometric_identifiers_incl_description` TEXT NULL DEFAULT NULL COMMENT 'A description of the file.',
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_biometric_identifiers_incl_fid` (`field_biometric_identifiers_incl_fid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 58 (field_biometric_identifiers_incl)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_birth_date
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_birth_date` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_birth_date_value` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 22 (field_birth_date)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_bloom_site_name
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_bloom_site_name` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_bloom_site_name_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_bloom_site_name_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_bloom_site_name_format` (`field_bloom_site_name_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 8 (field_bloom_site_name)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_certificate_license_number
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_certificate_license_number` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_certificate_license_number_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_certificate_license_number_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_certificate_license_number_format` (`field_certificate_license_number_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 33 (field_certificate_license_number)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_city
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_city` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_city_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_city_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_city_format` (`field_city_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 19 (field_city)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_code
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_code` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_code_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_code_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_code_format` (`field_code_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 73 (field_code)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_date_performed
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_date_performed` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_date_performed_value` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 75 (field_date_performed)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_device_identifiers_and_ser
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_device_identifiers_and_ser` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_device_identifiers_and_ser_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_device_identifiers_and_ser_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_device_identifiers_and_ser_format` (`field_device_identifiers_and_ser_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 35 (field_device_identifiers_and_ser)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_diagchoce
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_diagchoce` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_diagchoce_tid` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_diagchoce_tid` (`field_diagchoce_tid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 70 (field_diagchoce)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_diagnoses
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_diagnoses` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_diagnoses_tid` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_diagnoses_tid` (`field_diagnoses_tid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 72 (field_diagnoses)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_fax
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_fax` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_fax_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_fax_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_fax_format` (`field_fax_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 26 (field_fax)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_feed_item_description
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_feed_item_description` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_feed_item_description_value` LONGTEXT NULL DEFAULT NULL,
  `field_feed_item_description_summary` LONGTEXT NULL DEFAULT NULL,
  `field_feed_item_description_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_feed_item_description_format` (`field_feed_item_description_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 7 (field_feed_item_description)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_file_to_upload
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_file_to_upload` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_file_to_upload_fid` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `field_file_to_upload_display` TINYINT(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Flag to control whether this file should be displayed when viewing content.',
  `field_file_to_upload_description` TEXT NULL DEFAULT NULL COMMENT 'A description of the file.',
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_file_to_upload_fid` (`field_file_to_upload_fid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 13 (field_file_to_upload)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_first_name
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_first_name` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_first_name_value` VARCHAR(60) NULL DEFAULT NULL,
  `field_first_name_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_first_name_format` (`field_first_name_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 15 (field_first_name)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_full_face_photographs_and_
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_full_face_photographs_and_` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_full_face_photographs_and__fid` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `field_full_face_photographs_and__display` TINYINT(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Flag to control whether this file should be displayed when viewing content.',
  `field_full_face_photographs_and__description` TEXT NULL DEFAULT NULL COMMENT 'A description of the file.',
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_full_face_photographs_and__fid` (`field_full_face_photographs_and__fid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 57 (field_full_face_photographs_and_)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_full_name
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_full_name` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_full_name_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_full_name_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_full_name_format` (`field_full_name_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 43 (field_full_name)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_health_plan_beneficiary_nu
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_health_plan_beneficiary_nu` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_health_plan_beneficiary_nu_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_health_plan_beneficiary_nu_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_health_plan_beneficiary_nu_format` (`field_health_plan_beneficiary_nu_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 31 (field_health_plan_beneficiary_nu)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_height
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_height` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_height_value` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 59 (field_height)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_home_phone
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_home_phone` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_home_phone_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_home_phone_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_home_phone_format` (`field_home_phone_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 23 (field_home_phone)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_hours_worked
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_hours_worked` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_hours_worked_value` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 74 (field_hours_worked)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_https_github_com_billybran
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_https_github_com_billybran` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_https_github_com_billybran_fid` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `field_https_github_com_billybran_display` TINYINT(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Flag to control whether this file should be displayed when viewing content.',
  `field_https_github_com_billybran_description` TEXT NULL DEFAULT NULL COMMENT 'A description of the file.',
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_https_github_com_billybran_fid` (`field_https_github_com_billybran_fid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 57 (field_https_github_com_billybran)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_image
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_image` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_image_fid` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `field_image_alt` VARCHAR(512) NULL DEFAULT NULL COMMENT 'Alternative image text, for the image’s ’alt’ attribute.',
  `field_image_title` VARCHAR(1024) NULL DEFAULT NULL COMMENT 'Image title text, for the image’s ’title’ attribute.',
  `field_image_width` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The width of the image in pixels.',
  `field_image_height` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The height of the image in pixels.',
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_image_fid` (`field_image_fid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 4 (field_image)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_impress_rotate
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_impress_rotate` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_impress_rotate_value` DECIMAL(10,0) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 48 (field_impress_rotate)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_impress_rotate_x
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_impress_rotate_x` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_impress_rotate_x_value` DECIMAL(10,0) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 49 (field_impress_rotate_x)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_impress_rotate_y
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_impress_rotate_y` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_impress_rotate_y_value` DECIMAL(10,0) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 50 (field_impress_rotate_y)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_impress_scale
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_impress_scale` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_impress_scale_value` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 51 (field_impress_scale)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_impress_speaker_notes
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_impress_speaker_notes` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_impress_speaker_notes_value` LONGTEXT NULL DEFAULT NULL,
  `field_impress_speaker_notes_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_impress_speaker_notes_format` (`field_impress_speaker_notes_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 52 (field_impress_speaker_notes)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_impress_x
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_impress_x` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_impress_x_value` DECIMAL(10,0) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 53 (field_impress_x)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_impress_y
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_impress_y` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_impress_y_value` DECIMAL(10,0) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 54 (field_impress_y)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_impress_z
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_impress_z` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_impress_z_value` DECIMAL(10,0) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 55 (field_impress_z)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_internet_protocol_ip_addre
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_internet_protocol_ip_addre` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_internet_protocol_ip_addre_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_internet_protocol_ip_addre_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_internet_protocol_ip_addre_format` (`field_internet_protocol_ip_addre_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 37 (field_internet_protocol_ip_addre)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_last_name
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_last_name` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_last_name_value` VARCHAR(60) NULL DEFAULT NULL,
  `field_last_name_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_last_name_format` (`field_last_name_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 16 (field_last_name)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_medical_record_number
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_medical_record_number` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_medical_record_number_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_medical_record_number_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_medical_record_number_format` (`field_medical_record_number_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 30 (field_medical_record_number)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_mobile_phone
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_mobile_phone` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_mobile_phone_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_mobile_phone_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_mobile_phone_format` (`field_mobile_phone_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 24 (field_mobile_phone)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_personal_email
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_personal_email` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_personal_email_email` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 27 (field_personal_email)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_pii_user
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_pii_user` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_pii_user_target_id` INT(10) UNSIGNED NOT NULL COMMENT 'The id of the target entity.',
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_pii_user_target_id` (`field_pii_user_target_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 47 (field_pii_user)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_principal_investigator
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_principal_investigator` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_principal_investigator_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_principal_investigator_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_principal_investigator_format` (`field_principal_investigator_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 42 (field_principal_investigator)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_sample_slider
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_sample_slider` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_sample_slider_value` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 62 (field_sample_slider)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_ssn
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_ssn` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_ssn_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_ssn_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_ssn_format` (`field_ssn_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 29 (field_ssn)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_state
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_state` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_state_value` VARCHAR(2) NULL DEFAULT NULL,
  `field_state_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_state_format` (`field_state_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 20 (field_state)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_study_description
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_study_description` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_study_description_value` LONGTEXT NULL DEFAULT NULL,
  `field_study_description_summary` LONGTEXT NULL DEFAULT NULL,
  `field_study_description_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_study_description_format` (`field_study_description_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 41 (field_study_description)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_tags
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_tags` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_tags_tid` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_tags_tid` (`field_tags_tid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 3 (field_tags)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_test
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_test` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_test_target_id` INT(10) UNSIGNED NOT NULL COMMENT 'The id of the target entity.',
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_test_target_id` (`field_test_target_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 44 (field_test)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_vehicle_identifiers_and_se
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_vehicle_identifiers_and_se` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_vehicle_identifiers_and_se_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_vehicle_identifiers_and_se_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_vehicle_identifiers_and_se_format` (`field_vehicle_identifiers_and_se_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 34 (field_vehicle_identifiers_and_se)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_web_universal_resource_loc
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_web_universal_resource_loc` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_web_universal_resource_loc_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_web_universal_resource_loc_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_web_universal_resource_loc_format` (`field_web_universal_resource_loc_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 36 (field_web_universal_resource_loc)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_weight
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_weight` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_weight_value` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 60 (field_weight)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_what_do_you_need_
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_what_do_you_need_` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_what_do_you_need__value` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_what_do_you_need__value` (`field_what_do_you_need__value` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 9 (field_what_do_you_need_)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_work_email
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_work_email` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_work_email_email` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 28 (field_work_email)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_work_phone
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_work_phone` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_work_phone_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_work_phone_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_work_phone_format` (`field_work_phone_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 25 (field_work_phone)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_field_zip
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_field_zip` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_zip_value` VARCHAR(10) NULL DEFAULT NULL,
  `field_zip_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_zip_format` (`field_zip_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 21 (field_zip)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_impress_body
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_impress_body` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `impress_body_value` LONGTEXT NULL DEFAULT NULL,
  `impress_body_summary` LONGTEXT NULL DEFAULT NULL,
  `impress_body_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `impress_body_format` (`impress_body_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 56 (impress_body)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_og_membership_request
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_og_membership_request` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `og_membership_request_value` LONGTEXT NULL DEFAULT NULL,
  `og_membership_request_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `og_membership_request_format` (`og_membership_request_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 6 (og_membership_request)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_data_taxonomy_forums
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_data_taxonomy_forums` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `taxonomy_forums_tid` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `taxonomy_forums_tid` (`taxonomy_forums_tid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Data storage for field 5 (taxonomy_forums)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_group
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_group` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a group',
  `identifier` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The unique string identifier for a group.',
  `group_name` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The name of this group.',
  `entity_type` VARCHAR(32) NOT NULL DEFAULT '',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '',
  `mode` VARCHAR(128) NOT NULL DEFAULT '',
  `parent_name` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The parent name for a group',
  `data` LONGBLOB NOT NULL COMMENT 'Serialized data containing the group properties that do not warrant a dedicated column.',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `identifier` (`identifier` ASC),
  INDEX `group_name` (`group_name` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8
COMMENT = 'Table that contains field group entries and settings.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_body
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_body` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `body_value` LONGTEXT NULL DEFAULT NULL,
  `body_summary` LONGTEXT NULL DEFAULT NULL,
  `body_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `body_format` (`body_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 2 (body)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_comment_body
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_comment_body` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `comment_body_value` LONGTEXT NULL DEFAULT NULL,
  `comment_body_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `comment_body_format` (`comment_body_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 1 (comment_body)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field__r_any_other_unique_identi
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field__r_any_other_unique_identi` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field__r_any_other_unique_identi_value` VARCHAR(255) NULL DEFAULT NULL,
  `field__r_any_other_unique_identi_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field__r_any_other_unique_identi_format` (`field__r_any_other_unique_identi_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 40 (field__r_any_other...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_account_numbers
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_account_numbers` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_account_numbers_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_account_numbers_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_account_numbers_format` (`field_account_numbers_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 32 (field_account...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_address_line_1
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_address_line_1` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_address_line_1_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_address_line_1_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_address_line_1_format` (`field_address_line_1_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 17 (field_address_line_1)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_address_line_2
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_address_line_2` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_address_line_2_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_address_line_2_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_address_line_2_format` (`field_address_line_2_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 18 (field_address_line_2)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_biometric_identifiers_incl
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_biometric_identifiers_incl` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_biometric_identifiers_incl_fid` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `field_biometric_identifiers_incl_display` TINYINT(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Flag to control whether this file should be displayed when viewing content.',
  `field_biometric_identifiers_incl_description` TEXT NULL DEFAULT NULL COMMENT 'A description of the file.',
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_biometric_identifiers_incl_fid` (`field_biometric_identifiers_incl_fid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 58 (field_biometric...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_birth_date
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_birth_date` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_birth_date_value` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 22 (field_birth_date)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_bloom_site_name
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_bloom_site_name` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_bloom_site_name_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_bloom_site_name_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_bloom_site_name_format` (`field_bloom_site_name_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 8 (field_bloom_site_name)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_certificate_license_number
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_certificate_license_number` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_certificate_license_number_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_certificate_license_number_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_certificate_license_number_format` (`field_certificate_license_number_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 33 (field_certificate...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_city
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_city` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_city_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_city_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_city_format` (`field_city_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 19 (field_city)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_code
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_code` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_code_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_code_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_code_format` (`field_code_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 73 (field_code)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_date_performed
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_date_performed` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_date_performed_value` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 75 (field_date_performed)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_device_identifiers_and_ser
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_device_identifiers_and_ser` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_device_identifiers_and_ser_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_device_identifiers_and_ser_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_device_identifiers_and_ser_format` (`field_device_identifiers_and_ser_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 35 (field_device...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_diagchoce
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_diagchoce` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_diagchoce_tid` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_diagchoce_tid` (`field_diagchoce_tid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 70 (field_diagchoce)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_diagnoses
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_diagnoses` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_diagnoses_tid` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_diagnoses_tid` (`field_diagnoses_tid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 72 (field_diagnoses)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_fax
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_fax` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_fax_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_fax_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_fax_format` (`field_fax_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 26 (field_fax)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_feed_item_description
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_feed_item_description` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_feed_item_description_value` LONGTEXT NULL DEFAULT NULL,
  `field_feed_item_description_summary` LONGTEXT NULL DEFAULT NULL,
  `field_feed_item_description_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_feed_item_description_format` (`field_feed_item_description_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 7 (field_feed_item...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_file_to_upload
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_file_to_upload` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_file_to_upload_fid` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `field_file_to_upload_display` TINYINT(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Flag to control whether this file should be displayed when viewing content.',
  `field_file_to_upload_description` TEXT NULL DEFAULT NULL COMMENT 'A description of the file.',
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_file_to_upload_fid` (`field_file_to_upload_fid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 13 (field_file_to_upload)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_first_name
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_first_name` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_first_name_value` VARCHAR(60) NULL DEFAULT NULL,
  `field_first_name_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_first_name_format` (`field_first_name_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 15 (field_first_name)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_full_face_photographs_and_
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_full_face_photographs_and_` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_full_face_photographs_and__fid` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `field_full_face_photographs_and__display` TINYINT(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Flag to control whether this file should be displayed when viewing content.',
  `field_full_face_photographs_and__description` TEXT NULL DEFAULT NULL COMMENT 'A description of the file.',
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_full_face_photographs_and__fid` (`field_full_face_photographs_and__fid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 57 (field_full_face...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_full_name
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_full_name` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_full_name_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_full_name_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_full_name_format` (`field_full_name_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 43 (field_full_name)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_health_plan_beneficiary_nu
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_health_plan_beneficiary_nu` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_health_plan_beneficiary_nu_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_health_plan_beneficiary_nu_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_health_plan_beneficiary_nu_format` (`field_health_plan_beneficiary_nu_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 31 (field_health_plan...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_height
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_height` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_height_value` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 59 (field_height)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_home_phone
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_home_phone` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_home_phone_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_home_phone_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_home_phone_format` (`field_home_phone_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 23 (field_home_phone)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_hours_worked
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_hours_worked` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_hours_worked_value` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 74 (field_hours_worked)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_https_github_com_billybran
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_https_github_com_billybran` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_https_github_com_billybran_fid` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `field_https_github_com_billybran_display` TINYINT(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Flag to control whether this file should be displayed when viewing content.',
  `field_https_github_com_billybran_description` TEXT NULL DEFAULT NULL COMMENT 'A description of the file.',
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_https_github_com_billybran_fid` (`field_https_github_com_billybran_fid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 57 (field_https_github...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_image
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_image` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_image_fid` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `field_image_alt` VARCHAR(512) NULL DEFAULT NULL COMMENT 'Alternative image text, for the image’s ’alt’ attribute.',
  `field_image_title` VARCHAR(1024) NULL DEFAULT NULL COMMENT 'Image title text, for the image’s ’title’ attribute.',
  `field_image_width` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The width of the image in pixels.',
  `field_image_height` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The height of the image in pixels.',
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_image_fid` (`field_image_fid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 4 (field_image)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_impress_rotate
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_impress_rotate` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_impress_rotate_value` DECIMAL(10,0) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 48 (field_impress_rotate)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_impress_rotate_x
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_impress_rotate_x` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_impress_rotate_x_value` DECIMAL(10,0) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 49 (field_impress...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_impress_rotate_y
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_impress_rotate_y` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_impress_rotate_y_value` DECIMAL(10,0) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 50 (field_impress...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_impress_scale
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_impress_scale` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_impress_scale_value` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 51 (field_impress_scale)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_impress_speaker_notes
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_impress_speaker_notes` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_impress_speaker_notes_value` LONGTEXT NULL DEFAULT NULL,
  `field_impress_speaker_notes_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_impress_speaker_notes_format` (`field_impress_speaker_notes_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 52 (field_impress...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_impress_x
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_impress_x` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_impress_x_value` DECIMAL(10,0) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 53 (field_impress_x)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_impress_y
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_impress_y` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_impress_y_value` DECIMAL(10,0) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 54 (field_impress_y)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_impress_z
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_impress_z` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_impress_z_value` DECIMAL(10,0) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 55 (field_impress_z)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_internet_protocol_ip_addre
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_internet_protocol_ip_addre` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_internet_protocol_ip_addre_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_internet_protocol_ip_addre_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_internet_protocol_ip_addre_format` (`field_internet_protocol_ip_addre_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 37 (field_internet...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_last_name
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_last_name` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_last_name_value` VARCHAR(60) NULL DEFAULT NULL,
  `field_last_name_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_last_name_format` (`field_last_name_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 16 (field_last_name)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_medical_record_number
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_medical_record_number` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_medical_record_number_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_medical_record_number_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_medical_record_number_format` (`field_medical_record_number_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 30 (field_medical...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_mobile_phone
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_mobile_phone` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_mobile_phone_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_mobile_phone_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_mobile_phone_format` (`field_mobile_phone_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 24 (field_mobile_phone)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_personal_email
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_personal_email` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_personal_email_email` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 27 (field_personal_email)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_pii_user
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_pii_user` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_pii_user_target_id` INT(10) UNSIGNED NOT NULL COMMENT 'The id of the target entity.',
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_pii_user_target_id` (`field_pii_user_target_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 47 (field_pii_user)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_principal_investigator
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_principal_investigator` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_principal_investigator_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_principal_investigator_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_principal_investigator_format` (`field_principal_investigator_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 42 (field_principal...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_sample_slider
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_sample_slider` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_sample_slider_value` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 62 (field_sample_slider)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_ssn
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_ssn` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_ssn_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_ssn_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_ssn_format` (`field_ssn_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 29 (field_ssn)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_state
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_state` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_state_value` VARCHAR(2) NULL DEFAULT NULL,
  `field_state_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_state_format` (`field_state_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 20 (field_state)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_study_description
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_study_description` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_study_description_value` LONGTEXT NULL DEFAULT NULL,
  `field_study_description_summary` LONGTEXT NULL DEFAULT NULL,
  `field_study_description_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_study_description_format` (`field_study_description_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 41 (field_study...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_tags
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_tags` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_tags_tid` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_tags_tid` (`field_tags_tid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 3 (field_tags)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_test
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_test` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_test_target_id` INT(10) UNSIGNED NOT NULL COMMENT 'The id of the target entity.',
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_test_target_id` (`field_test_target_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 44 (field_test)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_vehicle_identifiers_and_se
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_vehicle_identifiers_and_se` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_vehicle_identifiers_and_se_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_vehicle_identifiers_and_se_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_vehicle_identifiers_and_se_format` (`field_vehicle_identifiers_and_se_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 34 (field_vehicle...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_web_universal_resource_loc
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_web_universal_resource_loc` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_web_universal_resource_loc_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_web_universal_resource_loc_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_web_universal_resource_loc_format` (`field_web_universal_resource_loc_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 36 (field_web...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_weight
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_weight` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_weight_value` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 60 (field_weight)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_what_do_you_need_
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_what_do_you_need_` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_what_do_you_need__value` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_what_do_you_need__value` (`field_what_do_you_need__value` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 9 (field_what_do_you...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_work_email
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_work_email` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_work_email_email` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 28 (field_work_email)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_work_phone
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_work_phone` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_work_phone_value` VARCHAR(255) NULL DEFAULT NULL,
  `field_work_phone_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_work_phone_format` (`field_work_phone_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 25 (field_work_phone)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_field_zip
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_field_zip` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_zip_value` VARCHAR(10) NULL DEFAULT NULL,
  `field_zip_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `field_zip_format` (`field_zip_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 21 (field_zip)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_impress_body
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_impress_body` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `impress_body_value` LONGTEXT NULL DEFAULT NULL,
  `impress_body_summary` LONGTEXT NULL DEFAULT NULL,
  `impress_body_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `impress_body_format` (`impress_body_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 56 (impress_body)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_og_membership_request
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_og_membership_request` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `og_membership_request_value` LONGTEXT NULL DEFAULT NULL,
  `og_membership_request_format` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `og_membership_request_format` (`og_membership_request_format` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 6 (og_membership_request)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_revision_taxonomy_forums
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_revision_taxonomy_forums` (
  `entity_type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` INT(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` INT(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `taxonomy_forums_tid` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`entity_type`, `entity_id`, `revision_id`, `deleted`, `delta`, `language`),
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `bundle` (`bundle` ASC),
  INDEX `deleted` (`deleted` ASC),
  INDEX `entity_id` (`entity_id` ASC),
  INDEX `revision_id` (`revision_id` ASC),
  INDEX `language` (`language` ASC),
  INDEX `taxonomy_forums_tid` (`taxonomy_forums_tid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Revision archive storage for field 5 (taxonomy_forums)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.field_validation_rule
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`field_validation_rule` (
  `ruleid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the validation rule',
  `rulename` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Name of the validation rule',
  `name` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'Machine name of the validation rule',
  `field_name` VARCHAR(32) NOT NULL DEFAULT '',
  `col` VARCHAR(32) NOT NULL DEFAULT 'value',
  `entity_type` VARCHAR(32) NOT NULL DEFAULT '',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '',
  `validator` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The validator key',
  `settings` LONGTEXT NULL DEFAULT NULL COMMENT 'Serialized settings for the validator to be used',
  `error_message` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Rule error message',
  PRIMARY KEY (`ruleid`),
  INDEX `field_name_bundle` (`field_name` ASC, `entity_type` ASC, `bundle` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores rule definitions';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.file_managed
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`file_managed` (
  `fid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'File ID.',
  `uid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The users.uid of the user who is associated with the file.',
  `filename` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Name of the file with no path components. This may differ from the basename of the URI if the file is renamed to avoid overwriting an existing file.',
  `uri` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The URI to access the file (either local or remote).',
  `filemime` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The file’s MIME type.',
  `filesize` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The size of the file in bytes.',
  `status` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A field indicating the status of the file. Two status are defined in core: temporary (0) and permanent (1). Temporary files older than DRUPAL_MAXIMUM_TEMP_FILE_AGE will be removed during a cron run.',
  `timestamp` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'UNIX timestamp for when the file was added.',
  `uuid` CHAR(36) NOT NULL DEFAULT '' COMMENT 'The Universally Unique Identifier.',
  PRIMARY KEY (`fid`),
  UNIQUE INDEX `uri` (`uri` ASC),
  INDEX `uid` (`uid` ASC),
  INDEX `status` (`status` ASC),
  INDEX `timestamp` (`timestamp` ASC),
  INDEX `uuid` (`uuid` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores information for uploaded files.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.file_usage
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`file_usage` (
  `fid` INT(10) UNSIGNED NOT NULL COMMENT 'File ID.',
  `module` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The name of the module that is using the file.',
  `type` VARCHAR(64) NOT NULL DEFAULT '' COMMENT 'The name of the object type in which the file is used.',
  `id` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The primary key of the object using the file.',
  `count` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The number of times this file is used by this object.',
  PRIMARY KEY (`fid`, `type`, `id`, `module`),
  INDEX `type_id` (`type` ASC, `id` ASC),
  INDEX `fid_count` (`fid` ASC, `count` ASC),
  INDEX `fid_module` (`fid` ASC, `module` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Track where a file is used.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.filter
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`filter` (
  `format` VARCHAR(255) NOT NULL COMMENT 'Foreign key: The filter_format.format to which this filter is assigned.',
  `module` VARCHAR(64) NOT NULL DEFAULT '' COMMENT 'The origin module of the filter.',
  `name` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'Name of the filter being referenced.',
  `weight` INT(11) NOT NULL DEFAULT '0' COMMENT 'Weight of filter within format.',
  `status` INT(11) NOT NULL DEFAULT '0' COMMENT 'Filter enabled status. (1 = enabled, 0 = disabled)',
  `settings` LONGBLOB NULL DEFAULT NULL COMMENT 'A serialized array of name value pairs that store the filter settings for the specific format.',
  PRIMARY KEY (`format`, `name`),
  INDEX `list` (`weight` ASC, `module` ASC, `name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Table that maps filters (HTML corrector) to text formats ...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.filter_format
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`filter_format` (
  `format` VARCHAR(255) NOT NULL COMMENT 'Primary Key: Unique machine name of the format.',
  `name` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Name of the text format (Filtered HTML).',
  `cache` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'Flag to indicate whether format is cacheable. (1 = cacheable, 0 = not cacheable)',
  `status` TINYINT(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'The status of the text format. (1 = enabled, 0 = disabled)',
  `weight` INT(11) NOT NULL DEFAULT '0' COMMENT 'Weight of text format to use when listing.',
  PRIMARY KEY (`format`),
  UNIQUE INDEX `name` (`name` ASC),
  INDEX `status_weight` (`status` ASC, `weight` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores text formats: custom groupings of filters, such as...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.flood
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`flood` (
  `fid` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique flood event ID.',
  `event` VARCHAR(64) NOT NULL DEFAULT '' COMMENT 'Name of event (e.g. contact).',
  `identifier` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'Identifier of the visitor, such as an IP address or hostname.',
  `timestamp` INT(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp of the event.',
  `expiration` INT(11) NOT NULL DEFAULT '0' COMMENT 'Expiration timestamp. Expired events are purged on cron run.',
  PRIMARY KEY (`fid`),
  INDEX `allow` (`event` ASC, `identifier` ASC, `timestamp` ASC),
  INDEX `purge` (`expiration` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Flood controls the threshold of events, such as the...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.forum
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`forum` (
  `nid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The node.nid of the node.',
  `vid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Primary Key: The node.vid of the node.',
  `tid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The taxonomy_term_data.tid of the forum term assigned to the node.',
  PRIMARY KEY (`vid`),
  INDEX `forum_topic` (`nid` ASC, `tid` ASC),
  INDEX `tid` (`tid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores the relationship of nodes to forum terms.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.forum_index
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`forum_index` (
  `nid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The node.nid this record tracks.',
  `title` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The title of this node, always treated as non-markup plain text.',
  `tid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The term ID.',
  `sticky` TINYINT(4) NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node is sticky.',
  `created` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the node was created.',
  `last_comment_timestamp` INT(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp of the last comment that was posted within this node, from comment.timestamp.',
  `comment_count` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The total number of comments on this node.',
  INDEX `forum_topics` (`nid` ASC, `tid` ASC, `sticky` ASC, `last_comment_timestamp` ASC),
  INDEX `created` (`created` ASC),
  INDEX `last_comment_timestamp` (`last_comment_timestamp` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Maintains denormalized information about node/term...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.history
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`history` (
  `uid` INT(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid that read the node nid.',
  `nid` INT(11) NOT NULL DEFAULT '0' COMMENT 'The node.nid that was read.',
  `timestamp` INT(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp at which the read occurred.',
  PRIMARY KEY (`uid`, `nid`),
  INDEX `nid` (`nid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'A record of which users have read which nodes.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.image_effects
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`image_effects` (
  `ieid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for an image effect.',
  `isid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The image_styles.isid for an image style.',
  `weight` INT(11) NOT NULL DEFAULT '0' COMMENT 'The weight of the effect in the style.',
  `name` VARCHAR(255) NOT NULL COMMENT 'The unique name of the effect to be executed.',
  `data` LONGBLOB NOT NULL COMMENT 'The configuration data for the effect.',
  PRIMARY KEY (`ieid`),
  INDEX `isid` (`isid` ASC),
  INDEX `weight` (`weight` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores configuration options for image effects.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.image_styles
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`image_styles` (
  `isid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for an image style.',
  `name` VARCHAR(255) NOT NULL COMMENT 'The style machine name.',
  `label` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The style administrative name.',
  PRIMARY KEY (`isid`),
  UNIQUE INDEX `name` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores configuration options for image styles.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.job_schedule
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`job_schedule` (
  `item_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique item ID.',
  `name` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'Name of the schedule.',
  `type` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'Type identifier of the job.',
  `id` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Numeric identifier of the job.',
  `period` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Time period after which job is to be executed.',
  `crontab` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Crontab line in *NIX format.',
  `data` LONGBLOB NULL DEFAULT NULL COMMENT 'The arbitrary data for the item.',
  `expire` INT(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp when job expires.',
  `created` INT(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp when the item was created.',
  `last` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Timestamp when a job was last executed.',
  `periodic` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'If true job will be automatically rescheduled.',
  `next` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Timestamp when a job is to be executed (next = last + period), used for fast ordering.',
  `scheduled` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Timestamp when a job was scheduled. 0 if a job is currently not scheduled.',
  PRIMARY KEY (`item_id`),
  INDEX `name_type_id` (`name` ASC, `type` ASC, `id` ASC),
  INDEX `name_type` (`name` ASC, `type` ASC),
  INDEX `next` (`next` ASC),
  INDEX `scheduled` (`scheduled` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Schedule of jobs to be executed.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.job_scheduler_trigger
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`job_scheduler_trigger` (
  `trid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: unique trigger id.',
  `hook` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'Primary Key: The name of the internal Drupal hook; for example, job_scheduer_100.',
  `title` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Title for the trigger.',
  `crontab` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Crontab line in *NIX format.',
  `status` INT(11) NOT NULL DEFAULT '1' COMMENT 'Boolean indicating whether the trigger is active.',
  `last` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Timestamp when it was lat triggered.',
  PRIMARY KEY (`trid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Schedule of triggers to be created.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.masquerade
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`masquerade` (
  `sid` VARCHAR(64) NOT NULL DEFAULT '' COMMENT 'The current session for this masquerading user corresponding to their sessions.sid.',
  `uid_from` INT(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid corresponding to a session.',
  `uid_as` INT(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid this session is masquerading as.',
  INDEX `sid` (`sid` ASC, `uid_from` ASC),
  INDEX `sid_2` (`sid` ASC, `uid_as` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Each masquerading user has their session recorded into...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.masquerade_users
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`masquerade_users` (
  `uid_from` INT(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid that can masquerade as masquerade_users.uid_to.',
  `uid_to` INT(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid that masquerade_users.uid_from can masquerade as.',
  PRIMARY KEY (`uid_from`, `uid_to`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Per-user permission table granting permissions to switch...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.menu_custom
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`menu_custom` (
  `menu_name` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique key for menu. This is used as a block delta so length is 32.',
  `title` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Menu title; displayed at top of block.',
  `description` TEXT NULL DEFAULT NULL COMMENT 'Menu description.',
  PRIMARY KEY (`menu_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Holds definitions for top-level custom menus (for example...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.menu_links
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`menu_links` (
  `menu_name` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The menu name. All links with the same menu name (such as ’navigation’) are part of the same menu.',
  `mlid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'The menu link ID (mlid) is the integer primary key.',
  `plid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The parent link ID (plid) is the mlid of the link above in the hierarchy, or zero if the link is at the top level in its menu.',
  `link_path` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The Drupal path or external path this link points to.',
  `router_path` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'For links corresponding to a Drupal path (external = 0), this connects the link to a menu_router.path for joins.',
  `link_title` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The text displayed for the link, which may be modified by a title callback stored in menu_router.',
  `options` BLOB NULL DEFAULT NULL COMMENT 'A serialized array of options to be passed to the url() or l() function, such as a query string or HTML attributes.',
  `module` VARCHAR(255) NOT NULL DEFAULT 'system' COMMENT 'The name of the module that generated this link.',
  `hidden` SMALLINT(6) NOT NULL DEFAULT '0' COMMENT 'A flag for whether the link should be rendered in menus. (1 = a disabled menu item that may be shown on admin screens, -1 = a menu callback, 0 = a normal, visible link)',
  `external` SMALLINT(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate if the link points to a full URL starting with a protocol, like http:// (1 = external, 0 = internal).',
  `has_children` SMALLINT(6) NOT NULL DEFAULT '0' COMMENT 'Flag indicating whether any links have this link as a parent (1 = children exist, 0 = no children).',
  `expanded` SMALLINT(6) NOT NULL DEFAULT '0' COMMENT 'Flag for whether this link should be rendered as expanded in menus - expanded links always have their child links displayed, instead of only when the link is in the active trail (1 = expanded, 0 = not expanded)',
  `weight` INT(11) NOT NULL DEFAULT '0' COMMENT 'Link weight among links in the same menu at the same depth.',
  `depth` SMALLINT(6) NOT NULL DEFAULT '0' COMMENT 'The depth relative to the top level. A link with plid == 0 will have depth == 1.',
  `customized` SMALLINT(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate that the user has manually created or edited the link (1 = customized, 0 = not customized).',
  `p1` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The first mlid in the materialized path. If N = depth, then pN must equal the mlid. If depth > 1 then p(N-1) must equal the plid. All pX where X > depth must equal zero. The columns p1 .. p9 are also called the parents.',
  `p2` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The second mlid in the materialized path. See p1.',
  `p3` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The third mlid in the materialized path. See p1.',
  `p4` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The fourth mlid in the materialized path. See p1.',
  `p5` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The fifth mlid in the materialized path. See p1.',
  `p6` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The sixth mlid in the materialized path. See p1.',
  `p7` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The seventh mlid in the materialized path. See p1.',
  `p8` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The eighth mlid in the materialized path. See p1.',
  `p9` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The ninth mlid in the materialized path. See p1.',
  `updated` SMALLINT(6) NOT NULL DEFAULT '0' COMMENT 'Flag that indicates that this link was generated during the update from Drupal 5.',
  PRIMARY KEY (`mlid`),
  INDEX `path_menu` (`link_path`(128) ASC, `menu_name` ASC),
  INDEX `menu_plid_expand_child` (`menu_name` ASC, `plid` ASC, `expanded` ASC, `has_children` ASC),
  INDEX `menu_parents` (`menu_name` ASC, `p1` ASC, `p2` ASC, `p3` ASC, `p4` ASC, `p5` ASC, `p6` ASC, `p7` ASC, `p8` ASC, `p9` ASC),
  INDEX `router_path` (`router_path`(128) ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 1611
DEFAULT CHARACTER SET = utf8
COMMENT = 'Contains the individual links within a menu.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.menu_router
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`menu_router` (
  `path` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: the Drupal path this entry describes',
  `load_functions` BLOB NOT NULL COMMENT 'A serialized array of function names (like node_load) to be called to load an object corresponding to a part of the current path.',
  `to_arg_functions` BLOB NOT NULL COMMENT 'A serialized array of function names (like user_uid_optional_to_arg) to be called to replace a part of the router path with another string.',
  `access_callback` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The callback which determines the access to this router path. Defaults to user_access.',
  `access_arguments` BLOB NULL DEFAULT NULL COMMENT 'A serialized array of arguments for the access callback.',
  `page_callback` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The name of the function that renders the page.',
  `page_arguments` BLOB NULL DEFAULT NULL COMMENT 'A serialized array of arguments for the page callback.',
  `delivery_callback` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The name of the function that sends the result of the page_callback function to the browser.',
  `fit` INT(11) NOT NULL DEFAULT '0' COMMENT 'A numeric representation of how specific the path is.',
  `number_parts` SMALLINT(6) NOT NULL DEFAULT '0' COMMENT 'Number of parts in this router path.',
  `context` INT(11) NOT NULL DEFAULT '0' COMMENT 'Only for local tasks (tabs) - the context of a local task to control its placement.',
  `tab_parent` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Only for local tasks (tabs) - the router path of the parent page (which may also be a local task).',
  `tab_root` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Router path of the closest non-tab parent page. For pages that are not local tasks, this will be the same as the path.',
  `title` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The title for the current page, or the title for the tab if this is a local task.',
  `title_callback` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'A function which will alter the title. Defaults to t()',
  `title_arguments` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'A serialized array of arguments for the title callback. If empty, the title will be used as the sole argument for the title callback.',
  `theme_callback` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'A function which returns the name of the theme that will be used to render this page. If left empty, the default theme will be used.',
  `theme_arguments` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'A serialized array of arguments for the theme callback.',
  `type` INT(11) NOT NULL DEFAULT '0' COMMENT 'Numeric representation of the type of the menu item, like MENU_LOCAL_TASK.',
  `description` TEXT NOT NULL COMMENT 'A description of this item.',
  `position` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The position of the block (left or right) on the system administration page for this item.',
  `weight` INT(11) NOT NULL DEFAULT '0' COMMENT 'Weight of the element. Lighter weights are higher up, heavier weights go down.',
  `include_file` MEDIUMTEXT NULL DEFAULT NULL COMMENT 'The file to include for this element, usually the page callback function lives in this file.',
  PRIMARY KEY (`path`),
  INDEX `fit` (`fit` ASC),
  INDEX `tab_parent` (`tab_parent`(64) ASC, `weight` ASC, `title` ASC),
  INDEX `tab_root_weight_title` (`tab_root`(64) ASC, `weight` ASC, `title` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Maps paths to various callbacks (access, page and title)';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.node
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`node` (
  `nid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a node.',
  `vid` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'The current node_revision.vid version identifier.',
  `type` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The node_type.type of this node.',
  `language` VARCHAR(12) NOT NULL DEFAULT '' COMMENT 'The languages.language of this node.',
  `title` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The title of this node, always treated as non-markup plain text.',
  `uid` INT(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid that owns this node; initially, this is the user that created it.',
  `status` INT(11) NOT NULL DEFAULT '1' COMMENT 'Boolean indicating whether the node is published (visible to non-administrators).',
  `created` INT(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the node was created.',
  `changed` INT(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the node was most recently saved.',
  `comment` INT(11) NOT NULL DEFAULT '0' COMMENT 'Whether comments are allowed on this node: 0 = no, 1 = closed (read only), 2 = open (read/write).',
  `promote` INT(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node should be displayed on the front page.',
  `sticky` INT(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node should be displayed at the top of lists in which it appears.',
  `tnid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The translation set id for this node, which equals the node id of the source post in each set.',
  `translate` INT(11) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this translation page needs to be updated.',
  `uuid` CHAR(36) NOT NULL DEFAULT '' COMMENT 'The Universally Unique Identifier.',
  PRIMARY KEY (`nid`),
  UNIQUE INDEX `vid` (`vid` ASC),
  INDEX `node_changed` (`changed` ASC),
  INDEX `node_created` (`created` ASC),
  INDEX `node_frontpage` (`promote` ASC, `status` ASC, `sticky` ASC, `created` ASC),
  INDEX `node_status_type` (`status` ASC, `type` ASC, `nid` ASC),
  INDEX `node_title_type` (`title` ASC, `type`(4) ASC),
  INDEX `node_type` (`type`(4) ASC),
  INDEX `uid` (`uid` ASC),
  INDEX `tnid` (`tnid` ASC),
  INDEX `translate` (`translate` ASC),
  INDEX `language` (`language` ASC),
  INDEX `uuid` (`uuid` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 44
DEFAULT CHARACTER SET = utf8
COMMENT = 'The base table for nodes.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.node_access
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`node_access` (
  `nid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The node.nid this record affects.',
  `gid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The grant ID a user must possess in the specified realm to gain this row’s privileges on the node.',
  `realm` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The realm in which the user must possess the grant ID. Each node access node can define one or more realms.',
  `grant_view` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether a user with the realm/grant pair can view this node.',
  `grant_update` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether a user with the realm/grant pair can edit this node.',
  `grant_delete` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether a user with the realm/grant pair can delete this node.',
  PRIMARY KEY (`nid`, `gid`, `realm`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Identifies which realm/grant pairs a user must possess in...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.node_comment_statistics
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`node_comment_statistics` (
  `nid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The node.nid for which the statistics are compiled.',
  `cid` INT(11) NOT NULL DEFAULT '0' COMMENT 'The comment.cid of the last comment.',
  `last_comment_timestamp` INT(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp of the last comment that was posted within this node, from comment.changed.',
  `last_comment_name` VARCHAR(60) NULL DEFAULT NULL COMMENT 'The name of the latest author to post a comment on this node, from comment.name.',
  `last_comment_uid` INT(11) NOT NULL DEFAULT '0' COMMENT 'The user ID of the latest author to post a comment on this node, from comment.uid.',
  `comment_count` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The total number of comments on this node.',
  PRIMARY KEY (`nid`),
  INDEX `node_comment_timestamp` (`last_comment_timestamp` ASC),
  INDEX `comment_count` (`comment_count` ASC),
  INDEX `last_comment_uid` (`last_comment_uid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Maintains statistics of node and comments posts to show ...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.node_counter
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`node_counter` (
  `nid` INT(11) NOT NULL DEFAULT '0' COMMENT 'The node.nid for these statistics.',
  `totalcount` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The total number of times the node has been viewed.',
  `daycount` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The total number of times the node has been viewed today.',
  `timestamp` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The most recent time the node has been viewed.',
  PRIMARY KEY (`nid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Access statistics for nodes.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.node_revision
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`node_revision` (
  `nid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The node this version belongs to.',
  `vid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for this version.',
  `uid` INT(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid that created this version.',
  `title` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The title of this version.',
  `log` LONGTEXT NOT NULL COMMENT 'The log entry explaining the changes in this version.',
  `timestamp` INT(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when this version was created.',
  `status` INT(11) NOT NULL DEFAULT '1' COMMENT 'Boolean indicating whether the node (at the time of this revision) is published (visible to non-administrators).',
  `comment` INT(11) NOT NULL DEFAULT '0' COMMENT 'Whether comments are allowed on this node (at the time of this revision): 0 = no, 1 = closed (read only), 2 = open (read/write).',
  `promote` INT(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node (at the time of this revision) should be displayed on the front page.',
  `sticky` INT(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node (at the time of this revision) should be displayed at the top of lists in which it appears.',
  `vuuid` CHAR(36) NOT NULL DEFAULT '' COMMENT 'The Universally Unique Identifier.',
  PRIMARY KEY (`vid`),
  INDEX `nid` (`nid` ASC),
  INDEX `uid` (`uid` ASC),
  INDEX `vuuid` (`vuuid` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 45
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores information about each saved version of a node.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.node_type
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`node_type` (
  `type` VARCHAR(32) NOT NULL COMMENT 'The machine-readable name of this type.',
  `name` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The human-readable name of this type.',
  `base` VARCHAR(255) NOT NULL COMMENT 'The base string used to construct callbacks corresponding to this node type.',
  `module` VARCHAR(255) NOT NULL COMMENT 'The module defining this node type.',
  `description` MEDIUMTEXT NOT NULL COMMENT 'A brief description of this type.',
  `help` MEDIUMTEXT NOT NULL COMMENT 'Help information shown to the user when creating a node of this type.',
  `has_title` TINYINT(3) UNSIGNED NOT NULL COMMENT 'Boolean indicating whether this type uses the node.title field.',
  `title_label` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The label displayed for the title field on the edit form.',
  `custom` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this type is defined by a module (FALSE) or by a user via Add content type (TRUE).',
  `modified` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this type has been modified by an administrator; currently not used in any way.',
  `locked` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether the administrator can change the machine name of this type.',
  `disabled` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether the node type is disabled.',
  `orig_type` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The original machine-readable name of this node type. This may be different from the current type name if the locked field is 0.',
  PRIMARY KEY (`type`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores information about all defined node types.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.og_membership
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`og_membership` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'The group membership’s unique ID.',
  `type` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Reference to a group membership type.',
  `etid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The entity ID.',
  `entity_type` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The entity type (e.g. node, comment, etc’).',
  `gid` INT(11) NOT NULL COMMENT 'The group’s unique ID.',
  `group_type` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The group’s entity type (e.g. node, comment, etc’).',
  `state` VARCHAR(255) NULL DEFAULT '' COMMENT 'The state of the group content.',
  `created` INT(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the group content was created.',
  `field_name` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The name of the field holding the group ID, the OG memebership is associated with.',
  `language` VARCHAR(12) NOT NULL DEFAULT '' COMMENT 'The languages.language of this membership.',
  PRIMARY KEY (`id`),
  INDEX `entity` (`etid` ASC, `entity_type` ASC),
  INDEX `group` (`gid` ASC, `group_type` ASC),
  INDEX `group_type` (`group_type` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'The group membership table.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.og_membership_type
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`og_membership_type` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Numeric group membership type ID.',
  `name` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The unified identifier for a group membership type.',
  `description` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Description for this group membership type.',
  `status` TINYINT(4) NOT NULL DEFAULT '1' COMMENT 'The exportable status of the entity.',
  `module` VARCHAR(255) NULL DEFAULT NULL COMMENT 'The name of the providing module if the entity has been defined in code.',
  `language` VARCHAR(12) NOT NULL DEFAULT '' COMMENT 'The languages.language of this membership type.',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name` (`name` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8
COMMENT = 'The group membership type.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.og_role
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`og_role` (
  `rid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique role ID.',
  `gid` INT(11) NOT NULL COMMENT 'The group’s unique ID.',
  `group_type` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The group’s entity type.',
  `group_bundle` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The group’s bundle name.',
  `name` VARCHAR(64) NOT NULL DEFAULT '' COMMENT 'Unique role name per group.',
  PRIMARY KEY (`rid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores user roles per group.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.og_role_permission
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`og_role_permission` (
  `rid` INT(10) UNSIGNED NOT NULL COMMENT 'Foreign Key: role.rid.',
  `permission` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'A single permission granted to the role identified by rid.',
  `module` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The module declaring the permission.',
  PRIMARY KEY (`rid`, `permission`),
  INDEX `permission` (`permission` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores the permissions assigned to user roles per group.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.og_users_roles
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`og_users_roles` (
  `uid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Primary Key: users.uid for user.',
  `rid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Primary Key: og_role.rid for role.',
  `gid` INT(11) NOT NULL COMMENT 'The group’s unique ID.',
  `group_type` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The group’s entity type.',
  PRIMARY KEY (`uid`, `rid`, `gid`),
  INDEX `rid` (`rid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Maps users to roles.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.page_manager_handlers
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`page_manager_handlers` (
  `did` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary ID field for the table. Not used for anything except internal lookups.',
  `name` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Unique ID for this task handler. Used to identify it programmatically.',
  `task` VARCHAR(64) NULL DEFAULT NULL COMMENT 'ID of the task this handler is for.',
  `subtask` VARCHAR(64) NOT NULL DEFAULT '' COMMENT 'ID of the subtask this handler is for.',
  `handler` VARCHAR(64) NULL DEFAULT NULL COMMENT 'ID of the task handler being used.',
  `weight` INT(11) NULL DEFAULT NULL COMMENT 'The order in which this handler appears. Lower numbers go first.',
  `conf` LONGTEXT NOT NULL COMMENT 'Serialized configuration of the handler, if needed.',
  PRIMARY KEY (`did`),
  UNIQUE INDEX `name` (`name` ASC),
  INDEX `fulltask` (`task` ASC, `subtask` ASC, `weight` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.page_manager_pages
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`page_manager_pages` (
  `pid` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary ID field for the table. Not used for anything except internal lookups.',
  `name` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Unique ID for this subtask. Used to identify it programmatically.',
  `task` VARCHAR(64) NULL DEFAULT 'page' COMMENT 'What type of page this is, so that we can use the same mechanism for creating tighter UIs for targeted pages.',
  `admin_title` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Human readable title for this page subtask.',
  `admin_description` LONGTEXT NULL DEFAULT NULL COMMENT 'Administrative description of this item.',
  `path` VARCHAR(255) NULL DEFAULT NULL COMMENT 'The menu path that will invoke this task.',
  `access` LONGTEXT NOT NULL COMMENT 'Access configuration for this path.',
  `menu` LONGTEXT NOT NULL COMMENT 'Serialized configuration of Drupal menu visibility settings for this item.',
  `arguments` LONGTEXT NOT NULL COMMENT 'Configuration of arguments for this menu item.',
  `conf` LONGTEXT NOT NULL COMMENT 'Serialized configuration of the page, if needed.',
  PRIMARY KEY (`pid`),
  UNIQUE INDEX `name` (`name` ASC),
  INDEX `task` (`task` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Contains page subtasks for implementing pages with...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.page_manager_weights
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`page_manager_weights` (
  `name` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Unique ID for this task handler. Used to identify it programmatically.',
  `weight` INT(11) NULL DEFAULT NULL COMMENT 'The order in which this handler appears. Lower numbers go first.',
  PRIMARY KEY (`name`),
  INDEX `weights` (`name` ASC, `weight` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Contains override weights for page_manager handlers that...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.property_validation_rule
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`property_validation_rule` (
  `ruleid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the validation rule',
  `rulename` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Name of the validation rule',
  `name` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'Machine name of the validation rule',
  `property_name` VARCHAR(32) NOT NULL DEFAULT '',
  `entity_type` VARCHAR(32) NOT NULL DEFAULT '',
  `bundle` VARCHAR(128) NOT NULL DEFAULT '',
  `validator` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The validator key',
  `settings` LONGTEXT NULL DEFAULT NULL COMMENT 'Serialized settings for the validator to be used',
  `error_message` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Rule error message',
  PRIMARY KEY (`ruleid`),
  INDEX `field_name_bundle` (`property_name` ASC, `entity_type` ASC, `bundle` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores rule definitions';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.queue
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`queue` (
  `item_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique item ID.',
  `name` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The queue name.',
  `data` LONGBLOB NULL DEFAULT NULL COMMENT 'The arbitrary data for the item.',
  `expire` INT(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp when the claim lease expires on the item.',
  `created` INT(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp when the item was created.',
  PRIMARY KEY (`item_id`),
  INDEX `name_created` (`name` ASC, `created` ASC),
  INDEX `expire` (`expire` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 32
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores items in queues.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.rdf_mapping
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`rdf_mapping` (
  `type` VARCHAR(128) NOT NULL COMMENT 'The name of the entity type a mapping applies to (node, user, comment, etc.).',
  `bundle` VARCHAR(128) NOT NULL COMMENT 'The name of the bundle a mapping applies to.',
  `mapping` LONGBLOB NULL DEFAULT NULL COMMENT 'The serialized mapping of the bundle type and fields to RDF terms.',
  PRIMARY KEY (`type`, `bundle`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores custom RDF mappings for user defined content types...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.registry
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`registry` (
  `name` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The name of the function, class, or interface.',
  `type` VARCHAR(9) NOT NULL DEFAULT '' COMMENT 'Either function or class or interface.',
  `filename` VARCHAR(255) NOT NULL COMMENT 'Name of the file.',
  `module` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Name of the module the file belongs to.',
  `weight` INT(11) NOT NULL DEFAULT '0' COMMENT 'The order in which this module’s hooks should be invoked relative to other modules. Equal-weighted modules are ordered by name.',
  PRIMARY KEY (`name`, `type`),
  INDEX `hook` (`type` ASC, `weight` ASC, `module` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Each record is a function, class, or interface name and...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.registry_file
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`registry_file` (
  `filename` VARCHAR(255) NOT NULL COMMENT 'Path to the file.',
  `hash` VARCHAR(64) NOT NULL COMMENT 'sha-256 hash of the file’s contents when last parsed.',
  PRIMARY KEY (`filename`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Files parsed to build the registry.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.role
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`role` (
  `rid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique role ID.',
  `name` VARCHAR(64) NOT NULL DEFAULT '' COMMENT 'Unique role name.',
  `weight` INT(11) NOT NULL DEFAULT '0' COMMENT 'The weight of this role in listings and the user interface.',
  PRIMARY KEY (`rid`),
  UNIQUE INDEX `name` (`name` ASC),
  INDEX `name_weight` (`name` ASC, `weight` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores user roles.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.role_permission
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`role_permission` (
  `rid` INT(10) UNSIGNED NOT NULL COMMENT 'Foreign Key: role.rid.',
  `permission` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'A single permission granted to the role identified by rid.',
  `module` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The module declaring the permission.',
  PRIMARY KEY (`rid`, `permission`),
  INDEX `permission` (`permission` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores the permissions assigned to user roles.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.role_watchdog
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`role_watchdog` (
  `hid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID of the history entry.',
  `aid` INT(10) UNSIGNED NOT NULL COMMENT 'User ID of account.',
  `rid` INT(10) UNSIGNED NOT NULL COMMENT 'Role ID changed.',
  `action` TINYINT(4) NOT NULL COMMENT 'Action (add or remove) performed.',
  `uid` INT(10) UNSIGNED NOT NULL COMMENT 'User ID performing action.',
  `stamp` INT(10) UNSIGNED NOT NULL COMMENT 'Time action performed.',
  PRIMARY KEY (`hid`),
  INDEX `aid` (`aid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores log of all role changes.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.rules_config
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`rules_config` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'The internal identifier for any configuration.',
  `name` VARCHAR(64) NOT NULL COMMENT 'The name of the configuration.',
  `label` VARCHAR(255) NOT NULL DEFAULT 'unlabeled' COMMENT 'The label of the configuration.',
  `plugin` VARCHAR(127) NOT NULL COMMENT 'The name of the plugin of this configuration.',
  `active` INT(11) NOT NULL DEFAULT '1' COMMENT 'Boolean indicating whether the configuration is active. Usage depends on how the using module makes use of it.',
  `weight` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'Weight of the configuration. Usage depends on how the using module makes use of it.',
  `status` TINYINT(4) NOT NULL DEFAULT '1' COMMENT 'The exportable status of the entity.',
  `dirty` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'Dirty configurations fail the integrity check, e.g. due to missing dependencies.',
  `module` VARCHAR(255) NULL DEFAULT NULL COMMENT 'The name of the providing module if the entity has been defined in code.',
  `owner` VARCHAR(255) NOT NULL DEFAULT 'rules' COMMENT 'The name of the module via which the rule has been configured.',
  `access_exposed` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'Whether to use a permission to control access for using components.',
  `data` LONGBLOB NULL DEFAULT NULL COMMENT 'Everything else, serialized.',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name` (`name` ASC),
  INDEX `plugin` (`plugin` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.rules_dependencies
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`rules_dependencies` (
  `id` INT(10) UNSIGNED NOT NULL COMMENT 'The primary identifier of the configuration.',
  `module` VARCHAR(255) NOT NULL COMMENT 'The name of the module that is required for the configuration.',
  PRIMARY KEY (`id`, `module`),
  INDEX `module` (`module` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.rules_scheduler
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`rules_scheduler` (
  `tid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'The scheduled task’s id.',
  `config` VARCHAR(64) NOT NULL DEFAULT '' COMMENT 'The scheduled configuration’s name.',
  `date` INT(11) NOT NULL COMMENT 'The Unix timestamp of when the task is to be scheduled.',
  `data` TEXT NULL DEFAULT NULL COMMENT 'The whole, serialized evaluation data.',
  `identifier` VARCHAR(255) NULL DEFAULT '' COMMENT 'The user defined string identifying this task.',
  `handler` VARCHAR(255) NULL DEFAULT NULL COMMENT 'The fully qualified class name of a the queue item handler.',
  PRIMARY KEY (`tid`),
  INDEX `date` (`date` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores scheduled tasks.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.rules_tags
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`rules_tags` (
  `id` INT(10) UNSIGNED NOT NULL COMMENT 'The primary identifier of the configuration.',
  `tag` VARCHAR(255) NOT NULL COMMENT 'The tag string associated with this configuration',
  PRIMARY KEY (`id`, `tag`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.rules_trigger
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`rules_trigger` (
  `id` INT(10) UNSIGNED NOT NULL COMMENT 'The primary identifier of the configuration.',
  `event` VARCHAR(127) NOT NULL DEFAULT '' COMMENT 'The name of the event on which the configuration should be triggered.',
  PRIMARY KEY (`id`, `event`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.search_dataset
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`search_dataset` (
  `sid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Search item ID, e.g. node ID for nodes.',
  `type` VARCHAR(16) NOT NULL COMMENT 'Type of item, e.g. node.',
  `data` LONGTEXT NOT NULL COMMENT 'List of space-separated words from the item.',
  `reindex` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Set to force node reindexing.',
  PRIMARY KEY (`sid`, `type`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores items that will be searched.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.search_index
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`search_index` (
  `word` VARCHAR(50) NOT NULL DEFAULT '' COMMENT 'The search_total.word that is associated with the search item.',
  `sid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The search_dataset.sid of the searchable item to which the word belongs.',
  `type` VARCHAR(16) NOT NULL COMMENT 'The search_dataset.type of the searchable item to which the word belongs.',
  `score` FLOAT NULL DEFAULT NULL COMMENT 'The numeric score of the word, higher being more important.',
  PRIMARY KEY (`word`, `sid`, `type`),
  INDEX `sid_type` (`sid` ASC, `type` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores the search index, associating words, items and...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.search_node_links
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`search_node_links` (
  `sid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The search_dataset.sid of the searchable item containing the link to the node.',
  `type` VARCHAR(16) NOT NULL DEFAULT '' COMMENT 'The search_dataset.type of the searchable item containing the link to the node.',
  `nid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The node.nid that this item links to.',
  `caption` LONGTEXT NULL DEFAULT NULL COMMENT 'The text used to link to the node.nid.',
  PRIMARY KEY (`sid`, `type`, `nid`),
  INDEX `nid` (`nid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores items (like nodes) that link to other nodes, used...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.search_total
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`search_total` (
  `word` VARCHAR(50) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique word in the search index.',
  `count` FLOAT NULL DEFAULT NULL COMMENT 'The count of the word in the index using Zipf’s law to equalize the probability distribution.',
  PRIMARY KEY (`word`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores search totals for words.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.semaphore
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`semaphore` (
  `name` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique name.',
  `value` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'A value for the semaphore.',
  `expire` DOUBLE NOT NULL COMMENT 'A Unix timestamp with microseconds indicating when the semaphore should expire.',
  PRIMARY KEY (`name`),
  INDEX `value` (`value` ASC),
  INDEX `expire` (`expire` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Table for holding semaphores, locks, flags, etc. that...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.sequences
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`sequences` (
  `value` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'The value of the sequence.',
  PRIMARY KEY (`value`))
ENGINE = InnoDB
AUTO_INCREMENT = 174
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores IDs.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.sessions
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`sessions` (
  `uid` INT(10) UNSIGNED NOT NULL COMMENT 'The users.uid corresponding to a session, or 0 for anonymous user.',
  `sid` VARCHAR(128) NOT NULL COMMENT 'A session ID. The value is generated by Drupal’s session handlers.',
  `ssid` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'Secure session ID. The value is generated by Drupal’s session handlers.',
  `hostname` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The IP address that last used this session ID (sid).',
  `timestamp` INT(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when this session last requested a page. Old records are purged by PHP automatically.',
  `cache` INT(11) NOT NULL DEFAULT '0' COMMENT 'The time of this user’s last post. This is used when the site has specified a minimum_cache_lifetime. See cache_get().',
  `session` LONGBLOB NULL DEFAULT NULL COMMENT 'The serialized contents of $_SESSION, an array of name/value pairs that persists across page requests by this session ID. Drupal loads $_SESSION from here at the start of each request and saves it at the end.',
  PRIMARY KEY (`sid`, `ssid`),
  INDEX `timestamp` (`timestamp` ASC),
  INDEX `uid` (`uid` ASC),
  INDEX `ssid` (`ssid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Drupal’s session handlers read and write into the...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.shortcut_set
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`shortcut_set` (
  `set_name` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'Primary Key: The menu_links.menu_name under which the set’s links are stored.',
  `title` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The title of the set.',
  PRIMARY KEY (`set_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores information about sets of shortcuts links.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.shortcut_set_users
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`shortcut_set_users` (
  `uid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The users.uid for this set.',
  `set_name` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The shortcut_set.set_name that will be displayed for this user.',
  PRIMARY KEY (`uid`),
  INDEX `set_name` (`set_name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Maps users to shortcut sets.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.system
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`system` (
  `filename` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The path of the primary file for this item, relative to the Drupal root; e.g. modules/node/node.module.',
  `name` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The name of the item; e.g. node.',
  `type` VARCHAR(12) NOT NULL DEFAULT '' COMMENT 'The type of the item, either module, theme, or theme_engine.',
  `owner` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'A theme’s ’parent’ . Can be either a theme or an engine.',
  `status` INT(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether or not this item is enabled.',
  `bootstrap` INT(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether this module is loaded during Drupal’s early bootstrapping phase (e.g. even before the page cache is consulted).',
  `schema_version` SMALLINT(6) NOT NULL DEFAULT '-1' COMMENT 'The module’s database schema version number. -1 if the module is not installed (its tables do not exist); 0 or the largest N of the module’s hook_update_N() function that has either been run or existed when the module was first installed.',
  `weight` INT(11) NOT NULL DEFAULT '0' COMMENT 'The order in which this module’s hooks should be invoked relative to other modules. Equal-weighted modules are ordered by name.',
  `info` BLOB NULL DEFAULT NULL COMMENT 'A serialized array containing information from the module’s .info file; keys can include name, description, package, version, core, dependencies, and php.',
  PRIMARY KEY (`filename`),
  INDEX `system_list` (`status` ASC, `bootstrap` ASC, `type` ASC, `weight` ASC, `name` ASC),
  INDEX `type_name` (`type` ASC, `name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'A list of all modules, themes, and theme engines that are...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.taxonomy_index
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`taxonomy_index` (
  `nid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The node.nid this record tracks.',
  `tid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The term ID.',
  `sticky` TINYINT(4) NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node is sticky.',
  `created` INT(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the node was created.',
  INDEX `term_node` (`tid` ASC, `sticky` ASC, `created` ASC),
  INDEX `nid` (`nid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Maintains denormalized information about node/term...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.taxonomy_term_data
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`taxonomy_term_data` (
  `tid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique term ID.',
  `vid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The taxonomy_vocabulary.vid of the vocabulary to which the term is assigned.',
  `name` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The term name.',
  `description` LONGTEXT NULL DEFAULT NULL COMMENT 'A description of the term.',
  `format` VARCHAR(255) NULL DEFAULT NULL COMMENT 'The filter_format.format of the description.',
  `weight` INT(11) NOT NULL DEFAULT '0' COMMENT 'The weight of this term in relation to other terms.',
  `uuid` CHAR(36) NOT NULL DEFAULT '' COMMENT 'The Universally Unique Identifier.',
  PRIMARY KEY (`tid`),
  INDEX `taxonomy_tree` (`vid` ASC, `weight` ASC, `name` ASC),
  INDEX `vid_name` (`vid` ASC, `name` ASC),
  INDEX `name` (`name` ASC),
  INDEX `uuid` (`uuid` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 48680
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores term information.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.taxonomy_term_hierarchy
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`taxonomy_term_hierarchy` (
  `tid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Primary Key: The taxonomy_term_data.tid of the term.',
  `parent` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Primary Key: The taxonomy_term_data.tid of the term’s parent. 0 indicates no parent.',
  PRIMARY KEY (`tid`, `parent`),
  INDEX `parent` (`parent` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores the hierarchical relationship between terms.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.taxonomy_vocabulary
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`taxonomy_vocabulary` (
  `vid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique vocabulary ID.',
  `name` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Name of the vocabulary.',
  `machine_name` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The vocabulary machine name.',
  `description` LONGTEXT NULL DEFAULT NULL COMMENT 'Description of the vocabulary.',
  `hierarchy` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The type of hierarchy allowed within the vocabulary. (0 = disabled, 1 = single, 2 = multiple)',
  `module` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The module which created the vocabulary.',
  `weight` INT(11) NOT NULL DEFAULT '0' COMMENT 'The weight of this vocabulary in relation to other vocabularies.',
  PRIMARY KEY (`vid`),
  UNIQUE INDEX `machine_name` (`machine_name` ASC),
  INDEX `list` (`weight` ASC, `name` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores vocabulary information.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.tracker_node
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`tracker_node` (
  `nid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The node.nid this record tracks.',
  `published` TINYINT(4) NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node is published.',
  `changed` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the node was most recently saved or commented on.',
  PRIMARY KEY (`nid`),
  INDEX `tracker` (`published` ASC, `changed` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Tracks when nodes were last changed or commented on.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.tracker_user
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`tracker_user` (
  `nid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The node.nid this record tracks.',
  `uid` INT(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid of the node author or commenter.',
  `published` TINYINT(4) NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node is published.',
  `changed` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the node was most recently saved or commented on.',
  PRIMARY KEY (`nid`, `uid`),
  INDEX `tracker` (`uid` ASC, `published` ASC, `changed` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Tracks when nodes were last changed or commented on, for...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.trigger_assignments
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`trigger_assignments` (
  `hook` VARCHAR(78) NOT NULL DEFAULT '' COMMENT 'Primary Key: The name of the internal Drupal hook; for example, node_insert.',
  `aid` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Action’s actions.aid.',
  `weight` INT(11) NOT NULL DEFAULT '0' COMMENT 'The weight of the trigger assignment in relation to other triggers.',
  PRIMARY KEY (`hook`, `aid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Maps trigger to hook and operation assignments from...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.url_alias
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`url_alias` (
  `pid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'A unique path alias identifier.',
  `source` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The Drupal path this alias is for; e.g. node/12.',
  `alias` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The alias for this path; e.g. title-of-the-story.',
  `language` VARCHAR(12) NOT NULL DEFAULT '' COMMENT 'The language this alias is for; if ’und’, the alias will be used for unknown languages. Each Drupal path can have an alias for each supported language.',
  PRIMARY KEY (`pid`),
  INDEX `alias_language_pid` (`alias` ASC, `language` ASC, `pid` ASC),
  INDEX `source_language_pid` (`source` ASC, `language` ASC, `pid` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8
COMMENT = 'A list of URL aliases for Drupal paths; a user may visit...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.users
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`users` (
  `uid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Primary Key: Unique user ID.',
  `name` VARCHAR(60) NOT NULL DEFAULT '' COMMENT 'Unique user name.',
  `pass` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'User’s password (hashed).',
  `mail` VARCHAR(254) NULL DEFAULT '' COMMENT 'User’s e-mail address.',
  `theme` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'User’s default theme.',
  `signature` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'User’s signature.',
  `signature_format` VARCHAR(255) NULL DEFAULT NULL COMMENT 'The filter_format.format of the signature.',
  `created` INT(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp for when user was created.',
  `access` INT(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp for previous time user accessed the site.',
  `login` INT(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp for user’s last login.',
  `status` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'Whether the user is active(1) or blocked(0).',
  `timezone` VARCHAR(32) NULL DEFAULT NULL COMMENT 'User’s time zone.',
  `language` VARCHAR(12) NOT NULL DEFAULT '' COMMENT 'User’s default language.',
  `picture` INT(11) NOT NULL DEFAULT '0' COMMENT 'Foreign key: file_managed.fid of user’s picture.',
  `init` VARCHAR(254) NULL DEFAULT '' COMMENT 'E-mail address used for initial account creation.',
  `data` LONGBLOB NULL DEFAULT NULL COMMENT 'A serialized array of name value pairs that are related to the user. Any form values posted during user edit are stored and are loaded into the $user object during user_load(). Use of this field is discouraged and it will likely disappear in a future...',
  `uuid` CHAR(36) NOT NULL DEFAULT '' COMMENT 'The Universally Unique Identifier.',
  PRIMARY KEY (`uid`),
  UNIQUE INDEX `name` (`name` ASC),
  INDEX `access` (`access` ASC),
  INDEX `created` (`created` ASC),
  INDEX `mail` (`mail` ASC),
  INDEX `picture` (`picture` ASC),
  INDEX `uuid` (`uuid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores user data.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.users_roles
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`users_roles` (
  `uid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Primary Key: users.uid for user.',
  `rid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Primary Key: role.rid for role.',
  PRIMARY KEY (`uid`, `rid`),
  INDEX `rid` (`rid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Maps users to roles.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.variable
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`variable` (
  `name` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The name of the variable.',
  `value` LONGBLOB NOT NULL COMMENT 'The value of the variable.',
  PRIMARY KEY (`name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Named variable/value pairs created by Drupal core or any...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.views_data_export
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`views_data_export` (
  `eid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Unique id for each on-going export.',
  `view_name` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The unique name of the view. This is the primary field views are loaded from, and is used so that views may be internal and not necessarily in the database. May only be alphanumeric characters plus underscores.',
  `view_display_id` VARCHAR(64) NOT NULL DEFAULT '' COMMENT 'The unique name of the view. This is the primary field views are loaded from, and is used so that views may be internal and not necessarily in the database. May only be alphanumeric characters plus underscores.',
  `time_stamp` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The time this export started',
  `fid` INT(10) UNSIGNED NOT NULL COMMENT 'Files ID.',
  `batch_state` VARCHAR(32) NOT NULL DEFAULT 'init' COMMENT 'The current state of the batch.',
  `sandbox` LONGBLOB NULL DEFAULT NULL,
  PRIMARY KEY (`eid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Keep track of currently executing exports.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.views_data_export_object_cache
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`views_data_export_object_cache` (
  `eid` VARCHAR(64) NULL DEFAULT NULL COMMENT 'The export ID this view equates too.',
  `updated` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The time this cache was created or updated.',
  `data` LONGTEXT NULL DEFAULT NULL COMMENT 'Serialized data being stored.',
  INDEX `eid` (`eid` ASC),
  INDEX `updated` (`updated` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'A modified version of the views_object_cache that ignores...';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.views_display
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`views_display` (
  `vid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The view this display is attached to.',
  `id` VARCHAR(64) NOT NULL DEFAULT '' COMMENT 'An identifier for this display; usually generated from the display_plugin, so should be something like page or page_1 or block_2, etc.',
  `display_title` VARCHAR(64) NOT NULL DEFAULT '' COMMENT 'The title of the display, viewable by the administrator.',
  `display_plugin` VARCHAR(64) NOT NULL DEFAULT '' COMMENT 'The type of the display. Usually page, block or embed, but is pluggable so may be other things.',
  `position` INT(11) NULL DEFAULT '0' COMMENT 'The order in which this display is loaded.',
  `display_options` LONGTEXT NULL DEFAULT NULL COMMENT 'A serialized array of options for this display; it contains options that are generally only pertinent to that display plugin type.',
  PRIMARY KEY (`vid`, `id`),
  INDEX `vid` (`vid` ASC, `position` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores information about each display attached to a view.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.views_view
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`views_view` (
  `vid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'The view ID of the field, defined by the database.',
  `name` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The unique name of the view. This is the primary field views are loaded from, and is used so that views may be internal and not necessarily in the database. May only be alphanumeric characters plus underscores.',
  `description` VARCHAR(255) NULL DEFAULT '' COMMENT 'A description of the view for the admin interface.',
  `tag` VARCHAR(255) NULL DEFAULT '' COMMENT 'A tag used to group/sort views in the admin interface',
  `base_table` VARCHAR(64) NOT NULL DEFAULT '' COMMENT 'What table this view is based on, such as node, user, comment, or term.',
  `human_name` VARCHAR(255) NULL DEFAULT '' COMMENT 'A human readable name used to be displayed in the admin interface',
  `core` INT(11) NULL DEFAULT '0' COMMENT 'Stores the drupal core version of the view.',
  PRIMARY KEY (`vid`),
  UNIQUE INDEX `name` (`name` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8
COMMENT = 'Stores the general data for a view.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.watchdog
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`watchdog` (
  `wid` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique watchdog event ID.',
  `uid` INT(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid of the user who triggered the event.',
  `type` VARCHAR(64) NOT NULL DEFAULT '' COMMENT 'Type of log message, for example \"user\" or \"page not found.\"',
  `message` LONGTEXT NOT NULL COMMENT 'Text of log message to be passed into the t() function.',
  `variables` LONGBLOB NOT NULL COMMENT 'Serialized array of variables that match the message string and that is passed into the t() function.',
  `severity` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The severity level of the event; ranges from 0 (Emergency) to 7 (Debug)',
  `link` VARCHAR(255) NULL DEFAULT '' COMMENT 'Link to view the result of the event.',
  `location` TEXT NOT NULL COMMENT 'URL of the origin of the event.',
  `referer` TEXT NULL DEFAULT NULL COMMENT 'URL of referring page.',
  `hostname` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'Hostname of the user who triggered the event.',
  `timestamp` INT(11) NOT NULL DEFAULT '0' COMMENT 'Unix timestamp of when event occurred.',
  PRIMARY KEY (`wid`),
  INDEX `type` (`type` ASC),
  INDEX `uid` (`uid` ASC),
  INDEX `severity` (`severity` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 11348
DEFAULT CHARACTER SET = utf8
COMMENT = 'Table that contains logs of all system events.';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.workflow_access
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`workflow_access` (
  `sid` INT(11) NOT NULL DEFAULT '0',
  `rid` INT(11) NOT NULL DEFAULT '0',
  `grant_view` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
  `grant_update` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
  `grant_delete` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`sid`, `rid`),
  INDEX `rid` (`rid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Workflow access tables';

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.workflow_node
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`workflow_node` (
  `nid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The node.nid this record is for.',
  `sid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The workflow_states.sid that this node is currently in.',
  `uid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The users.uid who triggered this state.',
  `stamp` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The unique stamp for the transition.',
  PRIMARY KEY (`nid`),
  INDEX `nid` (`nid` ASC, `sid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.workflow_node_history
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`workflow_node_history` (
  `hid` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'The unique ID for this record.',
  `entity_type` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The type of entity this transition belongs to.',
  `nid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The node.nid this record is for.',
  `revision_id` INT(10) UNSIGNED NULL DEFAULT NULL,
  `field_name` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The name of the field the transition relates to.',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The languages.language of the entity.',
  `delta` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The sequence number for this data item, used for multi-value fields',
  `old_sid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The workflow_states.sid this transition started as.',
  `sid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The workflow_states.sid this transition transitioned to.',
  `uid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The users.uid who made this transition.',
  `stamp` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The unique stamp for this transition.',
  `comment` LONGTEXT NULL DEFAULT NULL COMMENT 'The comment explaining this transition.',
  PRIMARY KEY (`hid`),
  INDEX `sid` (`entity_type` ASC, `nid` ASC, `sid` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 26
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.workflow_scheduled_transition
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`workflow_scheduled_transition` (
  `entity_type` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The type of entity this transition belongs to.',
  `nid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The entity ID of the object this transition belongs to.',
  `field_name` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The name of the field the transition relates to.',
  `language` VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'The languages.language of the entity.',
  `delta` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The sequence number for this data item, used for multi-value fields',
  `old_sid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The workflow_states.sid this state starts at.',
  `sid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The workflow_states.sid this state transitions to.',
  `uid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The user who scheduled this state transition.',
  `scheduled` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The date this transition is scheduled for.',
  `comment` LONGTEXT NULL DEFAULT NULL COMMENT 'The comment explaining this transition.',
  INDEX `entity_type` (`entity_type` ASC),
  INDEX `entity_id` (`entity_type` ASC, `nid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.workflow_states
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`workflow_states` (
  `sid` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a workflow state.',
  `wid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The workflows.wid this state is part of.',
  `state` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The name of the state.',
  `weight` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'The weight (order) of the state.',
  `sysid` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'The type of state, usually either WORKFLOW_CREATION or empty.',
  `status` TINYINT(4) NOT NULL DEFAULT '1' COMMENT 'Whether the current state is active still.',
  PRIMARY KEY (`sid`),
  INDEX `sysid` (`sysid` ASC),
  INDEX `wid` (`wid` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.workflow_transitions
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`workflow_transitions` (
  `tid` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a workflow transition.',
  `sid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The workflow_states.sid start state.',
  `target_sid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The workflow_states.sid target state.',
  `roles` VARCHAR(255) NULL DEFAULT NULL COMMENT 'The role.sid that a user must have to perform transition.',
  `label` VARCHAR(128) NOT NULL DEFAULT '' COMMENT 'The human-readable name of this transition.',
  `name` VARCHAR(32) NULL DEFAULT '' COMMENT 'The machine-readable name of this transition.',
  PRIMARY KEY (`tid`),
  INDEX `sid` (`sid` ASC),
  INDEX `target_sid` (`target_sid` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.workflow_type_map
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`workflow_type_map` (
  `type` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The node_type.type the workflow is used on.',
  `wid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The workflows.wid this record affects.',
  INDEX `type` (`type` ASC, `wid` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table goedsole_bloom.workflows
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goedsole_bloom`.`workflows` (
  `wid` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a node.',
  `name` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The name of the workflow (used as machine name for features integration).',
  `tab_roles` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The role IDs that can access the workflow tabs on node pages.',
  `options` LONGTEXT NULL DEFAULT NULL COMMENT 'Additional settings for the workflow.',
  `label` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'The human-readable name of this workflow.',
  `status` TINYINT(4) NOT NULL DEFAULT '1' COMMENT 'The exportable status of the entity.',
  `module` VARCHAR(255) NULL DEFAULT NULL COMMENT 'The name of the providing module if the entity has been defined in code.',
  PRIMARY KEY (`wid`),
  UNIQUE INDEX `name` (`name` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8
COMMENT = 'Workflows';
SET FOREIGN_KEY_CHECKS = 1;;

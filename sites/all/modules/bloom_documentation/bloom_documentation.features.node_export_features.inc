<?php
/**
 * @file
 * bloom_documentation.features.node_export_features.inc
 */

/**
 * Implements hook_node_export_features_default().
 */
function bloom_documentation_node_export_features_default() {
  $node_export = array(
  'code_string' => 'array(
  (object) array(
      \'vid\' => \'12\',
      \'uid\' => \'1\',
      \'title\' => \'How do I deploy a minor upgrade of drupal to my bloom sites?\',
      \'log\' => \'\',
      \'status\' => \'1\',
      \'comment\' => \'1\',
      \'promote\' => \'0\',
      \'sticky\' => \'0\',
      \'vuuid\' => \'b7c7e3f4-bb01-4aad-8c18-583d79a69bcb\',
      \'nid\' => \'11\',
      \'type\' => \'page\',
      \'language\' => \'und\',
      \'created\' => \'1399990642\',
      \'changed\' => \'1399990642\',
      \'tnid\' => \'0\',
      \'translate\' => \'0\',
      \'uuid\' => \'0ba881a3-3705-46d5-adf9-84d3319213ef\',
      \'revision_timestamp\' => \'1399990642\',
      \'revision_uid\' => \'1\',
      \'body\' => array(
        \'und\' => array(
          array(
            \'value\' => "<div>\\r\\n<h2>Deploy a Minor Upgrade to Drupal</h2>\\r\\n</div>\\r\\n\\r\\n<div>\\r\\n<ol>\\r\\n\\t<li>​Download the latest&nbsp;<a href=\\"https://drupal.org/project/drupal\\" style=\\"color: rgb(177, 0, 105); text-decoration: none;\\">Drupal​</a>&nbsp;into e:\\\\UserSites, unzip. &nbsp;Unzipping left me with a drupal inside a drupal, so you may need to do some renaming and moving to get the drupal.7.xx that actually contains stuff into e:\\\\UserSites</li>\\r\\n\\t<li>Follow the intsructions in e:\\\\UserSites\\\\drupal.7-xx.\\\\UPGRADE.txt for 7.26 - 7.27 the following steps were executed:\\r\\n\\t<ol>\\r\\n\\t\\t<li><a href=\\"https://bloom-dev.meei.harvard.edu/?q=node#overlay=?q%3Dadmin/config/development/maintenance\\" style=\\"color: rgb(177, 0, 105); text-decoration: none;\\">​Put site in maintenance mode</a></li>\\r\\n\\t\\t<li><span style=\\"line-height:1.6\\">Except: \\\\sites, \\\\.git, and .gitignore, delete everything in e:\\\\UserSites\\\\bloom</span></li>\\r\\n\\t\\t<li>E:\\\\UserSites&gt;cp -R drupal-7.27/* drupal-7.27/.htaccess bloom</li>\\r\\n\\t\\t<li>Then you have to merge the database connection details from the old e:\\\\usersites\\\\bloom\\\\sites\\\\default\\\\setting.php into the new&nbsp;e:\\\\usersites\\\\\\\\sites\\\\default\\\\default-setting.php and overwrite the old&nbsp;e:\\\\usersites\\\\bloom\\\\sites\\\\default\\\\setting.php</li>\\r\\n\\t\\t<li>Run the update script&nbsp;\\r\\n\\t\\t<ol>\\r\\n\\t\\t\\t<li>Browse to https://bloom-dev.meei.harvard.edu/update.php</li>\\r\\n\\t\\t\\t<li>ok, ok, ok Except that I filled in the database connection details from the new&nbsp;e:\\\\usersites\\\\bloom\\\\sites\\\\default\\\\setting.php and the install script moved me over to the upgrade version</li>\\r\\n\\t\\t\\t<li>I went to Reports-&gt;Available Updates and ran it a couple more times to get everything all in sync</li>\\r\\n\\t\\t</ol>\\r\\n\\t\\t</li>\\r\\n\\t\\t<li>Commit a version control update\\r\\n\\t\\t<ol>\\r\\n\\t\\t\\t<li>​cd e:\\\\UserSites\\\\Bloom</li>\\r\\n\\t\\t\\t<li>git add --all .</li>\\r\\n\\t\\t</ol>\\r\\n\\t\\t</li>\\r\\n\\t</ol>\\r\\n\\t</li>\\r\\n</ol>\\r\\n</div>\\r\\n\\r\\n<p>​​</p>\\r\\n",
            \'summary\' => \'\',
            \'format\' => \'filtered_html\',
            \'safe_value\' => "<p>Deploy a Minor Upgrade to Drupal</p>\\n<ol><li>​Download the latest <a href=\\"https://drupal.org/project/drupal\\">Drupal​</a> into e:\\\\UserSites, unzip.  Unzipping left me with a drupal inside a drupal, so you may need to do some renaming and moving to get the drupal.7.xx that actually contains stuff into e:\\\\UserSites</li>\\n<li>Follow the intsructions in e:\\\\UserSites\\\\drupal.7-xx.\\\\UPGRADE.txt for 7.26 - 7.27 the following steps were executed:\\n<ol><li><a href=\\"https://bloom-dev.meei.harvard.edu/?q=node#overlay=?q%3Dadmin/config/development/maintenance\\">​Put site in maintenance mode</a></li>\\n<li>Except: \\\\sites, \\\\.git, and .gitignore, delete everything in e:\\\\UserSites\\\\bloom</li>\\n<li>E:\\\\UserSites&gt;cp -R drupal-7.27/* drupal-7.27/.htaccess bloom</li>\\n<li>Then you have to merge the database connection details from the old e:\\\\usersites\\\\bloom\\\\sites\\\\default\\\\setting.php into the new e:\\\\usersites\\\\\\\\sites\\\\default\\\\default-setting.php and overwrite the old e:\\\\usersites\\\\bloom\\\\sites\\\\default\\\\setting.php</li>\\n<li>Run the update script \\n<ol><li>Browse to <a href=\\"https://bloom-dev.meei.harvard.edu/update.php\\">https://bloom-dev.meei.harvard.edu/update.php</a></li>\\n<li>ok, ok, ok Except that I filled in the database connection details from the new e:\\\\usersites\\\\bloom\\\\sites\\\\default\\\\setting.php and the install script moved me over to the upgrade version</li>\\n<li>I went to Reports-&gt;Available Updates and ran it a couple more times to get everything all in sync</li>\\n</ol></li>\\n<li>Commit a version control update\\n<ol><li>​cd e:\\\\UserSites\\\\Bloom</li>\\n<li>git add --all .</li>\\n</ol></li>\\n</ol></li>\\n</ol><p>​​</p>\\n",
            \'safe_summary\' => \'\',
          ),
        ),
      ),
      \'rdf_mapping\' => array(
        \'rdftype\' => array(
          \'foaf:Document\',
        ),
        \'title\' => array(
          \'predicates\' => array(
            \'dc:title\',
          ),
        ),
        \'created\' => array(
          \'predicates\' => array(
            \'dc:date\',
            \'dc:created\',
          ),
          \'datatype\' => \'xsd:dateTime\',
          \'callback\' => \'date_iso8601\',
        ),
        \'changed\' => array(
          \'predicates\' => array(
            \'dc:modified\',
          ),
          \'datatype\' => \'xsd:dateTime\',
          \'callback\' => \'date_iso8601\',
        ),
        \'body\' => array(
          \'predicates\' => array(
            \'content:encoded\',
          ),
        ),
        \'uid\' => array(
          \'predicates\' => array(
            \'sioc:has_creator\',
          ),
          \'type\' => \'rel\',
        ),
        \'name\' => array(
          \'predicates\' => array(
            \'foaf:name\',
          ),
        ),
        \'comment_count\' => array(
          \'predicates\' => array(
            \'sioc:num_replies\',
          ),
          \'datatype\' => \'xsd:integer\',
        ),
        \'last_activity\' => array(
          \'predicates\' => array(
            \'sioc:last_activity_date\',
          ),
          \'datatype\' => \'xsd:dateTime\',
          \'callback\' => \'date_iso8601\',
        ),
      ),
      \'cid\' => \'0\',
      \'last_comment_timestamp\' => \'1399990642\',
      \'last_comment_name\' => NULL,
      \'last_comment_uid\' => \'1\',
      \'comment_count\' => \'0\',
      \'name\' => \'admin\',
      \'picture\' => \'0\',
      \'data\' => \'b:0;\',
      \'path\' => FALSE,
      \'menu\' => array(
        \'link_title\' => \'How do I deploy a minor upgrade of drupal to my bloom sites?\',
        \'mlid\' => 0,
        \'plid\' => \'1008\',
        \'menu_name\' => \'main-menu\',
        \'weight\' => \'0\',
        \'options\' => array(),
        \'module\' => \'menu\',
        \'expanded\' => \'0\',
        \'hidden\' => \'0\',
        \'has_children\' => \'0\',
        \'customized\' => 0,
        \'parent_depth_limit\' => 8,
        \'description\' => \'\',
        \'enabled\' => 1,
      ),
      \'node_export_drupal_version\' => \'7\',
    ),
  (object) array(
      \'vid\' => \'11\',
      \'uid\' => \'1\',
      \'title\' => \'How do I save a snapshot of a Bloom site?\',
      \'log\' => \'\',
      \'status\' => \'1\',
      \'comment\' => \'1\',
      \'promote\' => \'0\',
      \'sticky\' => \'0\',
      \'vuuid\' => \'f059f0f4-915b-43ed-addc-6880e946a6b6\',
      \'nid\' => \'10\',
      \'type\' => \'page\',
      \'language\' => \'und\',
      \'created\' => \'1399990440\',
      \'changed\' => \'1399990440\',
      \'tnid\' => \'0\',
      \'translate\' => \'0\',
      \'uuid\' => \'2417aea5-329b-468b-b68b-519bfef05d8e\',
      \'revision_timestamp\' => \'1399990440\',
      \'revision_uid\' => \'1\',
      \'body\' => array(
        \'und\' => array(
          array(
            \'value\' => "<div>\\r\\n<h2>Save a New snapshot of an entir​e user-site in version control</h2>\\r\\n</div>\\r\\n\\r\\n<div>\\r\\n<ol>\\r\\n\\t<li>Launch MySQL Workbench\\r\\n\\t<ol>\\r\\n\\t\\t<li>Click \\"Data Export\\"</li>\\r\\n\\t\\t<li>Check the user-site\'s database</li>\\r\\n\\t\\t<li>\\"Start Export\\" button - bottom right</li>\\r\\n\\t</ol>\\r\\n\\t</li>\\r\\n\\t<li>Get a command window and set your working directory&nbsp;to e:/UserSites/user-site\\r\\n\\t<ol>\\r\\n\\t\\t<li>E:/UserSites/bloom&gt; git add --all&nbsp;.</li>\\r\\n\\t\\t<li>E:/UserSites/bloom&gt; git commit -m \\"Description of the current state of what you\'re saving, [database backup name from above]\\"</li>\\r\\n\\t</ol>\\r\\n\\t</li>\\r\\n</ol>\\r\\n\\r\\n<div>\\r\\n<h2>&nbsp;</h2>\\r\\n</div>\\r\\n</div>\\r\\n",
            \'summary\' => \'\',
            \'format\' => \'filtered_html\',
            \'safe_value\' => "<p>Save a New snapshot of an entir​e user-site in version control</p>\\n<ol><li>Launch MySQL Workbench\\n<ol><li>Click \\"Data Export\\"</li>\\n<li>Check the user-site\'s database</li>\\n<li>\\"Start Export\\" button - bottom right</li>\\n</ol></li>\\n<li>Get a command window and set your working directory to e:/UserSites/user-site\\n<ol><li>E:/UserSites/bloom&gt; git add --all .</li>\\n<li>E:/UserSites/bloom&gt; git commit -m \\"Description of the current state of what you\'re saving, [database backup name from above]\\"</li>\\n</ol></li>\\n</ol><p> </p>\\n",
            \'safe_summary\' => \'\',
          ),
        ),
      ),
      \'rdf_mapping\' => array(
        \'rdftype\' => array(
          \'foaf:Document\',
        ),
        \'title\' => array(
          \'predicates\' => array(
            \'dc:title\',
          ),
        ),
        \'created\' => array(
          \'predicates\' => array(
            \'dc:date\',
            \'dc:created\',
          ),
          \'datatype\' => \'xsd:dateTime\',
          \'callback\' => \'date_iso8601\',
        ),
        \'changed\' => array(
          \'predicates\' => array(
            \'dc:modified\',
          ),
          \'datatype\' => \'xsd:dateTime\',
          \'callback\' => \'date_iso8601\',
        ),
        \'body\' => array(
          \'predicates\' => array(
            \'content:encoded\',
          ),
        ),
        \'uid\' => array(
          \'predicates\' => array(
            \'sioc:has_creator\',
          ),
          \'type\' => \'rel\',
        ),
        \'name\' => array(
          \'predicates\' => array(
            \'foaf:name\',
          ),
        ),
        \'comment_count\' => array(
          \'predicates\' => array(
            \'sioc:num_replies\',
          ),
          \'datatype\' => \'xsd:integer\',
        ),
        \'last_activity\' => array(
          \'predicates\' => array(
            \'sioc:last_activity_date\',
          ),
          \'datatype\' => \'xsd:dateTime\',
          \'callback\' => \'date_iso8601\',
        ),
      ),
      \'cid\' => \'0\',
      \'last_comment_timestamp\' => \'1399990440\',
      \'last_comment_name\' => NULL,
      \'last_comment_uid\' => \'1\',
      \'comment_count\' => \'0\',
      \'name\' => \'admin\',
      \'picture\' => \'0\',
      \'data\' => \'b:0;\',
      \'path\' => FALSE,
      \'menu\' => array(
        \'link_title\' => \'How do I save a snapshot of a Bloom site?\',
        \'mlid\' => 0,
        \'plid\' => \'1008\',
        \'menu_name\' => \'main-menu\',
        \'weight\' => \'0\',
        \'options\' => array(),
        \'module\' => \'menu\',
        \'expanded\' => \'0\',
        \'hidden\' => \'0\',
        \'has_children\' => \'0\',
        \'customized\' => 0,
        \'parent_depth_limit\' => 8,
        \'description\' => \'\',
        \'enabled\' => 1,
      ),
      \'node_export_drupal_version\' => \'7\',
    ),
  (object) array(
      \'vid\' => \'7\',
      \'uid\' => \'1\',
      \'title\' => \'Documentation\',
      \'log\' => \'\',
      \'status\' => \'1\',
      \'comment\' => \'1\',
      \'promote\' => \'0\',
      \'sticky\' => \'0\',
      \'vuuid\' => \'919e098f-5c0c-475e-9362-78ce95b93d6d\',
      \'nid\' => \'6\',
      \'type\' => \'page\',
      \'language\' => \'und\',
      \'created\' => \'1399989298\',
      \'changed\' => \'1399989298\',
      \'tnid\' => \'0\',
      \'translate\' => \'0\',
      \'uuid\' => \'27ff6bea-4ac4-424d-b8e7-39742e0a5354\',
      \'revision_timestamp\' => \'1399989298\',
      \'revision_uid\' => \'1\',
      \'body\' => array(
        \'und\' => array(
          array(
            \'value\' => "<p>These docs are organzied as recipes. &nbsp;Choose a recipe from the menu on the left. &nbsp;(Don\'t forget Bloom is just an extensively configured drupal instance, so you can use that enormous mass of books, online help, forums..)</p>\\r\\n",
            \'summary\' => \'\',
            \'format\' => \'filtered_html\',
            \'safe_value\' => "<p>These docs are organzied as recipes.  Choose a recipe from the menu on the left.  (Don\'t forget Bloom is just an extensively configured drupal instance, so you can use that enormous mass of books, online help, forums..)</p>\\n",
            \'safe_summary\' => \'\',
          ),
        ),
      ),
      \'rdf_mapping\' => array(
        \'rdftype\' => array(
          \'foaf:Document\',
        ),
        \'title\' => array(
          \'predicates\' => array(
            \'dc:title\',
          ),
        ),
        \'created\' => array(
          \'predicates\' => array(
            \'dc:date\',
            \'dc:created\',
          ),
          \'datatype\' => \'xsd:dateTime\',
          \'callback\' => \'date_iso8601\',
        ),
        \'changed\' => array(
          \'predicates\' => array(
            \'dc:modified\',
          ),
          \'datatype\' => \'xsd:dateTime\',
          \'callback\' => \'date_iso8601\',
        ),
        \'body\' => array(
          \'predicates\' => array(
            \'content:encoded\',
          ),
        ),
        \'uid\' => array(
          \'predicates\' => array(
            \'sioc:has_creator\',
          ),
          \'type\' => \'rel\',
        ),
        \'name\' => array(
          \'predicates\' => array(
            \'foaf:name\',
          ),
        ),
        \'comment_count\' => array(
          \'predicates\' => array(
            \'sioc:num_replies\',
          ),
          \'datatype\' => \'xsd:integer\',
        ),
        \'last_activity\' => array(
          \'predicates\' => array(
            \'sioc:last_activity_date\',
          ),
          \'datatype\' => \'xsd:dateTime\',
          \'callback\' => \'date_iso8601\',
        ),
      ),
      \'cid\' => \'0\',
      \'last_comment_timestamp\' => \'1399989298\',
      \'last_comment_name\' => NULL,
      \'last_comment_uid\' => \'1\',
      \'comment_count\' => \'0\',
      \'name\' => \'admin\',
      \'picture\' => \'0\',
      \'data\' => \'b:0;\',
      \'path\' => FALSE,
      \'menu\' => array(
        \'link_title\' => \'Documentation\',
        \'mlid\' => 0,
        \'plid\' => \'0\',
        \'menu_name\' => \'main-menu\',
        \'weight\' => \'0\',
        \'options\' => array(),
        \'module\' => \'menu\',
        \'expanded\' => \'0\',
        \'hidden\' => \'0\',
        \'has_children\' => \'1\',
        \'customized\' => 0,
        \'parent_depth_limit\' => 8,
        \'description\' => \'\',
        \'enabled\' => 1,
      ),
      \'node_export_drupal_version\' => \'7\',
    ),
  (object) array(
      \'vid\' => \'10\',
      \'uid\' => \'1\',
      \'title\' => \'How to Create a New Bloom Development Site\',
      \'log\' => \'\',
      \'status\' => \'1\',
      \'comment\' => \'1\',
      \'promote\' => \'0\',
      \'sticky\' => \'0\',
      \'vuuid\' => \'0b85f8d7-e7ab-405d-a198-da3018ab19b0\',
      \'nid\' => \'9\',
      \'type\' => \'page\',
      \'language\' => \'und\',
      \'created\' => \'1399990350\',
      \'changed\' => \'1399990350\',
      \'tnid\' => \'0\',
      \'translate\' => \'0\',
      \'uuid\' => \'54857c27-a10f-46d2-acd4-f970319f0770\',
      \'revision_timestamp\' => \'1399990350\',
      \'revision_uid\' => \'1\',
      \'body\' => array(
        \'und\' => array(
          array(
            \'value\' => "<div>\\r\\n<h1>Creating a bloom development user site</h1>\\r\\n</div>\\r\\n\\r\\n<div>\\r\\n<ul>\\r\\n\\t<li>​Create the database with MySQL Workbench\\r\\n\\t<ol>\\r\\n\\t\\t<li>From the \\"Database\\" menu select \\"Migration Wizard...\\"</li>\\r\\n\\t\\t<li>Accept defaults until you get to the \\"Schema Selection\\" screen, and check only \\"bloom-dev\\"</li>\\r\\n\\t\\t<li>Defaults again until \\"Manual Editing\\",&nbsp;\\r\\n\\t\\t<ol>\\r\\n\\t\\t\\t<li>select \\"All Objects\\" from the drop down on the right</li>\\r\\n\\t\\t\\t<li>target objects column edit the database name changing it to your user-site\'s name</li>\\r\\n\\t\\t\\t<li>note: the last screen \\"Bulk Data Transfer\\" takes about 5 minutes to complete</li>\\r\\n\\t\\t</ol>\\r\\n\\t\\t</li>\\r\\n\\t\\t<li>create the mysql user that drupal will use for access\\r\\n\\t\\t<ol>\\r\\n\\t\\t\\t<li>\\"Users and Privileges\\" menu on left</li>\\r\\n\\t\\t\\t<li>\\"Add Account\\" button</li>\\r\\n\\t\\t\\t<li>Login tab - you set \\"Login Name:\\" and the password</li>\\r\\n\\t\\t\\t<li>\\"Schema Privileges\\" tab&nbsp;\\r\\n\\t\\t\\t<ol>\\r\\n\\t\\t\\t\\t<li>\\"Add Entry\\" button on right\\r\\n\\t\\t\\t\\t<ol>\\r\\n\\t\\t\\t\\t\\t<li>\\"Selected Schema\\" radio button</li>\\r\\n\\t\\t\\t\\t\\t<li>highlight the user-site schema - ok</li>\\r\\n\\t\\t\\t\\t\\t<li>\'Select \\"All\\"\' button, check \\"GRANT OPTION\\"&nbsp;</li>\\r\\n\\t\\t\\t\\t\\t<li>Apply (I do Refresh too)</li>\\r\\n\\t\\t\\t\\t</ol>\\r\\n\\t\\t\\t\\t</li>\\r\\n\\t\\t\\t</ol>\\r\\n\\t\\t\\t</li>\\r\\n\\t\\t</ol>\\r\\n\\t\\t</li>\\r\\n\\t</ol>\\r\\n\\t</li>\\r\\n\\t<li>Create a&nbsp;CNAME or whatever, on rit-wamp-dev I edit the c:/windows/system32/drivers/etc/hosts</li>\\r\\n\\t<li>Add an apache vhost by editing e:\\\\apache24\\\\conf\\\\extra\\\\httpd-vhosts.conf. &nbsp;Just mimic what\'s there.</li>\\r\\n\\t<li>open a command prompt and&nbsp;cd to e:\\\\UserSites</li>\\r\\n\\t<li>\\"E:\\\\UserSites\\\\&gt; git clone file:///e:/UserSites/bloom .\\\\User-site &nbsp; &nbsp; &nbsp; &nbsp;you set .\\\\User-site to the new one</li>\\r\\n\\t<li>Edit e:/usersites/user-site/sites/default/settings.php. &nbsp;Search for \\"bloom\\"; you only need to change&nbsp;those MySQL parameters.</li>\\r\\n\\t<li>Drupal tweaks\\r\\n\\t<ol>\\r\\n\\t\\t<li>browse to http://user-site-dev.meei.harvard.edu</li>\\r\\n\\t\\t<li>login as admin (ask Billy if we haven\'t figured out how to securely store these)</li>\\r\\n\\t\\t<li>click on the configuration menu.&nbsp;Top right \\"Site Information\\" - change the \\"Site Name\\" to user-site.meei.harvard.edu</li>\\r\\n\\t\\t<li>Report main menu -&gt; Status Report -&gt; click the requested stuff (update checks and the like)</li>\\r\\n\\t</ol>\\r\\n\\t</li>\\r\\n</ul>\\r\\n\\r\\n<div>\\r\\n<h2>&nbsp;</h2>\\r\\n</div>\\r\\n</div>\\r\\n",
            \'summary\' => \'\',
            \'format\' => \'filtered_html\',
            \'safe_value\' => "<p>Creating a bloom development user site</p>\\n<ul><li>​Create the database with MySQL Workbench\\n<ol><li>From the \\"Database\\" menu select \\"Migration Wizard...\\"</li>\\n<li>Accept defaults until you get to the \\"Schema Selection\\" screen, and check only \\"bloom-dev\\"</li>\\n<li>Defaults again until \\"Manual Editing\\", \\n<ol><li>select \\"All Objects\\" from the drop down on the right</li>\\n<li>target objects column edit the database name changing it to your user-site\'s name</li>\\n<li>note: the last screen \\"Bulk Data Transfer\\" takes about 5 minutes to complete</li>\\n</ol></li>\\n<li>create the mysql user that drupal will use for access\\n<ol><li>\\"Users and Privileges\\" menu on left</li>\\n<li>\\"Add Account\\" button</li>\\n<li>Login tab - you set \\"Login Name:\\" and the password</li>\\n<li>\\"Schema Privileges\\" tab \\n<ol><li>\\"Add Entry\\" button on right\\n<ol><li>\\"Selected Schema\\" radio button</li>\\n<li>highlight the user-site schema - ok</li>\\n<li>\'Select \\"All\\"\' button, check \\"GRANT OPTION\\" </li>\\n<li>Apply (I do Refresh too)</li>\\n</ol></li>\\n</ol></li>\\n</ol></li>\\n</ol></li>\\n<li>Create a CNAME or whatever, on rit-wamp-dev I edit the c:/windows/system32/drivers/etc/hosts</li>\\n<li>Add an apache vhost by editing e:\\\\apache24\\\\conf\\\\extra\\\\httpd-vhosts.conf.  Just mimic what\'s there.</li>\\n<li>open a command prompt and cd to e:\\\\UserSites</li>\\n<li>\\"E:\\\\UserSites\\\\&gt; git clone file:///e:/UserSites/bloom .\\\\User-site        you set .\\\\User-site to the new one</li>\\n<li>Edit e:/usersites/user-site/sites/default/settings.php.  Search for \\"bloom\\"; you only need to change those MySQL parameters.</li>\\n<li>Drupal tweaks\\n<ol><li>browse to <a href=\\"http://user-site-dev.meei.harvard.edu\\">http://user-site-dev.meei.harvard.edu</a></li>\\n<li>login as admin (ask Billy if we haven\'t figured out how to securely store these)</li>\\n<li>click on the configuration menu. Top right \\"Site Information\\" - change the \\"Site Name\\" to user-site.meei.harvard.edu</li>\\n<li>Report main menu -&gt; Status Report -&gt; click the requested stuff (update checks and the like)</li>\\n</ol></li>\\n</ul><p> </p>\\n",
            \'safe_summary\' => \'\',
          ),
        ),
      ),
      \'rdf_mapping\' => array(
        \'rdftype\' => array(
          \'foaf:Document\',
        ),
        \'title\' => array(
          \'predicates\' => array(
            \'dc:title\',
          ),
        ),
        \'created\' => array(
          \'predicates\' => array(
            \'dc:date\',
            \'dc:created\',
          ),
          \'datatype\' => \'xsd:dateTime\',
          \'callback\' => \'date_iso8601\',
        ),
        \'changed\' => array(
          \'predicates\' => array(
            \'dc:modified\',
          ),
          \'datatype\' => \'xsd:dateTime\',
          \'callback\' => \'date_iso8601\',
        ),
        \'body\' => array(
          \'predicates\' => array(
            \'content:encoded\',
          ),
        ),
        \'uid\' => array(
          \'predicates\' => array(
            \'sioc:has_creator\',
          ),
          \'type\' => \'rel\',
        ),
        \'name\' => array(
          \'predicates\' => array(
            \'foaf:name\',
          ),
        ),
        \'comment_count\' => array(
          \'predicates\' => array(
            \'sioc:num_replies\',
          ),
          \'datatype\' => \'xsd:integer\',
        ),
        \'last_activity\' => array(
          \'predicates\' => array(
            \'sioc:last_activity_date\',
          ),
          \'datatype\' => \'xsd:dateTime\',
          \'callback\' => \'date_iso8601\',
        ),
      ),
      \'cid\' => \'0\',
      \'last_comment_timestamp\' => \'1399990350\',
      \'last_comment_name\' => NULL,
      \'last_comment_uid\' => \'1\',
      \'comment_count\' => \'0\',
      \'name\' => \'admin\',
      \'picture\' => \'0\',
      \'data\' => \'b:0;\',
      \'path\' => FALSE,
      \'menu\' => array(
        \'link_title\' => \'How to Create a New Bloom Development Site\',
        \'mlid\' => 0,
        \'plid\' => \'1008\',
        \'menu_name\' => \'main-menu\',
        \'weight\' => \'0\',
        \'options\' => array(),
        \'module\' => \'menu\',
        \'expanded\' => \'0\',
        \'hidden\' => \'0\',
        \'has_children\' => \'0\',
        \'customized\' => 0,
        \'parent_depth_limit\' => 8,
        \'description\' => \'\',
        \'enabled\' => 1,
      ),
      \'node_export_drupal_version\' => \'7\',
    ),
  (object) array(
      \'vid\' => \'3\',
      \'uid\' => \'31\',
      \'title\' => \'How do I change the site name?\',
      \'log\' => \'\',
      \'status\' => \'1\',
      \'comment\' => \'2\',
      \'promote\' => \'0\',
      \'sticky\' => \'0\',
      \'vuuid\' => \'13dce6f5-be0b-48da-aee6-71755d8a7a59\',
      \'nid\' => \'2\',
      \'type\' => \'faq\',
      \'language\' => \'und\',
      \'created\' => \'1398780013\',
      \'changed\' => \'1399989627\',
      \'tnid\' => \'0\',
      \'translate\' => \'0\',
      \'uuid\' => \'946e8917-803e-4504-a19c-6c2fa0d31776\',
      \'revision_timestamp\' => \'1399989627\',
      \'revision_uid\' => \'1\',
      \'body\' => array(
        \'und\' => array(
          array(
            \'value\' => "<ol>\\r\\n\\t<li>Login as administrator</li>\\r\\n\\t<li>Click the \\"Configuration\\" menu at the top of the screen.</li>\\r\\n\\t<li>Select \\"Site Information\\" in the top left of the body of the page.</li>\\r\\n\\t<li>Change the value of the top field (i.e. \\"Site Name\\")</li>\\r\\n\\t<li>Click \\"Save Configuration\\" at the bottom of the screen.</li>\\r\\n\\t<li>Q.E.D.</li>\\r\\n</ol>\\r\\n",
            \'summary\' => \'\',
            \'format\' => \'filtered_html\',
            \'safe_value\' => "<ol><li>Login as administrator</li>\\n<li>Click the \\"Configuration\\" menu at the top of the screen.</li>\\n<li>Select \\"Site Information\\" in the top left of the body of the page.</li>\\n<li>Change the value of the top field (i.e. \\"Site Name\\")</li>\\n<li>Click \\"Save Configuration\\" at the bottom of the screen.</li>\\n<li>Q.E.D.</li>\\n</ol>",
            \'safe_summary\' => \'\',
          ),
        ),
      ),
      \'rdf_mapping\' => array(
        \'rdftype\' => array(
          \'sioc:Item\',
          \'foaf:Document\',
        ),
        \'title\' => array(
          \'predicates\' => array(
            \'dc:title\',
          ),
        ),
        \'created\' => array(
          \'predicates\' => array(
            \'dc:date\',
            \'dc:created\',
          ),
          \'datatype\' => \'xsd:dateTime\',
          \'callback\' => \'date_iso8601\',
        ),
        \'changed\' => array(
          \'predicates\' => array(
            \'dc:modified\',
          ),
          \'datatype\' => \'xsd:dateTime\',
          \'callback\' => \'date_iso8601\',
        ),
        \'body\' => array(
          \'predicates\' => array(
            \'content:encoded\',
          ),
        ),
        \'uid\' => array(
          \'predicates\' => array(
            \'sioc:has_creator\',
          ),
          \'type\' => \'rel\',
        ),
        \'name\' => array(
          \'predicates\' => array(
            \'foaf:name\',
          ),
        ),
        \'comment_count\' => array(
          \'predicates\' => array(
            \'sioc:num_replies\',
          ),
          \'datatype\' => \'xsd:integer\',
        ),
        \'last_activity\' => array(
          \'predicates\' => array(
            \'sioc:last_activity_date\',
          ),
          \'datatype\' => \'xsd:dateTime\',
          \'callback\' => \'date_iso8601\',
        ),
      ),
      \'cid\' => \'0\',
      \'last_comment_timestamp\' => \'1398780013\',
      \'last_comment_name\' => NULL,
      \'last_comment_uid\' => \'31\',
      \'comment_count\' => \'0\',
      \'name\' => \'goedicw\',
      \'picture\' => \'0\',
      \'data\' => \'a:6:{s:16:"ckeditor_default";s:1:"t";s:20:"ckeditor_show_toggle";s:1:"t";s:14:"ckeditor_width";s:4:"100%";s:13:"ckeditor_lang";s:2:"en";s:18:"ckeditor_auto_lang";s:1:"t";s:7:"overlay";i:1;}\',
      \'path\' => FALSE,
      \'menu\' => array(
        \'link_title\' => \'How do I change the site name?\',
        \'mlid\' => 0,
        \'plid\' => \'1008\',
        \'menu_name\' => \'main-menu\',
        \'weight\' => \'0\',
        \'options\' => array(),
        \'module\' => \'menu\',
        \'expanded\' => \'0\',
        \'hidden\' => \'0\',
        \'has_children\' => \'0\',
        \'customized\' => 0,
        \'parent_depth_limit\' => 8,
        \'description\' => \'\',
        \'enabled\' => 1,
      ),
      \'node_export_drupal_version\' => \'7\',
      \'node_export_dependency\' => array(
        array(
          \'type\' => \'user\',
          \'id\' => \'31\',
          \'delta\' => 0,
          \'property\' => \'uid\',
          \'module\' => \'node\',
          \'uuid\' => \'965a1352-72ef-41cf-b650-8fdc1d3a3c28\',
        ),
      ),
    ),
  (object) array(
      \'vid\' => \'4\',
      \'uid\' => \'31\',
      \'title\' => \'How do I apply updates?\',
      \'log\' => \'\',
      \'status\' => \'1\',
      \'comment\' => \'2\',
      \'promote\' => \'0\',
      \'sticky\' => \'0\',
      \'vuuid\' => \'c1cdb5cf-2782-4c5f-b05c-565983cb65a5\',
      \'nid\' => \'3\',
      \'type\' => \'faq\',
      \'language\' => \'und\',
      \'created\' => \'1398784032\',
      \'changed\' => \'1399989537\',
      \'tnid\' => \'0\',
      \'translate\' => \'0\',
      \'uuid\' => \'be0011b9-fcd9-4a74-a96f-3480c72535cd\',
      \'revision_timestamp\' => \'1399989537\',
      \'revision_uid\' => \'1\',
      \'body\' => array(
        \'und\' => array(
          array(
            \'value\' => "<ol>\\r\\n\\t<li>Click on the \\"Reports\\" menu at the top of the page.</li>\\r\\n\\t<li>Select \\"Available updates\\" near the top.</li>\\r\\n\\t<li>Click on \\"check manually\\"</li>\\r\\n\\t<li>Navigate to the \\"Update\\" tab on the upper right.</li>\\r\\n</ol>\\r\\n",
            \'summary\' => \'\',
            \'format\' => \'filtered_html\',
            \'safe_value\' => "<ol><li>Click on the \\"Reports\\" menu at the top of the page.</li>\\n<li>Select \\"Available updates\\" near the top.</li>\\n<li>Click on \\"check manually\\"</li>\\n<li>Navigate to the \\"Update\\" tab on the upper right.</li>\\n</ol>",
            \'safe_summary\' => \'\',
          ),
        ),
      ),
      \'rdf_mapping\' => array(
        \'rdftype\' => array(
          \'sioc:Item\',
          \'foaf:Document\',
        ),
        \'title\' => array(
          \'predicates\' => array(
            \'dc:title\',
          ),
        ),
        \'created\' => array(
          \'predicates\' => array(
            \'dc:date\',
            \'dc:created\',
          ),
          \'datatype\' => \'xsd:dateTime\',
          \'callback\' => \'date_iso8601\',
        ),
        \'changed\' => array(
          \'predicates\' => array(
            \'dc:modified\',
          ),
          \'datatype\' => \'xsd:dateTime\',
          \'callback\' => \'date_iso8601\',
        ),
        \'body\' => array(
          \'predicates\' => array(
            \'content:encoded\',
          ),
        ),
        \'uid\' => array(
          \'predicates\' => array(
            \'sioc:has_creator\',
          ),
          \'type\' => \'rel\',
        ),
        \'name\' => array(
          \'predicates\' => array(
            \'foaf:name\',
          ),
        ),
        \'comment_count\' => array(
          \'predicates\' => array(
            \'sioc:num_replies\',
          ),
          \'datatype\' => \'xsd:integer\',
        ),
        \'last_activity\' => array(
          \'predicates\' => array(
            \'sioc:last_activity_date\',
          ),
          \'datatype\' => \'xsd:dateTime\',
          \'callback\' => \'date_iso8601\',
        ),
      ),
      \'cid\' => \'0\',
      \'last_comment_timestamp\' => \'1398784032\',
      \'last_comment_name\' => NULL,
      \'last_comment_uid\' => \'31\',
      \'comment_count\' => \'0\',
      \'name\' => \'goedicw\',
      \'picture\' => \'0\',
      \'data\' => \'a:6:{s:16:"ckeditor_default";s:1:"t";s:20:"ckeditor_show_toggle";s:1:"t";s:14:"ckeditor_width";s:4:"100%";s:13:"ckeditor_lang";s:2:"en";s:18:"ckeditor_auto_lang";s:1:"t";s:7:"overlay";i:1;}\',
      \'path\' => FALSE,
      \'menu\' => array(
        \'link_title\' => \'How do I apply updates?\',
        \'mlid\' => 0,
        \'plid\' => \'1008\',
        \'menu_name\' => \'main-menu\',
        \'weight\' => \'0\',
        \'options\' => array(),
        \'module\' => \'menu\',
        \'expanded\' => \'0\',
        \'hidden\' => \'0\',
        \'has_children\' => \'0\',
        \'customized\' => 0,
        \'parent_depth_limit\' => 8,
        \'description\' => \'\',
        \'enabled\' => 1,
      ),
      \'node_export_drupal_version\' => \'7\',
      \'node_export_dependency\' => array(
        array(
          \'type\' => \'user\',
          \'id\' => \'31\',
          \'delta\' => 0,
          \'property\' => \'uid\',
          \'module\' => \'node\',
          \'uuid\' => \'965a1352-72ef-41cf-b650-8fdc1d3a3c28\',
        ),
      ),
    ),
  (object) array(
      \'vid\' => \'9\',
      \'uid\' => \'1\',
      \'title\' => \'How to Create a Bloom Infrastructure from Scratch (windows)\',
      \'log\' => \'\',
      \'status\' => \'1\',
      \'comment\' => \'1\',
      \'promote\' => \'0\',
      \'sticky\' => \'0\',
      \'vuuid\' => \'a9de082f-e137-468b-93d3-d1c0720e316a\',
      \'nid\' => \'8\',
      \'type\' => \'page\',
      \'language\' => \'und\',
      \'created\' => \'1399990132\',
      \'changed\' => \'1399990222\',
      \'tnid\' => \'0\',
      \'translate\' => \'0\',
      \'uuid\' => \'e567200e-ac29-4cdb-8de3-40c1eb40ae91\',
      \'revision_timestamp\' => \'1399990222\',
      \'revision_uid\' => \'1\',
      \'body\' => array(
        \'und\' => array(
          array(
            \'value\' => "<h1>Building a Bloom System from Scratch</h1>\\r\\n\\r\\n<ul>\\r\\n\\t<li>Create a dedicated disk. &nbsp;Here it\'s called e:</li>\\r\\n\\t<li>Unzip&nbsp;<a href=\\"http://www.apachelounge.com/download/VC11/binaries/httpd-2.4.9-win64-VC11.zip\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">httpd-2.4.9-win64-VC11.zip</a>&nbsp;and copy the folder Apache24 to e:\\\\</li>\\r\\n\\t<li>Create git repository\\r\\n\\t<ol>\\r\\n\\t\\t<li>​cd e:\\\\Apache24</li>\\r\\n\\t\\t<li>git init</li>\\r\\n\\t\\t<li>git add *</li>\\r\\n\\t\\t<li>git commit -m \\"Initial load of unzipped and unmodified httpd-2.4.9-win64-VC11.zip\\"</li>\\r\\n\\t</ol>\\r\\n\\t</li>\\r\\n\\t<li>Unzip&nbsp;<a href=\\"http://windows.php.net/downloads/releases/php-5.5.11-nts-Win32-VC11-x64.zip\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">php-5.5.11-Win32-VC11-x64.zip​</a>&nbsp;and renaame the folder to \\"php\\" then copy to e: resulting in e:\\\\php</li>\\r\\n\\t<li>I use&nbsp;<a href=\\"https://sourceforge.net/projects/passwordsafe/files/passwordsafe/3.33/pwsafe-3.33.exe/download\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">Password Safe</a>&nbsp;to create and maintain passwords. &nbsp;It generates obscure, randow passwords and securely stores them.</li>\\r\\n\\t<li>Create git repository\\r\\n\\t<ol>\\r\\n\\t\\t<li>​cd e:\\\\php</li>\\r\\n\\t\\t<li>git init</li>\\r\\n\\t\\t<li>git add *</li>\\r\\n\\t\\t<li>git commit -m \\"Initial load of unzipped and unmodified httpd-2.4.9-win64-VC11.zip​\\"</li>\\r\\n\\t</ol>\\r\\n\\t</li>\\r\\n\\t<li>Run&nbsp;<a href=\\"http://dev.mysql.com/downloads/file.php?id=451576\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">mysql-installer-web-community-5.6.17.0.msi​</a>\\r\\n\\t<ol>\\r\\n\\t\\t<li>​Couple OK-OKs</li>\\r\\n\\t\\t<li>Set \\"Installation Path:\\" to \\"e:\\\\MySQL\\\\\\"</li>\\r\\n\\t\\t<li>Set \\"Data Path:\\" to \\"e:\\\\MySQL\\\\MySQL Server 5.6\\\\\\"</li>\\r\\n\\t\\t<li>A bunch more OK, Next&gt;, and the like</li>\\r\\n\\t\\t<li>Set dbms root password. &nbsp;</li>\\r\\n\\t\\t<li>Add users\\r\\n\\t\\t<ol>\\r\\n\\t\\t\\t<li>username=bloom-dev, host=localhost</li>\\r\\n\\t\\t\\t<li>username=bloom-test, host=localhost</li>\\r\\n\\t\\t</ol>\\r\\n\\t\\t</li>\\r\\n\\t\\t<li>Windows Service Name=BloomDevTest_MySQL</li>\\r\\n\\t</ol>\\r\\n\\t</li>\\r\\n\\t<li>MySQL Workbench opens\\r\\n\\t<ol>\\r\\n\\t\\t<li>​Create schema bloom-dev</li>\\r\\n\\t\\t<li>Create schema bloom-test</li>\\r\\n\\t\\t<li>Users and Privileges from left menu</li>\\r\\n\\t\\t<li>Configure security for bloom-dev\\r\\n\\t\\t<ol>\\r\\n\\t\\t\\t<li>Select user&nbsp;bloom-dev</li>\\r\\n\\t\\t\\t<li>schema privileges tab</li>\\r\\n\\t\\t\\t<li>select specific schema&nbsp;radio button&nbsp;</li>\\r\\n\\t\\t\\t<li>select schema&nbsp;bloom-dev</li>\\r\\n\\t\\t\\t<li>select all privileges (I even add \\"grant option\\")</li>\\r\\n\\t\\t</ol>\\r\\n\\t\\t</li>\\r\\n\\t\\t<li>Repeat for bloom-test</li>\\r\\n\\t\\t<li>git stuff like above - git commit -m \\"Initial load of result of running mysql-installer-web-community-5.6.17.0.msi\\"</li>\\r\\n\\t</ol>\\r\\n\\t</li>\\r\\n\\t<li>Apache e:/Apache24/conf/httpd.conf&nbsp;Edits (following are lines that changed&nbsp;after editing)\\r\\n\\t<ul>\\r\\n\\t\\t<li>LoadModule php5_module \\"c:/php/php5apache2_4.dll\\"</li>\\r\\n\\t\\t<li>AddHandler application/x-httpd-php .php</li>\\r\\n\\t\\t<li># configure the path to php.ini</li>\\r\\n\\t\\t<li>PHPIniDir \\"E:/php\\"</li>\\r\\n\\t\\t<li>ServerRoot \\"e:/Apache24\\"</li>\\r\\n\\t\\t<li>DocumentRoot \\"e:/Apache24/htdocs\\"</li>\\r\\n\\t\\t<li>&lt;Directory \\"e:/Apache24/htdocs\\"&gt;​</li>\\r\\n\\t\\t<li>LoadModule vhost_alias_module modules/mod_vhost_alias.so</li>\\r\\n\\t\\t<li>Include conf/extra/httpd-vhosts.conf</li>\\r\\n\\t\\t<li>&nbsp; &nbsp; DirectoryIndex index.html index.php</li>\\r\\n\\t</ul>\\r\\n\\t</li>\\r\\n\\t<li>Apache e:/Apache32/conf/extras/httpd-vhosts.conf\\r\\n\\t<ul>\\r\\n\\t\\t<li>&lt;VirtualHost *:80&gt;</li>\\r\\n\\t\\t<li>&nbsp; &nbsp; DocumentRoot e:/UserSites/bloom</li>\\r\\n\\t\\t<li>&nbsp; &nbsp; ServerName bloom-dev.meei.harvard.edu</li>\\r\\n\\t\\t<li>&nbsp; &nbsp; &lt;location /&gt;</li>\\r\\n\\t\\t<li>&nbsp; &nbsp; &nbsp; &nbsp;Require all granted</li>\\r\\n\\t\\t<li>&nbsp; &nbsp; &lt;/location&gt;</li>\\r\\n\\t\\t<li>&lt;/VirtualHost&gt;</li>\\r\\n\\t</ul>\\r\\n\\t</li>\\r\\n\\t<li>e:/php/php.ini\\r\\n\\t<ul>\\r\\n\\t\\t<li>extension=php_gd2.dll</li>\\r\\n\\t\\t<li>extension=php_pdo_mysql.dll​</li>\\r\\n\\t\\t<li>extension_dir = \\"e:/php/ext\\"</li>\\r\\n\\t\\t<li>extension=php_mbstring.dll</li>\\r\\n\\t</ul>\\r\\n\\t</li>\\r\\n\\t<li>Extend Drupal functionality with modules we need. &nbsp;There\'s a lot of pointing and clicking for each module. &nbsp;I\'ll detail the first module installation, then just give the name of the subsequent modules. &nbsp;They\'re all installed by the same sequence of steps described in the first one.\\r\\n\\t<ol>\\r\\n\\t\\t<li><a href=\\"http://ftp.drupal.org/files/projects/ctools-7.x-1.4.zip\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">Chaos Tools</a>\\r\\n\\t\\t<ol>\\r\\n\\t\\t\\t<li>Browse to http://eyegene.meei.harvard.edu and login</li>\\r\\n\\t\\t\\t<li>Select \\"Modules\\" from the top tab bar</li>\\r\\n\\t\\t\\t<li>Click \\"Install New Module\\"&nbsp;(I right-click and open this in a new tab so I can switch back and forth)</li>\\r\\n\\t\\t\\t<li>Click the \\"modules\\" link in the sentence \\"You can find modules...\\"&nbsp;</li>\\r\\n\\t\\t\\t<li>Use search to find your module, you may have to scroll down the returned list; click on your module name</li>\\r\\n\\t\\t\\t<li>Scroll down to the listing of \\"recommended release\\"&nbsp;archive files and right click to copy the link to the zip for version 7.x...</li>\\r\\n\\t\\t\\t<li>Browse back to the Modules installation&nbsp;page on your local server</li>\\r\\n\\t\\t\\t<li>Paste the link to the zipfile into \\"Installation URL\\" and click the \\"Install\\" button</li>\\r\\n\\t\\t\\t<li>After install finishes click on \\"Enable Installed Modules\\"</li>\\r\\n\\t\\t\\t<li>Scroll down list of modules to your newly installed one, and check the \\"Enable\\" box on the left</li>\\r\\n\\t\\t\\t<li>Click \\"Save Configuration\\" button at the bottom and move on to the next module.</li>\\r\\n\\t\\t</ol>\\r\\n\\t\\t</li>\\r\\n\\t\\t<li><a href=\\"http://ftp.drupal.org/files/projects/entity-7.x-1.4.zip\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">Entity API</a></li>\\r\\n\\t\\t<li><a href=\\"http://ftp.drupal.org/files/projects/workflow-7.x-2.2.zip\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">Workflow​</a></li>\\r\\n\\t\\t<li><a href=\\"http://ftp.drupal.org/files/projects/rules-7.x-2.6.zip\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">Rules</a></li>\\r\\n\\t\\t<li><a href=\\"http://ftp.drupal.org/files/projects/field_validation-7.x-2.3.zip\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">Field Validation</a></li>\\r\\n\\t\\t<li><a href=\\"http://ftp.drupal.org/files/projects/addressfield-7.x-1.0-beta5.zip\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">Addressfield</a></li>\\r\\n\\t\\t<li><a href=\\"http://ftp.drupal.org/files/projects/sliderfield-7.x-2.0-alpha4.zip\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">Sliderfield</a></li>\\r\\n\\t\\t<li><a href=\\"http://ftp.drupal.org/files/projects/date-7.x-2.7.zip\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">Date</a></li>\\r\\n\\t\\t<li><a href=\\"http://ftp.drupal.org/files/projects/addressfield_phone-7.x-1.1.zip\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">Addressfield Phone</a></li>\\r\\n\\t\\t<li><a href=\\"http://ftp.drupal.org/files/projects/email-7.x-1.2.zip\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">Email Field</a></li>\\r\\n\\t\\t<li><a href=\\"http://ftp.drupal.org/files/projects/field_group-7.x-1.3.zip\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">Fieldgroup</a></li>\\r\\n\\t\\t<li><a href=\\"http://ftp.drupal.org/files/projects/views-7.x-3.7.zip\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">Views</a></li>\\r\\n\\t\\t<li><a href=\\"http://ftp.drupal.org/files/projects/views_data_export-7.x-3.0-beta7.zip\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">Views Data Export</a></li>\\r\\n\\t\\t<li><a href=\\"http://ftp.drupal.org/files/projects/auto_nodetitle-7.x-1.0.zip\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">Automatic Nodetitles​</a></li>\\r\\n\\t\\t<li><a href=\\"http://ftp.drupal.org/files/projects/og-7.x-2.6.zip\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">Organic Groups</a></li>\\r\\n\\t\\t<li>​Universal Unique ID</li>\\r\\n\\t\\t<li>Feeds</li>\\r\\n\\t\\t<li>Node Export</li>\\r\\n\\t\\t<li>Job Scheduler</li>\\r\\n\\t</ol>\\r\\n\\t</li>\\r\\n</ul>\\r\\n\\r\\n<div>\\r\\n<h1>&nbsp;</h1>\\r\\n</div>\\r\\n",
            \'summary\' => \'\',
            \'format\' => \'full_html\',
            \'safe_value\' => "<h1>Building a Bloom System from Scratch</h1>\\n<ul><li>Create a dedicated disk.  Here it\'s called e:</li>\\n<li>Unzip <a href=\\"http://www.apachelounge.com/download/VC11/binaries/httpd-2.4.9-win64-VC11.zip\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">httpd-2.4.9-win64-VC11.zip</a> and copy the folder Apache24 to e:\\\\</li>\\n<li>Create git repository\\n<ol><li>​cd e:\\\\Apache24</li>\\n<li>git init</li>\\n<li>git add *</li>\\n<li>git commit -m \\"Initial load of unzipped and unmodified httpd-2.4.9-win64-VC11.zip\\"</li>\\n</ol></li>\\n<li>Unzip <a href=\\"http://windows.php.net/downloads/releases/php-5.5.11-nts-Win32-VC11-x64.zip\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">php-5.5.11-Win32-VC11-x64.zip​</a> and renaame the folder to \\"php\\" then copy to e: resulting in e:\\\\php</li>\\n<li>I use <a href=\\"https://sourceforge.net/projects/passwordsafe/files/passwordsafe/3.33/pwsafe-3.33.exe/download\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">Password Safe</a> to create and maintain passwords.  It generates obscure, randow passwords and securely stores them.</li>\\n<li>Create git repository\\n<ol><li>​cd e:\\\\php</li>\\n<li>git init</li>\\n<li>git add *</li>\\n<li>git commit -m \\"Initial load of unzipped and unmodified httpd-2.4.9-win64-VC11.zip​\\"</li>\\n</ol></li>\\n<li>Run <a href=\\"http://dev.mysql.com/downloads/file.php?id=451576\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">mysql-installer-web-community-5.6.17.0.msi​</a>\\n<ol><li>​Couple OK-OKs</li>\\n<li>Set \\"Installation Path:\\" to \\"e:\\\\MySQL\\\\\\"</li>\\n<li>Set \\"Data Path:\\" to \\"e:\\\\MySQL\\\\MySQL Server 5.6\\\\\\"</li>\\n<li>A bunch more OK, Next&gt;, and the like</li>\\n<li>Set dbms root password.  </li>\\n<li>Add users\\n<ol><li>username=bloom-dev, host=localhost</li>\\n<li>username=bloom-test, host=localhost</li>\\n</ol></li>\\n<li>Windows Service Name=BloomDevTest_MySQL</li>\\n</ol></li>\\n<li>MySQL Workbench opens\\n<ol><li>​Create schema bloom-dev</li>\\n<li>Create schema bloom-test</li>\\n<li>Users and Privileges from left menu</li>\\n<li>Configure security for bloom-dev\\n<ol><li>Select user bloom-dev</li>\\n<li>schema privileges tab</li>\\n<li>select specific schema radio button </li>\\n<li>select schema bloom-dev</li>\\n<li>select all privileges (I even add \\"grant option\\")</li>\\n</ol></li>\\n<li>Repeat for bloom-test</li>\\n<li>git stuff like above - git commit -m \\"Initial load of result of running mysql-installer-web-community-5.6.17.0.msi\\"</li>\\n</ol></li>\\n<li>Apache e:/Apache24/conf/httpd.conf Edits (following are lines that changed after editing)\\n<ul><li>LoadModule php5_module \\"c:/php/php5apache2_4.dll\\"</li>\\n<li>AddHandler application/x-httpd-php .php</li>\\n<li># configure the path to php.ini</li>\\n<li>PHPIniDir \\"E:/php\\"</li>\\n<li>ServerRoot \\"e:/Apache24\\"</li>\\n<li>DocumentRoot \\"e:/Apache24/htdocs\\"</li>\\n<li>&lt;Directory \\"e:/Apache24/htdocs\\"&gt;​</li>\\n<li>LoadModule vhost_alias_module modules/mod_vhost_alias.so</li>\\n<li>Include conf/extra/httpd-vhosts.conf</li>\\n<li>    DirectoryIndex index.html index.php</li>\\n</ul></li>\\n<li>Apache e:/Apache32/conf/extras/httpd-vhosts.conf\\n<ul><li>&lt;VirtualHost *:80&gt;</li>\\n<li>    DocumentRoot e:/UserSites/bloom</li>\\n<li>    ServerName bloom-dev.meei.harvard.edu</li>\\n<li>    &lt;location /&gt;</li>\\n<li>       Require all granted</li>\\n<li>    &lt;/location&gt;</li>\\n<li>&lt;/VirtualHost&gt;</li>\\n</ul></li>\\n<li>e:/php/php.ini\\n<ul><li>extension=php_gd2.dll</li>\\n<li>extension=php_pdo_mysql.dll​</li>\\n<li>extension_dir = \\"e:/php/ext\\"</li>\\n<li>extension=php_mbstring.dll</li>\\n</ul></li>\\n<li>Extend Drupal functionality with modules we need.  There\'s a lot of pointing and clicking for each module.  I\'ll detail the first module installation, then just give the name of the subsequent modules.  They\'re all installed by the same sequence of steps described in the first one.\\n<ol><li><a href=\\"http://ftp.drupal.org/files/projects/ctools-7.x-1.4.zip\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">Chaos Tools</a>\\n<ol><li>Browse to <a href=\\"http://eyegene.meei.harvard.edu\\">http://eyegene.meei.harvard.edu</a> and login</li>\\n<li>Select \\"Modules\\" from the top tab bar</li>\\n<li>Click \\"Install New Module\\" (I right-click and open this in a new tab so I can switch back and forth)</li>\\n<li>Click the \\"modules\\" link in the sentence \\"You can find modules...\\" </li>\\n<li>Use search to find your module, you may have to scroll down the returned list; click on your module name</li>\\n<li>Scroll down to the listing of \\"recommended release\\" archive files and right click to copy the link to the zip for version 7.x...</li>\\n<li>Browse back to the Modules installation page on your local server</li>\\n<li>Paste the link to the zipfile into \\"Installation URL\\" and click the \\"Install\\" button</li>\\n<li>After install finishes click on \\"Enable Installed Modules\\"</li>\\n<li>Scroll down list of modules to your newly installed one, and check the \\"Enable\\" box on the left</li>\\n<li>Click \\"Save Configuration\\" button at the bottom and move on to the next module.</li>\\n</ol></li>\\n<li><a href=\\"http://ftp.drupal.org/files/projects/entity-7.x-1.4.zip\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">Entity API</a></li>\\n<li><a href=\\"http://ftp.drupal.org/files/projects/workflow-7.x-2.2.zip\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">Workflow​</a></li>\\n<li><a href=\\"http://ftp.drupal.org/files/projects/rules-7.x-2.6.zip\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">Rules</a></li>\\n<li><a href=\\"http://ftp.drupal.org/files/projects/field_validation-7.x-2.3.zip\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">Field Validation</a></li>\\n<li><a href=\\"http://ftp.drupal.org/files/projects/addressfield-7.x-1.0-beta5.zip\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">Addressfield</a></li>\\n<li><a href=\\"http://ftp.drupal.org/files/projects/sliderfield-7.x-2.0-alpha4.zip\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">Sliderfield</a></li>\\n<li><a href=\\"http://ftp.drupal.org/files/projects/date-7.x-2.7.zip\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">Date</a></li>\\n<li><a href=\\"http://ftp.drupal.org/files/projects/addressfield_phone-7.x-1.1.zip\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">Addressfield Phone</a></li>\\n<li><a href=\\"http://ftp.drupal.org/files/projects/email-7.x-1.2.zip\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">Email Field</a></li>\\n<li><a href=\\"http://ftp.drupal.org/files/projects/field_group-7.x-1.3.zip\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">Fieldgroup</a></li>\\n<li><a href=\\"http://ftp.drupal.org/files/projects/views-7.x-3.7.zip\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">Views</a></li>\\n<li><a href=\\"http://ftp.drupal.org/files/projects/views_data_export-7.x-3.0-beta7.zip\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">Views Data Export</a></li>\\n<li><a href=\\"http://ftp.drupal.org/files/projects/auto_nodetitle-7.x-1.0.zip\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">Automatic Nodetitles​</a></li>\\n<li><a href=\\"http://ftp.drupal.org/files/projects/og-7.x-2.6.zip\\" style=\\"text-decoration: none; color: rgb(177, 0, 105);\\">Organic Groups</a></li>\\n<li>​Universal Unique ID</li>\\n<li>Feeds</li>\\n<li>Node Export</li>\\n<li>Job Scheduler</li>\\n</ol></li>\\n</ul><div>\\n<h1> </h1>\\n</div>\\n",
            \'safe_summary\' => \'\',
          ),
        ),
      ),
      \'rdf_mapping\' => array(
        \'rdftype\' => array(
          \'foaf:Document\',
        ),
        \'title\' => array(
          \'predicates\' => array(
            \'dc:title\',
          ),
        ),
        \'created\' => array(
          \'predicates\' => array(
            \'dc:date\',
            \'dc:created\',
          ),
          \'datatype\' => \'xsd:dateTime\',
          \'callback\' => \'date_iso8601\',
        ),
        \'changed\' => array(
          \'predicates\' => array(
            \'dc:modified\',
          ),
          \'datatype\' => \'xsd:dateTime\',
          \'callback\' => \'date_iso8601\',
        ),
        \'body\' => array(
          \'predicates\' => array(
            \'content:encoded\',
          ),
        ),
        \'uid\' => array(
          \'predicates\' => array(
            \'sioc:has_creator\',
          ),
          \'type\' => \'rel\',
        ),
        \'name\' => array(
          \'predicates\' => array(
            \'foaf:name\',
          ),
        ),
        \'comment_count\' => array(
          \'predicates\' => array(
            \'sioc:num_replies\',
          ),
          \'datatype\' => \'xsd:integer\',
        ),
        \'last_activity\' => array(
          \'predicates\' => array(
            \'sioc:last_activity_date\',
          ),
          \'datatype\' => \'xsd:dateTime\',
          \'callback\' => \'date_iso8601\',
        ),
      ),
      \'cid\' => \'0\',
      \'last_comment_timestamp\' => \'1399990132\',
      \'last_comment_name\' => NULL,
      \'last_comment_uid\' => \'1\',
      \'comment_count\' => \'0\',
      \'name\' => \'admin\',
      \'picture\' => \'0\',
      \'data\' => \'b:0;\',
      \'path\' => FALSE,
      \'menu\' => array(
        \'link_title\' => \'How to Create a Bloom Infrastructure from Scratch (windows)\',
        \'mlid\' => 0,
        \'plid\' => \'1008\',
        \'menu_name\' => \'main-menu\',
        \'weight\' => \'0\',
        \'options\' => array(),
        \'module\' => \'menu\',
        \'expanded\' => \'0\',
        \'hidden\' => \'0\',
        \'has_children\' => \'0\',
        \'customized\' => 0,
        \'parent_depth_limit\' => 8,
        \'description\' => \'\',
        \'enabled\' => 1,
      ),
      \'node_export_drupal_version\' => \'7\',
    ),
)',
);
  return $node_export;
}

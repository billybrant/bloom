<?php
/**
 * @file
 * implementation_materials.features.node_export_features.inc
 */

/**
 * Implements hook_node_export_features_default().
 */
function implementation_materials_node_export_features_default() {
  $node_export = array(
  'code_string' => 'array(
  (object) array(
      \'vid\' => \'6009\',
      \'uid\' => \'196\',
      \'title\' => \'Data Import Issues\',
      \'log\' => \'\',
      \'status\' => \'1\',
      \'comment\' => \'2\',
      \'promote\' => \'0\',
      \'sticky\' => \'0\',
      \'vuuid\' => \'8f096cc5-086a-4a93-ae6a-86ea0d0c520a\',
      \'nid\' => \'6008\',
      \'type\' => \'forum\',
      \'language\' => \'und\',
      \'created\' => \'1411572002\',
      \'changed\' => \'1411575942\',
      \'tnid\' => \'0\',
      \'translate\' => \'0\',
      \'uuid\' => \'03a5e719-242c-4efa-be81-a94cb153eac0\',
      \'revision_timestamp\' => \'1411575942\',
      \'revision_uid\' => \'1\',
      \'taxonomy_forums\' => array(
        \'und\' => array(
          array(
            \'tid\' => \'48680\',
          ),
        ),
      ),
      \'body\' => array(
        \'und\' => array(
          array(
            \'value\' => "<p>We\'ll be doing some clean-up of the existing data as we load it into TBone. &nbsp;Please comment here on what those issues are, and how they\'re resolved.</p>\\r\\n",
            \'summary\' => \'\',
            \'format\' => \'full_html\',
            \'safe_value\' => "<p>We\'ll be doing some clean-up of the existing data as we load it into TBone.  Please comment here on what those issues are, and how they\'re resolved.</p>\\n",
            \'safe_summary\' => \'\',
          ),
        ),
      ),
      \'rdf_mapping\' => array(
        \'rdftype\' => array(
          \'sioc:Post\',
          \'sioct:BoardPost\',
        ),
        \'taxonomy_forums\' => array(
          \'predicates\' => array(
            \'sioc:has_container\',
          ),
          \'type\' => \'rel\',
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
      \'last_comment_timestamp\' => \'1411572002\',
      \'last_comment_name\' => NULL,
      \'last_comment_uid\' => \'196\',
      \'comment_count\' => \'0\',
      \'name\' => \'goedsole\',
      \'picture\' => \'0\',
      \'data\' => \'a:6:{s:16:"ckeditor_default";s:1:"t";s:20:"ckeditor_show_toggle";s:1:"t";s:14:"ckeditor_width";s:4:"100%";s:13:"ckeditor_lang";s:2:"en";s:18:"ckeditor_auto_lang";s:1:"t";s:7:"overlay";i:1;}\',
      \'forum_tid\' => \'48680\',
      \'path\' => FALSE,
      \'menu\' => NULL,
      \'node_export_drupal_version\' => \'7\',
      \'node_export_dependency\' => array(
        array(
          \'type\' => \'taxonomy_term\',
          \'id\' => \'48680\',
          \'delta\' => 0,
          \'property\' => \'tid\',
          \'module\' => \'taxonomy\',
          \'field_name\' => \'taxonomy_forums\',
          \'langcode\' => \'und\',
          \'uuid\' => \'7a732a9d-f103-4ee3-b3d5-f29e4119c5e2\',
        ),
        array(
          \'type\' => \'user\',
          \'id\' => \'196\',
          \'delta\' => 0,
          \'property\' => \'uid\',
          \'module\' => \'node\',
          \'uuid\' => \'3fef8e21-1ad6-47aa-a14a-5f2c3be2ed2f\',
        ),
      ),
    ),
  (object) array(
      \'vid\' => \'6007\',
      \'uid\' => \'1\',
      \'title\' => \'Use Cases\',
      \'log\' => \'\',
      \'status\' => \'1\',
      \'comment\' => \'2\',
      \'promote\' => \'0\',
      \'sticky\' => \'0\',
      \'vuuid\' => \'aa670fc2-15f3-45ee-ad84-79d345a6c784\',
      \'nid\' => \'6006\',
      \'type\' => \'forum\',
      \'language\' => \'und\',
      \'created\' => \'1411568788\',
      \'changed\' => \'1411575942\',
      \'tnid\' => \'0\',
      \'translate\' => \'0\',
      \'uuid\' => \'422d1b3a-3a10-469d-898b-e57dd1f84d96\',
      \'revision_timestamp\' => \'1411575942\',
      \'revision_uid\' => \'1\',
      \'taxonomy_forums\' => array(
        \'und\' => array(
          array(
            \'tid\' => \'48680\',
          ),
        ),
      ),
      \'body\' => array(
        \'und\' => array(
          array(
            \'value\' => "<p>An inventory of how TBone will be used provides a managable framework to articulate the policies that determine who has permission to do what. &nbsp;Below is a table showing the inventory of information and relationships we need to capture. &nbsp;Each colum&nbsp;is called a \\"use-case\\".</p>\\r\\n\\r\\n<table align=\\"center\\" border=\\"1\\" cellpadding=\\"1\\" cellspacing=\\"1\\" style=\\"line-height:20.7999992370605px; width:488.799987792969px\\">\\r\\n\\t<thead>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<th scope=\\"col\\">Category of Information</th>\\r\\n\\t\\t\\t<th scope=\\"col\\">External Researcher Browses Samples for Use</th>\\r\\n\\t\\t\\t<th scope=\\"col\\">Unsecure Data is Entered by Staff</th>\\r\\n\\t\\t\\t<th scope=\\"col\\">Images are Added to Existing Samples</th>\\r\\n\\t\\t\\t<th scope=\\"col\\"><em>Several Others...</em></th>\\r\\n\\t\\t</tr>\\r\\n\\t</thead>\\r\\n\\t<tbody>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">HIPAA Protected</td>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">No Access</td>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">No Access</td>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">No Access</td>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">?</td>\\r\\n\\t\\t</tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">Tray / Cut Angle / Unstained</td>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">Read</td>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">Write</td>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">No Access</td>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">?</td>\\r\\n\\t\\t</tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">Record ID / Sample</td>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">Read</td>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">Write</td>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">Read</td>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">?</td>\\r\\n\\t\\t</tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">Unprotected Bio/Demo</td>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">Read</td>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">Write</td>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">No Access</td>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">?</td>\\r\\n\\t\\t</tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">Fixitive</td>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">Read</td>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">Write</td>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">No Access</td>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">?</td>\\r\\n\\t\\t</tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">Materials Available (CT Scan, Images...</td>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">Read</td>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">Write</td>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">Write</td>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">?</td>\\r\\n\\t\\t</tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">Case Notes</td>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">Read</td>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">Write</td>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">No Access</td>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">?</td>\\r\\n\\t\\t</tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">Images</td>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">Read</td>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">Write</td>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">Write</td>\\r\\n\\t\\t\\t<td class=\\"rtecenter\\">?<br />\\r\\n\\t\\t\\t&nbsp;</td>\\r\\n\\t\\t</tr>\\r\\n\\t</tbody>\\r\\n</table>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\\r\\n<h2>Comment Liberally</h2>\\r\\n\\r\\n<p>By commenting here regarding use-cases we develop a record of policy decisions, a single source that we all share, so ideas don\'t get lost. &nbsp;Below I\'ve added the&nbsp;\\"MEEI Physicians\\" comment as an example of what\'s needed.</p>\\r\\n",
            \'summary\' => \'\',
            \'format\' => \'full_html\',
            \'safe_value\' => "<p>An inventory of how TBone will be used provides a managable framework to articulate the policies that determine who has permission to do what.  Below is a table showing the inventory of information and relationships we need to capture.  Each colum is called a \\"use-case\\".</p>\\n<table align=\\"center\\" border=\\"1\\" cellpadding=\\"1\\" cellspacing=\\"1\\" style=\\"line-height:20.7999992370605px; width:488.799987792969px\\"><thead><tr><th scope=\\"col\\">Category of Information</th>\\n<th scope=\\"col\\">External Researcher Browses Samples for Use</th>\\n<th scope=\\"col\\">Unsecure Data is Entered by Staff</th>\\n<th scope=\\"col\\">Images are Added to Existing Samples</th>\\n<th scope=\\"col\\"><em>Several Others...</em></th>\\n</tr></thead><tbody><tr><td class=\\"rtecenter\\">HIPAA Protected</td>\\n<td class=\\"rtecenter\\">No Access</td>\\n<td class=\\"rtecenter\\">No Access</td>\\n<td class=\\"rtecenter\\">No Access</td>\\n<td class=\\"rtecenter\\">?</td>\\n</tr><tr><td class=\\"rtecenter\\">Tray / Cut Angle / Unstained</td>\\n<td class=\\"rtecenter\\">Read</td>\\n<td class=\\"rtecenter\\">Write</td>\\n<td class=\\"rtecenter\\">No Access</td>\\n<td class=\\"rtecenter\\">?</td>\\n</tr><tr><td class=\\"rtecenter\\">Record ID / Sample</td>\\n<td class=\\"rtecenter\\">Read</td>\\n<td class=\\"rtecenter\\">Write</td>\\n<td class=\\"rtecenter\\">Read</td>\\n<td class=\\"rtecenter\\">?</td>\\n</tr><tr><td class=\\"rtecenter\\">Unprotected Bio/Demo</td>\\n<td class=\\"rtecenter\\">Read</td>\\n<td class=\\"rtecenter\\">Write</td>\\n<td class=\\"rtecenter\\">No Access</td>\\n<td class=\\"rtecenter\\">?</td>\\n</tr><tr><td class=\\"rtecenter\\">Fixitive</td>\\n<td class=\\"rtecenter\\">Read</td>\\n<td class=\\"rtecenter\\">Write</td>\\n<td class=\\"rtecenter\\">No Access</td>\\n<td class=\\"rtecenter\\">?</td>\\n</tr><tr><td class=\\"rtecenter\\">Materials Available (CT Scan, Images...</td>\\n<td class=\\"rtecenter\\">Read</td>\\n<td class=\\"rtecenter\\">Write</td>\\n<td class=\\"rtecenter\\">Write</td>\\n<td class=\\"rtecenter\\">?</td>\\n</tr><tr><td class=\\"rtecenter\\">Case Notes</td>\\n<td class=\\"rtecenter\\">Read</td>\\n<td class=\\"rtecenter\\">Write</td>\\n<td class=\\"rtecenter\\">No Access</td>\\n<td class=\\"rtecenter\\">?</td>\\n</tr><tr><td class=\\"rtecenter\\">Images</td>\\n<td class=\\"rtecenter\\">Read</td>\\n<td class=\\"rtecenter\\">Write</td>\\n<td class=\\"rtecenter\\">Write</td>\\n<td class=\\"rtecenter\\">?<br />\\n\\t\\t\\t </td>\\n</tr></tbody></table><p> </p>\\n<h2>Comment Liberally</h2>\\n<p>By commenting here regarding use-cases we develop a record of policy decisions, a single source that we all share, so ideas don\'t get lost.  Below I\'ve added the \\"MEEI Physicians\\" comment as an example of what\'s needed.</p>\\n",
            \'safe_summary\' => \'\',
          ),
        ),
      ),
      \'rdf_mapping\' => array(
        \'rdftype\' => array(
          \'sioc:Post\',
          \'sioct:BoardPost\',
        ),
        \'taxonomy_forums\' => array(
          \'predicates\' => array(
            \'sioc:has_container\',
          ),
          \'type\' => \'rel\',
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
      \'cid\' => \'6\',
      \'last_comment_timestamp\' => \'1411579141\',
      \'last_comment_name\' => \'\',
      \'last_comment_uid\' => \'1\',
      \'comment_count\' => \'3\',
      \'name\' => \'admin\',
      \'picture\' => \'0\',
      \'data\' => \'a:7:{s:16:"ckeditor_default";s:1:"t";s:20:"ckeditor_show_toggle";s:1:"t";s:14:"ckeditor_width";s:4:"100%";s:13:"ckeditor_lang";s:2:"en";s:18:"ckeditor_auto_lang";s:1:"t";s:7:"overlay";i:1;s:25:"overlay_message_dismissed";i:1;}\',
      \'forum_tid\' => \'48680\',
      \'path\' => FALSE,
      \'menu\' => NULL,
      \'node_export_drupal_version\' => \'7\',
      \'node_export_dependency\' => array(
        array(
          \'type\' => \'taxonomy_term\',
          \'id\' => \'48680\',
          \'delta\' => 0,
          \'property\' => \'tid\',
          \'module\' => \'taxonomy\',
          \'field_name\' => \'taxonomy_forums\',
          \'langcode\' => \'und\',
          \'uuid\' => \'7a732a9d-f103-4ee3-b3d5-f29e4119c5e2\',
        ),
      ),
    ),
  (object) array(
      \'vid\' => \'6010\',
      \'uid\' => \'196\',
      \'title\' => \'Our Content Types\',
      \'log\' => \'\',
      \'status\' => \'1\',
      \'comment\' => \'2\',
      \'promote\' => \'0\',
      \'sticky\' => \'0\',
      \'vuuid\' => \'10dc5566-409d-47d9-a008-995a2df2781e\',
      \'nid\' => \'6009\',
      \'type\' => \'forum\',
      \'language\' => \'und\',
      \'created\' => \'1411572245\',
      \'changed\' => \'1411576024\',
      \'tnid\' => \'0\',
      \'translate\' => \'0\',
      \'uuid\' => \'d1bdbc06-9b3c-4e6c-9a07-dc997c5c893c\',
      \'revision_timestamp\' => \'1411576024\',
      \'revision_uid\' => \'1\',
      \'taxonomy_forums\' => array(
        \'und\' => array(
          array(
            \'tid\' => \'48680\',
          ),
        ),
      ),
      \'body\' => array(
        \'und\' => array(
          array(
            \'value\' => "<p>Content types are the core of your system, they\'re analogous to tables in a relational database. &nbsp;Please comment here on design ideas, issues, and join logic for your content types.</p>\\r\\n",
            \'summary\' => \'\',
            \'format\' => \'full_html\',
            \'safe_value\' => "<p>Content types are the core of your system, they\'re analogous to tables in a relational database.  Please comment here on design ideas, issues, and join logic for your content types.</p>\\n",
            \'safe_summary\' => \'\',
          ),
        ),
      ),
      \'rdf_mapping\' => array(
        \'rdftype\' => array(
          \'sioc:Post\',
          \'sioct:BoardPost\',
        ),
        \'taxonomy_forums\' => array(
          \'predicates\' => array(
            \'sioc:has_container\',
          ),
          \'type\' => \'rel\',
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
      \'last_comment_timestamp\' => \'1411572245\',
      \'last_comment_name\' => NULL,
      \'last_comment_uid\' => \'196\',
      \'comment_count\' => \'0\',
      \'name\' => \'goedsole\',
      \'picture\' => \'0\',
      \'data\' => \'a:6:{s:16:"ckeditor_default";s:1:"t";s:20:"ckeditor_show_toggle";s:1:"t";s:14:"ckeditor_width";s:4:"100%";s:13:"ckeditor_lang";s:2:"en";s:18:"ckeditor_auto_lang";s:1:"t";s:7:"overlay";i:1;}\',
      \'forum_tid\' => \'48680\',
      \'path\' => FALSE,
      \'menu\' => NULL,
      \'node_export_drupal_version\' => \'7\',
      \'node_export_dependency\' => array(
        array(
          \'type\' => \'taxonomy_term\',
          \'id\' => \'48680\',
          \'delta\' => 0,
          \'property\' => \'tid\',
          \'module\' => \'taxonomy\',
          \'field_name\' => \'taxonomy_forums\',
          \'langcode\' => \'und\',
          \'uuid\' => \'7a732a9d-f103-4ee3-b3d5-f29e4119c5e2\',
        ),
        array(
          \'type\' => \'user\',
          \'id\' => \'196\',
          \'delta\' => 0,
          \'property\' => \'uid\',
          \'module\' => \'node\',
          \'uuid\' => \'3fef8e21-1ad6-47aa-a14a-5f2c3be2ed2f\',
        ),
      ),
    ),
  (object) array(
      \'vid\' => \'5566\',
      \'uid\' => \'1\',
      \'title\' => \'Work Group Activities\',
      \'log\' => \'\',
      \'status\' => \'1\',
      \'comment\' => \'2\',
      \'promote\' => \'0\',
      \'sticky\' => \'0\',
      \'vuuid\' => \'75d48234-e8c6-47e7-84e3-08b7f6d0f119\',
      \'nid\' => \'5565\',
      \'type\' => \'forum\',
      \'language\' => \'und\',
      \'created\' => \'1410452191\',
      \'changed\' => \'1411575942\',
      \'tnid\' => \'0\',
      \'translate\' => \'0\',
      \'uuid\' => \'d8342c2a-c517-4458-9608-05f2b6583189\',
      \'revision_timestamp\' => \'1411575942\',
      \'revision_uid\' => \'1\',
      \'taxonomy_forums\' => array(
        \'und\' => array(
          array(
            \'tid\' => \'1\',
          ),
        ),
      ),
      \'body\' => array(),
      \'rdf_mapping\' => array(
        \'rdftype\' => array(
          \'sioc:Post\',
          \'sioct:BoardPost\',
        ),
        \'taxonomy_forums\' => array(
          \'predicates\' => array(
            \'sioc:has_container\',
          ),
          \'type\' => \'rel\',
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
      \'last_comment_timestamp\' => \'1410452191\',
      \'last_comment_name\' => NULL,
      \'last_comment_uid\' => \'1\',
      \'comment_count\' => \'0\',
      \'name\' => \'admin\',
      \'picture\' => \'0\',
      \'data\' => \'a:7:{s:16:"ckeditor_default";s:1:"t";s:20:"ckeditor_show_toggle";s:1:"t";s:14:"ckeditor_width";s:4:"100%";s:13:"ckeditor_lang";s:2:"en";s:18:"ckeditor_auto_lang";s:1:"t";s:7:"overlay";i:1;s:25:"overlay_message_dismissed";i:1;}\',
      \'forum_tid\' => \'1\',
      \'path\' => FALSE,
      \'menu\' => NULL,
      \'node_export_drupal_version\' => \'7\',
      \'node_export_dependency\' => array(
        array(
          \'type\' => \'taxonomy_term\',
          \'id\' => \'1\',
          \'delta\' => 0,
          \'property\' => \'tid\',
          \'module\' => \'taxonomy\',
          \'field_name\' => \'taxonomy_forums\',
          \'langcode\' => \'und\',
          \'uuid\' => FALSE,
        ),
      ),
    ),
  (object) array(
      \'vid\' => \'6008\',
      \'uid\' => \'1\',
      \'title\' => \'Features\',
      \'log\' => \'\',
      \'status\' => \'1\',
      \'comment\' => \'2\',
      \'promote\' => \'0\',
      \'sticky\' => \'0\',
      \'vuuid\' => \'2c0e4ae1-ef33-4b5e-8497-4aeda524430d\',
      \'nid\' => \'6007\',
      \'type\' => \'forum\',
      \'language\' => \'und\',
      \'created\' => \'1411568914\',
      \'changed\' => \'1411575942\',
      \'tnid\' => \'0\',
      \'translate\' => \'0\',
      \'uuid\' => \'ed7c322d-1db3-4c4a-9ea9-1874252fef6b\',
      \'revision_timestamp\' => \'1411575942\',
      \'revision_uid\' => \'1\',
      \'taxonomy_forums\' => array(
        \'und\' => array(
          array(
            \'tid\' => \'48680\',
          ),
        ),
      ),
      \'body\' => array(
        \'und\' => array(
          array(
            \'value\' => "<p>Comment here to ask if TBone can be expanded to include some feature, emailing lists comes to mind as an example.</p>\\r\\n",
            \'summary\' => \'\',
            \'format\' => \'full_html\',
            \'safe_value\' => "<p>Comment here to ask if TBone can be expanded to include some feature, emailing lists comes to mind as an example.</p>\\n",
            \'safe_summary\' => \'\',
          ),
        ),
      ),
      \'rdf_mapping\' => array(
        \'rdftype\' => array(
          \'sioc:Post\',
          \'sioct:BoardPost\',
        ),
        \'taxonomy_forums\' => array(
          \'predicates\' => array(
            \'sioc:has_container\',
          ),
          \'type\' => \'rel\',
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
      \'cid\' => \'4\',
      \'last_comment_timestamp\' => \'1411570247\',
      \'last_comment_name\' => \'\',
      \'last_comment_uid\' => \'196\',
      \'comment_count\' => \'1\',
      \'name\' => \'admin\',
      \'picture\' => \'0\',
      \'data\' => \'a:7:{s:16:"ckeditor_default";s:1:"t";s:20:"ckeditor_show_toggle";s:1:"t";s:14:"ckeditor_width";s:4:"100%";s:13:"ckeditor_lang";s:2:"en";s:18:"ckeditor_auto_lang";s:1:"t";s:7:"overlay";i:1;s:25:"overlay_message_dismissed";i:1;}\',
      \'forum_tid\' => \'48680\',
      \'path\' => FALSE,
      \'menu\' => NULL,
      \'node_export_drupal_version\' => \'7\',
      \'node_export_dependency\' => array(
        array(
          \'type\' => \'taxonomy_term\',
          \'id\' => \'48680\',
          \'delta\' => 0,
          \'property\' => \'tid\',
          \'module\' => \'taxonomy\',
          \'field_name\' => \'taxonomy_forums\',
          \'langcode\' => \'und\',
          \'uuid\' => \'7a732a9d-f103-4ee3-b3d5-f29e4119c5e2\',
        ),
      ),
    ),
)',
);
  return $node_export;
}

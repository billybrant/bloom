<?php
/**
 * @file
 * bloom_documentation.features.menu_links.inc
 */

/**
 * Implements hook_menu_default_menu_links().
 */
function bloom_documentation_menu_default_menu_links() {
  $menu_links = array();

  // Exported menu link: main-menu_bloom-administration-recipes:node/14
  $menu_links['main-menu_bloom-administration-recipes:node/14'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'node/14',
    'router_path' => 'node/%',
    'link_title' => 'Bloom Administration Recipes',
    'options' => array(
      'identifier' => 'main-menu_bloom-administration-recipes:node/14',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 1,
    'expanded' => 0,
    'weight' => -49,
    'customized' => 1,
    'parent_identifier' => 'main-menu_documentation:node/19',
  );
  // Exported menu link: main-menu_bloom-user-recipes:node/24
  $menu_links['main-menu_bloom-user-recipes:node/24'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'node/24',
    'router_path' => 'node/%',
    'link_title' => 'Bloom User Recipes',
    'options' => array(
      'identifier' => 'main-menu_bloom-user-recipes:node/24',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 1,
    'expanded' => 0,
    'weight' => -50,
    'customized' => 1,
    'parent_identifier' => 'main-menu_documentation:node/19',
  );
  // Exported menu link: main-menu_documentation:node/19
  $menu_links['main-menu_documentation:node/19'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'node/19',
    'router_path' => 'node/%',
    'link_title' => 'Documentation',
    'options' => array(
      'identifier' => 'main-menu_documentation:node/19',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 1,
    'expanded' => 0,
    'weight' => 0,
    'customized' => 0,
  );
  // Exported menu link: main-menu_how-do-i-apply-updates:node/22
  $menu_links['main-menu_how-do-i-apply-updates:node/22'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'node/22',
    'router_path' => 'node/%',
    'link_title' => 'How do I apply updates?',
    'options' => array(
      'identifier' => 'main-menu_how-do-i-apply-updates:node/22',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => -47,
    'customized' => 1,
    'parent_identifier' => 'main-menu_bloom-user-recipes:node/24',
  );
  // Exported menu link: main-menu_how-do-i-change-the-site-name:node/21
  $menu_links['main-menu_how-do-i-change-the-site-name:node/21'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'node/21',
    'router_path' => 'node/%',
    'link_title' => 'How do I change the site name?',
    'options' => array(
      'identifier' => 'main-menu_how-do-i-change-the-site-name:node/21',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => -49,
    'customized' => 1,
    'parent_identifier' => 'main-menu_bloom-user-recipes:node/24',
  );
  // Exported menu link: main-menu_how-do-i-create-and-push-a-new-release-of-my-bloom-site:node/15
  $menu_links['main-menu_how-do-i-create-and-push-a-new-release-of-my-bloom-site:node/15'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'node/15',
    'router_path' => 'node/%',
    'link_title' => 'How do I create and push a new release of my Bloom site?',
    'options' => array(
      'identifier' => 'main-menu_how-do-i-create-and-push-a-new-release-of-my-bloom-site:node/15',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => -46,
    'customized' => 1,
    'parent_identifier' => 'main-menu_bloom-user-recipes:node/24',
  );
  // Exported menu link: main-menu_how-do-i-create-my-data-records:https://drupal.org/documentation/modules/field-ui
  $menu_links['main-menu_how-do-i-create-my-data-records:https://drupal.org/documentation/modules/field-ui'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'https://drupal.org/documentation/modules/field-ui',
    'router_path' => '',
    'link_title' => 'How do I create my data records?',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
      'identifier' => 'main-menu_how-do-i-create-my-data-records:https://drupal.org/documentation/modules/field-ui',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 1,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => -48,
    'customized' => 1,
    'parent_identifier' => 'main-menu_bloom-user-recipes:node/24',
  );
  // Exported menu link: main-menu_how-do-i-deploy-a-minor-upgrade-of-drupal-to-my-bloom-sites:node/17
  $menu_links['main-menu_how-do-i-deploy-a-minor-upgrade-of-drupal-to-my-bloom-sites:node/17'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'node/17',
    'router_path' => 'node/%',
    'link_title' => 'How do I deploy a minor upgrade of drupal to my bloom sites?',
    'options' => array(
      'identifier' => 'main-menu_how-do-i-deploy-a-minor-upgrade-of-drupal-to-my-bloom-sites:node/17',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => -48,
    'customized' => 1,
    'parent_identifier' => 'main-menu_bloom-administration-recipes:node/14',
  );
  // Exported menu link: main-menu_how-do-i-get-a-bloom-site:node/add/bloomrequest
  $menu_links['main-menu_how-do-i-get-a-bloom-site:node/add/bloomrequest'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'node/add/bloomrequest',
    'router_path' => 'node/add/bloomrequest',
    'link_title' => 'How do I get a Bloom site?',
    'options' => array(
      'attributes' => array(
        'title' => '',
      ),
      'identifier' => 'main-menu_how-do-i-get-a-bloom-site:node/add/bloomrequest',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => -50,
    'customized' => 1,
    'parent_identifier' => 'main-menu_bloom-user-recipes:node/24',
  );
  // Exported menu link: main-menu_how-do-i-save-a-snapshot-of-a-bloom-site:node/18
  $menu_links['main-menu_how-do-i-save-a-snapshot-of-a-bloom-site:node/18'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'node/18',
    'router_path' => 'node/%',
    'link_title' => 'How do I save a snapshot of a Bloom site?',
    'options' => array(
      'identifier' => 'main-menu_how-do-i-save-a-snapshot-of-a-bloom-site:node/18',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => -50,
    'customized' => 1,
    'parent_identifier' => 'main-menu_bloom-administration-recipes:node/14',
  );
  // Exported menu link: main-menu_how-to-create-a-bloom-infrastructure-from-scratch-windows:node/23
  $menu_links['main-menu_how-to-create-a-bloom-infrastructure-from-scratch-windows:node/23'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'node/23',
    'router_path' => 'node/%',
    'link_title' => 'How to Create a Bloom Infrastructure from Scratch (windows)',
    'options' => array(
      'identifier' => 'main-menu_how-to-create-a-bloom-infrastructure-from-scratch-windows:node/23',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => -47,
    'customized' => 1,
    'parent_identifier' => 'main-menu_bloom-administration-recipes:node/14',
  );
  // Exported menu link: main-menu_how-to-create-a-new-bloom-development-site:node/20
  $menu_links['main-menu_how-to-create-a-new-bloom-development-site:node/20'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'node/20',
    'router_path' => 'node/%',
    'link_title' => 'How to Create a New Bloom Development Site',
    'options' => array(
      'identifier' => 'main-menu_how-to-create-a-new-bloom-development-site:node/20',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => -49,
    'customized' => 1,
    'parent_identifier' => 'main-menu_bloom-administration-recipes:node/14',
  );
  // Exported menu link: main-menu_narratives:node/12
  $menu_links['main-menu_narratives:node/12'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'node/12',
    'router_path' => 'node/%',
    'link_title' => 'Narratives',
    'options' => array(
      'identifier' => 'main-menu_narratives:node/12',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 1,
    'expanded' => 0,
    'weight' => -48,
    'customized' => 1,
    'parent_identifier' => 'main-menu_documentation:node/19',
  );
  // Exported menu link: main-menu_when-do-i-need-to-change-my-dev-site-and-do-a-new-release:node/13
  $menu_links['main-menu_when-do-i-need-to-change-my-dev-site-and-do-a-new-release:node/13'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'node/13',
    'router_path' => 'node/%',
    'link_title' => 'When do I need to change my dev site and do a new release?',
    'options' => array(
      'identifier' => 'main-menu_when-do-i-need-to-change-my-dev-site-and-do-a-new-release:node/13',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => 0,
    'customized' => 0,
    'parent_identifier' => 'main-menu_narratives:node/12',
  );
  // Translatables
  // Included for use with string extractors like potx.
  t('Bloom Administration Recipes');
  t('Bloom User Recipes');
  t('Documentation');
  t('How do I apply updates?');
  t('How do I change the site name?');
  t('How do I create and push a new release of my Bloom site?');
  t('How do I create my data records?');
  t('How do I deploy a minor upgrade of drupal to my bloom sites?');
  t('How do I get a Bloom site?');
  t('How do I save a snapshot of a Bloom site?');
  t('How to Create a Bloom Infrastructure from Scratch (windows)');
  t('How to Create a New Bloom Development Site');
  t('Narratives');
  t('When do I need to change my dev site and do a new release?');


  return $menu_links;
}

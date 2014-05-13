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

  // Exported menu link: main-menu_documentation:node/6
  $menu_links['main-menu_documentation:node/6'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'node/6',
    'router_path' => 'node/%',
    'link_title' => 'Documentation',
    'options' => array(
      'identifier' => 'main-menu_documentation:node/6',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 1,
    'expanded' => 0,
    'weight' => 0,
    'customized' => 0,
  );
  // Exported menu link: main-menu_how-do-i-apply-updates:node/3
  $menu_links['main-menu_how-do-i-apply-updates:node/3'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'node/3',
    'router_path' => 'node/%',
    'link_title' => 'How do I apply updates?',
    'options' => array(
      'identifier' => 'main-menu_how-do-i-apply-updates:node/3',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => 0,
    'customized' => 0,
    'parent_identifier' => 'main-menu_documentation:node/6',
  );
  // Exported menu link: main-menu_how-do-i-change-the-site-name:node/2
  $menu_links['main-menu_how-do-i-change-the-site-name:node/2'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'node/2',
    'router_path' => 'node/%',
    'link_title' => 'How do I change the site name?',
    'options' => array(
      'identifier' => 'main-menu_how-do-i-change-the-site-name:node/2',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => 0,
    'customized' => 0,
    'parent_identifier' => 'main-menu_documentation:node/6',
  );
  // Exported menu link: main-menu_how-do-i-deploy-a-minor-upgrade-of-drupal-to-my-bloom-sites:node/11
  $menu_links['main-menu_how-do-i-deploy-a-minor-upgrade-of-drupal-to-my-bloom-sites:node/11'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'node/11',
    'router_path' => 'node/%',
    'link_title' => 'How do I deploy a minor upgrade of drupal to my bloom sites?',
    'options' => array(
      'identifier' => 'main-menu_how-do-i-deploy-a-minor-upgrade-of-drupal-to-my-bloom-sites:node/11',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => 0,
    'customized' => 0,
    'parent_identifier' => 'main-menu_documentation:node/6',
  );
  // Exported menu link: main-menu_how-do-i-save-a-snapshot-of-a-bloom-site:node/10
  $menu_links['main-menu_how-do-i-save-a-snapshot-of-a-bloom-site:node/10'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'node/10',
    'router_path' => 'node/%',
    'link_title' => 'How do I save a snapshot of a Bloom site?',
    'options' => array(
      'identifier' => 'main-menu_how-do-i-save-a-snapshot-of-a-bloom-site:node/10',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => 0,
    'customized' => 0,
    'parent_identifier' => 'main-menu_documentation:node/6',
  );
  // Exported menu link: main-menu_how-to-create-a-bloom-infrastructure-from-scratch-windows:node/8
  $menu_links['main-menu_how-to-create-a-bloom-infrastructure-from-scratch-windows:node/8'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'node/8',
    'router_path' => 'node/%',
    'link_title' => 'How to Create a Bloom Infrastructure from Scratch (windows)',
    'options' => array(
      'identifier' => 'main-menu_how-to-create-a-bloom-infrastructure-from-scratch-windows:node/8',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => 0,
    'customized' => 0,
    'parent_identifier' => 'main-menu_documentation:node/6',
  );
  // Exported menu link: main-menu_how-to-create-a-new-bloom-development-site:node/9
  $menu_links['main-menu_how-to-create-a-new-bloom-development-site:node/9'] = array(
    'menu_name' => 'main-menu',
    'link_path' => 'node/9',
    'router_path' => 'node/%',
    'link_title' => 'How to Create a New Bloom Development Site',
    'options' => array(
      'identifier' => 'main-menu_how-to-create-a-new-bloom-development-site:node/9',
    ),
    'module' => 'menu',
    'hidden' => 0,
    'external' => 0,
    'has_children' => 0,
    'expanded' => 0,
    'weight' => 0,
    'customized' => 0,
    'parent_identifier' => 'main-menu_documentation:node/6',
  );
  // Translatables
  // Included for use with string extractors like potx.
  t('Documentation');
  t('How do I apply updates?');
  t('How do I change the site name?');
  t('How do I deploy a minor upgrade of drupal to my bloom sites?');
  t('How do I save a snapshot of a Bloom site?');
  t('How to Create a Bloom Infrastructure from Scratch (windows)');
  t('How to Create a New Bloom Development Site');


  return $menu_links;
}

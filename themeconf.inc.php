<?php
/*
Theme Name: piwimon
Version: 0.1
Description: pokemon theme
Theme URI: https://github.com/MartinCozic/themepasposté
Author: pedritolerigolo
Author URI: https://github.com/MartinCozic
*/

$themeconf = array(
    'name'  => 'piwimon',
    'parent' => 'default',
    'icon_dir' => 'themes/default/icon',
    'mime_icon_dir' => 'themes/default/icon/mimetypes/',
);

if (function_exists('add_event_handler')) {
    add_event_handler('loc_begin_page_header', 'piwimon_global_vars');
}

function piwimon_global_vars() {
    global $template;
    if (is_admin()) {
        $template->assign('PIWIMON_IS_ADMIN', true);
    }
}
?>
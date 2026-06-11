<!DOCTYPE html>
<html lang="{$lang_info.code}" dir="{$lang_info.direction}">
<head>
  <meta charset="{$CONTENT_ENCODING}">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  {* Titre de l'onglet : "Titre de la page - Nom du site" *}
  <title>{if isset($PAGE_TITLE)}{$PAGE_TITLE|@strip_tags} - {/if}{$GALLERY_TITLE}</title>

  <link rel="icon" type="image/png" href="{$ROOT_URL}themes/piwimon/icon/favicon.png">
  {* Importation des Google Material Symbols *}
  <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" rel="stylesheet" />
  {$META_DESCRIPTION}
  {$METADATA}
  
  <link rel="stylesheet" href="{$ROOT_URL}themes/piwimon/css/common.css?v={$smarty.now}">
  <link rel="stylesheet" href="{$ROOT_URL}themes/piwimon/css/gallery.css?v={$smarty.now}">
  <link rel="stylesheet" href="{$ROOT_URL}themes/piwimon/css/search.css?v={$smarty.now}">
  <link rel="stylesheet" href="{$ROOT_URL}themes/piwimon/css/picture.css?v={$smarty.now}">
  <link rel="stylesheet" href="{$ROOT_URL}themes/piwimon/css/tags.css?v={$smarty.now}">
  {$CSSFILES}
  {$PAGE_HEAD}
</head>
<body id="{$BODY_ID}">

<header class="site-header">
  <div class="header-container">

    <nav class="site-nav">
      <a href="{$U_HOME}" title="Accueil"><span class="material-symbols-outlined">home</span></a>
      <a href="#" id="openSearchBtn" title="Recherche"><span class="material-symbols-outlined">search</span></a>
      <a href="{$ROOT_URL}index.php?/favorites" title="Mes Favoris"><span class="material-symbols-outlined">star</span></a>
      <a href="{$ROOT_URL}tags.php" title="Tags"><span class="material-symbols-outlined">label</span></a>
      {if isset($PIWIMON_IS_ADMIN)}
        <a href="{$ROOT_URL}admin.php" title="Administration"><span class="material-symbols-outlined">settings</span></a>
      {/if}
      {if isset($U_LOGIN)}
        <a href="{$U_LOGIN}" title="Login"><span class="material-symbols-outlined">login</span></a>
      {else}
        <a href="{$U_LOGOUT}" title="Logout"><span class="material-symbols-outlined">logout</span></a>
      {/if}
    </nav>
  </div>
</header>

<!-- Modal de Recherche Pokédex -->
<div id="searchModal" class="search-modal hidden">
  <div class="search-card pokedex-card">
    <button id="closeSearchBtn" class="close-btn" title="Fermer"><span class="material-symbols-outlined">close</span></button>
    <form class="search-form" method="get" action="{$ROOT_URL}qsearch.php">
      <div class="form-group">
        <label for="q">Rechercher une photo :</label>
        <div class="search-bar-wrapper">
          <input type="text" name="q" id="q" placeholder="Ex: plg" class="search-input">
          <button type="submit" class="search-btn">Rechercher</button>
        </div>
      </div>
    </form>
    <div class="search-help">
      <p><span class="material-symbols-outlined">lightbulb</span> Astuce : Utilisez aussi les <a href="{$ROOT_URL}tags.php" class="breadcrumb"><span class="material-symbols-outlined" style="font-size:1em;">label</span> Tags</a>.</p>
    </div>
  </div>
</div>

<main class="site-main container">
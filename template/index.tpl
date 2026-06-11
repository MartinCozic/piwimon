{* ===== Assets ===== *}
{combine_script id='core.switchbox' load='async' require='jquery' path='themes/default/js/switchbox.js'}

{* ===== Menubar native Piwigo ===== *}
{$MENUBAR}

{* ===== Messages erreurs/infos ===== *}
{if isset($errors) or isset($infos)}
<div class="content messages{if isset($MENUBAR)} contentWithMenu{/if}">
  {include file='infos_errors.tpl'}
</div>
{/if}

{if !empty($PLUGIN_INDEX_CONTENT_BEFORE)}{$PLUGIN_INDEX_CONTENT_BEFORE}{/if}

<div id="content" class="content{if isset($MENUBAR)} contentWithMenu{/if}">

  {* ===== Titre + badge nombre d'items ===== *}
  <div class="titrePage">
    <h2>
      <span class="material-symbols-outlined">folder_open</span> {$TITLE}
      {if $NB_ITEMS > 0}<span class="badge">{$NB_ITEMS}</span>{/if}
    </h2>

    {* Actions (slideshow, tri, etc.) *}
    <ul class="categoryActions">
      {if isset($U_SLIDESHOW)}
        <li><a href="{$U_SLIDESHOW}" class="action-btn" title="{'slideshow'|@translate}"><span class="material-symbols-outlined">play_arrow</span> {'slideshow'|@translate}</a></li>
      {/if}
      {if isset($U_MODE_FLAT)}
        <li><a href="{$U_MODE_FLAT}" class="action-btn" title="{'display all photos in all sub-albums'|@translate}"><span class="material-symbols-outlined">collections</span> Tout voir</a></li>
      {/if}
      {if isset($U_MODE_NORMAL)}
        <li><a href="{$U_MODE_NORMAL}" class="action-btn"><span class="material-symbols-outlined">arrow_back</span> Normal</a></li>
      {/if}
      {if isset($U_EDIT)}
        <li><a href="{$U_EDIT}" class="action-btn"><span class="material-symbols-outlined">edit</span> {'Edit'|@translate}</a></li>
      {/if}
    </ul>
  </div>

  {if !empty($PLUGIN_INDEX_CONTENT_BEGIN)}{$PLUGIN_INDEX_CONTENT_BEGIN}{/if}

  {* ===== Description de la catégorie ===== *}
  {if !empty($CONTENT_DESCRIPTION)}
  <div class="category-description">
    {$CONTENT_DESCRIPTION}
  </div>
  {/if}

  {* ===== Sous-albums (injecté par mainpage_categories.tpl) ===== *}
  {if !empty($CATEGORIES)}
  <section class="albums-section">
    <h2 class="section-title"><span class="material-symbols-outlined">folder_open</span> Albums</h2>
    {$CATEGORIES}
  </section>
  {/if}

  {* Pagination des albums *}
  {if !empty($cats_navbar)}
    {include file='navigation_bar.tpl'|@get_extent:'navbar' navbar=$cats_navbar}
  {/if}

  {* ===== Miniatures photos (injecté par thumbnails.tpl) ===== *}
  {if !empty($THUMBNAILS)}
  <section class="photos-section">
    <h2 class="section-title"><span class="material-symbols-outlined">photo_library</span> Photos</h2>
    <ul class="thumbnails" id="thumbnails">
      {$THUMBNAILS}
    </ul>
  </section>
  {/if}

  {* Pagination des photos *}
  {if !empty($thumb_navbar)}
    {include file='navigation_bar.tpl'|@get_extent:'navbar' navbar=$thumb_navbar}
  {/if}

  {* Contenu calendrier *}
  {if isset($FILE_CHRONOLOGY_VIEW)}
    {include file=$FILE_CHRONOLOGY_VIEW}
  {/if}

  {* ===== Message si aucun résultat ou album vide ===== *}
  {if empty($CATEGORIES) && empty($THUMBNAILS)}
    <div class="empty-gallery pokedex-card" style="margin-top: 2rem;">
      <div style="margin-bottom: 1rem;"><span class="material-symbols-outlined" style="font-size: 4rem;">sentiment_dissatisfied</span></div>
      <h3 style="color: var(--primary-color);">Zut ! Rien par ici...</h3>
      <p>Aucun résultat n'a été trouvé suite à cette recherche.</p>
    </div>
  {/if}

  {if !empty($PLUGIN_INDEX_CONTENT_END)}{$PLUGIN_INDEX_CONTENT_END}{/if}

</div>{* <!-- #content --> *}

{if !empty($PLUGIN_INDEX_CONTENT_AFTER)}{$PLUGIN_INDEX_CONTENT_AFTER}{/if}

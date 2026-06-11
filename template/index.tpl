{* ===== Assets ===== *}
{combine_script id='core.switchbox' load='async' require='jquery' path='themes/default/js/switchbox.js'}

{* ===== Piwigo native menubar ===== *}
{$MENUBAR}

{* ===== Error/info messages ===== *}
{if isset($errors) or isset($infos)}
<div class="content messages{if isset($MENUBAR)} contentWithMenu{/if}">
  {include file='infos_errors.tpl'}
</div>
{/if}

{if !empty($PLUGIN_INDEX_CONTENT_BEFORE)}{$PLUGIN_INDEX_CONTENT_BEFORE}{/if}

<div id="content" class="content{if isset($MENUBAR)} contentWithMenu{/if}">

  {* ===== Title + item count badge ===== *}
  <div class="titrePage">
    <h2>
      <span class="material-symbols-outlined">folder_open</span> {$TITLE}
      {if $NB_ITEMS > 0}<span class="badge">{$NB_ITEMS}</span>{/if}
    </h2>

    {* Actions (slideshow, sort, etc.) *}
    <ul class="categoryActions">
      {if isset($U_SLIDESHOW)}
        <li><a href="{$U_SLIDESHOW}" class="action-btn" title="{'slideshow'|@translate}"><span class="material-symbols-outlined">play_arrow</span> {'slideshow'|@translate}</a></li>
      {/if}
      {if isset($U_MODE_FLAT)}
        <li><a href="{$U_MODE_FLAT}" class="action-btn" title="{'display all photos in all sub-albums'|@translate}"><span class="material-symbols-outlined">collections</span> {'piwimon_view_all'|translate}</a></li>
      {/if}
      {if isset($U_MODE_NORMAL)}
        <li><a href="{$U_MODE_NORMAL}" class="action-btn"><span class="material-symbols-outlined">arrow_back</span> {'piwimon_normal_view'|translate}</a></li>
      {/if}
      {if isset($U_EDIT)}
        <li><a href="{$U_EDIT}" class="action-btn"><span class="material-symbols-outlined">edit</span> {'Edit'|@translate}</a></li>
      {/if}
    </ul>
  </div>

  {if !empty($PLUGIN_INDEX_CONTENT_BEGIN)}{$PLUGIN_INDEX_CONTENT_BEGIN}{/if}

  {* ===== Category description ===== *}
  {if !empty($CONTENT_DESCRIPTION)}
  <div class="category-description">
    {$CONTENT_DESCRIPTION}
  </div>
  {/if}

  {* ===== Sub-albums (injected by mainpage_categories.tpl) ===== *}
  {if !empty($CATEGORIES)}
  <section class="albums-section">
    <h2 class="section-title"><span class="material-symbols-outlined">folder_open</span> {'piwimon_albums'|translate}</h2>
    {$CATEGORIES}
  </section>
  {/if}

  {* Albums pagination *}
  {if !empty($cats_navbar)}
    {include file='navigation_bar.tpl'|@get_extent:'navbar' navbar=$cats_navbar}
  {/if}

  {* ===== Photo thumbnails (injected by thumbnails.tpl) ===== *}
  {if !empty($THUMBNAILS)}
  <section class="photos-section">
    <h2 class="section-title"><span class="material-symbols-outlined">photo_library</span> {'piwimon_photos'|translate}</h2>
    <ul class="thumbnails" id="thumbnails">
      {$THUMBNAILS}
    </ul>
  </section>
  {/if}

  {* Photos pagination *}
  {if !empty($thumb_navbar)}
    {include file='navigation_bar.tpl'|@get_extent:'navbar' navbar=$thumb_navbar}
  {/if}

  {* Calendar content *}
  {if isset($FILE_CHRONOLOGY_VIEW)}
    {include file=$FILE_CHRONOLOGY_VIEW}
  {/if}

  {* ===== Message if no results or empty album ===== *}
  {if empty($CATEGORIES) && empty($THUMBNAILS)}
    <div class="empty-gallery pokedex-card" style="margin-top: 2rem;">
      <div style="margin-bottom: 1rem;"><span class="material-symbols-outlined" style="font-size: 4rem;">sentiment_dissatisfied</span></div>
      <h3 style="color: var(--primary-color);">{'piwimon_empty_title'|translate}</h3>
      <p>{'piwimon_empty_text'|translate}</p>
    </div>
  {/if}

  {if !empty($PLUGIN_INDEX_CONTENT_END)}{$PLUGIN_INDEX_CONTENT_END}{/if}

</div>{* <!-- #content --> *}

{if !empty($PLUGIN_INDEX_CONTENT_AFTER)}{$PLUGIN_INDEX_CONTENT_AFTER}{/if}

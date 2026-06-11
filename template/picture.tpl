<div id="content">
{* ===== Fil d'Ariane ===== *}
{if isset($BREADCRUMB)}
<nav class="breadcrumb"><span class="material-symbols-outlined">location_on</span> {$BREADCRUMB}</nav>
{/if}

{* ===== Barre navigation préc/suiv ===== *}
<div class="picture-navbar">
  {if isset($previous)}
    <a href="{$previous.U_IMG}" class="nav-btn"><span class="material-symbols-outlined">arrow_back</span> Préc.</a>
  {else}
    <span class="nav-btn nav-btn--disabled"><span class="material-symbols-outlined">arrow_back</span> Préc.</span>
  {/if}

  {if isset($U_UP)}<a href="{$U_UP}" class="nav-btn nav-btn--album"><span class="material-symbols-outlined">folder</span> Album</a>{/if}

  {if isset($next)}
    <a href="{$next.U_IMG}" class="nav-btn">Suiv. <span class="material-symbols-outlined">arrow_forward</span></a>
  {else}
    <span class="nav-btn nav-btn--disabled">Suiv. <span class="material-symbols-outlined">arrow_forward</span></span>
  {/if}
</div>

{* ===== Image principale ===== *}
<div id="theImage">
  {if !empty($PLUGIN_PICTURE_CONTENT_BEFORE)}{$PLUGIN_PICTURE_CONTENT_BEFORE}{/if}

  {include file='picture_content.tpl'}

  {if !empty($PLUGIN_PICTURE_CONTENT_AFTER)}{$PLUGIN_PICTURE_CONTENT_AFTER}{/if}
</div>

{* ===== Titre + actions ===== *}
<div class="picture-header">
  <h1 class="picture-title"><span class="material-symbols-outlined">image</span> {$current.TITLE|default:$current.FILE}</h1>
  <div class="picture-actions">
    {if isset($PIWIMON_IS_ADMIN)}
      <a href="{$ROOT_URL}admin.php?page=photo-{$current.id}" class="action-btn action-btn--edit" title="Modifier la photo"><span class="material-symbols-outlined">settings</span> Éditer</a>
    {/if}
    {if isset($favorite)}
      <a href="{$favorite.U_FAVORITE}" class="action-btn action-btn--fav">
        {if isset($favorite.IS_FAVORITE) && $favorite.IS_FAVORITE}<span class="material-symbols-outlined">star</span> Retirer{else}<span class="material-symbols-outlined">star</span> Favori{/if}
      </a>
    {/if}
    {if isset($U_DOWNLOAD)}
      <a href="{$U_DOWNLOAD}" class="action-btn action-btn--dl"><span class="material-symbols-outlined">download</span> DL</a>
    {/if}
  </div>
</div>

{* ===== Description ===== *}
{if isset($COMMENT_IMG) && $COMMENT_IMG != ''}
<div class="picture-description">{$COMMENT_IMG}</div>
{/if}

{* ===== Fiche Pokédex (métadonnées) ===== *}
<div class="pokedex-card">
  <h2 class="pokedex-title"><span class="material-symbols-outlined">assignment</span> Fiche Pokédex</h2>
  <table class="pokedex-table">
    {if isset($INFO_CREATION_DATE)}
    <tr><th><span class="material-symbols-outlined">calendar_month</span> Date</th><td>{$INFO_CREATION_DATE}</td></tr>
    {/if}
    {if isset($INFO_AUTHOR)}
    <tr><th><span class="material-symbols-outlined">person</span> Dresseur</th><td>{$INFO_AUTHOR}</td></tr>
    {/if}
    {if isset($INFO_DIMENSIONS)}
    <tr><th><span class="material-symbols-outlined">aspect_ratio</span> Taille</th><td>{$INFO_DIMENSIONS}</td></tr>
    {/if}
    {if isset($INFO_FILESIZE)}
    <tr><th><span class="material-symbols-outlined">save</span> Poids</th><td>{$INFO_FILESIZE}</td></tr>
    {/if}
    {if isset($INFO_VISITS)}
    <tr><th><span class="material-symbols-outlined">visibility</span> Vues</th><td>{$INFO_VISITS}</td></tr>
    {/if}
    {if isset($related_tags)}
    <tr>
      <th><span class="material-symbols-outlined">label</span> Tags</th>
      <td>
        {foreach from=$related_tags item=tag}
          <a href="{$tag.URL}" class="tag-link"><span class="material-symbols-outlined" style="font-size:1em;">label</span> {$tag.name}</a>
        {/foreach}
      </td>
    </tr>
    {/if}
  </table>
</div>

{* ===== Navigation entre photos (strip) ===== *}
{if isset($picture_nav_buttons)}
<div class="picture-strip">
  {include file='picture_nav_buttons.tpl'}
</div>
{/if}

{* ===== Commentaires ===== *}
{if isset($comment_count) || !empty($PLUGIN_PICTURE_CONTENT_END)}
<section id="comments" class="comments-section">
  {include file='comment_list.tpl'}
  {include file='comments.tpl'}
</section>
{/if}

{if !empty($PLUGIN_PICTURE_CONTENT_END)}{$PLUGIN_PICTURE_CONTENT_END}{/if}

</div>

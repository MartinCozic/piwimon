<div id="content" class="content">

  <div class="titrePage">
    <h2>
      <span class="material-symbols-outlined">label</span> {'Tags'|@translate}
      {if isset($tags)}<span class="badge">{$tags|@count}</span>{/if}
    </h2>
  </div>

  <div class="pokedex-card">
    {if isset($tags) && $tags|@count > 0}
      <div class="tags-cloud">
        {foreach from=$tags item=tag}
          <a href="{$tag.URL}" class="tag-item tag-level-{$tag.level|default:3}" title="{$tag.counter} photos">
            <span class="material-symbols-outlined" style="font-size: 1em;">label</span> {$tag.name}
            <span class="tag-counter">{$tag.counter}</span>
          </a>
        {/foreach}
      </div>
    {else}
      <div class="empty-gallery">
        <div style="margin-bottom: 1rem;"><span class="material-symbols-outlined" style="font-size: 4rem;">visibility_off</span></div>
        <h3 style="color: var(--primary-color);">Aucun Tag</h3>
        <p>Il n'y a pas encore de tags enregistrés dans la galerie.</p>
      </div>
    {/if}
  </div>
</div>
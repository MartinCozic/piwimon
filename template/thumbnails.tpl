{if !empty($thumbnails)}{strip}

{foreach from=$thumbnails item=thumbnail}
{assign var=derivative value=$pwg->derivative($derivative_params, $thumbnail.src_image)}

<li>
  <a href="{$thumbnail.URL}">
    <img
      class="thumbnail"
      src="{$derivative->get_url()}"
      alt="{$thumbnail.TN_ALT}"
      title="{$thumbnail.TN_TITLE}"
      loading="lazy"
    >
    <div class="thumbInfo">
      <span class="thumbName">{$thumbnail.NAME}</span>
      {if isset($thumbnail.NB_HITS) && $thumbnail.NB_HITS > 0}
        <span class="thumbMeta"><span class="material-symbols-outlined" style="font-size: 1em;">visibility</span> {$thumbnail.NB_HITS}</span>
      {/if}
      {if isset($thumbnail.NB_COMMENTS) && $thumbnail.NB_COMMENTS > 0}
        <span class="thumbMeta"><span class="material-symbols-outlined" style="font-size: 1em;">chat_bubble</span> {$thumbnail.NB_COMMENTS}</span>
      {/if}
    </div>
  </a>
</li>
{/foreach}{/strip}
{/if}

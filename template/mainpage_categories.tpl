<ul class="albums-grid">
  {foreach from=$category_thumbnails item=cat name=cat_loop}

    <li class="album-card">
      <a href="{$cat.URL}">

        <div class="album-thumb">
          {if isset($cat.representative) && isset($cat.representative.src_image)}
            {assign var=derivative value=$pwg->derivative($derivative_params, $cat.representative.src_image)}
            <img
              src="{$derivative->get_url()}"
              alt="{$cat.TN_ALT}"
              title="{$cat.NAME|@replace:'"':' '|@strip_tags:false}"
            loading="lazy">
          {else}
          <div class="album-thumb-placeholder"><span class="material-symbols-outlined" style="font-size: inherit;">folder</span></div>
          {/if}
        </div>

        <div class="album-info">
          <span class="album-name">
            {$cat.NAME}
            {if !empty($cat.icon_ts)}
            <img title="{$cat.icon_ts.TITLE}" src="{$ROOT_URL}{$themeconf.icon_dir}/recent{if $cat.icon_ts.IS_CHILD_DATE}_by_child{/if}.png" alt="(!)">
            {/if}
          </span>
          <span class="album-count badge">{$cat.CAPTION_NB_IMAGES} <span class="material-symbols-outlined" style="font-size: 1em;">photo_camera</span></span>
          
          {if isset($cat.INFO_DATES)}
            <span class="album-dates"><span class="material-symbols-outlined" style="font-size: 1em;">calendar_month</span> {$cat.INFO_DATES}</span>
          {/if}
          
          <div class="album-desc">
            {if !empty($cat.DESCRIPTION)}
              {$cat.DESCRIPTION|strip_tags|truncate:100:'...'}
            {else}
              Un mystérieux album sans description. Quels secrets s'y cachent ?
            {/if}
          </div>
        </div>

      </a>
    </li>
  {/foreach}
</ul>
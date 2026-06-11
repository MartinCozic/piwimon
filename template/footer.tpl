</main>

<footer class="site-footer">
  <div class="container">
    <p>
      {$GALLERY_TITLE} &copy; {$smarty.now|date_format:"%Y"} &mdash; 
      {{'Powered by'|@translate}} <a href="https://piwigo.org" target="_blank" rel="noopener">Piwigo</a>
    </p>
  </div>
</footer>

<script src="{$ROOT_URL}themes/piwimon/js/theme.js?v={$smarty.now}"></script>

{* Scripts JS concaténés et scripts de plugins *}
{$JSFILES}
{$FOOTER_SCRIPT}

</body>
</html>
document.addEventListener('DOMContentLoaded', () => {
    console.log('Theme loaded successfully.');

    // Search Modal Logic
    const openBtn = document.getElementById('openSearchBtn');
    const closeBtn = document.getElementById('closeSearchBtn');
    const modal = document.getElementById('searchModal');

    if(openBtn && modal) {
        openBtn.addEventListener('click', (e) => {
            e.preventDefault();
            modal.classList.remove('hidden');
            document.getElementById('q').focus(); // Places the cursor directly in the search bar!
        });
        closeBtn.addEventListener('click', () => modal.classList.add('hidden'));
        modal.addEventListener('click', (e) => { if(e.target === modal) modal.classList.add('hidden'); });
    }

    // ==============================================================
    // TIP: SAVE AND DISPLAY SEARCH TERM
    // ==============================================================
    
    // 1. Intercept search to memorize the typed word
    const searchForms = document.querySelectorAll('.search-form');
    searchForms.forEach(form => {
        form.addEventListener('submit', () => {
            const input = form.querySelector('.search-input');
            if (input && input.value.trim() !== '') {
                sessionStorage.setItem('piwimon_last_search', input.value.trim());
            }
        });
    });

    // 2. If we land on a results page, retrieve and display the word!
    if (window.location.href.includes('search')) {
        const lastSearch = sessionStorage.getItem('piwimon_last_search');
        if (lastSearch) {
            // Add the word under the main title
            const titrePage = document.querySelector('.titrePage');
            if (titrePage) {
                const searchForText = (typeof PIWIMON_LANG !== 'undefined') ? PIWIMON_LANG.searchFor : 'Recherche pour :';
                titrePage.insertAdjacentHTML('beforeend', '<div style="font-size: 1rem; font-weight: bold; margin-top: 0.5rem; margin-bottom: 1rem; color: var(--text-muted);"><span class="material-symbols-outlined" style="font-size:1.1em;">arrow_right</span> ' + searchForText + ' <span style="color: var(--primary-color);">"' + lastSearch + '"</span></div>');
            }

            // Replace the generic "No results..." text if the search is empty
            const emptyMessage = document.querySelector('.empty-gallery p');
            if (emptyMessage) {
                const noResultsText = (typeof PIWIMON_LANG !== 'undefined') ? PIWIMON_LANG.noResults : 'Aucun résultat n\'a été trouvé pour :';
                emptyMessage.innerHTML = noResultsText + ' <strong style="color: var(--primary-color);">"' + lastSearch + '"</strong>';
            }
        }
    }
});
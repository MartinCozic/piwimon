document.addEventListener('DOMContentLoaded', () => {
    console.log('Theme chargé avec succès.');

    // Logique du Modal de Recherche
    const openBtn = document.getElementById('openSearchBtn');
    const closeBtn = document.getElementById('closeSearchBtn');
    const modal = document.getElementById('searchModal');

    if(openBtn && modal) {
        openBtn.addEventListener('click', (e) => {
            e.preventDefault();
            modal.classList.remove('hidden');
            document.getElementById('q').focus(); // Place le curseur direct dans la barre !
        });
        closeBtn.addEventListener('click', () => modal.classList.add('hidden'));
        modal.addEventListener('click', (e) => { if(e.target === modal) modal.classList.add('hidden'); });
    }

    // ==============================================================
    // ASTUCE : SAUVEGARDE ET AFFICHAGE DU TERME DE RECHERCHE
    // ==============================================================
    
    // 1. Intercepter la recherche pour mémoriser le mot tapé
    const searchForms = document.querySelectorAll('.search-form');
    searchForms.forEach(form => {
        form.addEventListener('submit', () => {
            const input = form.querySelector('.search-input');
            if (input && input.value.trim() !== '') {
                sessionStorage.setItem('piwimon_last_search', input.value.trim());
            }
        });
    });

    // 2. Si on atterrit sur une page de résultats, on récupère et affiche le mot !
    if (window.location.href.includes('search')) {
        const lastSearch = sessionStorage.getItem('piwimon_last_search');
        if (lastSearch) {
            // Ajouter le mot sous le titre principal
            const titrePage = document.querySelector('.titrePage');
            if (titrePage) {
                titrePage.insertAdjacentHTML('beforeend', '<div style="font-size: 1rem; font-weight: bold; margin-top: 0.5rem; margin-bottom: 1rem; color: var(--text-muted);"><span class="material-symbols-outlined" style="font-size:1.1em;">arrow_right</span> Recherche pour : <span style="color: var(--primary-color);">"' + lastSearch + '"</span></div>');
            }

            // Remplacer le texte générique "Aucun résultat..." si la recherche est vide
            const emptyMessage = document.querySelector('.empty-gallery p');
            if (emptyMessage) {
                emptyMessage.innerHTML = 'Aucun résultat n\'a été trouvé pour : <strong style="color: var(--primary-color);">"' + lastSearch + '"</strong>';
            }
        }
    }
});
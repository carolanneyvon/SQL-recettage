#avec INNER JOIN
#f. Lister tous les articles dont les fournisseurs sont Française d’Imports ou Dubois et Fils 
SELECT ARTICLE.*
FROM ARTICLE
INNER JOIN FOURNISSEUR ON ARTICLE.ID_FOURNISSEUR = FOURNISSEUR.ID
WHERE FOURNISSEUR.NOM = 'Française d’Imports' OR FOURNISSEUR.NOM = 'Dubois et Fils';
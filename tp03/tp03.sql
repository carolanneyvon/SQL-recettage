#Requêtes SQL
#a. Lister toutes les données concernant les articles
SELECT * FROM ARTICLE;

#b. Lister uniquement les références et désignations des articles de plus de 2 euros
SELECT REF, DESIGNATION FROM ARTICLE WHERE PRIX > 2;

#c. Lister tous les articles dont le prix est compris entre 2 et 6.25 euros en utilisant les opérateurs de comparaison
SELECT * FROM ARTICLE WHERE PRIX >= 2 AND PRIX <= 6.25;

#d. Lister tous les articles dont le prix est compris entre 2 et 6.25 euros en utilisant l’opérateur BETWEEN
SELECT * FROM ARTICLE WHERE PRIX BETWEEN 2 AND 6.25;

#e. Lister tous les articles, dans l’ordre des prix descendants, et dont le prix n’est pas compris entre 2 et 6.25 euros et dont le fournisseur est Française d’Imports 
SELECT * FROM ARTICLE 
WHERE PRIX NOT BETWEEN 2 AND 6.25
AND ID_FOURNISSEUR = (SELECT ID FROM FOURNISSEUR WHERE NOM = 'Française d’Imports')
ORDER BY PRIX DESC;

#f. Lister tous les articles dont les fournisseurs sont Française d’imports ou Dubois et Fils en utilisant un opérateur logique
SELECT * FROM ARTICLE 
WHERE ID_FOURNISSEUR = (SELECT ID FROM FOURNISSEUR WHERE NOM = 'Française d’Imports')
OR ID_FOURNISSEUR = (SELECT ID FROM FOURNISSEUR WHERE NOM = 'Dubois et Fils');

#g. Réaliser la même requête que précédemment en utilisant l’opérateur IN
SELECT * FROM ARTICLE 
WHERE ID_FOURNISSEUR IN (
    SELECT ID FROM FOURNISSEUR WHERE NOM IN ('Française d’Imports', 'Dubois et Fils')
);

#h. Lister tous les articles dont les fournisseurs ne sont ni Française d’Imports, ni Dubois et Fils en utilisant les opérateurs NOT et IN
SELECT * FROM ARTICLE 
WHERE ID_FOURNISSEUR NOT IN (
    SELECT ID FROM FOURNISSEUR WHERE NOM IN ('Française d’Imports', 'Dubois et Fils')
);

#i. Lister tous les bons de commande dont la date de commande est entre le 01/02/2019 et le 30/04/2019 => absence de donnée pour ces dates
#nouvelles donnéés créé :

#Insertion de bons de commande avec des dates spécifiques
INSERT INTO BON (ID, NUMERO, DATE_CMDE, DELAI, ID_FOURNISSEUR) VALUES
(1, '002', '2019-02-15', 5, 1),  -- Française d’Imports
(2, '003', '2019-03-10', 7, 2),  -- FDM SA
(3, '004', '2019-04-25', 3, 3);  -- Dubois & Fils

SELECT * FROM BON 
WHERE DATE_CMDE BETWEEN '2019-02-01' AND '2019-04-30';

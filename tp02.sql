#01-Création de la base de données 'compta'
CREATE DATABASE compta;
USE compta;


#02-Création des 4 tables
#FOURNISSEUR
CREATE TABLE FOURNISSEUR (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NOM VARCHAR(255)
);

#ARTICLE
CREATE TABLE ARTICLE (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    REF VARCHAR(255),
    DESIGNATION VARCHAR(255),
    PRIX DECIMAL(10, 2),
    ID_FOURNISSEUR INT
);

#BON DE COMMANDE
CREATE TABLE BON (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NUMERO VARCHAR(255),
    DATE_CMDE DATE,
    DELAI INT,
    ID_FOURNISSEUR INT
);

#COMPO
CREATE TABLE COMPO (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    QTE INT,
    ID_ARTICLE INT,
    ID_BON INT
);

#Ajout des clés étrangères
ALTER TABLE ARTICLE
ADD CONSTRAINT fk_article_fournisseur
FOREIGN KEY (ID_FOURNISSEUR) REFERENCES FOURNISSEUR(ID);

ALTER TABLE BON
ADD CONSTRAINT fk_bon_fournisseur
FOREIGN KEY (ID_FOURNISSEUR) REFERENCES FOURNISSEUR(ID);

ALTER TABLE COMPO
ADD CONSTRAINT fk_compo_article
FOREIGN KEY (ID_ARTICLE) REFERENCES ARTICLE(ID);

ALTER TABLE COMPO
ADD CONSTRAINT fk_compo_bon
FOREIGN KEY (ID_BON) REFERENCES BON(ID);


#03-Insertion des données
#FOURNISSEUR
INSERT INTO FOURNISSEUR (ID, NOM) VALUES
(1, 'Française d’Imports'),
(2, 'FDM SA'),
(3, 'Dubois & Fils');

#ARTICLE
INSERT INTO ARTICLE (ID, REF, DESIGNATION, PRIX, ID_FOURNISSEUR) VALUES
(1, 'A01', 'Perceuse P1', 74.99, 1),
(2, 'F01', 'Boulon laiton 4 x 40 mm (sachet de 10)', 2.25, 2),
(3, 'F02', 'Boulon laiton 5 x 40 mm (sachet de 10)', 4.45, 2),
(4, 'D01', 'Boulon laiton 5 x 40 mm (sachet de 10)', 4.40, 3),
(5, 'A02', 'Meuleuse 125mm', 37.85, 1),
(6, 'D03', 'Boulon acier zingué 4 x 40mm (sachet de 10)', 1.80, 3),
(7, 'A03', 'Perceuse à colonne', 185.25, 1),
(8, 'D04', 'Coffret mèches à bois', 12.25, 3),
(9, 'F03', 'Coffret mèches plates', 6.25, 2),
(10, 'F04', 'Fraises d’encastrement', 8.14, 2);

#BON DE COMMANDE
#Insertion du bon de commande
INSERT INTO BON (ID, NUMERO, DATE_CMDE, DELAI, ID_FOURNISSEUR) VALUES
(1, '001', CURDATE(), 3, 1);

#Insertion des articles dans la composition du bon de commande
INSERT INTO COMPO (ID, QTE, ID_ARTICLE, ID_BON) VALUES
(1, 3, 1, 1),  # 3 perceuses P1
(2, 4, 5, 1),  # 4 meuleuses 125mm
(3, 1, 7, 1);  # 1 perceuse à colonne

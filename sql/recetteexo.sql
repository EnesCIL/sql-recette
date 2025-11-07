1-
SELECT r.nom, r.tempsPreparation, c.nomCategorie
FROM recette r
INNER JOIN categorie c on r.id_categorie = c.id_categorie 
ORDER BY c.id_categorie DESC

 2-
 SELECT r.nom, r.tempsPreparation, c.nomCategorie , nomIngredient
 FROM recette r
 INNER JOIN categorie c on r.id_categorie = c.id_categorie 
 INNER JOIN ingredient i ON i.id_ingredient= r.id_recette
 ORDER BY c.id_categorie DESC

3-
SELECT nom FROM recette
WHERE tempsPreparation >= 30

4-
SELECT "salade"  FROM recette

5-
INSERT INTO recette (id_recette,nom, tempsPreparation, instructions, id_categorie)
VALUES 
(20,'Pâtes à la carbonara', 20,'Faire cuire les pâtes, puis mélanger avec les œufs battus sans faire coaguler les œufs.',1)

6-
UPDATE  recette
SET nom = 'Poisson pannée'
WHERE id_recette = 3

7-

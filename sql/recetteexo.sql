1-
-- on selectionne le nom le temPrepa et le nom de categorie, r = la table recette et c = table categorie
SELECT r.nom, r.tempsPreparation, c.nomCategorie
-- depuis la recette r
FROM recette r
-- on mes la jointure de categorie dans la recette
INNER JOIN categorie c on r.id_categorie = c.id_categorie 
-- l'ordre en décroissant 
ORDER BY c.id_categorie DESC

 2-
 SELECT r.nom, r.tempsPreparation, c.nomCategorie , inomIngredient
 FROM recette r
 INNER JOIN categorie c on r.id_categorie = c.id_categorie 
 INNER JOIN ingredient i ON i.id_ingredient= r.id_recette
 ORDER BY c.id_categorie DESC

3-
-- selectionne le nom depuis recette
SELECT nom FROM recette
-- ou les tempsPreparation son superieur ou = a 30 min
WHERE tempsPreparation >= 30

4-

SELECT "salade"  FROM recette

5-
-- inserer une nouvelle ligne 
INSERT INTO recette (id_recette,nom, tempsPreparation, instructions, id_categorie)
VALUES 
(20,'Pâtes à la carbonara', 20,'Faire cuire les pâtes, puis mélanger avec les œufs battus sans faire coaguler les œufs.',1)

6-
-- mise a jour de recette
UPDATE  recette
-- on choisi la ligne qu'on veut changer 
SET nom = 'Poisson pannée'
-- ou selectionner l'id 
WHERE id_recette = 3

7-
-- delete aussi dans la clé étrangere sinon marche pas
DELETE FROM recette_ingredient
WHERE id_recette = 2

DELETE FROM recette
WHERE id_recette = 2

8-

SELECT SUM(prix) AS prix_total
FROM ingredient
WHERE id_ingredient = 5

9-
SELECT nomIngredient rn, quantite q, prix p
FROM recipe r
INNER JOIN recette_ingredient ri ON r.id_recipe = ri.id_recipe
INNER JOIN ingredient i ON ri.id_ingredient = i.id_ingredient
WHERE r.id_recipe = 5;

10-
INSERT INTO ingredient(nomIngredient, unite, prix)
VALUES ("Poivre", "cuillère à café", 2.5);

SELECT * FROM ingredient WHERE ingredient_name = "Poivre";
11-

UPDATE ingredient
SET prix = 1
WHERE id_ingredient = 12;

SELECT * FROM ingredient WHERE id_ingredient = 12;
12-
SELECT  COUNT(nom)



13-
SELECT "poulet"  FROM ingredient


14-
SELECT nom, tempsPreparation
UPDATE recette
Set nom = tempsPreparation - 5;


15-
SELECT nom 

16-
SELECT r.nom, r.preparation_time
FROM recette r
WHERE  MIN(preparation_time)
  
17-

18-

19-

20-
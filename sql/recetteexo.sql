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
 SELECT r.nom, r.tempsPreparation, c.nomCategorie , COUNT(ri.id_ingredient) AS nbIngredients
 FROM categorie c
 INNER JOIN recette r ON r.id_categorie = c.id_categorie
 INNER JOIN recette_ingredient ri ON ri.id_recette = r.id_recette
 GROUP BY r.nom, r.tempsPreparation, c.nomCategorie 




3-
-- selectionne le nom depuis recette
SELECT nom FROM recette
-- ou les tempsPreparation son superieur ou = a 30 min
WHERE tempsPreparation >= 30

4-
SELECT nom
FROM recette
WHERE nom LIKE '%salade%'

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

SELECT SUM(ri.quantite * i.prix) AS prix_total
FROM recette r 
INNER JOIN recette_ingredient ri ON ri.id_recette = r.id_recette
INNER JOIN ingredient i ON i.id_ingredient = ri.id_ingredient
WHERE  r.id_recette = 10

9-
SELECT nomIngredient , quantite , prix 
FROM recette r
INNER JOIN recette_ingredient ri ON r.id_recette = ri.id_recette
INNER JOIN ingredient i ON ri.id_ingredient = i.id_ingredient
WHERE r.id_recette = 5;


10-
INSERT INTO ingredient(nomIngredient, unite, prix)
VALUES ("Poivre", "cuillère à café", 2.5);

11-


UPDATE ingredient
SET prix = 1
WHERE id_ingredient = 10;


12-
SELECT  COUNT(r.id_recette) AS nbRecette, c.nomCategorie
FROM recette r
INNER JOIN categorie c on r.id_categorie = c.id_categorie
GROUP BY c.id_categorie




13-
SELECT r.nom 
FROM recette r
INNER JOIN recette_ingredient ri ON ri.id_recette = r.id_recette
INNER JOIN ingredient i ON i.id_ingredient = ri.id_ingredient
WHERE i.nomIngredient LIKE '%poulet%'



14-
SELECT nom, tempsPreparation
UPDATE recette
Set nom = tempsPreparation - 5;

UPDATE recette r
SET r.tempsPreparation - 5;
15-
SELECT r.nom
FROM recette r
WHERE r.id_recette NOT IN (
	SELECT ri.id_recette
	FROM recette_ingredient ri
	INNER JOIN ingredient i ON ri.id_ingredient = i.id_ingredient
	WHERE ri.id_recette = r.id_recette
	AND i.prix > 2
);

16-
SELECT r.nom, r.tempsPreparation
FROM recette r
WHERE r.tempsPreparation = (
	SELECT  MIN(r.tempsPreparation) 
	FROM recette r
);
  
17-
SELECT r.nom
FROM recette r
WHERE r.id_recette NOT IN (
	SELECT ri.id_recette
	FROM recette_ingredient ri
	INNER JOIN ingredient i ON ri.id_ingredient = i.id_ingredient
	WHERE ri.id_recette = r.id_recette
);
18-
SELECT i.nomIngredient,r.nom
FROM ingredient i 
INNER JOIN recette_ingredient ri ON ri.id_ingredient= i.id_ingredient
INNER JOIN recette r ON r.id_recette = ri.id_recette
GROUP BY i.id_ingredient
HAVING COUNT(ri.id_recette) >=3

19-
INSERT INTO ingredient(nomIngredient, prix, uniteMesure)
VALUE ("framboise", 3 , "Litre");
INSERT INTO recipe_ingredients(id_recette, id_ingredient, quantite)
VALUE (3, 12, 4);

SELECT nom r, nomIngredient i
FROM recette r
INNER JOIN recette_ingredient ri ON r.id_recette = ri.id_recette
INNER JOIN ingredient i ON ri.id_ingredient = i.id_ingredient
WHERE r.id_recipe = 3


20-
SELECT r.nom, SUM(i.prix) AS prix
FROM recette r
INNER JOIN recette_ingredient ri ON ri.id_recette= r.id_recette
INNER JOIN ingredient i ON ri.id_ingredient = i.id_ingredient
GROUP BY r.id_recette
HAVING SUM(i.prix) >= ALL(
	SELECT SUM(i.prix) 
	FROM recette r
	INNER JOIN recette_ingredient ri ON ri.id_recette = r.id_recette
	INNER JOIN ingredient i ON ri.id_ingredient = i.id_ingredient
	GROUP BY r.id_recette

);
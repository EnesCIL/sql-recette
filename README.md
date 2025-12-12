**README – Base de données “Recettes”**

**Description générale**

Ce projet consiste à créer et manipuler une base de données pour gérer des **recettes culinaires**, leurs **catégories**, et les **ingrédients** associés. L’objectif est de représenter de manière structurée les recettes et les composants nécessaires, afin de faciliter leur gestion et analyse.

**Structure de la base**

**La base recettes contient quatre tables principales :**

1. **categorie :**
Contient les types de recettes (Entrée, Plat, Dessert, etc.).

2. **ingredient :**
Liste des ingrédients disponibles avec leur nom, unité de mesure et prix.

3. **recette :**
Contient les informations sur chaque recette : nom, temps de préparation, instructions, et catégorie associée.

4. **recette_ingredient :**
Table de liaison entre recette et ingredient, permettant de préciser la quantité d’un ingrédient pour une recette donnée.

**Cette structure respecte les relations classiques :**

- Une recette appartient à une seule catégorie.
  
- Une recette contient plusieurs ingrédients.

- Un ingrédient peut apparaître dans plusieurs recettes.

**Fonctionnalités**

- Insertion de données : possibilité d’ajouter de nouvelles recettes, ingrédients ou catégories.

- Mise à jour : modification des données existantes (prix, nom, temps de préparation…).

- Suppression : suppression de recettes ou ingrédients avec respect des contraintes d’intégrité référentielle.

**Requêtes d’analyse :**

- Lister les recettes par catégorie.

- Calculer le coût total d’une recette.

- Rechercher des recettes par ingrédient ou nom.

- Identifier les ingrédients les plus utilisés.

- Filtrer les recettes selon le temps de préparation ou le prix des ingrédients.

**Objectif pédagogique**

**Ce projet permet de comprendre et pratiquer :**

- La conception d’un MCD (Modèle Conceptuel de Données).

- La création de tables relationnelles avec clés primaires et étrangères.

- Les opérations SQL : SELECT, INSERT, UPDATE, DELETE, et les jointures (JOIN).

- La gestion des relations un-à-plusieurs et plusieurs-à-plusieurs.

-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour recettes
CREATE DATABASE IF NOT EXISTS `recettes` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_danish_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `recettes`;

-- Listage de la structure de table recettes. categorie
CREATE TABLE IF NOT EXISTS `categorie` (
  `id_categorie` int NOT NULL AUTO_INCREMENT,
  `nomCategorie` varchar(50) COLLATE latin1_danish_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- Listage des données de la table recettes.categorie : ~3 rows (environ)
INSERT INTO `categorie` (`id_categorie`, `nomCategorie`) VALUES
	(1, 'Entrée'),
	(2, 'Plat'),
	(3, 'dessert');

-- Listage de la structure de table recettes. ingredient
CREATE TABLE IF NOT EXISTS `ingredient` (
  `id_ingredient` int NOT NULL AUTO_INCREMENT,
  `nomIngredient` varchar(50) CHARACTER SET latin1 COLLATE latin1_danish_ci NOT NULL,
  `prix` decimal(15,2) NOT NULL,
  `uniteMesure` varchar(50) COLLATE latin1_danish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_ingredient`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- Listage des données de la table recettes.ingredient : ~10 rows (environ)
INSERT INTO `ingredient` (`id_ingredient`, `nomIngredient`, `prix`, `uniteMesure`) VALUES
	(1, 'CAROTTE', 2.00, 'litre'),
	(2, 'FRAISE', 1.00, 'litre'),
	(3, 'BOEUF', 10.00, 'litre'),
	(4, 'OEUF', 0.40, 'litre'),
	(5, 'MIEL', 10.00, 'litre'),
	(6, 'POISSON', 6.25, 'litre'),
	(7, 'TOMATE', 1.00, 'litre'),
	(8, 'ORANGE', 3.20, 'litre'),
	(9, 'POMME', 3.00, 'litre'),
	(10, 'PECHE', 6.00, 'litre');

-- Listage de la structure de table recettes. recette
CREATE TABLE IF NOT EXISTS `recette` (
  `id_recette` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE latin1_danish_ci NOT NULL,
  `tempsPreparation` int NOT NULL,
  `instructions` varchar(100) COLLATE latin1_danish_ci NOT NULL,
  `id_categorie` int DEFAULT NULL,
  PRIMARY KEY (`id_recette`),
  KEY `id_categorie` (`id_categorie`),
  CONSTRAINT `FK_recette_categorie` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- Listage des données de la table recettes.recette : ~20 rows (environ)
INSERT INTO `recette` (`id_recette`, `nom`, `tempsPreparation`, `instructions`, `id_categorie`) VALUES
	(1, 'Salade de carottes râpées', 15, 'Râper les carottes, assaisonner avec du miel et du citron.', 1),
	(2, 'Soupe de tomates', 25, 'Faire revenir les tomates et mixer le tout.', 1),
	(3, 'Poisson pannée', 30, 'Couper le poisson en dés, assaisonner et servir frais.', 1),
	(4, 'Velouté de légumes', 40, 'Cuire les légumes, mixer et servir chaud.', 1),
	(5, 'Bruschetta à la tomate', 10, 'Griller le pain, frotter à l’ail, ajouter les tomates.', 1),
	(6, 'Boeuf bourguignon', 180, 'Faire mijoter le boeuf avec carottes et vin rouge.', 2),
	(7, 'Poisson grillé au miel', 25, 'Griller le poisson et napper de miel.', 2),
	(8, 'Omelette nature', 10, 'Battre les œufs, cuire et servir chaud.', 2),
	(9, 'Curry de légumes', 40, 'Faire revenir légumes et épices, servir avec riz.', 2),
	(10, 'Tacos au boeuf', 35, 'Cuire le boeuf, garnir les tortillas et plier.', 2),
	(11, 'Poulet à l’orange', 50, 'Faire cuire le poulet avec une sauce à base d’orange.', 2),
	(12, 'Spaghetti tomate basilic', 30, 'Cuire les pâtes, préparer une sauce tomate simple.', 2),
	(13, 'Poisson en papillote', 35, 'Envelopper le poisson avec légumes et cuire au four.', 2),
	(14, 'Boulettes de viande', 45, 'Préparer la farce, former les boulettes et cuire.', 2),
	(15, 'Tarte aux pommes', 60, 'Disposer les pommes sur la pâte, cuire au four.', 3),
	(16, 'Salade de fruits', 15, 'Couper les fruits et mélanger avec un peu de miel.', 3),
	(17, 'Mousse à l’orange', 30, 'Battre les blancs, incorporer le jus d’orange et refroidir.', 3),
	(18, 'Glace à la fraise', 20, 'Mixer les fraises avec sucre et congeler.', 3),
	(19, 'Compote de pêches', 25, 'Cuire les pêches avec un peu de miel et mixer.', 3),
	(20, 'Pâtes à la carbonara', 20, 'Faire cuire les pâtes, puis mélanger avec les œufs battus sans faire coaguler les œufs.', 1);

-- Listage de la structure de table recettes. recette_ingredient
CREATE TABLE IF NOT EXISTS `recette_ingredient` (
  `quantite` float DEFAULT NULL,
  `id_ingredient` int DEFAULT NULL,
  `id_recette` int DEFAULT NULL,
  KEY `id_ingredient` (`id_ingredient`),
  KEY `id_recette` (`id_recette`),
  CONSTRAINT `FK_recette_ingredient_ingredient` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`),
  CONSTRAINT `FK_recette_ingredient_recette` FOREIGN KEY (`id_recette`) REFERENCES `recette` (`id_recette`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- Listage des données de la table recettes.recette_ingredient : ~19 rows (environ)
INSERT INTO `recette_ingredient` (`quantite`, `id_ingredient`, `id_recette`) VALUES
	(2, 1, 1),
	(3, 7, 2),
	(2, 6, 3),
	(2, 1, 4),
	(2, 7, 5),
	(5, 3, 6),
	(3, 6, 7),
	(3, 4, 8),
	(4, 1, 9),
	(4, 3, 10),
	(2, 8, 11),
	(4, 7, 12),
	(3, 6, 13),
	(5, 3, 14),
	(3, 9, 15),
	(2, 9, 16),
	(2, 8, 17),
	(3, 2, 18),
	(4, 10, 19);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour recettes
CREATE DATABASE IF NOT EXISTS `recettes` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_danish_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `recettes`;

-- Listage de la structure de table recettes. categorie
CREATE TABLE IF NOT EXISTS `categorie` (
  `id_categorie` int NOT NULL AUTO_INCREMENT,
  `nomCategorie` varchar(50) COLLATE latin1_danish_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- Listage des données de la table recettes.categorie : ~3 rows (environ)
INSERT INTO `categorie` (`id_categorie`, `nomCategorie`) VALUES
	(1, 'Entrée'),
	(2, 'Plat'),
	(3, 'dessert');

-- Listage de la structure de table recettes. ingredient
CREATE TABLE IF NOT EXISTS `ingredient` (
  `id_ingredient` int NOT NULL AUTO_INCREMENT,
  `nomIngredient` varchar(50) CHARACTER SET latin1 COLLATE latin1_danish_ci NOT NULL,
  `prix` decimal(15,2) NOT NULL,
  `uniteMesure` varchar(50) COLLATE latin1_danish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_ingredient`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- Listage des données de la table recettes.ingredient : ~11 rows (environ)
INSERT INTO `ingredient` (`id_ingredient`, `nomIngredient`, `prix`, `uniteMesure`) VALUES
	(1, 'CAROTTE', 2.00, 'litre'),
	(2, 'FRAISE', 1.00, 'litre'),
	(3, 'BOEUF', 10.00, 'litre'),
	(4, 'OEUF', 0.40, 'litre'),
	(5, 'MIEL', 10.00, 'litre'),
	(6, 'POISSON', 6.25, 'litre'),
	(7, 'TOMATE', 1.00, 'litre'),
	(8, 'ORANGE', 3.20, 'litre'),
	(9, 'POMME', 3.00, 'litre'),
	(10, 'POULET', 1.00, 'litre'),
	(11, 'Poivre', 2.50, 'cuillère à café');

-- Listage de la structure de table recettes. recette
CREATE TABLE IF NOT EXISTS `recette` (
  `id_recette` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE latin1_danish_ci NOT NULL,
  `tempsPreparation` int NOT NULL,
  `instructions` varchar(100) COLLATE latin1_danish_ci NOT NULL,
  `id_categorie` int DEFAULT NULL,
  PRIMARY KEY (`id_recette`),
  KEY `id_categorie` (`id_categorie`),
  CONSTRAINT `FK_recette_categorie` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- Listage des données de la table recettes.recette : ~20 rows (environ)
INSERT INTO `recette` (`id_recette`, `nom`, `tempsPreparation`, `instructions`, `id_categorie`) VALUES
	(1, 'Salade de carottes râpées', 15, 'Râper les carottes, assaisonner avec du miel et du citron.', 1),
	(2, 'Soupe de tomates', 25, 'Faire revenir les tomates et mixer le tout.', 1),
	(3, 'Poisson pannée', 30, 'Couper le poisson en dés, assaisonner et servir frais.', 1),
	(4, 'Velouté de légumes', 40, 'Cuire les légumes, mixer et servir chaud.', 1),
	(5, 'Bruschetta à la tomate', 10, 'Griller le pain, frotter à l’ail, ajouter les tomates.', 1),
	(6, 'Boeuf bourguignon', 180, 'Faire mijoter le boeuf avec carottes et vin rouge.', 2),
	(7, 'Poisson grillé au miel', 25, 'Griller le poisson et napper de miel.', 2),
	(8, 'Omelette nature', 10, 'Battre les œufs, cuire et servir chaud.', 2),
	(9, 'Curry de légumes', 40, 'Faire revenir légumes et épices, servir avec riz.', 2),
	(10, 'Tacos au boeuf', 35, 'Cuire le boeuf, garnir les tortillas et plier.', 2),
	(11, 'Poulet à l’orange', 50, 'Faire cuire le poulet avec une sauce à base d’orange.', 2),
	(12, 'Spaghetti tomate basilic', 30, 'Cuire les pâtes, préparer une sauce tomate simple.', 2),
	(13, 'Poisson en papillote', 35, 'Envelopper le poisson avec légumes et cuire au four.', 2),
	(14, 'Boulettes de viande', 45, 'Préparer la farce, former les boulettes et cuire.', 2),
	(15, 'Tarte aux pommes', 60, 'Disposer les pommes sur la pâte, cuire au four.', 3),
	(16, 'Salade de fruits', 15, 'Couper les fruits et mélanger avec un peu de miel.', 3),
	(17, 'Mousse à l’orange', 30, 'Battre les blancs, incorporer le jus d’orange et refroidir.', 3),
	(18, 'Glace à la fraise', 20, 'Mixer les fraises avec sucre et congeler.', 3),
	(19, 'Compote de pêches', 25, 'Cuire les pêches avec un peu de miel et mixer.', 3),
	(20, 'Pâtes à la carbonara', 20, 'Faire cuire les pâtes, puis mélanger avec les œufs battus sans faire coaguler les œufs.', 1);

-- Listage de la structure de table recettes. recette_ingredient
CREATE TABLE IF NOT EXISTS `recette_ingredient` (
  `quantite` float DEFAULT NULL,
  `id_ingredient` int DEFAULT NULL,
  `id_recette` int DEFAULT NULL,
  KEY `id_ingredient` (`id_ingredient`),
  KEY `id_recette` (`id_recette`),
  CONSTRAINT `FK_recette_ingredient_ingredient` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`),
  CONSTRAINT `FK_recette_ingredient_recette` FOREIGN KEY (`id_recette`) REFERENCES `recette` (`id_recette`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- Listage des données de la table recettes.recette_ingredient : ~22 rows (environ)
INSERT INTO `recette_ingredient` (`quantite`, `id_ingredient`, `id_recette`) VALUES
	(2, 1, 1),
	(3, 7, 2),
	(2, 6, 3),
	(2, 1, 4),
	(2, 7, 5),
	(5, 3, 6),
	(3, 6, 7),
	(3, 4, 8),
	(4, 1, 9),
	(4, 3, 10),
	(2, 8, 11),
	(4, 7, 12),
	(3, 6, 13),
	(5, 3, 14),
	(3, 9, 15),
	(2, 9, 16),
	(2, 8, 17),
	(3, 2, 18),
	(4, 10, 19),
	(5, 5, 2),
	(5, 2, 11),
	(10, 3, 2);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

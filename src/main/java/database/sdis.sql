-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : jeu. 26 mars 2026 à 08:04
-- Version du serveur : 11.4.9-MariaDB
-- Version de PHP : 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `sdis`
--

-- --------------------------------------------------------

--
-- Structure de la table `caserne`
--

DROP TABLE IF EXISTS `caserne`;
CREATE TABLE IF NOT EXISTS `caserne` (
  `ID_CASERNE` int(11) NOT NULL AUTO_INCREMENT,
  `NOM` varchar(100) DEFAULT NULL,
  `RUE` varchar(255) DEFAULT NULL,
  `COPOS` varchar(5) DEFAULT NULL,
  `VILLE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_CASERNE`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `caserne`
--

INSERT INTO `caserne` (`ID_CASERNE`, `NOM`, `RUE`, `COPOS`, `VILLE`) VALUES
(1, 'Ifs', NULL, NULL, NULL),
(2, 'Lisieux', NULL, NULL, NULL),
(3, 'Le Hom', NULL, NULL, NULL),
(4, 'Caen Folie Couvrechef', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `categoriegrade`
--

DROP TABLE IF EXISTS `categoriegrade`;
CREATE TABLE IF NOT EXISTS `categoriegrade` (
  `ID_CATEGORIEGRADE` int(11) NOT NULL AUTO_INCREMENT,
  `LIBELLE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_CATEGORIEGRADE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `engin`
--

DROP TABLE IF EXISTS `engin`;
CREATE TABLE IF NOT EXISTS `engin` (
  `ID_ENGIN` int(11) NOT NULL AUTO_INCREMENT,
  `LIBELLE` varchar(100) DEFAULT NULL,
  `NUMEROORDRE` int(11) DEFAULT NULL,
  `ID_CASERNE` int(11) DEFAULT NULL,
  `ID_TYPEENGIN` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_ENGIN`),
  KEY `FK_ENGIN_CASERNE` (`ID_CASERNE`),
  KEY `FK_ENGIN_TYPE` (`ID_TYPEENGIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `envoyer`
--

DROP TABLE IF EXISTS `envoyer`;
CREATE TABLE IF NOT EXISTS `envoyer` (
  `ID_INTERVENTION` int(11) NOT NULL,
  `MATRICULE` int(11) NOT NULL,
  PRIMARY KEY (`ID_INTERVENTION`,`MATRICULE`),
  KEY `FK_ENV_POMPIER` (`MATRICULE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fonction`
--

DROP TABLE IF EXISTS `fonction`;
CREATE TABLE IF NOT EXISTS `fonction` (
  `CODE_FONCTION` varchar(10) NOT NULL,
  `LIBELLE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CODE_FONCTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `grade`
--

DROP TABLE IF EXISTS `grade`;
CREATE TABLE IF NOT EXISTS `grade` (
  `ID_GRADE` int(11) NOT NULL AUTO_INCREMENT,
  `LIBELLE` varchar(100) DEFAULT NULL,
  `ID_CATEGORIEGRADE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_GRADE`),
  KEY `FK_GRADE_CAT` (`ID_CATEGORIEGRADE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `habiliter`
--

DROP TABLE IF EXISTS `habiliter`;
CREATE TABLE IF NOT EXISTS `habiliter` (
  `MATRICULE` int(11) NOT NULL,
  `CODE_FONCTION` varchar(10) NOT NULL,
  PRIMARY KEY (`MATRICULE`,`CODE_FONCTION`),
  KEY `FK_HAB_FONCTION` (`CODE_FONCTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `intervention`
--

DROP TABLE IF EXISTS `intervention`;
CREATE TABLE IF NOT EXISTS `intervention` (
  `ID_INTERVENTION` int(11) NOT NULL AUTO_INCREMENT,
  `LIEU` varchar(255) DEFAULT NULL,
  `DATE_INTER` date DEFAULT NULL,
  `HEUREAPPEL` time DEFAULT NULL,
  `HEUREARRIVE` time DEFAULT NULL,
  `DUREE` time DEFAULT NULL,
  PRIMARY KEY (`ID_INTERVENTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `necessiter`
--

DROP TABLE IF EXISTS `necessiter`;
CREATE TABLE IF NOT EXISTS `necessiter` (
  `ID_INTERVENTION` int(11) NOT NULL,
  `CODE_SITUATION` varchar(10) NOT NULL,
  `ID_ENGIN` int(11) NOT NULL,
  PRIMARY KEY (`ID_INTERVENTION`,`CODE_SITUATION`,`ID_ENGIN`),
  KEY `FK_NEC_SITUATION` (`CODE_SITUATION`),
  KEY `FK_NEC_ENGIN` (`ID_ENGIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pompier`
--

DROP TABLE IF EXISTS `pompier`;
CREATE TABLE IF NOT EXISTS `pompier` (
  `MATRICULE` int(11) NOT NULL AUTO_INCREMENT,
  `NOM` varchar(50) DEFAULT NULL,
  `PRENOM` varchar(50) DEFAULT NULL,
  `DATENAISS` date DEFAULT NULL,
  `NUMEROTEL` varchar(15) DEFAULT NULL,
  `ID_GRADE` int(11) DEFAULT NULL,
  `ID_CASERNE` int(11) DEFAULT NULL,
  `ID_PROFESSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`MATRICULE`),
  KEY `FK_POMPIER_GRADE` (`ID_GRADE`),
  KEY `FK_POMPIER_CASERNE` (`ID_CASERNE`),
  KEY `FK_POMPIER_PROF` (`ID_PROFESSION`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pompier`
--

INSERT INTO `pompier` (`MATRICULE`, `NOM`, `PRENOM`, `DATENAISS`, `NUMEROTEL`, `ID_GRADE`, `ID_CASERNE`, `ID_PROFESSION`) VALUES
(1, 'LEROY', 'Pierrick', NULL, NULL, NULL, 1, NULL),
(2, 'MASSON', 'Bastien', NULL, NULL, NULL, 1, NULL),
(3, 'DUVAL', 'Matthias', NULL, NULL, NULL, 4, NULL),
(4, 'MADJI', 'Walid', NULL, NULL, NULL, 4, NULL),
(6, 'CHAUVEL', 'Jules', NULL, NULL, NULL, 1, NULL),
(7, 'CAUVIN', 'Nayah', NULL, NULL, NULL, 1, NULL),
(8, 'TRAORE', 'Sylvain', NULL, NULL, NULL, 3, NULL),
(9, 'BOULEAU', 'Line', NULL, NULL, NULL, 3, NULL),
(10, 'MANCEL', 'Florianne', NULL, NULL, NULL, 2, NULL),
(11, 'PONTIER', 'Claire', NULL, NULL, NULL, 2, NULL),
(12, 'BARON', 'Gwladys', NULL, NULL, NULL, 3, NULL),
(13, 'PASTOR', 'Lucas', NULL, NULL, NULL, 1, NULL),
(14, 'BAREAU', 'Mila', NULL, NULL, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `profession`
--

DROP TABLE IF EXISTS `profession`;
CREATE TABLE IF NOT EXISTS `profession` (
  `ID_PROFESSION` int(11) NOT NULL AUTO_INCREMENT,
  `LIBELLE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_PROFESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `situation`
--

DROP TABLE IF EXISTS `situation`;
CREATE TABLE IF NOT EXISTS `situation` (
  `CODE_SITUATION` varchar(10) NOT NULL,
  `LIBELLE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CODE_SITUATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `typeengin`
--

DROP TABLE IF EXISTS `typeengin`;
CREATE TABLE IF NOT EXISTS `typeengin` (
  `ID_TYPEENGIN` int(11) NOT NULL AUTO_INCREMENT,
  `LIBELLE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_TYPEENGIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `engin`
--
ALTER TABLE `engin`
  ADD CONSTRAINT `FK_ENGIN_CASERNE` FOREIGN KEY (`ID_CASERNE`) REFERENCES `caserne` (`ID_CASERNE`),
  ADD CONSTRAINT `FK_ENGIN_TYPE` FOREIGN KEY (`ID_TYPEENGIN`) REFERENCES `typeengin` (`ID_TYPEENGIN`);

--
-- Contraintes pour la table `envoyer`
--
ALTER TABLE `envoyer`
  ADD CONSTRAINT `FK_ENV_INTER` FOREIGN KEY (`ID_INTERVENTION`) REFERENCES `intervention` (`ID_INTERVENTION`),
  ADD CONSTRAINT `FK_ENV_POMPIER` FOREIGN KEY (`MATRICULE`) REFERENCES `pompier` (`MATRICULE`);

--
-- Contraintes pour la table `grade`
--
ALTER TABLE `grade`
  ADD CONSTRAINT `FK_GRADE_CAT` FOREIGN KEY (`ID_CATEGORIEGRADE`) REFERENCES `categoriegrade` (`ID_CATEGORIEGRADE`);

--
-- Contraintes pour la table `habiliter`
--
ALTER TABLE `habiliter`
  ADD CONSTRAINT `FK_HAB_FONCTION` FOREIGN KEY (`CODE_FONCTION`) REFERENCES `fonction` (`CODE_FONCTION`),
  ADD CONSTRAINT `FK_HAB_POMPIER` FOREIGN KEY (`MATRICULE`) REFERENCES `pompier` (`MATRICULE`);

--
-- Contraintes pour la table `necessiter`
--
ALTER TABLE `necessiter`
  ADD CONSTRAINT `FK_NEC_ENGIN` FOREIGN KEY (`ID_ENGIN`) REFERENCES `engin` (`ID_ENGIN`),
  ADD CONSTRAINT `FK_NEC_INTER` FOREIGN KEY (`ID_INTERVENTION`) REFERENCES `intervention` (`ID_INTERVENTION`),
  ADD CONSTRAINT `FK_NEC_SITUATION` FOREIGN KEY (`CODE_SITUATION`) REFERENCES `situation` (`CODE_SITUATION`);

--
-- Contraintes pour la table `pompier`
--
ALTER TABLE `pompier`
  ADD CONSTRAINT `FK_POMPIER_CASERNE` FOREIGN KEY (`ID_CASERNE`) REFERENCES `caserne` (`ID_CASERNE`),
  ADD CONSTRAINT `FK_POMPIER_GRADE` FOREIGN KEY (`ID_GRADE`) REFERENCES `grade` (`ID_GRADE`),
  ADD CONSTRAINT `FK_POMPIER_PROF` FOREIGN KEY (`ID_PROFESSION`) REFERENCES `profession` (`ID_PROFESSION`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

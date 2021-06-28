-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 17 juin 2021 à 11:27
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `maximmo`
--

-- --------------------------------------------------------

--
-- Structure de la table `attachement`
--

DROP TABLE IF EXISTS `attachement`;
CREATE TABLE IF NOT EXISTS `attachement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commune_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `commune_id` (`commune_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `attachement`
--

INSERT INTO `attachement` (`id`, `commune_id`) VALUES
(1, 1),
(2, 5);

-- --------------------------------------------------------

--
-- Structure de la table `attachment_commune`
--

DROP TABLE IF EXISTS `attachment_commune`;
CREATE TABLE IF NOT EXISTS `attachment_commune` (
  `commune_id` int(11) DEFAULT NULL,
  `attachement_id` int(11) DEFAULT NULL,
  KEY `attachement_id` (`attachement_id`),
  KEY `commune_id` (`commune_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `attachment_commune`
--

INSERT INTO `attachment_commune` (`commune_id`, `attachement_id`) VALUES
(2, 1),
(3, 1),
(4, 2);

-- --------------------------------------------------------

--
-- Structure de la table `commune`
--

DROP TABLE IF EXISTS `commune`;
CREATE TABLE IF NOT EXISTS `commune` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `code_postal` varchar(255) DEFAULT NULL,
  `superficie` float DEFAULT NULL,
  `population` int(11) DEFAULT NULL,
  `departement_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `departement_id` (`departement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commune`
--

INSERT INTO `commune` (`id`, `nom`, `code_postal`, `superficie`, `population`, `departement_id`) VALUES
(1, 'BORDEAUX', '33000', 49.36, 249712, 1),
(2, 'AMBES', '33810', 28.85, 3167, 1),
(3, 'COUTRAS', '33230', 33.69, 8545, 1),
(4, 'ANDERNOS-LES-BAINS', '33230', 20.01, 19194, 1),
(5, 'LIBOURNE', '33500', 20.63, 36601, 1);

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

DROP TABLE IF EXISTS `departement`;
CREATE TABLE IF NOT EXISTS `departement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `region_id` (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `departement`
--

INSERT INTO `departement` (`id`, `code`, `nom`, `region_id`) VALUES
(1, 33, 'Gironde', 1);

-- --------------------------------------------------------

--
-- Structure de la table `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE IF NOT EXISTS `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fichier` varchar(255) DEFAULT NULL,
  `logement_id` int(11) DEFAULT NULL,
  `legende` varchar(255) DEFAULT NULL,
  `is_main` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `logement_id` (`logement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `images`
--

INSERT INTO `images` (`id`, `fichier`, `logement_id`, `legende`, `is_main`) VALUES
(1, 'image4.jpg', 1, 'Bla bla', 1),
(2, 'image2.jpg', 2, 'Bla Bla Bla', 1),
(3, 'image3.jpg', 3, 'Bla bla bla bla bla', 1),
(4, 'image1.jpg', 1, 'Bla', 0);

-- --------------------------------------------------------

--
-- Structure de la table `logement`
--

DROP TABLE IF EXISTS `logement`;
CREATE TABLE IF NOT EXISTS `logement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logement_type` int(11) NOT NULL,
  `surface_logement` int(11) DEFAULT NULL,
  `surface_terrain` int(11) DEFAULT NULL,
  `pieces` int(11) DEFAULT NULL,
  `ref_interne` varchar(255) DEFAULT NULL,
  `description` text,
  `prix` int(11) DEFAULT NULL,
  `bilan_energie` float DEFAULT NULL,
  `bilan_ges` float DEFAULT NULL,
  `commune_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ref_interne` (`ref_interne`),
  KEY `commune_id` (`commune_id`),
  KEY `logement_type` (`logement_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `logement`
--

INSERT INTO `logement` (`id`, `logement_type`, `surface_logement`, `surface_terrain`, `pieces`, `ref_interne`, `description`, `prix`, `bilan_energie`, `bilan_ges`, `commune_id`) VALUES
(1, 2, 85, NULL, 4, 'IhDx70N8TTAIv7bT', 'Vous souhaitez investir ou vous êtes à la recherche de votre résidence principale dans du neuf ?N\'hésitez plus ! Venez découvrir ce nouveau programme idéalement situé, à deux pas du centre ville et des transports en communs. Nous vous proposons des appartements du 2 au 5 pièces à partir de 266 000 euros Eligible loi PINEL Livraison à partir du 4ème trimestre 2023 395000 euros Honoraires à la charge du vendeur.', 395000, 221, 76, 1),
(2, 2, 40, NULL, 4, 'rdlVFmA1YtSBYcXN', 'BORDEAUX - HYPER CENTRE Au pied de la place Camille Jullian, agréable appartement de type 2 pièces composé d\'une entrée, séjour avec cuisine ouverte, chambre et salle de bain. Parties communes et immeuble en parfait état. Copropriété de 3 lots Charges annuelles : 0 euros. 285000 euros Honoraires à la charge du vendeur.', 285000, 127, 13, 1),
(3, 1, 90, 356, 4, 'y2ocxHGMT8W1y5wX', 'Proche de la place Nansouty En seconde ligne, nous vous proposons une maison lumineuse de quatre pièces avec une jolie terrasse de 40 m2. Dans une petite copropriété, cette maison est composée de deux niveaux, au rez-de-chaussée un grand séjour donnant sur la terrasse, une cuisine entièrement équipée, une suite parentale avec salle d\'eau, WC. Au premier étage, un palier desservant deux chambres, une salle d\'eau avec WC et une buanderie. Climatisation, rangements, panneaux solaires? Parking privatif Proximité des transports et de toutes commodités. Copropriété de 20 lots Charges annuelles : 530 euros. 480000 euros Honoraires à la charge du vendeur.', 480000, 135, 35, 2);

-- --------------------------------------------------------

--
-- Structure de la table `logement_option`
--

DROP TABLE IF EXISTS `logement_option`;
CREATE TABLE IF NOT EXISTS `logement_option` (
  `logement_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  KEY `logement_id` (`logement_id`),
  KEY `option_id` (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `logement_option`
--

INSERT INTO `logement_option` (`logement_id`, `option_id`) VALUES
(1, 9),
(1, 2),
(1, 4),
(2, 7),
(2, 9),
(2, 2),
(3, 7),
(3, 3),
(3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `optiontb`
--

DROP TABLE IF EXISTS `optiontb`;
CREATE TABLE IF NOT EXISTS `optiontb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `optiontb`
--

INSERT INTO `optiontb` (`id`, `nom`) VALUES
(1, 'Piscine'),
(2, 'Terrasse / Balcon'),
(3, 'Cheminée'),
(4, 'Climatisation'),
(5, 'Alarme'),
(6, 'Garage'),
(7, 'Cuisine équipée'),
(8, 'Séjour de plus de 30 mètres carrés'),
(9, 'Parking'),
(10, 'Ascenseur');

-- --------------------------------------------------------

--
-- Structure de la table `region`
--

DROP TABLE IF EXISTS `region`;
CREATE TABLE IF NOT EXISTS `region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `region`
--

INSERT INTO `region` (`id`, `nom`) VALUES
(1, 'Nouvelle-Aquitaine');

-- --------------------------------------------------------

--
-- Structure de la table `type_de_bien`
--

DROP TABLE IF EXISTS `type_de_bien`;
CREATE TABLE IF NOT EXISTS `type_de_bien` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_de_bien`
--

INSERT INTO `type_de_bien` (`id`, `nom`) VALUES
(1, 'Maison'),
(2, 'Appartement'),
(3, 'Terrain');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `attachement`
--
ALTER TABLE `attachement`
  ADD CONSTRAINT `attachement_ibfk_1` FOREIGN KEY (`commune_id`) REFERENCES `commune` (`id`);

--
-- Contraintes pour la table `attachment_commune`
--
ALTER TABLE `attachment_commune`
  ADD CONSTRAINT `attachment_commune_ibfk_1` FOREIGN KEY (`attachement_id`) REFERENCES `attachement` (`id`),
  ADD CONSTRAINT `attachment_commune_ibfk_2` FOREIGN KEY (`commune_id`) REFERENCES `commune` (`id`);

--
-- Contraintes pour la table `commune`
--
ALTER TABLE `commune`
  ADD CONSTRAINT `commune_ibfk_1` FOREIGN KEY (`departement_id`) REFERENCES `departement` (`id`);

--
-- Contraintes pour la table `departement`
--
ALTER TABLE `departement`
  ADD CONSTRAINT `departement_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`);

--
-- Contraintes pour la table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`logement_id`) REFERENCES `logement` (`id`);

--
-- Contraintes pour la table `logement`
--
ALTER TABLE `logement`
  ADD CONSTRAINT `logement_ibfk_2` FOREIGN KEY (`commune_id`) REFERENCES `commune` (`id`),
  ADD CONSTRAINT `logement_ibfk_3` FOREIGN KEY (`logement_type`) REFERENCES `type_de_bien` (`id`);

--
-- Contraintes pour la table `logement_option`
--
ALTER TABLE `logement_option`
  ADD CONSTRAINT `logement_option_ibfk_1` FOREIGN KEY (`logement_id`) REFERENCES `logement` (`id`),
  ADD CONSTRAINT `logement_option_ibfk_2` FOREIGN KEY (`option_id`) REFERENCES `optiontb` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

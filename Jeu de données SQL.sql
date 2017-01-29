-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Dim 15 Janvier 2017 à 17:02
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projet conciergerie`
--

-- --------------------------------------------------------

--
-- Structure de la table `abonnement`
--

CREATE TABLE IF NOT EXISTS `abonnement` (
  `id_Abonnement` int(11) NOT NULL AUTO_INCREMENT,
  `id_Bouquet` int(11) NOT NULL,
  `id_Util` int(11) NOT NULL,
  `Duree_Abonnement` int(11) NOT NULL,
  `Date_Debut_Abonnement` datetime NOT NULL,
  PRIMARY KEY (`id_Abonnement`),
  KEY `FK_Abonnement_Bouquet` (`id_Bouquet`),
  KEY `FK_Abonnement_Ent_Cliente` (`id_Util`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `abonnement`
--

INSERT INTO `abonnement` (`id_Abonnement`, `id_Bouquet`, `id_Util`, `Duree_Abonnement`, `Date_Debut_Abonnement`) VALUES
(1, 2, 23, 3, '2017-01-15 17:59:50'),
(2, 3, 21, 12, '2017-01-15 17:59:50'),
(3, 3, 22, 5, '2017-01-15 17:59:50');

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE IF NOT EXISTS `administrateur` (
  `id_Util` int(11) NOT NULL,
  `Nom_Admin` varchar(64) NOT NULL,
  `Prenom_Admin` varchar(64) NOT NULL,
  `Tel_Admin` varchar(10) DEFAULT NULL,
  `Mail_Admin` varchar(128) DEFAULT NULL,
  `Login_Util` varchar(32) NOT NULL,
  `Pass_Util` varchar(128) NOT NULL,
  PRIMARY KEY (`id_Util`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `administrateur`
--

INSERT INTO `administrateur` (`id_Util`, `Nom_Admin`, `Prenom_Admin`, `Tel_Admin`, `Mail_Admin`, `Login_Util`, `Pass_Util`) VALUES
(41, 'Rajaonarimampianina', 'Hery', '0648271586', 'h.rajaonarimampianina@gmail.com', 'admin1', 'admin1'),
(42, 'Rajaonarimampianina', 'Voahangy', '0619745245', 'v.rajaonarimampianina@gmail.com', 'admin2', 'admin2'),
(43, 'Solonandrasana', 'Olivier Mahafaly', '0645727256', 'olivier-m.solonandrasana@gmail.com', 'admin3', 'admin3');

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

CREATE TABLE IF NOT EXISTS `adresse` (
  `id_Adresse` int(11) NOT NULL AUTO_INCREMENT,
  `Num_Adresse` int(11) NOT NULL,
  `Rue_Adresse` varchar(128) NOT NULL,
  `Ville_Adresse` varchar(64) NOT NULL,
  `CP_Adresse` int(11) NOT NULL,
  `Num_Appart_Adresse` int(11) DEFAULT NULL,
  `Etage_Adresse` int(11) DEFAULT NULL,
  `Comp_Adresse` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_Adresse`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `adresse`
--

INSERT INTO `adresse` (`id_Adresse`, `Num_Adresse`, `Rue_Adresse`, `Ville_Adresse`, `CP_Adresse`, `Num_Appart_Adresse`, `Etage_Adresse`, `Comp_Adresse`) VALUES
(21, 58, 'Avenue des Tuileries', 'Paris', 75000, NULL, NULL, NULL),
(22, 97, 'Rue du calvaire', 'Nantes', 44000, NULL, NULL, NULL),
(23, 8, 'Rue de la République', 'Orléans', 45000, NULL, NULL, NULL),
(31, 87, 'Chemin Des Bateliers', 'Annecy', 74000, NULL, NULL, NULL),
(32, 66, 'Avenue de Provence', 'VALLAURIS', 6220, NULL, NULL, NULL),
(33, 65, 'Rue La Boétie', 'Paris', 75014, NULL, NULL, NULL),
(41, 380, 'Rue Jacques Monod', 'Olivet', 45160, NULL, NULL, NULL),
(42, 575, 'Rue des Platanes', 'Orléans', 45000, NULL, NULL, NULL),
(43, 12, 'Rue Henri IV', 'Orléans', 45100, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `adresse_perso_sal`
--

CREATE TABLE IF NOT EXISTS `adresse_perso_sal` (
  `id_Util_Herite_Util` int(11) NOT NULL,
  `id_Adresse` int(11) NOT NULL,
  PRIMARY KEY (`id_Util_Herite_Util`,`id_Adresse`),
  KEY `FK_Adresse_Perso_Sal_Adresse` (`id_Adresse`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `adresse_perso_sal`
--

INSERT INTO `adresse_perso_sal` (`id_Util_Herite_Util`, `id_Adresse`) VALUES
(31, 33),
(32, 31),
(33, 32);

-- --------------------------------------------------------

--
-- Structure de la table `adresse_pro`
--

CREATE TABLE IF NOT EXISTS `adresse_pro` (
  `id_Adresse` int(11) NOT NULL,
  `Cedex_Adresse` int(11) DEFAULT NULL,
  `Num_Adresse` int(11) NOT NULL,
  `Rue_Adresse` varchar(128) NOT NULL,
  `Ville_Adresse` varchar(64) NOT NULL,
  `CP_Adresse` int(11) NOT NULL,
  `Num_Appart_Adresse` int(11) DEFAULT NULL,
  `Etage_Adresse` int(11) DEFAULT NULL,
  `Comp_Adresse` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_Adresse`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `adresse_pro`
--

INSERT INTO `adresse_pro` (`id_Adresse`, `Cedex_Adresse`, `Num_Adresse`, `Rue_Adresse`, `Ville_Adresse`, `CP_Adresse`, `Num_Appart_Adresse`, `Etage_Adresse`, `Comp_Adresse`) VALUES
(21, 5, 58, 'Avenue des Tuileries', 'Paris', 75000, NULL, NULL, NULL),
(22, NULL, 97, 'Rue du calvaire', 'Nantes', 44000, NULL, NULL, NULL),
(23, NULL, 8, 'Rue de la République', 'Orléans', 45000, NULL, NULL, NULL),
(41, NULL, 380, 'Rue Jacques Monod', 'Olivet', 45160, NULL, NULL, NULL),
(42, NULL, 575, 'Rue des Platanes', 'Orléans', 45000, NULL, NULL, NULL),
(43, NULL, 12, 'Rue Henri IV', 'Orléans', 45100, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `bouquet`
--

CREATE TABLE IF NOT EXISTS `bouquet` (
  `id_Bouquet` int(11) NOT NULL AUTO_INCREMENT,
  `Lib_Bouquet` varchar(128) DEFAULT NULL,
  `Tarif_Bouquet` decimal(13,2) NOT NULL,
  PRIMARY KEY (`id_Bouquet`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `bouquet`
--

INSERT INTO `bouquet` (`id_Bouquet`, `Lib_Bouquet`, `Tarif_Bouquet`) VALUES
(1, 'Basique', '10.00'),
(2, 'Confort', '40.00'),
(3, 'Premium', '100.00');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE IF NOT EXISTS `commande` (
  `id_Commande` int(11) NOT NULL AUTO_INCREMENT,
  `Code_Etat_Commande` int(11) NOT NULL,
  `id_Facture` int(11) DEFAULT NULL,
  `id_Service` int(11) NOT NULL,
  `id_Util_Herite_Util` int(11) NOT NULL,
  `Info_Comp_Commande` text,
  PRIMARY KEY (`id_Commande`),
  KEY `FK_Commande_Etat_Commande` (`Code_Etat_Commande`),
  KEY `FK_Commande_Salarie` (`id_Util_Herite_Util`),
  KEY `FK_Commande_Facture` (`id_Facture`),
  KEY `FK_Commande_Service` (`id_Service`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commande`
--

INSERT INTO `commande` (`id_Commande`, `Code_Etat_Commande`, `id_Facture`, `id_Service`, `id_Util_Herite_Util`, `Info_Comp_Commande`) VALUES
(1, 3, 1, 424, 33, NULL),
(2, 1, NULL, 424, 33, 'Courses pour lundi'),
(3, 2, NULL, 433, 31, 'Golf 7 GTI'),
(4, 1, NULL, 424, 32, 'Enfant Asthmatique');

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE IF NOT EXISTS `commentaire` (
  `Code_Commentaire` int(11) NOT NULL AUTO_INCREMENT,
  `id_Service` int(11) NOT NULL,
  `id_Util_Herite_Util` int(11) NOT NULL,
  `Titre_Commentaire` varchar(128) DEFAULT NULL,
  `Contenu_Commentaire` text NOT NULL,
  PRIMARY KEY (`Code_Commentaire`),
  KEY `FK_Commentaire_Service` (`id_Service`),
  KEY `FK_Commentaire_Salarie` (`id_Util_Herite_Util`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commentaire`
--

INSERT INTO `commentaire` (`Code_Commentaire`, `id_Service`, `id_Util_Herite_Util`, `Titre_Commentaire`, `Contenu_Commentaire`) VALUES
(1, 424, 33, 'Parfait!', 'Tous les achats sont là!');

-- --------------------------------------------------------

--
-- Structure de la table `contenu_bouquet`
--

CREATE TABLE IF NOT EXISTS `contenu_bouquet` (
  `id_Service` int(11) NOT NULL,
  `id_Bouquet` int(11) NOT NULL,
  PRIMARY KEY (`id_Service`,`id_Bouquet`),
  KEY `FK_Contenu_Bouquet_Bouquet` (`id_Bouquet`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `contenu_bouquet`
--

INSERT INTO `contenu_bouquet` (`id_Service`, `id_Bouquet`) VALUES
(411, 1),
(411, 2),
(411, 3),
(412, 3),
(424, 1),
(424, 2),
(424, 3),
(425, 2),
(425, 3),
(432, 2),
(432, 3),
(433, 3);

-- --------------------------------------------------------

--
-- Structure de la table `ent_cliente`
--

CREATE TABLE IF NOT EXISTS `ent_cliente` (
  `id_Util` int(11) NOT NULL,
  `id_Adresse` int(11) NOT NULL,
  `Nom_Ent` varchar(128) NOT NULL,
  `Tel_Ent` varchar(10) NOT NULL,
  `Web_Ent` varchar(128) DEFAULT NULL,
  `Mail_Ent` varchar(128) DEFAULT NULL,
  `Login_Util` varchar(32) NOT NULL,
  `Pass_Util` varchar(128) NOT NULL,
  PRIMARY KEY (`id_Util`),
  KEY `FK_Ent_Cliente_Adresse_Pro` (`id_Adresse`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ent_cliente`
--

INSERT INTO `ent_cliente` (`id_Util`, `id_Adresse`, `Nom_Ent`, `Tel_Ent`, `Web_Ent`, `Mail_Ent`, `Login_Util`, `Pass_Util`) VALUES
(21, 21, 'Sopra Steria', '0238523737', 'soprasteria.com', 'contact@soprasteria.com', 'entreprise1', 'entreprise1'),
(22, 23, 'Atos', '0238250101', 'fr.atos.net', 'contact@atos.net', 'entreprise2', 'entreprise2'),
(23, 22, 'CGI', '0238568930', 'cgi.fr', 'contact@cgi.fr', 'entreprise3', 'entreprise3');

-- --------------------------------------------------------

--
-- Structure de la table `etat_co`
--

CREATE TABLE IF NOT EXISTS `etat_co` (
  `Code_Etat_Connexion` int(11) NOT NULL,
  `Lib_Etat_Connexion` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`Code_Etat_Connexion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `etat_co`
--

INSERT INTO `etat_co` (`Code_Etat_Connexion`, `Lib_Etat_Connexion`) VALUES
(1, 'Inscrit'),
(2, 'Connecté');

-- --------------------------------------------------------

--
-- Structure de la table `etat_commande`
--

CREATE TABLE IF NOT EXISTS `etat_commande` (
  `Code_Etat_Commande` int(11) NOT NULL,
  `Lib_Etat_Commande` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`Code_Etat_Commande`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `etat_commande`
--

INSERT INTO `etat_commande` (`Code_Etat_Commande`, `Lib_Etat_Commande`) VALUES
(1, 'Créée'),
(2, 'En cours'),
(3, 'Terminée');

-- --------------------------------------------------------

--
-- Structure de la table `etat_facture`
--

CREATE TABLE IF NOT EXISTS `etat_facture` (
  `Code_Etat_Facture` int(11) NOT NULL,
  `Lib_Etat_Facture` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`Code_Etat_Facture`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `etat_facture`
--

INSERT INTO `etat_facture` (`Code_Etat_Facture`, `Lib_Etat_Facture`) VALUES
(1, 'Impayée'),
(2, 'Payée');

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE IF NOT EXISTS `facture` (
  `id_Facture` int(11) NOT NULL AUTO_INCREMENT,
  `id_Abonnement` int(11) DEFAULT NULL,
  `Code_Etat_Facture` int(11) NOT NULL,
  `id_Commande` int(11) DEFAULT NULL,
  `Code_Type_Facture` int(11) NOT NULL,
  `id_Util` int(11) NOT NULL,
  `id_Util_1` int(11) DEFAULT NULL,
  `id_Util_Herite_Util` int(11) DEFAULT NULL,
  `Info_Comp_Facture` text,
  PRIMARY KEY (`id_Facture`),
  KEY `FK_Facture_Abonnement` (`id_Abonnement`),
  KEY `FK_Facture_Etat_Facture` (`Code_Etat_Facture`),
  KEY `FK_Facture_Ent_Cliente` (`id_Util_1`),
  KEY `FK_Facture_Presta` (`id_Util`),
  KEY `FK_Facture_Salarie` (`id_Util_Herite_Util`),
  KEY `FK_Facture_Commande` (`id_Commande`),
  KEY `FK_Facture_Type_Facture` (`Code_Type_Facture`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `facture`
--

INSERT INTO `facture` (`id_Facture`, `id_Abonnement`, `Code_Etat_Facture`, `id_Commande`, `Code_Type_Facture`, `id_Util`, `id_Util_1`, `id_Util_Herite_Util`, `Info_Comp_Facture`) VALUES
(1, NULL, 2, 1, 2, 42, NULL, 33, NULL),
(2, 1, 1, NULL, 1, 0, 21, NULL, 'Facturation de l\'abonnement de Sopra Steria au bouquet Premium');

-- --------------------------------------------------------

--
-- Structure de la table `presta`
--

CREATE TABLE IF NOT EXISTS `presta` (
  `id_Util` int(11) NOT NULL,
  `id_Adresse` int(11) NOT NULL,
  `Nom_Presta` varchar(128) NOT NULL,
  `Prenom_Presta` varchar(128) NOT NULL,
  `Sexe_Presta` varchar(32) NOT NULL,
  `Age_Presta` int(11) DEFAULT NULL,
  `Societe_Presta` varchar(128) NOT NULL,
  `Tel_Presta` varchar(10) DEFAULT NULL,
  `Mail_Presta` varchar(32) DEFAULT NULL,
  `Login_Util` varchar(32) NOT NULL,
  `Pass_Util` varchar(128) NOT NULL,
  PRIMARY KEY (`id_Util`),
  KEY `FK_Presta_Adresse_Pro` (`id_Adresse`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `presta`
--

INSERT INTO `presta` (`id_Util`, `id_Adresse`, `Nom_Presta`, `Prenom_Presta`, `Sexe_Presta`, `Age_Presta`, `Societe_Presta`, `Tel_Presta`, `Mail_Presta`, `Login_Util`, `Pass_Util`) VALUES
(41, 41, 'Tare', 'Guy', 'Homme', 52, 'Yamaha', '0225225442', 'g.tare@yahoo.fr', 'prestataire1', 'prestataire1'),
(42, 42, 'Menvussa', 'Gérard', 'Homme', 48, 'Manomano', '0282946834', 'g.menvussa@outlook.com', 'prestataire2', 'prestataire2'),
(43, 43, 'Cover', 'Harry', 'Homme', 23, 'Rustica', '0295389468', 'harry.c@hotmail.fr', 'prestataire3', 'prestataire3');

-- --------------------------------------------------------

--
-- Structure de la table `salarie`
--

CREATE TABLE IF NOT EXISTS `salarie` (
  `id_Util_Herite_Util` int(11) NOT NULL,
  `id_Util` int(11) NOT NULL,
  `id_Adresse` int(11) NOT NULL,
  `Nom_Sal` varchar(128) NOT NULL,
  `Prenom_Sal` varchar(128) NOT NULL,
  `Sexe_Sal` varchar(32) NOT NULL,
  `Age_Sal` int(11) DEFAULT NULL,
  `Tel_Sal` varchar(10) DEFAULT NULL,
  `Mail_Sal` varchar(128) DEFAULT NULL,
  `Login_Util` varchar(32) NOT NULL,
  `Pass_Util` varchar(128) NOT NULL,
  PRIMARY KEY (`id_Util_Herite_Util`),
  KEY `FK_Salarie_Ent_Cliente` (`id_Util`),
  KEY `FK_Salarie_Adresse_Pro` (`id_Adresse`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `salarie`
--

INSERT INTO `salarie` (`id_Util_Herite_Util`, `id_Util`, `id_Adresse`, `Nom_Sal`, `Prenom_Sal`, `Sexe_Sal`, `Age_Sal`, `Tel_Sal`, `Mail_Sal`, `Login_Util`, `Pass_Util`) VALUES
(31, 21, 21, 'Brasseur', 'Iva', 'Femme', 33, '0675723734', 'iva.brasseur@icloud.com', 'salarie1', 'salarie1'),
(32, 22, 23, 'Bonami', 'Mathilde', 'Femme', 21, '0687540249', 'bonamim@gmail.com', 'salarie2', 'salarie2'),
(33, 23, 22, 'Brian', 'Sébastien', 'Homme', 57, '0667253792', 'brian.sebastien@wanadoo.com', 'salarie3', 'salarie3');

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

CREATE TABLE IF NOT EXISTS `service` (
  `id_Service` int(11) NOT NULL AUTO_INCREMENT,
  `Code_Type_Service` int(11) NOT NULL,
  `id_Util` int(11) NOT NULL,
  `Lib_Service` varchar(128) NOT NULL,
  `Tarif_Service` decimal(13,2) NOT NULL,
  `Desc_Service` text,
  PRIMARY KEY (`id_Service`),
  KEY `FK_Service_Presta` (`id_Util`),
  KEY `FK_Service_Type_Service` (`Code_Type_Service`)
) ENGINE=MyISAM AUTO_INCREMENT=434 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `service`
--

INSERT INTO `service` (`id_Service`, `Code_Type_Service`, `id_Util`, `Lib_Service`, `Tarif_Service`, `Desc_Service`) VALUES
(411, 1, 41, 'Babysitting', '40.00', 'Garde d\'enfant à domicile, quelque soit l\'adresse'),
(412, 2, 41, 'Tous travaux', '50.00', 'Tous types de travaux, prestataire polyvalent'),
(424, 4, 42, 'Courses Grandes Surfaces', '20.00', 'Courses alimentaires ou autres'),
(425, 5, 42, 'Cuisine', '80.00', 'Cuisinier à votre disposition pour une soirée'),
(432, 2, 43, 'Plomberie', '0.00', 'Plomberie, prix variable selon les circonstances'),
(433, 3, 43, 'Réparation Automobile', '500.00', 'Vidange et entretien du véhicule');

-- --------------------------------------------------------

--
-- Structure de la table `type_facture`
--

CREATE TABLE IF NOT EXISTS `type_facture` (
  `Code_Type_Facture` int(11) NOT NULL,
  `Lib_Type_Facture` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`Code_Type_Facture`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `type_facture`
--

INSERT INTO `type_facture` (`Code_Type_Facture`, `Lib_Type_Facture`) VALUES
(1, 'Facture Abonnement'),
(2, 'Facture Service');

-- --------------------------------------------------------

--
-- Structure de la table `type_service`
--

CREATE TABLE IF NOT EXISTS `type_service` (
  `Code_Type_Service` int(11) NOT NULL AUTO_INCREMENT,
  `Lib_Type_Service` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`Code_Type_Service`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `type_service`
--

INSERT INTO `type_service` (`Code_Type_Service`, `Lib_Type_Service`) VALUES
(1, 'Garde d\'enfants'),
(2, 'Artisanat'),
(3, 'Automobile'),
(4, 'Courses'),
(5, 'Alimentation');

-- --------------------------------------------------------

--
-- Structure de la table `type_util`
--

CREATE TABLE IF NOT EXISTS `type_util` (
  `Code_Type_Util` int(11) NOT NULL,
  `Lib_Type_Util` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`Code_Type_Util`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `type_util`
--

INSERT INTO `type_util` (`Code_Type_Util`, `Lib_Type_Util`) VALUES
(1, 'Administrateur'),
(2, 'Entreprise Cliente'),
(3, 'Salarié'),
(4, 'Prestataire');

-- --------------------------------------------------------

--
-- Structure de la table `util`
--

CREATE TABLE IF NOT EXISTS `util` (
  `id_Util` int(11) NOT NULL AUTO_INCREMENT,
  `Code_Etat_Connexion` int(11) NOT NULL,
  `Code_Type_Util` int(11) NOT NULL,
  `Login_Util` varchar(32) NOT NULL,
  `Pass_Util` varchar(128) NOT NULL,
  PRIMARY KEY (`id_Util`),
  KEY `FK_Util_Etat_Co` (`Code_Etat_Connexion`),
  KEY `FK_Util_Type_Util` (`Code_Type_Util`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `util`
--

INSERT INTO `util` (`id_Util`, `Code_Etat_Connexion`, `Code_Type_Util`, `Login_Util`, `Pass_Util`) VALUES
(11, 1, 1, 'admin1', 'admin1'),
(12, 1, 1, 'admin2', 'admin2'),
(13, 1, 1, 'admin3', 'admin3'),
(21, 1, 2, 'entreprise1', 'entreprise1'),
(22, 1, 2, 'entreprise2', 'entreprise2'),
(23, 1, 2, 'entreprise3', 'entreprise3'),
(31, 1, 3, 'salarie1', 'salarie1'),
(32, 1, 3, 'salarie2', 'salarie2'),
(33, 1, 3, 'salarie3', 'salarie3'),
(41, 1, 4, 'prestataire1', 'prestataire1'),
(42, 1, 4, 'prestataire2', 'prestataire2'),
(43, 1, 4, 'prestataire3', 'prestataire3');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

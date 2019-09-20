-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le :  jeu. 19 sep. 2019 à 17:13
-- Version du serveur :  10.3.14-MariaDB
-- Version de PHP :  7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projet_cv`
--

-- --------------------------------------------------------

--
-- Structure de la table `competences`
--

DROP TABLE IF EXISTS `competences`;
CREATE TABLE IF NOT EXISTS `competences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `technos` varchar(56) NOT NULL,
  `pourcentage` int(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `competences`
--

INSERT INTO `competences` (`id`, `technos`, `pourcentage`) VALUES
(1, 'HTML 5 / CSS 3', 70),
(2, 'JavaScript', 50),
(3, 'PHP', 50),
(4, 'MySQL', 50),
(5, 'Bootstrap', 60),
(6, 'WordPress', 60),
(7, 'Symfony', 50),
(8, 'MVC', 50),
(9, 'POO', 50),
(10, 'GIT', 50);

-- --------------------------------------------------------

--
-- Structure de la table `experiences`
--

DROP TABLE IF EXISTS `experiences`;
CREATE TABLE IF NOT EXISTS `experiences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domaine` varchar(56) NOT NULL,
  `poste` varchar(128) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `employeur` varchar(128) NOT NULL,
  `ville` varchar(56) NOT NULL,
  `description` text NOT NULL,
  `logo` varchar(32) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Déchargement des données de la table `experiences`
--

INSERT INTO `experiences` (`id`, `domaine`, `poste`, `date_debut`, `date_fin`, `employeur`, `ville`, `description`, `logo`) VALUES
(1, 'social', 'Éducatrice spécialisée', '2008-01-14', '2008-04-15', 'La Vie Active', 'Bruay La Buissière', 'Accompagnement d\'enfants et adolescents présentant un handicap mental ou des troubles psychiques en accueil de jour.\r\n\r\nOrganisation d\'activités adaptées.\r\n\r\nSensibilisation aux arts visuels.', 'LaVieActive.png'),
(2, 'social', 'Éducatrice spécialisée', '2008-04-21', '2009-09-08', 'ASRL Foyer Notre Dame', 'Aubry Du Hainaut', 'Accompagnement de personnes adultes handicapées mentales et personnes handicapées mentales vieillissantes.\r\n\r\nGestion de la vie quotidienne\r\n\r\nOrganisation d\'activités adaptées\r\n\r\nCoordination d\'équipe et d\'unité (10 encadrantes, 30 résidentes)', 'ASRL.svg'),
(3, 'social', 'Éducatrice spécialisée', '2009-10-29', '2010-06-09', 'APEI du Valenciennois', 'Anzin', 'Accompagnement de personnes adultes handicapées mentales et personnes handicapées mentales vieillissantes en accueil de jour ou en hébergement (selon les structures)\r\n\r\nGestion de la vie quotidienne\r\n\r\nOrganisation d\'activités adaptées', 'APEI.jpg'),
(4, 'social', 'Éducatrice spécialisée', '2010-06-10', '2011-09-05', 'APAJH Nord (Résidence Pierre Mailliet)', 'Le Quesnoy', 'Accompagnement de personnes adultes handicapées mentales et/ou physiques.\r\n\r\nGestion de la vie quotidienne\r\n\r\nOrganisation d\'activités adaptées\r\n\r\nCoordination d\'équipe et d\'unité (5 encadrantes, 10 résidents)', 'APAJH.jpg'),
(5, 'RH', 'Assistante paie en contrat de professionnalisation', '2012-09-03', '2013-08-31', 'Transpole', 'Marcq En Baroeul', 'Support pour la gestion de la paie et de l\'administration du personnel\r\n\r\nGestion en autonomie des accidents du travail (déclaration, attestations, suivi des IJSS, ...).', 'Transpole.png'),
(6, 'RH', 'Gestionnaire administrative du personnel', '2013-09-02', '2013-11-29', 'ADP GSI', 'Wasquehal', 'Gestion administrative en externalisation (attestations diverses, gestion des visites médicales, contrats et avenants, ...)', 'ADP.png'),
(7, 'RH', 'Gestionnaire de comptes', '2014-01-13', '2015-05-29', 'Adecco', 'Villeneuve d\'Ascq', 'Gestion des paies intérimaires et de la facturation clients d\'une agence généraliste (multi conventions)', 'Adecco.png'),
(8, 'RH', 'Assistante paie', '2015-06-01', '2015-10-31', 'Verywear', 'Wasquehal', 'Gestion des contrats et attestations diverses\r\n\r\nMise en place de la DSN phase 2\r\n\r\nGestion des paies', 'Verywear.png'),
(9, 'RH', 'Gestionnaire paie et administration du personnel', '2015-12-15', '2016-03-17', 'Ergalis', 'Marcq En Baroeul', 'Gestion de la paie et de l\'administration du personnel de l\'embauche à la sortie', 'Ergalis.png'),
(10, 'RH', 'Gestionnaire paie et administration du personnel', '2016-03-18', '2019-04-05', 'Yusen Logistics', 'Petite-Fôret', 'Gestion de la paie et de l\'administration du personnel de l\'embauche à la sortie', 'Yusen.jpg'),
(11, 'informatique', 'Développeuse Symfony (stage)', '2019-09-17', '2020-03-20', 'Groupe NAT', 'Seclin', 'Participer à la définition de certains modules quant aux choix techniques, méthodes à utiliser.\r\n\r\nRédiger certaines spécifications\r\n\r\nRéaliser le codage de parties spécifiques de certains programmes.\r\n\r\nS\'assurer de la qualité du code grâce à des outils d\'analyse.\r\n\r\nParticiper à la Veille technologique et de sécurité des systèmes d’information.', 'NAT.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `formations`
--

DROP TABLE IF EXISTS `formations`;
CREATE TABLE IF NOT EXISTS `formations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ecole` varchar(128) NOT NULL,
  `lieu` varchar(32) NOT NULL,
  `diplome` varchar(128) NOT NULL,
  `niveau` varchar(8) NOT NULL,
  `annee_obtention` int(4) UNSIGNED NOT NULL,
  `logo` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `formations`
--

INSERT INTO `formations` (`id`, `ecole`, `lieu`, `diplome`, `niveau`, `annee_obtention`, `logo`) VALUES
(1, 'Haute Ecole Louvain en Hainaut (HELHa)', 'Gosselies (Belgique)', 'Bachelier éducateur spécialisé en accompagnement psycho éducatif', 'Bac +3', 2007, 'HELHa.jpg'),
(2, 'IUT A', 'Villeneuve d\'Ascq', 'Licence professionnelle management des organisations spécialité collaborateur social et paie', 'Bac +3', 2013, 'IUT.jpg'),
(3, '3W academy', 'Live', 'Diplôme de développeur intégrateur en réalisation d\'applications web', 'Bac +2', 2019, '3wa.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(256) NOT NULL,
  `mail` varchar(256) NOT NULL,
  `message` text NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Déchargement des données de la table `messages`
--

INSERT INTO `messages` (`id`, `nom`, `mail`, `message`, `date`) VALUES
(1, 'Laura QUATANNENS', 'lauraquat2@gmail.com', '65489', '2019-09-13 13:55:37'),
(2, 'Laura QUATANNENS', 'lauraquat2@gmail.com', '65', '2019-09-13 13:58:00'),
(3, 'Laura QUATANNENS', 'lauraquat2@gmail.com', '84', '2019-09-13 13:59:23'),
(4, 'Laura QUATANNENS', 'lauraquat2@gmail.com', '56', '2019-09-13 14:22:01'),
(5, 'Laura QUATANNENS', 'lauraquat2@gmail.com', '956', '2019-09-13 14:22:56'),
(6, 'Laura QUATANNENS', 'lauraquat2@gmail.com', '84', '2019-09-13 14:24:16'),
(7, 'Laura QUATANNENS', 'lauraquat2@gmail.com', 'gffg', '2019-09-13 17:54:37'),
(8, 'fh', 'lauraquat2@gmail.com', 'vh', '2019-09-13 17:54:55'),
(9, 'Laura QUATANNENS', 'lauraquat2@gmail.com', 'dhggh', '2019-09-13 18:07:46'),
(10, 'Laura QUATANNENS', 'lauraquat2@gmail.com', 'ghj', '2019-09-19 19:09:13');

-- --------------------------------------------------------

--
-- Structure de la table `projets`
--

DROP TABLE IF EXISTS `projets`;
CREATE TABLE IF NOT EXISTS `projets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(56) NOT NULL,
  `logo` varchar(256) NOT NULL,
  `lien` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Déchargement des données de la table `projets`
--

INSERT INTO `projets` (`id`, `titre`, `logo`, `lien`) VALUES
(1, 'Sliders, les mondes parallèles', 'sliders.jpg', 'https://lauraquat.sites.3wa.io/developpement/js/sliders/exo/index.html'),
(2, 'Wolf Gang', 'WolfGang.svg', 'https://lauraquat.sites.3wa.io/integration/M09_slider_et_video/index.html');

-- --------------------------------------------------------

--
-- Structure de la table `qualites`
--

DROP TABLE IF EXISTS `qualites`;
CREATE TABLE IF NOT EXISTS `qualites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qualite` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `qualites`
--

INSERT INTO `qualites` (`id`, `qualite`) VALUES
(1, 'Travail d\'équipe'),
(2, 'Gestion d\'équipe'),
(3, 'Esprit d\'analyse'),
(4, 'Sens de l\'observation'),
(5, 'Sens de l\'organisation'),
(6, 'Rigueur'),
(7, 'Conscience professionnelle'),
(8, 'Motivation'),
(9, 'Investissement'),
(10, 'Sens des responsabilités'),
(11, 'Sens de l\'écoute'),
(12, 'Sens de la méthode');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

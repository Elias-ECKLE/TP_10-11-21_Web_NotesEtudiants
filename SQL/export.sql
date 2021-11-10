-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 10 nov. 2021 à 08:36
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
-- Base de données : `systemeintranet_v2`
--

-- --------------------------------------------------------

--
-- Structure de la table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
                                        `idCourse` int(11) NOT NULL AUTO_INCREMENT,
                                        `labelCourse` varchar(40) COLLATE latin1_general_cs NOT NULL,
                                        PRIMARY KEY (`idCourse`),
                                        UNIQUE KEY `labelCourse_Unique` (`labelCourse`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs COMMENT='Attributs user';

--
-- Déchargement des données de la table `course`
--

INSERT INTO `course` (`idCourse`, `labelCourse`) VALUES
                                                     (4, 'application mobile'),
                                                     (3, 'game design'),
                                                     (1, 'programmation'),
                                                     (2, 'web');

-- --------------------------------------------------------

--
-- Structure de la table `group`
--

DROP TABLE IF EXISTS `group`;
CREATE TABLE IF NOT EXISTS `group` (
                                       `idGroup` int(11) NOT NULL AUTO_INCREMENT,
                                       `labelGroup` varchar(30) COLLATE latin1_general_cs NOT NULL,
                                       PRIMARY KEY (`idGroup`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs COMMENT='Attributs group';

--
-- Déchargement des données de la table `group`
--

INSERT INTO `group` (`idGroup`, `labelGroup`) VALUES
                                                  (1, 'F1'),
                                                  (2, 'F2'),
                                                  (3, 'Bachelor'),
                                                  (4, 'M1'),
                                                  (5, 'M2');

-- --------------------------------------------------------

--
-- Structure de la table `notes`
--

DROP TABLE IF EXISTS `notes`;
CREATE TABLE IF NOT EXISTS `notes` (
                                       `idNote` int(11) NOT NULL AUTO_INCREMENT,
                                       `valueNote` int(11) NOT NULL,
                                       `subjectNote` varchar(50) COLLATE latin1_general_cs NOT NULL,
                                       `coeffNote` int(11) NOT NULL,
                                       `idUser` int(11) NOT NULL,
                                       `idCourse` int(11) NOT NULL,
                                       PRIMARY KEY (`idNote`),
                                       KEY `idUser` (`idUser`),
                                       KEY `idCourse` (`idCourse`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs COMMENT='Attributs notes';

--
-- Déchargement des données de la table `notes`
--

INSERT INTO `notes` (`idNote`, `valueNote`, `subjectNote`, `coeffNote`, `idUser`, `idCourse`) VALUES
                                                                                                  (1, 11, 'casse-brique', 1, 1, 1),
                                                                                                  (2, 17, 'casse-brique', 1, 2, 1),
                                                                                                  (3, 13, 'casse-brique', 1, 3, 1),
                                                                                                  (4, 14, 'casse-brique', 1, 4, 1),
                                                                                                  (5, 12, 'casse-brique', 1, 5, 1),
                                                                                                  (6, 18, 'casse-brique', 1, 6, 1),
                                                                                                  (7, 13, 'casse-brique', 1, 7, 1),
                                                                                                  (8, 9, 'pong', 2, 1, 1),
                                                                                                  (9, 9, 'pong', 2, 2, 1),
                                                                                                  (10, 20, 'pong', 2, 3, 1),
                                                                                                  (11, 12, 'pong', 2, 4, 1),
                                                                                                  (12, 19, 'pong', 2, 5, 1),
                                                                                                  (13, 18, 'pong', 2, 6, 1),
                                                                                                  (14, 12, 'pong', 2, 7, 1),
                                                                                                  (15, 9, 'pong', 2, 8, 1),
                                                                                                  (16, 7, 'pong', 2, 9, 1),
                                                                                                  (17, 1, 'Framework SDL2', 3, 1, 1),
                                                                                                  (18, 13, 'Framework SDL2', 3, 2, 1),
                                                                                                  (19, 20, 'Framework SDL2', 3, 3, 1),
                                                                                                  (20, 1, 'Framework SDL2', 3, 4, 1),
                                                                                                  (21, 4, 'Framework SDL2', 3, 5, 1),
                                                                                                  (22, 18, 'Framework SDL2', 3, 6, 1),
                                                                                                  (23, 17, 'Framework SDL2', 3, 7, 1),
                                                                                                  (24, 12, 'Framework SDL2', 3, 8, 1),
                                                                                                  (25, 9, 'Framework SDL2', 3, 9, 1),
                                                                                                  (26, 8, 'Les files en C++', 1, 1, 1),
                                                                                                  (27, 3, 'Les files en C++', 1, 2, 1),
                                                                                                  (28, 8, 'Les files en C++', 1, 3, 1),
                                                                                                  (29, 11, 'Les files en C++', 1, 4, 1),
                                                                                                  (30, 10, 'Les files en C++', 1, 5, 1),
                                                                                                  (31, 17, 'Les files en C++', 1, 6, 1),
                                                                                                  (32, 18, 'Les files en C++', 1, 7, 1),
                                                                                                  (33, 17, 'Les files en C++', 1, 8, 1),
                                                                                                  (34, 10, 'Les files en C++', 1, 9, 1),
                                                                                                  (35, 15, 'Unreal Blueprints', 1, 1, 1),
                                                                                                  (36, 2, 'Unreal Blueprints', 1, 2, 1),
                                                                                                  (37, 4, 'Unreal Blueprints', 1, 3, 1),
                                                                                                  (38, 15, 'Unreal Blueprints', 1, 4, 1),
                                                                                                  (39, 1, 'Unreal Blueprints', 1, 5, 1),
                                                                                                  (40, 1, 'Unreal Blueprints', 1, 6, 1),
                                                                                                  (41, 2, 'Unreal Blueprints', 1, 7, 1),
                                                                                                  (42, 8, 'Unreal Blueprints', 1, 8, 1),
                                                                                                  (43, 15, 'Unreal Blueprints', 1, 9, 1),
                                                                                                  (44, 14, 'Ten Pager', 1, 1, 3),
                                                                                                  (45, 5, 'Ten Pager', 1, 2, 3),
                                                                                                  (46, 4, 'Ten Pager', 1, 3, 3),
                                                                                                  (47, 6, 'Ten Pager', 1, 4, 3),
                                                                                                  (48, 16, 'Ten Pager', 1, 5, 3),
                                                                                                  (49, 5, 'Ten Pager', 1, 6, 3),
                                                                                                  (50, 15, 'Ten Pager', 1, 7, 3),
                                                                                                  (51, 1, 'Ten Pager', 1, 8, 3),
                                                                                                  (52, 2, 'Ten Pager', 1, 9, 3),
                                                                                                  (53, 0, 'Level Design Unity', 1, 1, 3),
                                                                                                  (54, 12, 'Level Design Unity', 1, 2, 3),
                                                                                                  (55, 18, 'Level Design Unity', 1, 3, 3),
                                                                                                  (56, 17, 'Level Design Unity', 1, 4, 3),
                                                                                                  (57, 10, 'Level Design Unity', 1, 5, 3),
                                                                                                  (58, 18, 'Level Design Unity', 1, 6, 3),
                                                                                                  (59, 2, 'Level Design Unity', 1, 7, 3),
                                                                                                  (60, 16, 'Level Design Unity', 1, 8, 3),
                                                                                                  (61, 13, 'Level Design Unity', 1, 9, 3),
                                                                                                  (62, 11, 'Game Design Document', 2, 1, 3),
                                                                                                  (63, 5, 'Game Design Document', 2, 2, 3),
                                                                                                  (64, 10, 'Game Design Document', 2, 3, 3),
                                                                                                  (65, 14, 'Game Design Document', 2, 4, 3),
                                                                                                  (66, 3, 'Game Design Document', 2, 5, 3),
                                                                                                  (67, 10, 'Game Design Document', 2, 6, 3),
                                                                                                  (68, 3, 'Game Design Document', 2, 7, 3),
                                                                                                  (69, 5, 'Game Design Document', 2, 8, 3),
                                                                                                  (70, 15, 'Game Design Document', 2, 9, 3),
                                                                                                  (71, 19, 'Intranet Ludus', 2, 1, 2),
                                                                                                  (72, 2, 'Intranet Ludus', 2, 2, 2),
                                                                                                  (73, 12, 'Intranet Ludus', 2, 3, 2),
                                                                                                  (74, 15, 'Intranet Ludus', 2, 4, 2),
                                                                                                  (75, 0, 'Intranet Ludus', 2, 5, 2),
                                                                                                  (76, 16, 'Intranet Ludus', 2, 6, 2),
                                                                                                  (77, 20, 'Intranet Ludus', 2, 7, 2),
                                                                                                  (78, 11, 'Intranet Ludus', 2, 8, 2),
                                                                                                  (79, 14, 'Intranet Ludus', 2, 9, 2),
                                                                                                  (80, 4, 'Les bases du developpement web', 1, 1, 2),
                                                                                                  (81, 4, 'Les bases du developpement web', 1, 2, 2),
                                                                                                  (82, 9, 'Les bases du developpement web', 1, 3, 2),
                                                                                                  (83, 14, 'Les bases du developpement web', 1, 4, 2),
                                                                                                  (84, 2, 'Les bases du developpement web', 1, 5, 2),
                                                                                                  (85, 6, 'Les bases du developpement web', 1, 6, 2),
                                                                                                  (86, 4, 'Les bases du developpement web', 1, 7, 2),
                                                                                                  (87, 2, 'Les bases du developpement web', 1, 8, 2),
                                                                                                  (88, 0, 'Les bases du developpement web', 1, 9, 2),
                                                                                                  (89, 14, 'Les requêtes SQL_BOM', 1, 1, 2),
                                                                                                  (90, 18, 'Les requêtes SQL_BOM', 1, 2, 2),
                                                                                                  (91, 4, 'Les requêtes SQL_BOM', 1, 3, 2),
                                                                                                  (92, 10, 'Les requêtes SQL_BOM', 1, 4, 2),
                                                                                                  (93, 16, 'Les requêtes SQL_BOM', 1, 5, 2),
                                                                                                  (94, 8, 'Les requêtes SQL_BOM', 1, 6, 2),
                                                                                                  (95, 15, 'Les requêtes SQL_BOM', 1, 7, 2),
                                                                                                  (96, 12, 'Les requêtes SQL_BOM', 1, 8, 2),
                                                                                                  (97, 11, 'Les requêtes SQL_BOM', 1, 9, 2),
                                                                                                  (98, 9, 'Connection app mobile et BDD', 1, 1, 4),
                                                                                                  (99, 3, 'Connection app mobile et BDD', 1, 2, 4),
                                                                                                  (100, 10, 'Connection app mobile et BDD', 1, 3, 4),
                                                                                                  (101, 19, 'Connection app mobile et BDD', 1, 4, 4),
                                                                                                  (102, 5, 'Connection app mobile et BDD', 1, 5, 4),
                                                                                                  (103, 9, 'Connection app mobile et BDD', 1, 6, 4),
                                                                                                  (104, 9, 'Connection app mobile et BDD', 1, 7, 4),
                                                                                                  (105, 1, 'Connection app mobile et BDD', 1, 8, 4),
                                                                                                  (106, 15, 'Connection app mobile et BDD', 1, 9, 4),
                                                                                                  (107, 12, 'hab tracker app', 2, 1, 4),
                                                                                                  (108, 18, 'hab tracker app', 2, 2, 4),
                                                                                                  (109, 14, 'hab tracker app', 2, 3, 4),
                                                                                                  (110, 16, 'hab tracker app', 2, 4, 4),
                                                                                                  (111, 20, 'hab tracker app', 2, 5, 4),
                                                                                                  (112, 10, 'hab tracker app', 2, 6, 4),
                                                                                                  (113, 8, 'hab tracker app', 2, 7, 4),
                                                                                                  (114, 12, 'hab tracker app', 2, 8, 4),
                                                                                                  (115, 17, 'hab tracker app', 2, 9, 4);

-- --------------------------------------------------------

--
-- Structure de la table `state`
--

DROP TABLE IF EXISTS `state`;
CREATE TABLE IF NOT EXISTS `state` (
                                       `idState` int(11) NOT NULL AUTO_INCREMENT,
                                       `labelState` varchar(30) COLLATE latin1_general_cs NOT NULL,
                                       PRIMARY KEY (`idState`),
                                       UNIQUE KEY `labelState_Unique` (`labelState`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs COMMENT='Attributs state';

--
-- Déchargement des données de la table `state`
--

INSERT INTO `state` (`idState`, `labelState`) VALUES
                                                  (1, 'etudiant'),
                                                  (2, 'prof');

-- --------------------------------------------------------

--
-- Structure de la table `studies`
--

DROP TABLE IF EXISTS `studies`;
CREATE TABLE IF NOT EXISTS `studies` (
                                         `idUser` int(11) NOT NULL,
                                         `idCourse` int(11) NOT NULL,
                                         PRIMARY KEY (`idUser`,`idCourse`),
                                         KEY `idCourse` (`idCourse`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs COMMENT='Attributs group';

--
-- Déchargement des données de la table `studies`
--

INSERT INTO `studies` (`idUser`, `idCourse`) VALUES
                                                 (11, 1),
                                                 (10, 2),
                                                 (12, 3),
                                                 (10, 4);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
                                      `idUser` int(11) NOT NULL AUTO_INCREMENT,
                                      `firstName` varchar(50) COLLATE latin1_general_cs NOT NULL,
                                      `lastName` varchar(50) COLLATE latin1_general_cs NOT NULL,
                                      `email` varchar(50) COLLATE latin1_general_cs NOT NULL,
                                      `psswd` int(4) NOT NULL,
                                      `idState` int(11) NOT NULL,
                                      `idGroup` int(11) DEFAULT NULL,
                                      `birtdayDate` date NOT NULL DEFAULT '1990-01-01',
                                      PRIMARY KEY (`idUser`),
                                      UNIQUE KEY `email_unique` (`email`) USING BTREE,
                                      KEY `ref_idState` (`idState`) USING BTREE,
                                      KEY `ref_idGroup` (`idGroup`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs COMMENT='Attributs user';

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`idUser`, `firstName`, `lastName`, `email`, `psswd`, `idState`, `idGroup`, `birtdayDate`) VALUES
                                                                                                                  (1, 'Elias', 'ECKLE', 'e.eckle@ludus-academie.com', 1807, 1, 3, '2001-07-18'),
                                                                                                                  (2, 'Alexandre', 'BOHNERT', 'a.bohnert@ludus-academie.com', 2223, 1, 3, '1998-11-07'),
                                                                                                                  (3, 'Alae', 'CHOURY', 'a.choury@ludus-academie.com', 2221, 1, 3, '1995-09-16'),
                                                                                                                  (4, 'Hugo', 'EITEL', 'h.eitel@ludus-academie.com', 3456, 1, 3, '2001-05-28'),
                                                                                                                  (5, 'Jeffrey', 'ZUMKIR', 'j.zumkir@ludus-academie.com', 5544, 1, 3, '2000-08-10'),
                                                                                                                  (6, 'Marine', 'SCHWARTZ', 'm.schwartz@ludus-academie.com', 9261, 1, 3, '1994-05-12'),
                                                                                                                  (7, 'Quentin', 'KUNZ', 'q.kunz@ludus-academie.com', 2345, 1, 3, '1998-12-03'),
                                                                                                                  (8, 'Stephane', 'WILHEIM', 's.wilheim@ludus-academie.com', 1165, 1, 3, '1993-11-04'),
                                                                                                                  (9, 'Baptiste', 'RIFF', 'b.riff@ludus-academie.com', 1111, 1, 3, '2000-08-08'),
                                                                                                                  (10, 'Grâce', 'MADEMBO', 'g.madembo@ludus-academie.com', 1343, 2, NULL, '1900-01-01'),
                                                                                                                  (11, 'Nicolas', 'LEHMANN', 'n.lehmann@ludus-academie.com', 1165, 2, NULL, '1984-03-24'),
                                                                                                                  (12, 'Nicolas', 'VALENTIN', 'n.valentin@ludus-academie.com', 6666, 2, NULL, '1996-12-29');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `notes`
--
ALTER TABLE `notes`
    ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`),
    ADD CONSTRAINT `notes_ibfk_2` FOREIGN KEY (`idCourse`) REFERENCES `course` (`idCourse`);

--
-- Contraintes pour la table `studies`
--
ALTER TABLE `studies`
    ADD CONSTRAINT `studies_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`),
    ADD CONSTRAINT `studies_ibfk_2` FOREIGN KEY (`idCourse`) REFERENCES `course` (`idCourse`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
    ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`idState`) REFERENCES `state` (`idState`),
    ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`idGroup`) REFERENCES `group` (`idGroup`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

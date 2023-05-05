-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 05 mai 2023 à 08:39
-- Version du serveur : 5.7.36
-- Version de PHP : 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `symfony_yourbook`
--

-- --------------------------------------------------------

--
-- Structure de la table `adherent`
--

DROP TABLE IF EXISTS `adherent`;
CREATE TABLE IF NOT EXISTS `adherent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `caution` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `adherent`
--

INSERT INTO `adherent` (`id`, `nom`, `prenom`, `telephone`, `email`, `caution`) VALUES
(1, 'John', 'Doe', '123456789', 'john@doe.com', 1),
(2, 'Jane', 'Spencer', '0123456780', 'jane@spencer.com', 1);

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_880E0D76E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id`, `email`, `roles`, `password`) VALUES
(1, 'admin@test.com', '[\"ROLE_ADMIN\"]', '$2y$13$JVDdlEa3ZXX6sjDJFDqXMeCEKPlnSN4HUDj/MaRzSsz51aGcdRWNC'),
(3, 'test@test.com', '[\"ROLE_ADMIN\"]', '$2y$13$odEgAvQ5Lnomy0deNeDRjew.xduo5XolYemySQGowS2qWFS16MEH2');

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

DROP TABLE IF EXISTS `auteur`;
CREATE TABLE IF NOT EXISTS `auteur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `auteur`
--

INSERT INTO `auteur` (`id`, `nom`, `prenom`) VALUES
(1, 'Orwell', 'George'),
(2, 'Rowling', 'J.K.');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230413175919', '2023-04-13 18:00:38', 115),
('DoctrineMigrations\\Version20230418173540', '2023-04-18 17:36:29', 279),
('DoctrineMigrations\\Version20230418174030', '2023-04-18 17:41:24', 168),
('DoctrineMigrations\\Version20230418174625', '2023-04-18 17:46:51', 217),
('DoctrineMigrations\\Version20230418175625', '2023-04-18 17:56:33', 133),
('DoctrineMigrations\\Version20230427171638', '2023-04-27 17:17:05', 119),
('DoctrineMigrations\\Version20230427175321', '2023-04-27 17:53:29', 142);

-- --------------------------------------------------------

--
-- Structure de la table `editeur`
--

DROP TABLE IF EXISTS `editeur`;
CREATE TABLE IF NOT EXISTS `editeur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `editeur`
--

INSERT INTO `editeur` (`id`, `nom`) VALUES
(1, 'Poche'),
(2, 'Gallimard');

-- --------------------------------------------------------

--
-- Structure de la table `emprunt`
--

DROP TABLE IF EXISTS `emprunt`;
CREATE TABLE IF NOT EXISTS `emprunt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adherent_id` int(11) NOT NULL,
  `exemplaire_id` int(11) NOT NULL,
  `date_emprunt` datetime NOT NULL,
  `date_retour` datetime DEFAULT NULL,
  `statut` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_364071D725F06C53` (`adherent_id`),
  KEY `IDX_364071D75843AA21` (`exemplaire_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `emprunt`
--

INSERT INTO `emprunt` (`id`, `adherent_id`, `exemplaire_id`, `date_emprunt`, `date_retour`, `statut`) VALUES
(1, 1, 1, '2023-04-13 19:54:00', '2023-04-21 19:55:00', 0);

-- --------------------------------------------------------

--
-- Structure de la table `exemplaire`
--

DROP TABLE IF EXISTS `exemplaire`;
CREATE TABLE IF NOT EXISTS `exemplaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usure_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `livre_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5EF83C921117BEE5` (`usure_id`),
  KEY `IDX_5EF83C92DCD6110` (`stock_id`),
  KEY `IDX_5EF83C9237D925CB` (`livre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `exemplaire`
--

INSERT INTO `exemplaire` (`id`, `usure_id`, `stock_id`, `livre_id`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 1),
(3, 1, 1, 3),
(4, 1, 3, 2),
(5, 2, 3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

DROP TABLE IF EXISTS `genre`;
CREATE TABLE IF NOT EXISTS `genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `genre`
--

INSERT INTO `genre` (`id`, `nom`) VALUES
(1, 'Policier'),
(2, 'Science-Fiction');

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

DROP TABLE IF EXISTS `livre`;
CREATE TABLE IF NOT EXISTS `livre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auteur_id` int(11) NOT NULL,
  `editeur_id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isbn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `archive` tinyint(1) NOT NULL,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_size` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_AC634F9960BB6FE6` (`auteur_id`),
  KEY `IDX_AC634F993375BD21` (`editeur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `livre`
--

INSERT INTO `livre` (`id`, `auteur_id`, `editeur_id`, `titre`, `isbn`, `description`, `archive`, `image_name`, `image_size`, `updated_at`) VALUES
(1, 1, 1, '1984', '9782070368228', 'L’histoire se déroule à Londres en 1984, comme l\'indique le titre du roman. Le monde, depuis les grandes guerres nucléaires des années 1950, est divisé en trois grands blocs géopolitiques : l’Océania (Amériques, îles de l\'Atlantique, comprenant notamment les îles Britanniques, Océanie et Afrique australe), l’Eurasia (reste de l\'Europe et URSS) et l’Estasia (Chine et ses contrées méridionales, îles du Japon, et une portion importante mais variable de la Mongolie, de la Mandchourie, de l\'Inde et du Tibet6) qui sont en guerre perpétuelle les uns contre les autres. Ces trois grandes puissances sont dirigées par différents régimes totalitaires revendiqués comme tels, et s\'appuyant sur des idéologies nommées différemment mais fondamentalement similaires : l’Angsoc (ou « socialisme anglais ») pour l\'Océania, le « néo-bolchévisme » pour l\'Eurasia et le « culte de la mort » (ou « oblitération du moi ») pour l\'Estasia. Tous ces partis sont présentés comme communistes avant leur montée au pouvoir, jusqu\'à ce qu\'ils deviennent des régimes totalitaires et relèguent les prolétaires qu\'ils prétendaient défendre au bas de la pyramide sociale. Les trois régimes sont présentés comme étant socialement, économiquement et idéologiquement sensiblement les mêmes.', 0, '1-1984-6453e5be9c08b914352100.jpg', 22919, '2023-05-04 17:05:00'),
(2, 2, 2, 'Harry Potter à l\'école des sorciers', '15454545454', 'L\'intrigue du premier roman débute durant l\'été 1991. Peu avant son onzième anniversaire, Harry reçoit une lettre l\'invitant à se présenter lors de la rentrée des classes à l\'école de sorcellerie de Poudlard5. Malgré les tentatives de son oncle et de sa tante pour l\'empêcher de s\'y rendre, Rubeus Hagrid, un « demi-géant » envoyé par le directeur de Poudlard, Albus Dumbledore5, va faire découvrir à Harry le monde des sorciers et l\'amener à se rendre à la gare de King\'s Cross de Londres, où il prendra le Poudlard Express qui le conduira jusqu\'à sa nouvelle école. Une fois à Poudlard, Harry apprend à maîtriser et utiliser les pouvoirs magiques qu\'il possède et se fait deux amis inséparables : Ronald Weasley et Hermione Granger10. Le trio tente d\'empêcher Voldemort de s\'emparer de la pierre philosophale de Nicolas Flamel, conservée sous bonne garde à Poudlard11', 0, NULL, NULL, NULL),
(3, 1, 2, '1984', '878745645646', 'test', 0, '1-1984-6453f27594b94991060005.jpg', 22919, '2023-05-04 17:59:17');

-- --------------------------------------------------------

--
-- Structure de la table `livre_genre`
--

DROP TABLE IF EXISTS `livre_genre`;
CREATE TABLE IF NOT EXISTS `livre_genre` (
  `livre_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`livre_id`,`genre_id`),
  KEY `IDX_1053AB9E37D925CB` (`livre_id`),
  KEY `IDX_1053AB9E4296D31F` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `livre_genre`
--

INSERT INTO `livre_genre` (`livre_id`, `genre_id`) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emplacement` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `stock`
--

INSERT INTO `stock` (`id`, `emplacement`) VALUES
(1, 'Etagère A - étage 1'),
(2, 'Etagère A - étage 2'),
(3, 'Etagère A - étage 3');

-- --------------------------------------------------------

--
-- Structure de la table `usure`
--

DROP TABLE IF EXISTS `usure`;
CREATE TABLE IF NOT EXISTS `usure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `usure`
--

INSERT INTO `usure` (`id`, `nom`) VALUES
(1, 'Neuf'),
(2, 'Très bon état'),
(3, 'Bon état');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `emprunt`
--
ALTER TABLE `emprunt`
  ADD CONSTRAINT `FK_364071D725F06C53` FOREIGN KEY (`adherent_id`) REFERENCES `adherent` (`id`),
  ADD CONSTRAINT `FK_364071D75843AA21` FOREIGN KEY (`exemplaire_id`) REFERENCES `exemplaire` (`id`);

--
-- Contraintes pour la table `exemplaire`
--
ALTER TABLE `exemplaire`
  ADD CONSTRAINT `FK_5EF83C921117BEE5` FOREIGN KEY (`usure_id`) REFERENCES `usure` (`id`),
  ADD CONSTRAINT `FK_5EF83C9237D925CB` FOREIGN KEY (`livre_id`) REFERENCES `livre` (`id`),
  ADD CONSTRAINT `FK_5EF83C92DCD6110` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`);

--
-- Contraintes pour la table `livre`
--
ALTER TABLE `livre`
  ADD CONSTRAINT `FK_AC634F993375BD21` FOREIGN KEY (`editeur_id`) REFERENCES `editeur` (`id`),
  ADD CONSTRAINT `FK_AC634F9960BB6FE6` FOREIGN KEY (`auteur_id`) REFERENCES `auteur` (`id`);

--
-- Contraintes pour la table `livre_genre`
--
ALTER TABLE `livre_genre`
  ADD CONSTRAINT `FK_1053AB9E37D925CB` FOREIGN KEY (`livre_id`) REFERENCES `livre` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1053AB9E4296D31F` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

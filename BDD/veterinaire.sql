-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 09, 2022 at 07:44 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `veterinaire`
--

-- --------------------------------------------------------

--
-- Table structure for table `animal`
--

CREATE TABLE `animal` (
  `ID` bigint UNSIGNED NOT NULL,
  `Nom` varchar(20) NOT NULL,
  `Age` int NOT NULL,
  `Date_naissance` date NOT NULL,
  `Race` varchar(50) NOT NULL,
  `Id_proprietaire` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `ID` bigint UNSIGNED NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Mot_de_Passe` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Telephone` int DEFAULT NULL,
  `Date_naissance` date DEFAULT NULL,
  `Adresse` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`ID`, `Nom`, `Prenom`, `Email`, `Mot_de_Passe`, `Telephone`, `Date_naissance`, `Adresse`) VALUES
(13, 'Doe', 'Jane', 'janedoe@gmail.com', 'dfsdfsd', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rendez-vous`
--

CREATE TABLE `rendez-vous` (
  `ID` int NOT NULL,
  `date_rdv` date NOT NULL,
  `adresse_rdv` varchar(50) NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `animal_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`),
  ADD KEY `FK_client` (`Id_proprietaire`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`),
  ADD UNIQUE KEY `unique_email` (`Email`);

--
-- Indexes for table `rendez-vous`
--
ALTER TABLE `rendez-vous`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_animal` (`animal_id`),
  ADD KEY `FK_client_rdv` (`client_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `animal`
--
ALTER TABLE `animal`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `rendez-vous`
--
ALTER TABLE `rendez-vous`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `FK_client` FOREIGN KEY (`Id_proprietaire`) REFERENCES `client` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `rendez-vous`
--
ALTER TABLE `rendez-vous`
  ADD CONSTRAINT `FK_animal` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_client_rdv` FOREIGN KEY (`client_id`) REFERENCES `client` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

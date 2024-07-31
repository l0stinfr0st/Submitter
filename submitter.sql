-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2024 at 03:30 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `submitter(emine)`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` varchar(10) NOT NULL,
  `volname` varchar(100) DEFAULT NULL,
  `volid` varchar(20) DEFAULT NULL,
  `title` varchar(500) NOT NULL,
  `bodyText` text NOT NULL,
  `correspAut` varchar(200) DEFAULT NULL,
  `submissionDate` date DEFAULT NULL,
  `result` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id`, `volname`, `volid`, `title`, `bodyText`, `correspAut`, `submissionDate`, `result`) VALUES
('1', 'Nature Neuroscience', 'April2024', 'Advances in Neuroscience', 'Advancement in neuroscience has continued...', 'ahmad.ghazi@gmail.com', '2024-03-01', 'Accept'),
('2', 'Science Advances', 'June2022', 'Quantum Computers and Future', 'The future of cyber security is...', 'ghaith.badriegh@gmail.com', '2022-05-15', 'Revision'),
('3', 'The Lancet', 'September2023', 'Modern Epidemiology', 'The new modern spin on Epdiemiology has...', 'omar.almahmoud@gmail.com', '2023-08-01', 'Reject'),
('4', 'Annual Review of Psychology', 'January2025', 'Psychology Today', 'Over the years Psychology has evolved...', 'abdulmalik.derak@gmail.com', '2024-12-01', 'Accept'),
('5', 'IEEE Transactions on Computers', 'October2024', 'AI and Machine Learning', 'Machine learning has changed the landscape...', 'walter.white@gmail.com', '2024-09-01', 'Revision');

-- --------------------------------------------------------

--
-- Table structure for table `articlekeywords`
--

CREATE TABLE `articlekeywords` (
  `email` varchar(200) NOT NULL,
  `aid` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `articlekeywords`
--

INSERT INTO `articlekeywords` (`email`, `aid`) VALUES
('abdulmalik.derak@gmail.com', '4'),
('abdulmalik.derak@gmail.com', '5'),
('ahmad.ghazi@gmail.com', '1'),
('ahmad.ghazi@gmail.com', '2'),
('ghaith.badriegh@gmail.com', '3'),
('ghaith.badriegh@gmail.com', '4'),
('omar.almahmoud@gmail.com', '2'),
('omar.almahmoud@gmail.com', '5'),
('walter.white@gmail.com', '1'),
('walter.white@gmail.com', '3');

-- --------------------------------------------------------

--
-- Table structure for table `articlereviews`
--

CREATE TABLE `articlereviews` (
  `id` varchar(10) NOT NULL,
  `email` varchar(200) NOT NULL,
  `scoreOfTheReviewer` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `articlereviews`
--

INSERT INTO `articlereviews` (`id`, `email`, `scoreOfTheReviewer`) VALUES
('1', 'ahmad.ghazi@gmail.com', 0.5),
('1', 'ghaith.badriegh@gmail.com', 1),
('2', 'abdulmalik.derak@gmail.com', 0),
('2', 'omar.almahmoud@gmail.com', 0.5),
('3', 'abdulmalik.derak@gmail.com', 0),
('3', 'walter.white@gmail.com', 1),
('4', 'omar.almahmoud@gmail.com', 0.5),
('4', 'walter.white@gmail.com', 1),
('5', 'ahmad.ghazi@gmail.com', 0.5),
('5', 'ghaith.badriegh@gmail.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `journal`
--

CREATE TABLE `journal` (
  `name` varchar(100) NOT NULL,
  `frequency` enum('monthly','bi-monthly','quarterly','semi-annual','annual') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `journal`
--

INSERT INTO `journal` (`name`, `frequency`) VALUES
('Annual Review of Psychology', 'semi-annual'),
('Cloud Computing Jornal', 'annual'),
('Expert Systems Journal', 'bi-monthly'),
('IEEE Transactions on Computers', 'annual'),
('Journal Of Artificial Intelligence', 'monthly'),
('Nature Neuroscience', 'bi-monthly'),
('Science Advances', 'monthly'),
('Software Engineering Jornal', 'quarterly'),
('Sustainability', 'semi-annual'),
('The Lancet', 'quarterly');

-- --------------------------------------------------------

--
-- Table structure for table `keywords`
--

CREATE TABLE `keywords` (
  `keywid` int(5) NOT NULL,
  `keyword` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `keywords`
--

INSERT INTO `keywords` (`keywid`, `keyword`) VALUES
(1, 'Cloud service providers (CSPs)'),
(2, 'Virtualization'),
(3, 'Epidemiology'),
(4, 'Cognitive Psychology'),
(5, 'Scalability'),
(6, 'Elasticity'),
(7, 'Infrastructure as a Service (IaaS)'),
(8, 'Platform as a Service (PaaS)'),
(9, 'Software as a Service (SaaS)'),
(10, 'Public cloud'),
(11, 'Private cloud'),
(12, 'Hybrid  cloud'),
(13, 'Multi-cloud'),
(14, 'Cloud migration'),
(15, 'Cloud security'),
(16, 'Data storage'),
(17, 'Cloud-native'),
(18, 'Containerization'),
(19, 'Microservices'),
(20, 'Serverless computing'),
(21, 'DevOps'),
(22, 'Automation'),
(23, 'Knowledge Base'),
(24, 'Inference Engine'),
(25, 'Rule-based System'),
(26, 'Knowledge Representation'),
(27, 'Decision Support'),
(28, 'Domain Expertise'),
(29, 'Knowledge Acquisition'),
(30, 'Expert System Shell'),
(31, 'Knowledge Engineering'),
(32, 'Forward Chaining'),
(33, 'Backward Chaining'),
(34, 'Expert System Development Tools'),
(35, 'Heuristic Reasoning'),
(36, 'Fuzzy Logic'),
(37, 'Case-based Reasoning'),
(38, 'Uncertainty Handling'),
(39, 'Explanation Facility'),
(40, 'Diagnostic Reasoning'),
(41, 'Knowledge-based Systems'),
(42, 'Machine Learning'),
(43, 'Deep Learning'),
(44, 'Neural Networks'),
(45, 'Natural Language Processing (NLP)'),
(46, 'Computer Vision'),
(47, 'Robotics'),
(48, 'Reinforcement Learning'),
(49, 'Data Mining'),
(50, 'Cognitive Computing'),
(51, 'Pattern Recognition'),
(52, 'Predictive Analytics'),
(53, 'Genetic Algorithms'),
(54, 'Swarm Intelligence'),
(55, 'Sentiment Analysis'),
(56, 'Speech Recognition'),
(57, 'Virtual Assistants'),
(58, 'Autonomous Vehicles'),
(59, 'Ethics in AI'),
(60, 'Agile Development'),
(61, 'Waterfall Model'),
(62, 'Scrum'),
(63, 'Kanban'),
(64, 'Software Development Life Cycle (SDLC)'),
(65, 'Requirements Engineering'),
(66, 'Design Patterns'),
(67, 'Object-Oriented Programming (OOP)'),
(68, 'Test-Driven Development (TDD)'),
(69, 'Continuous Integration (CI)'),
(70, 'Continuous Deployment (CD)'),
(71, 'Version Control'),
(72, 'DevOps'),
(73, 'Quality Assurance (QA)'),
(74, 'Software Architecture'),
(75, 'Refactoring'),
(76, 'Code Review'),
(77, 'Software Maintenance'),
(78, 'Software Documentation'),
(79, 'Software Project Management'),
(80, 'Renewable energy'),
(81, 'Carbon footprint'),
(82, 'Climate change'),
(83, 'Eco-friendly'),
(84, 'Biodiversity'),
(85, 'Conservation'),
(86, 'Green technology'),
(87, 'Sustainable development'),
(88, 'Circular economy'),
(89, 'Waste management'),
(90, 'Energy efficiency'),
(91, 'Natural resources'),
(92, 'Water conservation'),
(93, 'Organic farming'),
(94, 'Corporate social responsibility'),
(95, 'Environmental stewardship'),
(96, 'Greenhouse gases'),
(97, 'Fair trade'),
(98, 'Pollution prevention'),
(99, 'Sustainable transportation');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `email` varchar(200) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `vname` varchar(100) NOT NULL,
  `vid` varchar(20) NOT NULL,
  `isAuthor` tinyint(1) DEFAULT NULL,
  `isEditor` tinyint(1) DEFAULT NULL,
  `isReviewer` tinyint(1) DEFAULT NULL,
  `password` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`email`, `name`, `vname`, `vid`, `isAuthor`, `isEditor`, `isReviewer`, `password`) VALUES
('abdulmalik.derak@gmail.com', 'Abdulmalik Derak', 'Annual Review of Psychology', 'January2025', 0, 1, 0, 5424231),
('ahmad.ghazi@gmail.com', 'Ahmad Ghazi', 'Nature Neuroscience', 'April2024', 1, 0, 0, 0),
('ghaith.badriegh@gmail.com', 'Ghaith Badreih', 'Science Advances', 'June2022', 0, 0, 1, 1343243),
('omar.almahmoud@gmail.com', 'Omar Almahmoud', 'The Lancet', 'September2023', 1, 0, 1, 54243),
('walter.white@gmail.com', 'Walter White', 'IEEE Transactions on Computers', 'October2024', 1, 0, 1, 3423);

-- --------------------------------------------------------

--
-- Table structure for table `personinterest`
--

CREATE TABLE `personinterest` (
  `email` varchar(200) NOT NULL,
  `keywid` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `personinterest`
--

INSERT INTO `personinterest` (`email`, `keywid`) VALUES
('abdulmalik.derak@gmail.com', 3),
('abdulmalik.derak@gmail.com', 4),
('ahmad.ghazi@gmail.com', 1),
('ahmad.ghazi@gmail.com', 5),
('ghaith.badriegh@gmail.com', 2),
('ghaith.badriegh@gmail.com', 4),
('omar.almahmoud@gmail.com', 2),
('omar.almahmoud@gmail.com', 3),
('walter.white@gmail.com', 1),
('walter.white@gmail.com', 5);

-- --------------------------------------------------------

--
-- Table structure for table `volume`
--

CREATE TABLE `volume` (
  `name` varchar(100) NOT NULL,
  `id` varchar(20) NOT NULL,
  `publicationDate` date DEFAULT NULL,
  `firstSubOpen` date DEFAULT NULL,
  `firstSubDeadline` date DEFAULT NULL,
  `reviewStarts` date DEFAULT NULL,
  `reviewDeadline` date DEFAULT NULL,
  `resultsAnnouncement` date DEFAULT NULL,
  `secondSubOpen` date DEFAULT NULL,
  `secondSubDeadline` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `volume`
--

INSERT INTO `volume` (`name`, `id`, `publicationDate`, `firstSubOpen`, `firstSubDeadline`, `reviewStarts`, `reviewDeadline`, `resultsAnnouncement`, `secondSubOpen`, `secondSubDeadline`) VALUES
('Annual Review of Psychology', 'January2025', '2024-11-01', '2024-11-15', NULL, NULL, '2025-01-01', NULL, NULL, NULL),
('Cloud Computing Jornal', 'January2022', '2022-01-03', '2021-04-01', '2021-05-15', '2021-05-16', '2021-05-31', '2021-06-21', '2021-06-30', '2021-07-31'),
('Cloud Computing Jornal', 'January2023', '2022-01-03', '2022-04-01', '2022-05-15', '2022-05-16', '2022-05-31', '2022-06-21', '2022-06-30', '2022-07-31'),
('Cloud Computing Jornal', 'January2024', '2023-01-03', '2023-04-01', '2023-05-15', '2023-05-16', '2023-05-31', '2023-06-21', '2023-06-30', '2023-07-31'),
('Cloud Computing Jornal', 'January2025', '2024-01-03', '2024-04-01', '2024-05-15', '2024-05-16', '2024-05-31', '2024-06-21', '2024-06-30', '2024-07-31'),
('Expert Systems Journal', 'January2024', '2024-01-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Expert Systems Journal', 'July2024', '2024-07-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Expert Systems Journal', 'March2024', '2024-03-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Expert Systems Journal', 'May2024', '2024-05-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Expert Systems Journal', 'November2024', '2024-11-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Expert Systems Journal', 'September2024', '2024-09-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('IEEE Transactions on Computers', 'October2024', '2024-08-01', '2024-08-15', '2024-09-01', '2024-09-15', '2024-10-10', NULL, NULL, NULL),
('Nature Neuroscience', 'April2024', '2024-02-01', '2024-02-15', '2024-03-01', '2024-03-15', '2024-04-01', NULL, NULL, NULL),
('Science Advances', 'June2022', '2022-04-10', '2022-04-24', NULL, NULL, '2022-06-01', NULL, NULL, NULL),
('The Lancet', 'September2023', '2023-07-20', '2023-08-20', NULL, NULL, '2023-09-10', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `volumetheme`
--

CREATE TABLE `volumetheme` (
  `name` varchar(100) NOT NULL,
  `id` varchar(20) NOT NULL,
  `keywid` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `volumetheme`
--

INSERT INTO `volumetheme` (`name`, `id`, `keywid`) VALUES
('Annual Review of Psychology', 'January2025', 4),
('IEEE Transactions on Computers', 'October2024', 5),
('Nature Neuroscience', 'April2024', 1),
('Science Advances', 'June2022', 2),
('The Lancet', 'September2023', 3);

-- --------------------------------------------------------

--
-- Table structure for table `writtenby`
--

CREATE TABLE `writtenby` (
  `id` varchar(10) NOT NULL,
  `email` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `writtenby`
--

INSERT INTO `writtenby` (`id`, `email`) VALUES
('1', 'ahmad.ghazi@gmail.com'),
('1', 'walter.white@gmail.com'),
('2', 'ghaith.badriegh@gmail.com'),
('2', 'omar.almahmoud@gmail.com'),
('3', 'abdulmalik.derak@gmail.com'),
('3', 'omar.almahmoud@gmail.com'),
('4', 'abdulmalik.derak@gmail.com'),
('4', 'ghaith.badriegh@gmail.com'),
('5', 'ahmad.ghazi@gmail.com'),
('5', 'walter.white@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `volname` (`volname`,`volid`),
  ADD KEY `correspAut` (`correspAut`);

--
-- Indexes for table `articlekeywords`
--
ALTER TABLE `articlekeywords`
  ADD PRIMARY KEY (`email`,`aid`),
  ADD KEY `aid` (`aid`);

--
-- Indexes for table `articlereviews`
--
ALTER TABLE `articlereviews`
  ADD PRIMARY KEY (`id`,`email`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `journal`
--
ALTER TABLE `journal`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `keywords`
--
ALTER TABLE `keywords`
  ADD PRIMARY KEY (`keywid`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`email`,`vname`,`vid`),
  ADD KEY `vname` (`vname`,`vid`);

--
-- Indexes for table `personinterest`
--
ALTER TABLE `personinterest`
  ADD PRIMARY KEY (`email`,`keywid`),
  ADD KEY `keywid` (`keywid`);

--
-- Indexes for table `volume`
--
ALTER TABLE `volume`
  ADD PRIMARY KEY (`name`,`id`);

--
-- Indexes for table `volumetheme`
--
ALTER TABLE `volumetheme`
  ADD PRIMARY KEY (`name`,`id`,`keywid`),
  ADD KEY `keywid` (`keywid`);

--
-- Indexes for table `writtenby`
--
ALTER TABLE `writtenby`
  ADD PRIMARY KEY (`id`,`email`),
  ADD KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `keywords`
--
ALTER TABLE `keywords`
  MODIFY `keywid` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`volname`,`volid`) REFERENCES `volume` (`name`, `id`),
  ADD CONSTRAINT `article_ibfk_2` FOREIGN KEY (`correspAut`) REFERENCES `person` (`email`);

--
-- Constraints for table `articlekeywords`
--
ALTER TABLE `articlekeywords`
  ADD CONSTRAINT `articlekeywords_ibfk_1` FOREIGN KEY (`email`) REFERENCES `person` (`email`),
  ADD CONSTRAINT `articlekeywords_ibfk_2` FOREIGN KEY (`aid`) REFERENCES `article` (`id`);

--
-- Constraints for table `articlereviews`
--
ALTER TABLE `articlereviews`
  ADD CONSTRAINT `articlereviews_ibfk_1` FOREIGN KEY (`email`) REFERENCES `person` (`email`),
  ADD CONSTRAINT `articlereviews_ibfk_2` FOREIGN KEY (`id`) REFERENCES `article` (`id`);

--
-- Constraints for table `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `person_ibfk_1` FOREIGN KEY (`vname`,`vid`) REFERENCES `volume` (`name`, `id`);

--
-- Constraints for table `personinterest`
--
ALTER TABLE `personinterest`
  ADD CONSTRAINT `personinterest_ibfk_1` FOREIGN KEY (`email`) REFERENCES `person` (`email`),
  ADD CONSTRAINT `personinterest_ibfk_2` FOREIGN KEY (`keywid`) REFERENCES `keywords` (`keywid`);

--
-- Constraints for table `volume`
--
ALTER TABLE `volume`
  ADD CONSTRAINT `volume_ibfk_1` FOREIGN KEY (`name`) REFERENCES `journal` (`name`);

--
-- Constraints for table `volumetheme`
--
ALTER TABLE `volumetheme`
  ADD CONSTRAINT `volumetheme_ibfk_1` FOREIGN KEY (`name`,`id`) REFERENCES `volume` (`name`, `id`),
  ADD CONSTRAINT `volumetheme_ibfk_2` FOREIGN KEY (`keywid`) REFERENCES `keywords` (`keywid`);

--
-- Constraints for table `writtenby`
--
ALTER TABLE `writtenby`
  ADD CONSTRAINT `writtenby_ibfk_1` FOREIGN KEY (`email`) REFERENCES `person` (`email`),
  ADD CONSTRAINT `writtenby_ibfk_2` FOREIGN KEY (`id`) REFERENCES `article` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

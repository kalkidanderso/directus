-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 12, 2024 at 07:09 PM
-- Server version: 10.6.12-MariaDB-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `directus`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'draft',
  `sort` int(11) DEFAULT NULL,
  `user_created` char(36) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT NULL,
  `user_updated` char(36) DEFAULT NULL,
  `date_updated` timestamp NULL DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `published_year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `status`, `sort`, `user_created`, `date_created`, `user_updated`, `date_updated`, `title`, `author`, `published_year`) VALUES
(1, 'draft', NULL, NULL, '2024-01-11 14:19:24', NULL, NULL, 'Harry Potter', 'J.K. Rowling', 2000),
(2, 'draft', NULL, NULL, '2024-01-11 14:25:35', NULL, NULL, 'Harry Potter', 'J.K. Rowling', 2000);

-- --------------------------------------------------------

--
-- Table structure for table `chat_bot`
--

CREATE TABLE `chat_bot` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'draft',
  `sort` int(11) DEFAULT NULL,
  `user_created` char(36) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT NULL,
  `user_updated` char(36) DEFAULT NULL,
  `date_updated` timestamp NULL DEFAULT NULL,
  `request_text` varchar(255) DEFAULT NULL,
  `response_text` varchar(255) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat_bot`
--

INSERT INTO `chat_bot` (`id`, `status`, `sort`, `user_created`, `date_created`, `user_updated`, `date_updated`, `request_text`, `response_text`, `timestamp`) VALUES
(1, 'draft', NULL, '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 11:01:05', NULL, NULL, 'Hi', 'Hello there', 1123343),
(2, 'draft', NULL, NULL, '2024-01-11 14:34:38', NULL, NULL, 'Hello', 'Hello there', 1704994421),
(3, 'draft', NULL, NULL, '2024-01-11 14:42:03', NULL, NULL, 'Hello', 'Thanks, Hello, How old are you please?', 1704994923966),
(4, 'draft', NULL, NULL, '2024-01-11 14:44:02', NULL, NULL, 'hi', 'Thanks, hi, How old are you please?', 1704995042473),
(5, 'draft', NULL, NULL, '2024-01-11 14:44:20', NULL, NULL, 'hi', 'Hello, What is your name?', 1704995060489);

-- --------------------------------------------------------

--
-- Table structure for table `directus_activity`
--

CREATE TABLE `directus_activity` (
  `id` int(10) UNSIGNED NOT NULL,
  `action` varchar(45) NOT NULL,
  `user` char(36) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `ip` varchar(50) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `collection` varchar(64) NOT NULL,
  `item` varchar(255) NOT NULL,
  `comment` text DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `directus_activity`
--

INSERT INTO `directus_activity` (`id`, `action`, `user`, `timestamp`, `ip`, `user_agent`, `collection`, `item`, `comment`, `origin`) VALUES
(1, 'login', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:01:55', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_users', '0b504e2b-41af-4b99-bc48-567804c03766', NULL, 'http://0.0.0.0:8055'),
(2, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:02:22', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '1', NULL, 'http://0.0.0.0:8055'),
(3, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:02:22', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '2', NULL, 'http://0.0.0.0:8055'),
(4, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:02:22', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '3', NULL, 'http://0.0.0.0:8055'),
(5, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:02:22', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '4', NULL, 'http://0.0.0.0:8055'),
(6, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:02:23', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '5', NULL, 'http://0.0.0.0:8055'),
(7, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:02:23', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '6', NULL, 'http://0.0.0.0:8055'),
(8, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:02:23', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_collections', 'chat_bot', NULL, 'http://0.0.0.0:8055'),
(9, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:02:43', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '7', NULL, 'http://0.0.0.0:8055'),
(10, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:03:00', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '8', NULL, 'http://0.0.0.0:8055'),
(11, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:03:27', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '9', NULL, 'http://0.0.0.0:8055'),
(12, 'update', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:03:34', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_collections', 'chat_bot', NULL, 'http://0.0.0.0:8055'),
(13, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:20:46', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '10', NULL, 'http://0.0.0.0:8055'),
(14, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:20:46', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '11', NULL, 'http://0.0.0.0:8055'),
(15, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:20:46', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '12', NULL, 'http://0.0.0.0:8055'),
(16, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:20:47', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '13', NULL, 'http://0.0.0.0:8055'),
(17, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:20:47', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '14', NULL, 'http://0.0.0.0:8055'),
(18, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:20:47', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '15', NULL, 'http://0.0.0.0:8055'),
(19, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:20:47', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '16', NULL, 'http://0.0.0.0:8055'),
(20, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:20:47', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_collections', 'books', NULL, 'http://0.0.0.0:8055'),
(21, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:21:03', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '17', NULL, 'http://0.0.0.0:8055'),
(22, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:21:11', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '18', NULL, 'http://0.0.0.0:8055'),
(23, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:21:33', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '19', NULL, 'http://0.0.0.0:8055'),
(24, 'update', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:21:54', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_collections', 'books', NULL, 'http://0.0.0.0:8055'),
(25, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:22:08', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '20', NULL, 'http://0.0.0.0:8055'),
(26, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:22:08', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '21', NULL, 'http://0.0.0.0:8055'),
(27, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:22:08', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '22', NULL, 'http://0.0.0.0:8055'),
(28, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:22:08', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '23', NULL, 'http://0.0.0.0:8055'),
(29, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:22:08', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '24', NULL, 'http://0.0.0.0:8055'),
(30, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:22:08', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '25', NULL, 'http://0.0.0.0:8055'),
(31, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:22:09', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '26', NULL, 'http://0.0.0.0:8055'),
(32, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:22:09', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_collections', 'tasks', NULL, 'http://0.0.0.0:8055'),
(33, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:22:23', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '27', NULL, 'http://0.0.0.0:8055'),
(34, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:22:31', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '28', NULL, 'http://0.0.0.0:8055'),
(35, 'update', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:22:37', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_collections', 'tasks', NULL, 'http://0.0.0.0:8055'),
(36, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:39:25', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_permissions', '1', NULL, 'http://0.0.0.0:8055'),
(37, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:39:25', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_permissions', '2', NULL, 'http://0.0.0.0:8055'),
(38, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:39:25', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_permissions', '3', NULL, 'http://0.0.0.0:8055'),
(39, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:39:25', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_permissions', '5', NULL, 'http://0.0.0.0:8055'),
(40, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:39:25', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_permissions', '4', NULL, 'http://0.0.0.0:8055'),
(41, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:39:27', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_permissions', '6', NULL, 'http://0.0.0.0:8055'),
(42, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:39:27', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_permissions', '7', NULL, 'http://0.0.0.0:8055'),
(43, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:39:27', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_permissions', '9', NULL, 'http://0.0.0.0:8055'),
(44, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:39:27', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_permissions', '10', NULL, 'http://0.0.0.0:8055'),
(45, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:39:27', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_permissions', '8', NULL, 'http://0.0.0.0:8055'),
(46, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:39:29', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_permissions', '11', NULL, 'http://0.0.0.0:8055'),
(47, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:39:29', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_permissions', '12', NULL, 'http://0.0.0.0:8055'),
(48, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:39:29', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_permissions', '13', NULL, 'http://0.0.0.0:8055'),
(49, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:39:29', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_permissions', '14', NULL, 'http://0.0.0.0:8055'),
(50, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:39:29', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_permissions', '15', NULL, 'http://0.0.0.0:8055'),
(51, 'update', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:41:50', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '5', NULL, 'http://0.0.0.0:8055'),
(52, 'delete', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:55:40', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_collections', 'chat_bot', NULL, 'http://0.0.0.0:8055'),
(53, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:55:57', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '29', NULL, 'http://0.0.0.0:8055'),
(54, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:55:57', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '30', NULL, 'http://0.0.0.0:8055'),
(55, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:55:57', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '31', NULL, 'http://0.0.0.0:8055'),
(56, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:55:57', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '32', NULL, 'http://0.0.0.0:8055'),
(57, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:55:57', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '33', NULL, 'http://0.0.0.0:8055'),
(58, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:55:57', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '34', NULL, 'http://0.0.0.0:8055'),
(59, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:55:57', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '35', NULL, 'http://0.0.0.0:8055'),
(60, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:55:58', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_collections', 'chat_bot', NULL, 'http://0.0.0.0:8055'),
(61, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:56:11', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '36', NULL, 'http://0.0.0.0:8055'),
(62, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:56:25', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '37', NULL, 'http://0.0.0.0:8055'),
(63, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:56:40', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_fields', '38', NULL, 'http://0.0.0.0:8055'),
(64, 'update', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:56:51', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_collections', 'chat_bot', NULL, 'http://0.0.0.0:8055'),
(65, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:57:02', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_permissions', '16', NULL, 'http://0.0.0.0:8055'),
(66, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:57:02', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_permissions', '17', NULL, 'http://0.0.0.0:8055'),
(67, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:57:02', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_permissions', '18', NULL, 'http://0.0.0.0:8055'),
(68, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:57:02', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_permissions', '19', NULL, 'http://0.0.0.0:8055'),
(69, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 10:57:02', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'directus_permissions', '20', NULL, 'http://0.0.0.0:8055'),
(70, 'create', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-11 11:01:05', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'chat_bot', '1', NULL, 'http://0.0.0.0:8055'),
(71, 'create', NULL, '2024-01-11 14:19:24', '127.0.0.1', 'node', 'books', '1', NULL, NULL),
(72, 'create', NULL, '2024-01-11 14:25:35', '127.0.0.1', 'node', 'books', '2', NULL, NULL),
(73, 'create', NULL, '2024-01-11 14:34:38', '127.0.0.1', 'node', 'chat_bot', '2', NULL, NULL),
(74, 'create', NULL, '2024-01-11 14:42:04', '127.0.0.1', 'node', 'chat_bot', '3', NULL, NULL),
(75, 'create', NULL, '2024-01-11 14:44:02', '127.0.0.1', 'node', 'chat_bot', '4', NULL, NULL),
(76, 'create', NULL, '2024-01-11 14:44:20', '127.0.0.1', 'node', 'chat_bot', '5', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `directus_collections`
--

CREATE TABLE `directus_collections` (
  `collection` varchar(64) NOT NULL,
  `icon` varchar(30) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `display_template` varchar(255) DEFAULT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  `singleton` tinyint(1) NOT NULL DEFAULT 0,
  `translations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`translations`)),
  `archive_field` varchar(64) DEFAULT NULL,
  `archive_app_filter` tinyint(1) NOT NULL DEFAULT 1,
  `archive_value` varchar(255) DEFAULT NULL,
  `unarchive_value` varchar(255) DEFAULT NULL,
  `sort_field` varchar(64) DEFAULT NULL,
  `accountability` varchar(255) DEFAULT 'all',
  `color` varchar(255) DEFAULT NULL,
  `item_duplication_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`item_duplication_fields`)),
  `sort` int(11) DEFAULT NULL,
  `group` varchar(64) DEFAULT NULL,
  `collapse` varchar(255) NOT NULL DEFAULT 'open',
  `preview_url` varchar(255) DEFAULT NULL,
  `versioning` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `directus_collections`
--

INSERT INTO `directus_collections` (`collection`, `icon`, `note`, `display_template`, `hidden`, `singleton`, `translations`, `archive_field`, `archive_app_filter`, `archive_value`, `unarchive_value`, `sort_field`, `accountability`, `color`, `item_duplication_fields`, `sort`, `group`, `collapse`, `preview_url`, `versioning`) VALUES
('books', NULL, NULL, NULL, 0, 0, NULL, NULL, 1, 'archived', 'draft', NULL, 'all', NULL, NULL, NULL, NULL, 'open', NULL, 0),
('chat_bot', NULL, NULL, NULL, 0, 0, NULL, NULL, 1, 'archived', 'draft', NULL, 'all', NULL, NULL, NULL, NULL, 'open', NULL, 0),
('tasks', NULL, NULL, NULL, 0, 0, NULL, NULL, 1, 'archived', 'draft', NULL, 'all', NULL, NULL, NULL, NULL, 'open', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `directus_dashboards`
--

CREATE TABLE `directus_dashboards` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(30) NOT NULL DEFAULT 'dashboard',
  `note` text DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_created` char(36) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `directus_extensions`
--

CREATE TABLE `directus_extensions` (
  `name` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `directus_extensions`
--

INSERT INTO `directus_extensions` (`name`, `enabled`) VALUES
('test:endpoint', 1);

-- --------------------------------------------------------

--
-- Table structure for table `directus_fields`
--

CREATE TABLE `directus_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `collection` varchar(64) NOT NULL,
  `field` varchar(64) NOT NULL,
  `special` varchar(64) DEFAULT NULL,
  `interface` varchar(64) DEFAULT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `display` varchar(64) DEFAULT NULL,
  `display_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`display_options`)),
  `readonly` tinyint(1) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  `sort` int(10) UNSIGNED DEFAULT NULL,
  `width` varchar(30) DEFAULT 'full',
  `translations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`translations`)),
  `note` text DEFAULT NULL,
  `conditions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`conditions`)),
  `required` tinyint(1) DEFAULT 0,
  `group` varchar(64) DEFAULT NULL,
  `validation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`validation`)),
  `validation_message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `directus_fields`
--

INSERT INTO `directus_fields` (`id`, `collection`, `field`, `special`, `interface`, `options`, `display`, `display_options`, `readonly`, `hidden`, `sort`, `width`, `translations`, `note`, `conditions`, `required`, `group`, `validation`, `validation_message`) VALUES
(10, 'books', 'id', NULL, 'input', NULL, NULL, NULL, 1, 1, 1, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(11, 'books', 'status', NULL, 'select-dropdown', '{\"choices\":[{\"text\":\"$t:published\",\"value\":\"published\"},{\"text\":\"$t:draft\",\"value\":\"draft\"},{\"text\":\"$t:archived\",\"value\":\"archived\"}]}', 'labels', '{\"showAsDot\":true,\"choices\":[{\"text\":\"$t:published\",\"value\":\"published\",\"foreground\":\"#FFFFFF\",\"background\":\"var(--theme--primary)\"},{\"text\":\"$t:draft\",\"value\":\"draft\",\"foreground\":\"#18222F\",\"background\":\"#D3DAE4\"},{\"text\":\"$t:archived\",\"value\":\"archived\",\"foreground\":\"#FFFFFF\",\"background\":\"var(--theme--warning)\"}]}', 0, 0, 2, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(12, 'books', 'sort', NULL, 'input', NULL, NULL, NULL, 0, 1, 3, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(13, 'books', 'user_created', 'user-created', 'select-dropdown-m2o', '{\"template\":\"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}', 'user', NULL, 1, 1, 4, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(14, 'books', 'date_created', 'date-created', 'datetime', NULL, 'datetime', '{\"relative\":true}', 1, 1, 5, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(15, 'books', 'user_updated', 'user-updated', 'select-dropdown-m2o', '{\"template\":\"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}', 'user', NULL, 1, 1, 6, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(16, 'books', 'date_updated', 'date-updated', 'datetime', NULL, 'datetime', '{\"relative\":true}', 1, 1, 7, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(17, 'books', 'title', NULL, 'input', NULL, NULL, NULL, 0, 0, 8, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(18, 'books', 'author', NULL, 'input', NULL, NULL, NULL, 0, 0, 9, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(19, 'books', 'published_year', NULL, 'input', NULL, NULL, NULL, 0, 0, 10, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(20, 'tasks', 'id', NULL, 'input', NULL, NULL, NULL, 1, 1, 1, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(21, 'tasks', 'status', NULL, 'select-dropdown', '{\"choices\":[{\"text\":\"$t:published\",\"value\":\"published\"},{\"text\":\"$t:draft\",\"value\":\"draft\"},{\"text\":\"$t:archived\",\"value\":\"archived\"}]}', 'labels', '{\"showAsDot\":true,\"choices\":[{\"text\":\"$t:published\",\"value\":\"published\",\"foreground\":\"#FFFFFF\",\"background\":\"var(--theme--primary)\"},{\"text\":\"$t:draft\",\"value\":\"draft\",\"foreground\":\"#18222F\",\"background\":\"#D3DAE4\"},{\"text\":\"$t:archived\",\"value\":\"archived\",\"foreground\":\"#FFFFFF\",\"background\":\"var(--theme--warning)\"}]}', 0, 0, 2, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(22, 'tasks', 'sort', NULL, 'input', NULL, NULL, NULL, 0, 1, 3, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(23, 'tasks', 'user_created', 'user-created', 'select-dropdown-m2o', '{\"template\":\"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}', 'user', NULL, 1, 1, 4, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(24, 'tasks', 'date_created', 'date-created', 'datetime', NULL, 'datetime', '{\"relative\":true}', 1, 1, 5, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(25, 'tasks', 'user_updated', 'user-updated', 'select-dropdown-m2o', '{\"template\":\"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}', 'user', NULL, 1, 1, 6, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(26, 'tasks', 'date_updated', 'date-updated', 'datetime', NULL, 'datetime', '{\"relative\":true}', 1, 1, 7, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(27, 'tasks', 'title', NULL, 'input', NULL, NULL, NULL, 0, 0, 8, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(28, 'tasks', 'desciption', NULL, 'input', NULL, NULL, NULL, 0, 0, 9, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(29, 'chat_bot', 'id', NULL, 'input', NULL, NULL, NULL, 1, 1, 1, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(30, 'chat_bot', 'status', NULL, 'select-dropdown', '{\"choices\":[{\"text\":\"$t:published\",\"value\":\"published\"},{\"text\":\"$t:draft\",\"value\":\"draft\"},{\"text\":\"$t:archived\",\"value\":\"archived\"}]}', 'labels', '{\"showAsDot\":true,\"choices\":[{\"text\":\"$t:published\",\"value\":\"published\",\"foreground\":\"#FFFFFF\",\"background\":\"var(--theme--primary)\"},{\"text\":\"$t:draft\",\"value\":\"draft\",\"foreground\":\"#18222F\",\"background\":\"#D3DAE4\"},{\"text\":\"$t:archived\",\"value\":\"archived\",\"foreground\":\"#FFFFFF\",\"background\":\"var(--theme--warning)\"}]}', 0, 0, 2, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(31, 'chat_bot', 'sort', NULL, 'input', NULL, NULL, NULL, 0, 1, 3, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(32, 'chat_bot', 'user_created', 'user-created', 'select-dropdown-m2o', '{\"template\":\"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}', 'user', NULL, 1, 1, 4, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(33, 'chat_bot', 'date_created', 'date-created', 'datetime', NULL, 'datetime', '{\"relative\":true}', 1, 1, 5, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(34, 'chat_bot', 'user_updated', 'user-updated', 'select-dropdown-m2o', '{\"template\":\"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}', 'user', NULL, 1, 1, 6, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(35, 'chat_bot', 'date_updated', 'date-updated', 'datetime', NULL, 'datetime', '{\"relative\":true}', 1, 1, 7, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(36, 'chat_bot', 'request_text', NULL, 'input', NULL, NULL, NULL, 0, 0, 8, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(37, 'chat_bot', 'response_text', NULL, 'input', NULL, NULL, NULL, 0, 0, 9, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(38, 'chat_bot', 'timestamp', NULL, 'input', NULL, NULL, NULL, 0, 0, 10, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `directus_files`
--

CREATE TABLE `directus_files` (
  `id` char(36) NOT NULL,
  `storage` varchar(255) NOT NULL,
  `filename_disk` varchar(255) DEFAULT NULL,
  `filename_download` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `folder` char(36) DEFAULT NULL,
  `uploaded_by` char(36) DEFAULT NULL,
  `uploaded_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_by` char(36) DEFAULT NULL,
  `modified_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `charset` varchar(50) DEFAULT NULL,
  `filesize` bigint(20) DEFAULT NULL,
  `width` int(10) UNSIGNED DEFAULT NULL,
  `height` int(10) UNSIGNED DEFAULT NULL,
  `duration` int(10) UNSIGNED DEFAULT NULL,
  `embed` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `location` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `directus_flows`
--

CREATE TABLE `directus_flows` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(30) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `trigger` varchar(255) DEFAULT NULL,
  `accountability` varchar(255) DEFAULT 'all',
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `operation` char(36) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_created` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `directus_folders`
--

CREATE TABLE `directus_folders` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `directus_migrations`
--

CREATE TABLE `directus_migrations` (
  `version` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `directus_migrations`
--

INSERT INTO `directus_migrations` (`version`, `name`, `timestamp`) VALUES
('20201028A', 'Remove Collection Foreign Keys', '2024-01-11 12:54:45'),
('20201029A', 'Remove System Relations', '2024-01-11 12:54:45'),
('20201029B', 'Remove System Collections', '2024-01-11 12:54:45'),
('20201029C', 'Remove System Fields', '2024-01-11 12:54:45'),
('20201105A', 'Add Cascade System Relations', '2024-01-11 12:55:16'),
('20201105B', 'Change Webhook URL Type', '2024-01-11 12:55:18'),
('20210225A', 'Add Relations Sort Field', '2024-01-11 12:55:21'),
('20210304A', 'Remove Locked Fields', '2024-01-11 12:55:23'),
('20210312A', 'Webhooks Collections Text', '2024-01-11 12:55:26'),
('20210331A', 'Add Refresh Interval', '2024-01-11 12:55:30'),
('20210415A', 'Make Filesize Nullable', '2024-01-11 12:55:38'),
('20210416A', 'Add Collections Accountability', '2024-01-11 12:55:40'),
('20210422A', 'Remove Files Interface', '2024-01-11 12:55:40'),
('20210506A', 'Rename Interfaces', '2024-01-11 12:55:40'),
('20210510A', 'Restructure Relations', '2024-01-11 12:55:51'),
('20210518A', 'Add Foreign Key Constraints', '2024-01-11 12:55:59'),
('20210519A', 'Add System Fk Triggers', '2024-01-11 12:56:36'),
('20210521A', 'Add Collections Icon Color', '2024-01-11 12:56:38'),
('20210525A', 'Add Insights', '2024-01-11 12:56:50'),
('20210608A', 'Add Deep Clone Config', '2024-01-11 12:56:52'),
('20210626A', 'Change Filesize Bigint', '2024-01-11 12:56:55'),
('20210716A', 'Add Conditions to Fields', '2024-01-11 12:56:56'),
('20210721A', 'Add Default Folder', '2024-01-11 12:57:03'),
('20210802A', 'Replace Groups', '2024-01-11 12:57:04'),
('20210803A', 'Add Required to Fields', '2024-01-11 12:57:06'),
('20210805A', 'Update Groups', '2024-01-11 12:57:06'),
('20210805B', 'Change Image Metadata Structure', '2024-01-11 12:57:06'),
('20210811A', 'Add Geometry Config', '2024-01-11 12:57:08'),
('20210831A', 'Remove Limit Column', '2024-01-11 12:57:09'),
('20210903A', 'Add Auth Provider', '2024-01-11 12:57:20'),
('20210907A', 'Webhooks Collections Not Null', '2024-01-11 12:57:23'),
('20210910A', 'Move Module Setup', '2024-01-11 12:57:27'),
('20210920A', 'Webhooks URL Not Null', '2024-01-11 12:57:29'),
('20210924A', 'Add Collection Organization', '2024-01-11 12:57:33'),
('20210927A', 'Replace Fields Group', '2024-01-11 12:57:37'),
('20210927B', 'Replace M2M Interface', '2024-01-11 12:57:37'),
('20210929A', 'Rename Login Action', '2024-01-11 12:57:37'),
('20211007A', 'Update Presets', '2024-01-11 12:57:40'),
('20211009A', 'Add Auth Data', '2024-01-11 12:57:43'),
('20211016A', 'Add Webhook Headers', '2024-01-11 12:57:46'),
('20211103A', 'Set Unique to User Token', '2024-01-11 12:57:48'),
('20211103B', 'Update Special Geometry', '2024-01-11 12:57:49'),
('20211104A', 'Remove Collections Listing', '2024-01-11 12:57:51'),
('20211118A', 'Add Notifications', '2024-01-11 12:58:01'),
('20211211A', 'Add Shares', '2024-01-11 12:58:17'),
('20211230A', 'Add Project Descriptor', '2024-01-11 12:58:19'),
('20220303A', 'Remove Default Project Color', '2024-01-11 12:58:21'),
('20220308A', 'Add Bookmark Icon and Color', '2024-01-11 12:58:23'),
('20220314A', 'Add Translation Strings', '2024-01-11 12:58:24'),
('20220322A', 'Rename Field Typecast Flags', '2024-01-11 12:58:24'),
('20220323A', 'Add Field Validation', '2024-01-11 12:58:25'),
('20220325A', 'Fix Typecast Flags', '2024-01-11 12:58:25'),
('20220325B', 'Add Default Language', '2024-01-11 12:58:28'),
('20220402A', 'Remove Default Value Panel Icon', '2024-01-11 12:58:29'),
('20220429A', 'Add Flows', '2024-01-11 12:58:55'),
('20220429B', 'Add Color to Insights Icon', '2024-01-11 12:58:56'),
('20220429C', 'Drop Non Null From IP of Activity', '2024-01-11 12:58:58'),
('20220429D', 'Drop Non Null From Sender of Notifications', '2024-01-11 12:58:59'),
('20220614A', 'Rename Hook Trigger to Event', '2024-01-11 12:59:00'),
('20220801A', 'Update Notifications Timestamp Column', '2024-01-11 12:59:01'),
('20220802A', 'Add Custom Aspect Ratios', '2024-01-11 12:59:02'),
('20220826A', 'Add Origin to Accountability', '2024-01-11 12:59:04'),
('20230401A', 'Update Material Icons', '2024-01-11 12:59:07'),
('20230525A', 'Add Preview Settings', '2024-01-11 12:59:07'),
('20230526A', 'Migrate Translation Strings', '2024-01-11 12:59:08'),
('20230721A', 'Require Shares Fields', '2024-01-11 12:59:15'),
('20230823A', 'Add Content Versioning', '2024-01-11 12:59:28'),
('20230927A', 'Themes', '2024-01-11 12:59:34'),
('20231009A', 'Update CSV Fields to Text', '2024-01-11 12:59:34'),
('20231009B', 'Update Panel Options', '2024-01-11 12:59:34'),
('20231010A', 'Add Extensions', '2024-01-11 12:59:34');

-- --------------------------------------------------------

--
-- Table structure for table `directus_notifications`
--

CREATE TABLE `directus_notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp(),
  `status` varchar(255) DEFAULT 'inbox',
  `recipient` char(36) NOT NULL,
  `sender` char(36) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text DEFAULT NULL,
  `collection` varchar(64) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `directus_operations`
--

CREATE TABLE `directus_operations` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `key` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `position_x` int(11) NOT NULL,
  `position_y` int(11) NOT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `resolve` char(36) DEFAULT NULL,
  `reject` char(36) DEFAULT NULL,
  `flow` char(36) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_created` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `directus_panels`
--

CREATE TABLE `directus_panels` (
  `id` char(36) NOT NULL,
  `dashboard` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(30) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `show_header` tinyint(1) NOT NULL DEFAULT 0,
  `note` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `position_x` int(11) NOT NULL,
  `position_y` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_created` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `directus_permissions`
--

CREATE TABLE `directus_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `role` char(36) DEFAULT NULL,
  `collection` varchar(64) NOT NULL,
  `action` varchar(10) NOT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  `validation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`validation`)),
  `presets` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`presets`)),
  `fields` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `directus_permissions`
--

INSERT INTO `directus_permissions` (`id`, `role`, `collection`, `action`, `permissions`, `validation`, `presets`, `fields`) VALUES
(1, NULL, 'books', 'read', '{}', '{}', NULL, '*'),
(2, NULL, 'books', 'create', '{}', '{}', NULL, '*'),
(3, NULL, 'books', 'update', '{}', '{}', NULL, '*'),
(4, NULL, 'books', 'delete', '{}', '{}', NULL, '*'),
(5, NULL, 'books', 'share', '{}', '{}', NULL, '*'),
(11, NULL, 'tasks', 'create', '{}', '{}', NULL, '*'),
(12, NULL, 'tasks', 'read', '{}', '{}', NULL, '*'),
(13, NULL, 'tasks', 'update', '{}', '{}', NULL, '*'),
(14, NULL, 'tasks', 'delete', '{}', '{}', NULL, '*'),
(15, NULL, 'tasks', 'share', '{}', '{}', NULL, '*'),
(16, NULL, 'chat_bot', 'create', '{}', '{}', NULL, '*'),
(17, NULL, 'chat_bot', 'read', '{}', '{}', NULL, '*'),
(18, NULL, 'chat_bot', 'update', '{}', '{}', NULL, '*'),
(19, NULL, 'chat_bot', 'delete', '{}', '{}', NULL, '*'),
(20, NULL, 'chat_bot', 'share', '{}', '{}', NULL, '*');

-- --------------------------------------------------------

--
-- Table structure for table `directus_presets`
--

CREATE TABLE `directus_presets` (
  `id` int(10) UNSIGNED NOT NULL,
  `bookmark` varchar(255) DEFAULT NULL,
  `user` char(36) DEFAULT NULL,
  `role` char(36) DEFAULT NULL,
  `collection` varchar(64) DEFAULT NULL,
  `search` varchar(100) DEFAULT NULL,
  `layout` varchar(100) DEFAULT 'tabular',
  `layout_query` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`layout_query`)),
  `layout_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`layout_options`)),
  `refresh_interval` int(11) DEFAULT NULL,
  `filter` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`filter`)),
  `icon` varchar(30) DEFAULT 'bookmark',
  `color` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `directus_relations`
--

CREATE TABLE `directus_relations` (
  `id` int(10) UNSIGNED NOT NULL,
  `many_collection` varchar(64) NOT NULL,
  `many_field` varchar(64) NOT NULL,
  `one_collection` varchar(64) DEFAULT NULL,
  `one_field` varchar(64) DEFAULT NULL,
  `one_collection_field` varchar(64) DEFAULT NULL,
  `one_allowed_collections` text DEFAULT NULL,
  `junction_field` varchar(64) DEFAULT NULL,
  `sort_field` varchar(64) DEFAULT NULL,
  `one_deselect_action` varchar(255) NOT NULL DEFAULT 'nullify'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `directus_relations`
--

INSERT INTO `directus_relations` (`id`, `many_collection`, `many_field`, `one_collection`, `one_field`, `one_collection_field`, `one_allowed_collections`, `junction_field`, `sort_field`, `one_deselect_action`) VALUES
(3, 'books', 'user_created', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify'),
(4, 'books', 'user_updated', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify'),
(5, 'tasks', 'user_created', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify'),
(6, 'tasks', 'user_updated', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify'),
(7, 'chat_bot', 'user_created', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify'),
(8, 'chat_bot', 'user_updated', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify');

-- --------------------------------------------------------

--
-- Table structure for table `directus_revisions`
--

CREATE TABLE `directus_revisions` (
  `id` int(10) UNSIGNED NOT NULL,
  `activity` int(10) UNSIGNED NOT NULL,
  `collection` varchar(64) NOT NULL,
  `item` varchar(255) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `delta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`delta`)),
  `parent` int(10) UNSIGNED DEFAULT NULL,
  `version` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `directus_revisions`
--

INSERT INTO `directus_revisions` (`id`, `activity`, `collection`, `item`, `data`, `delta`, `parent`, `version`) VALUES
(1, 2, 'directus_fields', '1', '{\"sort\":1,\"hidden\":true,\"interface\":\"input\",\"readonly\":true,\"field\":\"id\",\"collection\":\"chat_bot\"}', '{\"sort\":1,\"hidden\":true,\"interface\":\"input\",\"readonly\":true,\"field\":\"id\",\"collection\":\"chat_bot\"}', NULL, NULL),
(2, 3, 'directus_fields', '2', '{\"sort\":2,\"width\":\"full\",\"options\":{\"choices\":[{\"text\":\"$t:published\",\"value\":\"published\"},{\"text\":\"$t:draft\",\"value\":\"draft\"},{\"text\":\"$t:archived\",\"value\":\"archived\"}]},\"interface\":\"select-dropdown\",\"display\":\"labels\",\"display_options\":{\"showAsDot\":true,\"choices\":[{\"text\":\"$t:published\",\"value\":\"published\",\"foreground\":\"#FFFFFF\",\"background\":\"var(--theme--primary)\"},{\"text\":\"$t:draft\",\"value\":\"draft\",\"foreground\":\"#18222F\",\"background\":\"#D3DAE4\"},{\"text\":\"$t:archived\",\"value\":\"archived\",\"foreground\":\"#FFFFFF\",\"background\":\"var(--theme--warning)\"}]},\"field\":\"status\",\"collection\":\"chat_bot\"}', '{\"sort\":2,\"width\":\"full\",\"options\":{\"choices\":[{\"text\":\"$t:published\",\"value\":\"published\"},{\"text\":\"$t:draft\",\"value\":\"draft\"},{\"text\":\"$t:archived\",\"value\":\"archived\"}]},\"interface\":\"select-dropdown\",\"display\":\"labels\",\"display_options\":{\"showAsDot\":true,\"choices\":[{\"text\":\"$t:published\",\"value\":\"published\",\"foreground\":\"#FFFFFF\",\"background\":\"var(--theme--primary)\"},{\"text\":\"$t:draft\",\"value\":\"draft\",\"foreground\":\"#18222F\",\"background\":\"#D3DAE4\"},{\"text\":\"$t:archived\",\"value\":\"archived\",\"foreground\":\"#FFFFFF\",\"background\":\"var(--theme--warning)\"}]},\"field\":\"status\",\"collection\":\"chat_bot\"}', NULL, NULL),
(3, 4, 'directus_fields', '3', '{\"sort\":3,\"interface\":\"input\",\"hidden\":true,\"field\":\"sort\",\"collection\":\"chat_bot\"}', '{\"sort\":3,\"interface\":\"input\",\"hidden\":true,\"field\":\"sort\",\"collection\":\"chat_bot\"}', NULL, NULL),
(4, 5, 'directus_fields', '4', '{\"sort\":4,\"special\":[\"user-created\"],\"interface\":\"select-dropdown-m2o\",\"options\":{\"template\":\"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"},\"display\":\"user\",\"readonly\":true,\"hidden\":true,\"width\":\"half\",\"field\":\"user_created\",\"collection\":\"chat_bot\"}', '{\"sort\":4,\"special\":[\"user-created\"],\"interface\":\"select-dropdown-m2o\",\"options\":{\"template\":\"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"},\"display\":\"user\",\"readonly\":true,\"hidden\":true,\"width\":\"half\",\"field\":\"user_created\",\"collection\":\"chat_bot\"}', NULL, NULL),
(5, 6, 'directus_fields', '5', '{\"sort\":5,\"special\":[\"date-created\"],\"interface\":\"datetime\",\"readonly\":true,\"hidden\":true,\"width\":\"half\",\"display\":\"datetime\",\"display_options\":{\"relative\":true},\"field\":\"date_created\",\"collection\":\"chat_bot\"}', '{\"sort\":5,\"special\":[\"date-created\"],\"interface\":\"datetime\",\"readonly\":true,\"hidden\":true,\"width\":\"half\",\"display\":\"datetime\",\"display_options\":{\"relative\":true},\"field\":\"date_created\",\"collection\":\"chat_bot\"}', NULL, NULL),
(6, 7, 'directus_fields', '6', '{\"sort\":6,\"special\":[\"user-updated\"],\"interface\":\"select-dropdown-m2o\",\"options\":{\"template\":\"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"},\"display\":\"user\",\"readonly\":true,\"hidden\":true,\"width\":\"half\",\"field\":\"user_updated\",\"collection\":\"chat_bot\"}', '{\"sort\":6,\"special\":[\"user-updated\"],\"interface\":\"select-dropdown-m2o\",\"options\":{\"template\":\"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"},\"display\":\"user\",\"readonly\":true,\"hidden\":true,\"width\":\"half\",\"field\":\"user_updated\",\"collection\":\"chat_bot\"}', NULL, NULL),
(7, 8, 'directus_collections', 'chat_bot', '{\"sort_field\":\"sort\",\"archive_field\":\"status\",\"archive_value\":\"archived\",\"unarchive_value\":\"draft\",\"singleton\":false,\"collection\":\"chat_bot\"}', '{\"sort_field\":\"sort\",\"archive_field\":\"status\",\"archive_value\":\"archived\",\"unarchive_value\":\"draft\",\"singleton\":false,\"collection\":\"chat_bot\"}', NULL, NULL),
(8, 9, 'directus_fields', '7', '{\"sort\":7,\"interface\":\"input\",\"special\":null,\"collection\":\"chat_bot\",\"field\":\"requestText\"}', '{\"sort\":7,\"interface\":\"input\",\"special\":null,\"collection\":\"chat_bot\",\"field\":\"requestText\"}', NULL, NULL),
(9, 10, 'directus_fields', '8', '{\"sort\":8,\"interface\":\"input\",\"special\":null,\"collection\":\"chat_bot\",\"field\":\"responseText\"}', '{\"sort\":8,\"interface\":\"input\",\"special\":null,\"collection\":\"chat_bot\",\"field\":\"responseText\"}', NULL, NULL),
(10, 11, 'directus_fields', '9', '{\"sort\":9,\"interface\":\"input\",\"special\":null,\"collection\":\"chat_bot\",\"field\":\"timestamp\"}', '{\"sort\":9,\"interface\":\"input\",\"special\":null,\"collection\":\"chat_bot\",\"field\":\"timestamp\"}', NULL, NULL),
(11, 12, 'directus_collections', 'chat_bot', '{\"collection\":\"chat_bot\",\"icon\":null,\"note\":null,\"display_template\":null,\"hidden\":false,\"singleton\":false,\"translations\":null,\"archive_field\":null,\"archive_app_filter\":true,\"archive_value\":\"archived\",\"unarchive_value\":\"draft\",\"sort_field\":null,\"accountability\":\"all\",\"color\":null,\"item_duplication_fields\":null,\"sort\":null,\"group\":null,\"collapse\":\"open\",\"preview_url\":null,\"versioning\":false}', '{\"archive_field\":null,\"sort_field\":null}', NULL, NULL),
(12, 13, 'directus_fields', '10', '{\"sort\":1,\"hidden\":true,\"interface\":\"input\",\"readonly\":true,\"field\":\"id\",\"collection\":\"books\"}', '{\"sort\":1,\"hidden\":true,\"interface\":\"input\",\"readonly\":true,\"field\":\"id\",\"collection\":\"books\"}', NULL, NULL),
(13, 14, 'directus_fields', '11', '{\"sort\":2,\"width\":\"full\",\"options\":{\"choices\":[{\"text\":\"$t:published\",\"value\":\"published\"},{\"text\":\"$t:draft\",\"value\":\"draft\"},{\"text\":\"$t:archived\",\"value\":\"archived\"}]},\"interface\":\"select-dropdown\",\"display\":\"labels\",\"display_options\":{\"showAsDot\":true,\"choices\":[{\"text\":\"$t:published\",\"value\":\"published\",\"foreground\":\"#FFFFFF\",\"background\":\"var(--theme--primary)\"},{\"text\":\"$t:draft\",\"value\":\"draft\",\"foreground\":\"#18222F\",\"background\":\"#D3DAE4\"},{\"text\":\"$t:archived\",\"value\":\"archived\",\"foreground\":\"#FFFFFF\",\"background\":\"var(--theme--warning)\"}]},\"field\":\"status\",\"collection\":\"books\"}', '{\"sort\":2,\"width\":\"full\",\"options\":{\"choices\":[{\"text\":\"$t:published\",\"value\":\"published\"},{\"text\":\"$t:draft\",\"value\":\"draft\"},{\"text\":\"$t:archived\",\"value\":\"archived\"}]},\"interface\":\"select-dropdown\",\"display\":\"labels\",\"display_options\":{\"showAsDot\":true,\"choices\":[{\"text\":\"$t:published\",\"value\":\"published\",\"foreground\":\"#FFFFFF\",\"background\":\"var(--theme--primary)\"},{\"text\":\"$t:draft\",\"value\":\"draft\",\"foreground\":\"#18222F\",\"background\":\"#D3DAE4\"},{\"text\":\"$t:archived\",\"value\":\"archived\",\"foreground\":\"#FFFFFF\",\"background\":\"var(--theme--warning)\"}]},\"field\":\"status\",\"collection\":\"books\"}', NULL, NULL),
(14, 15, 'directus_fields', '12', '{\"sort\":3,\"interface\":\"input\",\"hidden\":true,\"field\":\"sort\",\"collection\":\"books\"}', '{\"sort\":3,\"interface\":\"input\",\"hidden\":true,\"field\":\"sort\",\"collection\":\"books\"}', NULL, NULL),
(15, 16, 'directus_fields', '13', '{\"sort\":4,\"special\":[\"user-created\"],\"interface\":\"select-dropdown-m2o\",\"options\":{\"template\":\"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"},\"display\":\"user\",\"readonly\":true,\"hidden\":true,\"width\":\"half\",\"field\":\"user_created\",\"collection\":\"books\"}', '{\"sort\":4,\"special\":[\"user-created\"],\"interface\":\"select-dropdown-m2o\",\"options\":{\"template\":\"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"},\"display\":\"user\",\"readonly\":true,\"hidden\":true,\"width\":\"half\",\"field\":\"user_created\",\"collection\":\"books\"}', NULL, NULL),
(16, 17, 'directus_fields', '14', '{\"sort\":5,\"special\":[\"date-created\"],\"interface\":\"datetime\",\"readonly\":true,\"hidden\":true,\"width\":\"half\",\"display\":\"datetime\",\"display_options\":{\"relative\":true},\"field\":\"date_created\",\"collection\":\"books\"}', '{\"sort\":5,\"special\":[\"date-created\"],\"interface\":\"datetime\",\"readonly\":true,\"hidden\":true,\"width\":\"half\",\"display\":\"datetime\",\"display_options\":{\"relative\":true},\"field\":\"date_created\",\"collection\":\"books\"}', NULL, NULL),
(17, 18, 'directus_fields', '15', '{\"sort\":6,\"special\":[\"user-updated\"],\"interface\":\"select-dropdown-m2o\",\"options\":{\"template\":\"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"},\"display\":\"user\",\"readonly\":true,\"hidden\":true,\"width\":\"half\",\"field\":\"user_updated\",\"collection\":\"books\"}', '{\"sort\":6,\"special\":[\"user-updated\"],\"interface\":\"select-dropdown-m2o\",\"options\":{\"template\":\"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"},\"display\":\"user\",\"readonly\":true,\"hidden\":true,\"width\":\"half\",\"field\":\"user_updated\",\"collection\":\"books\"}', NULL, NULL),
(18, 19, 'directus_fields', '16', '{\"sort\":7,\"special\":[\"date-updated\"],\"interface\":\"datetime\",\"readonly\":true,\"hidden\":true,\"width\":\"half\",\"display\":\"datetime\",\"display_options\":{\"relative\":true},\"field\":\"date_updated\",\"collection\":\"books\"}', '{\"sort\":7,\"special\":[\"date-updated\"],\"interface\":\"datetime\",\"readonly\":true,\"hidden\":true,\"width\":\"half\",\"display\":\"datetime\",\"display_options\":{\"relative\":true},\"field\":\"date_updated\",\"collection\":\"books\"}', NULL, NULL),
(19, 20, 'directus_collections', 'books', '{\"sort_field\":\"sort\",\"archive_field\":\"status\",\"archive_value\":\"archived\",\"unarchive_value\":\"draft\",\"singleton\":false,\"collection\":\"books\"}', '{\"sort_field\":\"sort\",\"archive_field\":\"status\",\"archive_value\":\"archived\",\"unarchive_value\":\"draft\",\"singleton\":false,\"collection\":\"books\"}', NULL, NULL),
(20, 21, 'directus_fields', '17', '{\"sort\":8,\"interface\":\"input\",\"special\":null,\"collection\":\"books\",\"field\":\"title\"}', '{\"sort\":8,\"interface\":\"input\",\"special\":null,\"collection\":\"books\",\"field\":\"title\"}', NULL, NULL),
(21, 22, 'directus_fields', '18', '{\"sort\":9,\"interface\":\"input\",\"special\":null,\"collection\":\"books\",\"field\":\"author\"}', '{\"sort\":9,\"interface\":\"input\",\"special\":null,\"collection\":\"books\",\"field\":\"author\"}', NULL, NULL),
(22, 23, 'directus_fields', '19', '{\"sort\":10,\"interface\":\"input\",\"special\":null,\"collection\":\"books\",\"field\":\"published_year\"}', '{\"sort\":10,\"interface\":\"input\",\"special\":null,\"collection\":\"books\",\"field\":\"published_year\"}', NULL, NULL),
(23, 24, 'directus_collections', 'books', '{\"collection\":\"books\",\"icon\":null,\"note\":null,\"display_template\":null,\"hidden\":false,\"singleton\":false,\"translations\":null,\"archive_field\":null,\"archive_app_filter\":true,\"archive_value\":\"archived\",\"unarchive_value\":\"draft\",\"sort_field\":null,\"accountability\":\"all\",\"color\":null,\"item_duplication_fields\":null,\"sort\":null,\"group\":null,\"collapse\":\"open\",\"preview_url\":null,\"versioning\":false}', '{\"archive_field\":null,\"sort_field\":null}', NULL, NULL),
(24, 25, 'directus_fields', '20', '{\"sort\":1,\"hidden\":true,\"interface\":\"input\",\"readonly\":true,\"field\":\"id\",\"collection\":\"tasks\"}', '{\"sort\":1,\"hidden\":true,\"interface\":\"input\",\"readonly\":true,\"field\":\"id\",\"collection\":\"tasks\"}', NULL, NULL),
(25, 26, 'directus_fields', '21', '{\"sort\":2,\"width\":\"full\",\"options\":{\"choices\":[{\"text\":\"$t:published\",\"value\":\"published\"},{\"text\":\"$t:draft\",\"value\":\"draft\"},{\"text\":\"$t:archived\",\"value\":\"archived\"}]},\"interface\":\"select-dropdown\",\"display\":\"labels\",\"display_options\":{\"showAsDot\":true,\"choices\":[{\"text\":\"$t:published\",\"value\":\"published\",\"foreground\":\"#FFFFFF\",\"background\":\"var(--theme--primary)\"},{\"text\":\"$t:draft\",\"value\":\"draft\",\"foreground\":\"#18222F\",\"background\":\"#D3DAE4\"},{\"text\":\"$t:archived\",\"value\":\"archived\",\"foreground\":\"#FFFFFF\",\"background\":\"var(--theme--warning)\"}]},\"field\":\"status\",\"collection\":\"tasks\"}', '{\"sort\":2,\"width\":\"full\",\"options\":{\"choices\":[{\"text\":\"$t:published\",\"value\":\"published\"},{\"text\":\"$t:draft\",\"value\":\"draft\"},{\"text\":\"$t:archived\",\"value\":\"archived\"}]},\"interface\":\"select-dropdown\",\"display\":\"labels\",\"display_options\":{\"showAsDot\":true,\"choices\":[{\"text\":\"$t:published\",\"value\":\"published\",\"foreground\":\"#FFFFFF\",\"background\":\"var(--theme--primary)\"},{\"text\":\"$t:draft\",\"value\":\"draft\",\"foreground\":\"#18222F\",\"background\":\"#D3DAE4\"},{\"text\":\"$t:archived\",\"value\":\"archived\",\"foreground\":\"#FFFFFF\",\"background\":\"var(--theme--warning)\"}]},\"field\":\"status\",\"collection\":\"tasks\"}', NULL, NULL),
(26, 27, 'directus_fields', '22', '{\"sort\":3,\"interface\":\"input\",\"hidden\":true,\"field\":\"sort\",\"collection\":\"tasks\"}', '{\"sort\":3,\"interface\":\"input\",\"hidden\":true,\"field\":\"sort\",\"collection\":\"tasks\"}', NULL, NULL),
(27, 28, 'directus_fields', '23', '{\"sort\":4,\"special\":[\"user-created\"],\"interface\":\"select-dropdown-m2o\",\"options\":{\"template\":\"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"},\"display\":\"user\",\"readonly\":true,\"hidden\":true,\"width\":\"half\",\"field\":\"user_created\",\"collection\":\"tasks\"}', '{\"sort\":4,\"special\":[\"user-created\"],\"interface\":\"select-dropdown-m2o\",\"options\":{\"template\":\"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"},\"display\":\"user\",\"readonly\":true,\"hidden\":true,\"width\":\"half\",\"field\":\"user_created\",\"collection\":\"tasks\"}', NULL, NULL),
(28, 29, 'directus_fields', '24', '{\"sort\":5,\"special\":[\"date-created\"],\"interface\":\"datetime\",\"readonly\":true,\"hidden\":true,\"width\":\"half\",\"display\":\"datetime\",\"display_options\":{\"relative\":true},\"field\":\"date_created\",\"collection\":\"tasks\"}', '{\"sort\":5,\"special\":[\"date-created\"],\"interface\":\"datetime\",\"readonly\":true,\"hidden\":true,\"width\":\"half\",\"display\":\"datetime\",\"display_options\":{\"relative\":true},\"field\":\"date_created\",\"collection\":\"tasks\"}', NULL, NULL),
(29, 30, 'directus_fields', '25', '{\"sort\":6,\"special\":[\"user-updated\"],\"interface\":\"select-dropdown-m2o\",\"options\":{\"template\":\"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"},\"display\":\"user\",\"readonly\":true,\"hidden\":true,\"width\":\"half\",\"field\":\"user_updated\",\"collection\":\"tasks\"}', '{\"sort\":6,\"special\":[\"user-updated\"],\"interface\":\"select-dropdown-m2o\",\"options\":{\"template\":\"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"},\"display\":\"user\",\"readonly\":true,\"hidden\":true,\"width\":\"half\",\"field\":\"user_updated\",\"collection\":\"tasks\"}', NULL, NULL),
(30, 31, 'directus_fields', '26', '{\"sort\":7,\"special\":[\"date-updated\"],\"interface\":\"datetime\",\"readonly\":true,\"hidden\":true,\"width\":\"half\",\"display\":\"datetime\",\"display_options\":{\"relative\":true},\"field\":\"date_updated\",\"collection\":\"tasks\"}', '{\"sort\":7,\"special\":[\"date-updated\"],\"interface\":\"datetime\",\"readonly\":true,\"hidden\":true,\"width\":\"half\",\"display\":\"datetime\",\"display_options\":{\"relative\":true},\"field\":\"date_updated\",\"collection\":\"tasks\"}', NULL, NULL),
(31, 32, 'directus_collections', 'tasks', '{\"sort_field\":\"sort\",\"archive_field\":\"status\",\"archive_value\":\"archived\",\"unarchive_value\":\"draft\",\"singleton\":false,\"collection\":\"tasks\"}', '{\"sort_field\":\"sort\",\"archive_field\":\"status\",\"archive_value\":\"archived\",\"unarchive_value\":\"draft\",\"singleton\":false,\"collection\":\"tasks\"}', NULL, NULL),
(32, 33, 'directus_fields', '27', '{\"sort\":8,\"interface\":\"input\",\"special\":null,\"collection\":\"tasks\",\"field\":\"title\"}', '{\"sort\":8,\"interface\":\"input\",\"special\":null,\"collection\":\"tasks\",\"field\":\"title\"}', NULL, NULL),
(33, 34, 'directus_fields', '28', '{\"sort\":9,\"interface\":\"input\",\"special\":null,\"collection\":\"tasks\",\"field\":\"desciption\"}', '{\"sort\":9,\"interface\":\"input\",\"special\":null,\"collection\":\"tasks\",\"field\":\"desciption\"}', NULL, NULL),
(34, 35, 'directus_collections', 'tasks', '{\"collection\":\"tasks\",\"icon\":null,\"note\":null,\"display_template\":null,\"hidden\":false,\"singleton\":false,\"translations\":null,\"archive_field\":null,\"archive_app_filter\":true,\"archive_value\":\"archived\",\"unarchive_value\":\"draft\",\"sort_field\":null,\"accountability\":\"all\",\"color\":null,\"item_duplication_fields\":null,\"sort\":null,\"group\":null,\"collapse\":\"open\",\"preview_url\":null,\"versioning\":false}', '{\"archive_field\":null,\"sort_field\":null}', NULL, NULL),
(35, 36, 'directus_permissions', '1', '{\"role\":null,\"collection\":\"books\",\"action\":\"read\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', '{\"role\":null,\"collection\":\"books\",\"action\":\"read\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', NULL, NULL),
(36, 37, 'directus_permissions', '2', '{\"role\":null,\"collection\":\"books\",\"action\":\"create\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', '{\"role\":null,\"collection\":\"books\",\"action\":\"create\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', NULL, NULL),
(37, 38, 'directus_permissions', '3', '{\"role\":null,\"collection\":\"books\",\"action\":\"update\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', '{\"role\":null,\"collection\":\"books\",\"action\":\"update\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', NULL, NULL),
(38, 40, 'directus_permissions', '4', '{\"role\":null,\"collection\":\"books\",\"action\":\"delete\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', '{\"role\":null,\"collection\":\"books\",\"action\":\"delete\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', NULL, NULL),
(39, 39, 'directus_permissions', '5', '{\"role\":null,\"collection\":\"books\",\"action\":\"share\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', '{\"role\":null,\"collection\":\"books\",\"action\":\"share\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', NULL, NULL),
(40, 41, 'directus_permissions', '6', '{\"role\":null,\"collection\":\"chat_bot\",\"action\":\"create\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', '{\"role\":null,\"collection\":\"chat_bot\",\"action\":\"create\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', NULL, NULL),
(41, 42, 'directus_permissions', '7', '{\"role\":null,\"collection\":\"chat_bot\",\"action\":\"read\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', '{\"role\":null,\"collection\":\"chat_bot\",\"action\":\"read\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', NULL, NULL),
(42, 43, 'directus_permissions', '9', '{\"role\":null,\"collection\":\"chat_bot\",\"action\":\"delete\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', '{\"role\":null,\"collection\":\"chat_bot\",\"action\":\"delete\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', NULL, NULL),
(43, 45, 'directus_permissions', '8', '{\"role\":null,\"collection\":\"chat_bot\",\"action\":\"update\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', '{\"role\":null,\"collection\":\"chat_bot\",\"action\":\"update\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', NULL, NULL),
(44, 44, 'directus_permissions', '10', '{\"role\":null,\"collection\":\"chat_bot\",\"action\":\"share\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', '{\"role\":null,\"collection\":\"chat_bot\",\"action\":\"share\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', NULL, NULL),
(45, 46, 'directus_permissions', '11', '{\"role\":null,\"collection\":\"tasks\",\"action\":\"create\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', '{\"role\":null,\"collection\":\"tasks\",\"action\":\"create\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', NULL, NULL),
(46, 48, 'directus_permissions', '13', '{\"role\":null,\"collection\":\"tasks\",\"action\":\"update\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', '{\"role\":null,\"collection\":\"tasks\",\"action\":\"update\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', NULL, NULL),
(47, 47, 'directus_permissions', '12', '{\"role\":null,\"collection\":\"tasks\",\"action\":\"read\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', '{\"role\":null,\"collection\":\"tasks\",\"action\":\"read\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', NULL, NULL),
(48, 49, 'directus_permissions', '14', '{\"role\":null,\"collection\":\"tasks\",\"action\":\"delete\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', '{\"role\":null,\"collection\":\"tasks\",\"action\":\"delete\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', NULL, NULL),
(49, 50, 'directus_permissions', '15', '{\"role\":null,\"collection\":\"tasks\",\"action\":\"share\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', '{\"role\":null,\"collection\":\"tasks\",\"action\":\"share\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', NULL, NULL),
(50, 51, 'directus_fields', '5', '{\"id\":5,\"collection\":\"chat_bot\",\"field\":\"date_created\",\"special\":[\"date-created\"],\"interface\":\"datetime\",\"options\":null,\"display\":\"datetime\",\"display_options\":{\"relative\":true},\"readonly\":true,\"hidden\":true,\"sort\":5,\"width\":\"half\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null,\"validation\":null,\"validation_message\":null}', '{\"collection\":\"chat_bot\",\"field\":\"date_created\",\"special\":[\"date-created\"],\"interface\":\"datetime\",\"options\":null,\"display\":\"datetime\",\"display_options\":{\"relative\":true},\"readonly\":true,\"hidden\":true,\"sort\":5,\"width\":\"half\",\"translations\":null,\"note\":null,\"conditions\":null,\"required\":false,\"group\":null,\"validation\":null,\"validation_message\":null}', NULL, NULL),
(51, 53, 'directus_fields', '29', '{\"sort\":1,\"hidden\":true,\"interface\":\"input\",\"readonly\":true,\"field\":\"id\",\"collection\":\"chat_bot\"}', '{\"sort\":1,\"hidden\":true,\"interface\":\"input\",\"readonly\":true,\"field\":\"id\",\"collection\":\"chat_bot\"}', NULL, NULL),
(52, 54, 'directus_fields', '30', '{\"sort\":2,\"width\":\"full\",\"options\":{\"choices\":[{\"text\":\"$t:published\",\"value\":\"published\"},{\"text\":\"$t:draft\",\"value\":\"draft\"},{\"text\":\"$t:archived\",\"value\":\"archived\"}]},\"interface\":\"select-dropdown\",\"display\":\"labels\",\"display_options\":{\"showAsDot\":true,\"choices\":[{\"text\":\"$t:published\",\"value\":\"published\",\"foreground\":\"#FFFFFF\",\"background\":\"var(--theme--primary)\"},{\"text\":\"$t:draft\",\"value\":\"draft\",\"foreground\":\"#18222F\",\"background\":\"#D3DAE4\"},{\"text\":\"$t:archived\",\"value\":\"archived\",\"foreground\":\"#FFFFFF\",\"background\":\"var(--theme--warning)\"}]},\"field\":\"status\",\"collection\":\"chat_bot\"}', '{\"sort\":2,\"width\":\"full\",\"options\":{\"choices\":[{\"text\":\"$t:published\",\"value\":\"published\"},{\"text\":\"$t:draft\",\"value\":\"draft\"},{\"text\":\"$t:archived\",\"value\":\"archived\"}]},\"interface\":\"select-dropdown\",\"display\":\"labels\",\"display_options\":{\"showAsDot\":true,\"choices\":[{\"text\":\"$t:published\",\"value\":\"published\",\"foreground\":\"#FFFFFF\",\"background\":\"var(--theme--primary)\"},{\"text\":\"$t:draft\",\"value\":\"draft\",\"foreground\":\"#18222F\",\"background\":\"#D3DAE4\"},{\"text\":\"$t:archived\",\"value\":\"archived\",\"foreground\":\"#FFFFFF\",\"background\":\"var(--theme--warning)\"}]},\"field\":\"status\",\"collection\":\"chat_bot\"}', NULL, NULL),
(53, 55, 'directus_fields', '31', '{\"sort\":3,\"interface\":\"input\",\"hidden\":true,\"field\":\"sort\",\"collection\":\"chat_bot\"}', '{\"sort\":3,\"interface\":\"input\",\"hidden\":true,\"field\":\"sort\",\"collection\":\"chat_bot\"}', NULL, NULL),
(54, 56, 'directus_fields', '32', '{\"sort\":4,\"special\":[\"user-created\"],\"interface\":\"select-dropdown-m2o\",\"options\":{\"template\":\"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"},\"display\":\"user\",\"readonly\":true,\"hidden\":true,\"width\":\"half\",\"field\":\"user_created\",\"collection\":\"chat_bot\"}', '{\"sort\":4,\"special\":[\"user-created\"],\"interface\":\"select-dropdown-m2o\",\"options\":{\"template\":\"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"},\"display\":\"user\",\"readonly\":true,\"hidden\":true,\"width\":\"half\",\"field\":\"user_created\",\"collection\":\"chat_bot\"}', NULL, NULL),
(55, 57, 'directus_fields', '33', '{\"sort\":5,\"special\":[\"date-created\"],\"interface\":\"datetime\",\"readonly\":true,\"hidden\":true,\"width\":\"half\",\"display\":\"datetime\",\"display_options\":{\"relative\":true},\"field\":\"date_created\",\"collection\":\"chat_bot\"}', '{\"sort\":5,\"special\":[\"date-created\"],\"interface\":\"datetime\",\"readonly\":true,\"hidden\":true,\"width\":\"half\",\"display\":\"datetime\",\"display_options\":{\"relative\":true},\"field\":\"date_created\",\"collection\":\"chat_bot\"}', NULL, NULL),
(56, 58, 'directus_fields', '34', '{\"sort\":6,\"special\":[\"user-updated\"],\"interface\":\"select-dropdown-m2o\",\"options\":{\"template\":\"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"},\"display\":\"user\",\"readonly\":true,\"hidden\":true,\"width\":\"half\",\"field\":\"user_updated\",\"collection\":\"chat_bot\"}', '{\"sort\":6,\"special\":[\"user-updated\"],\"interface\":\"select-dropdown-m2o\",\"options\":{\"template\":\"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"},\"display\":\"user\",\"readonly\":true,\"hidden\":true,\"width\":\"half\",\"field\":\"user_updated\",\"collection\":\"chat_bot\"}', NULL, NULL),
(57, 59, 'directus_fields', '35', '{\"sort\":7,\"special\":[\"date-updated\"],\"interface\":\"datetime\",\"readonly\":true,\"hidden\":true,\"width\":\"half\",\"display\":\"datetime\",\"display_options\":{\"relative\":true},\"field\":\"date_updated\",\"collection\":\"chat_bot\"}', '{\"sort\":7,\"special\":[\"date-updated\"],\"interface\":\"datetime\",\"readonly\":true,\"hidden\":true,\"width\":\"half\",\"display\":\"datetime\",\"display_options\":{\"relative\":true},\"field\":\"date_updated\",\"collection\":\"chat_bot\"}', NULL, NULL),
(58, 60, 'directus_collections', 'chat_bot', '{\"sort_field\":\"sort\",\"archive_field\":\"status\",\"archive_value\":\"archived\",\"unarchive_value\":\"draft\",\"singleton\":false,\"collection\":\"chat_bot\"}', '{\"sort_field\":\"sort\",\"archive_field\":\"status\",\"archive_value\":\"archived\",\"unarchive_value\":\"draft\",\"singleton\":false,\"collection\":\"chat_bot\"}', NULL, NULL),
(59, 61, 'directus_fields', '36', '{\"sort\":8,\"interface\":\"input\",\"special\":null,\"collection\":\"chat_bot\",\"field\":\"request_text\"}', '{\"sort\":8,\"interface\":\"input\",\"special\":null,\"collection\":\"chat_bot\",\"field\":\"request_text\"}', NULL, NULL),
(60, 62, 'directus_fields', '37', '{\"sort\":9,\"interface\":\"input\",\"special\":null,\"collection\":\"chat_bot\",\"field\":\"response_text\"}', '{\"sort\":9,\"interface\":\"input\",\"special\":null,\"collection\":\"chat_bot\",\"field\":\"response_text\"}', NULL, NULL),
(61, 63, 'directus_fields', '38', '{\"sort\":10,\"interface\":\"input\",\"special\":null,\"collection\":\"chat_bot\",\"field\":\"timestamp\"}', '{\"sort\":10,\"interface\":\"input\",\"special\":null,\"collection\":\"chat_bot\",\"field\":\"timestamp\"}', NULL, NULL),
(62, 64, 'directus_collections', 'chat_bot', '{\"collection\":\"chat_bot\",\"icon\":null,\"note\":null,\"display_template\":null,\"hidden\":false,\"singleton\":false,\"translations\":null,\"archive_field\":null,\"archive_app_filter\":true,\"archive_value\":\"archived\",\"unarchive_value\":\"draft\",\"sort_field\":null,\"accountability\":\"all\",\"color\":null,\"item_duplication_fields\":null,\"sort\":null,\"group\":null,\"collapse\":\"open\",\"preview_url\":null,\"versioning\":false}', '{\"archive_field\":null,\"sort_field\":null}', NULL, NULL),
(63, 65, 'directus_permissions', '16', '{\"role\":null,\"collection\":\"chat_bot\",\"action\":\"create\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', '{\"role\":null,\"collection\":\"chat_bot\",\"action\":\"create\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', NULL, NULL),
(64, 66, 'directus_permissions', '17', '{\"role\":null,\"collection\":\"chat_bot\",\"action\":\"read\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', '{\"role\":null,\"collection\":\"chat_bot\",\"action\":\"read\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', NULL, NULL),
(65, 67, 'directus_permissions', '18', '{\"role\":null,\"collection\":\"chat_bot\",\"action\":\"update\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', '{\"role\":null,\"collection\":\"chat_bot\",\"action\":\"update\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', NULL, NULL),
(66, 68, 'directus_permissions', '19', '{\"role\":null,\"collection\":\"chat_bot\",\"action\":\"delete\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', '{\"role\":null,\"collection\":\"chat_bot\",\"action\":\"delete\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', NULL, NULL),
(67, 69, 'directus_permissions', '20', '{\"role\":null,\"collection\":\"chat_bot\",\"action\":\"share\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', '{\"role\":null,\"collection\":\"chat_bot\",\"action\":\"share\",\"fields\":[\"*\"],\"permissions\":{},\"validation\":{}}', NULL, NULL),
(68, 70, 'chat_bot', '1', '{\"request_text\":\"Hi\",\"response_text\":\"Hello there\",\"timestamp\":1123343}', '{\"request_text\":\"Hi\",\"response_text\":\"Hello there\",\"timestamp\":1123343}', NULL, NULL),
(69, 71, 'books', '1', '{\"title\":\"Harry Potter\",\"author\":\"J.K. Rowling\",\"published_year\":\"2000\"}', '{\"title\":\"Harry Potter\",\"author\":\"J.K. Rowling\",\"published_year\":\"2000\"}', NULL, NULL),
(70, 72, 'books', '2', '{\"title\":\"Harry Potter\",\"author\":\"J.K. Rowling\",\"published_year\":\"2000\"}', '{\"title\":\"Harry Potter\",\"author\":\"J.K. Rowling\",\"published_year\":\"2000\"}', NULL, NULL),
(71, 73, 'chat_bot', '2', '{\"request_text\":\"Hello\",\"response_text\":\"Hello there\",\"timestamp\":\"1704994421\"}', '{\"request_text\":\"Hello\",\"response_text\":\"Hello there\",\"timestamp\":\"1704994421\"}', NULL, NULL),
(72, 74, 'chat_bot', '3', '{\"queryText\":\"Hello\",\"sessionId\":\"my-session\",\"languageCode\":\"US\",\"request_text\":\"Hello\",\"response_text\":\"Thanks, Hello, How old are you please?\",\"timestamp\":1704994923966}', '{\"queryText\":\"Hello\",\"sessionId\":\"my-session\",\"languageCode\":\"US\",\"request_text\":\"Hello\",\"response_text\":\"Thanks, Hello, How old are you please?\",\"timestamp\":1704994923966}', NULL, NULL),
(73, 75, 'chat_bot', '4', '{\"queryText\":\"hi\",\"sessionId\":\"my-session\",\"languageCode\":\"US\",\"request_text\":\"hi\",\"response_text\":\"Thanks, hi, How old are you please?\",\"timestamp\":1704995042473}', '{\"queryText\":\"hi\",\"sessionId\":\"my-session\",\"languageCode\":\"US\",\"request_text\":\"hi\",\"response_text\":\"Thanks, hi, How old are you please?\",\"timestamp\":1704995042473}', NULL, NULL),
(74, 76, 'chat_bot', '5', '{\"queryText\":\"hi\",\"sessionId\":\"my-sessions\",\"languageCode\":\"US\",\"request_text\":\"hi\",\"response_text\":\"Hello, What is your name?\",\"timestamp\":1704995060489}', '{\"queryText\":\"hi\",\"sessionId\":\"my-sessions\",\"languageCode\":\"US\",\"request_text\":\"hi\",\"response_text\":\"Hello, What is your name?\",\"timestamp\":1704995060489}', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `directus_roles`
--

CREATE TABLE `directus_roles` (
  `id` char(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `icon` varchar(30) NOT NULL DEFAULT 'supervised_user_circle',
  `description` text DEFAULT NULL,
  `ip_access` text DEFAULT NULL,
  `enforce_tfa` tinyint(1) NOT NULL DEFAULT 0,
  `admin_access` tinyint(1) NOT NULL DEFAULT 0,
  `app_access` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `directus_roles`
--

INSERT INTO `directus_roles` (`id`, `name`, `icon`, `description`, `ip_access`, `enforce_tfa`, `admin_access`, `app_access`) VALUES
('d62730fb-a0cc-4a12-a54c-f509b4200e34', 'Administrator', 'verified', '$t:admin_description', NULL, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `directus_sessions`
--

CREATE TABLE `directus_sessions` (
  `token` varchar(64) NOT NULL,
  `user` char(36) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ip` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `share` char(36) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `directus_sessions`
--

INSERT INTO `directus_sessions` (`token`, `user`, `expires`, `ip`, `user_agent`, `share`, `origin`) VALUES
('WRP3jlDd5GKXlshswoN7QNNX2bNQ6NrOWAcGsXY1h-qEYVJFGufCpsbXj1cLd0A-', '0b504e2b-41af-4b99-bc48-567804c03766', '2024-01-19 16:08:44', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', NULL, 'http://0.0.0.0:8055');

-- --------------------------------------------------------

--
-- Table structure for table `directus_settings`
--

CREATE TABLE `directus_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `project_name` varchar(100) NOT NULL DEFAULT 'Directus',
  `project_url` varchar(255) DEFAULT NULL,
  `project_color` varchar(255) NOT NULL DEFAULT '#6644FF',
  `project_logo` char(36) DEFAULT NULL,
  `public_foreground` char(36) DEFAULT NULL,
  `public_background` char(36) DEFAULT NULL,
  `public_note` text DEFAULT NULL,
  `auth_login_attempts` int(10) UNSIGNED DEFAULT 25,
  `auth_password_policy` varchar(100) DEFAULT NULL,
  `storage_asset_transform` varchar(7) DEFAULT 'all',
  `storage_asset_presets` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`storage_asset_presets`)),
  `custom_css` text DEFAULT NULL,
  `storage_default_folder` char(36) DEFAULT NULL,
  `basemaps` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`basemaps`)),
  `mapbox_key` varchar(255) DEFAULT NULL,
  `module_bar` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`module_bar`)),
  `project_descriptor` varchar(100) DEFAULT NULL,
  `default_language` varchar(255) NOT NULL DEFAULT 'en-US',
  `custom_aspect_ratios` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`custom_aspect_ratios`)),
  `public_favicon` char(36) DEFAULT NULL,
  `default_appearance` varchar(255) NOT NULL DEFAULT 'auto',
  `default_theme_light` varchar(255) DEFAULT NULL,
  `theme_light_overrides` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`theme_light_overrides`)),
  `default_theme_dark` varchar(255) DEFAULT NULL,
  `theme_dark_overrides` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`theme_dark_overrides`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `directus_shares`
--

CREATE TABLE `directus_shares` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `collection` varchar(64) NOT NULL,
  `item` varchar(255) NOT NULL,
  `role` char(36) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_created` char(36) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_start` timestamp NULL DEFAULT NULL,
  `date_end` timestamp NULL DEFAULT NULL,
  `times_used` int(11) DEFAULT 0,
  `max_uses` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `directus_translations`
--

CREATE TABLE `directus_translations` (
  `id` char(36) NOT NULL,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `directus_users`
--

CREATE TABLE `directus_users` (
  `id` char(36) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags`)),
  `avatar` char(36) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `tfa_secret` varchar(255) DEFAULT NULL,
  `status` varchar(16) NOT NULL DEFAULT 'active',
  `role` char(36) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `last_access` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_page` varchar(255) DEFAULT NULL,
  `provider` varchar(128) NOT NULL DEFAULT 'default',
  `external_identifier` varchar(255) DEFAULT NULL,
  `auth_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`auth_data`)),
  `email_notifications` tinyint(1) DEFAULT 1,
  `appearance` varchar(255) DEFAULT NULL,
  `theme_dark` varchar(255) DEFAULT NULL,
  `theme_light` varchar(255) DEFAULT NULL,
  `theme_light_overrides` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`theme_light_overrides`)),
  `theme_dark_overrides` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`theme_dark_overrides`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `directus_users`
--

INSERT INTO `directus_users` (`id`, `first_name`, `last_name`, `email`, `password`, `location`, `title`, `description`, `tags`, `avatar`, `language`, `tfa_secret`, `status`, `role`, `token`, `last_access`, `last_page`, `provider`, `external_identifier`, `auth_data`, `email_notifications`, `appearance`, `theme_dark`, `theme_light`, `theme_light_overrides`, `theme_dark_overrides`) VALUES
('0b504e2b-41af-4b99-bc48-567804c03766', 'Admin', 'User', 'dersokalkidan@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$M8L3ZYweK4JoaGTbPkFoDQ$fR+fWynn572M3NoR8IKotlPoTKvGUeCkqKuEMQwAaF8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 'd62730fb-a0cc-4a12-a54c-f509b4200e34', NULL, '2024-01-12 16:08:44', '/content/chat_bot', 'default', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `directus_versions`
--

CREATE TABLE `directus_versions` (
  `id` char(36) NOT NULL,
  `key` varchar(64) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `collection` varchar(64) NOT NULL,
  `item` varchar(255) NOT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_created` char(36) DEFAULT NULL,
  `user_updated` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `directus_webhooks`
--

CREATE TABLE `directus_webhooks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `method` varchar(10) NOT NULL DEFAULT 'POST',
  `url` varchar(255) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'active',
  `data` tinyint(1) NOT NULL DEFAULT 1,
  `actions` varchar(100) NOT NULL,
  `collections` varchar(255) NOT NULL,
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`headers`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'draft',
  `sort` int(11) DEFAULT NULL,
  `user_created` char(36) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT NULL,
  `user_updated` char(36) DEFAULT NULL,
  `date_updated` timestamp NULL DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `desciption` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `books_user_created_foreign` (`user_created`),
  ADD KEY `books_user_updated_foreign` (`user_updated`);

--
-- Indexes for table `chat_bot`
--
ALTER TABLE `chat_bot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_bot_user_created_foreign` (`user_created`),
  ADD KEY `chat_bot_user_updated_foreign` (`user_updated`);

--
-- Indexes for table `directus_activity`
--
ALTER TABLE `directus_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_activity_collection_foreign` (`collection`);

--
-- Indexes for table `directus_collections`
--
ALTER TABLE `directus_collections`
  ADD PRIMARY KEY (`collection`),
  ADD KEY `directus_collections_group_foreign` (`group`);

--
-- Indexes for table `directus_dashboards`
--
ALTER TABLE `directus_dashboards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_dashboards_user_created_foreign` (`user_created`);

--
-- Indexes for table `directus_extensions`
--
ALTER TABLE `directus_extensions`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `directus_fields`
--
ALTER TABLE `directus_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_fields_collection_foreign` (`collection`);

--
-- Indexes for table `directus_files`
--
ALTER TABLE `directus_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_files_uploaded_by_foreign` (`uploaded_by`),
  ADD KEY `directus_files_modified_by_foreign` (`modified_by`),
  ADD KEY `directus_files_folder_foreign` (`folder`);

--
-- Indexes for table `directus_flows`
--
ALTER TABLE `directus_flows`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `directus_flows_operation_unique` (`operation`),
  ADD KEY `directus_flows_user_created_foreign` (`user_created`);

--
-- Indexes for table `directus_folders`
--
ALTER TABLE `directus_folders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_folders_parent_foreign` (`parent`);

--
-- Indexes for table `directus_migrations`
--
ALTER TABLE `directus_migrations`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `directus_notifications`
--
ALTER TABLE `directus_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_notifications_recipient_foreign` (`recipient`),
  ADD KEY `directus_notifications_sender_foreign` (`sender`);

--
-- Indexes for table `directus_operations`
--
ALTER TABLE `directus_operations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `directus_operations_resolve_unique` (`resolve`),
  ADD UNIQUE KEY `directus_operations_reject_unique` (`reject`),
  ADD KEY `directus_operations_flow_foreign` (`flow`),
  ADD KEY `directus_operations_user_created_foreign` (`user_created`);

--
-- Indexes for table `directus_panels`
--
ALTER TABLE `directus_panels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_panels_dashboard_foreign` (`dashboard`),
  ADD KEY `directus_panels_user_created_foreign` (`user_created`);

--
-- Indexes for table `directus_permissions`
--
ALTER TABLE `directus_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_permissions_collection_foreign` (`collection`),
  ADD KEY `directus_permissions_role_foreign` (`role`);

--
-- Indexes for table `directus_presets`
--
ALTER TABLE `directus_presets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_presets_collection_foreign` (`collection`),
  ADD KEY `directus_presets_user_foreign` (`user`),
  ADD KEY `directus_presets_role_foreign` (`role`);

--
-- Indexes for table `directus_relations`
--
ALTER TABLE `directus_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_relations_many_collection_foreign` (`many_collection`),
  ADD KEY `directus_relations_one_collection_foreign` (`one_collection`);

--
-- Indexes for table `directus_revisions`
--
ALTER TABLE `directus_revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_revisions_collection_foreign` (`collection`),
  ADD KEY `directus_revisions_parent_foreign` (`parent`),
  ADD KEY `directus_revisions_activity_foreign` (`activity`),
  ADD KEY `directus_revisions_version_foreign` (`version`);

--
-- Indexes for table `directus_roles`
--
ALTER TABLE `directus_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `directus_sessions`
--
ALTER TABLE `directus_sessions`
  ADD PRIMARY KEY (`token`),
  ADD KEY `directus_sessions_user_foreign` (`user`),
  ADD KEY `directus_sessions_share_foreign` (`share`);

--
-- Indexes for table `directus_settings`
--
ALTER TABLE `directus_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_settings_project_logo_foreign` (`project_logo`),
  ADD KEY `directus_settings_public_foreground_foreign` (`public_foreground`),
  ADD KEY `directus_settings_public_background_foreign` (`public_background`),
  ADD KEY `directus_settings_storage_default_folder_foreign` (`storage_default_folder`),
  ADD KEY `directus_settings_public_favicon_foreign` (`public_favicon`);

--
-- Indexes for table `directus_shares`
--
ALTER TABLE `directus_shares`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_shares_role_foreign` (`role`),
  ADD KEY `directus_shares_user_created_foreign` (`user_created`),
  ADD KEY `directus_shares_collection_foreign` (`collection`);

--
-- Indexes for table `directus_translations`
--
ALTER TABLE `directus_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `directus_users`
--
ALTER TABLE `directus_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `directus_users_external_identifier_unique` (`external_identifier`),
  ADD UNIQUE KEY `directus_users_email_unique` (`email`),
  ADD UNIQUE KEY `directus_users_token_unique` (`token`),
  ADD KEY `directus_users_role_foreign` (`role`);

--
-- Indexes for table `directus_versions`
--
ALTER TABLE `directus_versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_versions_collection_foreign` (`collection`),
  ADD KEY `directus_versions_user_created_foreign` (`user_created`),
  ADD KEY `directus_versions_user_updated_foreign` (`user_updated`);

--
-- Indexes for table `directus_webhooks`
--
ALTER TABLE `directus_webhooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_user_created_foreign` (`user_created`),
  ADD KEY `tasks_user_updated_foreign` (`user_updated`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chat_bot`
--
ALTER TABLE `chat_bot`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `directus_activity`
--
ALTER TABLE `directus_activity`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `directus_fields`
--
ALTER TABLE `directus_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `directus_notifications`
--
ALTER TABLE `directus_notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `directus_permissions`
--
ALTER TABLE `directus_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `directus_presets`
--
ALTER TABLE `directus_presets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `directus_relations`
--
ALTER TABLE `directus_relations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `directus_revisions`
--
ALTER TABLE `directus_revisions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `directus_settings`
--
ALTER TABLE `directus_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `directus_webhooks`
--
ALTER TABLE `directus_webhooks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`),
  ADD CONSTRAINT `books_user_updated_foreign` FOREIGN KEY (`user_updated`) REFERENCES `directus_users` (`id`);

--
-- Constraints for table `chat_bot`
--
ALTER TABLE `chat_bot`
  ADD CONSTRAINT `chat_bot_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`),
  ADD CONSTRAINT `chat_bot_user_updated_foreign` FOREIGN KEY (`user_updated`) REFERENCES `directus_users` (`id`);

--
-- Constraints for table `directus_collections`
--
ALTER TABLE `directus_collections`
  ADD CONSTRAINT `directus_collections_group_foreign` FOREIGN KEY (`group`) REFERENCES `directus_collections` (`collection`);

--
-- Constraints for table `directus_dashboards`
--
ALTER TABLE `directus_dashboards`
  ADD CONSTRAINT `directus_dashboards_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `directus_files`
--
ALTER TABLE `directus_files`
  ADD CONSTRAINT `directus_files_folder_foreign` FOREIGN KEY (`folder`) REFERENCES `directus_folders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `directus_files_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `directus_users` (`id`),
  ADD CONSTRAINT `directus_files_uploaded_by_foreign` FOREIGN KEY (`uploaded_by`) REFERENCES `directus_users` (`id`);

--
-- Constraints for table `directus_flows`
--
ALTER TABLE `directus_flows`
  ADD CONSTRAINT `directus_flows_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `directus_folders`
--
ALTER TABLE `directus_folders`
  ADD CONSTRAINT `directus_folders_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `directus_folders` (`id`);

--
-- Constraints for table `directus_notifications`
--
ALTER TABLE `directus_notifications`
  ADD CONSTRAINT `directus_notifications_recipient_foreign` FOREIGN KEY (`recipient`) REFERENCES `directus_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `directus_notifications_sender_foreign` FOREIGN KEY (`sender`) REFERENCES `directus_users` (`id`);

--
-- Constraints for table `directus_operations`
--
ALTER TABLE `directus_operations`
  ADD CONSTRAINT `directus_operations_flow_foreign` FOREIGN KEY (`flow`) REFERENCES `directus_flows` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `directus_operations_reject_foreign` FOREIGN KEY (`reject`) REFERENCES `directus_operations` (`id`),
  ADD CONSTRAINT `directus_operations_resolve_foreign` FOREIGN KEY (`resolve`) REFERENCES `directus_operations` (`id`),
  ADD CONSTRAINT `directus_operations_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `directus_panels`
--
ALTER TABLE `directus_panels`
  ADD CONSTRAINT `directus_panels_dashboard_foreign` FOREIGN KEY (`dashboard`) REFERENCES `directus_dashboards` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `directus_panels_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `directus_permissions`
--
ALTER TABLE `directus_permissions`
  ADD CONSTRAINT `directus_permissions_role_foreign` FOREIGN KEY (`role`) REFERENCES `directus_roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `directus_presets`
--
ALTER TABLE `directus_presets`
  ADD CONSTRAINT `directus_presets_role_foreign` FOREIGN KEY (`role`) REFERENCES `directus_roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `directus_presets_user_foreign` FOREIGN KEY (`user`) REFERENCES `directus_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `directus_revisions`
--
ALTER TABLE `directus_revisions`
  ADD CONSTRAINT `directus_revisions_activity_foreign` FOREIGN KEY (`activity`) REFERENCES `directus_activity` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `directus_revisions_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `directus_revisions` (`id`),
  ADD CONSTRAINT `directus_revisions_version_foreign` FOREIGN KEY (`version`) REFERENCES `directus_versions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `directus_sessions`
--
ALTER TABLE `directus_sessions`
  ADD CONSTRAINT `directus_sessions_share_foreign` FOREIGN KEY (`share`) REFERENCES `directus_shares` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `directus_sessions_user_foreign` FOREIGN KEY (`user`) REFERENCES `directus_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `directus_settings`
--
ALTER TABLE `directus_settings`
  ADD CONSTRAINT `directus_settings_project_logo_foreign` FOREIGN KEY (`project_logo`) REFERENCES `directus_files` (`id`),
  ADD CONSTRAINT `directus_settings_public_background_foreign` FOREIGN KEY (`public_background`) REFERENCES `directus_files` (`id`),
  ADD CONSTRAINT `directus_settings_public_favicon_foreign` FOREIGN KEY (`public_favicon`) REFERENCES `directus_files` (`id`),
  ADD CONSTRAINT `directus_settings_public_foreground_foreign` FOREIGN KEY (`public_foreground`) REFERENCES `directus_files` (`id`),
  ADD CONSTRAINT `directus_settings_storage_default_folder_foreign` FOREIGN KEY (`storage_default_folder`) REFERENCES `directus_folders` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `directus_shares`
--
ALTER TABLE `directus_shares`
  ADD CONSTRAINT `directus_shares_collection_foreign` FOREIGN KEY (`collection`) REFERENCES `directus_collections` (`collection`) ON DELETE CASCADE,
  ADD CONSTRAINT `directus_shares_role_foreign` FOREIGN KEY (`role`) REFERENCES `directus_roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `directus_shares_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `directus_users`
--
ALTER TABLE `directus_users`
  ADD CONSTRAINT `directus_users_role_foreign` FOREIGN KEY (`role`) REFERENCES `directus_roles` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `directus_versions`
--
ALTER TABLE `directus_versions`
  ADD CONSTRAINT `directus_versions_collection_foreign` FOREIGN KEY (`collection`) REFERENCES `directus_collections` (`collection`) ON DELETE CASCADE,
  ADD CONSTRAINT `directus_versions_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `directus_versions_user_updated_foreign` FOREIGN KEY (`user_updated`) REFERENCES `directus_users` (`id`);

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`),
  ADD CONSTRAINT `tasks_user_updated_foreign` FOREIGN KEY (`user_updated`) REFERENCES `directus_users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

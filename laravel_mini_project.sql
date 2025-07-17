-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 17, 2025 at 06:30 PM
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
-- Database: `laravel_mini_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `description`, `image`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Samsung', 'Leading Android smartphone brand', 'samsung.png', 1, '2025-06-01 01:37:32', '2025-06-04 12:43:05'),
(2, 'Apple', 'Premium iOS device manufacturer', 'apple.png', 1, '2025-06-01 01:38:41', '2025-06-01 01:38:41'),
(3, 'Xiaomi', 'Affordable performance phones', 'xiaomi.png', 1, '2025-06-01 01:39:54', '2025-06-01 01:39:54'),
(4, 'OnePlus', 'Flagship killer smartphones', 'one_plus.png', 1, '2025-06-01 01:40:53', '2025-06-01 01:40:53'),
(5, 'Realme', 'Budget-friendly Android phones', 'realme.png', 1, '2025-06-01 01:41:43', '2025-06-01 01:41:43'),
(6, 'Oppo', 'Innovative camera tech phones', 'oppo.png', 1, '2025-06-01 01:42:32', '2025-06-01 01:42:32'),
(7, 'Vivo', 'Youth-focused stylish phones', 'vivo.png', 1, '2025-06-01 01:44:49', '2025-06-01 01:44:49');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(24, 1, 10, 2, '2025-06-25 06:53:00', '2025-06-25 06:53:00');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `comment`, `created_at`, `updated_at`) VALUES
(1, 1, 'This is my product', '2025-06-04 09:58:15', '2025-06-04 10:19:52'),
(2, 3, 'Enter any feedback or message!', '2025-06-04 10:31:20', '2025-06-04 10:31:20'),
(3, 6, 'Hello', '2025-06-04 10:49:06', '2025-06-04 10:49:06'),
(4, 7, 'This is my order.', '2025-06-04 12:17:26', '2025-06-04 12:17:26'),
(5, 2, 'This is my order!', '2025-06-04 13:12:22', '2025-06-04 13:12:22');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `iso_code` char(2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `iso_code`, `created_at`, `updated_at`) VALUES
(1, 'Afghanistan', 'AF', NULL, NULL),
(2, 'Albania', 'AL', NULL, NULL),
(3, 'Algeria', 'DZ', NULL, NULL),
(4, 'Andorra', 'AD', NULL, NULL),
(5, 'Angola', 'AO', NULL, NULL),
(6, 'Antigua and Barbuda', 'AG', NULL, NULL),
(7, 'Argentina', 'AR', NULL, NULL),
(8, 'Armenia', 'AM', NULL, NULL),
(9, 'Australia', 'AU', NULL, NULL),
(10, 'Austria', 'AT', NULL, NULL),
(11, 'Azerbaijan', 'AZ', NULL, NULL),
(12, 'Bahamas', 'BS', NULL, NULL),
(13, 'Bahrain', 'BH', NULL, NULL),
(14, 'Bangladesh', 'BD', NULL, NULL),
(15, 'Barbados', 'BB', NULL, NULL),
(16, 'Belarus', 'BY', NULL, NULL),
(17, 'Belgium', 'BE', NULL, NULL),
(18, 'Belize', 'BZ', NULL, NULL),
(19, 'Benin', 'BJ', NULL, NULL),
(20, 'Bhutan', 'BT', NULL, NULL),
(21, 'Bolivia', 'BO', NULL, NULL),
(22, 'Bosnia and Herzegovina', 'BA', NULL, NULL),
(23, 'Botswana', 'BW', NULL, NULL),
(24, 'Brazil', 'BR', NULL, NULL),
(25, 'Brunei', 'BN', NULL, NULL),
(26, 'Bulgaria', 'BG', NULL, NULL),
(27, 'Burkina Faso', 'BF', NULL, NULL),
(28, 'Burundi', 'BI', NULL, NULL),
(29, 'Cabo Verde', 'CV', NULL, NULL),
(30, 'Cambodia', 'KH', NULL, NULL),
(31, 'Cameroon', 'CM', NULL, NULL),
(32, 'Canada', 'CA', NULL, NULL),
(33, 'Central African Republic', 'CF', NULL, NULL),
(34, 'Chad', 'TD', NULL, NULL),
(35, 'Chile', 'CL', NULL, NULL),
(36, 'China', 'CN', NULL, NULL),
(37, 'Colombia', 'CO', NULL, NULL),
(38, 'Comoros', 'KM', NULL, NULL),
(39, 'Congo (Congo-Brazzaville)', 'CG', NULL, NULL),
(40, 'Costa Rica', 'CR', NULL, NULL),
(41, 'Croatia', 'HR', NULL, NULL),
(42, 'Cuba', 'CU', NULL, NULL),
(43, 'Cyprus', 'CY', NULL, NULL),
(44, 'Czech Republic', 'CZ', NULL, NULL),
(45, 'Democratic Republic of the Congo', 'CD', NULL, NULL),
(46, 'Denmark', 'DK', NULL, NULL),
(47, 'Djibouti', 'DJ', NULL, NULL),
(48, 'Dominica', 'DM', NULL, NULL),
(49, 'Dominican Republic', 'DO', NULL, NULL),
(50, 'Ecuador', 'EC', NULL, NULL),
(51, 'Egypt', 'EG', NULL, NULL),
(52, 'El Salvador', 'SV', NULL, NULL),
(53, 'Equatorial Guinea', 'GQ', NULL, NULL),
(54, 'Eritrea', 'ER', NULL, NULL),
(55, 'Estonia', 'EE', NULL, NULL),
(56, 'Eswatini (fmr. \"Swaziland\")', 'SZ', NULL, NULL),
(57, 'Ethiopia', 'ET', NULL, NULL),
(58, 'Fiji', 'FJ', NULL, NULL),
(59, 'Finland', 'FI', NULL, NULL),
(60, 'France', 'FR', NULL, NULL),
(61, 'Gabon', 'GA', NULL, NULL),
(62, 'Gambia', 'GM', NULL, NULL),
(63, 'Georgia', 'GE', NULL, NULL),
(64, 'Germany', 'DE', NULL, NULL),
(65, 'Ghana', 'GH', NULL, NULL),
(66, 'Greece', 'GR', NULL, NULL),
(67, 'Grenada', 'GD', NULL, NULL),
(68, 'Guatemala', 'GT', NULL, NULL),
(69, 'Guinea', 'GN', NULL, NULL),
(70, 'Guinea-Bissau', 'GW', NULL, NULL),
(71, 'Guyana', 'GY', NULL, NULL),
(72, 'Haiti', 'HT', NULL, NULL),
(73, 'Honduras', 'HN', NULL, NULL),
(74, 'Hungary', 'HU', NULL, NULL),
(75, 'Iceland', 'IS', NULL, NULL),
(76, 'India', 'IN', NULL, NULL),
(77, 'Indonesia', 'ID', NULL, NULL),
(78, 'Iran', 'IR', NULL, NULL),
(79, 'Iraq', 'IQ', NULL, NULL),
(80, 'Ireland', 'IE', NULL, NULL),
(81, 'Israel', 'IL', NULL, NULL),
(82, 'Italy', 'IT', NULL, NULL),
(83, 'Jamaica', 'JM', NULL, NULL),
(84, 'Japan', 'JP', NULL, NULL),
(85, 'Jordan', 'JO', NULL, NULL),
(86, 'Kazakhstan', 'KZ', NULL, NULL),
(87, 'Kenya', 'KE', NULL, NULL),
(88, 'Kiribati', 'KI', NULL, NULL),
(89, 'Kuwait', 'KW', NULL, NULL),
(90, 'Kyrgyzstan', 'KG', NULL, NULL),
(91, 'Laos', 'LA', NULL, NULL),
(92, 'Latvia', 'LV', NULL, NULL),
(93, 'Lebanon', 'LB', NULL, NULL),
(94, 'Lesotho', 'LS', NULL, NULL),
(95, 'Liberia', 'LR', NULL, NULL),
(96, 'Libya', 'LY', NULL, NULL),
(97, 'Liechtenstein', 'LI', NULL, NULL),
(98, 'Lithuania', 'LT', NULL, NULL),
(99, 'Luxembourg', 'LU', NULL, NULL),
(100, 'Madagascar', 'MG', NULL, NULL),
(101, 'Malawi', 'MW', NULL, NULL),
(102, 'Malaysia', 'MY', NULL, NULL),
(103, 'Maldives', 'MV', NULL, NULL),
(104, 'Mali', 'ML', NULL, NULL),
(105, 'Malta', 'MT', NULL, NULL),
(106, 'Marshall Islands', 'MH', NULL, NULL),
(107, 'Mauritania', 'MR', NULL, NULL),
(108, 'Mauritius', 'MU', NULL, NULL),
(109, 'Mexico', 'MX', NULL, NULL),
(110, 'Micronesia', 'FM', NULL, NULL),
(111, 'Moldova', 'MD', NULL, NULL),
(112, 'Monaco', 'MC', NULL, NULL),
(113, 'Mongolia', 'MN', NULL, NULL),
(114, 'Montenegro', 'ME', NULL, NULL),
(115, 'Morocco', 'MA', NULL, NULL),
(116, 'Mozambique', 'MZ', NULL, NULL),
(117, 'Myanmar (formerly Burma)', 'MM', NULL, NULL),
(118, 'Namibia', 'NA', NULL, NULL),
(119, 'Nauru', 'NR', NULL, NULL),
(120, 'Nepal', 'NP', NULL, NULL),
(121, 'Netherlands', 'NL', NULL, NULL),
(122, 'New Zealand', 'NZ', NULL, NULL),
(123, 'Nicaragua', 'NI', NULL, NULL),
(124, 'Niger', 'NE', NULL, NULL),
(125, 'Nigeria', 'NG', NULL, NULL),
(126, 'North Korea', 'KP', NULL, NULL),
(127, 'North Macedonia', 'MK', NULL, NULL),
(128, 'Norway', 'NO', NULL, NULL),
(129, 'Oman', 'OM', NULL, NULL),
(130, 'Pakistan', 'PK', NULL, NULL),
(131, 'Palau', 'PW', NULL, NULL),
(132, 'Palestine State', 'PS', NULL, NULL),
(133, 'Panama', 'PA', NULL, NULL),
(134, 'Papua New Guinea', 'PG', NULL, NULL),
(135, 'Paraguay', 'PY', NULL, NULL),
(136, 'Peru', 'PE', NULL, NULL),
(137, 'Philippines', 'PH', NULL, NULL),
(138, 'Poland', 'PL', NULL, NULL),
(139, 'Portugal', 'PT', NULL, NULL),
(140, 'Qatar', 'QA', NULL, NULL),
(141, 'Romania', 'RO', NULL, NULL),
(142, 'Russia', 'RU', NULL, NULL),
(143, 'Rwanda', 'RW', NULL, NULL),
(144, 'Saint Kitts and Nevis', 'KN', NULL, NULL),
(145, 'Saint Lucia', 'LC', NULL, NULL),
(146, 'Saint Vincent and the Grenadines', 'VC', NULL, NULL),
(147, 'Samoa', 'WS', NULL, NULL),
(148, 'San Marino', 'SM', NULL, NULL),
(149, 'Sao Tome and Principe', 'ST', NULL, NULL),
(150, 'Saudi Arabia', 'SA', NULL, NULL),
(151, 'Senegal', 'SN', NULL, NULL),
(152, 'Serbia', 'RS', NULL, NULL),
(153, 'Seychelles', 'SC', NULL, NULL),
(154, 'Sierra Leone', 'SL', NULL, NULL),
(155, 'Singapore', 'SG', NULL, NULL),
(156, 'Slovakia', 'SK', NULL, NULL),
(157, 'Slovenia', 'SI', NULL, NULL),
(158, 'Solomon Islands', 'SB', NULL, NULL),
(159, 'Somalia', 'SO', NULL, NULL),
(160, 'South Africa', 'ZA', NULL, NULL),
(161, 'South Korea', 'KR', NULL, NULL),
(162, 'South Sudan', 'SS', NULL, NULL),
(163, 'Spain', 'ES', NULL, NULL),
(164, 'Sri Lanka', 'LK', NULL, NULL),
(165, 'Sudan', 'SD', NULL, NULL),
(166, 'Suriname', 'SR', NULL, NULL),
(167, 'Sweden', 'SE', NULL, NULL),
(168, 'Switzerland', 'CH', NULL, NULL),
(169, 'Syria', 'SY', NULL, NULL),
(170, 'Tajikistan', 'TJ', NULL, NULL),
(171, 'Tanzania', 'TZ', NULL, NULL),
(172, 'Thailand', 'TH', NULL, NULL),
(173, 'Timor-Leste', 'TL', NULL, NULL),
(174, 'Togo', 'TG', NULL, NULL),
(175, 'Tonga', 'TO', NULL, NULL),
(176, 'Trinidad and Tobago', 'TT', NULL, NULL),
(177, 'Tunisia', 'TN', NULL, NULL),
(178, 'Turkey', 'TR', NULL, NULL),
(179, 'Turkmenistan', 'TM', NULL, NULL),
(180, 'Tuvalu', 'TV', NULL, NULL),
(181, 'Uganda', 'UG', NULL, NULL),
(182, 'Ukraine', 'UA', NULL, NULL),
(183, 'United Arab Emirates', 'AE', NULL, NULL),
(184, 'United Kingdom', 'GB', NULL, NULL),
(185, 'United States of America', 'US', NULL, NULL),
(186, 'Uruguay', 'UY', NULL, NULL),
(187, 'Uzbekistan', 'UZ', NULL, NULL),
(188, 'Vanuatu', 'VU', NULL, NULL),
(189, 'Vatican City', 'VA', NULL, NULL),
(190, 'Venezuela', 'VE', NULL, NULL),
(191, 'Vietnam', 'VN', NULL, NULL),
(192, 'Yemen', 'YE', NULL, NULL),
(193, 'Zambia', 'ZM', NULL, NULL),
(194, 'Zimbabwe', 'ZW', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(3, 'default', '{\"uuid\":\"c3081429-fb51-441d-9315-fb36f7f8a6ab\",\"displayName\":\"App\\\\Jobs\\\\SendWelcomeEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendWelcomeEmail\",\"command\":\"O:25:\\\"App\\\\Jobs\\\\SendWelcomeEmail\\\":2:{s:7:\\\"\\u0000*\\u0000user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:8;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"\\u0000*\\u0000emailData\\\";a:6:{s:7:\\\"subject\\\";s:23:\\\"Welcome to Our Platform\\\";s:8:\\\"greeting\\\";s:18:\\\"Hello varun sharma\\\";s:4:\\\"body\\\";s:71:\\\"Thank you for registering with us. We are excited to have you on board!\\\";s:6:\\\"thanks\\\";s:36:\\\"Thank you for choosing our platform.\\\";s:10:\\\"actionText\\\";s:15:\\\"Visit Dashboard\\\";s:9:\\\"actionURL\\\";s:26:\\\"http:\\/\\/localhost\\/dashboard\\\";}}\"}}', 0, NULL, 1748493927, 1748493927),
(4, 'default', '{\"uuid\":\"eaa9c4b9-e193-440a-b4f8-154befae8206\",\"displayName\":\"App\\\\Jobs\\\\SendWelcomeEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendWelcomeEmail\",\"command\":\"O:25:\\\"App\\\\Jobs\\\\SendWelcomeEmail\\\":2:{s:7:\\\"\\u0000*\\u0000user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:8;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"\\u0000*\\u0000emailData\\\";a:6:{s:7:\\\"subject\\\";s:23:\\\"Welcome to Our Platform\\\";s:8:\\\"greeting\\\";s:18:\\\"Hello varun sharma\\\";s:4:\\\"body\\\";s:71:\\\"Thank you for registering with us. We are excited to have you on board!\\\";s:6:\\\"thanks\\\";s:36:\\\"Thank you for choosing our platform.\\\";s:10:\\\"actionText\\\";s:15:\\\"Visit Dashboard\\\";s:9:\\\"actionURL\\\";s:26:\\\"http:\\/\\/localhost\\/dashboard\\\";}}\"}}', 0, NULL, 1748493927, 1748493927),
(5, 'listener', '{\"uuid\":\"02cce889-393f-4364-a8c1-212c0088060f\",\"displayName\":\"App\\\\Listeners\\\\WelcomeEmailListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":20:{s:5:\\\"class\\\";s:34:\\\"App\\\\Listeners\\\\WelcomeEmailListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:23:\\\"App\\\\Events\\\\WelcomeEmail\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:9;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 0, NULL, 1748529364, 1748529364),
(6, 'listener', '{\"uuid\":\"b02758b3-839f-492f-b5a3-2ac9fe986c73\",\"displayName\":\"App\\\\Listeners\\\\WelcomeEmailListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":20:{s:5:\\\"class\\\";s:34:\\\"App\\\\Listeners\\\\WelcomeEmailListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:23:\\\"App\\\\Events\\\\WelcomeEmail\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:9;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 0, NULL, 1748529364, 1748529364),
(7, 'listener', '{\"uuid\":\"b9653b65-9853-4454-a0fd-276c3447ca53\",\"displayName\":\"App\\\\Listeners\\\\WelcomeEmailListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":20:{s:5:\\\"class\\\";s:34:\\\"App\\\\Listeners\\\\WelcomeEmailListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:23:\\\"App\\\\Events\\\\WelcomeEmail\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 0, NULL, 1748674974, 1748674974),
(8, 'listener', '{\"uuid\":\"02a64e00-2e18-4d07-a4cc-21fbfdd75b8d\",\"displayName\":\"App\\\\Listeners\\\\WelcomeEmailListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":20:{s:5:\\\"class\\\";s:34:\\\"App\\\\Listeners\\\\WelcomeEmailListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:23:\\\"App\\\\Events\\\\WelcomeEmail\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 0, NULL, 1748674974, 1748674974),
(9, 'listener', '{\"uuid\":\"fd8fa74a-5128-49ab-99c4-55129c2c264e\",\"displayName\":\"App\\\\Listeners\\\\WelcomeEmailListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":20:{s:5:\\\"class\\\";s:34:\\\"App\\\\Listeners\\\\WelcomeEmailListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:23:\\\"App\\\\Events\\\\WelcomeEmail\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 0, NULL, 1748675103, 1748675103),
(10, 'listener', '{\"uuid\":\"6fe3ba58-db3f-48cb-a1e9-6be2482456d0\",\"displayName\":\"App\\\\Listeners\\\\WelcomeEmailListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":20:{s:5:\\\"class\\\";s:34:\\\"App\\\\Listeners\\\\WelcomeEmailListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:23:\\\"App\\\\Events\\\\WelcomeEmail\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 0, NULL, 1748675103, 1748675103),
(11, 'listener', '{\"uuid\":\"0b88a3b2-204d-41d5-8dd8-7ba94ebc870f\",\"displayName\":\"App\\\\Listeners\\\\WelcomeEmailListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":20:{s:5:\\\"class\\\";s:34:\\\"App\\\\Listeners\\\\WelcomeEmailListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:23:\\\"App\\\\Events\\\\WelcomeEmail\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 0, NULL, 1749052648, 1749052648),
(12, 'listener', '{\"uuid\":\"a616da1a-ece0-4f34-9b5e-fba3cf6efaeb\",\"displayName\":\"App\\\\Listeners\\\\WelcomeEmailListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":20:{s:5:\\\"class\\\";s:34:\\\"App\\\\Listeners\\\\WelcomeEmailListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:23:\\\"App\\\\Events\\\\WelcomeEmail\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 0, NULL, 1749052648, 1749052648),
(13, 'listener', '{\"uuid\":\"4bb8d784-f63c-4e27-a0d3-c55f886b8a83\",\"displayName\":\"App\\\\Listeners\\\\WelcomeEmailListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":20:{s:5:\\\"class\\\";s:34:\\\"App\\\\Listeners\\\\WelcomeEmailListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:23:\\\"App\\\\Events\\\\WelcomeEmail\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 0, NULL, 1749053238, 1749053238),
(14, 'listener', '{\"uuid\":\"65df0ada-a14f-4f66-ab0c-aa460c91cda0\",\"displayName\":\"App\\\\Listeners\\\\WelcomeEmailListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":20:{s:5:\\\"class\\\";s:34:\\\"App\\\\Listeners\\\\WelcomeEmailListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:23:\\\"App\\\\Events\\\\WelcomeEmail\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 0, NULL, 1749053238, 1749053238),
(15, 'listener', '{\"uuid\":\"fdb9eafa-535b-4702-bfcf-1b3bf90c0202\",\"displayName\":\"App\\\\Listeners\\\\WelcomeEmailListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":20:{s:5:\\\"class\\\";s:34:\\\"App\\\\Listeners\\\\WelcomeEmailListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:23:\\\"App\\\\Events\\\\WelcomeEmail\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:5;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 0, NULL, 1749053621, 1749053621),
(16, 'listener', '{\"uuid\":\"b3eb8fb3-b6b6-448b-aede-d4d0128e8fba\",\"displayName\":\"App\\\\Listeners\\\\WelcomeEmailListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":20:{s:5:\\\"class\\\";s:34:\\\"App\\\\Listeners\\\\WelcomeEmailListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:23:\\\"App\\\\Events\\\\WelcomeEmail\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:5;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 0, NULL, 1749053621, 1749053621),
(17, 'listener', '{\"uuid\":\"ea26bc0c-efe4-4b3b-944c-75f097401a11\",\"displayName\":\"App\\\\Listeners\\\\WelcomeEmailListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":20:{s:5:\\\"class\\\";s:34:\\\"App\\\\Listeners\\\\WelcomeEmailListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:23:\\\"App\\\\Events\\\\WelcomeEmail\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 0, NULL, 1749053843, 1749053843),
(18, 'listener', '{\"uuid\":\"83d6583e-81e1-47c0-b187-2d914b405959\",\"displayName\":\"App\\\\Listeners\\\\WelcomeEmailListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":20:{s:5:\\\"class\\\";s:34:\\\"App\\\\Listeners\\\\WelcomeEmailListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:23:\\\"App\\\\Events\\\\WelcomeEmail\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 0, NULL, 1749053843, 1749053843),
(19, 'listener', '{\"uuid\":\"afb9cbe8-1ba6-402f-a275-949048ecc62c\",\"displayName\":\"App\\\\Listeners\\\\WelcomeEmailListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":20:{s:5:\\\"class\\\";s:34:\\\"App\\\\Listeners\\\\WelcomeEmailListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:23:\\\"App\\\\Events\\\\WelcomeEmail\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:7;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 0, NULL, 1749059101, 1749059101),
(20, 'listener', '{\"uuid\":\"0cedcf83-0707-41be-9449-abbe14d59561\",\"displayName\":\"App\\\\Listeners\\\\WelcomeEmailListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":20:{s:5:\\\"class\\\";s:34:\\\"App\\\\Listeners\\\\WelcomeEmailListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:23:\\\"App\\\\Events\\\\WelcomeEmail\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:7;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 0, NULL, 1749059101, 1749059101),
(21, 'listener', '{\"uuid\":\"da2f6fcf-7644-44b3-b729-5cfc25ce700c\",\"displayName\":\"App\\\\Listeners\\\\WelcomeEmailListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":20:{s:5:\\\"class\\\";s:34:\\\"App\\\\Listeners\\\\WelcomeEmailListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:23:\\\"App\\\\Events\\\\WelcomeEmail\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 0, NULL, 1749061290, 1749061290),
(22, 'listener', '{\"uuid\":\"5be1f182-967a-4469-98da-4a5733429f60\",\"displayName\":\"App\\\\Listeners\\\\WelcomeEmailListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":20:{s:5:\\\"class\\\";s:34:\\\"App\\\\Listeners\\\\WelcomeEmailListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:23:\\\"App\\\\Events\\\\WelcomeEmail\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 0, NULL, 1749061290, 1749061290),
(23, 'listener', '{\"uuid\":\"e7aef459-551c-4ef2-8e15-92c18ee6fe29\",\"displayName\":\"App\\\\Listeners\\\\WelcomeEmailListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":20:{s:5:\\\"class\\\";s:34:\\\"App\\\\Listeners\\\\WelcomeEmailListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:23:\\\"App\\\\Events\\\\WelcomeEmail\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 0, NULL, 1749062474, 1749062474),
(24, 'listener', '{\"uuid\":\"d92b3b53-cf94-4210-a92e-3ff5529fc7ad\",\"displayName\":\"App\\\\Listeners\\\\WelcomeEmailListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":20:{s:5:\\\"class\\\";s:34:\\\"App\\\\Listeners\\\\WelcomeEmailListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:23:\\\"App\\\\Events\\\\WelcomeEmail\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 0, NULL, 1749062474, 1749062474);

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lineitems`
--

CREATE TABLE `lineitems` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `total_price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lineitems`
--

INSERT INTO `lineitems` (`id`, `user_id`, `order_id`, `product_id`, `quantity`, `price`, `total_price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 3, 1, 12101, 12101, '2025-06-04 13:03:47', '2025-06-04 13:03:47'),
(2, 2, 2, 8, 2, 12677, 25354, '2025-06-04 13:12:31', '2025-06-04 13:12:31'),
(3, 1, 3, 13, 2, 12262, 24524, '2025-06-25 06:28:02', '2025-06-25 06:28:02'),
(4, 2, 4, 20, 1, 10036, 10036, '2025-06-25 06:56:04', '2025-06-25 06:56:04');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_05_23_184455_create_countries_table', 1),
(5, '2025_05_28_102136_add_is_active_column_in_users_table', 2),
(8, '2025_05_29_151957_create_brands_table', 3),
(9, '2025_05_30_070043_create_products_table', 4),
(11, '2025_05_30_151548_create_comments_table', 6),
(12, '2025_05_30_143510_create_carts_table', 7),
(13, '2025_05_31_115732_create_orders_table', 8),
(14, '2025_05_31_142545_create_lineitems_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `sub_total` double NOT NULL,
  `shipping` double NOT NULL,
  `tax_amount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `amount` double NOT NULL,
  `comment` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `sub_total`, `shipping`, `tax_amount`, `tax_rate`, `amount`, `comment`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 12101, 10, 1210, 10, 13321, 'This is my product', 'Delivered', '2025-06-04 13:03:47', '2025-06-04 13:19:15'),
(2, 2, 25354, 10, 2535, 10, 27899, 'This is my order!', 'Order Placed', '2025-06-04 13:12:31', '2025-06-04 13:12:31'),
(3, 1, 24524, 10, 2452, 10, 26986, 'This is my product', 'Order Placed', '2025-06-25 06:28:02', '2025-06-25 06:28:02'),
(4, 2, 10036, 10, 1004, 10, 11050, 'This is my order!', 'Order Placed', '2025-06-25 06:56:04', '2025-06-25 06:56:04');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `sale_price` double NOT NULL DEFAULT 0,
  `color` varchar(255) DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `product_code` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `function` varchar(255) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `sale_price`, `color`, `brand_id`, `product_code`, `gender`, `function`, `stock`, `description`, `image`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Samsung Phone', 94451, 28671, 'Beige', 2, 'BP-97366', 'children', 'Fast Charging', 20, 'Illum placeat natus deserunt rem itaque labore. Enim doloribus aut quia repellat. Quod commodi ex et corporis. Qui hic sint ut optio. Qui quaerat voluptas pariatur sed.', 'images/products/phone4.jpg', 0, '2025-06-01 02:06:17', '2025-06-04 12:43:35'),
(2, 'OnePlus Phone', 88722, 29656, 'Beige', 6, 'BP-17104', 'male', 'High Refresh Rate Display', 8, 'In doloremque nemo optio autem consequuntur eum fugit. Porro a ipsam exercitationem sequi. Mollitia enim debitis earum qui sint eveniet. Et qui doloremque et qui distinctio quis ea.', 'images/products/phone1.jpg', 1, '2025-06-01 02:06:17', '2025-06-01 02:06:17'),
(3, 'Oppo Phone', 23894, 12101, 'Black', 7, 'BP-37218', 'male', 'Dual SIM', 0, 'Beatae repellat quos dicta id quia. Totam velit minus perspiciatis eligendi doloribus aperiam eos. Quisquam ipsam saepe sint in.', 'images/products/phone4.jpg', 1, '2025-06-01 02:06:17', '2025-06-01 02:06:17'),
(4, 'Vivo Phone', 53931, 18974, 'Gold', 5, 'BP-39328', 'unisex', 'Dual SIM', 0, 'Quas aut ut perferendis iusto. Est quia quia fugiat. Harum voluptas sint tempore quia.', 'images/products/phone4.jpg', 0, '2025-06-01 02:06:17', '2025-06-01 02:06:17'),
(5, 'Oppo Phone', 72550, 25437, 'Silver', 3, 'BP-05268', 'male', 'Wireless Charging', 9, 'Et accusamus harum labore neque qui. Id ea quo impedit esse in numquam ut. Sit sed asperiores minus.', 'images/products/phone1.jpg', 1, '2025-06-01 02:06:17', '2025-06-01 02:06:17'),
(6, 'Realme Phone', 97651, 24817, 'Beige', 2, 'BP-95201', 'children', 'Fingerprint Sensor', 8, 'Voluptates dolor aut eaque tempore enim quia alias et. Quos quos sequi nam dolor aspernatur. Sint et odit dignissimos quidem.', 'images/products/phone1.jpg', 0, '2025-06-01 02:06:17', '2025-06-01 02:06:17'),
(7, 'Oppo Phone', 15586, 22541, 'Blue', 5, 'BP-86286', 'children', 'High Refresh Rate Display', 9, 'Reiciendis necessitatibus quisquam quaerat vel corrupti magni. Veritatis quas architecto enim. Laudantium quo repellat temporibus animi. Est unde vel porro iure.', 'images/products/phone1.jpg', 1, '2025-06-01 02:06:17', '2025-06-01 03:03:56'),
(8, 'OnePlus Phone', 84866, 12677, 'Blue', 6, 'BP-90403', 'male', 'AI Camera', 2, 'Sint quia dolorum aliquam non non magni. Neque aut molestiae possimus inventore laudantium ut. Et aperiam aut laudantium dignissimos expedita. Sit ipsam aut dolorum est accusamus.', 'images/products/_one_plus_phone.jpg', 0, '2025-06-01 02:06:17', '2025-06-04 09:54:52'),
(9, 'Samsung Phone', 26078, 10360, 'Rose Gold', 4, 'BP-27444', 'children', 'Water Resistant', 6, 'Ea ab totam illum. Dolore nihil perferendis quas aliquid. Eum itaque dolores ex praesentium.', 'images/products/phone5.jpg', 0, '2025-06-01 02:06:17', '2025-06-01 02:06:17'),
(10, 'Realme Phone', 63013, 18902, 'Rose Gold', 5, 'BP-39238', 'male', 'Dual SIM', 9, 'Aperiam voluptatum non molestiae corrupti. Voluptate pariatur quo quo voluptas et nemo. Doloribus soluta commodi nihil non in dolore eos. Numquam exercitationem amet dolores est eos.', 'images/products/_realme_phone.jpg', 0, '2025-06-01 02:06:17', '2025-06-04 09:55:40'),
(11, 'Xiaomi Phone', 54588, 14166, 'Black', 1, 'BP-34686', 'unisex', 'Face Unlock', 6, 'Fuga necessitatibus velit ipsum qui recusandae. Ratione tempore et harum laboriosam quae ut. Inventore dolorum et consequuntur commodi voluptatem id.', 'images/products/phone1.jpg', 0, '2025-06-01 02:06:17', '2025-06-01 02:06:17'),
(12, 'Samsung Phone', 51780, 27174, 'Rose Gold', 1, 'BP-94621', 'female', 'Dual SIM', 4, 'Enim voluptatem suscipit iste quod enim reprehenderit ullam. Sint omnis odit et. Esse corrupti sit quo ab.', 'images/products/phone1.jpg', 1, '2025-06-01 02:06:17', '2025-06-01 02:06:17'),
(13, 'Vivo Phone', 21330, 12262, 'Silver', 2, 'BP-07612', 'unisex', 'Wireless Charging', 9, 'Voluptate eos voluptas officiis et. Ut et autem nihil eius. Quia vel autem natus eveniet neque quo ab. Possimus omnis non quae quo.', 'images/products/phone1.jpg', 0, '2025-06-01 02:06:17', '2025-06-01 02:06:17'),
(14, 'OnePlus Phone', 88447, 22389, 'Black', 2, 'BP-48381', 'unisex', 'AI Camera', 9, 'Veniam veritatis odio sint facere nemo. Vitae est sunt magnam mollitia magni atque et. Consectetur vero explicabo et quos dignissimos vel qui.', 'images/products/phone1.jpg', 0, '2025-06-01 02:06:17', '2025-06-01 02:06:17'),
(15, 'Samsung Phone', 58016, 13650, 'Blue', 1, 'BP-12771', 'children', 'High Refresh Rate Display', 5, 'Repellat eum saepe qui ipsam distinctio eos beatae. Iure corporis voluptatem nemo nisi aspernatur rerum aperiam. Omnis provident in rem mollitia. Nisi aliquam veniam dolore sunt.', 'images/products/phone3.jpg', 1, '2025-06-01 02:06:17', '2025-06-01 02:06:17'),
(16, 'Oppo Phone', 99049, 9878, 'Blue', 3, 'BP-21613', 'children', 'Wireless Charging', 3, 'Sequi sapiente nobis architecto. Sint ut tempore delectus nobis et et repudiandae. Et quos harum dolores est dolorem voluptatem. Eos voluptatem aut voluptate aut vel adipisci.', 'images/products/phone1.jpg', 0, '2025-06-01 02:06:17', '2025-06-01 02:06:17'),
(17, 'Vivo Phone', 63837, 10716, 'Green', 2, 'BP-67984', 'female', 'AI Camera', 6, 'Voluptas sint dignissimos cum optio optio a quia. Non eligendi aut natus qui. Voluptatibus aut tenetur unde odit nihil dolorem.', 'images/products/phone1.jpg', 1, '2025-06-01 02:06:17', '2025-06-01 02:06:17'),
(18, 'Oppo Phone', 31667, 25961, 'Silver', 5, 'BP-08754', 'male', 'High Refresh Rate Display', 5, 'In possimus esse quia non rerum soluta necessitatibus ipsa. Ad rerum illum numquam eos. Ullam optio voluptatum et praesentium sint architecto officia. Natus provident dolor veniam.', 'images/products/phone3.jpg', 1, '2025-06-01 02:06:17', '2025-06-01 02:06:17'),
(19, 'Xiaomi Phone', 84206, 11995, 'Black', 5, 'BP-30022', 'children', 'Water Resistant', 9, 'Nam error velit est dolore illum natus. Aliquid quam aspernatur aliquid quia sapiente recusandae doloremque. Minima temporibus sint dolor ratione.', 'images/products/phone5.jpg', 1, '2025-06-01 02:06:17', '2025-06-01 02:06:17'),
(20, 'Oppo Phone', 77910, 10036, 'Green', 4, 'BP-00605', 'children', 'Fast Charging', 5, 'Est fuga quia distinctio at aut. Eum amet sit ut dolorem non. Tenetur et culpa at omnis.', 'images/products/phone1.jpg', 1, '2025-06-01 02:06:17', '2025-06-01 02:06:17'),
(21, 'Samsung Phone', 20000, 15000, 'red', 1, 'SS-001', 'male', 'Smart', 100, 'This is a Samsung new phone ....', 'samsung_phone.jpg', 1, '2025-06-04 13:17:59', '2025-06-04 13:17:59');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('VYtixICWnvgQysvIGq1tzQSOHp712oM1Q9o89Dme', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im5ldyI7YTowOnt9czozOiJvbGQiO2E6MDp7fX1zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czo4NjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2xpc3QtcHJvZHVjdD9icmFuZD0mY29sb3I9JmZ1bmN0aW9uPSZnZW5kZXI9bWFsZSZwcmljZT0mc29ydF9ieT0iO31zOjY6Il90b2tlbiI7czo0MDoiQnFaU0pZQlAxbjluQmEwdDkyb2Z2a2U1ajBnQXBPNVBVMWlBeElhNCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mjt9', 1750856039);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` tinytext NOT NULL DEFAULT '0',
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `address` text NOT NULL,
  `country` varchar(255) NOT NULL,
  `profile_image` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `fname`, `lname`, `email`, `email_verified_at`, `mobile`, `password`, `gender`, `address`, `country`, `profile_image`, `is_active`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '1', 'Tushar', 'sahu', 'tsamritsar@gmail.com', NULL, '7009378196', '$2y$12$.dIDUn9VWw8f3JCFb2ZZn.7vRLxavsKmW9EW1y/0CfhEQ8MC8PHta', 'Male', 'Tushar Address.', 'India', 'lv_222137791.png', 1, NULL, '2025-06-04 12:51:30', '2025-06-04 13:15:32'),
(2, '0', 'Nimish', 'Mehra', 'nimishmehra78@gmail.com', NULL, '7009511554', '$2y$12$Hch4D.qnUqp4NDKs4VaGMOE/EQlFTyTIqZJ/cRhE3.dxczPUKJ05.', 'Male', 'Nimish Address ...', 'India', 'lv_1846347900.jpg', 1, NULL, '2025-06-04 13:11:14', '2025-06-25 06:56:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `countries_iso_code_unique` (`iso_code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lineitems`
--
ALTER TABLE `lineitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `lineitems`
--
ALTER TABLE `lineitems`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

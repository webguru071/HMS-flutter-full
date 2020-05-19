-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 01, 2020 at 09:25 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id12527000_pharmasale`
--

-- --------------------------------------------------------

--
-- Table structure for table `activations`
--

CREATE TABLE `activations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activations`
--

INSERT INTO `activations` (`id`, `user_id`, `code`, `completed`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'FuMvGNX2PhHf2qxJJbCp1RsnXLDHf9aM', 1, '2020-03-04 07:50:48', '2020-03-04 07:50:48', '2020-03-04 07:50:48'),
(2, 2, 'gcguLJksKP0RFXYd65MALbxOZnAHS8DP', 1, '2020-03-04 07:50:48', '2020-03-04 07:50:48', '2020-03-04 07:50:48'),
(3, 3, 'lnWlKf8unio2goaYGDwYbAetr9ubZTr9', 1, '2020-03-04 07:50:48', '2020-03-04 07:50:48', '2020-03-04 07:50:48'),
(4, 4, 'aW8onaVlQ8jSXiNffhRt2GrWt1dNuYAE', 1, '2020-03-04 07:50:48', '2020-03-04 07:50:48', '2020-03-04 07:50:48'),
(5, 5, 'J0gxXRkbGvvmX9nOZY6MO38HsaTcwO16', 1, '2020-03-04 07:50:49', '2020-03-04 07:50:49', '2020-03-04 07:50:49'),
(6, 6, 'iyjvii0mofHiLD2d6nFBcTaZNKVBjpbN', 1, '2020-03-04 07:50:49', '2020-03-04 07:50:49', '2020-03-04 07:50:49'),
(7, 7, 'zPJpIhR6bghsfQnoscbtmkc3Qq46X3eB', 1, '2020-03-04 07:50:49', '2020-03-04 07:50:49', '2020-03-04 07:50:49'),
(8, 8, 'ZTA8NBvQJY5JrrdPCy9eSfqklruIK1hW', 1, '2020-03-04 07:50:49', '2020-03-04 07:50:49', '2020-03-04 07:50:49');

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance` decimal(8,2) DEFAULT 0.00,
  `status` enum('Active','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bank_accounts`
--

INSERT INTO `bank_accounts` (`id`, `bank_name`, `branch_name`, `account_number`, `account_name`, `balance`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Pubali Bank', 'Fram Gate, Dhaka', '5656586565', 'Shariful Islam', 20000.00, 'Active', '2020-03-04 07:50:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bank_transections`
--

CREATE TABLE `bank_transections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `bank_account_id` bigint(20) UNSIGNED NOT NULL,
  `trnsactionId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transection_type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkOrslip_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `status` enum('Active','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bed_charge_collections`
--

CREATE TABLE `bed_charge_collections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `invoice` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_total` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `grand_total` decimal(8,2) NOT NULL DEFAULT 0.00,
  `paid_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `due` decimal(8,2) NOT NULL DEFAULT 0.00,
  `advance` decimal(8,2) NOT NULL DEFAULT 0.00,
  `remark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bed_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `patient_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `admission_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `trans_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `status` enum('Active','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bed_charge_collection_items`
--

CREATE TABLE `bed_charge_collection_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `collection_date` date NOT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `bed_charge_collection_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `country`, `currency`, `code`, `symbol`) VALUES
(1, 'Albaniaa', 'Leke', 'ALL', 'Lek'),
(2, 'America', 'Dollars', 'USD', '$'),
(3, 'Afghanistan', 'Afghanis', 'AFN', '؋'),
(4, 'Argentina', 'Pesos', 'ARS', '$'),
(5, 'Aruba', 'Guilders', 'AWG', 'ƒ'),
(6, 'Australia', 'Dollars', 'AUD', '$'),
(7, 'Azerbaijan', 'New Manats', 'AZN', 'ман'),
(8, 'Bahamas', 'Dollars', 'BSD', '$'),
(9, 'Bangladesh', 'Taka', 'BDT', '৳'),
(10, 'Barbados', 'Dollars', 'BBD', '$'),
(11, 'Belarus', 'Rubles', 'BYR', 'p.'),
(12, 'Belgium', 'Euro', 'EUR', '€'),
(13, 'Beliz', 'Dollars', 'BZD', 'BZ$'),
(14, 'Bermuda', 'Dollars', 'BMD', '$'),
(15, 'Bolivia', 'Bolivianos', 'BOB', 'b$'),
(16, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM'),
(17, 'Botswana', 'Pula', 'BWP', 'P'),
(18, 'Bulgaria', 'Leva', 'BGN', 'лв'),
(19, 'Brazil', 'Reais', 'BRL', 'R$'),
(20, 'Britain (United Kingdom)', 'Pounds', 'GBP', '£'),
(21, 'Brunei Darussalam', 'Dollars', 'BND', '$'),
(22, 'Cambodia', 'Riels', 'KHR', '៛'),
(23, 'Canada', 'Dollars', 'CAD', '$'),
(24, 'Cayman Islands', 'Dollars', 'KYD', '$'),
(25, 'Chile', 'Pesos', 'CLP', '$'),
(26, 'China', 'Yuan Renminbi', 'CNY', '¥'),
(27, 'Colombia', 'Pesos', 'COP', '$'),
(28, 'Costa Rica', 'Colón', 'CRC', '₡'),
(29, 'Croatia', 'Kuna', 'HRK', 'kn'),
(30, 'Cuba', 'Pesos', 'CUP', '₱'),
(31, 'Cyprus', 'Euro', 'EUR', '€'),
(32, 'Czech Republic', 'Koruny', 'CZK', 'Kč'),
(33, 'Denmark', 'Kroner', 'DKK', 'kr'),
(34, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$'),
(35, 'East Caribbean', 'Dollars', 'XCD', '$'),
(36, 'Egypt', 'Pounds', 'EGP', '£'),
(37, 'El Salvador', 'Colones', 'SVC', '$'),
(38, 'England (United Kingdom)', 'Pounds', 'GBP', '£'),
(39, 'Euro', 'Euro', 'EUR', '€'),
(40, 'Falkland Islands', 'Pounds', 'FKP', '£'),
(41, 'Fiji', 'Dollars', 'FJD', '$'),
(42, 'France', 'Euro', 'EUR', '€'),
(43, 'Ghana', 'Cedis', 'GHC', '¢'),
(44, 'Gibraltar', 'Pounds', 'GIP', '£'),
(45, 'Greece', 'Euro', 'EUR', '€'),
(46, 'Guatemala', 'Quetzales', 'GTQ', 'Q'),
(47, 'Guernsey', 'Pounds', 'GGP', '£'),
(48, 'Guyana', 'Dollars', 'GYD', '$'),
(49, 'Holland (Netherlands)', 'Euro', 'EUR', '€'),
(50, 'Honduras', 'Lempiras', 'HNL', 'L'),
(51, 'Hong Kong', 'Dollars', 'HKD', '$'),
(52, 'Hungary', 'Forint', 'HUF', 'Ft'),
(53, 'Iceland', 'Kronur', 'ISK', 'kr'),
(54, 'India', 'Rupees', 'INR', 'Rp.'),
(55, 'Indonesia', 'Rupiahs', 'IDR', 'Rp.'),
(56, 'Iran', 'Rials', 'IRR', '﷼'),
(57, 'Ireland', 'Euro', 'EUR', '€'),
(58, 'Isle of Man', 'Pounds', 'IMP', '£'),
(59, 'Israel', 'New Shekels', 'ILS', '₪'),
(60, 'Italy', 'Euro', 'EUR', '€'),
(61, 'Jamaica', 'Dollars', 'JMD', 'J$'),
(62, 'Japan', 'Yen', 'JPY', '¥'),
(63, 'Jersey', 'Pounds', 'JEP', '£'),
(64, 'Kazakhstan', 'Tenge', 'KZT', 'лв'),
(65, 'Korea (North)', 'Won', 'KPW', '₩'),
(66, 'Korea (South)', 'Won', 'KRW', '₩'),
(67, 'Kyrgyzstan', 'Soms', 'KGS', 'лв'),
(68, 'Laos', 'Kips', 'LAK', '₭'),
(69, 'Latvia', 'Lati', 'LVL', 'Ls'),
(70, 'Lebanon', 'Pounds', 'LBP', '£'),
(71, 'Liberia', 'Dollars', 'LRD', '$'),
(72, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF'),
(73, 'Lithuania', 'Litai', 'LTL', 'Lt'),
(74, 'Luxembourg', 'Euro', 'EUR', '€'),
(75, 'Macedonia', 'Denars', 'MKD', 'ден'),
(76, 'Malaysia', 'Ringgits', 'MYR', 'RM'),
(77, 'Malta', 'Euro', 'EUR', '€'),
(78, 'Mauritius', 'Rupees', 'MUR', '₨'),
(79, 'Mexico', 'Pesos', 'MXN', '$'),
(80, 'Mongolia', 'Tugriks', 'MNT', '₮'),
(81, 'Mozambique', 'Meticais', 'MZN', 'MT'),
(82, 'Namibia', 'Dollars', 'NAD', '$'),
(83, 'Nepal', 'Rupees', 'NPR', '₨'),
(84, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ'),
(85, 'Netherlands', 'Euro', 'EUR', '€'),
(86, 'New Zealand', 'Dollars', 'NZD', '$'),
(87, 'Nicaragua', 'Cordobas', 'NIO', 'C$'),
(88, 'Nigeria', 'Nairas', 'NGN', '₦'),
(89, 'North Korea', 'Won', 'KPW', '₩'),
(90, 'Norway', 'Krone', 'NOK', 'kr'),
(91, 'Oman', 'Rials', 'OMR', '﷼'),
(92, 'Pakistan', 'Rupees', 'PKR', '₨'),
(93, 'Panama', 'Balboa', 'PAB', 'B/.'),
(94, 'Paraguay', 'Guarani', 'PYG', 'Gs'),
(95, 'Peru', 'Nuevos Soles', 'PEN', 'S/.'),
(96, 'Philippines', 'Pesos', 'PHP', 'Php'),
(97, 'Poland', 'Zlotych', 'PLN', 'zł'),
(98, 'Qatar', 'Rials', 'QAR', '﷼'),
(99, 'Romania', 'New Lei', 'RON', 'lei'),
(100, 'Russia', 'Rubles', 'RUB', 'руб'),
(101, 'Saint Helena', 'Pounds', 'SHP', '£'),
(102, 'Saudi Arabia', 'Riyals', 'SAR', '﷼'),
(103, 'Serbia', 'Dinars', 'RSD', 'Дин.'),
(104, 'Seychelles', 'Rupees', 'SCR', '₨'),
(105, 'Singapore', 'Dollars', 'SGD', '$'),
(106, 'Slovenia', 'Euro', 'EUR', '€'),
(107, 'Solomon Islands', 'Dollars', 'SBD', '$'),
(108, 'Somalia', 'Shillings', 'SOS', 'S'),
(109, 'South Africa', 'Rand', 'ZAR', 'R'),
(110, 'South Korea', 'Won', 'KRW', '₩'),
(111, 'Spain', 'Euro', 'EUR', '€'),
(112, 'Sri Lanka', 'Rupees', 'LKR', '₨'),
(113, 'Sweden', 'Kronor', 'SEK', 'kr'),
(114, 'Switzerland', 'Francs', 'CHF', 'CHF'),
(115, 'Suriname', 'Dollars', 'SRD', '$'),
(116, 'Syria', 'Pounds', 'SYP', '£'),
(117, 'Taiwan', 'New Dollars', 'TWD', 'NT$'),
(118, 'Thailand', 'Baht', 'THB', '฿'),
(119, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$'),
(120, 'Turkey', 'Lira', 'TRY', 'TL'),
(121, 'Turkey', 'Liras', 'TRL', '£'),
(122, 'Tuvalu', 'Dollars', 'TVD', '$'),
(123, 'Ukraine', 'Hryvnia', 'UAH', '₴'),
(124, 'United Kingdom', 'Pounds', 'GBP', '£'),
(125, 'United States of America', 'Dollars', 'USD', '$'),
(126, 'Uruguay', 'Pesos', 'UYU', 'U$'),
(127, 'Uzbekistan', 'Sums', 'UZS', 'лв'),
(128, 'Vatican City', 'Euro', 'EUR', '€'),
(129, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs'),
(130, 'Vietnam', 'Dong', 'VND', '₫'),
(131, 'Yemen', 'Rials', 'YER', '﷼'),
(132, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dep_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `dep_name`, `description`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'ENT Surgeon', '', 'Active', 1, '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(2, 'Gynaecologist', '', 'Active', 2, '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(3, 'Cardiologist', '', 'Active', 3, '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(4, 'Opthamology', '', 'Active', 4, '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(5, 'Dentist', '', 'Active', 5, '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(6, 'Skin Specialist', '', 'Active', 1, '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(7, 'Pediatric', '', 'Active', 2, '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(8, 'Orthopedic', '', 'Active', 3, '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(9, 'Psychiatry', '', 'Active', 4, '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(10, 'Genral Medicine', '', 'Active', 5, '2020-03-04 07:50:52', '2020-03-04 07:50:52');

-- --------------------------------------------------------

--
-- Table structure for table `diagon_bills`
--

CREATE TABLE `diagon_bills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `invoice` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivary_date` date NOT NULL,
  `delivary_time` time NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_percent` decimal(5,2) NOT NULL DEFAULT 0.00,
  `discount_overall` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_total` decimal(8,2) NOT NULL DEFAULT 0.00,
  `grand_total` decimal(8,2) NOT NULL DEFAULT 0.00,
  `paid_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `actual_paid_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `due` decimal(8,2) NOT NULL DEFAULT 0.00,
  `due_collection` decimal(8,2) NOT NULL DEFAULT 0.00,
  `change` decimal(8,2) NOT NULL DEFAULT 0.00,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `referral_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `patient_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `trans_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `status` enum('Active','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `diagon_bill_items`
--

CREATE TABLE `diagon_bill_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `bill_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `test_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `test_price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `patient_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `diagon_referral_payments`
--

CREATE TABLE `diagon_referral_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `referral_id` bigint(20) UNSIGNED NOT NULL,
  `trans_id` int(11) NOT NULL DEFAULT 0,
  `amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `diagon_test_categories`
--

CREATE TABLE `diagon_test_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission` double(5,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `diagon_test_categories`
--

INSERT INTO `diagon_test_categories` (`id`, `category`, `commission`, `created_at`, `updated_at`) VALUES
(1, 'Pathological Test', 10.00, '2020-03-04 07:50:51', NULL),
(2, 'Ultrasonography(2D Color)', 10.00, '2020-03-04 07:50:51', NULL),
(3, 'Ultrasonography(2D & Black & White)', 10.00, '2020-03-04 07:50:51', NULL),
(4, 'Digital X-RAY', 10.00, '2020-03-04 07:50:51', NULL),
(5, 'Digital Memography', 10.00, '2020-03-04 07:50:51', NULL),
(6, 'Computed Tomography', 10.00, '2020-03-04 07:50:51', NULL),
(7, 'Stool Examination', 10.00, '2020-03-04 07:50:51', NULL),
(8, 'Others Examination', 10.00, '2020-03-04 07:50:51', NULL),
(9, 'Normal X-RAY', 10.00, '2020-03-04 07:50:51', NULL),
(10, 'Pecial Examination', 10.00, '2020-03-04 07:50:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `diagon_test_lists`
--

CREATE TABLE `diagon_test_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `test_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `diagon_test_lists`
--

INSERT INTO `diagon_test_lists` (`id`, `name`, `price`, `count`, `test_category_id`, `created_at`, `updated_at`) VALUES
(1, 'Blood for TC OF WBC', 125, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(2, 'Blood for DC OF WBC', 125, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(3, 'ESR', 100, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(4, 'Blood for TC.DC HB ,ESR', 150, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(5, 'Blood for RBC Count', 150, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(6, 'Platelet Count', 200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(7, 'Blood for PCV', 200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(8, 'B.T.C.T', 150, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(9, 'Blood Film', 250, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(10, 'MP', 600, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(11, 'Blood for Reticulocyte Count', 200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(12, 'Blood for Circulating Edinophil Count(TCE)', 200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(13, 'Blood Grooping ', 100, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(14, 'Blood Bleeding Time(BT)', 200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(15, 'Blood Clooting Time(CT)', 200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(16, 'Serum Prothombin Time', 800, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(17, 'Aldehyde Test', 200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(18, 'Bone Marrow', 3000, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(19, 'Blood Cross Matching', 100, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(20, 'Fsting Blood Suger(FBS)', 100, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(21, 'TPHA', 300, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(22, 'RBS', 100, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(23, 'RA test', 300, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(24, 'Blood Suger(GTT)', 400, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(25, 'Blood Urea', 400, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(26, 'Creatinine', 300, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(27, 'Blood Urea Nitrogen(BUN)', 400, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(28, 'Creatinine Clearance Rate-CCR', 700, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(29, 'Serum Uric Acid', 700, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(30, 'Lipid Profile', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(31, 'Cholesterol', 250, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(32, 'Serum TG', 350, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(33, 'Serum HDL-Cholesterol', 350, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(34, 'Serum LDL-Cholesterol', 500, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(35, 'S.Billirubi(BOTH)', 300, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(36, 'S.Billirubin(TOTAL)', 200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(37, 'SGOT', 300, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(38, 'SGPT', 300, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(39, 'Serum Alkaline phosphates', 500, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(40, 'Serum peotein', 500, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(41, 'Serum Albumin', 500, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(42, 'Serum Total protien with A/G Ratio', 800, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(43, 'Serum C.P.K', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(44, 'Serum CK-MB', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(45, 'Serum L.D.H', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(46, 'Serum Amylase', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(47, 'Serum Acid phosphates', 1000, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(48, 'Serum Calcium', 700, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(49, 'Serum Phosphates', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(50, 'Serum Electrolytes(Na,K,CI,CO2)', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(51, 'Serum Lithium', 1000, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(52, 'HBAIC', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(53, 'D.Dimer', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(54, 'ASO ', 250, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(55, 'RA/RF', 400, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(56, 'CRP', 300, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(57, 'CRPTire', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(58, 'Rose walter Test', 600, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(59, 'Triple Antigen', 800, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(60, 'VDRL', 200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(61, 'T.P.H.A', 600, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(62, 'Widal Test', 300, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(63, 'HBS Ag Test', 350, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(64, 'HBS Ag (Elisa Method)', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(65, 'HBE Ag Test', 1000, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(66, 'Anti HBE (Toal)', 1000, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(67, 'Mantoux Test', 400, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(68, 'A.N.A', 1400, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(69, 'Hexagon TB', 700, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(70, 'Pregnancy Test', 200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(71, 'Anti DNA (Anti Ds DNA)', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(72, 'HIV Test', 500, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(73, 'Desngu Test', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(74, 'CF-for Filaria', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(75, 'CF-for kala zar', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(76, 'Urine p.t', 100, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(77, 'RH-Antibody Titry', 1400, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(78, 'H -Pylori (IGG)', 1000, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(79, 'Complements-C3', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(80, 'Complements-C4', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(81, 'Anti TB- IGA', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(82, 'Anti TB- IGG', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(83, 'Anti TB- IGM', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(84, 'Immunoglobulin IGA', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(85, 'Immunoglobulin IGE', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(86, 'Immunoglobulin IGG', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(87, 'Immunoglobulin IGM', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(88, 'Anti HBs(HBs ab)', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(89, 'HCV', 700, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(90, 'Blood for C/S', 1400, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(91, 'PUS for Gram Stam', 500, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(92, 'Sputum C/S', 700, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(93, 'Sputum Esonophil Count', 300, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(94, 'Sputum R/E', 300, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(95, 'Sputum A.F.B', 300, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(96, 'Throat Swab C/S', 700, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(97, 'Urethral Smear G.C (Collection Charge=100/=)', 500, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(98, 'Throat Swab Gram Stain', 500, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(99, 'P.S G/C (Collection Charge=100/=)', 500, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(100, 'Vaginal Swab C/S', 700, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(101, 'Vaginal Swab Gram Stain (Collection Charge=100/=)', 700, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(102, 'Eye Swab C/S', 700, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(103, ' C/E  COUNT', 200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(104, 'C.S.F for Cytology', 500, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(105, 'C.S.F for Biochemistry', 500, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(106, 'C.S.F for Maligment Cell', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(107, 'C.S.F for Gram Stain', 500, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(108, 'Pleural Fluid C/S', 700, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(109, 'Pleural Fluid Cytology', 500, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(110, 'Pleural Fluid Biochemistry', 500, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(111, 'Pleural Fluid Maligment Cell', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(112, 'Pleural Fluid Gram Stain', 500, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(113, 'Semen Analysis', 600, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(114, 'Skin Acraping Fungus (Collection Charge=100/=)', 500, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(115, 'Ascitic Fluid C/S (Collection Charge=100/=)', 700, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(116, 'Ascitic Fluid Cytology', 500, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(117, 'Ascitic Fluid Biochemistry', 500, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(118, 'PUS for C/S', 700, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(119, 'Ascitic Fluid Maligment Cell', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(120, 'Ascitic Fluid Gram Stain', 500, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(121, 'Synovioal Fluid C/S', 700, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(122, 'Synovioal Fluid Cytology', 500, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(123, 'Synovioal Fluid Biochemistry', 500, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(124, 'Synovioal Fluid Gram Stain', 500, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(125, 'Wound Swab For C/S', 700, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(126, 'T3,T4,TSH', 1500, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(127, 'Free-T3', 800, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(128, 'Free-T4', 800, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(129, 'Free-TSH', 800, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(130, 'LH', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(131, 'FSH', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(132, 'Estrogen', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(133, 'Progesterone', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(134, 'Prolactine', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(135, 'Testosterone', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(136, 'Cortisol (one Sample)', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(137, 'Alfa Fato Protein', 1400, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(138, 'Circinoma Embryonic Antigen (CEA)', 1400, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(139, 'Prostatic Antigen (PSA)', 1400, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(140, 'Seram Beta Heg', 1400, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(141, 'Urinary Beta Heg', 1400, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(142, 'CA-125', 1400, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(143, 'CA-15.3', 1400, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(144, 'CA-19.9', 1400, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(145, 'CA-242', 1400, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(146, 'Serum Tegretol level', 1400, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(147, 'Serum Cyclosorine level', 1400, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(148, 'Serum Gradenal level', 1400, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(149, 'Serum Parcetamol level', 1400, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(150, 'Cocaine Test(From Urine)', 1400, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(151, 'Troponin-1', 1400, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(152, 'Urine  R/E, ', 100, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(153, 'Urine for Suger', 100, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(154, 'Urine Protein/Albumin', 100, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(155, 'Urine Benz,Jones Protein', 200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(156, 'Urine Specific Gravity', 100, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(157, 'Urine Acetone', 100, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(158, 'Urine Bile Salts', 100, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(159, 'Urine Bile Pigment', 100, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(160, 'Urine Urobilinogen', 100, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(161, 'Urine Creatine', 300, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(162, 'Urine Pregnancy', 200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(163, 'Urine 24 HoursUrineTotal Protein', 800, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(164, 'Urine for Gram Stain', 500, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(165, 'S.Uric Acid', 300, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(166, 'Urine for C/S', 700, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(167, 'Urine Amylase', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(168, 'Stool R/E', 100, 0, 7, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(169, 'Stool O.B.T', 150, 0, 7, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(170, 'Stool R/s', 100, 0, 7, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(171, 'Stool Floating Method', 200, 0, 7, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(172, 'Stool Culture Sensitive C/S', 700, 0, 7, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(173, 'E.C.G (12 lead)', 400, 0, 8, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(174, 'Ecocardiography (B/W)', 1000, 0, 8, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(175, 'Ecocardiography (C)', 1500, 0, 8, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(176, 'Color Doppler Echo', 2500, 0, 8, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(177, 'Digital E.E.G', 3000, 0, 8, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(178, 'E.T.T', 3500, 0, 8, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(179, 'Endoscopy of Upper GI Tract (Normal)', 800, 0, 8, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(180, 'Video Endoscopy of Upper GI Tract', 1500, 0, 8, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(181, 'Video Clonoscopy (Without Medicine)', 5000, 0, 8, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(182, 'Normal Clolonoscopy (Without Medicine)', 3200, 0, 8, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(183, 'Endoscopy Biopsy(Taking)', 3000, 0, 8, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(184, 'Digital Both Brest', 2000, 0, 5, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(185, 'Digital Left Brest', 1000, 0, 5, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(186, 'Digital Right Brest', 1000, 0, 5, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(187, 'X -Ray P.N.S', 300, 0, 9, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(188, 'X -Ray Skull (B/V', 500, 0, 9, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(189, 'X -Ray Chest P/A Vew', 400, 0, 9, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(190, 'X -Ray Chest A/P', 400, 0, 9, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(191, 'X -Ray Chest Left/Right View (B/V', 400, 0, 9, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(192, 'X -Ray Chest Oblique View-Right/Left (B/V)', 400, 0, 9, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(193, 'X -Ray K.U.B Abdomen Ereet posture', 400, 0, 9, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(194, 'X -Ray Cerivcal Spine (B/V)', 500, 0, 9, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(195, 'X -Ray Dorso Lumbar Spine(B/V)', 500, 0, 9, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(196, 'X -Ray Lumbo Sacral Spine(B/V)', 500, 0, 9, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(197, 'X -Ray Pelvis With both hop joints(A/P)', 400, 0, 9, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(198, 'X -Ray Pelvis With both hop joints(B/V)', 500, 0, 9, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(199, 'S.lipid nprofile', 800, 0, 9, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(200, 'X -Ray Leg (B/V)', 400, 0, 9, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(201, 'X -Ray Femur (B/V)', 350, 0, 9, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(202, 'X -Ray Thigh Hip (B/V)', 350, 0, 9, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(203, 'X -Ray Knee Right (B/V)', 350, 0, 9, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(204, 'X -Ray Ankle -Right/Left (B/V)', 350, 0, 9, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(205, 'X -Ray Wrist -Right/Left (B/V)', 350, 0, 9, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(206, 'X -Ray Elbow -Right/Left (B/V)', 350, 0, 9, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(207, 'X -Ray Shoulder joint -Right/Left (B/V)', 500, 0, 9, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(208, 'X -Ray Hand-Right/Left (B/V)', 350, 0, 9, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(209, 'X -Ray Forearm-Right/Left (B/V)', 350, 0, 9, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(210, 'X -Ray Arm Right/Left (B/V)', 350, 0, 9, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(211, 'X -Ray I.V.U/I.V.P(Without contrast)', 1200, 0, 9, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(212, 'X -Ray Ba -Enema (Double With contrast)', 1200, 0, 9, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(213, 'X -Ray Ba -Enema (Single With contrast)', 1000, 0, 9, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(214, 'X -Ray Ba-meal S/D', 700, 0, 9, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(215, 'X -Ray Ba-Follow Through', 1500, 0, 9, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(216, 'X -Ray Ba-Shallow of Oesopgagus', 900, 0, 9, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(217, 'X -Ray Cysto Urothogram (With contrast)', 2500, 0, 9, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(218, 'X -Ray T.Tube Cholingiogram (With contrast)', 1600, 0, 9, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(219, 'X -Ray O.C.G (With contrast) ', 500, 0, 9, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(220, 'X -Ray Myelogram for Lumber.Dorsal & Cervical0 (Add contrast)', 3100, 0, 9, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(221, 'Digital X-Ray P.N.S', 500, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(222, 'Digital X-Ray Skull (B/V)', 700, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(223, 'Digital X-Ray Chest P/A  View', 600, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(224, 'Digital X-Ray Chest A/P', 500, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(225, 'Digital X-Ray Chest Left/Right View (B/V) (one side only)', 500, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(226, 'Digital X-Ray Chest Oblique View -Right/Left(B/V) (one side only)', 500, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(227, 'Digital X-Ray K.U.B Abdomen Ereet posture', 600, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(228, 'Digital X-Ray Cervical Spine (B/V)', 700, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(229, 'Digital X-Ray Dorso Lumbar Spine (B/V)', 700, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(230, 'Digital X-Ray Lumbo Sacral Spine (B/V)', 700, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(231, 'Digital X-Ray Pelvis with both hop joints(A/P)', 700, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(232, 'Digital X-Ray Pelvis With both S.I  Joint (A/P)', 800, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(233, 'Digital X-Ray Leg (B/V)', 600, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(234, 'Digital X-Ray Femur (B/V)', 600, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(235, 'Digital X-Ray Thigh Hip (B/V)', 600, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(236, 'Digital X-Ray Knee Right (B/V)', 600, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(237, 'Digital X-Ray Ankle-Right/Left (B/V)', 600, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(238, 'Digital X-Ray Wrist-Right/Left (B/V)', 600, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(239, 'Digital X-Ray Elbow-Right/Left (B/V)', 600, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(240, 'Digital X-Ray Shoulder joint -Right/Left (B/V)', 600, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(241, 'Digital X-Ray Hand -Right/Left (B/V)', 600, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(242, 'Digital X-Ray Arm -Right/Left (B/V)', 600, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(243, 'Digital X-Ray I.V.U/ I.V.P(Without Contrast)', 2500, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(244, 'Digital X-Ray I.V.U/ I.V.P(With Contrast)', 3700, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(245, 'Digital X-Ray I.V.U with MCU 2500+1200=Contrast', 3700, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(246, 'Digital X-Ray M.C.U with R.C.U 2500+1200=Contrast', 3700, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(247, 'Digital X-Ray Fistulogram 2000+1200=Contrast', 3200, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(248, 'Digital X-Ray Ba-Enema(Double Single Contrast)', 2700, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(249, 'Digital X-Ray Ba-Follow Through of Intenstine', 2700, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(250, 'Digital X-Ray Ba-Meal S/D', 1400, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(251, 'Digital X-Ray Ba-Meal Upper GI Tract & Position', 1400, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(252, 'Digital X-Ray Ba-Shallow Oesopgagus', 1400, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(253, 'Digital X-Ray Cystogram/retrograde Cysto Urothrogram(With Contrast)', 3700, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(254, 'Digital X-Ray T. Tube Cholingiogram (With Contrast)', 2200, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(255, 'Digital X-Ray Hystero-Salpingography(With Contrast)', 3700, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(256, 'CT Scan od Brain(Pain)', 4000, 0, 6, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(257, 'Skull/ Head/ Pituitary Fossa', 4000, 0, 6, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(258, 'Brain & Orbit / Only Optic lesion', 5000, 0, 6, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(259, 'Mastoid Bones', 5000, 0, 6, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(260, 'P.N.S (Para Nasal Sinuses)', 5000, 0, 6, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(261, 'Nasopharynx', 6000, 0, 6, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(262, 'Neck', 6000, 0, 6, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(263, 'Chest/Thorax/Both Lung (HRCT-2mm thickness)', 6500, 0, 6, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(264, 'Mediastinum', 6000, 0, 6, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(265, 'HBS (Liver,Gall Bladder)', 6000, 0, 6, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(266, 'Upper Abdomen (HBS,Pancreas,Spleen,Kidneys)', 6000, 0, 6, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(267, 'Whole Abdomen/Abdominal-pelvic organs', 11000, 0, 6, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(268, 'HBS & KUB Region', 11000, 0, 6, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(269, 'CT Scan of Adrenal Glands', 6000, 0, 6, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(270, 'Abdominal Mass/ lumps', 11000, 0, 6, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(271, 'K.U.B(Kidneys,Urinary,Bladder)', 11000, 0, 6, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(272, 'Kidneys (With of Without Supra-Renals Glads)', 5500, 0, 6, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(273, 'Lower Abdomen/Pelvis Organ', 6000, 0, 6, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(274, 'Genito-Urinary System', 11000, 0, 6, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(275, 'Joint-hips / Knees/ Elbows / Shoulders(Fach)', 5500, 0, 6, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(276, 'Arms/Forearm/Hands (Each)', 7000, 0, 6, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(277, 'Right/Leegs/Foots(Each)', 7000, 0, 6, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(278, 'Cervical Spine-Plain', 7000, 0, 6, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(279, 'Dorsal Spine-Plain', 7000, 0, 6, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(280, 'Lumber sacral Spine-Plain', 7000, 0, 6, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(281, 'Myelo-CT of Cervical Spine', 7000, 0, 6, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(282, 'Myelo-CT of Dorsal Spine', 7000, 0, 6, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(283, 'Myelo-CT of Lumber Spine', 7000, 0, 6, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(284, 'Digital X-Ray Pelvis with both hop joints(B/V)', 700, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(285, 'Digital X-Ray Forearm -Right/Left (B/V)', 600, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(286, 'Uterus & Adnexae(Uterus,F.Tubes,Ovaries)', 5500, 0, 6, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(287, 'Pllvic bones/Sacrum', 6000, 0, 6, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(288, 'Whole Abdomen (Male)', 800, 0, 3, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(289, 'Whole Abdomen (Female)', 800, 0, 3, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(290, 'HBS/UPPER Abdomen(Male/Female)', 600, 0, 3, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(291, 'Lower Abdomen/Uterus & Adnexae (Female)', 600, 0, 3, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(292, 'KUB/Genito Urinary Tract(Female)', 700, 0, 3, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(293, 'KUB/Genito Urinary Tract(Male)', 600, 0, 3, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(294, 'Only KUB(Male/Female)', 600, 0, 3, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(295, 'KUB with prostate (Residual Volume)(Male)', 600, 0, 3, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(296, 'Pregnancy Profile (Female)', 700, 0, 3, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(297, 'Chest (Male/Female)', 800, 0, 3, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(298, 'Thyroid (Male/Female)', 1000, 0, 3, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(299, 'Brain-Neonantal(Male/Female)', 800, 0, 3, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(300, 'Breast(Female)', 800, 0, 3, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(301, 'Scrotum/Testes (Male)', 800, 0, 3, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(302, 'Whole Abdomen (Male)', 1200, 0, 2, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(303, 'Whole Abdomen (Female)', 1200, 0, 2, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(304, 'HBS/UPPER Abdomen(Male/Female)', 1000, 0, 2, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(305, 'Lower Abdomen/Uterus & Adnexae (Female)', 1000, 0, 2, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(306, 'KUB/Genito Urinary Tract(Female)', 1000, 0, 2, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(307, 'KUB/Genito Urinary Tract(Male)', 1000, 0, 2, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(308, 'Only KUB(Male/Female)', 1000, 0, 2, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(309, 'KUB with prostate (Residual Volume)(Male)', 1000, 0, 2, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(310, 'Pregnancy Profile (Female)', 1200, 0, 2, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(311, 'Chest (Male/Female)', 1000, 0, 2, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(312, 'Thyroid (Male/Female)', 1000, 0, 2, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(313, 'Brain-Neonantal(Male/Female)', 1000, 0, 2, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(314, 'Breast(Female)', 1000, 0, 2, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(315, 'Scrotum/Testes (Male)', 1000, 0, 2, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(316, 'USG 4D Color (Any System)(Male/Female)', 1500, 0, 2, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(317, 'USG 2D Color TVS(Female)', 1500, 0, 2, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(318, 'FNAC', 1500, 0, 10, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(319, 'FNAC with collection(1500+1000)', 2500, 0, 10, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(320, 'USG Guided with collection(1500+1000+800)', 3300, 0, 10, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(321, 'CT Guided FNAC', 6000, 0, 10, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(322, 'Histopahology Large', 2000, 0, 10, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(323, 'Histopahology Medium', 1500, 0, 10, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(324, 'Histopahology Small', 1200, 0, 10, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(325, 'Bone Marrow', 3000, 0, 10, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(326, 'PAPS', 1000, 0, 10, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(327, 'Malignant', 1000, 0, 10, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(328, 'SERUM LIPID PROFILE', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(329, 'X-RAY  MASTOID  T/V', 600, 0, 10, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(330, 'X-RAY  MASTOID  T/V', 600, 0, 10, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(331, 'X-RAY  MASTOID  T/V', 600, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(332, 'X-RAY  NASOPHRANGE L/V', 600, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(333, 'X-RAY NASAL BONE  ', 600, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(334, 'X-RAY  T.M  JOINT  B/V', 700, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(335, 'X-RAY  T.M  JOINT  B/V', 700, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(336, 'X-RAY  T.M  JOINT  B/V', 700, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(337, 'X-RAY  T.M  JOINT  B/V', 700, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(338, 'T4  TSH', 1200, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(339, 'x-ray  L/T sub M  REGON  L/V', 600, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(340, 'CBC', 400, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(341, 'T3', 600, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(342, 'T4', 600, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(343, 'TSH', 600, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(344, 'X-RT-STYLOID PROCESSLV', 600, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(345, 'X-RAY LS BV', 700, 0, 4, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(346, 'Haemoglobin HGB% Eleetrophrosis', 2000, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(347, 'A.N.F', 1000, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(348, 'B  HCG', 1400, 0, 1, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(349, 'USG  OF  W/A  (COLOUR)', 1200, 0, 2, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(350, 'USG  OF  L/A   (COLOUR)', 1100, 0, 2, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(351, 'USG  OF  P/P   (COLOUR)', 1100, 0, 2, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(352, 'USG  OF  W/A   ( BLACK WHITE )', 800, 0, 3, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(353, 'USG  OF  L/A   ( BLACK WHITE )', 700, 0, 3, '2020-01-12 07:04:10', '2020-01-12 07:04:10'),
(354, 'USG  OF   P/P ( BLACK  WHITE )', 700, 0, 3, '2020-01-12 07:04:10', '2020-01-12 07:04:10');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `own_user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `picture` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('Male','Female') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Male',
  `blood_group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'A+',
  `designation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `biography` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `marital_status` enum('Married','Single') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Single',
  `religion` enum('Islam','Hindu','Buddha','Christian','Other') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Islam',
  `status` enum('Active','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `full_name`, `email`, `department_id`, `user_id`, `own_user_id`, `picture`, `gender`, `blood_group`, `designation`, `phone_no`, `mobile_no`, `address`, `biography`, `age`, `marital_status`, `religion`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Gopal Singh Dhanik', 'abc@gmail.com', 1, 1, 1, '', 'Male', 'A+', '', '', '', NULL, '', NULL, 'Single', 'Islam', 'Active', '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(2, 'Vivek Saxena', 'efg@gmail.com', 2, 3, 2, '', 'Male', 'A+', '', '', '', NULL, '', NULL, 'Single', 'Islam', 'Active', '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(3, 'Dr. Alok Bajpai', 'hij@gmail.com', 3, 5, 3, '', 'Male', 'A+', '', '', '', NULL, '', NULL, 'Single', 'Islam', 'Active', '2020-03-04 07:50:52', '2020-03-04 07:50:52');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_payments`
--

CREATE TABLE `doctor_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `trans_id` int(11) NOT NULL DEFAULT 0,
  `amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `status` enum('Active','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doc_appointments`
--

CREATE TABLE `doc_appointments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `invoice` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `doctor_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `doc_schedule_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `referral_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `trans_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `doctor_fees` decimal(8,2) NOT NULL,
  `discount` decimal(8,2) DEFAULT NULL,
  `net_fees` decimal(8,2) NOT NULL,
  `serial` int(11) NOT NULL DEFAULT 0,
  `remark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Requested','Confirmed','Paid','Closed','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Confirmed',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doc_schedules`
--

CREATE TABLE `doc_schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doctor_fees` decimal(8,2) NOT NULL,
  `week_day` enum('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday') COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `visit_qty` int(11) NOT NULL DEFAULT 20,
  `doctor_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `status` enum('Active','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doc_schedules`
--

INSERT INTO `doc_schedules` (`id`, `name`, `doctor_fees`, `week_day`, `start_time`, `end_time`, `visit_qty`, `doctor_id`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Morning Shift', 1000.00, 'Sunday', '08:00:00', '14:00:00', 15, 1, 'Active', 2, '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(2, 'Evening Shift', 1500.00, 'Saturday', '20:00:00', '23:00:00', 22, 2, 'Active', 3, '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(3, 'Morning Shift', 1200.00, 'Monday', '10:00:00', '14:00:00', 24, 3, 'Active', 3, '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(4, 'Evening Shift', 700.00, 'Tuesday', '20:00:00', '24:00:00', 15, 1, 'Active', 4, '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(5, 'Morning Shift', 1000.00, 'Wednesday', '08:00:00', '14:00:00', 12, 2, 'Active', 5, '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(6, 'Evening Shift', 2000.00, 'Thursday', '20:30:00', '24:00:00', 15, 3, 'Active', 5, '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(7, 'Morning Shift', 1000.00, 'Friday', '10:00:00', '14:30:00', 25, 3, 'Active', 2, '2020-03-04 07:50:52', '2020-03-04 07:50:52');

-- --------------------------------------------------------

--
-- Table structure for table `due_collections`
--

CREATE TABLE `due_collections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trans_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `module` enum('Pharmacy','Diagnostic','Hospital') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pharmacy',
  `sub_module` enum('Hospital-Admission','Hospital-Emergency','Hospital-Operation') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `due_collection_items`
--

CREATE TABLE `due_collection_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `patient_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `due_collection_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `table_id` int(11) NOT NULL,
  `table` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('Active','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `slug`, `subject`, `content`, `description`, `from_name`, `from_email`, `cc_email`, `created_at`, `updated_at`) VALUES
(1, 'Forget Password', 'forget-password', 'Password Recovery', '<p>Hey [name],</p><p>Are you forget your password,</p><p>Here is your link of reset your password:</p><p>[link]</p><p>Thank you for using our system.</p><p>&nbsp;</p><p>Andit Team</p><p>Khulna, Bangladesh</p>', 'Recovery password', 'Shariful Islam', 'shariful.info55@gmail.com', '', '2020-03-04 07:50:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `expense_category_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_type` enum('bank','cash') COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_transaction_id` int(11) NOT NULL DEFAULT 0,
  `status` enum('Active','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `module` enum('Pharmacy','Diagnostic','Hospital') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pharmacy',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `date`, `expense_category_id`, `amount`, `description`, `payment_type`, `bank_transaction_id`, `status`, `module`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '2020-03-08', 1, 10000.00, '', 'cash', 0, 'Active', 'Hospital', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Active','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `category_name`, `slug`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Tax Payment', 'tax-payment', 'Active', 1, '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(2, 'Salary Payment', 'salary-payment', 'Active', 1, '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(3, 'Utilites Bill', 'utilites-bill', 'Active', 1, '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(4, 'Other Payment', 'other-payment', 'Active', 1, '2020-03-04 07:50:51', '2020-03-04 07:50:51');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hms_admissions`
--

CREATE TABLE `hms_admissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `invoice` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admit_date` date NOT NULL,
  `admit_time` time NOT NULL,
  `sub_total` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_percent` decimal(5,2) NOT NULL DEFAULT 0.00,
  `discount_overall` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_total` decimal(8,2) NOT NULL DEFAULT 0.00,
  `grand_total` decimal(8,2) NOT NULL DEFAULT 0.00,
  `paid_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `actual_paid_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `due` decimal(8,2) NOT NULL DEFAULT 0.00,
  `due_collection` decimal(8,2) NOT NULL DEFAULT 0.00,
  `change` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discharge_date` date DEFAULT NULL,
  `discharge_time` time DEFAULT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bed_id` bigint(20) UNSIGNED DEFAULT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `trans_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `referral_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `status` enum('Active','Void','Discharged') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hms_admissions`
--

INSERT INTO `hms_admissions` (`id`, `slug`, `date`, `invoice`, `admit_date`, `admit_time`, `sub_total`, `discount_percent`, `discount_overall`, `discount_total`, `grand_total`, `paid_amount`, `actual_paid_amount`, `due`, `due_collection`, `change`, `discharge_date`, `discharge_time`, `remark`, `bed_id`, `patient_id`, `user_id`, `trans_id`, `referral_id`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, '2020-03-05', 'HMS_1001', '2020-03-05', '16:13:24', 1000.00, 100.00, 100.00, 100.00, 900.00, 800.00, 800.00, 100.00, 0.00, 0.00, NULL, NULL, NULL, 1, 1, 1, 0, 1, 'Active', NULL, NULL),
(2, NULL, '2020-03-08', 'HMS_1001', '2020-03-07', '16:13:24', 1000.00, 100.00, 100.00, 100.00, 900.00, 800.00, 800.00, 100.00, 0.00, 0.00, NULL, NULL, NULL, 1, 1, 1, 0, 1, 'Active', NULL, NULL),
(3, NULL, '2020-03-08', 'HMS_1001', '2020-03-07', '16:13:24', 2000.00, 100.00, 100.00, 100.00, 1900.00, 1800.00, 1800.00, 200.00, 0.00, 0.00, NULL, NULL, NULL, 1, 1, 1, 0, 1, 'Active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hms_beds`
--

CREATE TABLE `hms_beds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `bed_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `patient` int(11) NOT NULL DEFAULT 0,
  `status` enum('Active','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `bed_type_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hms_beds`
--

INSERT INTO `hms_beds` (`id`, `slug`, `price`, `bed_no`, `patient`, `status`, `bed_type_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'A101', 200.00, 'A101', 0, 'Active', 1, 5, '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(2, 'A102', 500.00, 'A102', 0, 'Active', 2, 5, '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(3, 'A103', 700.00, 'A103', 0, 'Active', 3, 5, '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(4, 'A104', 1000.00, 'A104', 0, 'Active', 1, 5, '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(5, 'A105', 1200.00, 'A105', 0, 'Active', 2, 5, '2020-03-04 07:50:51', '2020-03-04 07:50:51');

-- --------------------------------------------------------

--
-- Table structure for table `hms_bed_types`
--

CREATE TABLE `hms_bed_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hms_bed_types`
--

INSERT INTO `hms_bed_types` (`id`, `slug`, `name`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Ward', 'Ward', 'Active', 5, '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(2, 'Cabin', 'Cabin', 'Active', 5, '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(3, 'General', 'General', 'Active', 5, '2020-03-04 07:50:51', '2020-03-04 07:50:51');

-- --------------------------------------------------------

--
-- Table structure for table `hms_emergencies`
--

CREATE TABLE `hms_emergencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `invoice` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` time NOT NULL,
  `sub_total` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_percent` decimal(5,2) NOT NULL DEFAULT 0.00,
  `discount_overall` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_total` decimal(8,2) NOT NULL DEFAULT 0.00,
  `grand_total` decimal(8,2) NOT NULL DEFAULT 0.00,
  `paid_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `actual_paid_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `due` decimal(8,2) NOT NULL DEFAULT 0.00,
  `due_collection` decimal(8,2) NOT NULL DEFAULT 0.00,
  `change` decimal(8,2) NOT NULL DEFAULT 0.00,
  `remark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `referral_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `trans_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `status` enum('Active','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hms_emergencies`
--

INSERT INTO `hms_emergencies` (`id`, `slug`, `date`, `invoice`, `time`, `sub_total`, `discount_percent`, `discount_overall`, `discount_total`, `grand_total`, `paid_amount`, `actual_paid_amount`, `due`, `due_collection`, `change`, `remark`, `patient_id`, `referral_id`, `user_id`, `trans_id`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, '2020-03-09', 'EMG-1001', '25:24:38', 100.00, 10.00, 90.00, 800.00, 600.00, 500.00, 400.00, 300.00, 200.00, 0.00, NULL, 1, 1, 1, 0, 'Active', NULL, NULL),
(2, NULL, '2020-03-09', 'EMG-1002', '25:24:38', 1000.00, 100.00, 900.00, 8000.00, 6000.00, 5000.00, 4000.00, 3000.00, 2000.00, 0.00, NULL, 1, 3, 1, 0, 'Void', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hms_emergency_services`
--

CREATE TABLE `hms_emergency_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hms_emergency_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `service_date` date NOT NULL,
  `service_id` int(11) NOT NULL DEFAULT 0,
  `service_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `patient_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `service_price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `status` enum('Active','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hms_given_services`
--

CREATE TABLE `hms_given_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admission_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `service_id` int(11) NOT NULL DEFAULT 0,
  `service_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `patient_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `service_price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `service_date` date NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `status` enum('Active','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hms_operations`
--

CREATE TABLE `hms_operations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `operation_service_id` bigint(20) UNSIGNED NOT NULL,
  `operation_service_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operation_service_price` int(11) NOT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `grand_total` decimal(8,2) NOT NULL DEFAULT 0.00,
  `paid_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `due` decimal(8,2) NOT NULL DEFAULT 0.00,
  `change` decimal(8,2) NOT NULL DEFAULT 0.00,
  `actual_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `due_collection` decimal(8,2) NOT NULL DEFAULT 0.00,
  `remark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trans_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `status` enum('Active','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `patient_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `admission_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hms_operation_services`
--

CREATE TABLE `hms_operation_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `status` enum('Active','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `operation_type_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hms_operation_services`
--

INSERT INTO `hms_operation_services` (`id`, `name`, `slug`, `price`, `status`, `operation_type_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Single', 'Single', 1000, 'Active', 1, 5, '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(2, 'Micro Surgery', 'Micro Surgery', 2000, 'Active', 2, 2, '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(3, 'Hysterectomy', 'Hysterectomy', 1400, 'Active', 3, 4, '2020-03-04 07:50:52', '2020-03-04 07:50:52');

-- --------------------------------------------------------

--
-- Table structure for table `hms_operation_types`
--

CREATE TABLE `hms_operation_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hms_operation_types`
--

INSERT INTO `hms_operation_types` (`id`, `name`, `slug`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Bypass', 'Bypass', 'Active', 5, '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(2, 'Surgery', 'Surgery', 'Active', 2, '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(3, 'Caesarean', 'Caesarean', 'Active', 4, '2020-03-04 07:50:51', '2020-03-04 07:50:51');

-- --------------------------------------------------------

--
-- Table structure for table `hms_services`
--

CREATE TABLE `hms_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `status` enum('Active','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `service_category_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hms_services`
--

INSERT INTO `hms_services` (`id`, `slug`, `name`, `price`, `status`, `service_category_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Admission', 'Admission', 200, 'Active', 1, 5, '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(2, 'Pediatric specialty care', 'Pediatric specialty care', 500, 'Active', 2, 5, '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(3, 'greater access to surgical specialists', 'Greater access to surgical specialists', 700, 'Active', 2, 5, '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(4, 'Physical therapy and rehabilitation services', 'Physical therapy and rehabilitation services', 1000, 'Active', 2, 5, '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(5, 'Prescription services', 'Prescription services', 1200, 'Active', 3, 5, '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(6, 'Home nursing services', 'Home nursing services', 1500, 'Active', 3, 5, '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(7, 'Nutritional counseling', 'Nutritional counseling', 1700, 'Active', 4, 5, '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(8, 'Mental health care', 'Mental health care', 2000, 'Active', 4, 5, '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(9, 'Family support services', 'Family support services', 2200, 'Active', 5, 5, '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(10, 'Genetic counseling and testing', 'Genetic counseling and testing', 2500, 'Active', 5, 5, '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(11, 'Social work or case management services', 'Social work or case management services', 2700, 'Active', 6, 5, '2020-03-04 07:50:51', '2020-03-04 07:50:51');

-- --------------------------------------------------------

--
-- Table structure for table `hms_service_categories`
--

CREATE TABLE `hms_service_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hms_service_categories`
--

INSERT INTO `hms_service_categories` (`id`, `slug`, `name`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Admission', 'Admission', 'Active', 5, '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(2, 'Short-term hospitalization', 'Short-term hospitalization', 'Active', 5, '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(3, 'Emergency room services', 'Emergency room services', 'Active', 5, '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(4, 'General and specialty surgical services', 'General and specialty surgical services', 'Active', 5, '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(5, 'X ray/radiology services', 'X ray/radiology services', 'Active', 5, '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(6, 'Laboratory services', 'Laboratory services', 'Active', 5, '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(7, 'Blood services', 'Blood services', 'Active', 5, '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(8, 'Primary care services', 'Primary care services', 'Active', 5, '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(9, 'Mental health and drug treatment', 'Mental health and drug treatment', 'Active', 5, '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(10, 'Infectious disease clinics', 'Infectious disease clinics', 'Active', 5, '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(11, 'Hospice care', 'Hospice care', 'Active', 5, '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(12, 'Dental services', 'Dental services', 'Active', 5, '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(13, 'Translation and interpreter services', 'Translation and interpreter services', 'Active', 5, '2020-03-04 07:50:51', '2020-03-04 07:50:51');

-- --------------------------------------------------------

--
-- Table structure for table `mailboxes`
--

CREATE TABLE `mailboxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachments` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('read','unread') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_07_02_230147_migration_cartalyst_sentinel', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_06_27_074025_create_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_10_22_113244_create_activities_table', 1),
(6, '2019_10_23_091624_create_notifications_table', 1),
(7, '2019_10_27_064926_create_pharma_categories_table', 1),
(8, '2019_11_02_110046_create_email_templates_table', 1),
(9, '2019_11_03_072451_create_mailboxes_table', 1),
(10, '2019_11_06_075152_create_pharma_manufacturers_table', 1),
(11, '2019_11_06_120046_create_pharma_product_types_table', 1),
(12, '2019_11_07_031254_create_pharma_units_table', 1),
(13, '2019_11_07_053637_create_pharma_product_taxes_table', 1),
(14, '2019_11_07_065045_create_pharma_products_table', 1),
(15, '2019_11_09_041712_create_pharma_purchases_table', 1),
(16, '2019_11_09_043136_create_pharma_purchase_items_table', 1),
(17, '2019_11_12_030343_create_patients_table', 1),
(18, '2019_11_16_073707_create_pharma_batches_table', 1),
(19, '2019_11_23_064050_create_pharma_sales_table', 1),
(20, '2019_11_23_074659_create_pharma_sale_items_table', 1),
(21, '2019_11_24_052552_create_site_settings_table', 1),
(22, '2019_12_05_030221_create_banks_table', 1),
(23, '2019_12_05_084230_create_bank_transections_table', 1),
(24, '2019_12_05_092839_create_transations_table', 1),
(25, '2019_12_08_080852_create_expense_categories_table', 1),
(26, '2019_12_08_081024_create_expenses_table', 1),
(27, '2019_12_15_120623_create_pharma_taxes_table', 1),
(28, '2019_12_21_104442_create_currencies_table', 1),
(29, '2020_01_11_131905_create_referral_categories_table', 1),
(30, '2020_01_12_191953_create_referrals_table', 1),
(31, '2020_01_13_153549_create_diagon_test_categories', 1),
(32, '2020_01_13_155421_create_diagon_test_lists_table', 1),
(33, '2020_01_18_140350_create_diagon_bills_table', 1),
(34, '2020_01_18_140453_create_diagon_bill_items_table', 1),
(35, '2020_01_21_180825_create_diagon_referral_payments_table', 1),
(36, '2020_01_27_121634_create_hms_bed_types_table', 1),
(37, '2020_01_27_122438_create_hms_beds_table', 1),
(38, '2020_01_27_123630_create_hms_service_categories_table', 1),
(39, '2020_01_27_124207_create_hms_services', 1),
(40, '2020_02_02_171347_create_hms_admissions_table', 1),
(41, '2020_02_02_171456_create_hms_given_services_table', 1),
(42, '2020_02_11_162936_create_hms_operation_types_table', 1),
(43, '2020_02_11_164119_create_hms_operation_services_table', 1),
(44, '2020_02_11_164300_create_hms_operations_table', 1),
(45, '2020_02_12_112653_create_due_collections_table', 1),
(46, '2020_02_12_112801_create_due_collection_items_table', 1),
(47, '2020_02_15_143048_create_hms_emergencies_table', 1),
(48, '2020_02_15_143627_create_hms_emergency_services_table', 1),
(49, '2020_02_18_122130_create_bed_charge_collections_table', 1),
(50, '2020_02_18_122321_create_bed_charge_collection_items_table', 1),
(51, '2020_02_23_115535_create_departments_table', 1),
(52, '2020_02_23_115657_create_doctors_table', 1),
(53, '2020_02_23_121955_create_doc_schedules_table', 1),
(54, '2020_02_23_122824_create_doc_appointments_table', 1),
(55, '2020_02_26_171633_create_doctor_payments_table', 1),
(56, '2020_03_01_180808_create_pre_medicine_types_table', 1),
(57, '2020_03_02_180622_create_prescriptions_table', 1),
(58, '2020_03_02_180744_create_pre_medicines_table', 1),
(59, '2020_03_02_180836_create_pre_medicine_items_table', 1),
(60, '2020_03_02_180854_create_pre_test_items_table', 1),
(61, '2020_03_02_191535_create_pre_routines_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `from` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int(11) DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('Male','Female','Other') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Female',
  `marital_status` enum('Married','Single') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Single',
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `blood_group` enum('A+','A-','B+','B-','O+','O-','AB+','AB-') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'A+',
  `guardian` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relationship` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guardian_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `occupation` enum('Business','Professional','Student','House Wife','Labourers','Other') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Business',
  `religion` enum('Islam','Hindu','Buddha','Christian','Other') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Islam',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `patient_name`, `slug`, `email`, `phone`, `age`, `address`, `description`, `picture`, `attachment`, `password`, `gender`, `marital_status`, `status`, `blood_group`, `guardian`, `relationship`, `guardian_phone`, `occupation`, `religion`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Walking Customer', '0001', 'walking@customer.com', '000000', NULL, '000000', NULL, NULL, NULL, NULL, 'Female', 'Single', 'Active', 'A+', NULL, NULL, NULL, 'Business', 'Islam', 1, '2020-03-04 07:50:49', '2020-03-04 07:50:49'),
(2, 'Hasan', '0002', 'hasan@gmail.com', '54556552', NULL, '331/C,kalabagan,dhaka', NULL, NULL, NULL, NULL, 'Female', 'Single', 'Active', 'A+', NULL, NULL, NULL, 'Business', 'Islam', 1, '2020-03-04 07:50:49', '2020-03-04 07:50:49'),
(3, 'Mehedi', '0003', 'mehedi@gmail.com', '5456554566', NULL, '331/C,dhanmondi,dhaka', NULL, NULL, NULL, NULL, 'Female', 'Single', 'Active', 'A+', NULL, NULL, NULL, 'Business', 'Islam', 1, '2020-03-04 07:50:49', '2020-03-04 07:50:49'),
(6, 'Walking Customer', '0002', 'testing@customer.com', '000000', NULL, '000000', NULL, NULL, NULL, NULL, 'Female', 'Single', 'Inactive', 'A+', NULL, NULL, NULL, 'Business', 'Islam', 1, '2020-03-04 07:50:49', '2020-03-04 07:50:49');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) DEFAULT 0,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `parent_id`, `name`, `slug`, `description`) VALUES
(1, 0, 'User Management', 'user-management', 'Getting User Management Menus'),
(2, 1, 'User Menu', 'user-menu', 'Getting User Menus'),
(3, 1, 'User list', 'user-index', 'Can view all user list'),
(4, 1, 'View User', 'user-view', 'Can view a user'),
(5, 1, 'Add User', 'user-add', 'Can add a user'),
(6, 1, 'store User', 'user-store', 'Can store a user'),
(7, 1, 'Edit User', 'user-edit', 'Can edit a user'),
(8, 1, 'update User', 'user-update', 'Can update user'),
(9, 1, 'delete User', 'user-delete', 'Can update user'),
(10, 1, 'Role Menu', 'role-menu', 'Getting Role Menus'),
(11, 1, 'role list', 'role-index', 'Can view all role list'),
(12, 1, 'View role', 'role-view', 'Can view a role'),
(13, 1, 'Add role', 'role-add', 'Can add a role'),
(14, 1, 'store role', 'role-store', 'Can store a role'),
(15, 1, 'Edit role', 'role-edit', 'Can edit a role'),
(16, 1, 'update role', 'role-update', 'Can update role'),
(17, 1, 'delete role', 'role-delete', 'Can update role'),
(18, 1, 'permission Menu', 'permission-menu', 'Getting permission Menus'),
(19, 1, 'permission list', 'permission-index', 'Can view all permission list'),
(20, 1, 'View permission', 'permission-view', 'Can view a permission'),
(21, 1, 'Add permission', 'permission-add', 'Can add a permission'),
(22, 1, 'store permission', 'permission-store', 'Can store a permission'),
(23, 1, 'Edit permission', 'permission-edit', 'Can edit a permission'),
(24, 1, 'update permission', 'permission-update', 'Can update permission'),
(25, 1, 'delete permission', 'permission-delete', 'Can update permission'),
(26, 1, 'User Activities', 'activities', 'View all user activities'),
(27, 1, 'Notifacations', 'notifacation', 'View all Notifacation'),
(28, 0, 'Products Management', 'product-management', 'Getting Product Management Menus'),
(29, 28, 'Category list', 'category-index', 'Can View all categories'),
(30, 28, 'Add category', 'category-create', 'Can add a category'),
(31, 28, 'Category view', 'category-show', 'Can View a category'),
(32, 28, 'Edit category', 'category-edit', 'Can edit a category'),
(33, 28, 'delete category', 'category-destroy', 'Can delete a category'),
(34, 28, 'type list', 'type-index', 'Can View all types'),
(35, 28, 'Add type', 'type-create', 'Can add a type'),
(36, 28, 'type view', 'type-show', 'Can View a type'),
(37, 28, 'Edit type', 'type-edit', 'Can edit a type'),
(38, 28, 'delete type', 'type-destroy', 'Can delete a type'),
(39, 28, 'Unit list', 'unit-index', 'Can View all units'),
(40, 28, 'Add unit', 'unit-create', 'Can add a unit'),
(41, 28, 'view unit', 'unit-show', 'Can View a unit'),
(42, 28, 'Edit unit', 'unit-edit', 'Can edit a unit'),
(43, 28, 'delete unit', 'unit-destroy', 'Can delete a unit'),
(44, 28, 'Tax list', 'tax-index', 'Can View all taxes'),
(45, 28, 'Add tax', 'tax-create', 'Can add a tax'),
(46, 28, 'view tax', 'tax-show', 'Can View a tax'),
(47, 28, 'Edit tax', 'tax-edit', 'Can edit a tax'),
(48, 28, 'delete tax', 'tax-destroy', 'Can delete a tax'),
(49, 28, 'product list', 'product-index', 'Can View all productes'),
(50, 28, 'Add product', 'product-create', 'Can add a product'),
(51, 28, 'Show product', 'product-show', 'Can View a product'),
(52, 28, 'Edit product', 'product-edit', 'Can edit a product'),
(53, 28, 'active/inactive product', 'product-destroy', 'Can change status of product'),
(54, 0, 'Manufacturer Management', 'Manufacturer-management', 'Getting Manufacturer Management Menus'),
(55, 54, 'Manufactur list', 'manufacturer-index', 'Can View all Manufacturer'),
(56, 54, 'Add manufacturs', 'manufacturer-create', 'Can add a Manufacturer'),
(57, 54, 'unit manufacturs', 'manufacturer-show', 'Can View a Manufacturer'),
(58, 54, 'Edit manufacturs', 'manufacturer-edit', 'Can edit a Manufacturer'),
(59, 54, 'delete manufacturs', 'manufacturer-destroy', 'Can delete a Manufacturer'),
(60, 0, 'Customer Management', 'Customer-management', 'Getting Customer Management Menus'),
(61, 60, 'Customer list', 'customer-index', 'Can View all customer'),
(62, 60, 'Add customer', 'customer-create', 'Can add a customer'),
(63, 60, 'view customer', 'customer-show', 'Can View a customer'),
(64, 60, 'Edit customer', 'customer-edit', 'Can edit a customer'),
(65, 60, 'delete customer', 'customer-destroy', 'Can delete a customer'),
(66, 0, 'Purchase Management', 'purchase-management', 'Getting Customer purchase Menus'),
(67, 66, 'purchase list', 'purchase-index', 'Can View all purchase'),
(68, 66, 'Add purchase', 'purchase-create', 'Can add a purchase'),
(69, 66, 'view purchase', 'purchase-show', 'Can View a purchase'),
(70, 66, 'Edit purchase', 'purchase-edit', 'Can edit a purchase'),
(71, 66, 'delete purchase', 'purchase-destroy', 'Can delete a purchase'),
(72, 66, 'purchaseReturn list', 'purchaseReturn-index', 'Can View all purchaseReturn'),
(73, 66, 'Add purchaseReturn', 'purchaseReturn-create', 'Can add a purchaseReturn'),
(74, 66, 'view purchaseReturn', 'purchaseReturn-show', 'Can View a purchaseReturn'),
(75, 66, 'Edit purchaseReturn', 'purchaseReturn-edit', 'Can edit a purchaseReturn'),
(76, 66, 'delete purchaseReturn', 'purchaseReturn-destroy', 'Can delete a purchaseReturn'),
(77, 0, 'Sale Management', 'sale-management', 'Getting Customer sale Menus'),
(78, 77, 'See all sale', 'sale-index', 'Can View all sale otherwise only able to see own sale'),
(79, 77, 'Add sale', 'sale-create', 'Can add a sale'),
(80, 77, 'view sale', 'sale-show', 'Can View a sale'),
(81, 77, 'Edit sale', 'sale-edit', 'Can edit a sale'),
(82, 77, 'Void sale', 'sale-destroy', 'Can void a sale'),
(83, 77, 'saleReturn list', 'saleReturn-index', 'Can View all saleReturn'),
(84, 77, 'Add saleReturn', 'saleReturn-create', 'Can add a saleReturn'),
(85, 77, 'view saleReturn', 'saleReturn-show', 'Can View a saleReturn'),
(86, 77, 'Edit saleReturn', 'saleReturn-edit', 'Can edit a saleReturn'),
(87, 77, 'delete saleReturn', 'saleReturn-destroy', 'Can delete a saleReturn'),
(88, 0, 'Site Settings', 'site-setting', 'Setting the site info'),
(89, 88, 'site list', 'siteSetting-index', 'Can View all sale'),
(91, 88, 'site info', 'siteSetting-show', 'Can View info of the site'),
(92, 88, 'Edit site', 'siteSetting-edit', 'Can edit a site info'),
(93, 0, 'Bank Management', 'bank-management', 'Setting the site info'),
(94, 93, 'bankaccount list', 'bankaccount-index', 'Can View all bankaccount'),
(95, 93, 'bankaccount info', 'bankaccount-show', 'Can View info of the bankaccount'),
(96, 93, 'bankaccount edit', 'bankaccount-edit', 'Can edit a bankaccount info'),
(97, 93, 'bankaccount create', 'bankaccount-create', 'Can create all bankaccount'),
(98, 93, 'Bank tranction Create', 'bankTransaction-create', 'Can create Bank tranction'),
(99, 93, 'Bank tranction list', 'bankTransaction-index', 'Can show list all bank'),
(100, 93, 'Bank tranction list', 'bankTransaction-show', 'Can show bank transaction'),
(101, 0, 'Accounts', 'account-management', 'Setting the site info'),
(102, 101, 'transaction list', 'transaction-index', 'Can View all transaction'),
(103, 101, 'transaction info', 'transaction-show', 'Can View info of the transaction'),
(104, 101, 'transaction edit', 'transaction-edit', 'Can edit a transaction info'),
(105, 101, 'transaction create', 'transaction-makepayment', 'Can pay transaction amount'),
(106, 101, 'transaction receoved', 'transaction-receivedpayment', 'Can recevied transaction amount'),
(107, 0, 'Expense', 'expense-management', 'expense the site info'),
(108, 107, 'expenseCategory Management-list', 'expenseCategory-index', 'Can View all expenseCategory'),
(109, 107, 'expenseCategory info', 'expenseCategory-show', 'Can View info of the expenseCategory'),
(110, 107, 'expenseCategory edit', 'expenseCategory-edit', 'Can edit a expenseCategory info'),
(111, 107, 'expenseCategory create', 'expenseCategory-create', 'Can pay expenseCategory amount'),
(112, 107, 'expense list', 'expense-index', 'Can View all expense'),
(113, 107, 'expense info', 'expense-show', 'Can View info of the expense'),
(114, 107, 'expense edit', 'expense-edit', 'Can edit a expense info'),
(115, 107, 'expense create', 'expense-create', 'Can pay expense amount'),
(116, 107, 'expense destroy', 'expense-destroy', 'Can delete expense'),
(117, 107, 'expense create', 'expense-receivedpayment', 'Can recevied expense amount'),
(118, 0, 'Reports', 'report-management', 'Reports Module'),
(119, 118, 'sale report', 'report-sale', 'Can View all sale report'),
(120, 118, 'purchase report', 'report-purchase', 'Can View all purchase report'),
(121, 118, 'expense report', 'report-expense', 'Can View all expense report'),
(122, 118, 'payments report', 'report-payments', 'Can View all payments report'),
(123, 118, 'received report', 'report-received', 'Can View all received report'),
(124, 118, 'p&l report', 'report-p&l', 'Can View all p&l report'),
(125, 118, 'income-statement report', 'report-income-statement', 'Can View all income-statement report'),
(126, 118, 'purchase-return report', 'report-purchase-return', 'Can View all purchase-return report'),
(127, 118, 'sales-return report', 'report-sales-return', 'Can View all sales-return report'),
(128, 118, 'cash-flow report', 'report-cash-flow', 'Can View all cash-flow report'),
(129, 118, 'Todays report', 'report-today', 'Can View todays report'),
(130, 0, 'Stocks', 'stock-management', 'stock Module'),
(131, 130, 'expiry stock', 'stock-expiry', 'Can View all expiry stock'),
(132, 130, 'closing stock', 'stock-closing', 'Can View all closing stock'),
(133, 130, 'batch stock', 'stock-batch', 'Can View all batch stock'),
(134, 130, 'low stock', 'stock-low', 'Can View all low stock'),
(135, 0, 'Taxes', 'tax-management', 'Tax Module'),
(136, 135, 'Tax List', 'tax-index', 'Can View all Tax List'),
(137, 135, 'Pay Tax', 'tax-pay', 'Can pay taxes'),
(138, 28, 'Can Add Batch', 'batch-create', 'Can create a product batch'),
(139, 28, 'Can Delete Batch', 'batch-destroy', 'Can delete a product batch'),
(140, 77, 'Restore void', 'sale-voidrestore', 'Can restore a voided sale'),
(141, 28, 'Export/Import', 'product-export-import', 'Product export import option');

-- --------------------------------------------------------

--
-- Table structure for table `persistences`
--

CREATE TABLE `persistences` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `persistences`
--

INSERT INTO `persistences` (`id`, `user_id`, `code`, `created_at`, `updated_at`) VALUES
(1, 1, 'BNVckGxtJuY8LpDZnQbSW5GPFXIObbh4', '2020-03-04 07:51:06', '2020-03-04 07:51:06'),
(2, 6, 'aNRfxgi3JfE2gv7rYN9aHlqouj6HZOn6', '2020-03-04 07:51:59', '2020-03-04 07:51:59'),
(3, 1, '2DVABPpN3a2bW7AnDr4utkpWxQ4tgRTq', '2020-03-04 07:55:12', '2020-03-04 07:55:12'),
(4, 6, 'XOX6b2lbDwvejK41fy3iOtHeSBOvoQaY', '2020-03-04 08:00:57', '2020-03-04 08:00:57'),
(5, 5, '3pIW9eHV2LASQCA3lRRCWWNeDznDjSBS', '2020-03-04 08:03:06', '2020-03-04 08:03:06');

-- --------------------------------------------------------

--
-- Table structure for table `pharma_batches`
--

CREATE TABLE `pharma_batches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `purchase_item_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `batch_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `in_stock` int(11) NOT NULL,
  `expiry_date` date NOT NULL,
  `status` enum('Active','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pharma_batches`
--

INSERT INTO `pharma_batches` (`id`, `product_id`, `purchase_id`, `purchase_item_id`, `batch_number`, `in_stock`, `expiry_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 60, 0, 0, 'batch-00001', 100, '2023-12-06', 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(2, 59, 0, 0, 'batch-00002', 66, '2022-09-02', 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(3, 57, 0, 0, 'batch-00003', 97, '2024-02-03', 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(4, 58, 0, 0, 'batch-00004', 43, '2025-05-17', 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(5, 39, 0, 0, 'batch-00005', 74, '2019-03-25', 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(6, 33, 0, 0, 'batch-00006', 2, '2021-04-11', 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(7, 28, 0, 0, 'batch-00007', 7, '2021-02-14', 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(8, 56, 0, 0, 'batch-00008', 6, '2025-12-25', 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(9, 12, 0, 0, 'batch-00009', 48, '2024-12-14', 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(10, 40, 0, 0, 'batch-00010', 89, '2022-01-16', 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(11, 9, 0, 0, 'batch-00011', 95, '2019-10-03', 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(12, 7, 0, 0, 'batch-00012', 14, '2020-09-15', 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(13, 37, 0, 0, 'batch-00013', 85, '2022-02-13', 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(14, 28, 0, 0, 'batch-00014', 49, '2019-05-26', 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(15, 12, 0, 0, 'batch-00015', 87, '2023-10-06', 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(16, 44, 0, 0, 'batch-00016', 13, '2023-05-27', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(17, 40, 0, 0, 'batch-00017', 41, '2025-02-26', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(18, 59, 0, 0, 'batch-00018', 69, '2021-01-14', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(19, 51, 0, 0, 'batch-00019', 50, '2022-02-10', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(20, 46, 0, 0, 'batch-00020', 63, '2025-03-20', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(21, 3, 0, 0, 'batch-00021', 43, '2020-11-19', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(22, 36, 0, 0, 'batch-00022', 72, '2025-06-06', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(23, 32, 0, 0, 'batch-00023', 32, '2023-05-23', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(24, 51, 0, 0, 'batch-00024', 50, '2025-04-18', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(25, 27, 0, 0, 'batch-00025', 68, '2020-06-28', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(26, 38, 0, 0, 'batch-00026', 60, '2019-08-23', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(27, 53, 0, 0, 'batch-00027', 59, '2024-09-10', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(28, 18, 0, 0, 'batch-00028', 25, '2024-09-21', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(29, 13, 0, 0, 'batch-00029', 95, '2024-01-21', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(30, 4, 0, 0, 'batch-00030', 28, '2022-03-06', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(31, 59, 0, 0, 'batch-00031', 45, '2022-08-01', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(32, 48, 0, 0, 'batch-00032', 51, '2024-05-24', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(33, 49, 0, 0, 'batch-00033', 21, '2019-08-11', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(34, 16, 0, 0, 'batch-00034', 61, '2019-11-24', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(35, 13, 0, 0, 'batch-00035', 33, '2024-12-08', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(36, 8, 0, 0, 'batch-00036', 88, '2025-08-28', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(37, 9, 0, 0, 'batch-00037', 47, '2022-12-06', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(38, 47, 0, 0, 'batch-00038', 12, '2022-01-08', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(39, 54, 0, 0, 'batch-00039', 3, '2023-03-13', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(40, 20, 0, 0, 'batch-00040', 71, '2019-08-12', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(41, 22, 0, 0, 'batch-00041', 70, '2020-06-25', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(42, 26, 0, 0, 'batch-00042', 47, '2025-08-06', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(43, 26, 0, 0, 'batch-00043', 34, '2022-09-07', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(44, 47, 0, 0, 'batch-00044', 11, '2023-05-08', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(45, 48, 0, 0, 'batch-00045', 27, '2019-06-03', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(46, 4, 0, 0, 'batch-00046', 34, '2019-07-06', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(47, 51, 0, 0, 'batch-00047', 81, '2020-09-02', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(48, 1, 0, 0, 'batch-00048', 95, '2023-11-14', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(49, 58, 0, 0, 'batch-00049', 13, '2021-04-24', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(50, 34, 0, 0, 'batch-00050', 23, '2024-09-12', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(51, 21, 0, 0, 'batch-00051', 10, '2019-05-18', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(52, 4, 0, 0, 'batch-00052', 39, '2025-05-26', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(53, 8, 0, 0, 'batch-00053', 2, '2025-07-12', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(54, 39, 0, 0, 'batch-00054', 68, '2021-09-20', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(55, 19, 0, 0, 'batch-00055', 66, '2025-05-11', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(56, 6, 0, 0, 'batch-00056', 97, '2019-04-21', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(57, 8, 0, 0, 'batch-00057', 83, '2020-08-08', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(58, 4, 0, 0, 'batch-00058', 15, '2020-07-19', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(59, 21, 0, 0, 'batch-00059', 65, '2025-09-23', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(60, 9, 0, 0, 'batch-00060', 59, '2022-07-24', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(61, 26, 0, 0, 'batch-00061', 3, '2022-07-05', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(62, 15, 0, 0, 'batch-00062', 100, '2021-11-12', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(63, 46, 0, 0, 'batch-00063', 25, '2019-04-24', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(64, 46, 0, 0, 'batch-00064', 86, '2020-04-27', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(65, 4, 0, 0, 'batch-00065', 64, '2019-10-17', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(66, 59, 0, 0, 'batch-00066', 9, '2020-04-13', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(67, 7, 0, 0, 'batch-00067', 87, '2021-05-05', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(68, 26, 0, 0, 'batch-00068', 39, '2020-09-05', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(69, 41, 0, 0, 'batch-00069', 6, '2020-07-21', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(70, 12, 0, 0, 'batch-00070', 24, '2023-04-14', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(71, 4, 0, 0, 'batch-00071', 89, '2021-11-02', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(72, 7, 0, 0, 'batch-00072', 5, '2023-04-23', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(73, 35, 0, 0, 'batch-00073', 59, '2022-07-09', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(74, 12, 0, 0, 'batch-00074', 79, '2025-01-26', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(75, 32, 0, 0, 'batch-00075', 24, '2020-07-07', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(76, 52, 0, 0, 'batch-00076', 10, '2024-07-19', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(77, 56, 0, 0, 'batch-00077', 94, '2019-12-26', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(78, 55, 0, 0, 'batch-00078', 33, '2019-08-18', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(79, 12, 0, 0, 'batch-00079', 76, '2020-03-03', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(80, 41, 0, 0, 'batch-00080', 86, '2025-05-15', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(81, 54, 0, 0, 'batch-00081', 31, '2019-05-28', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(82, 22, 0, 0, 'batch-00082', 20, '2023-10-13', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(83, 8, 0, 0, 'batch-00083', 52, '2023-07-22', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(84, 45, 0, 0, 'batch-00084', 34, '2024-11-26', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(85, 55, 0, 0, 'batch-00085', 9, '2020-06-04', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(86, 36, 0, 0, 'batch-00086', 51, '2020-10-04', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(87, 23, 0, 0, 'batch-00087', 93, '2021-05-14', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(88, 42, 0, 0, 'batch-00088', 3, '2019-11-01', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(89, 24, 0, 0, 'batch-00089', 57, '2022-11-02', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(90, 43, 0, 0, 'batch-00090', 89, '2022-10-10', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(91, 10, 0, 0, 'batch-00091', 31, '2021-05-04', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(92, 29, 0, 0, 'batch-00092', 40, '2021-03-11', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(93, 34, 0, 0, 'batch-00093', 43, '2022-06-09', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(94, 57, 0, 0, 'batch-00094', 77, '2025-05-12', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(95, 56, 0, 0, 'batch-00095', 80, '2019-02-09', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(96, 53, 0, 0, 'batch-00096', 66, '2023-11-21', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(97, 20, 0, 0, 'batch-00097', 69, '2020-06-26', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(98, 51, 0, 0, 'batch-00098', 4, '2024-02-14', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(99, 6, 0, 0, 'batch-00099', 34, '2025-08-15', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51'),
(100, 34, 0, 0, 'batch-00100', 97, '2019-02-22', 'Active', '2020-03-04 07:50:51', '2020-03-04 07:50:51');

-- --------------------------------------------------------

--
-- Table structure for table `pharma_categories`
--

CREATE TABLE `pharma_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pharma_categories`
--

INSERT INTO `pharma_categories` (`id`, `name`, `slug`, `description`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Antibiotics', 'antibiotics', 'Antibiotics', 'Active', 1, '2020-03-04 07:50:49', '2020-03-04 07:50:49'),
(2, 'Paracetamol', 'paracetamol', 'Paracetamol', 'Active', 1, '2020-03-04 07:50:49', '2020-03-04 07:50:49');

-- --------------------------------------------------------

--
-- Table structure for table `pharma_manufacturers`
--

CREATE TABLE `pharma_manufacturers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `manufacturer_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `manufacturer_balance` double DEFAULT 0,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pharma_manufacturers`
--

INSERT INTO `pharma_manufacturers` (`id`, `manufacturer_name`, `slug`, `phone`, `address`, `manufacturer_balance`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Beximcom', 'beximcom', '2345365457', '270/c,Mirpur,Dhaka', 0, 'Active', 1, '2020-03-04 07:50:49', '2020-03-04 07:50:49'),
(2, 'Ibsina', 'ibsina', '45665756', '331/C,malibag,dhaka', 10000, 'Active', 1, '2020-03-04 07:50:49', '2020-03-04 07:50:49'),
(3, 'ACME', 'acme', '45665756', '331/C,malibag,dhaka', 10000, 'Active', 1, '2020-03-04 07:50:49', '2020-03-04 07:50:49'),
(4, 'Bristol Pharma ltd', 'bristol-pharma-ltd', '456655756', '330/c,Rampura,dhaka', 0, 'Active', 1, '2020-03-04 07:50:49', '2020-03-04 07:50:49');

-- --------------------------------------------------------

--
-- Table structure for table `pharma_products`
--

CREATE TABLE `pharma_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `generic_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `box_size` int(11) NOT NULL DEFAULT 0,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax` decimal(8,2) DEFAULT 0.00,
  `purchase_price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `sale_price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `stock` int(11) NOT NULL DEFAULT 0,
  `shelf_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `manufacturer_id` bigint(20) UNSIGNED NOT NULL,
  `product_type_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pharma_products`
--

INSERT INTO `pharma_products` (`id`, `title`, `slug`, `generic_name`, `note`, `box_size`, `image`, `tax`, `purchase_price`, `sale_price`, `stock`, `shelf_no`, `category_id`, `user_id`, `unit_id`, `manufacturer_id`, `product_type_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Tab-Calbo', 'tab-calbo', 'Tab-Calbo', 'Est quia et expedita sed.', 15, '', 4.00, 552.00, 598.00, 95, 'self-8', 2, 1, 4, 2, 1, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(2, 'Carva', 'carva', 'Carva', 'Voluptates ducimus occaecati voluptatem dignissimos vel occaecati ipsum est.', 631, '', 14.00, 237.00, 280.00, 0, 'self-75', 1, 1, 3, 1, 2, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(3, 'B 50 Forte', 'b-50-forte', 'B 50 Forte', 'Sunt est iusto quas quibusdam rerum.', 283, '', 10.00, 366.00, 441.00, 43, 'self-4', 1, 1, 2, 1, 1, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(4, 'Cap. Moxacil (250 mg)', 'cap-moxacil-250-mg', 'Cap. Moxacil (250 mg)', 'Ut dolorem ullam rem aliquid suscipit sapiente.', 467, '', 11.00, 796.00, 862.00, 269, 'self-98', 1, 1, 4, 2, 1, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(5, 'Drop-Lebac', 'drop-lebac', 'Drop-Lebac', 'Temporibus quas dolorum exercitationem ut amet laudantium.', 656, '', 9.00, 45.00, 112.00, 0, 'self-74', 1, 1, 2, 3, 2, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(6, 'Drop Moxacil Peadiativ', 'drop-moxacil-peadiativ', 'Drop Moxacil Peadiativ', 'Id molestiae eaque expedita a blanditiis ea error.', 423, '', 13.00, 196.00, 275.00, 131, 'self-57', 1, 1, 2, 4, 2, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(7, 'Tab. Cardipro 50 mg', 'tab-cardipro-50-mg', 'Tab. Cardipro 50 mg', 'Corporis et minima provident exercitationem.', 373, '', 6.00, 220.00, 244.00, 106, 'self-82', 1, 1, 3, 1, 2, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(8, 'Cap. Cef-3 (400 mg)', 'cap-cef-3-400-mg', 'Cap. Cef-3 (400 mg)', 'Eius similique ad veritatis quo.', 28, '', 0.00, 456.00, 552.00, 225, 'self-87', 2, 1, 1, 4, 2, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(9, 'Tab. Cotrim (480 mg)', 'tab-cotrim-480-mg', 'Tab. Cotrim (480 mg)', 'Non rerum est qui et dignissimos non modi.', 41, '', 5.00, 893.00, 919.00, 201, 'self-80', 1, 1, 1, 2, 2, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(10, 'Susp. Cotrim (60 mg)', 'susp-cotrim-60-mg', 'Susp. Cotrim (60 mg)', 'Quibusdam voluptas libero dolores ea quidem dicta.', 465, '', 9.00, 670.00, 736.00, 31, 'self-52', 1, 1, 2, 2, 2, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(11, 'Calbo-D', 'calbo-d', 'Calbo-D', 'Rerum ut modi aut porro atque dolor omnis.', 786, '', 2.00, 885.00, 918.00, 0, 'self-46', 2, 1, 2, 2, 2, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(12, 'Cap.Doxacil (100 mg)', 'capdoxacil-100-mg', 'Cap.Doxacil (100 mg)', 'Deserunt ut optio ut et quia esse.', 84, '', 8.00, 610.00, 691.00, 314, 'self-92', 2, 1, 4, 1, 2, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(13, 'Nexum (20 mg)', 'nexum-20-mg', 'Nexum (20 mg)', 'Voluptatem qui totam ut aliquid fuga odio.', 759, '', 1.00, 606.00, 629.00, 128, 'self-12', 1, 1, 1, 1, 2, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(14, 'Nexum (40 mg)', 'nexum-40-mg', 'Nexum (40 mg)', 'Et numquam exercitationem dolores nulla sunt qui cum voluptatem.', 620, '', 13.00, 550.00, 632.00, 0, 'self-64', 2, 1, 3, 4, 1, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(15, 'Filwel Gold', 'filwel-gold', 'Filwel Gold', 'Inventore odio eveniet reprehenderit officia.', 939, '', 14.00, 924.00, 959.00, 100, 'self-85', 1, 1, 1, 1, 1, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(16, 'Tab Zimax (500 mg)', 'tab-zimax-500-mg', 'Tab Zimax (500 mg)', 'Nemo sapiente cupiditate accusamus officiis.', 926, '', 7.00, 76.00, 102.00, 61, 'self-1', 1, 1, 4, 1, 1, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(17, 'Sup Zimax (15 ml)', 'sup-zimax-15-ml', 'Sup Zimax (15 ml)', 'Nam amet est dolores.', 312, '', 14.00, 844.00, 869.00, 0, 'self-38', 1, 1, 2, 4, 1, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(18, 'Sup Zimax (30 ml)', 'sup-zimax-30-ml', 'Sup Zimax (30 ml)', 'Maxime ad est sit voluptates autem similique quaerat.', 779, '', 12.00, 18.00, 34.00, 25, 'self-62', 1, 1, 3, 3, 1, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(19, 'A Fan Cream', 'a-fan-cream', 'A Fan Cream', 'Maiores ipsa ipsum reiciendis aut aut qui.', 828, '', 4.00, 484.00, 548.00, 66, 'self-93', 1, 1, 2, 1, 1, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(20, 'Tab. Amodis (400 mg)', 'tab-amodis-400-mg', 'Tab. Amodis (400 mg)', 'Ullam earum sit quaerat earum commodi voluptatem exercitationem incidunt.', 459, '', 14.00, 972.00, 994.00, 140, 'self-22', 1, 1, 3, 1, 2, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(21, 'Multivit Plus', 'multivit-plus', 'Multivit Plus', 'Soluta sunt voluptatibus alias quos.', 463, '', 3.00, 641.00, 670.00, 75, 'self-27', 1, 1, 4, 1, 1, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(22, 'Cap.Seclo 20 mg', 'capseclo-20-mg', 'Cap.Seclo 20 mg', 'Minima aspernatur minima non dolorum.', 377, '', 0.00, 44.00, 101.00, 90, 'self-88', 1, 1, 4, 4, 1, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(23, 'Tab Anril SR', 'tab-anril-sr', 'Tab Anril SR', 'Sint facere vel rem commodi omnis vero sed.', 36, '', 2.00, 174.00, 210.00, 93, 'self-87', 2, 1, 4, 2, 2, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(24, 'Phylopen Fotre', 'phylopen-fotre', 'Phylopen Fotre', 'Nesciunt rerum fuga labore quibusdam sequi in perspiciatis.', 965, '', 7.00, 346.00, 396.00, 57, 'self-79', 1, 1, 4, 4, 2, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(25, 'Flurigin', 'flurigin', 'Flurigin', 'Cum voluptas quibusdam non minima et et.', 392, '', 13.00, 261.00, 346.00, 0, 'self-61', 1, 1, 2, 2, 2, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(26, 'Tab. Ace (500mg)', 'tab-ace-500mg', 'Tab. Ace (500mg)', 'Qui occaecati et et maiores.', 448, '', 2.00, 177.00, 221.00, 123, 'self-55', 2, 1, 3, 1, 2, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(27, 'Syp. Ace (60 ml)', 'syp-ace-60-ml', 'Syp. Ace (60 ml)', 'Ex earum necessitatibus consequatur aut voluptatem.', 235, '', 15.00, 731.00, 753.00, 68, 'self-99', 2, 1, 4, 4, 1, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(28, 'Syp. Ace Padiatic', 'syp-ace-padiatic', 'Syp. Ace Padiatic', 'Quis fuga labore non iusto.', 861, '', 9.00, 193.00, 292.00, 56, 'self-23', 1, 1, 3, 3, 1, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(29, 'Zifolet', 'zifolet', 'Zifolet', 'Deleniti cumque quas molestias quia et.', 448, '', 9.00, 274.00, 355.00, 40, 'self-18', 2, 1, 1, 4, 2, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(30, 'Loratin 10 mg', 'loratin-10-mg', 'Loratin 10 mg', 'Ut architecto quaerat provident.', 291, '', 9.00, 269.00, 323.00, 0, 'self-41', 2, 1, 4, 1, 1, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(31, 'Neotack', 'neotack', 'Neotack', 'Hic suscipit sequi incidunt deserunt qui ad ea.', 927, '', 7.00, 894.00, 991.00, 0, 'self-88', 2, 1, 3, 2, 2, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(32, 'Ceevit', 'ceevit', 'Ceevit', 'Et adipisci laborum perspiciatis eos et aut.', 243, '', 14.00, 23.00, 104.00, 56, 'self-66', 1, 1, 3, 2, 2, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(33, 'Zif-CI', 'zif-ci', 'Zif-CI', 'Eum repellat et nobis commodi natus velit et.', 813, '', 12.00, 132.00, 214.00, 2, 'self-26', 1, 1, 1, 4, 1, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(34, 'Zif- Forte', 'zif-forte', 'Zif- Forte', 'Aut aliquam a ullam aut tempora aut.', 526, '', 2.00, 434.00, 483.00, 163, 'self-65', 2, 1, 3, 2, 2, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(35, 'Tab Cerevas 5 mg', 'tab-cerevas-5-mg', 'Tab Cerevas 5 mg', 'Distinctio ut veniam dolorum error voluptatem magni.', 192, '', 2.00, 227.00, 286.00, 59, 'self-64', 2, 1, 1, 2, 2, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(36, 'Cap-Maxrin 0.4 mg', 'cap-maxrin-04-mg', 'Cap-Maxrin 0.4 mg', 'Illo et est quis porro.', 563, '', 11.00, 262.00, 270.00, 123, 'self-9', 2, 1, 2, 4, 1, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(37, 'Tab-Rasuva 5 mg', 'tab-rasuva-5-mg', 'Tab-Rasuva 5 mg', 'Impedit voluptas assumenda voluptatem aliquam ut et libero.', 764, '', 3.00, 252.00, 263.00, 85, 'self-53', 2, 1, 1, 4, 2, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(38, 'Syp-Becozine I', 'syp-becozine-i', 'Syp-Becozine I', 'Nihil quaerat dolores et qui corporis a.', 324, '', 15.00, 947.00, 966.00, 60, 'self-28', 1, 1, 4, 4, 1, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(39, 'Syp- Alarid', 'syp-alarid', 'Syp- Alarid', 'Eius expedita doloribus et sit et.', 588, '', 14.00, 437.00, 516.00, 142, 'self-4', 1, 1, 2, 2, 1, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(40, 'Tab-Triptin-10 mg', 'tab-triptin-10-mg', 'Tab-Triptin-10 mg', 'Soluta non nihil dolorem et architecto.', 517, '', 15.00, 471.00, 501.00, 130, 'self-23', 1, 1, 2, 1, 2, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(41, 'Tab-Marison 6mg', 'tab-marison-6mg', 'Tab-Marison 6mg', 'Qui quasi et nesciunt dignissimos est aut officiis.', 473, '', 2.00, 229.00, 310.00, 92, 'self-10', 1, 1, 1, 4, 2, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(42, 'Tab-Zimax 250mg', 'tab-zimax-250mg', 'Tab-Zimax 250mg', 'Consequuntur ratione nihil saepe et recusandae mollitia.', 595, '', 9.00, 97.00, 158.00, 3, 'self-3', 2, 1, 3, 4, 1, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(43, 'Syp-Levoster 50mg', 'syp-levoster-50mg', 'Syp-Levoster 50mg', 'Nihil libero id ea ut odio iusto animi.', 272, '', 0.00, 122.00, 205.00, 89, 'self-5', 1, 1, 2, 2, 2, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(44, 'Tab-Famotack 50mg', 'tab-famotack-50mg', 'Tab-Famotack 50mg', 'Saepe quo rerum officiis est quo debitis voluptas tenetur.', 466, '', 13.00, 838.00, 873.00, 13, 'self-35', 1, 1, 3, 3, 2, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(45, 'Tab-Angilock plus', 'tab-angilock-plus', 'Tab-Angilock plus', 'In sunt aliquid vero autem.', 329, '', 10.00, 848.00, 905.00, 34, 'self-32', 1, 1, 3, 4, 2, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(46, 'Tab-Rasuva 10 mg', 'tab-rasuva-10-mg', 'Tab-Rasuva 10 mg', 'Delectus illo atque est totam aut at.', 190, '', 3.00, 470.00, 544.00, 174, 'self-41', 1, 1, 4, 4, 1, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(47, 'Syp-Fenadin', 'syp-fenadin', 'Syp-Fenadin', 'Sit occaecati ea et vero maiores voluptas.', 142, '', 15.00, 487.00, 572.00, 23, 'self-13', 1, 1, 2, 4, 1, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(48, 'Maxpro 20 mg', 'maxpro-20-mg', 'Maxpro 20 mg', 'Aliquid et veritatis non.', 506, '', 7.00, 961.00, 1048.00, 78, 'self-69', 2, 1, 3, 1, 1, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(49, 'Becosule Gold', 'becosule-gold', 'Becosule Gold', 'Qui eveniet consequuntur cum numquam.', 664, '', 6.00, 735.00, 776.00, 21, 'self-71', 1, 1, 3, 1, 2, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(50, 'Calcin-D 500 mg', 'calcin-d-500-mg', 'Calcin-D 500 mg', 'Distinctio autem qui ipsam aliquid quaerat illum cumque voluptas.', 338, '', 7.00, 925.00, 959.00, 0, 'self-43', 1, 1, 1, 1, 1, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(51, 'Tab-Gestronal', 'tab-gestronal', 'Tab-Gestronal', 'Culpa dolore voluptatem odio.', 915, '', 2.00, 377.00, 470.00, 185, 'self-96', 1, 1, 2, 4, 2, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(52, 'Levoking 500 mg', 'levoking-500-mg', 'Levoking 500 mg', 'Rerum minima magni et aliquid qui odit.', 135, '', 4.00, 973.00, 1005.00, 10, 'self-16', 2, 1, 2, 4, 1, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(53, 'Zithtim ', 'zithtim', 'Zithtim ', 'Ad rerum eum fugiat animi inventore consectetur labore.', 344, '', 11.00, 691.00, 746.00, 125, 'self-91', 1, 1, 4, 4, 2, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(54, 'Cap. Lucan-R (150mg)', 'cap-lucan-r-150mg', 'Cap. Lucan-R (150mg)', 'Esse eos quae accusamus vel.', 116, '', 2.00, 712.00, 798.00, 34, 'self-8', 1, 1, 4, 4, 1, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(55, 'Orcef 400mg', 'orcef-400mg', 'Orcef 400mg', 'Minus dolorem quia dolorem ut.', 477, '', 7.00, 969.00, 1021.00, 42, 'self-57', 1, 1, 1, 2, 2, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(56, 'Normens', 'normens', 'Normens', 'Rerum odio sit soluta et.', 577, '', 0.00, 646.00, 663.00, 180, 'self-14', 1, 1, 1, 3, 1, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(57, 'Tab-Ceclofen', 'tab-ceclofen', 'Tab-Ceclofen', 'Nihil modi perferendis magni alias cupiditate.', 958, '', 5.00, 830.00, 896.00, 174, 'self-32', 2, 1, 3, 1, 1, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(58, 'Tab-Domerin', 'tab-domerin', 'Tab-Domerin', 'Ut quidem aliquam quia.', 373, '', 10.00, 93.00, 135.00, 56, 'self-60', 1, 1, 3, 3, 2, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(59, 'Tab-Zithrin 500 mg', 'tab-zithrin-500-mg', 'Tab-Zithrin 500 mg', 'Id reiciendis sed ut recusandae sed mollitia.', 458, '', 4.00, 452.00, 486.00, 189, 'self-39', 2, 1, 3, 1, 2, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50'),
(60, 'Tab Algin', 'tab-algin', 'Tab Algin', 'Incidunt vel fugiat eligendi tempore consequatur dolorem voluptas.', 183, '', 14.00, 276.00, 333.00, 100, 'self-4', 1, 1, 2, 2, 1, 'Active', '2020-03-04 07:50:50', '2020-03-04 07:50:50');

-- --------------------------------------------------------

--
-- Table structure for table `pharma_product_taxes`
--

CREATE TABLE `pharma_product_taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tax_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pharma_product_taxes`
--

INSERT INTO `pharma_product_taxes` (`id`, `tax_name`, `tax_amount`, `slug`, `description`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'income tax', 5.00, 'income-tax', 'Peices', 1, 'Active', '2020-03-04 07:50:49', '2020-03-04 07:50:49');

-- --------------------------------------------------------

--
-- Table structure for table `pharma_product_types`
--

CREATE TABLE `pharma_product_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pharma_product_types`
--

INSERT INTO `pharma_product_types` (`id`, `type_name`, `slug`, `description`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Tablet', 'tablet', 'Tablet', 'Active', 1, '2020-03-04 07:50:49', '2020-03-04 07:50:49'),
(2, 'Liquid', 'liquid', 'Liquid', 'Active', 1, '2020-03-04 07:50:49', '2020-03-04 07:50:49');

-- --------------------------------------------------------

--
-- Table structure for table `pharma_purchases`
--

CREATE TABLE `pharma_purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `invoice` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `tax_percent` decimal(8,2) NOT NULL DEFAULT 0.00,
  `grand_total` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(6,2) NOT NULL DEFAULT 0.00,
  `payable_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `trans_id` int(11) NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `manufacturer_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `status` enum('Active','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pharma_purchase_items`
--

CREATE TABLE `pharma_purchase_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `manufacturer_id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `unit_price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `total_price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `was_stock` int(11) NOT NULL DEFAULT 0,
  `new_stock` int(11) NOT NULL DEFAULT 0,
  `status` enum('Active','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pharma_sales`
--

CREATE TABLE `pharma_sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `invoice` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` decimal(8,2) NOT NULL DEFAULT 0.00,
  `invoice_discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `total_discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `tax_percent` decimal(8,2) NOT NULL DEFAULT 0.00,
  `total_tax` decimal(8,2) NOT NULL DEFAULT 0.00,
  `grand_total` decimal(8,2) NOT NULL DEFAULT 0.00,
  `paid_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `new_balance` decimal(8,2) NOT NULL DEFAULT 0.00,
  `due_collection` decimal(8,2) NOT NULL DEFAULT 0.00,
  `change` decimal(8,2) NOT NULL DEFAULT 0.00,
  `trans_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `patient_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `status` enum('Active','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pharma_sale_items`
--

CREATE TABLE `pharma_sale_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `batch_id` bigint(20) UNSIGNED NOT NULL,
  `current_stock` int(11) NOT NULL,
  `expiry_date` date NOT NULL,
  `sale_qty` int(11) NOT NULL,
  `unit_price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_percent` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `total_price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `new_stock` int(11) NOT NULL DEFAULT 0,
  `status` enum('Active','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pharma_taxes`
--

CREATE TABLE `pharma_taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `sale_invoice` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `payment` enum('Due','Paid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Due',
  `status` enum('Void','Active') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pharma_units`
--

CREATE TABLE `pharma_units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unit_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pharma_units`
--

INSERT INTO `pharma_units` (`id`, `unit_name`, `slug`, `description`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Pcs', 'pcs', 'Peices', 1, 'Active', '2020-03-04 07:50:49', '2020-03-04 07:50:49'),
(2, 'Box', 'box', 'Box', 1, 'Active', '2020-03-04 07:50:49', '2020-03-04 07:50:49'),
(3, 'Pot', 'pot', 'Pot', 1, 'Active', '2020-03-04 07:50:49', '2020-03-04 07:50:49'),
(4, 'Bottle', 'bottle', 'Bottle', 1, 'Active', '2020-03-04 07:50:49', '2020-03-04 07:50:49');

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions`
--

CREATE TABLE `prescriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `symptoms` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diagnosis` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `advices` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `next_appointment` date NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `appointment_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('Active','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pre_medicines`
--

CREATE TABLE `pre_medicines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` int(11) DEFAULT NULL,
  `pre_medicine_type_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('Active','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pre_medicines`
--

INSERT INTO `pre_medicines` (`id`, `name`, `count`, `pre_medicine_type_id`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Mucinex', NULL, 1, 5, 'Active', '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(2, 'Hycodan', NULL, 1, 5, 'Active', '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(3, 'Vitamin', NULL, 2, 5, 'Active', '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(4, 'Antibiotic', NULL, 2, 5, 'Active', '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(5, 'Naproxen', NULL, 3, 5, 'Active', '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(6, 'Napa', NULL, 4, 5, 'Active', '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(7, 'Ocular Lubricant Eye Drop', NULL, 5, 5, 'Active', '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(8, 'Asthma', NULL, 6, 5, 'Active', '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(9, 'Intravenous injection', NULL, 7, 5, 'Active', '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(10, 'Intramuscular injection', NULL, 7, 5, 'Active', '2020-03-04 07:50:52', '2020-03-04 07:50:52');

-- --------------------------------------------------------

--
-- Table structure for table `pre_medicine_items`
--

CREATE TABLE `pre_medicine_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `days` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `use_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Active','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `pre_medicine_id` bigint(20) UNSIGNED NOT NULL,
  `prescription_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pre_medicine_types`
--

CREATE TABLE `pre_medicine_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Active','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pre_medicine_types`
--

INSERT INTO `pre_medicine_types` (`id`, `name`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Liquid', 'Active', 5, '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(2, 'Tablet', 'Active', 2, '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(3, 'Capsules', 'Active', 1, '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(4, 'Suppositories', 'Active', 4, '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(5, 'Drops', 'Active', 5, '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(6, 'Inhalers', 'Active', 3, '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(7, 'Injections', 'Active', 1, '2020-03-04 07:50:52', '2020-03-04 07:50:52');

-- --------------------------------------------------------

--
-- Table structure for table `pre_routines`
--

CREATE TABLE `pre_routines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pre_medicine_type_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('Active','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pre_routines`
--

INSERT INTO `pre_routines` (`id`, `name`, `pre_medicine_type_id`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, '1/0/1', 1, 5, 'Active', '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(2, '1/1/1', 2, 4, 'Active', '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(3, '0/0/1', 3, 2, 'Active', '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(4, '0/1/0', 4, 1, 'Active', '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(5, '1/0/0', 5, 3, 'Active', '2020-03-04 07:50:52', '2020-03-04 07:50:52'),
(6, '1/0/1', 6, 2, 'Active', '2020-03-04 07:50:52', '2020-03-04 07:50:52');

-- --------------------------------------------------------

--
-- Table structure for table `pre_test_items`
--

CREATE TABLE `pre_test_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `diagon_test_id` bigint(20) UNSIGNED NOT NULL,
  `prescription_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('Active','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(5,2) NOT NULL DEFAULT 0.00,
  `designation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referral_category_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `referrals`
--

INSERT INTO `referrals` (`id`, `name`, `price`, `designation`, `contact`, `email`, `referral_category_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Self', 0.00, 'self', '0000000', 'self@gmail.com', 1, 1, NULL, NULL),
(2, 'Dr.Md.Mosrafuzzaman', 0.00, 'MBBS,MCPS,FCGP,MCGPMPH,CCD', '01700791900', '', 1, 1, NULL, NULL),
(3, 'Dr.Rokeya Sultana', 0.00, 'MBBS,EOC,DMU', '01700791901', '', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `referral_categories`
--

CREATE TABLE `referral_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cat_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(5,2) NOT NULL DEFAULT 0.00,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

CREATE TABLE `reminders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `slug`, `name`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', '{\"user-management\":true,\"user-menu\":true,\"user-index\":true,\"user-view\":true,\"user-add\":true,\"user-store\":true,\"user-edit\":true,\"user-update\":true,\"user-delete\":true,\"role-menu\":true,\"role-index\":true,\"role-view\":true,\"role-add\":true,\"role-store\":true,\"role-edit\":true,\"role-update\":true,\"role-delete\":true,\"permission-menu\":true,\"permission-index\":true,\"permission-view\":true,\"permission-add\":true,\"permission-store\":true,\"permission-edit\":true,\"permission-update\":true,\"permission-delete\":true,\"activities\":true,\"notifacation\":true,\"product-management\":true,\"category-index\":true,\"category-create\":true,\"category-show\":true,\"category-edit\":true,\"category-destroy\":true,\"type-index\":true,\"type-create\":true,\"type-show\":true,\"type-edit\":true,\"type-destroy\":true,\"unit-index\":true,\"unit-create\":true,\"unit-show\":true,\"unit-edit\":true,\"unit-destroy\":true,\"tax-index\":true,\"tax-create\":true,\"tax-show\":true,\"tax-edit\":true,\"tax-destroy\":true,\"product-index\":true,\"product-create\":true,\"product-show\":true,\"product-edit\":true,\"product-destroy\":true,\"Manufacturer-management\":true,\"manufacturer-index\":true,\"manufacturer-create\":true,\"manufacturer-show\":true,\"manufacturer-edit\":true,\"manufacturer-destroy\":true,\"Customer-management\":true,\"customer-index\":true,\"customer-create\":true,\"customer-show\":true,\"customer-edit\":true,\"customer-destroy\":true,\"purchase-management\":true,\"purchase-index\":true,\"purchase-create\":true,\"purchase-show\":true,\"purchase-edit\":true,\"purchase-destroy\":true,\"purchaseReturn-index\":true,\"purchaseReturn-create\":true,\"purchaseReturn-show\":true,\"purchaseReturn-edit\":true,\"purchaseReturn-destroy\":true,\"sale-management\":true,\"sale-index\":true,\"sale-create\":true,\"sale-show\":true,\"sale-edit\":true,\"sale-destroy\":true,\"saleReturn-index\":true,\"saleReturn-create\":true,\"saleReturn-show\":true,\"saleReturn-edit\":true,\"saleReturn-destroy\":true,\"site-setting\":true,\"siteSetting-index\":true,\"siteSetting-show\":true,\"siteSetting-edit\":true,\"bank-management\":true,\"bankaccount-index\":true,\"bankaccount-show\":true,\"bankaccount-edit\":true,\"bankaccount-create\":true,\"bankTransaction-create\":true,\"bankTransaction-index\":true,\"bankTransaction-show\":true,\"account-management\":true,\"transaction-index\":true,\"transaction-show\":true,\"transaction-edit\":true,\"transaction-makepayment\":true,\"transaction-receivedpayment\":true,\"expense-management\":true,\"expenseCategory-index\":true,\"expenseCategory-show\":true,\"expenseCategory-edit\":true,\"expenseCategory-create\":true,\"expense-index\":true,\"expense-show\":true,\"expense-edit\":true,\"expense-create\":true,\"expense-destroy\":true,\"expense-receivedpayment\":true,\"report-management\":true,\"report-sale\":true,\"report-purchase\":true,\"report-expense\":true,\"report-payments\":true,\"report-received\":true,\"report-p&l\":true,\"report-income-statement\":true,\"report-purchase-return\":true,\"report-sales-return\":true,\"report-cash-flow\":true,\"report-today\":true,\"stock-management\":true,\"stock-expiry\":true,\"stock-closing\":true,\"stock-batch\":true,\"stock-low\":true,\"tax-management\":true,\"tax-index\":true,\"tax-pay\":true,\"batch-create\":true,\"batch-destroy\":true,\"sale-voidrestore\":true,\"product-export-import\":true}', '2020-03-04 07:50:48', '2020-03-04 07:50:48'),
(2, 'laboratory', 'Laboratory', '{\"notifacation\":true,\"activities\":true,\"product-management\":true,\"batch-destroy\":true,\"batch-create\":true,\"product-destroy\":true,\"product-edit\":true,\"product-show\":true,\"product-create\":true,\"product-index\":true,\"tax-destroy\":true,\"tax-edit\":true,\"tax-show\":true,\"tax-create\":true,\"tax-index\":true,\"unit-destroy\":true,\"unit-edit\":true,\"unit-show\":true,\"unit-create\":true,\"unit-index\":true,\"type-destroy\":true,\"type-edit\":true,\"type-show\":true,\"type-create\":true,\"type-index\":true,\"category-destroy\":true,\"category-edit\":true,\"category-show\":true,\"category-create\":true,\"category-index\":true,\"Manufacturer-management\":true,\"manufacturer-destroy\":true,\"manufacturer-edit\":true,\"manufacturer-show\":true,\"manufacturer-create\":true,\"manufacturer-index\":true,\"Customer-management\":true,\"customer-destroy\":true,\"customer-edit\":true,\"customer-show\":true,\"customer-create\":true,\"customer-index\":true,\"purchase-management\":true,\"purchaseReturn-destroy\":true,\"purchaseReturn-edit\":true,\"purchaseReturn-show\":true,\"purchaseReturn-create\":true,\"purchaseReturn-index\":true,\"purchase-destroy\":true,\"purchase-edit\":true,\"purchase-show\":true,\"purchase-create\":true,\"purchase-index\":true,\"sale-management\":true,\"saleReturn-destroy\":true,\"saleReturn-edit\":true,\"saleReturn-show\":true,\"saleReturn-create\":true,\"saleReturn-index\":true,\"sale-edit\":true,\"sale-show\":true,\"sale-create\":true,\"sale-index\":true,\"bank-management\":true,\"bankTransaction-show\":true,\"bankTransaction-index\":true,\"bankTransaction-create\":true,\"bankaccount-create\":true,\"bankaccount-edit\":true,\"bankaccount-show\":true,\"bankaccount-index\":true,\"account-management\":true,\"transaction-receivedpayment\":true,\"transaction-makepayment\":true,\"transaction-edit\":true,\"transaction-show\":true,\"transaction-index\":true,\"expense-management\":true,\"expense-receivedpayment\":true,\"expense-destroy\":true,\"expense-create\":true,\"expense-edit\":true,\"expense-show\":true,\"expense-index\":true,\"expenseCategory-create\":true,\"expenseCategory-edit\":true,\"expenseCategory-show\":true,\"expenseCategory-index\":true,\"report-management\":true,\"report-today\":true,\"report-cash-flow\":true,\"report-sales-return\":true,\"report-purchase-return\":true,\"report-income-statement\":true,\"report-p&l\":true,\"report-received\":true,\"report-payments\":true,\"report-expense\":true,\"report-purchase\":true,\"report-sale\":true,\"stock-management\":true,\"stock-low\":true,\"stock-batch\":true,\"stock-closing\":true,\"stock-expiry\":true,\"tax-management\":true,\"tax-pay\":true}', '2020-03-04 07:50:48', '2020-03-04 07:50:48'),
(3, 'pharmacy', 'Pharmacy', '{\"notifacation\":true,\"activities\":true,\"product-management\":true,\"batch-destroy\":true,\"batch-create\":true,\"product-destroy\":true,\"product-edit\":true,\"product-show\":true,\"product-create\":true,\"product-index\":true,\"tax-destroy\":true,\"tax-edit\":true,\"tax-show\":true,\"tax-create\":true,\"tax-index\":true,\"unit-destroy\":true,\"unit-edit\":true,\"unit-show\":true,\"unit-create\":true,\"unit-index\":true,\"type-destroy\":true,\"type-edit\":true,\"type-show\":true,\"type-create\":true,\"type-index\":true,\"category-destroy\":true,\"category-edit\":true,\"category-show\":true,\"category-create\":true,\"category-index\":true,\"Manufacturer-management\":true,\"manufacturer-destroy\":true,\"manufacturer-edit\":true,\"manufacturer-show\":true,\"manufacturer-create\":true,\"manufacturer-index\":true,\"Customer-management\":true,\"customer-destroy\":true,\"customer-edit\":true,\"customer-show\":true,\"customer-create\":true,\"customer-index\":true,\"purchase-management\":true,\"purchaseReturn-destroy\":true,\"purchaseReturn-edit\":true,\"purchaseReturn-show\":true,\"purchaseReturn-create\":true,\"purchaseReturn-index\":true,\"purchase-destroy\":true,\"purchase-edit\":true,\"purchase-show\":true,\"purchase-create\":true,\"purchase-index\":true,\"sale-management\":true,\"saleReturn-destroy\":true,\"saleReturn-edit\":true,\"saleReturn-show\":true,\"saleReturn-create\":true,\"saleReturn-index\":true,\"sale-edit\":true,\"sale-show\":true,\"sale-create\":true,\"sale-index\":true,\"bank-management\":true,\"bankTransaction-show\":true,\"bankTransaction-index\":true,\"bankTransaction-create\":true,\"bankaccount-create\":true,\"bankaccount-edit\":true,\"bankaccount-show\":true,\"bankaccount-index\":true,\"account-management\":true,\"transaction-receivedpayment\":true,\"transaction-makepayment\":true,\"transaction-edit\":true,\"transaction-show\":true,\"transaction-index\":true,\"expense-management\":true,\"expense-receivedpayment\":true,\"expense-destroy\":true,\"expense-create\":true,\"expense-edit\":true,\"expense-show\":true,\"expense-index\":true,\"expenseCategory-create\":true,\"expenseCategory-edit\":true,\"expenseCategory-show\":true,\"expenseCategory-index\":true,\"report-management\":true,\"report-today\":true,\"report-cash-flow\":true,\"report-sales-return\":true,\"report-purchase-return\":true,\"report-income-statement\":true,\"report-p&l\":true,\"report-received\":true,\"report-payments\":true,\"report-expense\":true,\"report-purchase\":true,\"report-sale\":true,\"stock-management\":true,\"stock-low\":true,\"stock-batch\":true,\"stock-closing\":true,\"stock-expiry\":true,\"tax-management\":true,\"tax-pay\":true}', '2020-03-04 07:50:48', '2020-03-04 07:50:48'),
(4, 'diagnostic', 'Diagnostic', '{\"notifacation\":true,\"activities\":true,\"product-management\":true,\"product-edit\":true,\"product-show\":true,\"product-create\":true,\"product-index\":true,\"tax-destroy\":true,\"tax-edit\":true,\"tax-show\":true,\"tax-create\":true,\"tax-index\":true,\"unit-destroy\":true,\"unit-edit\":true,\"unit-show\":true,\"unit-create\":true,\"unit-index\":true,\"type-destroy\":true,\"type-edit\":true,\"type-show\":true,\"type-create\":true,\"type-index\":true,\"category-destroy\":true,\"category-edit\":true,\"category-show\":true,\"category-create\":true,\"category-index\":true,\"customer-create\":true,\"sale-management\":true,\"saleReturn-destroy\":true,\"saleReturn-show\":true,\"saleReturn-index\":true,\"sale-show\":true,\"sale-create\":true,\"report-management\":true,\"report-today\":true,\"report-sale\":true,\"stock-management\":true,\"stock-low\":true,\"stock-batch\":true,\"stock-closing\":true,\"stock-expiry\":true}', '2020-03-04 07:50:48', '2020-03-04 07:50:48'),
(5, 'hospital', 'Hospital', '{\"notifacation\":true,\"activities\":true,\"product-management\":true,\"product-edit\":true,\"product-show\":true,\"product-create\":true,\"product-index\":true,\"tax-destroy\":true,\"tax-edit\":true,\"tax-show\":true,\"tax-create\":true,\"tax-index\":true,\"unit-destroy\":true,\"unit-edit\":true,\"unit-show\":true,\"unit-create\":true,\"unit-index\":true,\"type-destroy\":true,\"type-edit\":true,\"type-show\":true,\"type-create\":true,\"type-index\":true,\"category-destroy\":true,\"category-edit\":true,\"category-show\":true,\"category-create\":true,\"category-index\":true,\"customer-create\":true,\"sale-management\":true,\"saleReturn-destroy\":true,\"saleReturn-show\":true,\"saleReturn-index\":true,\"sale-show\":true,\"sale-create\":true,\"report-management\":true,\"report-today\":true,\"report-sale\":true,\"stock-management\":true,\"stock-low\":true,\"stock-batch\":true,\"stock-closing\":true,\"stock-expiry\":true}', '2020-03-04 07:50:48', '2020-03-04 07:50:48'),
(6, 'doctor', 'Doctor', '{\"notifacation\":true,\"activities\":true,\"product-management\":true,\"product-edit\":true,\"product-show\":true,\"product-create\":true,\"product-index\":true,\"tax-destroy\":true,\"tax-edit\":true,\"tax-show\":true,\"tax-create\":true,\"tax-index\":true,\"unit-destroy\":true,\"unit-edit\":true,\"unit-show\":true,\"unit-create\":true,\"unit-index\":true,\"type-destroy\":true,\"type-edit\":true,\"type-show\":true,\"type-create\":true,\"type-index\":true,\"category-destroy\":true,\"category-edit\":true,\"category-show\":true,\"category-create\":true,\"category-index\":true,\"customer-create\":true,\"sale-management\":true,\"saleReturn-destroy\":true,\"saleReturn-show\":true,\"saleReturn-index\":true,\"sale-show\":true,\"sale-create\":true,\"report-management\":true,\"report-today\":true,\"report-sale\":true,\"stock-management\":true,\"stock-low\":true,\"stock-batch\":true,\"stock-closing\":true,\"stock-expiry\":true}', '2020-03-04 07:50:48', '2020-03-04 07:50:48');

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

CREATE TABLE `role_users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_users`
--

INSERT INTO `role_users` (`user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-03-04 07:50:48', '2020-03-04 07:50:48'),
(2, 3, '2020-03-04 07:50:48', '2020-03-04 07:50:48'),
(3, 2, '2020-03-04 07:50:48', '2020-03-04 07:50:48'),
(4, 4, '2020-03-04 07:50:48', '2020-03-04 07:50:48'),
(5, 5, '2020-03-04 07:50:49', '2020-03-04 07:50:49'),
(6, 6, '2020-03-04 07:50:49', '2020-03-04 07:50:49'),
(7, 6, '2020-03-04 07:50:49', '2020-03-04 07:50:49'),
(8, 6, '2020-03-04 07:50:49', '2020-03-04 07:50:49');

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_banar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reg_banar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Asia/Dhaka',
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2',
  `currency_symbol` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '$',
  `cur_position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'before',
  `date_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'M d, Y',
  `sale_prefix` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'SALE',
  `purchase_prefix` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PUR',
  `transaction_prefix` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'TRNS',
  `bank_transaction_prefix` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'BT',
  `sale_return_prefix` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'SR',
  `purchase_return_prefix` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PR',
  `batch_prefix` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'BATCH',
  `sale_tax` double(8,2) NOT NULL DEFAULT 0.00,
  `purchase_tax` double(8,2) NOT NULL DEFAULT 0.00,
  `voucher_type` enum('A4','POS') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'A4',
  `prefix_diagnostic_bill` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DIA',
  `prefix_hms_admission` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'HMS',
  `mini_sidebar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'red-dark',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `site_name`, `address`, `phone_number`, `website`, `email`, `logo`, `login_banar`, `reg_banar`, `footer_text`, `language`, `timezone`, `currency`, `currency_symbol`, `cur_position`, `date_format`, `sale_prefix`, `purchase_prefix`, `transaction_prefix`, `bank_transaction_prefix`, `sale_return_prefix`, `purchase_return_prefix`, `batch_prefix`, `sale_tax`, `purchase_tax`, `voucher_type`, `prefix_diagnostic_bill`, `prefix_hms_admission`, `mini_sidebar`, `theme`, `created_at`, `updated_at`) VALUES
(1, 'HMS', 'Road#32, Hamilton Avenue, Singapur', '0000000', 'www.pharma.com', 'pharma@app.com', '', '', '', 'Pharmacy Management System', 'en', 'Asia/Dhaka', '2', '$', 'before', 'M d, Y', 'SALE', 'PUR', 'TRNS', 'BT', 'SR', 'PR', 'BATCH', 0.00, 0.00, 'A4', 'DIA', 'HMS', '', 'red-dark', '2020-03-04 07:50:50', '2020-03-04 08:03:18');

-- --------------------------------------------------------

--
-- Table structure for table `throttle`
--

CREATE TABLE `throttle` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `trans_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_way` enum('Bank','Cash') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Cash',
  `bank_transaction_id` int(11) NOT NULL DEFAULT 0,
  `vendor_id` int(11) NOT NULL,
  `vendor` enum('Patient','Manufacturer','Expense','Referral','Doctor') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Patient',
  `transaction_type` enum('Payment','Received','Collection') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Received',
  `status` enum('Active','Void') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `module` enum('Pharmacy','Diagnostic','Hospital') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pharmacy',
  `sub_module` enum('Hospital-Admission','Hospital-Emergency','Hospital-Operation','Hospital-BedChargeCollection','Diagnostic-Appointment') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `date`, `trans_id`, `amount`, `description`, `transaction_way`, `bank_transaction_id`, `vendor_id`, `vendor`, `transaction_type`, `status`, `module`, `sub_module`, `user_id`, `created_at`, `updated_at`) VALUES
(9, '2020-03-09', 'TRNS-0002', 900.00, 'Received from sales. <a target=\'_blank\' href=\'http://localhost/pharmasale/sale/invoice/SALE-0001\'>SALE-0001</a>', 'Cash', 0, 2, 'Patient', 'Payment', 'Active', 'Hospital', NULL, 1, '2020-03-07 18:00:00', '2020-03-08 18:00:00'),
(15, '2020-03-09', 'TRNS-0001', 1000.00, 'Received from sales. <a target=\'_blank\' href=\'http://localhost/pharmasale/sale/invoice/SALE-0001\'>SALE-0001</a>', 'Cash', 0, 2, 'Patient', 'Received', 'Active', 'Hospital', NULL, 1, '2020-03-07 18:00:00', '2020-03-08 18:00:00'),
(210, '2020-02-29', 'TRNS-0002', 21000.00, 'Received from sales. <a target=\'_blank\' href=\'http://localhost/pharmasale/sale/invoice/SALE-0001\'>SALE-0001</a>', 'Cash', 0, 2, 'Patient', 'Payment', 'Active', 'Hospital', NULL, 1, '2020-03-07 18:00:00', '2020-03-08 18:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_banar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `permissions`, `last_login`, `first_name`, `last_name`, `profile_image`, `profile_banar`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@andit.com', '$2y$10$052u/L6reh3hqZMP2CUSHuP5UCUk0vSjNQRixNpkQbNgsEh701iRa', NULL, '2020-03-04 07:55:12', 'Admin', 'AndIt', NULL, NULL, '2020-03-04 07:50:48', '2020-03-04 07:55:12'),
(2, 'Pharmacy', 'pharma@andit.com', '$2y$10$w3UnAkeKDs3n7hETHL4YaOjO/hxNr4LZO5cJxtsG1kFDQ8GF2OIiO', NULL, NULL, 'Pharma Manager', 'AndIt', NULL, NULL, '2020-03-04 07:50:48', '2020-03-04 07:50:48'),
(3, 'Laboratory', 'lab@andit.com', '$2y$10$wgIRKY6doqtAq5fzYroaJO2zx.jpj6OFR8gry2.8gbh2xHaTyINLG', NULL, NULL, 'Lab Manager', 'AndIt', NULL, NULL, '2020-03-04 07:50:48', '2020-03-04 07:50:48'),
(4, 'Diagnostic', 'diagnostic@andit.com', '$2y$10$RevSZvc4TvhY54sxR8f9jes0h0b34qhqLuRTgDuhIFCligx31UtFO', NULL, NULL, 'Diagnostic Manager', 'AndIt', NULL, NULL, '2020-03-04 07:50:48', '2020-03-04 07:50:48'),
(5, 'Hospital', 'hospital@andit.com', '$2y$10$aDYH82gS3U74abZMPKZFm.KdTsZj/huraZ71pV4CJxha1Tzb1L98.', NULL, '2020-03-04 08:03:06', 'Hospital Manager', 'AndIt', NULL, NULL, '2020-03-04 07:50:48', '2020-03-04 08:03:06'),
(6, 'Gopal Singh Dhanik', 'drgopal@andit.com', '$2y$10$0wlzJgK4QDtVIfq4ERcVl.6iDaSbAcgAqVMQZZ8PelgId.m64FD9.', NULL, '2020-03-04 08:00:57', 'Gopal', 'Singh Dhanik', NULL, NULL, '2020-03-04 07:50:49', '2020-03-04 08:00:57'),
(7, 'Vivek Saxena', 'saxena@andit.com', '$2y$10$LyY1vLByopmFxQE.dFj3K.MajSKGVal1zyYngSQYVb0wtpkXiwovC', NULL, NULL, 'Vivek', 'Saxena', NULL, NULL, '2020-03-04 07:50:49', '2020-03-04 07:50:49'),
(8, 'Dr. Alok Bajpai', 'alok@andit.com', '$2y$10$k4vGJ8WYOcbEFMlNrQg/UOlqMcPzNVuv.nMKUvTrnIWepZXKTY9Gq', NULL, NULL, 'Alok', 'Bajpai', NULL, NULL, '2020-03-04 07:50:49', '2020-03-04 07:50:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activations`
--
ALTER TABLE `activations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_transections`
--
ALTER TABLE `bank_transections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bank_transections_bank_account_id_foreign` (`bank_account_id`),
  ADD KEY `bank_transections_user_id_foreign` (`user_id`);

--
-- Indexes for table `bed_charge_collections`
--
ALTER TABLE `bed_charge_collections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bed_charge_collections_admission_id_foreign` (`admission_id`),
  ADD KEY `bed_charge_collections_patient_id_foreign` (`patient_id`),
  ADD KEY `bed_charge_collections_bed_id_foreign` (`bed_id`),
  ADD KEY `bed_charge_collections_user_id_foreign` (`user_id`);

--
-- Indexes for table `bed_charge_collection_items`
--
ALTER TABLE `bed_charge_collection_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bed_charge_collection_items_bed_charge_collection_id_foreign` (`bed_charge_collection_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `departments_user_id_foreign` (`user_id`);

--
-- Indexes for table `diagon_bills`
--
ALTER TABLE `diagon_bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `diagon_bills_referral_id_foreign` (`referral_id`),
  ADD KEY `diagon_bills_patient_id_foreign` (`patient_id`),
  ADD KEY `diagon_bills_user_id_foreign` (`user_id`);

--
-- Indexes for table `diagon_bill_items`
--
ALTER TABLE `diagon_bill_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `diagon_bill_items_test_id_foreign` (`test_id`),
  ADD KEY `diagon_bill_items_bill_id_foreign` (`bill_id`),
  ADD KEY `diagon_bill_items_patient_id_foreign` (`patient_id`),
  ADD KEY `diagon_bill_items_user_id_foreign` (`user_id`);

--
-- Indexes for table `diagon_referral_payments`
--
ALTER TABLE `diagon_referral_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `diagon_referral_payments_referral_id_foreign` (`referral_id`),
  ADD KEY `diagon_referral_payments_user_id_foreign` (`user_id`);

--
-- Indexes for table `diagon_test_categories`
--
ALTER TABLE `diagon_test_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diagon_test_lists`
--
ALTER TABLE `diagon_test_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `diagon_test_lists_test_category_id_foreign` (`test_category_id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctors_user_id_foreign` (`user_id`),
  ADD KEY `doctors_department_id_foreign` (`department_id`);

--
-- Indexes for table `doctor_payments`
--
ALTER TABLE `doctor_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_payments_doctor_id_foreign` (`doctor_id`),
  ADD KEY `doctor_payments_user_id_foreign` (`user_id`);

--
-- Indexes for table `doc_appointments`
--
ALTER TABLE `doc_appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doc_appointments_user_id_foreign` (`user_id`),
  ADD KEY `doc_appointments_doctor_id_foreign` (`doctor_id`),
  ADD KEY `doc_appointments_patient_id_foreign` (`patient_id`),
  ADD KEY `doc_appointments_doc_schedule_id_foreign` (`doc_schedule_id`);

--
-- Indexes for table `doc_schedules`
--
ALTER TABLE `doc_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doc_schedules_user_id_foreign` (`user_id`),
  ADD KEY `doc_schedules_doctor_id_foreign` (`doctor_id`);

--
-- Indexes for table `due_collections`
--
ALTER TABLE `due_collections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `due_collections_user_id_foreign` (`user_id`),
  ADD KEY `due_collections_patient_id_foreign` (`patient_id`);

--
-- Indexes for table `due_collection_items`
--
ALTER TABLE `due_collection_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `due_collection_items_user_id_foreign` (`user_id`),
  ADD KEY `due_collection_items_patient_id_foreign` (`patient_id`),
  ADD KEY `due_collection_items_due_collection_id_foreign` (`due_collection_id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_user_id_foreign` (`user_id`),
  ADD KEY `expenses_expense_category_id_foreign` (`expense_category_id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_categories_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hms_admissions`
--
ALTER TABLE `hms_admissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hms_admissions_referral_id_foreign` (`referral_id`),
  ADD KEY `hms_admissions_bed_id_foreign` (`bed_id`),
  ADD KEY `hms_admissions_patient_id_foreign` (`patient_id`),
  ADD KEY `hms_admissions_user_id_foreign` (`user_id`);

--
-- Indexes for table `hms_beds`
--
ALTER TABLE `hms_beds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hms_beds_bed_type_id_foreign` (`bed_type_id`),
  ADD KEY `hms_beds_user_id_foreign` (`user_id`);

--
-- Indexes for table `hms_bed_types`
--
ALTER TABLE `hms_bed_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hms_bed_types_user_id_foreign` (`user_id`);

--
-- Indexes for table `hms_emergencies`
--
ALTER TABLE `hms_emergencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hms_emergencies_referral_id_foreign` (`referral_id`),
  ADD KEY `hms_emergencies_patient_id_foreign` (`patient_id`),
  ADD KEY `hms_emergencies_user_id_foreign` (`user_id`);

--
-- Indexes for table `hms_emergency_services`
--
ALTER TABLE `hms_emergency_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hms_emergency_services_hms_emergency_id_foreign` (`hms_emergency_id`),
  ADD KEY `hms_emergency_services_patient_id_foreign` (`patient_id`),
  ADD KEY `hms_emergency_services_user_id_foreign` (`user_id`);

--
-- Indexes for table `hms_given_services`
--
ALTER TABLE `hms_given_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hms_given_services_admission_id_foreign` (`admission_id`),
  ADD KEY `hms_given_services_patient_id_foreign` (`patient_id`),
  ADD KEY `hms_given_services_user_id_foreign` (`user_id`);

--
-- Indexes for table `hms_operations`
--
ALTER TABLE `hms_operations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hms_operations_operation_service_id_foreign` (`operation_service_id`),
  ADD KEY `hms_operations_patient_id_foreign` (`patient_id`),
  ADD KEY `hms_operations_admission_id_foreign` (`admission_id`),
  ADD KEY `hms_operations_user_id_foreign` (`user_id`);

--
-- Indexes for table `hms_operation_services`
--
ALTER TABLE `hms_operation_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hms_operation_services_operation_type_id_foreign` (`operation_type_id`),
  ADD KEY `hms_operation_services_user_id_foreign` (`user_id`);

--
-- Indexes for table `hms_operation_types`
--
ALTER TABLE `hms_operation_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hms_operation_types_user_id_foreign` (`user_id`);

--
-- Indexes for table `hms_services`
--
ALTER TABLE `hms_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hms_services_service_category_id_foreign` (`service_category_id`),
  ADD KEY `hms_services_user_id_foreign` (`user_id`);

--
-- Indexes for table `hms_service_categories`
--
ALTER TABLE `hms_service_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hms_service_categories_user_id_foreign` (`user_id`);

--
-- Indexes for table `mailboxes`
--
ALTER TABLE `mailboxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `patients_email_unique` (`email`),
  ADD KEY `patients_user_id_foreign` (`user_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `persistences`
--
ALTER TABLE `persistences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `persistences_code_unique` (`code`);

--
-- Indexes for table `pharma_batches`
--
ALTER TABLE `pharma_batches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pharma_batches_product_id_foreign` (`product_id`);

--
-- Indexes for table `pharma_categories`
--
ALTER TABLE `pharma_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pharma_categories_slug_unique` (`slug`),
  ADD KEY `pharma_categories_user_id_foreign` (`user_id`);

--
-- Indexes for table `pharma_manufacturers`
--
ALTER TABLE `pharma_manufacturers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pharma_manufacturers_user_id_foreign` (`user_id`);

--
-- Indexes for table `pharma_products`
--
ALTER TABLE `pharma_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pharma_products_slug_unique` (`slug`),
  ADD KEY `pharma_products_product_type_id_foreign` (`product_type_id`),
  ADD KEY `pharma_products_unit_id_foreign` (`unit_id`),
  ADD KEY `pharma_products_category_id_foreign` (`category_id`),
  ADD KEY `pharma_products_user_id_foreign` (`user_id`),
  ADD KEY `pharma_products_manufacturer_id_foreign` (`manufacturer_id`);

--
-- Indexes for table `pharma_product_taxes`
--
ALTER TABLE `pharma_product_taxes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pharma_product_taxes_slug_unique` (`slug`),
  ADD KEY `pharma_product_taxes_user_id_foreign` (`user_id`);

--
-- Indexes for table `pharma_product_types`
--
ALTER TABLE `pharma_product_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pharma_product_types_slug_unique` (`slug`),
  ADD KEY `pharma_product_types_user_id_foreign` (`user_id`);

--
-- Indexes for table `pharma_purchases`
--
ALTER TABLE `pharma_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pharma_purchases_manufacturer_id_foreign` (`manufacturer_id`),
  ADD KEY `pharma_purchases_user_id_foreign` (`user_id`);

--
-- Indexes for table `pharma_purchase_items`
--
ALTER TABLE `pharma_purchase_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pharma_purchase_items_manufacturer_id_foreign` (`manufacturer_id`),
  ADD KEY `pharma_purchase_items_purchase_id_foreign` (`purchase_id`),
  ADD KEY `pharma_purchase_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `pharma_sales`
--
ALTER TABLE `pharma_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pharma_sales_patient_id_foreign` (`patient_id`),
  ADD KEY `pharma_sales_user_id_foreign` (`user_id`);

--
-- Indexes for table `pharma_sale_items`
--
ALTER TABLE `pharma_sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pharma_sale_items_batch_id_foreign` (`batch_id`),
  ADD KEY `pharma_sale_items_patient_id_foreign` (`patient_id`),
  ADD KEY `pharma_sale_items_sale_id_foreign` (`sale_id`),
  ADD KEY `pharma_sale_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `pharma_taxes`
--
ALTER TABLE `pharma_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pharma_taxes_user_id_foreign` (`user_id`),
  ADD KEY `pharma_taxes_sale_id_foreign` (`sale_id`);

--
-- Indexes for table `pharma_units`
--
ALTER TABLE `pharma_units`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pharma_units_slug_unique` (`slug`),
  ADD KEY `pharma_units_user_id_foreign` (`user_id`);

--
-- Indexes for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prescriptions_patient_id_foreign` (`patient_id`),
  ADD KEY `prescriptions_doctor_id_foreign` (`doctor_id`),
  ADD KEY `prescriptions_user_id_foreign` (`user_id`);

--
-- Indexes for table `pre_medicines`
--
ALTER TABLE `pre_medicines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pre_medicines_pre_medicine_type_id_foreign` (`pre_medicine_type_id`),
  ADD KEY `pre_medicines_user_id_foreign` (`user_id`);

--
-- Indexes for table `pre_medicine_items`
--
ALTER TABLE `pre_medicine_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pre_medicine_items_prescription_id_foreign` (`prescription_id`),
  ADD KEY `pre_medicine_items_pre_medicine_id_foreign` (`pre_medicine_id`),
  ADD KEY `pre_medicine_items_user_id_foreign` (`user_id`);

--
-- Indexes for table `pre_medicine_types`
--
ALTER TABLE `pre_medicine_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pre_medicine_types_user_id_foreign` (`user_id`);

--
-- Indexes for table `pre_routines`
--
ALTER TABLE `pre_routines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pre_routines_pre_medicine_type_id_foreign` (`pre_medicine_type_id`),
  ADD KEY `pre_routines_user_id_foreign` (`user_id`);

--
-- Indexes for table `pre_test_items`
--
ALTER TABLE `pre_test_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pre_test_items_diagon_test_id_foreign` (`diagon_test_id`),
  ADD KEY `pre_test_items_prescription_id_foreign` (`prescription_id`),
  ADD KEY `pre_test_items_user_id_foreign` (`user_id`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `referrals_referral_category_id_foreign` (`referral_category_id`),
  ADD KEY `referrals_user_id_foreign` (`user_id`);

--
-- Indexes for table `referral_categories`
--
ALTER TABLE `referral_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `referral_categories_user_id_foreign` (`user_id`);

--
-- Indexes for table `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`);

--
-- Indexes for table `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`user_id`,`role_id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `throttle`
--
ALTER TABLE `throttle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `throttle_user_id_index` (`user_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transations_user_id_foreign` (`user_id`);

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
-- AUTO_INCREMENT for table `activations`
--
ALTER TABLE `activations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bank_transections`
--
ALTER TABLE `bank_transections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bed_charge_collections`
--
ALTER TABLE `bed_charge_collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bed_charge_collection_items`
--
ALTER TABLE `bed_charge_collection_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `diagon_bills`
--
ALTER TABLE `diagon_bills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `diagon_bill_items`
--
ALTER TABLE `diagon_bill_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `diagon_referral_payments`
--
ALTER TABLE `diagon_referral_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `diagon_test_categories`
--
ALTER TABLE `diagon_test_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `diagon_test_lists`
--
ALTER TABLE `diagon_test_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=355;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `doctor_payments`
--
ALTER TABLE `doctor_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doc_appointments`
--
ALTER TABLE `doc_appointments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doc_schedules`
--
ALTER TABLE `doc_schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `due_collections`
--
ALTER TABLE `due_collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `due_collection_items`
--
ALTER TABLE `due_collection_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hms_admissions`
--
ALTER TABLE `hms_admissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hms_beds`
--
ALTER TABLE `hms_beds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hms_bed_types`
--
ALTER TABLE `hms_bed_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hms_emergencies`
--
ALTER TABLE `hms_emergencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hms_emergency_services`
--
ALTER TABLE `hms_emergency_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hms_given_services`
--
ALTER TABLE `hms_given_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hms_operations`
--
ALTER TABLE `hms_operations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hms_operation_services`
--
ALTER TABLE `hms_operation_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hms_operation_types`
--
ALTER TABLE `hms_operation_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hms_services`
--
ALTER TABLE `hms_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `hms_service_categories`
--
ALTER TABLE `hms_service_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `mailboxes`
--
ALTER TABLE `mailboxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `persistences`
--
ALTER TABLE `persistences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pharma_batches`
--
ALTER TABLE `pharma_batches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `pharma_categories`
--
ALTER TABLE `pharma_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pharma_manufacturers`
--
ALTER TABLE `pharma_manufacturers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pharma_products`
--
ALTER TABLE `pharma_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `pharma_product_taxes`
--
ALTER TABLE `pharma_product_taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pharma_product_types`
--
ALTER TABLE `pharma_product_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pharma_purchases`
--
ALTER TABLE `pharma_purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pharma_purchase_items`
--
ALTER TABLE `pharma_purchase_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pharma_sales`
--
ALTER TABLE `pharma_sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pharma_sale_items`
--
ALTER TABLE `pharma_sale_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pharma_taxes`
--
ALTER TABLE `pharma_taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pharma_units`
--
ALTER TABLE `pharma_units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pre_medicines`
--
ALTER TABLE `pre_medicines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pre_medicine_items`
--
ALTER TABLE `pre_medicine_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pre_medicine_types`
--
ALTER TABLE `pre_medicine_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pre_routines`
--
ALTER TABLE `pre_routines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pre_test_items`
--
ALTER TABLE `pre_test_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `referral_categories`
--
ALTER TABLE `referral_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reminders`
--
ALTER TABLE `reminders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `throttle`
--
ALTER TABLE `throttle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bank_transections`
--
ALTER TABLE `bank_transections`
  ADD CONSTRAINT `bank_transections_bank_account_id_foreign` FOREIGN KEY (`bank_account_id`) REFERENCES `bank_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bank_transections_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bed_charge_collections`
--
ALTER TABLE `bed_charge_collections`
  ADD CONSTRAINT `bed_charge_collections_admission_id_foreign` FOREIGN KEY (`admission_id`) REFERENCES `hms_admissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bed_charge_collections_bed_id_foreign` FOREIGN KEY (`bed_id`) REFERENCES `hms_beds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bed_charge_collections_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bed_charge_collections_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bed_charge_collection_items`
--
ALTER TABLE `bed_charge_collection_items`
  ADD CONSTRAINT `bed_charge_collection_items_bed_charge_collection_id_foreign` FOREIGN KEY (`bed_charge_collection_id`) REFERENCES `bed_charge_collections` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `departments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `diagon_bills`
--
ALTER TABLE `diagon_bills`
  ADD CONSTRAINT `diagon_bills_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `diagon_bills_referral_id_foreign` FOREIGN KEY (`referral_id`) REFERENCES `referrals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `diagon_bills_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `diagon_bill_items`
--
ALTER TABLE `diagon_bill_items`
  ADD CONSTRAINT `diagon_bill_items_bill_id_foreign` FOREIGN KEY (`bill_id`) REFERENCES `diagon_bills` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `diagon_bill_items_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `diagon_bill_items_test_id_foreign` FOREIGN KEY (`test_id`) REFERENCES `diagon_test_lists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `diagon_bill_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `diagon_referral_payments`
--
ALTER TABLE `diagon_referral_payments`
  ADD CONSTRAINT `diagon_referral_payments_referral_id_foreign` FOREIGN KEY (`referral_id`) REFERENCES `referrals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `diagon_referral_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `diagon_test_lists`
--
ALTER TABLE `diagon_test_lists`
  ADD CONSTRAINT `diagon_test_lists_test_category_id_foreign` FOREIGN KEY (`test_category_id`) REFERENCES `diagon_test_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `doctors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `doctor_payments`
--
ALTER TABLE `doctor_payments`
  ADD CONSTRAINT `doctor_payments_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `doctor_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `doc_appointments`
--
ALTER TABLE `doc_appointments`
  ADD CONSTRAINT `doc_appointments_doc_schedule_id_foreign` FOREIGN KEY (`doc_schedule_id`) REFERENCES `doc_schedules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `doc_appointments_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `doc_appointments_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `doc_appointments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `doc_schedules`
--
ALTER TABLE `doc_schedules`
  ADD CONSTRAINT `doc_schedules_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `doc_schedules_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `due_collections`
--
ALTER TABLE `due_collections`
  ADD CONSTRAINT `due_collections_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `due_collections_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `due_collection_items`
--
ALTER TABLE `due_collection_items`
  ADD CONSTRAINT `due_collection_items_due_collection_id_foreign` FOREIGN KEY (`due_collection_id`) REFERENCES `due_collections` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `due_collection_items_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `due_collection_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD CONSTRAINT `expense_categories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hms_admissions`
--
ALTER TABLE `hms_admissions`
  ADD CONSTRAINT `hms_admissions_bed_id_foreign` FOREIGN KEY (`bed_id`) REFERENCES `hms_beds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hms_admissions_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hms_admissions_referral_id_foreign` FOREIGN KEY (`referral_id`) REFERENCES `referrals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hms_admissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hms_beds`
--
ALTER TABLE `hms_beds`
  ADD CONSTRAINT `hms_beds_bed_type_id_foreign` FOREIGN KEY (`bed_type_id`) REFERENCES `hms_bed_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hms_beds_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hms_bed_types`
--
ALTER TABLE `hms_bed_types`
  ADD CONSTRAINT `hms_bed_types_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hms_emergencies`
--
ALTER TABLE `hms_emergencies`
  ADD CONSTRAINT `hms_emergencies_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hms_emergencies_referral_id_foreign` FOREIGN KEY (`referral_id`) REFERENCES `referrals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hms_emergencies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hms_emergency_services`
--
ALTER TABLE `hms_emergency_services`
  ADD CONSTRAINT `hms_emergency_services_hms_emergency_id_foreign` FOREIGN KEY (`hms_emergency_id`) REFERENCES `hms_emergencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hms_emergency_services_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hms_emergency_services_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hms_given_services`
--
ALTER TABLE `hms_given_services`
  ADD CONSTRAINT `hms_given_services_admission_id_foreign` FOREIGN KEY (`admission_id`) REFERENCES `hms_admissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hms_given_services_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hms_given_services_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hms_operations`
--
ALTER TABLE `hms_operations`
  ADD CONSTRAINT `hms_operations_admission_id_foreign` FOREIGN KEY (`admission_id`) REFERENCES `hms_admissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hms_operations_operation_service_id_foreign` FOREIGN KEY (`operation_service_id`) REFERENCES `hms_operation_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hms_operations_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hms_operations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hms_operation_services`
--
ALTER TABLE `hms_operation_services`
  ADD CONSTRAINT `hms_operation_services_operation_type_id_foreign` FOREIGN KEY (`operation_type_id`) REFERENCES `hms_operation_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hms_operation_services_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hms_operation_types`
--
ALTER TABLE `hms_operation_types`
  ADD CONSTRAINT `hms_operation_types_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hms_services`
--
ALTER TABLE `hms_services`
  ADD CONSTRAINT `hms_services_service_category_id_foreign` FOREIGN KEY (`service_category_id`) REFERENCES `hms_service_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hms_services_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hms_service_categories`
--
ALTER TABLE `hms_service_categories`
  ADD CONSTRAINT `hms_service_categories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `patients_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pharma_batches`
--
ALTER TABLE `pharma_batches`
  ADD CONSTRAINT `pharma_batches_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `pharma_products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pharma_categories`
--
ALTER TABLE `pharma_categories`
  ADD CONSTRAINT `pharma_categories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pharma_manufacturers`
--
ALTER TABLE `pharma_manufacturers`
  ADD CONSTRAINT `pharma_manufacturers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pharma_products`
--
ALTER TABLE `pharma_products`
  ADD CONSTRAINT `pharma_products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `pharma_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pharma_products_manufacturer_id_foreign` FOREIGN KEY (`manufacturer_id`) REFERENCES `pharma_manufacturers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pharma_products_product_type_id_foreign` FOREIGN KEY (`product_type_id`) REFERENCES `pharma_product_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pharma_products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `pharma_units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pharma_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pharma_product_taxes`
--
ALTER TABLE `pharma_product_taxes`
  ADD CONSTRAINT `pharma_product_taxes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pharma_product_types`
--
ALTER TABLE `pharma_product_types`
  ADD CONSTRAINT `pharma_product_types_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pharma_purchases`
--
ALTER TABLE `pharma_purchases`
  ADD CONSTRAINT `pharma_purchases_manufacturer_id_foreign` FOREIGN KEY (`manufacturer_id`) REFERENCES `pharma_manufacturers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pharma_purchases_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pharma_purchase_items`
--
ALTER TABLE `pharma_purchase_items`
  ADD CONSTRAINT `pharma_purchase_items_manufacturer_id_foreign` FOREIGN KEY (`manufacturer_id`) REFERENCES `pharma_manufacturers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pharma_purchase_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `pharma_products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pharma_purchase_items_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `pharma_purchases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pharma_sales`
--
ALTER TABLE `pharma_sales`
  ADD CONSTRAINT `pharma_sales_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pharma_sales_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pharma_sale_items`
--
ALTER TABLE `pharma_sale_items`
  ADD CONSTRAINT `pharma_sale_items_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `pharma_batches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pharma_sale_items_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pharma_sale_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `pharma_products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pharma_sale_items_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `pharma_sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pharma_taxes`
--
ALTER TABLE `pharma_taxes`
  ADD CONSTRAINT `pharma_taxes_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `pharma_sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pharma_taxes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pharma_units`
--
ALTER TABLE `pharma_units`
  ADD CONSTRAINT `pharma_units_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD CONSTRAINT `prescriptions_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prescriptions_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prescriptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pre_medicines`
--
ALTER TABLE `pre_medicines`
  ADD CONSTRAINT `pre_medicines_pre_medicine_type_id_foreign` FOREIGN KEY (`pre_medicine_type_id`) REFERENCES `pre_medicine_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pre_medicines_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pre_medicine_items`
--
ALTER TABLE `pre_medicine_items`
  ADD CONSTRAINT `pre_medicine_items_pre_medicine_id_foreign` FOREIGN KEY (`pre_medicine_id`) REFERENCES `pre_medicines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pre_medicine_items_prescription_id_foreign` FOREIGN KEY (`prescription_id`) REFERENCES `prescriptions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pre_medicine_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pre_medicine_types`
--
ALTER TABLE `pre_medicine_types`
  ADD CONSTRAINT `pre_medicine_types_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pre_routines`
--
ALTER TABLE `pre_routines`
  ADD CONSTRAINT `pre_routines_pre_medicine_type_id_foreign` FOREIGN KEY (`pre_medicine_type_id`) REFERENCES `pre_medicine_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pre_routines_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pre_test_items`
--
ALTER TABLE `pre_test_items`
  ADD CONSTRAINT `pre_test_items_diagon_test_id_foreign` FOREIGN KEY (`diagon_test_id`) REFERENCES `diagon_test_lists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pre_test_items_prescription_id_foreign` FOREIGN KEY (`prescription_id`) REFERENCES `prescriptions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pre_test_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `referral_categories`
--
ALTER TABLE `referral_categories`
  ADD CONSTRAINT `referral_categories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

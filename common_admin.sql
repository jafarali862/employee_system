-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 01, 2025 at 05:38 AM
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
-- Database: `common_admin`
--

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `department` varchar(191) DEFAULT NULL,
  `designation` varchar(191) DEFAULT NULL,
  `avatar` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `full_name`, `email`, `mobile`, `department`, `designation`, `avatar`, `created_at`, `updated_at`) VALUES
(1, 'Claire Stokes', 'merle79@example.org', '(773) 553-6045', 'Finance', 'Transportation Attendant', NULL, '2025-10-31 11:23:33', '2025-10-31 11:23:33'),
(2, 'Joanny Schaden Sr.', 'jwilderman@example.com', '+13259526246', 'Support', 'Cement Mason and Concrete Finisher', NULL, '2025-10-31 11:23:33', '2025-10-31 11:23:33'),
(3, 'Miss Maryam Lowe', 'matilda.smith@example.net', '430.677.3833', 'Finance', 'Epidemiologist', NULL, '2025-10-31 11:23:33', '2025-10-31 11:23:33'),
(4, 'Abagail Miller V', 'deckow.kayley@example.org', '(660) 494-3900', 'Finance', 'Insulation Worker', NULL, '2025-10-31 11:23:33', '2025-10-31 11:23:33'),
(5, 'Mr. Lennie Gutmann', 'pbarton@example.org', '+1.847.687.5696', 'Finance', 'Career Counselor', NULL, '2025-10-31 11:23:33', '2025-10-31 11:23:33'),
(6, 'Jevon Wisoky PhD', 'jaleel.bechtelar@example.org', '331-893-5481', 'Finance', 'Amusement Attendant', NULL, '2025-10-31 11:23:33', '2025-10-31 11:23:33'),
(7, 'Beverly Shields', 'lrunte@example.com', '1-585-462-6038', 'HR', 'Agricultural Crop Worker', NULL, '2025-10-31 11:23:33', '2025-10-31 11:23:33'),
(8, 'Dr. Janice Runolfsson MD', 'chloe.hoeger@example.org', '1-959-504-8144', 'HR', 'Fire-Prevention Engineer', NULL, '2025-10-31 11:23:33', '2025-10-31 11:23:33'),
(9, 'Gabriel Bogan', 'floy.bechtelar@example.com', '351-792-8969', 'Support', 'Rail Yard Engineer', NULL, '2025-10-31 11:23:33', '2025-10-31 11:23:33'),
(10, 'Prof. Adan Price', 'harmon.veum@example.com', '+18707780662', 'IT', 'Law Teacher', NULL, '2025-10-31 11:23:33', '2025-10-31 11:23:33'),
(11, 'Maurine O\'Conner', 'karine79@example.org', '+1-704-326-6673', 'Sales', 'Garment', NULL, '2025-10-31 11:23:33', '2025-10-31 11:23:33'),
(12, 'Ms. Ivy Goyette PhD', 'kaci.howe@example.net', '678-838-0214', 'HR', 'School Social Worker', NULL, '2025-10-31 11:23:33', '2025-10-31 11:23:33'),
(13, 'Sabryna Johnson PhD', 'bernadine.goodwin@example.com', '(559) 318-2934', 'HR', 'Travel Agent', NULL, '2025-10-31 11:23:33', '2025-10-31 11:23:33'),
(14, 'Virgie Wiza', 'fhand@example.net', '+14787373682', 'HR', 'Glazier', NULL, '2025-10-31 11:23:33', '2025-10-31 11:23:33'),
(15, 'Andrew Gottlieb', 'natasha.hagenes@example.org', '+1 (763) 935-1541', 'Finance', 'Production Worker', NULL, '2025-10-31 11:23:33', '2025-10-31 11:23:33'),
(16, 'Eulah McCullough', 'mstroman@example.com', '878.942.1554', 'Sales', 'Massage Therapist', NULL, '2025-10-31 11:23:33', '2025-10-31 11:23:33'),
(17, 'Oral Reichel MD', 'asa08@example.com', '1-757-752-6716', 'Sales', 'Food Service Manager', NULL, '2025-10-31 11:23:33', '2025-10-31 11:23:33'),
(18, 'Horace Runolfsson II', 'tommie13@example.net', '+1-413-698-6674', 'Support', 'Electronic Drafter', NULL, '2025-10-31 11:23:33', '2025-10-31 11:23:33'),
(19, 'Karley Jerde', 'corkery.preston@example.com', '(312) 297-0821', 'Support', 'Recruiter', NULL, '2025-10-31 11:23:33', '2025-10-31 11:23:33'),
(20, 'Precious Lockman IV', 'ostark@example.org', '(334) 309-3311', 'IT', 'Telephone Operator', NULL, '2025-10-31 11:23:33', '2025-10-31 11:23:33'),
(21, 'Dr. Amy Feest', 'vidal63@example.net', '(650) 269-3972', 'IT', 'Continuous Mining Machine Operator', NULL, '2025-10-31 11:23:33', '2025-10-31 11:23:33'),
(22, 'Carmine Schinner', 'qlittel@example.net', '(636) 715-6305', 'HR', 'Sheet Metal Worker', NULL, '2025-10-31 11:23:33', '2025-10-31 11:23:33'),
(23, 'Billy Gaylord V', 'cindy40@example.net', '1-732-296-4768', 'Support', 'Social Science Research Assistant', NULL, '2025-10-31 11:23:33', '2025-10-31 11:23:33'),
(24, 'Mossie Schmidt', 'quitzon.camryn@example.com', '+16603922683', 'Finance', 'Biochemist or Biophysicist', NULL, '2025-10-31 11:23:33', '2025-10-31 11:23:33'),
(25, 'Pamela Sipes MD', 'uhyatt@example.net', '308-639-9151', 'Finance', 'Postal Service Clerk', NULL, '2025-10-31 11:23:33', '2025-10-31 11:23:33'),
(26, 'Katharina Predovic', 'mbode@example.net', '+1.878.990.3706', 'Finance', 'Bellhop', NULL, '2025-10-31 11:23:33', '2025-10-31 11:23:33'),
(27, 'Ora Reilly MD', 'mitchell.bertha@example.net', '910.625.2641', 'Sales', 'Coroner', NULL, '2025-10-31 11:23:33', '2025-10-31 11:23:33'),
(28, 'Freda Dare', 'kbrown@example.com', '+1-270-645-5679', 'Support', 'Cook', NULL, '2025-10-31 11:23:33', '2025-10-31 11:23:33'),
(32, 'Manesh', 'admin@mail.com', '9787878754', '454545', 'ttttttrtrt', 'avatars/Ox1RT3HQnHJpJwJHrUjLuKdHSl262AHqQTcuILTu.jpg', '2025-10-31 12:27:09', '2025-10-31 22:58:26'),
(35, 'Jafarali', 'jafar.u123@gmail.com', '9656523476', 'IT', 'PHP Developer', 'avatars/pnVeP4JS78E8l9NexFIYUUEx0a50TcGGows2K0hG.jpg', '2025-10-31 22:59:09', '2025-10-31 22:59:21');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_10_31_160454_create_employees_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `avatar` text NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@themesbrand.com', NULL, '$2y$10$N9tex9ag0Q5rTmj2eA4S3eTXZXHOzE969STqAR9.zJ7.9lR8sIKGy', 'avatar-1.jpg', NULL, '2025-10-31 10:15:52', '2025-10-31 10:15:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employees_email_unique` (`email`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

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
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 25, 2024 at 04:57 PM
-- Server version: 8.0.40-0ubuntu0.20.04.1
-- PHP Version: 8.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smart_tenant_saas`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `parent_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `contact_number`, `subject`, `message`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Eaton Rocha', 'suro@mailinator.com', '130', 'Ipsum quae tenetur', 'Expedita neque minim', 1, '2024-09-27 04:25:43', '2024-09-27 04:25:43');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` double(8,2) NOT NULL DEFAULT '0.00',
  `applicable_packages` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valid_for` date DEFAULT NULL,
  `use_limit` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_histories`
--

CREATE TABLE `coupon_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `coupon` int NOT NULL DEFAULT '0',
  `package` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_id` int NOT NULL DEFAULT '0',
  `property_id` int NOT NULL DEFAULT '0',
  `unit_id` int NOT NULL DEFAULT '0',
  `expense_type` int NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `amount` double(8,2) NOT NULL DEFAULT '0.00',
  `receipt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `parent_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice_id` int NOT NULL DEFAULT '0',
  `property_id` int NOT NULL DEFAULT '0',
  `unit_id` int NOT NULL DEFAULT '0',
  `invoice_month` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `parent_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_id`, `property_id`, `unit_id`, `invoice_month`, `end_date`, `status`, `notes`, `parent_id`, `created_at`, `updated_at`) VALUES
(14, 658, 1, 1, '2022-08-01', '2021-11-13', 'open', 'Illo vero praesentiu', 2, '2024-11-14 05:37:07', '2024-11-14 05:37:07');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice_id` int NOT NULL DEFAULT '0',
  `invoice_type` int NOT NULL DEFAULT '0',
  `amount` double(8,2) NOT NULL DEFAULT '0.00',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_items`
--

INSERT INTO `invoice_items` (`id`, `invoice_id`, `invoice_type`, `amount`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 76.00, 'Et mollitia qui volu', '2024-11-14 05:06:51', '2024-11-14 05:06:51'),
(2, 2, 2, 76.00, 'Et mollitia qui volu', '2024-11-14 05:07:29', '2024-11-14 05:07:29'),
(3, 3, 2, 76.00, 'Et mollitia qui volu', '2024-11-14 05:07:47', '2024-11-14 05:07:47'),
(4, 4, 2, 76.00, 'Et mollitia qui volu', '2024-11-14 05:08:48', '2024-11-14 05:08:48'),
(5, 5, 2, 76.00, 'Et mollitia qui volu', '2024-11-14 05:09:09', '2024-11-14 05:09:09'),
(6, 6, 2, 76.00, 'Et mollitia qui volu', '2024-11-14 05:09:55', '2024-11-14 05:09:55'),
(7, 7, 2, 76.00, 'Et mollitia qui volu', '2024-11-14 05:10:18', '2024-11-14 05:10:18'),
(8, 8, 2, 76.00, 'Et mollitia qui volu', '2024-11-14 05:11:30', '2024-11-14 05:11:30'),
(9, 9, 2, 76.00, 'Et mollitia qui volu', '2024-11-14 05:11:57', '2024-11-14 05:11:57'),
(11, 14, 2, 83.00, 'Error veniam ad tem', '2024-11-14 05:37:07', '2024-11-14 05:37:07'),
(12, 14, 2, 99.00, 'Qui voluptatem In a', '2024-11-14 05:37:07', '2024-11-14 05:37:07');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_payments`
--

CREATE TABLE `invoice_payments` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice_id` int NOT NULL DEFAULT '0',
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(8,2) NOT NULL DEFAULT '0.00',
  `payment_date` date DEFAULT NULL,
  `receipt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logged_histories`
--

CREATE TABLE `logged_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `maintainers`
--

CREATE TABLE `maintainers` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `property_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_id` int NOT NULL DEFAULT '0',
  `parent_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `maintainers`
--

INSERT INTO `maintainers` (`id`, `user_id`, `property_id`, `type_id`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 5, NULL, 0, 2, '2024-09-27 04:14:15', '2024-09-27 04:14:15');

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_requests`
--

CREATE TABLE `maintenance_requests` (
  `id` bigint UNSIGNED NOT NULL,
  `property_id` int NOT NULL DEFAULT '0',
  `unit_id` int NOT NULL DEFAULT '0',
  `issue_type` int NOT NULL DEFAULT '0',
  `maintainer_id` int NOT NULL DEFAULT '0',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(8,2) NOT NULL DEFAULT '0.00',
  `issue_attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_date` date DEFAULT NULL,
  `fixed_date` date DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `parent_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `maintenance_requests`
--

INSERT INTO `maintenance_requests` (`id`, `property_id`, `unit_id`, `issue_type`, `maintainer_id`, `status`, `amount`, `issue_attachment`, `invoice`, `request_date`, `fixed_date`, `notes`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 0, 0, 1, 5, 'completed', 0.00, NULL, NULL, '1979-09-21', '2024-10-26', 'Voluptatum voluptas', 2, '2024-10-26 03:26:58', '2024-10-26 04:21:09'),
(2, 0, 0, 1, 5, 'pending', 0.00, NULL, NULL, '1979-09-21', NULL, 'Voluptatum voluptas', 2, '2024-10-26 03:29:45', '2024-10-26 03:54:18'),
(3, 0, 0, 1, 5, 'completed', 0.00, NULL, NULL, '1979-09-21', NULL, 'Voluptatum voluptas', 2, '2024-10-26 03:30:23', '2024-10-26 03:30:23');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_05_21_065337_create_permission_tables', 1),
(5, '2021_05_08_100002_create_subscriptions_table', 1),
(6, '2021_05_08_124950_create_settings_table', 1),
(7, '2021_05_29_180034_create_notice_boards_table', 1),
(8, '2021_05_29_183858_create_contacts_table', 1),
(9, '2023_06_19_150313_create_properties_table', 1),
(10, '2023_06_19_160357_create_property_units_table', 1),
(11, '2023_06_19_161534_create_property_images_table', 1),
(12, '2023_06_20_154547_create_tenants_table', 1),
(13, '2023_06_20_161541_create_tenant_documents_table', 1),
(14, '2023_06_20_162422_create_invoices_table', 1),
(15, '2023_06_20_162715_create_invoice_items_table', 1),
(16, '2023_06_20_163134_create_expenses_table', 1),
(17, '2023_06_20_164503_create_types_table', 1),
(18, '2023_07_01_125146_create_invoice_payments_table', 1),
(19, '2023_07_13_164842_create_maintainers_table', 1),
(20, '2023_07_14_020859_create_maintenance_requests_table', 1),
(21, '2023_08_04_164513_create_logged_histories_table', 1),
(22, '2024_01_12_141909_create_coupons_table', 1),
(23, '2024_01_12_171136_create_coupon_histories_table', 1),
(24, '2024_02_17_052552_create_package_transactions_table', 1),
(25, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(26, '2024_10_08_091941_create_notifications_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3),
(4, 'App\\Models\\User', 4),
(5, 'App\\Models\\User', 5),
(2, 'App\\Models\\User', 30),
(2, 'App\\Models\\User', 31);

-- --------------------------------------------------------

--
-- Table structure for table `notice_boards`
--

CREATE TABLE `notice_boards` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `module` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci,
  `message` text COLLATE utf8mb4_unicode_ci,
  `enabled_email` int NOT NULL DEFAULT '0',
  `parent_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `module`, `subject`, `message`, `enabled_email`, `parent_id`, `created_at`, `updated_at`) VALUES
(5, 'maintainer_create', 'Ut harum mollit Nam', '<p><strong>Dear {user_name}</strong>,</p><p>&nbsp;</p><blockquote><p>Welcome to {company_name}! We are excited to have you on board and look forward to providing you with an exceptional experience.</p><p>We hope you enjoy your experience with us. If you have any feedback, feel free to share it with us.</p><p>&nbsp;</p><p>Thank you for choosing {company_name}!</p></blockquote><p>Best regards,</p><p>{company_name}</p><p>{company_email}</p>', 1, 2, '2024-10-09 04:36:36', '2024-10-09 06:28:16'),
(6, 'user_create', 'Welcome to {company_name}!', '<p><strong>Dear {new_user_name}</strong>,</p><p>&nbsp;</p><blockquote><p>Welcome to {company_name}! We are excited to have you on board and look forward to providing you with an exceptional experience.</p><p>We hope you enjoy your experience with us. If you have any feedback, feel free to share it with us.</p><p>&nbsp;</p><p>Thank you for choosing {company_name}!</p></blockquote><p>&nbsp;</p><p>Best regards,</p><p>{company_name}</p><p>{company_email}</p>', 1, 2, '2024-10-09 06:45:09', '2024-10-25 23:24:47'),
(7, 'tenant_create', 'Welcome to {company_name}!', '<p><strong>Dear {user_name}</strong>,</p><p>&nbsp;</p><blockquote><p>Welcome to {company_name}! We are excited to have you on board and look forward to providing you with an exceptional experience.</p><p>We hope you enjoy your experience with us. If you have any feedback, feel free to share it with us.</p><p>&nbsp;</p><p>Thank you for choosing {company_name}!</p></blockquote><p>Best regards,</p><p>{company_name}</p><p>{company_email}</p>', 1, 2, '2024-10-09 06:45:15', '2024-10-09 06:45:15'),
(8, 'maintenance_request_create', 'New Maintenance Request Created', '<p><strong>Dear Owner,</strong></p><p>We would like to inform you that a new maintenance request has been created for your property. Below are the details of the request:</p><p><strong>Request Details:</strong></p><ul><li>Submitted By: {tenant_name}</li><li>Submitted On: {created_at}</li><li>Category: {issue_type}</li><li>Description: {issue_description}</li></ul><p>&nbsp;</p><p><strong>Tenant Contact Information:</strong></p><ul><li>Name: {tenant_name}</li><li>Phone: {tenant_number}</li><li>Email: {tenant_mail}</li></ul><p>Thank you for your attention to this matter.</p><p><strong>Best regards,</strong></p><p><strong>{tenant_name}</strong></p><p><strong>{tenant_mail}</strong></p>', 1, 2, '2024-10-09 06:45:25', '2024-10-09 06:45:25'),
(9, 'maintenance_request_complete', 'Maintenance Request Completed!', '<p><strong>Dear {tenant_name},</strong></p><p>&nbsp;</p><p>We are pleased to inform you that your maintenance request has been successfully completed.</p><p>&nbsp;</p><p><strong>Request Details:</strong></p><ul><li>Submitted By: {tenant_name}</li><li>Submitted On: {created_at}</li><li>Category: {issue_type}</li><li>Description: {issue_description}</li></ul><p>&nbsp;</p><p><strong>Completion Details:</strong></p><ul><li>Completed On: {completed_at}</li><li>Maintenance Performed: [Description of the work done]</li><li>Technician: {maintainer_description}</li></ul><p>&nbsp;</p><p><strong>Feedback:</strong></p><p>We value your feedback to improve our services. Please let us know if you are satisfied with the maintenance performed or if there are any further issues that need attention.</p><p>&nbsp;</p><p><strong>Contact Information:</strong></p><p>If you have any questions or need further assistance, please contact us at {maintainer_email} or {maintainer_number}.</p><p>Thank you for your cooperation and patience.</p><p>&nbsp;</p><p><strong>Best regards,</strong></p><p>{maintainer_name}</p><p>{maintainer_email}</p>', 1, 2, '2024-10-09 06:45:33', '2024-10-09 06:45:33'),
(10, 'invoice_create', 'Invoice Created', '<p><strong>Dear {user_name},</strong></p><p>&nbsp;</p><p>We are pleased to inform you that an invoice has been created with {company_name}.</p><p>&nbsp;</p><p><strong>Invoice Details:</strong></p><ul><li>Invoice Number: {invoice_number}</li><li>Date Issued: {invoice_date}</li><li>Due Date: {invoice_due_date}</li><li>Amount Due: {amount}</li><li>Description: {invoice_description}</li></ul><p>&nbsp;</p><p><strong>Contact Information:</strong></p><p>If you have any questions or need further assistance, please contact our billing department at {company_email} or {company_number}.</p><p>&nbsp;</p><p>Thank you for your prompt attention to this matter.</p><p>&nbsp;</p><p><strong>Best regards,</strong></p><p><strong>{company_name}</strong></p><p><strong>{company_email}</strong></p>', 1, 2, '2024-10-09 06:45:38', '2024-10-09 06:45:38'),
(11, 'payment_reminder', 'Friendly Reminder: Payment Due Soon', '<p><strong>Dear {user_name},</strong></p><p>&nbsp;</p><p>This is a friendly reminder that your payment for the following invoice is due soon:</p><p>&nbsp;</p><p><strong>Invoice Details:</strong></p><ul><li>Invoice Number: {invoice_number}</li><li>Date Issued: {invoice_date}</li><li>Due Date: {invoice_due_date}</li><li>Amount Due: {amount}</li><li>Description: {invoice_description}</li></ul><p>&nbsp;</p><p>&nbsp;</p><p>If you have already made your payment, please disregard this notice. Otherwise, we appreciate your prompt attention to this matter.</p><p>&nbsp;</p><p><strong>Contact Information:</strong></p><p>If you have any questions or need assistance, feel free to contact our billing department at {company_email} or {company_number}.</p><p>&nbsp;</p><p>Thank you for your cooperation!</p><p>&nbsp;</p><p><strong>Best regards,</strong></p><p><strong>{company_name}</strong></p><p><strong>{company_email}</strong></p>', 1, 2, '2024-10-09 06:45:43', '2024-10-09 06:45:43');

-- --------------------------------------------------------

--
-- Table structure for table `package_transactions`
--

CREATE TABLE `package_transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `subscription_id` int NOT NULL DEFAULT '0',
  `subscription_transactions_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL DEFAULT '0.00',
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `holder_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_number` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_expiry_month` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_expiry_year` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receipt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'manage user', 'web', NULL, NULL),
(2, 'create user', 'web', NULL, NULL),
(3, 'edit user', 'web', NULL, NULL),
(4, 'delete user', 'web', NULL, NULL),
(5, 'manage role', 'web', NULL, NULL),
(6, 'create role', 'web', NULL, NULL),
(7, 'edit role', 'web', NULL, NULL),
(8, 'delete role', 'web', NULL, NULL),
(9, 'manage contact', 'web', NULL, NULL),
(10, 'create contact', 'web', NULL, NULL),
(11, 'edit contact', 'web', NULL, NULL),
(12, 'delete contact', 'web', NULL, NULL),
(13, 'manage note', 'web', NULL, NULL),
(14, 'create note', 'web', NULL, NULL),
(15, 'edit note', 'web', NULL, NULL),
(16, 'delete note', 'web', NULL, NULL),
(17, 'manage logged history', 'web', NULL, NULL),
(18, 'delete logged history', 'web', NULL, NULL),
(19, 'manage pricing packages', 'web', NULL, NULL),
(20, 'create pricing packages', 'web', NULL, NULL),
(21, 'edit pricing packages', 'web', NULL, NULL),
(22, 'delete pricing packages', 'web', NULL, NULL),
(23, 'buy pricing packages', 'web', NULL, NULL),
(24, 'manage coupon', 'web', NULL, NULL),
(25, 'create coupon', 'web', NULL, NULL),
(26, 'edit coupon', 'web', NULL, NULL),
(27, 'delete coupon', 'web', NULL, NULL),
(28, 'manage coupon history', 'web', NULL, NULL),
(29, 'delete coupon history', 'web', NULL, NULL),
(30, 'manage pricing transation', 'web', NULL, NULL),
(31, 'manage account settings', 'web', NULL, NULL),
(32, 'manage password settings', 'web', NULL, NULL),
(33, 'manage general settings', 'web', NULL, NULL),
(34, 'manage company settings', 'web', NULL, NULL),
(35, 'manage email settings', 'web', NULL, NULL),
(36, 'manage payment settings', 'web', NULL, NULL),
(37, 'manage seo settings', 'web', NULL, NULL),
(38, 'manage google recaptcha settings', 'web', NULL, NULL),
(39, 'manage property', 'web', NULL, NULL),
(40, 'create property', 'web', NULL, NULL),
(41, 'edit property', 'web', NULL, NULL),
(42, 'delete property', 'web', NULL, NULL),
(43, 'show property', 'web', NULL, NULL),
(44, 'manage unit', 'web', NULL, NULL),
(45, 'create unit', 'web', NULL, NULL),
(46, 'edit unit', 'web', NULL, NULL),
(47, 'delete unit', 'web', NULL, NULL),
(48, 'manage tenant', 'web', NULL, NULL),
(49, 'create tenant', 'web', NULL, NULL),
(50, 'edit tenant', 'web', NULL, NULL),
(51, 'delete tenant', 'web', NULL, NULL),
(52, 'show tenant', 'web', NULL, NULL),
(53, 'manage invoice', 'web', NULL, NULL),
(54, 'create invoice', 'web', NULL, NULL),
(55, 'edit invoice', 'web', NULL, NULL),
(56, 'delete invoice', 'web', NULL, NULL),
(57, 'show invoice', 'web', NULL, NULL),
(58, 'manage maintainer', 'web', NULL, NULL),
(59, 'create maintainer', 'web', NULL, NULL),
(60, 'edit maintainer', 'web', NULL, NULL),
(61, 'delete maintainer', 'web', NULL, NULL),
(62, 'manage maintenance request', 'web', NULL, NULL),
(63, 'create maintenance request', 'web', NULL, NULL),
(64, 'edit maintenance request', 'web', NULL, NULL),
(65, 'delete maintenance request', 'web', NULL, NULL),
(66, 'show maintenance request', 'web', NULL, NULL),
(67, 'delete invoice type', 'web', NULL, NULL),
(68, 'create invoice payment', 'web', NULL, NULL),
(69, 'delete invoice payment', 'web', NULL, NULL),
(70, 'manage expense', 'web', NULL, NULL),
(71, 'create expense', 'web', NULL, NULL),
(72, 'edit expense', 'web', NULL, NULL),
(73, 'delete expense', 'web', NULL, NULL),
(74, 'show expense', 'web', NULL, NULL),
(75, 'manage types', 'web', NULL, NULL),
(76, 'create types', 'web', NULL, NULL),
(77, 'edit types', 'web', NULL, NULL),
(78, 'delete types', 'web', NULL, NULL),
(79, 'manage notification', 'web', '2024-10-08 04:23:30', '2024-10-08 04:23:30'),
(80, 'create notification', 'web', '2024-10-08 04:23:41', '2024-10-08 04:23:41'),
(81, 'edit notification', 'web', '2024-10-08 04:23:50', '2024-10-08 04:23:50'),
(82, 'delete notification', 'web', '2024-10-08 04:23:59', '2024-10-08 04:23:59');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `map_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `is_active` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `name`, `description`, `type`, `country`, `state`, `city`, `zip_code`, `address`, `map_link`, `parent_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Maryam Goodman', 'Nemo pariatur Solut', 'lease_property', 'Qui dolores autem id', 'Qui quod laborum Se', 'Mollit voluptatibus', '32084', 'Ut error itaque natu', NULL, 2, 1, '2024-11-14 04:34:13', '2024-11-14 04:34:13');

-- --------------------------------------------------------

--
-- Table structure for table `property_images`
--

CREATE TABLE `property_images` (
  `id` bigint UNSIGNED NOT NULL,
  `property_id` int NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_images`
--

INSERT INTO `property_images` (`id`, `property_id`, `image`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 'cover_1731578653.jpg', 'thumbnail', '2024-11-14 04:34:13', '2024-11-14 04:34:13'),
(2, 1, '8139445_11_1731578653.jpg', 'extra', '2024-11-14 04:34:13', '2024-11-14 04:34:13'),
(3, 1, '8139445_12_1731578653.jpg', 'extra', '2024-11-14 04:34:13', '2024-11-14 04:34:13'),
(4, 1, '8139445_13_1731578653.jpg', 'extra', '2024-11-14 04:34:13', '2024-11-14 04:34:13'),
(5, 1, '8139445_14_1731578653.jpg', 'extra', '2024-11-14 04:34:13', '2024-11-14 04:34:13'),
(6, 1, '8139445_15_1731578653.jpg', 'extra', '2024-11-14 04:34:13', '2024-11-14 04:34:13'),
(7, 1, '8139445_16_1731578653.jpg', 'extra', '2024-11-14 04:34:13', '2024-11-14 04:34:13'),
(8, 1, '8139445_17_1731578653.jpg', 'extra', '2024-11-14 04:34:13', '2024-11-14 04:34:13'),
(9, 1, '8139445_18_1731578653.jpg', 'extra', '2024-11-14 04:34:13', '2024-11-14 04:34:13'),
(10, 1, '8139445_19_1731578653.jpg', 'extra', '2024-11-14 04:34:13', '2024-11-14 04:34:13'),
(11, 1, '8139445_20_1731578653.jpg', 'extra', '2024-11-14 04:34:13', '2024-11-14 04:34:13');

-- --------------------------------------------------------

--
-- Table structure for table `property_units`
--

CREATE TABLE `property_units` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bedroom` int NOT NULL DEFAULT '0',
  `property_id` int NOT NULL DEFAULT '0',
  `baths` int NOT NULL DEFAULT '0',
  `kitchen` int NOT NULL DEFAULT '0',
  `rent` double(8,2) NOT NULL DEFAULT '0.00',
  `deposit_amount` double(8,2) NOT NULL DEFAULT '0.00',
  `deposit_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `late_fee_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `late_fee_amount` double(8,2) NOT NULL DEFAULT '0.00',
  `incident_receipt_amount` double(8,2) NOT NULL DEFAULT '0.00',
  `rent_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `rent_duration` int NOT NULL DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `payment_due_date` date DEFAULT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_units`
--

INSERT INTO `property_units` (`id`, `name`, `bedroom`, `property_id`, `baths`, `kitchen`, `rent`, `deposit_amount`, `deposit_type`, `late_fee_type`, `late_fee_amount`, `incident_receipt_amount`, `rent_type`, `rent_duration`, `start_date`, `end_date`, `payment_due_date`, `parent_id`, `notes`, `created_at`, `updated_at`) VALUES
(1, 'Sydney Reese', 50, 1, 74, 80, 23.00, 71.00, 'fixed', 'percentage', 76.00, 78.00, 'yearly', 2, NULL, NULL, NULL, 2, 'Laboris iure similiq', '2024-11-14 04:34:33', '2024-11-14 04:34:33'),
(2, 'Keane Guthrie', 69, 1, 55, 54, 91.00, 18.00, 'fixed', 'fixed', 6.00, 24.00, 'monthly', 79, NULL, NULL, NULL, 2, 'Architecto quis dolo', '2024-11-14 04:34:43', '2024-11-14 04:34:43');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'super admin', 'web', 0, '2024-09-27 04:14:14', '2024-09-27 04:14:14'),
(2, 'owner', 'web', 1, '2024-09-27 04:14:14', '2024-09-27 04:14:14'),
(3, 'manager', 'web', 2, '2024-09-27 04:14:15', '2024-09-27 04:14:15'),
(4, 'tenant', 'web', 2, '2024-09-27 04:14:15', '2024-09-27 04:14:15'),
(5, 'maintainer', 'web', 2, '2024-09-27 04:14:15', '2024-09-27 04:14:15'),
(6, 'tenant', 'web', 30, '2024-11-15 05:03:40', '2024-11-15 05:03:40'),
(7, 'maintainer', 'web', 30, '2024-11-15 05:03:40', '2024-11-15 05:03:40'),
(8, 'tenant', 'web', 31, '2024-11-15 05:05:03', '2024-11-15 05:05:03'),
(9, 'maintainer', 'web', 31, '2024-11-15 05:05:03', '2024-11-15 05:05:03');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(23, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(43, 2),
(44, 2),
(45, 2),
(46, 2),
(47, 2),
(48, 2),
(49, 2),
(50, 2),
(51, 2),
(52, 2),
(53, 2),
(54, 2),
(55, 2),
(56, 2),
(57, 2),
(58, 2),
(59, 2),
(60, 2),
(61, 2),
(62, 2),
(63, 2),
(64, 2),
(65, 2),
(66, 2),
(67, 2),
(68, 2),
(69, 2),
(70, 2),
(71, 2),
(72, 2),
(73, 2),
(74, 2),
(75, 2),
(76, 2),
(77, 2),
(78, 2),
(79, 2),
(80, 2),
(81, 2),
(82, 2),
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(9, 3),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(16, 3),
(39, 3),
(40, 3),
(41, 3),
(42, 3),
(43, 3),
(44, 3),
(45, 3),
(46, 3),
(47, 3),
(48, 3),
(49, 3),
(50, 3),
(51, 3),
(52, 3),
(53, 3),
(54, 3),
(55, 3),
(56, 3),
(57, 3),
(58, 3),
(59, 3),
(60, 3),
(61, 3),
(62, 3),
(63, 3),
(64, 3),
(65, 3),
(66, 3),
(67, 3),
(68, 3),
(69, 3),
(70, 3),
(71, 3),
(72, 3),
(73, 3),
(74, 3),
(75, 3),
(76, 3),
(77, 3),
(78, 3),
(79, 3),
(80, 3),
(81, 3),
(82, 3),
(9, 4),
(10, 4),
(11, 4),
(12, 4),
(13, 4),
(14, 4),
(15, 4),
(16, 4),
(53, 4),
(57, 4),
(62, 4),
(63, 4),
(64, 4),
(65, 4),
(66, 4),
(68, 4),
(9, 5),
(10, 5),
(11, 5),
(12, 5),
(13, 5),
(14, 5),
(15, 5),
(16, 5),
(62, 5),
(66, 5),
(9, 6),
(10, 6),
(11, 6),
(12, 6),
(13, 6),
(14, 6),
(15, 6),
(16, 6),
(53, 6),
(57, 6),
(62, 6),
(63, 6),
(64, 6),
(65, 6),
(66, 6),
(68, 6),
(9, 7),
(10, 7),
(11, 7),
(12, 7),
(13, 7),
(14, 7),
(15, 7),
(16, 7),
(62, 7),
(66, 7),
(9, 8),
(10, 8),
(11, 8),
(12, 8),
(13, 8),
(14, 8),
(15, 8),
(16, 8),
(53, 8),
(57, 8),
(62, 8),
(63, 8),
(64, 8),
(65, 8),
(66, 8),
(68, 8),
(9, 9),
(10, 9),
(11, 9),
(12, 9),
(13, 9),
(14, 9),
(15, 9),
(16, 9),
(62, 9),
(66, 9);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `type`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'CURRENCY', 'USD', 'payment', 1, NULL, NULL),
(2, 'CURRENCY_SYMBOL', '$', 'payment', 1, NULL, NULL),
(3, 'bank_transfer_payment', 'on', 'payment', 1, NULL, NULL),
(4, 'STRIPE_PAYMENT', 'on', 'payment', 1, NULL, NULL),
(5, 'paypal_payment', 'off', 'payment', 1, NULL, NULL),
(6, 'flutterwave_payment', 'off', 'payment', 1, NULL, NULL),
(8, 'bank_name', 'Test Bank', 'payment', 1, NULL, NULL),
(9, 'bank_holder_name', 'Bank Holder Name', 'payment', 1, NULL, NULL),
(10, 'bank_account_number', '123456', 'payment', 1, NULL, NULL),
(11, 'bank_ifsc_code', '123456', 'payment', 1, NULL, NULL),
(12, 'bank_other_details', '', 'payment', 1, NULL, NULL),
(14, 'STRIPE_KEY', 'dsadasad', 'payment', 1, NULL, NULL),
(15, 'STRIPE_SECRET', 'sdadasdsa', 'payment', 1, NULL, NULL),
(16, 'FROM_NAME', 'Test', 'smtp', 2, NULL, NULL),
(17, 'FROM_EMAIL', 'support@hrmsattend.com', 'smtp', 2, NULL, NULL),
(18, 'SERVER_DRIVER', 'smtp', 'smtp', 2, NULL, NULL),
(19, 'SERVER_HOST', 'smtp.dreamhost.com', 'smtp', 2, NULL, NULL),
(20, 'SERVER_PORT', '465', 'smtp', 2, NULL, NULL),
(21, 'SERVER_USERNAME', 'stjames@hrmsattend.com', 'smtp', 2, NULL, NULL),
(22, 'SERVER_PASSWORD', '$Perry@4546', 'smtp', 2, NULL, NULL),
(23, 'SERVER_ENCRYPTION', 'ssl', 'smtp', 2, NULL, NULL),
(48, 'company_name', 'Miller and Suarez Associates', NULL, 2, NULL, NULL),
(49, 'company_email', 'company@gamil.com', NULL, 2, NULL, NULL),
(50, 'company_phone', '9842365415', NULL, 2, NULL, NULL),
(51, 'company_address', 'Nihil anim dolore am', NULL, 2, NULL, NULL),
(52, 'CURRENCY_SYMBOL', '$', NULL, 2, NULL, NULL),
(53, 'timezone', 'Australia/West', NULL, 2, NULL, NULL),
(54, 'invoice_number_prefix', 'INV', NULL, 2, NULL, NULL),
(55, 'expense_number_prefix', 'EXP', NULL, 2, NULL, NULL),
(56, 'company_date_format', 'M j, Y', NULL, 2, NULL, NULL),
(57, 'company_time_format', 'g:i A', NULL, 2, NULL, NULL),
(58, 'FROM_NAME', 'Sender Name', 'smtp', 1, NULL, NULL),
(59, 'FROM_EMAIL', 'Sender Email', 'smtp', 1, NULL, NULL),
(60, 'SERVER_DRIVER', 'SMTP Driver', 'smtp', 1, NULL, NULL),
(61, 'SERVER_HOST', 'SMTP Host', 'smtp', 1, NULL, NULL),
(62, 'SERVER_PORT', 'Port', 'smtp', 1, NULL, NULL),
(63, 'SERVER_USERNAME', 'SMTP Username', 'smtp', 1, NULL, NULL),
(64, 'SERVER_PASSWORD', 'Password', 'smtp', 1, NULL, NULL),
(65, 'SERVER_ENCRYPTION', 'Encryption', 'smtp', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `package_amount` double(8,2) NOT NULL DEFAULT '0.00',
  `interval` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_limit` int DEFAULT NULL,
  `property_limit` int DEFAULT NULL,
  `tenant_limit` int DEFAULT NULL,
  `enabled_logged_history` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `title`, `package_amount`, `interval`, `user_limit`, `property_limit`, `tenant_limit`, `enabled_logged_history`, `created_at`, `updated_at`) VALUES
(1, 'Basic', 0.00, 'Unlimited', 10, 10, 10, 1, '2024-09-27 04:14:15', '2024-09-27 04:14:15');

-- --------------------------------------------------------

--
-- Table structure for table `tenants`
--

CREATE TABLE `tenants` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `family_member` int DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property` int NOT NULL DEFAULT '0',
  `unit` int NOT NULL DEFAULT '0',
  `lease_start_date` date DEFAULT NULL,
  `lease_end_date` date DEFAULT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tenants`
--

INSERT INTO `tenants` (`id`, `user_id`, `family_member`, `address`, `country`, `state`, `city`, `zip_code`, `property`, `unit`, `lease_start_date`, `lease_end_date`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 4, 5, 'h', 'United Kingdom', 'gujarat', 'Et qui nesciunt est', '61221', 1, 1, '2024-11-14', '2024-11-30', 2, '2024-09-27 04:14:15', '2024-11-14 05:08:42');

-- --------------------------------------------------------

--
-- Table structure for table `tenant_documents`
--

CREATE TABLE `tenant_documents` (
  `id` bigint UNSIGNED NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property_id` int NOT NULL DEFAULT '0',
  `tenant_id` int NOT NULL DEFAULT '0',
  `parent_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `title`, `type`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'walll', 'issue', 2, '2024-10-26 03:26:05', '2024-10-26 03:26:05'),
(2, 'DSA', 'invoice', 2, '2024-11-14 05:04:49', '2024-11-14 05:04:49');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription` int DEFAULT NULL,
  `subscription_expire_date` date DEFAULT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` int NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `type`, `profile`, `phone_number`, `lang`, `subscription`, `subscription_expire_date`, `parent_id`, `email_verified_at`, `password`, `is_active`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', NULL, 'superadmin@gmail.com', 'super admin', 'avatar.png', NULL, 'english', NULL, NULL, 1, '2024-11-15 11:52:47', '$2y$10$ooOTaYwUWpDlfbknTzuxb.mP.0cZ8BqN6inwiuGR1PIWgpSfxMns.', 1, NULL, '2024-09-27 04:14:14', '2024-09-27 04:14:14'),
(2, 'Owner', NULL, 'owner@gmail.com', 'owner', 'avatar.png', NULL, 'english', 1, NULL, 1, '2024-11-15 11:52:50', '$2y$10$21DT0k3MsnQmM.9HCjg.6e2zosyitl0BAt0Vs34qjG.BNaFzUN57G', 1, NULL, '2024-09-27 04:14:15', '2024-09-27 04:14:15'),
(3, 'Manager', NULL, 'manager@gmail.com', 'manager', 'avatar.png', NULL, 'english', 0, NULL, 2, '2024-11-15 11:52:53', '$2y$10$jBMaRLViiEAuNegt/J6m1uhb7vYk8lDEFgq6iDOFIsZTuY30cKHuO', 1, NULL, '2024-09-27 04:14:15', '2024-09-27 04:14:15'),
(4, 'Tenant', 'dsa', 'tenant@gmail.com', 'tenant', 'avatar.png', '9924413108', 'english', NULL, NULL, 2, '2024-11-15 11:52:55', '$2y$10$I0xgI5fKmGcptYkd88FiSelZVfUcuJZsXseVjm9Wog54rQ/J0T08S', 1, NULL, '2024-09-27 04:14:15', '2024-11-14 05:08:42'),
(5, 'Maintainer', NULL, 'maintainer@gmail.com', 'maintainer', 'avatar.png', NULL, 'english', NULL, NULL, 2, '2024-11-15 11:52:58', '$2y$10$44BZTXawjX.AzCM3Od3BOeMWAd7121j5WEUc0EAO8ga73QXAalT9O', 1, NULL, '2024-09-27 04:14:15', '2024-09-27 04:14:15'),
(27, 'Amaya', 'Richmond', 'xomir@mailinator.com', 'manager', 'avatar.png', '+1 (954) 515-6772', 'english', NULL, NULL, 2, '2024-11-15 11:53:01', '$2y$10$woIiVfTFseMktoeSAczM9uUtVDm61SzBuMTtBNakfK64/ICZ8Svza', 1, NULL, '2024-10-25 23:52:10', '2024-10-25 23:52:10'),
(31, 'Forrest Landry', NULL, 'smartwebemployee01@gmail.com', 'owner', NULL, NULL, 'english', 1, NULL, 1, '2024-11-15 11:53:03', '$2y$10$pHdZ/kpNnOQkl1hcxjCg5O15HZ0lvzZqjnM46Ls7QV.8gk8ah/8.K', 1, NULL, '2024-11-15 05:04:59', '2024-11-15 05:04:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_histories`
--
ALTER TABLE `coupon_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_payments`
--
ALTER TABLE `invoice_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logged_histories`
--
ALTER TABLE `logged_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maintainers`
--
ALTER TABLE `maintainers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maintenance_requests`
--
ALTER TABLE `maintenance_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notice_boards`
--
ALTER TABLE `notice_boards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_transactions`
--
ALTER TABLE `package_transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `package_transactions_subscription_transactions_id_unique` (`subscription_transactions_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_images`
--
ALTER TABLE `property_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_units`
--
ALTER TABLE `property_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_name_parent_id_unique` (`name`,`parent_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscriptions_title_unique` (`title`);

--
-- Indexes for table `tenants`
--
ALTER TABLE `tenants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tenant_documents`
--
ALTER TABLE `tenant_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupon_histories`
--
ALTER TABLE `coupon_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `invoice_payments`
--
ALTER TABLE `invoice_payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logged_histories`
--
ALTER TABLE `logged_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `maintainers`
--
ALTER TABLE `maintainers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `maintenance_requests`
--
ALTER TABLE `maintenance_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `notice_boards`
--
ALTER TABLE `notice_boards`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `package_transactions`
--
ALTER TABLE `package_transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `property_images`
--
ALTER TABLE `property_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `property_units`
--
ALTER TABLE `property_units`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tenants`
--
ALTER TABLE `tenants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tenant_documents`
--
ALTER TABLE `tenant_documents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

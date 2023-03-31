-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.6.5-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for sistema_datos_plus
DROP DATABASE IF EXISTS `sistema_datos_plus`;
CREATE DATABASE IF NOT EXISTS `sistema_datos_plus` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `sistema_datos_plus`;

-- Dumping structure for table sistema_datos_plus.customers
DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_start_date` date NOT NULL,
  `contact_end_date` date NOT NULL,
  `plice_effective_start_date` date NOT NULL,
  `plice_effective_end_date` date NOT NULL,
  `certificate_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `license_plate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicle_class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_name_unique` (`name`),
  UNIQUE KEY `customers_certificate_number_unique` (`certificate_number`),
  UNIQUE KEY `customers_license_plate_unique` (`license_plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sistema_datos_plus.customers: ~0 rows (approximately)
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;

-- Dumping structure for table sistema_datos_plus.data_rows
DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sistema_datos_plus.data_rows: ~35 rows (approximately)
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
	(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
	(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
	(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
	(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
	(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
	(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
	(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsTo","column":"role_id","key":"id","label":"display_name","pivot_table":"roles","pivot":0}', 10),
	(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'voyager::seeders.data_rows.roles', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsToMany","column":"id","key":"id","label":"display_name","pivot_table":"user_roles","pivot":"1","taggable":"0"}', 11),
	(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
	(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
	(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
	(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
	(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
	(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
	(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
	(22, 4, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(23, 4, 'name', 'text', 'Nombre o razón social', 1, 1, 1, 1, 1, 1, '{}', 2),
	(24, 4, 'contact_start_date', 'date', 'Contrato: Fecha inicio', 1, 1, 1, 1, 1, 1, '{}', 3),
	(25, 4, 'contact_end_date', 'date', 'Contrato: Fecha final', 1, 1, 1, 1, 1, 1, '{}', 4),
	(26, 4, 'plice_effective_start_date', 'date', 'Vigencia policial: Fecha inicio', 1, 1, 1, 1, 1, 1, '{}', 5),
	(27, 4, 'plice_effective_end_date', 'date', 'Vigencia policial: Fecha final', 1, 1, 1, 1, 1, 1, '{}', 6),
	(28, 4, 'certificate_number', 'text', 'Certificado', 1, 1, 1, 1, 1, 1, '{}', 7),
	(29, 4, 'category', 'text', 'Categoría', 1, 1, 1, 1, 1, 1, '{}', 8),
	(30, 4, 'license_plate', 'text', 'Placa', 1, 1, 1, 1, 1, 1, '{}', 9),
	(31, 4, 'vehicle_class', 'text', 'Clase de vehículo', 1, 1, 1, 1, 1, 1, '{}', 10),
	(32, 4, 'service_type', 'text', 'Tipo de servicio', 1, 1, 1, 1, 1, 1, '{}', 11),
	(33, 4, 'status', 'text', 'Estado', 1, 1, 1, 1, 1, 1, '{"default":"active","options":{"active":"ACTIVO","inactive":"INACTIVO"}}', 12),
	(34, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 13),
	(35, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 14);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;

-- Dumping structure for table sistema_datos_plus.data_types
DROP TABLE IF EXISTS `data_types`;
CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sistema_datos_plus.data_types: ~3 rows (approximately)
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
	(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2022-04-20 19:08:59', '2022-04-20 19:08:59'),
	(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2022-04-20 19:08:59', '2022-04-20 19:08:59'),
	(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2022-04-20 19:08:59', '2022-04-20 19:08:59'),
	(4, 'customers', 'customers', 'Cliente', 'Clientes', 'voyager-people', 'App\\Models\\Customer', NULL, NULL, NULL, 1, 1, '{"order_column":"id","order_display_column":"name","order_direction":"desc","default_search_key":"name"}', '2022-04-20 19:17:31', '2022-04-20 19:17:31');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;

-- Dumping structure for table sistema_datos_plus.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sistema_datos_plus.failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table sistema_datos_plus.menus
DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sistema_datos_plus.menus: ~0 rows (approximately)
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', '2022-04-20 19:08:59', '2022-04-20 19:08:59');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;

-- Dumping structure for table sistema_datos_plus.menu_items
DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sistema_datos_plus.menu_items: ~10 rows (approximately)
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
	(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2022-04-20 19:08:59', '2022-04-20 19:08:59', 'voyager.dashboard', NULL),
	(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2022-04-20 19:08:59', '2022-04-20 19:08:59', 'voyager.media.index', NULL),
	(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 4, '2022-04-20 19:08:59', '2022-04-20 19:17:59', 'voyager.users.index', NULL),
	(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 3, '2022-04-20 19:08:59', '2022-04-20 19:17:59', 'voyager.roles.index', NULL),
	(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 6, '2022-04-20 19:08:59', '2022-04-20 19:17:59', NULL, NULL),
	(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2022-04-20 19:08:59', '2022-04-20 19:17:59', 'voyager.menus.index', NULL),
	(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2022-04-20 19:08:59', '2022-04-20 19:17:59', 'voyager.database.index', NULL),
	(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2022-04-20 19:08:59', '2022-04-20 19:17:59', 'voyager.compass.index', NULL),
	(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2022-04-20 19:08:59', '2022-04-20 19:17:59', 'voyager.bread.index', NULL),
	(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 7, '2022-04-20 19:08:59', '2022-04-20 19:17:59', 'voyager.settings.index', NULL),
	(11, 1, 'Clientes', '', '_self', 'voyager-people', NULL, NULL, 2, '2022-04-20 19:17:31', '2022-04-20 19:17:59', 'voyager.customers.index', NULL);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;

-- Dumping structure for table sistema_datos_plus.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sistema_datos_plus.migrations: ~25 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2016_01_01_000000_add_voyager_user_fields', 1),
	(4, '2016_01_01_000000_create_data_types_table', 1),
	(5, '2016_05_19_173453_create_menu_table', 1),
	(6, '2016_10_21_190000_create_roles_table', 1),
	(7, '2016_10_21_190000_create_settings_table', 1),
	(8, '2016_11_30_135954_create_permission_table', 1),
	(9, '2016_11_30_141208_create_permission_role_table', 1),
	(10, '2016_12_26_201236_data_types__add__server_side', 1),
	(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
	(12, '2017_01_14_005015_create_translations_table', 1),
	(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
	(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
	(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
	(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
	(17, '2017_08_05_000000_add_group_to_settings_table', 1),
	(18, '2017_11_26_013050_add_user_role_relationship', 1),
	(19, '2017_11_26_015000_create_user_roles_table', 1),
	(20, '2018_03_11_000000_add_user_settings', 1),
	(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
	(22, '2018_03_16_000000_make_settings_value_nullable', 1),
	(23, '2019_08_19_000000_create_failed_jobs_table', 1),
	(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(25, '2022_04_20_185030_create_customers_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table sistema_datos_plus.password_resets
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sistema_datos_plus.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table sistema_datos_plus.permissions
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sistema_datos_plus.permissions: ~30 rows (approximately)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
	(1, 'browse_admin', NULL, '2022-04-20 19:08:59', '2022-04-20 19:08:59'),
	(2, 'browse_bread', NULL, '2022-04-20 19:08:59', '2022-04-20 19:08:59'),
	(3, 'browse_database', NULL, '2022-04-20 19:08:59', '2022-04-20 19:08:59'),
	(4, 'browse_media', NULL, '2022-04-20 19:08:59', '2022-04-20 19:08:59'),
	(5, 'browse_compass', NULL, '2022-04-20 19:08:59', '2022-04-20 19:08:59'),
	(6, 'browse_menus', 'menus', '2022-04-20 19:08:59', '2022-04-20 19:08:59'),
	(7, 'read_menus', 'menus', '2022-04-20 19:08:59', '2022-04-20 19:08:59'),
	(8, 'edit_menus', 'menus', '2022-04-20 19:08:59', '2022-04-20 19:08:59'),
	(9, 'add_menus', 'menus', '2022-04-20 19:08:59', '2022-04-20 19:08:59'),
	(10, 'delete_menus', 'menus', '2022-04-20 19:08:59', '2022-04-20 19:08:59'),
	(11, 'browse_roles', 'roles', '2022-04-20 19:08:59', '2022-04-20 19:08:59'),
	(12, 'read_roles', 'roles', '2022-04-20 19:08:59', '2022-04-20 19:08:59'),
	(13, 'edit_roles', 'roles', '2022-04-20 19:08:59', '2022-04-20 19:08:59'),
	(14, 'add_roles', 'roles', '2022-04-20 19:08:59', '2022-04-20 19:08:59'),
	(15, 'delete_roles', 'roles', '2022-04-20 19:08:59', '2022-04-20 19:08:59'),
	(16, 'browse_users', 'users', '2022-04-20 19:08:59', '2022-04-20 19:08:59'),
	(17, 'read_users', 'users', '2022-04-20 19:08:59', '2022-04-20 19:08:59'),
	(18, 'edit_users', 'users', '2022-04-20 19:08:59', '2022-04-20 19:08:59'),
	(19, 'add_users', 'users', '2022-04-20 19:08:59', '2022-04-20 19:08:59'),
	(20, 'delete_users', 'users', '2022-04-20 19:08:59', '2022-04-20 19:08:59'),
	(21, 'browse_settings', 'settings', '2022-04-20 19:08:59', '2022-04-20 19:08:59'),
	(22, 'read_settings', 'settings', '2022-04-20 19:08:59', '2022-04-20 19:08:59'),
	(23, 'edit_settings', 'settings', '2022-04-20 19:08:59', '2022-04-20 19:08:59'),
	(24, 'add_settings', 'settings', '2022-04-20 19:08:59', '2022-04-20 19:08:59'),
	(25, 'delete_settings', 'settings', '2022-04-20 19:08:59', '2022-04-20 19:08:59'),
	(26, 'browse_customers', 'customers', '2022-04-20 19:17:31', '2022-04-20 19:17:31'),
	(27, 'read_customers', 'customers', '2022-04-20 19:17:31', '2022-04-20 19:17:31'),
	(28, 'edit_customers', 'customers', '2022-04-20 19:17:31', '2022-04-20 19:17:31'),
	(29, 'add_customers', 'customers', '2022-04-20 19:17:31', '2022-04-20 19:17:31'),
	(30, 'delete_customers', 'customers', '2022-04-20 19:17:31', '2022-04-20 19:17:31');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table sistema_datos_plus.permission_role
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sistema_datos_plus.permission_role: ~30 rows (approximately)
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(15, 1),
	(16, 1),
	(17, 1),
	(18, 1),
	(19, 1),
	(20, 1),
	(21, 1),
	(22, 1),
	(23, 1),
	(24, 1),
	(25, 1),
	(26, 1),
	(27, 1),
	(28, 1),
	(29, 1),
	(30, 1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;

-- Dumping structure for table sistema_datos_plus.personal_access_tokens
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sistema_datos_plus.personal_access_tokens: ~0 rows (approximately)
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Dumping structure for table sistema_datos_plus.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sistema_datos_plus.roles: ~2 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'Administrator', '2022-04-20 19:08:59', '2022-04-20 19:08:59'),
	(2, 'user', 'Normal User', '2022-04-20 19:08:59', '2022-04-20 19:08:59');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table sistema_datos_plus.settings
DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sistema_datos_plus.settings: ~10 rows (approximately)
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
	(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
	(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
	(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
	(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
	(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
	(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
	(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
	(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
	(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
	(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping structure for table sistema_datos_plus.translations
DROP TABLE IF EXISTS `translations`;
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sistema_datos_plus.translations: ~0 rows (approximately)
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;

-- Dumping structure for table sistema_datos_plus.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sistema_datos_plus.users: ~1 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Bryan', 'bzavalavaldivia@gmail.com', 'users/default.png', NULL, '$2y$10$Rxe6rltdxuUIX2l5nmgoNuXkbqkn.HO.mFjRVhYdW.mhsJNWZJ/Ga', 'q1LyNLKSVZUW911eBLfVstftLzcmA6hZgMkD1yHbtL9COCEpXzsGi7BSoAAm', NULL, '2022-04-20 19:12:02', '2022-04-20 19:12:02');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table sistema_datos_plus.user_roles
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sistema_datos_plus.user_roles: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

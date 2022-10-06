-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         10.5.8-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para dbsupermercado
CREATE DATABASE IF NOT EXISTS `dbsupermercado` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dbsupermercado`;

-- Volcando estructura para tabla dbsupermercado.cashiers
CREATE TABLE IF NOT EXISTS `cashiers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `identification` varchar(20) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `contact` varchar(200) DEFAULT NULL,
  `direction` varchar(200) DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `period_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cashier_period_fk` (`period_id`),
  CONSTRAINT `cashier_period_fk` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2013 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla dbsupermercado.cashiers: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `cashiers` DISABLE KEYS */;
INSERT INTO `cashiers` (`id`, `identification`, `name`, `contact`, `direction`, `arrival_time`, `departure_time`, `period_id`) VALUES
	(2009, '1006879060', 'Jusanse Gonzales', '3163550867', '3163550867', '13:36:00', '01:36:00', 3),
	(2010, '1006859060', 'Camilo Hernandez', '3145678060', 'Cabaña', '11:58:00', '15:02:00', 3),
	(2012, '1006879060', 'Maicol Jossa', '3163550867', 'esmeraldas', '03:09:00', '15:09:00', 3);
/*!40000 ALTER TABLE `cashiers` ENABLE KEYS */;

-- Volcando estructura para tabla dbsupermercado.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period_id` int(11) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_period_fk` (`period_id`) USING BTREE,
  CONSTRAINT `category_period_fk` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla dbsupermercado.categories: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `period_id`, `name`, `barcode`) VALUES
	(20, 3, 'Frutas', '100100'),
	(21, 3, 'Limpieza', '200200'),
	(22, 3, 'Dulces', '300300'),
	(23, 3, 'Medicinas', '400400'),
	(24, 3, 'Zapatos', '500500');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Volcando estructura para tabla dbsupermercado.clients
CREATE TABLE IF NOT EXISTS `clients` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `identification` varchar(20) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `contact` varchar(200) DEFAULT NULL,
  `period_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_clients_periods` (`period_id`),
  CONSTRAINT `FK_clients_periods` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla dbsupermercado.clients: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` (`id`, `identification`, `name`, `contact`, `period_id`) VALUES
	(6, '1006859060', 'Carlos', '3145678060', 3),
	(7, '1006879060', 'Lucia Erazo', '3163550867', 3);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;

-- Volcando estructura para tabla dbsupermercado.periods
CREATE TABLE IF NOT EXISTS `periods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `date` varchar(50) DEFAULT NULL,
  `period` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla dbsupermercado.periods: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `periods` DISABLE KEYS */;
INSERT INTO `periods` (`id`, `date`, `period`) VALUES
	(3, 'Admin 1', 100000001),
	(4, 'Admin 2', 200000002);
/*!40000 ALTER TABLE `periods` ENABLE KEYS */;

-- Volcando estructura para tabla dbsupermercado.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned DEFAULT NULL,
  `supplier_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `value` int(20) DEFAULT NULL,
  `date_admission` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `period_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_period_fk` (`period_id`) USING BTREE,
  KEY `product_category_fk` (`category_id`),
  KEY `product_suplier_fk` (`supplier_id`),
  CONSTRAINT `product_category_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_period_fk` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_suplier_fk` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2634 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla dbsupermercado.products: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `category_id`, `supplier_id`, `name`, `description`, `value`, `date_admission`, `due_date`, `period_id`) VALUES
	(2624, 20, 2, 'frutas', 'limpieza', 1000, '2022-05-23', '2022-05-23', 3),
	(2625, 21, 2, 'mango', 'alimento', 1000, '2022-05-25', '2022-05-26', 3),
	(2632, 22, 2, 'Bubalu', 'unidad', 200, '2022-05-18', '2022-05-20', 3),
	(2633, 23, 4, 'Tukol-D', 'unidad', 20000, '2022-05-24', '2022-05-31', 3);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Volcando estructura para tabla dbsupermercado.sales
CREATE TABLE IF NOT EXISTS `sales` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cashier_id` int(11) unsigned DEFAULT NULL,
  `client_id` int(11) unsigned DEFAULT NULL,
  `product_id` int(11) unsigned DEFAULT NULL,
  `amount` int(60) DEFAULT NULL,
  `value` int(60) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `period_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_cashier_fk` (`cashier_id`),
  KEY `sales_clients_fk` (`client_id`),
  KEY `sales_products_fk` (`product_id`),
  KEY `sales_periods_fk` (`period_id`),
  CONSTRAINT `sales_cashier_fk` FOREIGN KEY (`cashier_id`) REFERENCES `cashiers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_clients_fk` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_periods_fk` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_products_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla dbsupermercado.sales: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` (`id`, `cashier_id`, `client_id`, `product_id`, `amount`, `value`, `purchase_date`, `period_id`) VALUES
	(1, 2009, 6, 2632, 2, 400, '2022-06-02', 3),
	(2, 2010, 7, 2633, 2, 40000, '2022-06-08', 3),
	(3, 2012, 7, 2632, 1, 200, '2022-06-06', 3);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;

-- Volcando estructura para tabla dbsupermercado.suppliers
CREATE TABLE IF NOT EXISTS `suppliers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `contact` varchar(60) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `period_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `suppliers_periods_fk` (`period_id`),
  CONSTRAINT `suppliers_periods_fk` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla dbsupermercado.suppliers: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` (`id`, `name`, `contact`, `email`, `period_id`) VALUES
	(2, 'Carolina', '3163550867', 'carloscuaran018@hotmail.com', 3),
	(4, 'Carlos', '3163550867', 'carloscuaran018@gmail.com', 3);
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

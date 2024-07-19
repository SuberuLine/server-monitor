-- -------------------------------------------------------------
-- TablePlus 6.0.8(562)
--
-- https://tableplus.com/
--
-- Database: monitor
-- Generation Time: 2024-07-20 03:46:42.3270
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `db_account`;
CREATE TABLE `db_account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `clients` json DEFAULT NULL,
  `register_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email` (`email`),
  UNIQUE KEY `unique_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `db_client`;
CREATE TABLE `db_client` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `node` varchar(255) DEFAULT NULL,
  `register_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `db_client_detail`;
CREATE TABLE `db_client_detail` (
  `id` int NOT NULL,
  `os_arch` varchar(255) DEFAULT NULL,
  `os_name` varchar(255) DEFAULT NULL,
  `os_version` varchar(255) DEFAULT NULL,
  `os_bit` int DEFAULT NULL,
  `cpu_name` varchar(255) DEFAULT NULL,
  `cpu_core` int DEFAULT NULL,
  `memory` double DEFAULT NULL,
  `disk` double DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `db_client_ssh`;
CREATE TABLE `db_client_ssh` (
  `id` int NOT NULL,
  `port` int DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `db_account` (`id`, `username`, `email`, `password`, `role`, `clients`, `register_time`) VALUES
(1, 'admin', 'yuzoii@hotmail.com', '$2a$10$QT7fPtkYtqlMdob7zjrVCOKJj6YMojfH0oLPWyL2aEMAAYHGOvnyK', 'admin', NULL, '2024-05-25 10:09:13'),
(7, 'adminsub', 'test@hotmail.com', '$2a$10$Xu0vPAY/nCL/gpv0JwqWEOvdndUbORvJ.Xd5j/mv0J4ObsKRuyBTy', 'user', '[42992543]', '2024-07-20 00:48:26');

INSERT INTO `db_client` (`id`, `name`, `token`, `location`, `node`, `register_time`) VALUES
(42992543, '我的Mac', 'vjcexZVnfOCSJtM5qK2nnoj4', 'hk', '新节点', '2024-05-25 10:13:32'),
(98309779, '未命名主机', 'H8EVSoEUDlqdGoO7VBW6BwtV', 'cn', '未命名节点', '2024-07-20 01:08:13');

INSERT INTO `db_client_detail` (`id`, `os_arch`, `os_name`, `os_version`, `os_bit`, `cpu_name`, `cpu_core`, `memory`, `disk`, `ip`) VALUES
(42992543, 'aarch64', 'macOS', '13.6.3', 64, 'Apple M1 Pro', 10, 32, 460.4317207336426, '192.168.6.224'),
(98309779, 'amd64', 'Debian GNU/Linux', '12', 64, 'AMD A10-8780P Radeon R8, 12 Compute Cores 4C+8G', 4, 15.33291244506836, 115.37860870361328, '192.168.6.156');

INSERT INTO `db_client_ssh` (`id`, `port`, `username`, `password`) VALUES
(98309779, 22, 'root', '0179310341');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
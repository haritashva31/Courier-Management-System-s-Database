-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (arm64)
--
-- Host: localhost    Database: courier
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Admin` (
  `admin_id` int NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_password` varchar(50) NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `admin_email` (`admin_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_employee`
--

DROP TABLE IF EXISTS `branch_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch_employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(50) NOT NULL,
  `employee_email` varchar(50) NOT NULL,
  `employee_password` varchar(50) NOT NULL,
  `delivery_center_id` int NOT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `employee_email` (`employee_email`),
  KEY `delivery_center_id` (`delivery_center_id`),
  CONSTRAINT `branch_employee_ibfk_1` FOREIGN KEY (`delivery_center_id`) REFERENCES `delivery_center` (`center_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_employee`
--

LOCK TABLES `branch_employee` WRITE;
/*!40000 ALTER TABLE `branch_employee` DISABLE KEYS */;
INSERT INTO `branch_employee` VALUES (1,'Rythm Sethiya','rythm@gmail.com','password123',1),(2,'Ayush','ayush@gmail.com','password123',2),(3,'Harsh','harsh@gmail.com','password123',3);
/*!40000 ALTER TABLE `branch_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courier`
--

DROP TABLE IF EXISTS `courier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courier` (
  `courier_id` int NOT NULL AUTO_INCREMENT,
  `courier_status_id` int NOT NULL DEFAULT '1',
  `user_id` int NOT NULL,
  `courier_weight` float NOT NULL,
  `courier_pickup_address` varchar(100) NOT NULL,
  `courier_destination_address` varchar(100) NOT NULL,
  `courier_pickup_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `courier_delivery_time` datetime DEFAULT NULL,
  `courier_cost` float DEFAULT NULL,
  `delivery_center_id` int DEFAULT NULL,
  `courier_weight_category` varchar(50) DEFAULT NULL,
  `courier_type_id` int DEFAULT NULL,
  `pickup_center_id` int DEFAULT NULL,
  PRIMARY KEY (`courier_id`),
  KEY `courier_status_id` (`courier_status_id`),
  KEY `fk_courier_delivery_center` (`delivery_center_id`),
  KEY `fk_courier_courier_rate` (`courier_weight_category`),
  KEY `courier_ibfk_2` (`user_id`),
  KEY `courier_type_id` (`courier_type_id`),
  KEY `fk_pickup_center_id_courier` (`pickup_center_id`),
  CONSTRAINT `courier_ibfk_1` FOREIGN KEY (`courier_status_id`) REFERENCES `Courier_Status` (`status_id`),
  CONSTRAINT `courier_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `courier_ibfk_3` FOREIGN KEY (`courier_type_id`) REFERENCES `courier_type` (`courier_type_id`),
  CONSTRAINT `fk_courier_delivery_center` FOREIGN KEY (`delivery_center_id`) REFERENCES `delivery_center` (`center_id`),
  CONSTRAINT `fk_courier_type` FOREIGN KEY (`courier_type_id`) REFERENCES `courier_type` (`courier_type_id`),
  CONSTRAINT `fk_pickup_center_id` FOREIGN KEY (`pickup_center_id`) REFERENCES `delivery_center` (`center_id`),
  CONSTRAINT `fk_pickup_center_id_courier` FOREIGN KEY (`pickup_center_id`) REFERENCES `delivery_center` (`center_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courier`
--

LOCK TABLES `courier` WRITE;
/*!40000 ALTER TABLE `courier` DISABLE KEYS */;
INSERT INTO `courier` VALUES (2,1,1,4,'Vanaz metro','bandra','2023-05-07 12:40:39',NULL,NULL,3,NULL,2,NULL),(3,1,2,6,'Vanaz metro','bandra','2023-05-07 12:44:43',NULL,NULL,3,NULL,2,NULL),(4,1,1,7,'Vanaz metro','bandra','2023-05-07 12:46:59',NULL,NULL,1,NULL,1,NULL),(5,1,1,3,'Vanaz metro','bandra','2023-05-07 12:51:51',NULL,NULL,1,'5kg or less',1,NULL),(6,1,1,3,'Vanaz metro','bandra','2023-05-07 12:59:19',NULL,200,1,'5kg or less',1,NULL),(7,1,1,4,'dhwedh','ewfwef','2023-05-09 19:19:59',NULL,200,1,'5kg or less',1,NULL),(8,1,3,7.6,'dhwedh','ewfwef','2023-05-09 19:26:48',NULL,600,2,'10kg or less',2,NULL),(9,1,3,7.6,'dhwedh','ewfwef','2023-05-09 19:27:57',NULL,600,2,'10kg or less',2,NULL),(10,1,2,9,'daaaa','jjjj','2023-05-09 19:28:29',NULL,400,3,'10kg or less',1,NULL),(11,1,2,6,'hell','heaven','2023-05-09 20:53:22',NULL,600,2,'10kg or less',2,NULL),(13,1,1,6.2,'bandra','eden garden','2023-05-16 06:15:06',NULL,400,3,'10kg or less',1,1),(14,1,2,7,'bandra','eden','2023-05-16 06:43:28',NULL,600,3,'10kg or less',2,1),(17,1,4,6.9,'south delhi','eden','2023-05-16 06:53:20',NULL,400,3,'10kg or less',1,2),(18,1,3,5.1,'south delhi','eden','2023-05-16 07:01:48',NULL,400,3,'10kg or less',1,2);
/*!40000 ALTER TABLE `courier` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_courier_weight_category` BEFORE INSERT ON `courier` FOR EACH ROW BEGIN
    SET NEW.courier_weight_category = (
        SELECT courier_weight_category
        FROM courier_rate
        WHERE NEW.courier_weight BETWEEN courier_weight_min AND courier_weight_max
        AND user_status_id = (
            SELECT user_status_id
            FROM user_personal_info
            WHERE user_personal_info.user_id = NEW.user_id
        )
        ORDER BY courier_rate
        LIMIT 1
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_courier_cost` BEFORE INSERT ON `courier` FOR EACH ROW BEGIN
    SET NEW.courier_cost = (
        SELECT MIN(courier_rate)
        FROM courier_rate
        INNER JOIN user_personal_info ON courier_rate.user_status_id = user_personal_info.user_status_id
        INNER JOIN courier_type ON courier_rate.courier_type_id = courier_type.courier_type_id
        WHERE NEW.courier_weight BETWEEN courier_weight_min AND courier_weight_max
        AND courier_weight_category = NEW.courier_weight_category
        AND user_personal_info.user_id = NEW.user_id
        AND courier_type.courier_type_id = NEW.courier_type_id
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_insert_courier` AFTER INSERT ON `courier` FOR EACH ROW BEGIN
    INSERT INTO courier_details_status1(courier_id, courier_pickup_address, courier_pickup_time, courier_cost, courier_weight, delivery_center_id, courier_destination_address)
    VALUES(NEW.courier_id, NEW.courier_pickup_address, NEW.courier_pickup_time, NEW.courier_cost, NEW.courier_weight, NEW.delivery_center_id, NEW.courier_destination_address);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `courier_insert` AFTER INSERT ON `courier` FOR EACH ROW BEGIN
  IF NEW.courier_status_id = 4 THEN
    INSERT INTO courier_status_4 (courier_id, courier_destination_address, courier_weight, delivery_center_id)
    VALUES (NEW.courier_id, NEW.courier_destination_address, NEW.courier_weight, NEW.delivery_center_id);
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `courier_insert_trigger` AFTER INSERT ON `courier` FOR EACH ROW BEGIN
  IF NEW.courier_status_id = 1 THEN
    INSERT INTO courier_details_status1 (
      courier_id,
      courier_pickup_address,
      courier_destination_address,
      courier_pickup_time,
      courier_cost,
      courier_weight,
      delivery_center_id
    ) VALUES (
      NEW.courier_id,
      NEW.courier_pickup_address,
      NEW.courier_destination_address,
      NEW.courier_pickup_time,
      NEW.courier_cost,
      NEW.courier_weight,
      NEW.delivery_center_id
    );
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_user_summary` AFTER INSERT ON `courier` FOR EACH ROW BEGIN
    DECLARE user_status INT;
    SELECT user_personal_info.user_status_id 
    INTO user_status 
    FROM user_personal_info 
    INNER JOIN user ON user_personal_info.user_id = user.user_id 
    WHERE user.user_id = NEW.user_id;

    UPDATE user_summary 
    SET total_money_spent = IFNULL(total_money_spent, 0) + NEW.courier_cost, 
        total_courier_shipped = IFNULL(total_courier_shipped, 0) + 1 
    WHERE user_id = NEW.user_id AND user_status = user_summary.user_status;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_delivery_boy_center_1_pickup` AFTER INSERT ON `courier` FOR EACH ROW BEGIN
  IF NEW.courier_status_id = 1 AND NEW.pickup_center_id = 1 THEN
    INSERT INTO delivery_boy_center_1_pickup (courier_id, courier_weight, courier_pickup_address, courier_type_id, pickup_center_id, user_phone)
    SELECT c.courier_id, c.courier_weight, c.courier_pickup_address, c.courier_type_id, c.pickup_center_id, u.user_phone
    FROM courier c
    INNER JOIN user u ON c.user_id = u.user_id
    WHERE c.courier_id = NEW.courier_id;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_delivery_boy_center_2_pickup` AFTER INSERT ON `courier` FOR EACH ROW BEGIN
  IF NEW.courier_status_id = 1 AND NEW.pickup_center_id = 2 THEN
    INSERT INTO delivery_boy_center_2_pickup (courier_id, courier_weight, courier_pickup_address, courier_type_id, pickup_center_id, user_phone)
    SELECT c.courier_id, c.courier_weight, c.courier_pickup_address, c.courier_type_id, c.pickup_center_id, u.user_phone
    FROM courier c
    INNER JOIN user u ON c.user_id = u.user_id
    WHERE c.courier_id = NEW.courier_id;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_delivery_boy_center_3_pickup` AFTER INSERT ON `courier` FOR EACH ROW BEGIN
  IF NEW.courier_status_id = 1 AND NEW.pickup_center_id = 3 THEN
    INSERT INTO delivery_boy_center_3_pickup (courier_id, courier_weight, courier_pickup_address, courier_type_id, pickup_center_id, user_phone)
    SELECT c.courier_id, c.courier_weight, c.courier_pickup_address, c.courier_type_id, c.pickup_center_id, u.user_phone
    FROM courier c
    INNER JOIN user u ON c.user_id = u.user_id
    WHERE c.courier_id = NEW.courier_id;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `courier_log_trigger` AFTER INSERT ON `courier` FOR EACH ROW BEGIN
  INSERT INTO courier_log (action, courier_id, user_id, courier_status_id, courier_weight, courier_pickup_address, courier_destination_address, courier_pickup_time, courier_delivery_time, courier_cost, delivery_center_id, courier_weight_category, courier_type_id, pickup_center_id)
  VALUES ('insert', NEW.courier_id, NEW.user_id, NEW.courier_status_id, NEW.courier_weight, NEW.courier_pickup_address, NEW.courier_destination_address, NEW.courier_pickup_time, NEW.courier_delivery_time, NEW.courier_cost, NEW.delivery_center_id, NEW.courier_weight_category, NEW.courier_type_id, NEW.pickup_center_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_update_courier` AFTER UPDATE ON `courier` FOR EACH ROW BEGIN
    UPDATE courier_details_status1
    SET courier_pickup_address = NEW.courier_pickup_address,
        courier_pickup_time = NEW.courier_pickup_time,
        courier_cost = NEW.courier_cost,
        courier_weight = NEW.courier_weight,
        delivery_center_id = NEW.delivery_center_id,
        courier_destination_address = NEW.courier_destination_address
    WHERE courier_id = OLD.courier_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `courier_update` AFTER UPDATE ON `courier` FOR EACH ROW BEGIN
  IF NEW.courier_status_id = 4 THEN
    UPDATE courier_status_4
    SET courier_destination_address = NEW.courier_destination_address,
        courier_weight = NEW.courier_weight,
        delivery_center_id = NEW.delivery_center_id
    WHERE courier_id = NEW.courier_id;
  ELSE
    DELETE FROM courier_status_4 WHERE courier_id = NEW.courier_id;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `courier_update_trigger` AFTER UPDATE ON `courier` FOR EACH ROW BEGIN
    UPDATE courier_details_status1
    SET courier_pickup_address = NEW.courier_pickup_address,
        courier_pickup_time = NEW.courier_pickup_time,
        courier_cost = NEW.courier_cost,
        courier_weight = NEW.courier_weight,
        delivery_center_id = NEW.delivery_center_id,
        courier_destination_address = NEW.courier_destination_address
    WHERE courier_id = NEW.courier_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_tracking_status` AFTER UPDATE ON `courier` FOR EACH ROW BEGIN
    IF OLD.courier_status_id != NEW.courier_status_id THEN
        INSERT INTO tracking (tracking_id, courier_status) 
        VALUES (NEW.courier_id, (SELECT status_name FROM courier_status WHERE status_id = NEW.courier_status_id));
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `courier_log_trigger_update` AFTER UPDATE ON `courier` FOR EACH ROW BEGIN
  INSERT INTO courier_log (action, courier_id, user_id, courier_status_id, courier_weight, courier_pickup_address, courier_destination_address, courier_pickup_time, courier_delivery_time, courier_cost, delivery_center_id, courier_weight_category, courier_type_id, pickup_center_id)
  VALUES ('update', NEW.courier_id, NEW.user_id, NEW.courier_status_id, NEW.courier_weight, NEW.courier_pickup_address, NEW.courier_destination_address, NEW.courier_pickup_time, NEW.courier_delivery_time, NEW.courier_cost, NEW.delivery_center_id, NEW.courier_weight_category, NEW.courier_type_id, NEW.pickup_center_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_delete_courier` AFTER DELETE ON `courier` FOR EACH ROW BEGIN
    DELETE FROM courier_details_status1 WHERE courier_id = OLD.courier_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `courier_delete` AFTER DELETE ON `courier` FOR EACH ROW BEGIN
  DELETE FROM courier_status_4 WHERE courier_id = OLD.courier_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_courier_total_money_spent` AFTER DELETE ON `courier` FOR EACH ROW BEGIN
    UPDATE user_summary
    SET total_money_spent = IFNULL(total_money_spent, 0) - OLD.courier_cost
    WHERE user_id = OLD.user_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `courier_log_trigger_delete` AFTER DELETE ON `courier` FOR EACH ROW BEGIN
  INSERT INTO courier_log (action, courier_id, user_id, courier_status_id, courier_weight, courier_pickup_address, courier_destination_address, courier_pickup_time, courier_delivery_time, courier_cost, delivery_center_id, courier_weight_category, courier_type_id, pickup_center_id)
  VALUES ('delete', OLD.courier_id, OLD.user_id, OLD.courier_status_id, OLD.courier_weight, OLD.courier_pickup_address, OLD.courier_destination_address, OLD.courier_pickup_time, OLD.courier_delivery_time, OLD.courier_cost, OLD.delivery_center_id, OLD.courier_weight_category, OLD.courier_type_id, OLD.pickup_center_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `courier_details_status1`
--

DROP TABLE IF EXISTS `courier_details_status1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courier_details_status1` (
  `courier_id` int NOT NULL,
  `courier_pickup_address` varchar(255) NOT NULL,
  `courier_pickup_time` datetime NOT NULL,
  `courier_cost` decimal(10,2) DEFAULT NULL,
  `courier_weight` decimal(10,2) NOT NULL,
  `delivery_center_id` int NOT NULL,
  `courier_destination_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courier_details_status1`
--

LOCK TABLES `courier_details_status1` WRITE;
/*!40000 ALTER TABLE `courier_details_status1` DISABLE KEYS */;
INSERT INTO `courier_details_status1` VALUES (2,'Vanaz metro','2023-05-07 12:40:39',NULL,4.00,3,'bandra'),(2,'Vanaz metro','2023-05-07 12:40:39',NULL,4.00,3,'bandra'),(3,'Vanaz metro','2023-05-07 12:44:43',NULL,6.00,3,'bandra'),(3,'Vanaz metro','2023-05-07 12:44:43',NULL,6.00,3,'bandra'),(4,'Vanaz metro','2023-05-07 12:46:59',NULL,7.00,1,'bandra'),(4,'Vanaz metro','2023-05-07 12:46:59',NULL,7.00,1,'bandra'),(5,'Vanaz metro','2023-05-07 12:51:51',NULL,3.00,1,'bandra'),(5,'Vanaz metro','2023-05-07 12:51:51',NULL,3.00,1,'bandra'),(6,'Vanaz metro','2023-05-07 12:59:19',200.00,3.00,1,'bandra'),(6,'Vanaz metro','2023-05-07 12:59:19',200.00,3.00,1,'bandra'),(7,'dhwedh','2023-05-09 19:19:59',200.00,4.00,1,'ewfwef'),(7,'dhwedh','2023-05-09 19:19:59',200.00,4.00,1,'ewfwef'),(8,'dhwedh','2023-05-09 19:26:48',600.00,7.60,2,'ewfwef'),(8,'dhwedh','2023-05-09 19:26:48',600.00,7.60,2,'ewfwef'),(9,'dhwedh','2023-05-09 19:27:57',600.00,7.60,2,'ewfwef'),(9,'dhwedh','2023-05-09 19:27:57',600.00,7.60,2,'ewfwef'),(10,'daaaa','2023-05-09 19:28:29',400.00,9.00,3,'jjjj'),(10,'daaaa','2023-05-09 19:28:29',400.00,9.00,3,'jjjj'),(11,'hell','2023-05-09 20:53:22',600.00,6.00,2,'heaven'),(11,'hell','2023-05-09 20:53:22',600.00,6.00,2,'heaven'),(13,'bandra','2023-05-16 06:15:06',400.00,6.20,3,'eden garden'),(13,'bandra','2023-05-16 06:15:06',400.00,6.20,3,'eden garden'),(14,'bandra','2023-05-16 06:43:28',600.00,7.00,3,'eden'),(14,'bandra','2023-05-16 06:43:28',600.00,7.00,3,'eden'),(17,'south delhi','2023-05-16 06:53:20',400.00,6.90,3,'eden'),(17,'south delhi','2023-05-16 06:53:20',400.00,6.90,3,'eden'),(18,'south delhi','2023-05-16 07:01:48',400.00,5.10,3,'eden'),(18,'south delhi','2023-05-16 07:01:48',400.00,5.10,3,'eden');
/*!40000 ALTER TABLE `courier_details_status1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courier_log`
--

DROP TABLE IF EXISTS `courier_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courier_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `log_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action` enum('insert','update','delete') NOT NULL,
  `courier_id` int NOT NULL,
  `user_id` int NOT NULL,
  `courier_status_id` int NOT NULL,
  `courier_weight` float NOT NULL,
  `courier_pickup_address` varchar(100) NOT NULL,
  `courier_destination_address` varchar(100) NOT NULL,
  `courier_pickup_time` datetime NOT NULL,
  `courier_delivery_time` datetime DEFAULT NULL,
  `courier_cost` float DEFAULT NULL,
  `delivery_center_id` int DEFAULT NULL,
  `courier_weight_category` varchar(50) DEFAULT NULL,
  `courier_type_id` int DEFAULT NULL,
  `pickup_center_id` int DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `idx_courier_id` (`courier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courier_log`
--

LOCK TABLES `courier_log` WRITE;
/*!40000 ALTER TABLE `courier_log` DISABLE KEYS */;
INSERT INTO `courier_log` VALUES (1,'2023-05-07 07:10:39','insert',2,1,1,4,'Vanaz metro','bandra','2023-05-07 12:40:39',NULL,NULL,3,NULL,2,NULL),(2,'2023-05-07 07:14:43','insert',3,2,1,6,'Vanaz metro','bandra','2023-05-07 12:44:43',NULL,NULL,3,NULL,2,NULL),(3,'2023-05-07 07:16:59','insert',4,1,1,7,'Vanaz metro','bandra','2023-05-07 12:46:59',NULL,NULL,1,NULL,1,NULL),(4,'2023-05-07 07:21:51','insert',5,1,1,3,'Vanaz metro','bandra','2023-05-07 12:51:51',NULL,NULL,1,'5kg or less',1,NULL),(5,'2023-05-07 07:29:19','insert',6,1,1,3,'Vanaz metro','bandra','2023-05-07 12:59:19',NULL,200,1,'5kg or less',1,NULL),(6,'2023-05-09 13:49:59','insert',7,1,1,4,'dhwedh','ewfwef','2023-05-09 19:19:59',NULL,200,1,'5kg or less',1,NULL),(7,'2023-05-09 13:56:48','insert',8,3,1,7.6,'dhwedh','ewfwef','2023-05-09 19:26:48',NULL,600,2,'10kg or less',2,NULL),(8,'2023-05-09 13:57:57','insert',9,3,1,7.6,'dhwedh','ewfwef','2023-05-09 19:27:57',NULL,600,2,'10kg or less',2,NULL),(9,'2023-05-09 13:58:29','insert',10,2,1,9,'daaaa','jjjj','2023-05-09 19:28:29',NULL,400,3,'10kg or less',1,NULL),(10,'2023-05-09 15:23:22','insert',11,2,1,6,'hell','heaven','2023-05-09 20:53:22',NULL,600,2,'10kg or less',2,NULL),(11,'2023-05-16 00:45:06','insert',13,1,1,6.2,'bandra','eden garden','2023-05-16 06:15:06',NULL,400,3,'10kg or less',1,NULL),(12,'2023-05-16 01:13:28','insert',14,2,1,7,'bandra','eden','2023-05-16 06:43:28',NULL,600,3,'10kg or less',2,NULL),(15,'2023-05-16 01:23:20','insert',17,4,1,6.9,'south delhi','eden','2023-05-16 06:53:20',NULL,400,3,'10kg or less',1,NULL),(16,'2023-05-16 01:31:48','insert',18,3,1,5.1,'south delhi','eden','2023-05-16 07:01:48',NULL,400,3,'10kg or less',1,2);
/*!40000 ALTER TABLE `courier_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_revenue` AFTER INSERT ON `courier_log` FOR EACH ROW BEGIN
    UPDATE revenue
    SET revenue = (SELECT SUM(courier_cost) FROM courier_log);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `courier_reached_delivery_center_1` AFTER UPDATE ON `courier_log` FOR EACH ROW BEGIN
    IF NEW.courier_status_id = 2 AND NEW.delivery_center_id = 1 THEN
        INSERT INTO delivery_center_1_reached (courier_id, courier_weight, delivery_center_id, courier_weight_category, courier_type_id)
        VALUES (NEW.courier_id, NEW.courier_weight, NEW.delivery_center_id, NEW.courier_weight_category, NEW.courier_type_id);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `courier_reached_delivery_center_2` AFTER UPDATE ON `courier_log` FOR EACH ROW BEGIN
    IF NEW.courier_status_id = 2 AND NEW.delivery_center_id = 2 THEN
        INSERT INTO delivery_center_2_reached (courier_id, courier_weight, delivery_center_id, courier_weight_category, courier_type_id)
        VALUES (NEW.courier_id, NEW.courier_weight, NEW.delivery_center_id, NEW.courier_weight_category, NEW.courier_type_id);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `courier_reached_delivery_center_3` AFTER UPDATE ON `courier_log` FOR EACH ROW BEGIN
    IF NEW.courier_status_id = 2 AND NEW.delivery_center_id = 3 THEN
        INSERT INTO delivery_center_3_reached (courier_id, courier_weight, delivery_center_id, courier_weight_category, courier_type_id)
        VALUES (NEW.courier_id, NEW.courier_weight, NEW.delivery_center_id, NEW.courier_weight_category, NEW.courier_type_id);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delivery_boy_center_1_deliver_trigger` AFTER UPDATE ON `courier_log` FOR EACH ROW BEGIN
IF NEW.courier_status_id = 4 AND NEW.delivery_center_id = 1 THEN
INSERT INTO delivery_boy_center_1_deliver (
courier_id, courier_weight, courier_destination_address, courier_type_id, delivery_center_id, user_phone_no
    )
 SELECT 
cl.courier_id, cl.courier_weight, cl.courier_destination_address, cl.courier_type_id, cl.delivery_center_id, u.user_phone
        FROM 
            courier_log cl
            JOIN user u ON cl.user_id = u.user_id
        WHERE 
            cl.courier_id = NEW.courier_id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delivery_boy_center_3_deliver_trigger` AFTER UPDATE ON `courier_log` FOR EACH ROW BEGIN
IF NEW.courier_status_id = 4 AND NEW.delivery_center_id = 3 THEN
INSERT INTO delivery_boy_center_3_deliver (
courier_id, courier_weight, courier_destination_address, courier_type_id, delivery_center_id, user_phone_no
)
SELECT 
cl.courier_id, cl.courier_weight, cl.courier_destination_address, cl.courier_type_id, cl.delivery_center_id, u.user_phone
        FROM 
            courier_log cl
            JOIN user u ON cl.user_id = u.user_id
        WHERE 
            cl.courier_id = NEW.courier_id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delivery_boy_center_2_deliver_trigger` AFTER UPDATE ON `courier_log` FOR EACH ROW BEGIN
IF NEW.courier_status_id = 4 AND NEW.delivery_center_id = 2 THEN
INSERT INTO delivery_boy_center_2_deliver (
courier_id, courier_weight, courier_destination_address, courier_type_id, delivery_center_id, user_phone_no
)
SELECT
cl.courier_id, cl.courier_weight, cl.courier_destination_address, cl.courier_type_id, cl.delivery_center_id, u.user_phone
        FROM 
            courier_log cl
            JOIN user u ON cl.user_id = u.user_id
        WHERE 
            cl.courier_id = NEW.courier_id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `add_courier_to_delivery_center_1_pending` AFTER UPDATE ON `courier_log` FOR EACH ROW BEGIN
     IF NEW.courier_status_id = 6 AND NEW.delivery_center_id = 1 THEN
      INSERT INTO delivery_center_1_pending (courier_id, courier_weight, delivery_center_id, courier_weight_category, courier_type_id)
         VALUES (NEW.courier_id, NEW.courier_weight, NEW.delivery_center_id, NEW.courier_weight_category, NEW.courier_type_id);
       END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_to_delivery_center_2_pending` AFTER UPDATE ON `courier_log` FOR EACH ROW BEGIN
    IF NEW.courier_status_id = 6 AND NEW.delivery_center_id = 2 THEN
    INSERT INTO delivery_center_2_pending (courier_id, courier_weight, delivery_center_id, courier_weight_category, courier_type_id)
    VALUES (NEW.courier_id, NEW.courier_weight, NEW.delivery_center_id, NEW.courier_weight_category, NEW.courier_type_id);
    END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_to_delivery_center_3_pending` AFTER UPDATE ON `courier_log` FOR EACH ROW BEGIN
     IF NEW.courier_status_id = 6 AND NEW.delivery_center_id = 3 THEN
     INSERT INTO delivery_center_3_pending (courier_id, courier_weight, delivery_center_id, courier_weight_category, courier_type_id)
     VALUES (NEW.courier_id, NEW.courier_weight, NEW.delivery_center_id, NEW.courier_weight_category, NEW.courier_type_id);
    END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `my_order_update_trigger` AFTER UPDATE ON `courier_log` FOR EACH ROW BEGIN
    IF NEW.action = 'update' THEN
        UPDATE my_order
        SET 
            courier_status = (SELECT status_name FROM courier_status WHERE status_id = NEW.courier_status_id),
            courier_weight = NEW.courier_weight,
            courier_pickup_address = NEW.courier_pickup_address,
            courier_destination_address = NEW.courier_destination_address,
            courier_pickup_time = NEW.courier_pickup_time,
            courier_delivery_time = NEW.courier_delivery_time,
            courier_cost = NEW.courier_cost,
            courier_type_id = NEW.courier_type_id
        WHERE courier_id = NEW.courier_id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_courier_status` AFTER UPDATE ON `courier_log` FOR EACH ROW BEGIN
    IF OLD.courier_status_id <> NEW.courier_status_id THEN
        INSERT INTO tracking (tracking_id, courier_status)
        VALUES (NEW.courier_id, (SELECT status_name FROM courier_status WHERE status_id = NEW.courier_status_id));
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `courier_rate`
--

DROP TABLE IF EXISTS `courier_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courier_rate` (
  `courier_rate_id` int NOT NULL,
  `courier_weight_category` varchar(50) NOT NULL,
  `courier_weight_min` float NOT NULL,
  `courier_weight_max` float NOT NULL,
  `courier_rate` decimal(10,2) NOT NULL,
  `courier_type_id` int DEFAULT NULL,
  `user_status_id` int NOT NULL,
  `cost_bared` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`courier_rate_id`),
  KEY `idx_courier_weight_category` (`courier_weight_category`),
  KEY `courier_type_id` (`courier_type_id`),
  KEY `fk_courier_rate_user_status` (`user_status_id`),
  CONSTRAINT `courier_rate_ibfk_2` FOREIGN KEY (`courier_type_id`) REFERENCES `courier_type` (`courier_type_id`),
  CONSTRAINT `courier_rate_ibfk_3` FOREIGN KEY (`courier_type_id`) REFERENCES `courier_type` (`courier_type_id`),
  CONSTRAINT `courier_rate_ibfk_4` FOREIGN KEY (`courier_type_id`) REFERENCES `courier_type` (`courier_type_id`),
  CONSTRAINT `fk_courier_rate_user_status` FOREIGN KEY (`user_status_id`) REFERENCES `user_status` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courier_rate`
--

LOCK TABLES `courier_rate` WRITE;
/*!40000 ALTER TABLE `courier_rate` DISABLE KEYS */;
INSERT INTO `courier_rate` VALUES (1,'Less than 2kg',0,2,100.00,1,1,55.00),(2,'Less than 2kg',0,2,150.00,2,1,60.00),(3,'Less than 2kg',0,2,90.00,1,2,55.00),(4,'Less than 2kg',0,2,130.00,2,2,60.00),(5,'Less than 2kg',0,2,80.00,1,3,55.00),(6,'Less than 2kg',0,2,120.00,2,3,60.00),(7,'Less than 2kg',0,2,60.00,1,4,55.00),(8,'Less than 2kg',0,2,100.00,2,4,60.00),(9,'5kg or less',2.1,5,200.00,1,1,90.00),(10,'5kg or less',2.1,5,300.00,2,1,110.00),(11,'5kg or less',2.1,5,180.00,1,2,90.00),(12,'5kg or less',2.1,5,260.00,2,2,110.00),(13,'5kg or less',2.1,5,160.00,1,3,90.00),(14,'5kg or less',2.1,5,240.00,2,3,110.00),(15,'5kg or less',2.1,5,120.00,1,4,90.00),(16,'5kg or less',2.1,5,200.00,2,4,110.00),(17,'10kg or less',5.1,10,400.00,1,1,165.00),(18,'10kg or less',5.1,10,600.00,2,1,200.00),(19,'10kg or less',5.1,10,360.00,1,2,165.00),(20,'10kg or less',5.1,10,520.00,2,2,200.00),(21,'10kg or less',5.1,10,320.00,1,3,165.00),(22,'10kg or less',5.1,10,480.00,2,3,200.00),(23,'10kg or less',5.1,10,240.00,1,4,165.00),(24,'10kg or less',5.1,10,400.00,2,4,200.00);
/*!40000 ALTER TABLE `courier_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courier_status`
--

DROP TABLE IF EXISTS `courier_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courier_status` (
  `status_id` int NOT NULL,
  `status_name` varchar(50) NOT NULL,
  PRIMARY KEY (`status_id`),
  UNIQUE KEY `status_name` (`status_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courier_status`
--

LOCK TABLES `courier_status` WRITE;
/*!40000 ALTER TABLE `courier_status` DISABLE KEYS */;
INSERT INTO `courier_status` VALUES (3,'Delivered'),(2,'In Transit'),(5,'Out for Delivery'),(1,'Pending'),(6,'Picked Up'),(4,'Reached delivery centre');
/*!40000 ALTER TABLE `courier_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courier_status_4`
--

DROP TABLE IF EXISTS `courier_status_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courier_status_4` (
  `courier_id` int NOT NULL,
  `courier_destination_address` varchar(100) NOT NULL,
  `courier_weight` float NOT NULL,
  `delivery_center_id` int NOT NULL,
  PRIMARY KEY (`courier_id`),
  KEY `delivery_center_id` (`delivery_center_id`),
  CONSTRAINT `courier_status_4_ibfk_1` FOREIGN KEY (`courier_id`) REFERENCES `courier` (`courier_id`),
  CONSTRAINT `courier_status_4_ibfk_2` FOREIGN KEY (`delivery_center_id`) REFERENCES `delivery_center` (`center_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courier_status_4`
--

LOCK TABLES `courier_status_4` WRITE;
/*!40000 ALTER TABLE `courier_status_4` DISABLE KEYS */;
/*!40000 ALTER TABLE `courier_status_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courier_type`
--

DROP TABLE IF EXISTS `courier_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courier_type` (
  `courier_type_id` int NOT NULL AUTO_INCREMENT,
  `courier_type_name` varchar(20) NOT NULL,
  PRIMARY KEY (`courier_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courier_type`
--

LOCK TABLES `courier_type` WRITE;
/*!40000 ALTER TABLE `courier_type` DISABLE KEYS */;
INSERT INTO `courier_type` VALUES (1,'normal'),(2,'urgent');
/*!40000 ALTER TABLE `courier_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `delivery_id` int NOT NULL,
  `courier_id` int NOT NULL,
  `delivery_boy_id` int NOT NULL,
  `delivery_time` datetime NOT NULL,
  PRIMARY KEY (`delivery_id`),
  KEY `delivery_ibfk_1` (`courier_id`),
  KEY `delivery_ibfk_2` (`delivery_boy_id`),
  CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`courier_id`) REFERENCES `courier` (`courier_id`),
  CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`delivery_boy_id`) REFERENCES `delivery_boy` (`delivery_boy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_boy`
--

DROP TABLE IF EXISTS `delivery_boy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_boy` (
  `delivery_boy_id` int NOT NULL AUTO_INCREMENT,
  `delivery_boy_name` varchar(50) NOT NULL,
  `delivery_boy_email` varchar(50) NOT NULL,
  `delivery_boy_password` varchar(50) NOT NULL,
  `delivery_centre_id` int DEFAULT NULL,
  `delivery_boy_phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`delivery_boy_id`),
  UNIQUE KEY `delivery_boy_email` (`delivery_boy_email`),
  KEY `fk_delivery_centre` (`delivery_centre_id`),
  CONSTRAINT `fk_delivery_centre` FOREIGN KEY (`delivery_centre_id`) REFERENCES `delivery_center` (`center_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_boy`
--

LOCK TABLES `delivery_boy` WRITE;
/*!40000 ALTER TABLE `delivery_boy` DISABLE KEYS */;
INSERT INTO `delivery_boy` VALUES (1,'Sanjay Singh','sanjay.singh@example.com','password',1,'9234789763'),(2,'Neeraj Sharma','neeraj.sharma@example.com','password',2,'9145678934'),(3,'Rahul Gupta','rahul.gupta@example.com','password',3,'8989763546');
/*!40000 ALTER TABLE `delivery_boy` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delivery_boy_insert_trigger` AFTER INSERT ON `delivery_boy` FOR EACH ROW BEGIN
    UPDATE delivery_center SET delivery_boy_count = delivery_boy_count + 1 
    WHERE center_id = NEW.delivery_centre_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delivery_boy_logs_trigger` AFTER INSERT ON `delivery_boy` FOR EACH ROW BEGIN
    INSERT INTO delivery_boy_logs (
        delivery_boy_id,
        delivery_boy_name,
        delivery_boy_email,
        delivery_boy_password,
        delivery_centre_id,
        delivery_boy_phone,
        log_action
    ) VALUES (
        NEW.delivery_boy_id,
        NEW.delivery_boy_name,
        NEW.delivery_boy_email,
        NEW.delivery_boy_password,
        NEW.delivery_centre_id,
        NEW.delivery_boy_phone,
        'INSERT'
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_delivery_center_and_boys` AFTER INSERT ON `delivery_boy` FOR EACH ROW BEGIN
    UPDATE delivery_center_and_boys SET num_delivery_boys = (SELECT COUNT(*) FROM delivery_boy WHERE delivery_centre_id = NEW.delivery_centre_id), delivery_boys = (SELECT GROUP_CONCAT(delivery_boy_name SEPARATOR ', ') FROM delivery_boy WHERE delivery_centre_id = NEW.delivery_centre_id) WHERE center_id = NEW.delivery_centre_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delivery_boy_logs_afterupdate_trigger` AFTER UPDATE ON `delivery_boy` FOR EACH ROW BEGIN
    INSERT INTO delivery_boy_logs (
        delivery_boy_id,
        delivery_boy_name,
        delivery_boy_email,
        delivery_boy_password,
        delivery_centre_id,
        delivery_boy_phone,
        log_action
    ) VALUES (
        NEW.delivery_boy_id,
        NEW.delivery_boy_name,
        NEW.delivery_boy_email,
        NEW.delivery_boy_password,
        NEW.delivery_centre_id,
        NEW.delivery_boy_phone,
        'UPDATE'
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_delivery_center` AFTER UPDATE ON `delivery_boy` FOR EACH ROW BEGIN
    IF NEW.delivery_centre_id <> OLD.delivery_centre_id THEN
        UPDATE delivery_center SET center_name = NEW.delivery_boy_name WHERE center_id = NEW.delivery_centre_id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_delivery_center_and_boys_after_updation` AFTER UPDATE ON `delivery_boy` FOR EACH ROW BEGIN
    UPDATE delivery_center_and_boys SET 
        num_delivery_boys = (SELECT COUNT(*) FROM delivery_boy WHERE delivery_centre_id = NEW.delivery_centre_id), 
        delivery_boys = (SELECT GROUP_CONCAT(delivery_boy_name SEPARATOR ', ') FROM delivery_boy WHERE delivery_centre_id = NEW.delivery_centre_id) 
    WHERE center_id = NEW.delivery_centre_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delivery_boy_delete_trigger` AFTER DELETE ON `delivery_boy` FOR EACH ROW BEGIN
    UPDATE delivery_center SET delivery_boy_count = delivery_boy_count - 1 
    WHERE center_id = OLD.delivery_centre_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delivery_boy_logs_afterdelete_trigger` AFTER DELETE ON `delivery_boy` FOR EACH ROW BEGIN
    INSERT INTO delivery_boy_logs (
        delivery_boy_id,
        delivery_boy_name,
        delivery_boy_email,
        delivery_boy_password,
        delivery_centre_id,
        delivery_boy_phone,
        log_action
    ) VALUES (
        OLD.delivery_boy_id,
        OLD.delivery_boy_name,
        OLD.delivery_boy_email,
        OLD.delivery_boy_password,
        OLD.delivery_centre_id,
        OLD.delivery_boy_phone,
        'DELETE'
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_delivery_center_and_boys_after_deletion` AFTER DELETE ON `delivery_boy` FOR EACH ROW BEGIN
    UPDATE delivery_center_and_boys SET 
        num_delivery_boys = (SELECT COUNT(*) FROM delivery_boy WHERE delivery_centre_id = OLD.delivery_centre_id), 
        delivery_boys = (SELECT GROUP_CONCAT(delivery_boy_name SEPARATOR ', ') FROM delivery_boy WHERE delivery_centre_id = OLD.delivery_centre_id) 
    WHERE center_id = OLD.delivery_centre_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `delivery_boy_center_1_deliver`
--

DROP TABLE IF EXISTS `delivery_boy_center_1_deliver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_boy_center_1_deliver` (
  `courier_id` int NOT NULL,
  `courier_weight` float NOT NULL,
  `courier_destination_address` varchar(100) NOT NULL,
  `courier_type_id` int NOT NULL,
  `delivery_center_id` int NOT NULL,
  `user_phone` varchar(15) NOT NULL,
  KEY `courier_id` (`courier_id`),
  KEY `delivery_center_id` (`delivery_center_id`),
  KEY `courier_type_id` (`courier_type_id`),
  KEY `user_phone` (`user_phone`),
  CONSTRAINT `delivery_boy_center_1_deliver_ibfk_1` FOREIGN KEY (`courier_id`) REFERENCES `courier` (`courier_id`),
  CONSTRAINT `delivery_boy_center_1_deliver_ibfk_2` FOREIGN KEY (`delivery_center_id`) REFERENCES `delivery_center` (`center_id`),
  CONSTRAINT `delivery_boy_center_1_deliver_ibfk_3` FOREIGN KEY (`courier_type_id`) REFERENCES `courier_type` (`courier_type_id`),
  CONSTRAINT `delivery_boy_center_1_deliver_ibfk_4` FOREIGN KEY (`user_phone`) REFERENCES `user` (`user_phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_boy_center_1_deliver`
--

LOCK TABLES `delivery_boy_center_1_deliver` WRITE;
/*!40000 ALTER TABLE `delivery_boy_center_1_deliver` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_boy_center_1_deliver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_boy_center_1_pickup`
--

DROP TABLE IF EXISTS `delivery_boy_center_1_pickup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_boy_center_1_pickup` (
  `courier_id` int NOT NULL,
  `courier_weight` float NOT NULL,
  `courier_pickup_address` varchar(100) NOT NULL,
  `courier_type_id` int NOT NULL,
  `pickup_center_id` int NOT NULL,
  `user_phone` varchar(15) NOT NULL,
  KEY `courier_id` (`courier_id`),
  KEY `delivery_center_id` (`pickup_center_id`),
  KEY `courier_type_id` (`courier_type_id`),
  KEY `user_phone` (`user_phone`),
  CONSTRAINT `delivery_boy_center_1_pickup_ibfk_1` FOREIGN KEY (`courier_id`) REFERENCES `courier` (`courier_id`),
  CONSTRAINT `delivery_boy_center_1_pickup_ibfk_2` FOREIGN KEY (`pickup_center_id`) REFERENCES `delivery_center` (`center_id`),
  CONSTRAINT `delivery_boy_center_1_pickup_ibfk_3` FOREIGN KEY (`courier_type_id`) REFERENCES `courier_type` (`courier_type_id`),
  CONSTRAINT `delivery_boy_center_1_pickup_ibfk_4` FOREIGN KEY (`user_phone`) REFERENCES `user` (`user_phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_boy_center_1_pickup`
--

LOCK TABLES `delivery_boy_center_1_pickup` WRITE;
/*!40000 ALTER TABLE `delivery_boy_center_1_pickup` DISABLE KEYS */;
INSERT INTO `delivery_boy_center_1_pickup` VALUES (14,7,'bandra',2,1,'7653432333');
/*!40000 ALTER TABLE `delivery_boy_center_1_pickup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_boy_center_2_deliver`
--

DROP TABLE IF EXISTS `delivery_boy_center_2_deliver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_boy_center_2_deliver` (
  `courier_id` int NOT NULL,
  `courier_weight` float NOT NULL,
  `courier_destination_address` varchar(100) NOT NULL,
  `courier_type_id` int NOT NULL,
  `delivery_center_id` int NOT NULL,
  `user_phone` varchar(15) NOT NULL,
  KEY `courier_id` (`courier_id`),
  KEY `delivery_center_id` (`delivery_center_id`),
  KEY `courier_type_id` (`courier_type_id`),
  KEY `user_phone` (`user_phone`),
  CONSTRAINT `delivery_boy_center_2_deliver_ibfk_1` FOREIGN KEY (`courier_id`) REFERENCES `courier` (`courier_id`),
  CONSTRAINT `delivery_boy_center_2_deliver_ibfk_2` FOREIGN KEY (`delivery_center_id`) REFERENCES `delivery_center` (`center_id`),
  CONSTRAINT `delivery_boy_center_2_deliver_ibfk_3` FOREIGN KEY (`courier_type_id`) REFERENCES `courier_type` (`courier_type_id`),
  CONSTRAINT `delivery_boy_center_2_deliver_ibfk_4` FOREIGN KEY (`user_phone`) REFERENCES `user` (`user_phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_boy_center_2_deliver`
--

LOCK TABLES `delivery_boy_center_2_deliver` WRITE;
/*!40000 ALTER TABLE `delivery_boy_center_2_deliver` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_boy_center_2_deliver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_boy_center_2_pickup`
--

DROP TABLE IF EXISTS `delivery_boy_center_2_pickup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_boy_center_2_pickup` (
  `courier_id` int NOT NULL,
  `courier_weight` float NOT NULL,
  `courier_pickup_address` varchar(100) NOT NULL,
  `courier_type_id` int NOT NULL,
  `pickup_center_id` int NOT NULL,
  `user_phone` varchar(15) NOT NULL,
  KEY `courier_id` (`courier_id`),
  KEY `delivery_center_id` (`pickup_center_id`),
  KEY `courier_type_id` (`courier_type_id`),
  KEY `user_phone` (`user_phone`),
  CONSTRAINT `delivery_boy_center_2_pickup_ibfk_1` FOREIGN KEY (`courier_id`) REFERENCES `courier` (`courier_id`),
  CONSTRAINT `delivery_boy_center_2_pickup_ibfk_2` FOREIGN KEY (`pickup_center_id`) REFERENCES `delivery_center` (`center_id`),
  CONSTRAINT `delivery_boy_center_2_pickup_ibfk_3` FOREIGN KEY (`courier_type_id`) REFERENCES `courier_type` (`courier_type_id`),
  CONSTRAINT `delivery_boy_center_2_pickup_ibfk_4` FOREIGN KEY (`user_phone`) REFERENCES `user` (`user_phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_boy_center_2_pickup`
--

LOCK TABLES `delivery_boy_center_2_pickup` WRITE;
/*!40000 ALTER TABLE `delivery_boy_center_2_pickup` DISABLE KEYS */;
INSERT INTO `delivery_boy_center_2_pickup` VALUES (11,6,'hell',2,2,'7653432333'),(17,6.9,'south delhi',1,2,'7653111111'),(18,5.1,'south delhi',1,2,'7653434456');
/*!40000 ALTER TABLE `delivery_boy_center_2_pickup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_boy_center_3_deliver`
--

DROP TABLE IF EXISTS `delivery_boy_center_3_deliver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_boy_center_3_deliver` (
  `courier_id` int NOT NULL,
  `courier_weight` float NOT NULL,
  `courier_destination_address` varchar(100) NOT NULL,
  `courier_type_id` int NOT NULL,
  `delivery_center_id` int NOT NULL,
  `user_phone` varchar(15) NOT NULL,
  KEY `courier_id` (`courier_id`),
  KEY `delivery_center_id` (`delivery_center_id`),
  KEY `courier_type_id` (`courier_type_id`),
  KEY `user_phone` (`user_phone`),
  CONSTRAINT `delivery_boy_center_3_deliver_ibfk_1` FOREIGN KEY (`courier_id`) REFERENCES `courier` (`courier_id`),
  CONSTRAINT `delivery_boy_center_3_deliver_ibfk_2` FOREIGN KEY (`delivery_center_id`) REFERENCES `delivery_center` (`center_id`),
  CONSTRAINT `delivery_boy_center_3_deliver_ibfk_3` FOREIGN KEY (`courier_type_id`) REFERENCES `courier_type` (`courier_type_id`),
  CONSTRAINT `delivery_boy_center_3_deliver_ibfk_4` FOREIGN KEY (`user_phone`) REFERENCES `user` (`user_phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_boy_center_3_deliver`
--

LOCK TABLES `delivery_boy_center_3_deliver` WRITE;
/*!40000 ALTER TABLE `delivery_boy_center_3_deliver` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_boy_center_3_deliver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_boy_center_3_pickup`
--

DROP TABLE IF EXISTS `delivery_boy_center_3_pickup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_boy_center_3_pickup` (
  `courier_id` int NOT NULL,
  `courier_weight` float NOT NULL,
  `courier_pickup_address` varchar(100) NOT NULL,
  `courier_type_id` int NOT NULL,
  `pickup_center_id` int NOT NULL,
  `user_phone` varchar(15) NOT NULL,
  KEY `courier_id` (`courier_id`),
  KEY `delivery_center_id` (`pickup_center_id`),
  KEY `courier_type_id` (`courier_type_id`),
  KEY `user_phone` (`user_phone`),
  CONSTRAINT `delivery_boy_center_3_pickup_ibfk_1` FOREIGN KEY (`courier_id`) REFERENCES `courier` (`courier_id`),
  CONSTRAINT `delivery_boy_center_3_pickup_ibfk_2` FOREIGN KEY (`pickup_center_id`) REFERENCES `delivery_center` (`center_id`),
  CONSTRAINT `delivery_boy_center_3_pickup_ibfk_3` FOREIGN KEY (`courier_type_id`) REFERENCES `courier_type` (`courier_type_id`),
  CONSTRAINT `delivery_boy_center_3_pickup_ibfk_4` FOREIGN KEY (`user_phone`) REFERENCES `user` (`user_phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_boy_center_3_pickup`
--

LOCK TABLES `delivery_boy_center_3_pickup` WRITE;
/*!40000 ALTER TABLE `delivery_boy_center_3_pickup` DISABLE KEYS */;
INSERT INTO `delivery_boy_center_3_pickup` VALUES (13,6.2,'bandra',1,3,'7653432123');
/*!40000 ALTER TABLE `delivery_boy_center_3_pickup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_boy_logs`
--

DROP TABLE IF EXISTS `delivery_boy_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_boy_logs` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `delivery_boy_id` int DEFAULT NULL,
  `delivery_boy_name` varchar(50) DEFAULT NULL,
  `delivery_boy_email` varchar(50) DEFAULT NULL,
  `delivery_boy_password` varchar(50) DEFAULT NULL,
  `delivery_centre_id` int DEFAULT NULL,
  `delivery_boy_phone` varchar(20) DEFAULT NULL,
  `log_action` varchar(10) DEFAULT NULL,
  `log_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_boy_logs`
--

LOCK TABLES `delivery_boy_logs` WRITE;
/*!40000 ALTER TABLE `delivery_boy_logs` DISABLE KEYS */;
INSERT INTO `delivery_boy_logs` VALUES (1,1,'Sanjay Singh','sanjay.singh@example.com','password',1,'9234789763','INSERT','2023-05-07 06:47:03'),(2,2,'Neeraj Sharma','neeraj.sharma@example.com','password',2,'9145678934','INSERT','2023-05-07 06:47:03'),(3,3,'Rahul Gupta','rahul.gupta@example.com','password',3,'8989763546','INSERT','2023-05-07 06:47:03');
/*!40000 ALTER TABLE `delivery_boy_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_center`
--

DROP TABLE IF EXISTS `delivery_center`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_center` (
  `center_id` int NOT NULL,
  `center_name` varchar(50) NOT NULL,
  `center_address` varchar(100) NOT NULL,
  `center_city` varchar(50) NOT NULL,
  `center_state` varchar(50) NOT NULL,
  `center_country` varchar(50) NOT NULL,
  `delivery_boy_count` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`center_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_center`
--

LOCK TABLES `delivery_center` WRITE;
/*!40000 ALTER TABLE `delivery_center` DISABLE KEYS */;
INSERT INTO `delivery_center` VALUES (1,'Delhi Delivery Center','Sector 5, Rohini','Delhi','Delhi NCR','India',1),(2,'Mumbai Delivery Center','Andheri West','Mumbai','Maharashtra','India',1),(3,'Kolkata Delivery Center','Salt Lake City','Kolkata','West Bengal','India',1);
/*!40000 ALTER TABLE `delivery_center` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delivery_center_insert_trigger` AFTER INSERT ON `delivery_center` FOR EACH ROW BEGIN
    UPDATE delivery_boy SET delivery_centre_id = NEW.center_id 
    WHERE delivery_centre_id IS NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_delivery_center_and_boys_after_insert` AFTER INSERT ON `delivery_center` FOR EACH ROW BEGIN
  UPDATE delivery_center_and_boys SET num_delivery_boys = num_delivery_boys + 1 WHERE center_id = NEW.center_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_delivery_boy` AFTER UPDATE ON `delivery_center` FOR EACH ROW BEGIN
    IF NEW.center_id <> OLD.center_id THEN
        UPDATE delivery_boy SET delivery_boy_name = NEW.center_name WHERE delivery_centre_id = NEW.center_id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_delivery_center_and_boys_after_update` AFTER UPDATE ON `delivery_center` FOR EACH ROW BEGIN
  UPDATE delivery_center_and_boys SET center_name = NEW.center_name, center_address = NEW.center_address, center_city = NEW.center_city, center_state = NEW.center_state, center_country = NEW.center_country WHERE center_id = NEW.center_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delivery_center_delete_trigger` AFTER DELETE ON `delivery_center` FOR EACH ROW BEGIN
    UPDATE delivery_boy SET delivery_centre_id = NULL 
    WHERE delivery_centre_id = OLD.center_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_delivery_center_and_boys_after_delete` AFTER DELETE ON `delivery_center` FOR EACH ROW BEGIN
  UPDATE delivery_center_and_boys SET num_delivery_boys = num_delivery_boys - 1 WHERE center_id = OLD.center_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `delivery_center_1_pending`
--

DROP TABLE IF EXISTS `delivery_center_1_pending`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_center_1_pending` (
  `courier_id` int NOT NULL,
  `courier_weight` float NOT NULL,
  `delivery_center_id` int NOT NULL,
  `courier_weight_category` varchar(20) DEFAULT NULL,
  `courier_type_id` int NOT NULL,
  KEY `courier_id` (`courier_id`),
  KEY `delivery_center_id` (`delivery_center_id`),
  KEY `courier_type_id` (`courier_type_id`),
  CONSTRAINT `delivery_center_1_pending_ibfk_1` FOREIGN KEY (`courier_id`) REFERENCES `courier` (`courier_id`),
  CONSTRAINT `delivery_center_1_pending_ibfk_2` FOREIGN KEY (`delivery_center_id`) REFERENCES `delivery_center` (`center_id`),
  CONSTRAINT `delivery_center_1_pending_ibfk_3` FOREIGN KEY (`courier_type_id`) REFERENCES `courier_type` (`courier_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_center_1_pending`
--

LOCK TABLES `delivery_center_1_pending` WRITE;
/*!40000 ALTER TABLE `delivery_center_1_pending` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_center_1_pending` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_center_1_reached`
--

DROP TABLE IF EXISTS `delivery_center_1_reached`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_center_1_reached` (
  `courier_id` int NOT NULL,
  `courier_weight` float NOT NULL,
  `delivery_center_id` int NOT NULL,
  `courier_weight_category` varchar(20) DEFAULT NULL,
  `courier_type_id` int NOT NULL,
  KEY `courier_id` (`courier_id`),
  KEY `delivery_center_id` (`delivery_center_id`),
  KEY `courier_type_id` (`courier_type_id`),
  CONSTRAINT `delivery_center_1_reached_ibfk_1` FOREIGN KEY (`courier_id`) REFERENCES `courier` (`courier_id`),
  CONSTRAINT `delivery_center_1_reached_ibfk_2` FOREIGN KEY (`delivery_center_id`) REFERENCES `delivery_center` (`center_id`),
  CONSTRAINT `delivery_center_1_reached_ibfk_3` FOREIGN KEY (`courier_type_id`) REFERENCES `courier_type` (`courier_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_center_1_reached`
--

LOCK TABLES `delivery_center_1_reached` WRITE;
/*!40000 ALTER TABLE `delivery_center_1_reached` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_center_1_reached` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_center_2_pending`
--

DROP TABLE IF EXISTS `delivery_center_2_pending`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_center_2_pending` (
  `courier_id` int NOT NULL,
  `courier_weight` float NOT NULL,
  `delivery_center_id` int NOT NULL,
  `courier_weight_category` varchar(20) DEFAULT NULL,
  `courier_type_id` int NOT NULL,
  KEY `courier_id` (`courier_id`),
  KEY `delivery_center_id` (`delivery_center_id`),
  KEY `courier_type_id` (`courier_type_id`),
  CONSTRAINT `delivery_center_2_pending_ibfk_1` FOREIGN KEY (`courier_id`) REFERENCES `courier` (`courier_id`),
  CONSTRAINT `delivery_center_2_pending_ibfk_2` FOREIGN KEY (`delivery_center_id`) REFERENCES `delivery_center` (`center_id`),
  CONSTRAINT `delivery_center_2_pending_ibfk_3` FOREIGN KEY (`courier_type_id`) REFERENCES `courier_type` (`courier_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_center_2_pending`
--

LOCK TABLES `delivery_center_2_pending` WRITE;
/*!40000 ALTER TABLE `delivery_center_2_pending` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_center_2_pending` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_center_2_reached`
--

DROP TABLE IF EXISTS `delivery_center_2_reached`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_center_2_reached` (
  `courier_id` int NOT NULL,
  `courier_weight` float NOT NULL,
  `delivery_center_id` int NOT NULL,
  `courier_weight_category` varchar(20) DEFAULT NULL,
  `courier_type_id` int NOT NULL,
  KEY `courier_id` (`courier_id`),
  KEY `delivery_center_id` (`delivery_center_id`),
  KEY `courier_type_id` (`courier_type_id`),
  CONSTRAINT `delivery_center_2_reached_ibfk_1` FOREIGN KEY (`courier_id`) REFERENCES `courier` (`courier_id`),
  CONSTRAINT `delivery_center_2_reached_ibfk_2` FOREIGN KEY (`delivery_center_id`) REFERENCES `delivery_center` (`center_id`),
  CONSTRAINT `delivery_center_2_reached_ibfk_3` FOREIGN KEY (`courier_type_id`) REFERENCES `courier_type` (`courier_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_center_2_reached`
--

LOCK TABLES `delivery_center_2_reached` WRITE;
/*!40000 ALTER TABLE `delivery_center_2_reached` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_center_2_reached` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_center_3_pending`
--

DROP TABLE IF EXISTS `delivery_center_3_pending`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_center_3_pending` (
  `courier_id` int NOT NULL,
  `courier_weight` float NOT NULL,
  `delivery_center_id` int NOT NULL,
  `courier_weight_category` varchar(20) DEFAULT NULL,
  `courier_type_id` int NOT NULL,
  KEY `courier_id` (`courier_id`),
  KEY `delivery_center_id` (`delivery_center_id`),
  KEY `courier_type_id` (`courier_type_id`),
  CONSTRAINT `delivery_center_3_pending_ibfk_1` FOREIGN KEY (`courier_id`) REFERENCES `courier` (`courier_id`),
  CONSTRAINT `delivery_center_3_pending_ibfk_2` FOREIGN KEY (`delivery_center_id`) REFERENCES `delivery_center` (`center_id`),
  CONSTRAINT `delivery_center_3_pending_ibfk_3` FOREIGN KEY (`courier_type_id`) REFERENCES `courier_type` (`courier_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_center_3_pending`
--

LOCK TABLES `delivery_center_3_pending` WRITE;
/*!40000 ALTER TABLE `delivery_center_3_pending` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_center_3_pending` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_center_3_reached`
--

DROP TABLE IF EXISTS `delivery_center_3_reached`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_center_3_reached` (
  `courier_id` int NOT NULL,
  `courier_weight` float NOT NULL,
  `delivery_center_id` int NOT NULL,
  `courier_weight_category` varchar(20) DEFAULT NULL,
  `courier_type_id` int NOT NULL,
  KEY `courier_id` (`courier_id`),
  KEY `delivery_center_id` (`delivery_center_id`),
  KEY `courier_type_id` (`courier_type_id`),
  CONSTRAINT `delivery_center_3_reached_ibfk_1` FOREIGN KEY (`courier_id`) REFERENCES `courier` (`courier_id`),
  CONSTRAINT `delivery_center_3_reached_ibfk_2` FOREIGN KEY (`delivery_center_id`) REFERENCES `delivery_center` (`center_id`),
  CONSTRAINT `delivery_center_3_reached_ibfk_3` FOREIGN KEY (`courier_type_id`) REFERENCES `courier_type` (`courier_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_center_3_reached`
--

LOCK TABLES `delivery_center_3_reached` WRITE;
/*!40000 ALTER TABLE `delivery_center_3_reached` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_center_3_reached` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_center_and_boys`
--

DROP TABLE IF EXISTS `delivery_center_and_boys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_center_and_boys` (
  `center_id` int NOT NULL,
  `center_name` varchar(50) NOT NULL,
  `center_address` varchar(100) NOT NULL,
  `center_city` varchar(50) NOT NULL,
  `center_state` varchar(50) NOT NULL,
  `center_country` varchar(50) NOT NULL,
  `num_delivery_boys` int DEFAULT NULL,
  `delivery_boys` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`center_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_center_and_boys`
--

LOCK TABLES `delivery_center_and_boys` WRITE;
/*!40000 ALTER TABLE `delivery_center_and_boys` DISABLE KEYS */;
INSERT INTO `delivery_center_and_boys` VALUES (1,'Delhi Delivery Center','Sector 5, Rohini','Delhi','Delhi NCR','India',1,'Sanjay Singh'),(2,'Mumbai Delivery Center','Andheri West','Mumbai','Maharashtra','India',1,'Neeraj Sharma'),(3,'Kolkata Delivery Center','Salt Lake City','Kolkata','West Bengal','India',1,'Rahul Gupta');
/*!40000 ALTER TABLE `delivery_center_and_boys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `u_id` int DEFAULT NULL,
  KEY `u_id` (`u_id`),
  CONSTRAINT `login_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_order`
--

DROP TABLE IF EXISTS `my_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `my_order` (
  `courier_id` int NOT NULL,
  `user_id` int NOT NULL,
  `courier_status` varchar(50) DEFAULT NULL,
  `courier_weight` float DEFAULT NULL,
  `courier_pickup_address` varchar(100) DEFAULT NULL,
  `courier_destination_address` varchar(100) DEFAULT NULL,
  `courier_pickup_time` datetime DEFAULT NULL,
  `courier_delivery_time` datetime DEFAULT NULL,
  `courier_cost` float DEFAULT NULL,
  `courier_type_id` int DEFAULT NULL,
  PRIMARY KEY (`courier_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `my_order_ibfk_1` FOREIGN KEY (`courier_id`) REFERENCES `courier_log` (`courier_id`),
  CONSTRAINT `my_order_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_order`
--

LOCK TABLES `my_order` WRITE;
/*!40000 ALTER TABLE `my_order` DISABLE KEYS */;
INSERT INTO `my_order` VALUES (2,1,'Pending',4,'Vanaz metro','bandra','2023-05-07 12:40:39',NULL,NULL,2),(3,2,'Pending',6,'Vanaz metro','bandra','2023-05-07 12:44:43',NULL,NULL,2),(4,1,'Pending',7,'Vanaz metro','bandra','2023-05-07 12:46:59',NULL,NULL,1),(5,1,'Pending',3,'Vanaz metro','bandra','2023-05-07 12:51:51',NULL,NULL,1),(6,1,'Pending',3,'Vanaz metro','bandra','2023-05-07 12:59:19',NULL,200,1),(7,1,'Pending',4,'dhwedh','ewfwef','2023-05-09 19:19:59',NULL,200,1),(8,3,'Pending',7.6,'dhwedh','ewfwef','2023-05-09 19:26:48',NULL,600,2),(9,3,'Pending',7.6,'dhwedh','ewfwef','2023-05-09 19:27:57',NULL,600,2),(10,2,'Pending',9,'daaaa','jjjj','2023-05-09 19:28:29',NULL,400,1),(11,2,'Pending',6,'hell','heaven','2023-05-09 20:53:22',NULL,600,2),(13,1,'Pending',6.2,'bandra','eden garden','2023-05-16 06:15:06',NULL,400,1),(14,2,'Pending',7,'bandra','eden','2023-05-16 06:43:28',NULL,600,2),(17,4,'Pending',6.9,'south delhi','eden','2023-05-16 06:53:20',NULL,400,1),(18,3,'Pending',5.1,'south delhi','eden','2023-05-16 07:01:48',NULL,400,1);
/*!40000 ALTER TABLE `my_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revenue`
--

DROP TABLE IF EXISTS `revenue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revenue` (
  `revenue` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revenue`
--

LOCK TABLES `revenue` WRITE;
/*!40000 ALTER TABLE `revenue` DISABLE KEYS */;
INSERT INTO `revenue` VALUES ('4400');
/*!40000 ALTER TABLE `revenue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracking`
--

DROP TABLE IF EXISTS `tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tracking` (
  `tracking_id` int NOT NULL,
  `courier_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tracking_id`),
  KEY `courier_status` (`courier_status`),
  CONSTRAINT `tracking_ibfk_1` FOREIGN KEY (`tracking_id`) REFERENCES `courier` (`courier_id`),
  CONSTRAINT `tracking_ibfk_2` FOREIGN KEY (`courier_status`) REFERENCES `courier_status` (`status_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracking`
--

LOCK TABLES `tracking` WRITE;
/*!40000 ALTER TABLE `tracking` DISABLE KEYS */;
INSERT INTO `tracking` VALUES (2,'Pending'),(3,'Pending'),(4,'Pending'),(5,'Pending'),(6,'Pending'),(7,'Pending'),(8,'Pending'),(9,'Pending'),(10,'Pending'),(11,'Pending'),(13,'Pending'),(14,'Pending'),(17,'Pending'),(18,'Pending');
/*!40000 ALTER TABLE `tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_phone` varchar(15) NOT NULL,
  `address` varchar(255) NOT NULL,
  `state` varchar(50) NOT NULL,
  `pincode` varchar(10) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_email` (`user_email`),
  UNIQUE KEY `unique_user_phone` (`user_phone`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'haritashva3110@gmail.com','Haritashva Shrivastava','ab','7653432123','vanaz','maharashta','411038'),(2,'Anish','anish123@gmail.com','abc','7653432333','vanaz','maharashta','411038'),(3,'pranjal','pranjal123@gmail.com','abcd','7653434456','vanaz','maharashta','411038'),(4,'vinit','vinit@gmail.com','1234','7653111111','vanaz','maharashta','411038'),(5,'shlok','shlok@gmail.com','hello@123','8787651111','vanaz','maharashta','411038'),(6,'kunal raut','kunal@gmail.com','kunal@123','8554443221','vanaz','maharashta','411038'),(7,'Deepankar','deepankar@gmail.com','deepankar@123','8554443222','vanaz','maharashta','411038'),(8,'Shivanshi','shivanshi@gmail.com','shivanshi@123','8554443111','vanaz','maharashta','411038');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_personal_info`
--

DROP TABLE IF EXISTS `user_personal_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_personal_info` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_phone` varchar(15) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `user_status_id` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`),
  KEY `fk_user_personal_info_user_status` (`user_status_id`),
  CONSTRAINT `fk_user_personal_info` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_user_personal_info_user_status` FOREIGN KEY (`user_status_id`) REFERENCES `user_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_personal_info`
--

LOCK TABLES `user_personal_info` WRITE;
/*!40000 ALTER TABLE `user_personal_info` DISABLE KEYS */;
INSERT INTO `user_personal_info` VALUES (1,'haritashva3110@gmail.com','Haritashva Shrivastava','ab','7653432123','vanaz','maharashta','411038',1),(2,'Anish','anish123@gmail.com','abc','7653432333','vanaz','maharashta','411038',1),(3,'pranjal','pranjal123@gmail.com','abcd','7653434456','vanaz','maharashta','411038',1),(4,'vinit','vinit@gmail.com','1234','7653111111','vanaz','maharashta','411038',1),(5,'shlok','shlok@gmail.com','hello@123','8787651111','vanaz','maharashta','411038',1),(6,'kunal raut','kunal@gmail.com','kunal@123','8554443221','vanaz','maharashta','411038',1),(7,'Deepankar','deepankar@gmail.com','deepankar@123','8554443222','vanaz','maharashta','411038',1),(8,'Shivanshi','shivanshi@gmail.com','shivanshi@123','8554443111','vanaz','maharashta','411038',1);
/*!40000 ALTER TABLE `user_personal_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_status`
--

DROP TABLE IF EXISTS `user_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_status` (
  `status_id` int NOT NULL,
  `status_name` varchar(10) NOT NULL,
  `amount_spent` int NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_status`
--

LOCK TABLES `user_status` WRITE;
/*!40000 ALTER TABLE `user_status` DISABLE KEYS */;
INSERT INTO `user_status` VALUES (1,'General',0),(2,'Silver',5000),(3,'Gold',15000),(4,'Platinum',30000);
/*!40000 ALTER TABLE `user_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_summary`
--

DROP TABLE IF EXISTS `user_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_summary` (
  `user_id` int NOT NULL,
  `total_money_spent` decimal(10,2) DEFAULT NULL,
  `total_courier_shipped` int DEFAULT NULL,
  `user_status` int NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `user_summary_ibfk_2` (`user_status`),
  CONSTRAINT `user_summary_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_summary_ibfk_2` FOREIGN KEY (`user_status`) REFERENCES `user_status` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_summary`
--

LOCK TABLES `user_summary` WRITE;
/*!40000 ALTER TABLE `user_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_summary` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_user_status` AFTER UPDATE ON `user_summary` FOR EACH ROW BEGIN
    UPDATE user_personal_info
    SET user_status_id = 
        (CASE
            WHEN NEW.total_money_spent >= (SELECT amount_spent FROM user_status WHERE status_id = 4) THEN 4
            WHEN NEW.total_money_spent >= (SELECT amount_spent FROM user_status WHERE status_id = 3) THEN 3
            WHEN NEW.total_money_spent >= (SELECT amount_spent FROM user_status WHERE status_id = 2) THEN 2
            ELSE 1
        END)
    WHERE user_id = NEW.user_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-06 11:31:32

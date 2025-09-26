-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce_analytics
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `customer_behavior`
--

DROP TABLE IF EXISTS `customer_behavior`;
/*!50001 DROP VIEW IF EXISTS `customer_behavior`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_behavior` AS SELECT 
 1 AS `customer_id`,
 1 AS `name`,
 1 AS `country`,
 1 AS `signup_date`,
 1 AS `Total_Orders`,
 1 AS `Lifetime_Value`,
 1 AS `Days_As_Customer`,
 1 AS `Customer_Type`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `signup_date` date NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`),
  KEY `idx_customer_signup` (`signup_date`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'John Smith','john.smith@email.com','2023-01-15','New York','USA'),(2,'Maria Garcia','maria.garcia@email.com','2023-02-20','Madrid','Spain'),(3,'David Johnson','david.johnson@email.com','2023-01-22','London','UK'),(4,'Sarah Chen','sarah.chen@email.com','2023-03-10','Beijing','China'),(5,'Mike Wilson','mike.wilson@email.com','2023-02-05','Sydney','Australia'),(6,'Emma Davis','emma.davis@email.com','2023-03-25','Toronto','Canada'),(7,'James Brown','james.brown@email.com','2023-01-30','Paris','France'),(8,'Lisa Taylor','lisa.taylor@email.com','2023-04-01','Berlin','Germany'),(9,'Robert Lee','robert.lee@email.com','2023-03-15','Tokyo','Japan'),(10,'Anna Martinez','anna.martinez@email.com','2023-02-28','Mexico City','Mexico'),(11,'Michael Clark','michael.clark@email.com','2023-04-10','Chicago','USA'),(12,'Sophia Rodriguez','sophia.rodriguez@email.com','2023-04-15','Barcelona','Spain'),(13,'William Anderson','william.anderson@email.com','2023-03-20','Manchester','UK'),(14,'Olivia Wang','olivia.wang@email.com','2023-04-05','Shanghai','China'),(15,'Daniel Kim','daniel.kim@email.com','2023-04-12','Seoul','South Korea');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `daily_sales_summary`
--

DROP TABLE IF EXISTS `daily_sales_summary`;
/*!50001 DROP VIEW IF EXISTS `daily_sales_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `daily_sales_summary` AS SELECT 
 1 AS `Sale_Date`,
 1 AS `Orders_Count`,
 1 AS `Daily_Revenue`,
 1 AS `Avg_Order_Value`,
 1 AS `Unique_Customers`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `idx_order_items_order` (`order_id`),
  KEY `idx_order_items_product` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `order_items_chk_1` CHECK ((`quantity` > 0)),
  CONSTRAINT `order_items_chk_2` CHECK ((`unit_price` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,1,1,999.99),(2,2,2,1,1199.99),(3,3,3,1,129.99),(4,4,6,1,349.99),(5,5,8,1,599.99),(6,6,5,1,179.99),(7,7,1,1,999.99),(8,8,7,1,79.99),(9,9,10,1,399.99),(10,10,2,1,1199.99),(11,11,9,1,59.99),(12,12,4,1,849.99),(13,13,3,1,129.99),(14,14,6,1,349.99),(15,15,8,1,599.99),(16,16,11,1,249.99),(17,17,12,2,34.99),(18,18,13,1,449.99),(19,19,14,1,89.99),(20,20,2,1,1199.99);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `order_date` datetime NOT NULL,
  `status` enum('pending','completed','cancelled') DEFAULT 'pending',
  `total_amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `idx_order_date` (`order_date`),
  KEY `idx_order_status` (`status`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE,
  CONSTRAINT `orders_chk_1` CHECK ((`total_amount` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2023-03-01 10:30:00','completed',999.99),(2,2,'2023-03-02 14:22:00','completed',1199.99),(3,3,'2023-03-05 09:15:00','completed',129.99),(4,1,'2023-03-10 16:45:00','completed',349.99),(5,4,'2023-03-15 11:20:00','completed',599.99),(6,5,'2023-04-02 13:10:00','completed',179.99),(7,6,'2023-04-05 15:30:00','completed',999.99),(8,7,'2023-04-10 10:00:00','completed',79.99),(9,8,'2023-04-12 14:45:00','completed',399.99),(10,9,'2023-04-18 09:30:00','completed',1199.99),(11,10,'2023-04-20 16:20:00','completed',59.99),(12,2,'2023-05-01 11:15:00','completed',849.99),(13,3,'2023-05-03 14:00:00','completed',129.99),(14,5,'2023-05-05 10:45:00','completed',349.99),(15,7,'2023-05-08 13:30:00','completed',599.99),(16,11,'2023-05-10 09:00:00','completed',249.99),(17,12,'2023-05-12 14:30:00','completed',34.99),(18,13,'2023-05-15 11:45:00','completed',449.99),(19,14,'2023-05-18 16:20:00','completed',89.99),(20,15,'2023-05-20 10:15:00','completed',1199.99);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `category` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `created_date` date NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `idx_product_category` (`category`),
  CONSTRAINT `products_chk_1` CHECK ((`price` > 0)),
  CONSTRAINT `products_chk_2` CHECK ((`cost` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'iPhone 14 Pro','Electronics',999.99,700.00,'2023-01-01'),(2,'MacBook Air M2','Electronics',1199.99,850.00,'2023-01-01'),(3,'Nike Air Max','Clothing',129.99,65.00,'2023-01-15'),(4,'Samsung Galaxy S23','Electronics',849.99,600.00,'2023-02-01'),(5,'Adidas Ultraboost','Clothing',179.99,90.00,'2023-01-20'),(6,'Sony WH-1000XM4','Electronics',349.99,220.00,'2023-02-15'),(7,'Levi\'s Jeans','Clothing',79.99,35.00,'2023-01-10'),(8,'iPad Air','Electronics',599.99,400.00,'2023-03-01'),(9,'Under Armour Hoodie','Clothing',59.99,25.00,'2023-02-20'),(10,'Apple Watch Series 8','Electronics',399.99,280.00,'2023-01-05'),(11,'AirPods Pro','Electronics',249.99,150.00,'2023-02-10'),(12,'Nike Dri-FIT Shirt','Clothing',34.99,15.00,'2023-03-15'),(13,'Samsung Tablet','Electronics',449.99,300.00,'2023-03-20'),(14,'Puma Running Shoes','Clothing',89.99,45.00,'2023-04-01');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `customer_behavior`
--

/*!50001 DROP VIEW IF EXISTS `customer_behavior`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_behavior` AS select `c`.`customer_id` AS `customer_id`,`c`.`name` AS `name`,`c`.`country` AS `country`,`c`.`signup_date` AS `signup_date`,count(distinct `o`.`order_id`) AS `Total_Orders`,sum((`oi`.`quantity` * `oi`.`unit_price`)) AS `Lifetime_Value`,(to_days(max(`o`.`order_date`)) - to_days(`c`.`signup_date`)) AS `Days_As_Customer`,(case when (count(distinct `o`.`order_id`) > 1) then 'Repeat' else 'One-time' end) AS `Customer_Type` from ((`customers` `c` left join `orders` `o` on(((`c`.`customer_id` = `o`.`customer_id`) and (`o`.`status` = 'completed')))) left join `order_items` `oi` on((`o`.`order_id` = `oi`.`order_id`))) group by `c`.`customer_id`,`c`.`name`,`c`.`country`,`c`.`signup_date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `daily_sales_summary`
--

/*!50001 DROP VIEW IF EXISTS `daily_sales_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `daily_sales_summary` AS select cast(`orders`.`order_date` as date) AS `Sale_Date`,count(distinct `orders`.`order_id`) AS `Orders_Count`,sum(`orders`.`total_amount`) AS `Daily_Revenue`,avg(`orders`.`total_amount`) AS `Avg_Order_Value`,count(distinct `orders`.`customer_id`) AS `Unique_Customers` from `orders` where (`orders`.`status` = 'completed') group by cast(`orders`.`order_date` as date) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-26 12:06:30

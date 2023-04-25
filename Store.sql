-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: Store
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `Listings`
--

DROP TABLE IF EXISTS `Listings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Listings` (
  `listing_id` int NOT NULL AUTO_INCREMENT,
  `fk_seller` varchar(20) NOT NULL,
  `title` varchar(30) NOT NULL,
  `description` varchar(250) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `listing_condition` varchar(20) NOT NULL,
  `image` blob,
  `category` varchar(20) NOT NULL,
  PRIMARY KEY (`listing_id`),
  KEY `fk_seller_listing` (`fk_seller`),
  CONSTRAINT `fk_seller_listing` FOREIGN KEY (`fk_seller`) REFERENCES `Users` (`user_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `check_category` CHECK ((`category` in (_utf8mb4'Apparel',_utf8mb4'Appliances',_utf8mb4'Electronics',_utf8mb4'Outdoor',_utf8mb4'Home Goods',_utf8mb4'Hobbies',_utf8mb4'Toys',_utf8mb4'Other'))),
  CONSTRAINT `check_condition` CHECK ((`listing_condition` in (_utf8mb4'New',_utf8mb4'Used-Poor',_utf8mb4'Used-Good',_utf8mb4'Used-Excellent',_utf8mb4'Refurbished'))),
  CONSTRAINT `check_price` CHECK ((`price` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Listings`
--

LOCK TABLES `Listings` WRITE;
/*!40000 ALTER TABLE `Listings` DISABLE KEYS */;
INSERT INTO `Listings` VALUES (3,'a','1','1',1.00,'new',NULL,'toys'),(4,'b','b','b',4.00,'used-excellent',NULL,'other'),(5,'a','asdfg','asdfg',23.00,'refurbished',NULL,'toys'),(6,'kate','car','d',3.00,'new',NULL,'toys');
/*!40000 ALTER TABLE `Listings` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trigger_category` BEFORE INSERT ON `Listings` FOR EACH ROW BEGIN
	IF LOWER(NEW.category) NOT REGEXP '^(apparel|appliances|electronics|outdoor|home goods|hobbies|toys|other)$' THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'These are the following categories: apparel, appliances, electronics, outdoor, home goods, hobbies, toys, other.';
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trigger_listing_condition` BEFORE INSERT ON `Listings` FOR EACH ROW BEGIN
	IF (NEW.listing_condition REGEXP'(new|used-poor|used-good|used-excellent|refurbished)') = 0
    THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The condition of your item must be: new, used-poor, used-good, used-excellent, refurbished';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Test`
--

DROP TABLE IF EXISTS `Test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Test` (
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Test`
--

LOCK TABLES `Test` WRITE;
/*!40000 ALTER TABLE `Test` DISABLE KEYS */;
INSERT INTO `Test` VALUES ('alara'),('tamer');
/*!40000 ALTER TABLE `Test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transactions`
--

DROP TABLE IF EXISTS `Transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Transactions` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `seller` varchar(20) NOT NULL,
  `buyer` varchar(20) NOT NULL,
  `item_name` varchar(30) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `listing_id` int NOT NULL,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transactions`
--

LOCK TABLES `Transactions` WRITE;
/*!40000 ALTER TABLE `Transactions` DISABLE KEYS */;
INSERT INTO `Transactions` VALUES (5,'bob','kate','wheel',3.00,7);
/*!40000 ALTER TABLE `Transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trigger_seller_username` BEFORE INSERT ON `Transactions` FOR EACH ROW BEGIN
	if new.seller not in (
        select user_name
        FROM Users)
    THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT="That seller doesn't exist.";
    end if;
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trigger_buyer_username` BEFORE INSERT ON `Transactions` FOR EACH ROW BEGIN
	if new.buyer not in (
        select user_name
        FROM Users)
    THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT="That buyer doesn't exist.";
    end if;
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trigger_item_name` BEFORE INSERT ON `Transactions` FOR EACH ROW BEGIN
	if new.item_name not in (
        select title
    	FROM Listings
    	WHERE new.seller = fk_seller)
    THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='That item is not sold by the seller';
    end if;
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trigger_delete_item` AFTER INSERT ON `Transactions` FOR EACH ROW BEGIN
	DELETE FROM Listings
    where new.listing_id = listing_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `user_name` varchar(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `address` varchar(30) NOT NULL,
  `city` varchar(25) NOT NULL,
  `state` varchar(2) NOT NULL,
  `zip_code` char(5) NOT NULL,
  `seller_rating` decimal(2,1) DEFAULT NULL,
  `is_active` bit(1) DEFAULT b'1',
  `passwrd` varchar(20) NOT NULL,
  PRIMARY KEY (`user_name`),
  CONSTRAINT `check_passwrd` CHECK ((regexp_like(cast(`passwrd` as char charset binary),cast(_utf8mb4'(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!,@,#,$,%,^,&,*,-,_])' as char charset binary)) and (length(`passwrd`) > 7))),
  CONSTRAINT `check_state` CHECK ((length(`state`) = 2)),
  CONSTRAINT `check_us_state` CHECK (regexp_like(`state`,_utf8mb4'(AL|AK|AZ|AR|CA|CO|CT|DE|FL|GA|HI|ID|IL|IN|IA|KS|KY|LA|ME|MD|MA|MI|MN|MS|MO|MT|NE|NV|NH|NJ|NM|NY|NC|ND|OH|OK|OR|PA|RI|SC|SD|TN|TX|UT|VT|VA|WA|WV|WI|WY)')),
  CONSTRAINT `check_zip` CHECK ((length(`zip_code`) = 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES ('a','a','a','a','a','ny','11111',NULL,_binary '','ASDFASDFasdfsd%33'),('b','b','b','b','b','AZ','12345',NULL,_binary '','lksdjfA%j1'),('bob','bob','lskjdf','lskjf','lksjdf','ny','11111',NULL,_binary '','ASDFSDF$sdf5'),('jim','jim','lskjdf','lskjf','lksjdf','ny','11111',NULL,_binary '','ASDFSDF$sdf5'),('kate','sdfsdf','sf','sfd','sdf','az','22222',NULL,_binary '','sdfsdfSDFSD%6');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_Listings`
--

DROP TABLE IF EXISTS `view_Listings`;
/*!50001 DROP VIEW IF EXISTS `view_Listings`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_Listings` AS SELECT 
 1 AS `listing_id`,
 1 AS `fk_seller`,
 1 AS `title`,
 1 AS `description`,
 1 AS `price`,
 1 AS `listing_condition`,
 1 AS `image`,
 1 AS `category`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_Transactions`
--

DROP TABLE IF EXISTS `view_Transactions`;
/*!50001 DROP VIEW IF EXISTS `view_Transactions`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_Transactions` AS SELECT 
 1 AS `transaction_id`,
 1 AS `seller`,
 1 AS `buyer`,
 1 AS `item_name`,
 1 AS `price`,
 1 AS `listing_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_Users`
--

DROP TABLE IF EXISTS `view_Users`;
/*!50001 DROP VIEW IF EXISTS `view_Users`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_Users` AS SELECT 
 1 AS `user_name`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `address`,
 1 AS `city`,
 1 AS `state`,
 1 AS `zip_code`,
 1 AS `seller_rating`,
 1 AS `is_active`,
 1 AS `passwrd`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_Listings`
--

/*!50001 DROP VIEW IF EXISTS `view_Listings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_Listings` AS select `Listings`.`listing_id` AS `listing_id`,`Listings`.`fk_seller` AS `fk_seller`,`Listings`.`title` AS `title`,`Listings`.`description` AS `description`,`Listings`.`price` AS `price`,`Listings`.`listing_condition` AS `listing_condition`,`Listings`.`image` AS `image`,`Listings`.`category` AS `category` from `Listings` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_Transactions`
--

/*!50001 DROP VIEW IF EXISTS `view_Transactions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_Transactions` AS select `Transactions`.`transaction_id` AS `transaction_id`,`Transactions`.`seller` AS `seller`,`Transactions`.`buyer` AS `buyer`,`Transactions`.`item_name` AS `item_name`,`Transactions`.`price` AS `price`,`Transactions`.`listing_id` AS `listing_id` from `Transactions` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_Users`
--

/*!50001 DROP VIEW IF EXISTS `view_Users`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_Users` AS select `Users`.`user_name` AS `user_name`,`Users`.`first_name` AS `first_name`,`Users`.`last_name` AS `last_name`,`Users`.`address` AS `address`,`Users`.`city` AS `city`,`Users`.`state` AS `state`,`Users`.`zip_code` AS `zip_code`,`Users`.`seller_rating` AS `seller_rating`,`Users`.`is_active` AS `is_active`,`Users`.`passwrd` AS `passwrd` from `Users` */;
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

-- Dump completed on 2023-04-25 16:00:08

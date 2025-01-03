-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `author_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`author_id`),
  CONSTRAINT `author_check` CHECK (`first_name` is not null or `last_name` is not null)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `book_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `publication_date` date NOT NULL,
  PRIMARY KEY (`book_id`),
  KEY `book_title_IDX` (`title`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_item`
--

DROP TABLE IF EXISTS `book_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_item` (
  `book_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `book_id` bigint(20) NOT NULL,
  PRIMARY KEY (`book_item_id`),
  KEY `book_item_book_FK` (`book_id`),
  CONSTRAINT `book_item_book_FK` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_item`
--

LOCK TABLES `book_item` WRITE;
/*!40000 ALTER TABLE `book_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_review`
--

DROP TABLE IF EXISTS `book_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_review` (
  `book_review_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `book_id` bigint(20) NOT NULL,
  `member_id` bigint(20) NOT NULL,
  `review_text` text DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `review_date` date NOT NULL,
  PRIMARY KEY (`book_review_id`),
  KEY `book_review_book_FK` (`book_id`),
  KEY `book_review_member_FK` (`member_id`),
  CONSTRAINT `book_review_book_FK` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`),
  CONSTRAINT `book_review_member_FK` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`),
  CONSTRAINT `book_review_check` CHECK (`rating` between 1 and 5)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_review`
--

LOCK TABLES `book_review` WRITE;
/*!40000 ALTER TABLE `book_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowed`
--

DROP TABLE IF EXISTS `borrowed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrowed` (
  `borrowed_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `book_item_id` bigint(20) NOT NULL,
  `member_id` bigint(20) NOT NULL,
  `staff_id` bigint(20) NOT NULL,
  `date_borrowed` datetime NOT NULL,
  `date_return` datetime DEFAULT NULL,
  PRIMARY KEY (`borrowed_id`),
  KEY `borrowed_book_item_FK` (`book_item_id`),
  KEY `borrowed_member_FK` (`member_id`),
  KEY `borrowed_staff_FK` (`staff_id`),
  KEY `borrowed_date_borrowed_IDX` (`date_borrowed`) USING BTREE,
  CONSTRAINT `borrowed_book_item_FK` FOREIGN KEY (`book_item_id`) REFERENCES `book_item` (`book_item_id`),
  CONSTRAINT `borrowed_member_FK` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`),
  CONSTRAINT `borrowed_staff_FK` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowed`
--

LOCK TABLES `borrowed` WRITE;
/*!40000 ALTER TABLE `borrowed` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrowed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_unique` (`category_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fine`
--

DROP TABLE IF EXISTS `fine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fine` (
  `fine_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) NOT NULL,
  `date_issued` date NOT NULL,
  `date_due` date NOT NULL,
  `fine_status_id` bigint(20) NOT NULL,
  `member_id` bigint(20) NOT NULL,
  `fine_details` text DEFAULT NULL,
  PRIMARY KEY (`fine_id`),
  KEY `fine_fine_status_FK` (`fine_status_id`),
  KEY `fine_member_FK` (`member_id`),
  CONSTRAINT `fine_fine_status_FK` FOREIGN KEY (`fine_status_id`) REFERENCES `fine_status` (`fine_status_id`),
  CONSTRAINT `fine_member_FK` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fine`
--

LOCK TABLES `fine` WRITE;
/*!40000 ALTER TABLE `fine` DISABLE KEYS */;
/*!40000 ALTER TABLE `fine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fine_borrowed`
--

DROP TABLE IF EXISTS `fine_borrowed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fine_borrowed` (
  `fine_borrowed_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fine_id` bigint(20) NOT NULL,
  `borrowed_id` bigint(20) NOT NULL,
  PRIMARY KEY (`fine_borrowed_id`),
  UNIQUE KEY `fine_borrowed_unique` (`fine_id`),
  KEY `fine_fine_fine_FK_1` (`borrowed_id`) USING BTREE,
  CONSTRAINT `fine_borrowed_borrowed_FK` FOREIGN KEY (`borrowed_id`) REFERENCES `borrowed` (`borrowed_id`),
  CONSTRAINT `fine_borrowed_fine_FK` FOREIGN KEY (`fine_id`) REFERENCES `fine` (`fine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fine_borrowed`
--

LOCK TABLES `fine_borrowed` WRITE;
/*!40000 ALTER TABLE `fine_borrowed` DISABLE KEYS */;
/*!40000 ALTER TABLE `fine_borrowed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fine_fine`
--

DROP TABLE IF EXISTS `fine_fine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fine_fine` (
  `fine_fine_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fine_id` bigint(20) NOT NULL,
  `parent_fine_id` bigint(20) NOT NULL,
  PRIMARY KEY (`fine_fine_id`),
  UNIQUE KEY `fine_fine_unique` (`fine_id`),
  KEY `fine_fine_fine_FK_1` (`parent_fine_id`),
  CONSTRAINT `fine_fine_fine_FK` FOREIGN KEY (`fine_id`) REFERENCES `fine` (`fine_id`),
  CONSTRAINT `fine_fine_fine_FK_1` FOREIGN KEY (`parent_fine_id`) REFERENCES `fine` (`fine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fine_fine`
--

LOCK TABLES `fine_fine` WRITE;
/*!40000 ALTER TABLE `fine_fine` DISABLE KEYS */;
/*!40000 ALTER TABLE `fine_fine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fine_status`
--

DROP TABLE IF EXISTS `fine_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fine_status` (
  `fine_status_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fine_status_name` varchar(255) NOT NULL,
  PRIMARY KEY (`fine_status_id`),
  UNIQUE KEY `fine_status_unique` (`fine_status_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fine_status`
--

LOCK TABLES `fine_status` WRITE;
/*!40000 ALTER TABLE `fine_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `fine_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `member_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `joined_date` date NOT NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `member_unique` (`username`),
  KEY `member_last_name_IDX` (`last_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_book_author`
--

DROP TABLE IF EXISTS `rel_book_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rel_book_author` (
  `rel_book_author` bigint(20) NOT NULL AUTO_INCREMENT,
  `book_id` bigint(20) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  PRIMARY KEY (`rel_book_author`),
  KEY `rel_book_author_book_FK` (`book_id`),
  KEY `rel_book_author_author_FK` (`author_id`),
  CONSTRAINT `rel_book_author_author_FK` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`),
  CONSTRAINT `rel_book_author_book_FK` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_book_author`
--

LOCK TABLES `rel_book_author` WRITE;
/*!40000 ALTER TABLE `rel_book_author` DISABLE KEYS */;
/*!40000 ALTER TABLE `rel_book_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_book_category`
--

DROP TABLE IF EXISTS `rel_book_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rel_book_category` (
  `rel_book_category_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `book_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  PRIMARY KEY (`rel_book_category_id`),
  KEY `rel_book_category_book_id_IDX` (`book_id`) USING BTREE,
  KEY `rel_book_category_category_id_IDX` (`category_id`) USING BTREE,
  CONSTRAINT `rel_book_category_book_FK` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`),
  CONSTRAINT `rel_book_category_category_FK` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_book_category`
--

LOCK TABLES `rel_book_category` WRITE;
/*!40000 ALTER TABLE `rel_book_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `rel_book_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reservation_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NOT NULL,
  `book_item_id` bigint(20) NOT NULL,
  `reservation_date` date NOT NULL,
  `reservation_status_id` bigint(20) NOT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `reservation_member_FK` (`member_id`),
  KEY `reservation_book_item_FK` (`book_item_id`),
  KEY `reservation_reservation_status_FK` (`reservation_status_id`),
  CONSTRAINT `reservation_book_item_FK` FOREIGN KEY (`book_item_id`) REFERENCES `book_item` (`book_item_id`),
  CONSTRAINT `reservation_member_FK` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`),
  CONSTRAINT `reservation_reservation_status_FK` FOREIGN KEY (`reservation_status_id`) REFERENCES `reservation_status` (`reservation_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_status`
--

DROP TABLE IF EXISTS `reservation_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_status` (
  `reservation_status_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `reservation_status_name` varchar(255) NOT NULL,
  PRIMARY KEY (`reservation_status_id`),
  UNIQUE KEY `reservation_status_unique` (`reservation_status_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_status`
--

LOCK TABLES `reservation_status` WRITE;
/*!40000 ALTER TABLE `reservation_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `date_hired` date DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `staff_unique` (`username`),
  KEY `staff_last_name_IDX` (`last_name`) USING BTREE,
  KEY `staff_role_IDX` (`role`) USING BTREE,
  KEY `staff_date_hired_IDX` (`date_hired`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'library'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-03 14:58:17

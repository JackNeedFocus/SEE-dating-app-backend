-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: newschema
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `date`
--

DROP TABLE IF EXISTS `date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `date` (
  `_uid` char(36) NOT NULL,
  `from_id` char(36) NOT NULL,
  `to_id` char(36) NOT NULL,
  `date` datetime NOT NULL,
  `location` varchar(45) NOT NULL,
  `mask_requirement` int unsigned NOT NULL,
  `state` int unsigned NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`_uid`),
  KEY `fk_date_id_1_idx` (`from_id`),
  KEY `fk_date_id_2_idx` (`to_id`),
  CONSTRAINT `fk_date_id_1` FOREIGN KEY (`from_id`) REFERENCES `users` (`_uid`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_date_id_2` FOREIGN KEY (`to_id`) REFERENCES `users` (`_uid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date`
--

LOCK TABLES `date` WRITE;
/*!40000 ALTER TABLE `date` DISABLE KEYS */;
/*!40000 ALTER TABLE `date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_dislikes`
--

DROP TABLE IF EXISTS `my_dislikes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `my_dislikes` (
  `_uid` char(36) NOT NULL,
  `from_id` char(36) NOT NULL,
  `to_id` char(36) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`_uid`),
  KEY `fk_dislike_id_1_idx` (`from_id`),
  KEY `fk_dislike_id_2_idx` (`to_id`),
  CONSTRAINT `fk_dislike_id_1` FOREIGN KEY (`from_id`) REFERENCES `users` (`_uid`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_dislike_id_2` FOREIGN KEY (`to_id`) REFERENCES `users` (`_uid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_dislikes`
--

LOCK TABLES `my_dislikes` WRITE;
/*!40000 ALTER TABLE `my_dislikes` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_dislikes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_likes`
--

DROP TABLE IF EXISTS `my_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `my_likes` (
  `_uid` char(36) NOT NULL,
  `from_id` char(36) NOT NULL,
  `to_id` char(36) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`_uid`),
  KEY `fk_like_id_1_idx` (`from_id`),
  KEY `fk_like_id_2_idx` (`to_id`),
  CONSTRAINT `fk_like_id_1` FOREIGN KEY (`from_id`) REFERENCES `users` (`_uid`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_like_id_2` FOREIGN KEY (`to_id`) REFERENCES `users` (`_uid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_likes`
--

LOCK TABLES `my_likes` WRITE;
/*!40000 ALTER TABLE `my_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_hobbies`
--

DROP TABLE IF EXISTS `user_hobbies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_hobbies` (
  `_uid` char(36) NOT NULL,
  `users_id` char(36) NOT NULL,
  `hobby` varchar(45) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`_uid`),
  KEY `fk_hobby_id_idx` (`users_id`),
  CONSTRAINT `fk_hobby_id` FOREIGN KEY (`users_id`) REFERENCES `users` (`_uid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_hobbies`
--

LOCK TABLES `user_hobbies` WRITE;
/*!40000 ALTER TABLE `user_hobbies` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_hobbies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profiles`
--

DROP TABLE IF EXISTS `user_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_profiles` (
  `users_id` char(36) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `age` int unsigned DEFAULT NULL,
  `gender` int unsigned DEFAULT NULL,
  `picture` blob,
  `city` varchar(45) DEFAULT NULL,
  `covid_status` int unsigned DEFAULT '0',
  `vaccinated` int unsigned DEFAULT '0',
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`users_id`),
  CONSTRAINT `fk_profile_id` FOREIGN KEY (`users_id`) REFERENCES `users` (`_uid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profiles`
--

LOCK TABLES `user_profiles` WRITE;
/*!40000 ALTER TABLE `user_profiles` DISABLE KEYS */;
INSERT INTO `user_profiles` VALUES ('3491870103568384',NULL,NULL,NULL,NULL,NULL,NULL,0,0,'2022-10-08 16:40:31','2022-10-08 16:40:31');
/*!40000 ALTER TABLE `user_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `_uid` char(36) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('3491870103568384','Mike','$2a$10$eAcbVg0qNzD4sF/OrywcJeKC5tvNFPwzHf1zcWgZWzywiS/u5zfm.','2022-10-08 16:40:31','2022-10-08 16:40:31');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-08 16:45:57

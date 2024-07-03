-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: localhost    Database: euro
-- ------------------------------------------------------
-- Server version	8.0.37-0ubuntu0.22.04.3

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
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_polish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES (1,'A'),(2,'B'),(3,'C'),(4,'D'),(5,'E'),(6,'F');
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_standings`
--

DROP TABLE IF EXISTS `group_standings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_standings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_position` int NOT NULL,
  `team_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdmg9nh46i5atu1omb4s7m96t5` (`team_id`),
  CONSTRAINT `FKdmg9nh46i5atu1omb4s7m96t5` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_standings`
--

LOCK TABLES `group_standings` WRITE;
/*!40000 ALTER TABLE `group_standings` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_standings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knockout_match`
--

DROP TABLE IF EXISTS `knockout_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `knockout_match` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `away_team_score` int DEFAULT NULL,
  `home_team_score` int DEFAULT NULL,
  `match_date_time` datetime(6) DEFAULT NULL,
  `away_team_id` bigint NOT NULL,
  `home_team_id` bigint NOT NULL,
  `knockout_stage_id` bigint NOT NULL,
  `location_id` bigint NOT NULL,
  `extra_time_away_score` int DEFAULT NULL,
  `extra_time_home_score` int DEFAULT NULL,
  `penalty_away_score` int DEFAULT NULL,
  `penalty_home_score` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhg26mihswucq46w1kf8nc59vs` (`away_team_id`),
  KEY `FKcn1dj04dpy1agaus9plmxsmpy` (`home_team_id`),
  KEY `FKm5s2uqf8c8mcgs2s68xshdpdv` (`knockout_stage_id`),
  KEY `FK5cxlh8gc5acttuwosvut8hom8` (`location_id`),
  CONSTRAINT `FK5cxlh8gc5acttuwosvut8hom8` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `FKcn1dj04dpy1agaus9plmxsmpy` FOREIGN KEY (`home_team_id`) REFERENCES `team` (`id`),
  CONSTRAINT `FKhg26mihswucq46w1kf8nc59vs` FOREIGN KEY (`away_team_id`) REFERENCES `team` (`id`),
  CONSTRAINT `FKm5s2uqf8c8mcgs2s68xshdpdv` FOREIGN KEY (`knockout_stage_id`) REFERENCES `knockout_stage` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=700 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knockout_match`
--

LOCK TABLES `knockout_match` WRITE;
/*!40000 ALTER TABLE `knockout_match` DISABLE KEYS */;
/*!40000 ALTER TABLE `knockout_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knockout_stage`
--

DROP TABLE IF EXISTS `knockout_stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `knockout_stage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `stage_name` varchar(255) COLLATE utf8mb4_polish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knockout_stage`
--

LOCK TABLES `knockout_stage` WRITE;
/*!40000 ALTER TABLE `knockout_stage` DISABLE KEYS */;
INSERT INTO `knockout_stage` VALUES (1,'1/8 finału'),(2,'1/8 finału'),(3,'1/8 finału'),(4,'1/8 finału'),(5,'1/8 finału'),(6,'1/8 finału'),(7,'1/8 finału'),(8,'1/8 finału'),(9,'1/8 finału'),(10,'1/8 finału'),(11,'1/4 finału'),(12,'1/8 finału'),(13,'1/4 finału'),(14,'1/4 finału'),(15,'1/8 finału'),(16,'1/4 finału'),(17,'1/4 finału'),(18,'1/4 finału'),(19,'1/8 finału'),(20,'1/4 finału'),(21,'1/4 finału'),(22,'1/4 finału'),(23,'1/4 finału'),(24,'1/4 finału'),(25,'1/4 finału'),(26,'1/8 finału'),(27,'1/4 finału'),(28,'1/4 finału'),(29,'1/4 finału'),(30,'1/4 finału'),(31,'1/4 finału'),(32,'1/4 finału'),(33,'1/8 finału'),(34,'1/4 finału'),(35,'1/4 finału'),(36,'1/8 finału'),(37,'1/4 finału'),(38,'1/8 finału'),(39,'1/4 finału'),(40,'1/4 finału'),(41,'1/8 finału'),(42,'1/4 finału'),(43,'1/4 finału'),(44,'1/4 finału'),(45,'1/4 finału'),(46,'1/4 finału'),(47,'1/4 finału'),(48,'1/4 finału'),(49,'1/4 finału'),(50,'1/4 finału'),(51,'1/4 finału'),(52,'1/8 finału'),(53,'1/4 finału'),(54,'1/4 finału'),(55,'1/8 finału'),(56,'1/8 finału'),(57,'1/8 finału'),(58,'1/8 finału'),(59,'1/4 finału'),(60,'1/4 finału'),(61,'1/8 finału'),(62,'1/4 finału'),(63,'1/4 finału'),(64,'1/4 finału'),(65,'1/4 finału'),(66,'1/4 finału'),(67,'1/8 finału'),(68,'1/4 finału'),(69,'1/4 finału'),(70,'1/4 finału'),(71,'1/4 finału'),(72,'1/8 finału'),(73,'1/4 finału'),(74,'1/4 finału'),(75,'1/4 finału'),(76,'1/4 finału'),(77,'1/4 finału'),(78,'1/4 finału'),(79,'1/8 finału'),(80,'1/8 finału'),(81,'1/4 finału'),(82,'1/4 finału'),(83,'1/8 finału'),(84,'1/4 finału'),(85,'1/4 finału'),(86,'1/4 finału'),(87,'1/8 finału'),(88,'1/8 finału'),(89,'1/8 finału'),(90,'1/8 finału'),(91,'1/8 finału'),(92,'1/8 finału'),(93,'1/8 finału'),(94,'1/4 finału'),(95,'1/2 finału'),(96,'1/8 finału'),(97,'1/4 finału'),(98,'1/8 finału'),(99,'1/4 finału'),(100,'1/8 finału'),(101,'1/4 finału'),(102,'1/8 finału'),(103,'1/4 finału'),(104,'1/8 finału'),(105,'1/8 finału'),(106,'1/8 finału'),(107,'1/8 finału'),(108,'1/8 finału'),(109,'1/8 finału'),(110,'1/4 finału'),(111,'1/4 finału'),(112,'1/4 finału'),(113,'1/4 finału'),(114,'1/4 finału'),(115,'1/4 finału'),(116,'1/4 finału'),(117,'1/4 finału'),(118,'1/4 finału'),(119,'1/8 finału'),(120,'1/8 finału'),(121,'1/4 finału'),(122,'1/8 finału'),(123,'1/4 finału'),(124,'1/4 finału'),(125,'1/8 finału'),(126,'1/4 finału'),(127,'1/2 finału'),(128,'Finał'),(129,'1/2 finału'),(130,'Finał'),(131,'Finał'),(132,'Finał'),(133,'1/8 finału'),(134,'1/4 finału'),(135,'1/2 finału'),(136,'Finał'),(137,'1/8 finału'),(138,'1/4 finału'),(139,'1/2 finału'),(140,'Finał'),(141,'1/8 finału'),(142,'1/4 finału'),(143,'1/2 finału'),(144,'Finał'),(145,'1/8 finału'),(146,'1/4 finału'),(147,'1/2 finału'),(148,'Finał');
/*!40000 ALTER TABLE `knockout_stage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `city` varchar(255) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_polish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Berlin','Olympiastadion'),(2,'Monachium','Allianz Arena'),(3,'Dortmund','Westfalenstadion'),(4,'Stuttgart','MHPArena'),(5,'Gelsenkirchen','Veltins-Arena'),(6,'Hamburg','Volksparkstadion'),(7,'Frankfurt','Waldstadion'),(8,'Düsseldorf','Merkur Spiel-Arena'),(9,'Kolonia','RheinEnergieStadion'),(10,'Lipsk','Red Bull Arena');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matches` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `away_team_score` int DEFAULT NULL,
  `home_team_score` int DEFAULT NULL,
  `match_date_time` date DEFAULT NULL,
  `away_team_id` bigint NOT NULL,
  `home_team_id` bigint NOT NULL,
  `location_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbh4fpc4xaux9kop27bfypabra` (`away_team_id`),
  KEY `FKav2sryrpg0rdk68v4sa1pe0rx` (`home_team_id`),
  KEY `FK8omwhuf9s4aabsgjdf2eneu6m` (`location_id`),
  CONSTRAINT `FK8omwhuf9s4aabsgjdf2eneu6m` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `FKav2sryrpg0rdk68v4sa1pe0rx` FOREIGN KEY (`home_team_id`) REFERENCES `team` (`id`),
  CONSTRAINT `FKbh4fpc4xaux9kop27bfypabra` FOREIGN KEY (`away_team_id`) REFERENCES `team` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` VALUES (38,NULL,NULL,'2024-06-14',4,1,2),(39,NULL,NULL,'2024-06-15',3,2,9),(40,NULL,NULL,'2024-06-15',8,5,1),(41,NULL,NULL,'2024-06-15',7,6,3),(42,NULL,NULL,'2024-06-16',13,15,6),(43,NULL,NULL,'2024-06-16',10,11,4),(44,NULL,NULL,'2024-06-16',9,12,5),(45,NULL,NULL,'2024-06-17',20,17,2),(46,NULL,NULL,'2024-06-17',18,19,7),(47,NULL,NULL,'2024-06-17',14,16,8),(48,NULL,NULL,'2024-06-18',24,21,3),(49,NULL,NULL,'2024-06-18',23,22,10),(50,NULL,NULL,'2024-06-19',7,8,6),(51,NULL,NULL,'2024-06-19',3,1,4),(52,NULL,NULL,'2024-06-19',2,4,9),(53,NULL,NULL,'2024-06-20',12,11,2),(54,NULL,NULL,'2024-06-20',9,10,7),(55,NULL,NULL,'2024-06-20',6,5,5),(56,NULL,NULL,'2024-06-21',20,18,8),(57,NULL,NULL,'2024-06-21',16,15,1),(58,NULL,NULL,'2024-06-21',14,13,10),(59,NULL,NULL,'2024-06-22',23,24,6),(60,NULL,NULL,'2024-06-22',22,21,3),(61,NULL,NULL,'2024-06-22',17,19,9),(62,NULL,NULL,'2024-06-23',3,4,4),(63,NULL,NULL,'2024-06-23',1,2,7),(64,NULL,NULL,'2024-06-24',6,8,10),(65,NULL,NULL,'2024-06-24',5,7,8),(66,NULL,NULL,'2024-06-25',15,14,3),(67,NULL,NULL,'2024-06-25',16,13,1),(68,NULL,NULL,'2024-06-25',12,10,2),(69,NULL,NULL,'2024-06-25',11,9,9),(70,NULL,NULL,'2024-06-26',19,20,4),(71,NULL,NULL,'2024-06-26',17,18,7),(72,NULL,NULL,'2024-06-26',22,24,5),(73,NULL,NULL,'2024-06-26',21,23,6);
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_USER'),(2,'ROLE_ADMIN');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_polish_ci NOT NULL,
  `points` int NOT NULL,
  `group_id` bigint DEFAULT NULL,
  `qualified_to_next_round` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKiaw8if9k3auolyqcy30culvr8` (`group_id`),
  CONSTRAINT `FKiaw8if9k3auolyqcy30culvr8` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'Germany',0,1,_binary '\0'),(2,'Switzerland',0,1,NULL),(3,'Hungary',0,1,_binary ''),(4,'Scotland',0,1,_binary '\0'),(5,'Spain',0,2,_binary ''),(6,'Italy',0,2,_binary ''),(7,'Albania',0,2,_binary '\0'),(8,'Croatia',0,2,NULL),(9,'England',0,3,_binary ''),(10,'Denmark',0,3,_binary '\0'),(11,'Slovenia',0,3,_binary '\0'),(12,'Serbia',0,3,_binary ''),(13,'Netherlands',0,4,_binary ''),(14,'France',0,4,_binary ''),(15,'Poland',0,4,_binary '\0'),(16,'Austria',0,4,_binary '\0'),(17,'Romania',0,5,_binary '\0'),(18,'Slovakia',0,5,_binary ''),(19,'Belgium',0,5,_binary '\0'),(20,'Ukraine',0,5,_binary '\0'),(21,'Turkiye',0,6,_binary '\0'),(22,'Portugal',0,6,_binary ''),(23,'Czechia',0,6,_binary '\0'),(24,'Georgia',0,6,_binary '');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_polish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_polish_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_polish_ci NOT NULL,
  `enabled` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`),
  UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'frnake@fgds.pl','$2a$10$XwJDEY3NYP3aIQGt8a2sGOFxX1scQrVVnIR9cuBKL5tpi6yGKFXpW','Franek051',1),(2,'admin@admin.pl','$2a$10$Gp9l1AlOwrfY3fYKRojmf.gRX9W68Er1B2j/FRM6aYSMOt1pCVIEy','admin',1),(3,'admin@cos.com','$2a$10$WZoTW/pXjFha6.yDwIWay.P16yVWbIbeIKjGTbnx7UHhXff5sDIyO','admin2',1),(4,'admin3@admin3.pl','$2a$10$iPsTDf1YRFMd/iivqHvHZ.imCjOzGcPss/4wSPQawIN1fvpTzS34q','admin3',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` bigint NOT NULL,
  `roles_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`roles_id`),
  KEY `FKj9553ass9uctjrmh0gkqsmv0d` (`roles_id`),
  CONSTRAINT `FK55itppkw3i07do3h7qoclqd4k` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKj9553ass9uctjrmh0gkqsmv0d` FOREIGN KEY (`roles_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,1),(3,1),(4,1),(2,2);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-03  9:37:21

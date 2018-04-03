CREATE DATABASE  IF NOT EXISTS `car_rental` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `car_rental`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: car_rental
-- ------------------------------------------------------
-- Server version	5.7.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `car_make`
--

DROP TABLE IF EXISTS `car_make`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car_make` (
  `CarMake_ID` int(11) NOT NULL,
  `Description` varchar(100) NOT NULL,
  PRIMARY KEY (`CarMake_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_make`
--

LOCK TABLES `car_make` WRITE;
/*!40000 ALTER TABLE `car_make` DISABLE KEYS */;
INSERT INTO `car_make` VALUES (1,'abarth'),(2,'alfa romeo'),(3,'asia motors'),(4,'aston martin'),(5,'audi'),(6,'austin'),(7,'autobianchi'),(8,'bentley'),(9,'bmw'),(10,'bugatti'),(11,'buick'),(12,'cadillac'),(13,'carver'),(14,'chevrolet'),(15,'chrysler'),(16,'citroen'),(17,'corvette'),(18,'dacia'),(19,'daewoo'),(20,'daihatsu'),(21,'daimler'),(22,'datsun'),(23,'dodge'),(24,'donkervoort'),(25,'ds'),(26,'ferrari'),(27,'fiat'),(28,'fisker'),(29,'ford'),(30,'fso'),(31,'galloper'),(32,'honda'),(33,'hummer'),(34,'hyundai'),(35,'infiniti'),(36,'jaguar'),(37,'jeep'),(38,'josse'),(39,'kia'),(40,'lada'),(41,'lamborghini'),(42,'lancia'),(43,'land rover'),(44,'landwind'),(45,'lexus'),(46,'lincoln'),(47,'lotus'),(48,'maserati'),(49,'maybach'),(50,'mazda'),(51,'mega'),(52,'mercedes benz'),(53,'mercury'),(54,'mg'),(55,'mini'),(56,'mitsubishi'),(57,'morgan'),(58,'nissan'),(59,'noble'),(60,'opel'),(61,'peugeot'),(62,'pgo'),(63,'pontiac'),(64,'porsche'),(65,'princess'),(66,'renault'),(67,'rolls royce'),(68,'rover'),(69,'saab'),(70,'seat'),(71,'skoda'),(72,'smart'),(73,'ssangyong'),(74,'subaru'),(75,'suzuki'),(76,'tesla'),(77,'think'),(78,'toyota'),(79,'triumph'),(80,'tvr'),(81,'volkswagen'),(82,'volvo'),(83,'yugo');
/*!40000 ALTER TABLE `car_make` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-31  1:50:32

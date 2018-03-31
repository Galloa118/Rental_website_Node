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
-- Table structure for table `office`
--

DROP TABLE IF EXISTS `office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office` (
  `Office_ID` int(11) NOT NULL,
  `Office_StrAdd` varchar(100) NOT NULL,
  `Office_City` varchar(50) DEFAULT NULL,
  `Office_State` varchar(50) DEFAULT NULL,
  `Office_Zip` int(11) DEFAULT NULL,
  `Office_Phone` varchar(20) NOT NULL,
  `Office_Username` varchar(10) NOT NULL,
  `Office_Password` varchar(50) NOT NULL,
  PRIMARY KEY (`Office_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office`
--

LOCK TABLES `office` WRITE;
/*!40000 ALTER TABLE `office` DISABLE KEYS */;
INSERT INTO `office` VALUES (1,'304 Green Hill Rd. ','Minneapolis','MN',55401,'6122008828','office1','dtv6/'),(2,'7282 Marsh Ave. ','St. Paul','MN',55101,'6122662753','office2','l0o8J'),(3,'997 North Fremont Street ','Rochester','MN',55901,'5072022104','office3','v01tp'),(4,'328 Galvin Street ','Duluth','MN',55801,'2182063449','office4','C8PUF'),(5,'1 Cobblestone Lane ','Bloomington','MN',55420,'9526939515','office5','8qPIi'),(6,'84 Snake Hill Ave. ','Roseville','MN',55113,'9524262047','office6','Y6qoK'),(7,'648 Clinton Lane ','Plymouth','MN',55446,'6122304029','office7','2Qkrd'),(8,'448 Jockey Hollow Circle ','Moorhead','MN',56560,'2182272903','office8','3Sjb5'),(9,'621 Cleveland St. ','Andover','MN',55303,'2073920319','office9','Lt5tr'),(10,'7575 Valley View Street ','St. Cloud','MN',56301,'3202001344','office10','aM6Bq'),(11,'9052 NW. Court St. ','Fridley','MN',55421,'7635029880','office11','sT+A7'),(12,'1 Wilson St. ','Eden Prairie','MN',55343,'9526583800','office12','qDt6y'),(13,'958 Bay Rd. ','Winona','MN',55987,'5073129200','office13','82a+n'),(14,'423 Beacon Street ','Coon Rapids','MN',55448,'7632238366','office14','a/ejw'),(15,'9442 Park Dr. ','Lakeville','MN',55044,'9524698618','office15','Uv9Ik'),(16,'251 Ketch Harbour Circle ','Shoreview','MN',55126,'6512882511','office16','mMqhz'),(17,'26 Pin Oak Lane ','Minnetonka','MN',55305,'6122240114','office17','QnmMU'),(18,'928 West Street ','Apple Valley','MN',55124,'6512526256','office18','ulAHn'),(19,'8566 Proctor Drive ','Chaska','MN',55318,'9522272010','office19','LUVoZ'),(20,'7785 Summer Street ','Mankato','MN',56001,'5072077726','office20','GHK+Q');
/*!40000 ALTER TABLE `office` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-31  1:50:31

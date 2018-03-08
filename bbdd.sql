CREATE DATABASE  IF NOT EXISTS `QUINIELA` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;
USE `QUINIELA`;
-- MySQL dump 10.13  Distrib 5.5.58, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: QUINIELA
-- ------------------------------------------------------
-- Server version	5.5.58-0ubuntu0.14.04.1

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
-- Table structure for table `PREMIS`
--

DROP TABLE IF EXISTS `PREMIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PREMIS` (
  `JORNADA` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `DATA` date NOT NULL,
  `CATEGORIA` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `ENCERTANTS` int(11) DEFAULT NULL,
  `PREMI` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`JORNADA`,`DATA`,`CATEGORIA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PREMIS`
--

LOCK TABLES `PREMIS` WRITE;
/*!40000 ALTER TABLE `PREMIS` DISABLE KEYS */;
INSERT INTO `PREMIS` VALUES ('Jornada 5','2016-04-17','1ª (14 Aciertos)',0,0.00),('Jornada 5','2016-04-17','2ª (13 Aciertos)',12,34230.10),('Jornada 5','2016-04-17','3ª (12 Aciertos)',119,3451.78),('Jornada 5','2016-04-17','4ª (11 Aciertos)',1314,312.60),('Jornada 5','2016-04-17','5ª (10 Aciertos)',8504,57.96),('Jornada 5','2016-04-17','Pleno al 15',0,0.00),('Jornada 5','2016-04-20','1ª (14 Aciertos)',63,5664.12),('Jornada 5','2016-04-20','2ª (13 Aciertos)',1096,152.62),('Jornada 5','2016-04-20','3ª (12 Aciertos)',7946,21.05),('Jornada 5','2016-04-20','4ª (11 Aciertos)',40793,4.10),('Jornada 5','2016-04-20','5ª (10 Aciertos)',146696,1.37),('Jornada 5','2016-04-20','Pleno al 15',36,4646.35),('Jornada 5','2016-04-24','1ª (14 Aciertos)',1,751865.04),('Jornada 5','2016-04-24','2ª (13 Aciertos)',49,7192.59),('Jornada 5','2016-04-24','3ª (12 Aciertos)',806,437.27),('Jornada 5','2016-04-24','4ª (11 Aciertos)',7584,46.47),('Jornada 5','2016-04-24','5ª (10 Aciertos)',46737,9.05),('Jornada 5','2016-04-24','Pleno al 15',1,352436.74),('Jornada 5','2016-05-01','1ª (14 Aciertos)',13,66586.66),('Jornada 5','2016-05-01','2ª (13 Aciertos)',301,1348.05),('Jornada 5','2016-05-01','3ª (12 Aciertos)',3623,112.00),('Jornada 5','2016-05-01','4ª (11 Aciertos)',27370,14.83),('Jornada 5','2016-05-01','5ª (10 Aciertos)',133920,3.64),('Jornada 5','2016-05-01','Pleno al 15',1,405762.47),('Jornada 5','2016-05-08','1ª (14 Aciertos)',1,999999.99),('Jornada 5','2016-05-08','2ª (13 Aciertos)',17,35914.29),('Jornada 5','2016-05-08','3ª (12 Aciertos)',514,1187.83),('Jornada 5','2016-05-08','4ª (11 Aciertos)',6042,101.05),('Jornada 5','2016-05-08','5ª (10 Aciertos)',43921,16.68),('Jornada 5','2016-05-08','Pleno al 15',1,999999.99),('Jornada 5','2016-05-11','1ª (14 Aciertos)',1,113029.20),('Jornada 5','2016-05-11','2ª (13 Aciertos)',46,1151.79),('Jornada 5','2016-05-11','3ª (12 Aciertos)',393,134.82),('Jornada 5','2016-05-11','4ª (11 Aciertos)',2391,22.16),('Jornada 5','2016-05-11','5ª (10 Aciertos)',12356,5.15),('Jornada 5','2016-05-11','Pleno al 15',0,0.00),('Jornada 5','2016-05-14','1ª (14 Aciertos)',35,20116.24),('Jornada 5','2016-05-14','2ª (13 Aciertos)',1430,230.79),('Jornada 5','2016-05-14','3ª (12 Aciertos)',17866,18.47),('Jornada 5','2016-05-14','4ª (11 Aciertos)',106409,3.10),('Jornada 5','2016-05-14','5ª (10 Aciertos)',358441,1.10),('Jornada 5','2016-05-14','Pleno al 15',13,25387.09),('Jornada 5','2016-05-22','1ª (14 Aciertos)',2,229731.24),('Jornada 5','2016-05-22','2ª (13 Aciertos)',134,1607.26),('Jornada 5','2016-05-22','3ª (12 Aciertos)',2417,89.11),('Jornada 5','2016-05-22','4ª (11 Aciertos)',21149,10.18),('Jornada 5','2016-05-22','5ª (10 Aciertos)',111344,2.32),('Jornada 5','2016-05-22','Pleno al 15',0,0.00),('Jornada 5','2016-05-25','1ª (14 Aciertos)',69,2420.40),('Jornada 5','2016-05-25','2ª (13 Aciertos)',1090,71.82),('Jornada 5','2016-05-25','3ª (12 Aciertos)',8000,9.79),('Jornada 5','2016-05-25','4ª (11 Aciertos)',35387,2.21),('Jornada 5','2016-05-25','5ª (10 Aciertos)',100101,0.00),('Jornada 5','2016-05-25','Pleno al 15',2,39142.44);
/*!40000 ALTER TABLE `PREMIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESULTATS`
--

DROP TABLE IF EXISTS `RESULTATS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESULTATS` (
  `JORNADA` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `EQUIP_CASA` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `EQUIP_VISITANT` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `MARCADOR` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `RESULTAT` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `APOSTES1` int(11) DEFAULT NULL,
  `APOSTESX` int(11) DEFAULT NULL,
  `APOSTES2` int(11) DEFAULT NULL,
  PRIMARY KEY (`JORNADA`,`EQUIP_CASA`,`EQUIP_VISITANT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESULTATS`
--

LOCK TABLES `RESULTATS` WRITE;
/*!40000 ALTER TABLE `RESULTATS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESULTATS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-03 22:18:45

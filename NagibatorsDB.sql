CREATE DATABASE  IF NOT EXISTS `nagibators` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `nagibators`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 79.100.104.13    Database: nagibators
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `CityID` int NOT NULL,
  `Name` varchar(25) NOT NULL,
  `CountryID` int NOT NULL,
  PRIMARY KEY (`CityID`),
  KEY `FN_CountryID_idx` (`CountryID`),
  CONSTRAINT `FN_CountryID` FOREIGN KEY (`CountryID`) REFERENCES `countries` (`CountryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Burgas',1),(2,'Aytos',1),(3,'Plovdiv',1),(4,'Colorado',2),(5,'Sofia',1),(6,'Varna',1),(7,'Gabrovo',1),(8,'Texas',2),(9,'Asenovgrad',1),(10,'Nessebar',1),(11,'Ravda',1),(12,'SunnyBeach',1),(13,'Pleven',1),(14,'Makhachkala',3),(15,'Mumbai',4),(16,'Kyiw',5),(17,'Izmail',5),(18,'Odessa',5),(19,'Chernobil',5),(20,'Vinitsa',5),(21,'Cherno More',1),(22,'Chicago',2);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `CountryID` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`CountryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Bulgaria'),(2,'United States Of America'),(3,'Dagestan'),(4,'India'),(5,'Ukraine');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustomersID` int NOT NULL,
  `CityID` int NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `phoneNumber` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  PRIMARY KEY (`CustomersID`),
  KEY `CityIDFN_idx` (`CityID`),
  CONSTRAINT `CityIDFN` FOREIGN KEY (`CityID`) REFERENCES `cities` (`CityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,1,'Denitsa','Lazarowa','+359879968301','dl@proton.me','ul. Izgrew bl. 22'),(2,2,'Denis','Borisow','+359879968338','df4fl@proton.me','ul. Izgrew bl. 24'),(3,1,'Boris','Denislavov','+359879968346','fwf43dl@proton.me','ul. Izgrew bl. 25'),(4,1,'Georgy','Petrow','+359879968323','fvnjg87dl@proton.me','ul. Izgrew bl. 26'),(5,1,'Petr','Filipov','+359879968303','grjferoi90dl@proton.me','ul. Tsar Samuil 74'),(6,8,'Nibba','Galls','+1948751294','iwrjoirg@Blackmail.com','ul. Ulitsa 11'),(7,4,'Alla','Hylenko','+380879968303','grjferoi90dl@proton.me','ul. Batak 17'),(8,5,'Alex','Vazov','+359879968332','54fgeroi90dl@proton.me','ul. Ivan Vazov 59'),(9,11,'Jasmin','Kaludowa','+359879968432','23oi90dl@proton.me','ul. Khan Asparuh 12'),(10,13,'Katya','Numerenko','+380879968902','grjf231oi90dl@proton.me','ul. Batak 28'),(11,1,'Ivan','Petrov','+359887123001','ivan.petrov@gmail.com','ul. Hristo Botev 1'),(12,2,'Maria','Dimitrova','+359887123002','maria.dimitrova@outlook.com','ul. Vasil Levski 12'),(13,3,'Georgi','Ivanov','+359887123003','georgi.ivanov@yahoo.com','ul. Slivnitsa 5'),(14,4,'Elena','Nikolova','+359887123004','elena.nikolova@gmail.com','ul. Tsar Osvoboditel 8'),(15,5,'Petar','Stoyanov','+359887123005','petar.stoyanov@hotmail.com','ul. Stefan Stambolov 3'),(16,6,'Kristina','Koleva','+359887123006','kristina.koleva@gmail.com','ul. Maria Louisa 7'),(17,7,'Dimitar','Angelov','+359887123007','dimitar.angelov@outlook.com','ul. Hristo Smirnenski 4'),(18,8,'Nina','Popova','+359887123008','nina.popova@yahoo.com','ul. Nezabravka 9'),(19,9,'Stoyan','Georgiev','+359887123009','stoyan.georgiev@gmail.com','ul. Tsar Simeon 6'),(20,10,'Ivanka','Petkova','+359887123010','ivanka.petkova@outlook.com','ul. Slaveykov 11'),(21,11,'Todor','Nikolov','+359887123011','todor.nikolov@yahoo.com','ul. Rakovski 14'),(22,12,'Silviya','Marinova','+359887123012','silviya.marinova@gmail.com','ul. Hristo Botev 19'),(23,13,'Borislav','Kostov','+359887123013','borislav.kostov@hotmail.com','ul. Vasil Aprilov 2'),(24,14,'Violeta','Dobreva','+359887123014','violeta.dobreva@gmail.com','ul. Dragan Tsankov 8'),(25,15,'Kiril','Petrov','+359887123015','kiril.petrov@outlook.com','ul. Hristo Smirnenski 5'),(26,16,'Desislava','Ivanova','+359887123016','desislava.ivanova@yahoo.com','ul. Nezabravka 12'),(27,17,'Nikolay','Stoyanov','+359887123017','nikolay.stoyanov@gmail.com','ul. Tsar Simeon 7'),(28,18,'Yana','Koleva','+359887123018','yana.koleva@outlook.com','ul. Slaveykov 15'),(29,19,'Rumen','Angelov','+359887123019','rumen.angelov@yahoo.com','ul. Rakovski 16'),(30,20,'Ani','Popova','+359887123020','ani.popova@gmail.com','ul. Hristo Botev 20'),(31,21,'Martin','Georgiev','+359887123021','martin.georgiev@hotmail.com','ul. Vasil Levski 9'),(32,22,'Elitsa','Petkova','+359887123022','elitsa.petkova@gmail.com','ul. Slivnitsa 10'),(33,1,'Hristo','Ivanov','+359887123023','hristo.ivanov@outlook.com','ul. Tsar Osvoboditel 13'),(34,2,'Radostina','Dimitrova','+359887123024','radostina.dimitrova@yahoo.com','ul. Stefan Stambolov 7'),(35,3,'Vasil','Petrov','+359887123025','vasil.petrov@gmail.com','ul. Hristo Botev 6'),(36,4,'Margarita','Nikolova','+359887123026','margarita.nikolova@outlook.com','ul. Maria Louisa 4'),(37,5,'Teodor','Stoyanov','+359887123027','teodor.stoyanov@yahoo.com','ul. Vasil Aprilov 3'),(38,6,'Petya','Koleva','+359887123028','petya.koleva@gmail.com','ul. Dragan Tsankov 12'),(39,7,'Krasimir','Angelov','+359887123029','krasimir.angelov@hotmail.com','ul. Nezabravka 11'),(40,8,'Svetlana','Popova','+359887123030','svetlana.popova@gmail.com','ul. Tsar Simeon 14'),(41,9,'Ivan','Georgiev','+359887123031','ivan.georgiev@outlook.com','ul. Slaveykov 16'),(42,10,'Maria','Petkova','+359887123032','maria.petkova@yahoo.com','ul. Rakovski 18'),(43,11,'Georgi','Nikolov','+359887123033','georgi.nikolov@gmail.com','ul. Hristo Botev 22'),(44,12,'Elena','Marinova','+359887123034','elena.marinova@outlook.com','ul. Vasil Levski 21'),(45,13,'Petar','Kostov','+359887123035','petar.kostov@yahoo.com','ul. Slivnitsa 13'),(46,14,'Kristina','Dobreva','+359887123036','kristina.dobreva@gmail.com','ul. Tsar Osvoboditel 17'),(47,15,'Dimitar','Petrov','+359887123037','dimitar.petrov@outlook.com','ul. Stefan Stambolov 9'),(48,16,'Nina','Ivanova','+359887123038','nina.ivanova@yahoo.com','ul. Maria Louisa 5'),(49,17,'Stoyan','Stoyanov','+359887123039','stoyan.stoyanov@gmail.com','ul. Vasil Aprilov 6'),(50,18,'Ivanka','Koleva','+359887123040','ivanka.koleva@hotmail.com','ul. Dragan Tsankov 14'),(51,19,'Todor','Angelov','+359887123041','todor.angelov@gmail.com','ul. Nezabravka 15'),(52,20,'Silviya','Popova','+359887123042','silviya.popova@outlook.com','ul. Tsar Simeon 19'),(53,21,'Borislav','Georgiev','+359887123043','borislav.georgiev@yahoo.com','ul. Slaveykov 20'),(54,22,'Violeta','Petkova','+359887123044','violeta.petkova@gmail.com','ul. Rakovski 21'),(55,1,'Kiril','Nikolov','+359887123045','kiril.nikolov@outlook.com','ul. Hristo Botev 23'),(56,2,'Desislava','Marinova','+359887123046','desislava.marinova@yahoo.com','ul. Vasil Levski 24'),(57,3,'Nikolay','Kostov','+359887123047','nikolay.kostov@gmail.com','ul. Slivnitsa 15'),(58,4,'Yana','Dobreva','+359887123048','yana.dobreva@outlook.com','ul. Tsar Osvoboditel 25'),(59,5,'Rumen','Petrov','+359887123049','rumen.petrov@yahoo.com','ul. Stefan Stambolov 11'),(60,6,'Ani','Ivanova','+359887123050','ani.ivanova@gmail.com','ul. Maria Louisa 13'),(61,7,'Martin','Stoyanov','+359887123051','martin.stoyanov@hotmail.com','ul. Vasil Aprilov 17'),(62,8,'Elitsa','Koleva','+359887123052','elitsa.koleva@gmail.com','ul. Dragan Tsankov 19'),(63,9,'Hristo','Angelov','+359887123053','hristo.angelov@outlook.com','ul. Nezabravka 18'),(64,10,'Radostina','Popova','+359887123054','radostina.popova@yahoo.com','ul. Tsar Simeon 22'),(65,11,'Vasil','Georgiev','+359887123055','vasil.georgiev@gmail.com','ul. Slaveykov 23'),(66,12,'Margarita','Petkova','+359887123056','margarita.petkova@outlook.com','ul. Rakovski 24'),(67,13,'Teodor','Nikolov','+359887123057','teodor.nikolov@yahoo.com','ul. Hristo Botev 25'),(68,14,'Petya','Marinova','+359887123058','petya.marinova@gmail.com','ul. Vasil Levski 26'),(69,15,'Krasimir','Kostov','+359887123059','krasimir.kostov@outlook.com','ul. Slivnitsa 17'),(70,16,'Svetlana','Dobreva','+359887123060','svetlana.dobreva@yahoo.com','ul. Tsar Osvoboditel 27'),(71,17,'Ivan','Petrov','+359887123061','ivan.petrov@gmail.com','ul. Stefan Stambolov 13'),(72,18,'Maria','Ivanova','+359887123062','maria.ivanova@outlook.com','ul. Maria Louisa 15'),(73,19,'Georgi','Stoyanov','+359887123063','georgi.stoyanov@yahoo.com','ul. Vasil Aprilov 19'),(74,20,'Elena','Koleva','+359887123064','elena.koleva@gmail.com','ul. Dragan Tsankov 21'),(75,21,'Petar','Angelov','+359887123065','petar.angelov@outlook.com','ul. Nezabravka 20'),(76,22,'Kristina','Popova','+359887123066','kristina.popova@yahoo.com','ul. Tsar Simeon 28'),(77,1,'Dimitar','Georgiev','+359887123067','dimitar.georgiev@gmail.com','ul. Slaveykov 25'),(78,2,'Nina','Petkova','+359887123068','nina.petkova@outlook.com','ul. Rakovski 27'),(79,3,'Stoyan','Nikolov','+359887123069','stoyan.nikolov@yahoo.com','ul. Hristo Botev 28'),(80,4,'Ivanka','Marinova','+359887123070','ivanka.marinova@gmail.com','ul. Vasil Levski 29'),(81,5,'Todor','Kostov','+359887123071','todor.kostov@outlook.com','ul. Slivnitsa 20'),(82,6,'Silviya','Dobreva','+359887123072','silviya.dobreva@yahoo.com','ul. Tsar Osvoboditel 30'),(83,7,'Borislav','Petrov','+359887123073','borislav.petrov@gmail.com','ul. Stefan Stambolov 15'),(84,8,'Violeta','Ivanova','+359887123074','violeta.ivanova@outlook.com','ul. Maria Louisa 17'),(85,9,'Kiril','Stoyanov','+359887123075','kiril.stoyanov@yahoo.com','ul. Vasil Aprilov 21'),(86,10,'Desislava','Koleva','+359887123076','desislava.koleva@gmail.com','ul. Dragan Tsankov 23'),(87,11,'Nikolay','Angelov','+359887123077','nikolay.angelov@outlook.com','ul. Nezabravka 22'),(88,12,'Yana','Popova','+359887123078','yana.popova@yahoo.com','ul. Tsar Simeon 31'),(89,13,'Rumen','Georgiev','+359887123079','rumen.georgiev@gmail.com','ul. Slaveykov 27'),(90,14,'Ani','Petkova','+359887123080','ani.petkova@outlook.com','ul. Rakovski 28'),(91,15,'Martin','Nikolov','+359887123081','martin.nikolov@yahoo.com','ul. Hristo Botev 32'),(92,16,'Elitsa','Marinova','+359887123082','elitsa.marinova@gmail.com','ul. Vasil Levski 33'),(93,17,'Hristo','Kostov','+359887123083','hristo.kostov@outlook.com','ul. Slivnitsa 22'),(94,18,'Radostina','Dobreva','+359887123084','radostina.dobreva@yahoo.com','ul. Tsar Osvoboditel 34'),(95,19,'Vasil','Petrov','+359887123085','vasil.petrov@gmail.com','ul. Stefan Stambolov 17'),(96,20,'Margarita','Ivanova','+359887123086','margarita.ivanova@outlook.com','ul. Maria Louisa 19'),(97,21,'Teodor','Stoyanov','+359887123087','teodor.stoyanov@yahoo.com','ul. Vasil Aprilov 23'),(98,22,'Petya','Koleva','+359887123088','petya.koleva@gmail.com','ul. Dragan Tsankov 25'),(99,1,'Krasimir','Angelov','+359887123089','krasimir.angelov@outlook.com','ul. Nezabravka 24'),(100,2,'Svetlana','Popova','+359887123090','svetlana.popova@yahoo.com','ul. Tsar Simeon 35');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveries`
--

DROP TABLE IF EXISTS `deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliveries` (
  `DeliveryID` int NOT NULL,
  `FactoryID` int NOT NULL,
  `WarehouseID` int NOT NULL,
  `VehicleID` int NOT NULL,
  `WorkerID` int NOT NULL,
  PRIMARY KEY (`DeliveryID`),
  KEY `factories_idx` (`FactoryID`),
  KEY `warehouseID_idx` (`WarehouseID`),
  KEY `vehichleID_idx` (`VehicleID`),
  KEY `workerID_idx` (`WorkerID`),
  CONSTRAINT `factories` FOREIGN KEY (`FactoryID`) REFERENCES `factories` (`FactoryID`),
  CONSTRAINT `vehichleID` FOREIGN KEY (`VehicleID`) REFERENCES `vehicles` (`idVehicle`),
  CONSTRAINT `warehouseID` FOREIGN KEY (`WarehouseID`) REFERENCES `warehouses` (`WarehouseID`),
  CONSTRAINT `workerID` FOREIGN KEY (`WorkerID`) REFERENCES `workers` (`idworker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveries`
--

LOCK TABLES `deliveries` WRITE;
/*!40000 ALTER TABLE `deliveries` DISABLE KEYS */;
INSERT INTO `deliveries` VALUES (1,2,3,12,3),(2,3,1,3,2),(3,1,4,2,1),(4,3,4,5,4),(5,5,3,21,3),(6,4,5,12,5),(7,5,2,23,7),(8,3,5,15,6),(9,2,2,13,4),(10,6,1,8,3);
/*!40000 ALTER TABLE `deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `iddepartments` int NOT NULL AUTO_INCREMENT,
  `department` varchar(30) NOT NULL,
  PRIMARY KEY (`iddepartments`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Sr. Manager'),(2,'Warehouse Technician'),(3,'Warehouse Manager'),(4,'Factory Worker'),(5,'Factory Manager'),(6,'Driver'),(7,'Driver Assistant'),(8,'Warehouse Security Guard'),(9,'Factory Security');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factories`
--

DROP TABLE IF EXISTS `factories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factories` (
  `FactoryID` int NOT NULL,
  `CityId` int NOT NULL,
  `Address` varchar(45) NOT NULL,
  `DaysWithoutAccident` varchar(45) DEFAULT NULL,
  `CurrentlyProducing` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`FactoryID`),
  KEY `cityId_idx` (`CityId`),
  CONSTRAINT `city` FOREIGN KEY (`CityId`) REFERENCES `cities` (`CityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factories`
--

LOCK TABLES `factories` WRITE;
/*!40000 ALTER TABLE `factories` DISABLE KEYS */;
INSERT INTO `factories` VALUES (1,19,'Nezalezhnosti 3','2015-01-20','Bonbon'),(2,17,'Nezalezhnosti 325','2026-01-01','Water'),(3,5,'Lege 24','2022-06-01','Duner Meso Pileshko'),(4,1,'Batak 1','2026-08-02','Cigari'),(5,13,'Chajka 13','2025-01-13','StrannaBqlaTuhla'),(6,10,'Mesembrija 18','2018-04-04','Hapcetazaglava');
/*!40000 ALTER TABLE `factories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL,
  `WarehouseID` int NOT NULL,
  `CityID` int NOT NULL,
  `CustomerID` int NOT NULL,
  `StockID` int NOT NULL,
  `VehicleID` int NOT NULL,
  `WorkerID` int NOT NULL,
  `PaymentsID` int NOT NULL,
  `AmountOfStock` int NOT NULL,
  `DepartmentDate` datetime NOT NULL,
  PRIMARY KEY (`OrderID`),
  UNIQUE KEY `OrderID_UNIQUE` (`OrderID`),
  KEY `FN_Warehouse_idx` (`WarehouseID`),
  KEY `FN_City_idx` (`CityID`),
  KEY `FN_Customer_idx` (`CustomerID`),
  KEY `FN_Stock_idx` (`StockID`),
  KEY `FN_Vehicle_idx` (`VehicleID`),
  KEY `FN_Workers_idx` (`WorkerID`) /*!80000 INVISIBLE */,
  KEY `FN_Payments_idx` (`PaymentsID`),
  CONSTRAINT `FN_City` FOREIGN KEY (`CityID`) REFERENCES `cities` (`CityID`),
  CONSTRAINT `FN_Customer` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomersID`),
  CONSTRAINT `FN_Payments` FOREIGN KEY (`PaymentsID`) REFERENCES `payments` (`idpayments`),
  CONSTRAINT `FN_Stock` FOREIGN KEY (`StockID`) REFERENCES `stock_types` (`StockID`),
  CONSTRAINT `FN_Vehicle` FOREIGN KEY (`VehicleID`) REFERENCES `vehicles` (`idVehicle`),
  CONSTRAINT `FN_Warehouse` FOREIGN KEY (`WarehouseID`) REFERENCES `warehouses` (`WarehouseID`),
  CONSTRAINT `FN_Workers` FOREIGN KEY (`WorkerID`) REFERENCES `workers` (`idworker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,2,3,1,1,1,95,'2019-12-05 12:54:00'),(2,2,5,6,1,5,1,2,500,'2019-05-04 16:23:00'),(3,3,2,6,1,24,2,3,400,'2019-02-28 13:06:00'),(4,5,8,6,1,38,3,4,400,'2020-04-12 08:34:00'),(5,4,17,3,2,12,3,5,50,'2020-08-09 09:49:00'),(6,2,16,1,1,2,2,6,450,'2020-05-16 14:04:00'),(7,3,5,2,3,1,4,7,425,'2020-02-10 19:40:00'),(8,1,2,3,4,3,2,8,5,'2021-03-09 09:23:00'),(9,4,6,5,6,5,1,9,129,'2021-06-10 13:27:00'),(10,1,7,6,2,7,4,10,120,'2021-04-20 19:40:00');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `idpayments` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `CustomersID` int NOT NULL,
  `CardNum` bigint DEFAULT NULL,
  `PaymentType` enum('cash','card','online') DEFAULT NULL,
  `isFinished` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpayments`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,589.00,2,NULL,'cash',1),(2,1000.00,3,6750387877753625,'online',1),(3,800.00,9,5005687091853930,'card',1),(4,800.00,5,NULL,'cash',0),(5,10000.00,9,NULL,'cash',0),(6,900.00,6,6944973301807617,'online',1),(7,2635.00,7,NULL,'cash',0),(8,2000.00,10,4974380814168804,'card',1),(9,86.43,9,NULL,'cash',0),(10,24000.00,8,NULL,'cash',1);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_available`
--

DROP TABLE IF EXISTS `stock_available`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_available` (
  `idStocks` int NOT NULL,
  `warehouseID` int NOT NULL,
  `amount` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idStocks`,`warehouseID`),
  KEY `WarehouseID_idx` (`warehouseID`),
  CONSTRAINT `FN_StockID` FOREIGN KEY (`idStocks`) REFERENCES `stock_types` (`StockID`),
  CONSTRAINT `FN_WarehouseID` FOREIGN KEY (`warehouseID`) REFERENCES `warehouses` (`WarehouseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_available`
--

LOCK TABLES `stock_available` WRITE;
/*!40000 ALTER TABLE `stock_available` DISABLE KEYS */;
INSERT INTO `stock_available` VALUES (1,1,3),(2,2,57),(3,3,15),(4,5,20),(5,5,30),(6,2,32),(7,4,100),(8,4,10),(9,6,100),(10,2,58);
/*!40000 ALTER TABLE `stock_available` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_imports`
--

DROP TABLE IF EXISTS `stock_imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_imports` (
  `MovementID` int NOT NULL AUTO_INCREMENT,
  `StockID` int NOT NULL,
  `VehID` int NOT NULL,
  `WorkerID` int NOT NULL,
  `WarehouseID` int NOT NULL,
  `Amount` int NOT NULL,
  `Date` datetime NOT NULL,
  PRIMARY KEY (`MovementID`),
  KEY `FN_Stocks_idx` (`StockID`),
  KEY `FN_VehicleIDKey_idx` (`VehID`),
  KEY `FN_WorkerID_idx` (`WorkerID`),
  KEY `FN_WarehouseIDD_idx` (`WarehouseID`),
  CONSTRAINT `FN_Stocks` FOREIGN KEY (`StockID`) REFERENCES `stock_types` (`StockID`),
  CONSTRAINT `FN_VehicleIDKey` FOREIGN KEY (`VehID`) REFERENCES `vehicles` (`idVehicle`),
  CONSTRAINT `FN_WarehouseIDD` FOREIGN KEY (`WarehouseID`) REFERENCES `warehouses` (`WarehouseID`),
  CONSTRAINT `FN_WorkerID` FOREIGN KEY (`WorkerID`) REFERENCES `workers` (`idworker`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_imports`
--

LOCK TABLES `stock_imports` WRITE;
/*!40000 ALTER TABLE `stock_imports` DISABLE KEYS */;
INSERT INTO `stock_imports` VALUES (1,1,10,30,1,3,'2018-06-15 09:23:00'),(2,2,24,45,2,5,'2019-11-02 14:45:30'),(3,3,9,51,3,15,'2020-03-27 08:10:15'),(4,4,7,57,5,20,'2020-12-19 16:55:40'),(5,5,5,65,5,30,'2021-07-04 12:30:05'),(6,6,6,64,2,32,'2022-01-22 10:05:50'),(7,7,1,58,4,100,'2022-09-18 17:20:10'),(8,8,2,71,4,10,'2023-05-11 13:15:25'),(9,9,6,77,6,100,'2024-02-28 11:50:00'),(10,10,4,70,2,58,'2025-08-09 15:40:35');
/*!40000 ALTER TABLE `stock_imports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_types`
--

DROP TABLE IF EXISTS `stock_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_types` (
  `StockID` int NOT NULL AUTO_INCREMENT,
  `StockName` varchar(45) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`StockID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_types`
--

LOCK TABLES `stock_types` WRITE;
/*!40000 ALTER TABLE `stock_types` DISABLE KEYS */;
INSERT INTO `stock_types` VALUES (1,'SmallWaterBottle-1L',2.00,'Voda'),(2,'StrannaBqlaTuhla',200.00,'????'),(3,'Cigari-Kutiq',6.20,NULL),(4,'Duner Meso Pileshko',400.00,'Originalno'),(5,'Bonboni',1.00,NULL),(6,'Prazna Botilka',0.67,NULL),(7,'Stol',69.00,'Geiming stolche'),(8,'Masa',420.00,NULL),(9,'nishka',250.00,NULL),(10,'Discord Monthly Nitro',2.50,'No scam'),(11,'Blender',40.00,NULL),(12,'Gaming console',299.00,NULL),(13,'Headphones',150.00,NULL),(14,'Mouse',29.00,NULL),(15,'Webcam',19.00,NULL),(16,'Pen',1.00,NULL),(17,'Pencil',0.50,NULL),(18,'Backpack',49.00,NULL),(19,'T-Shirt',5.00,NULL),(20,'Bicycle',299.00,NULL);
/*!40000 ALTER TABLE `stock_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicles` (
  `idVehicle` int NOT NULL,
  `type` enum('car','truck','van','Motorcycle') NOT NULL,
  `makeandmodel` varchar(45) DEFAULT NULL,
  `Year` int DEFAULT NULL,
  `VehCapacity` int NOT NULL,
  `WarehouseID` int NOT NULL,
  PRIMARY KEY (`idVehicle`),
  UNIQUE KEY `idVechicle_UNIQUE` (`idVehicle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES (1,'car','mazda 3',2005,40,5),(2,'van','ford transit',2003,130,5),(3,'Motorcycle','Baja SC50',2006,5,3),(4,'car','Audi A80',1988,40,4),(5,'car','Mercedes-Benz C200 W203',2003,40,3),(6,'car','Toyota RAV4',2004,60,3),(7,'car','Seat Toledo',1995,40,3),(8,'car','Ford Escort GAS + PETROL',1994,30,3),(9,'car','Ford Escort PETROL',1994,30,3),(10,'car','Toyota Supra ',2005,50,6),(11,'car','Peugeot 308',2023,40,2),(12,'car','Corvette C8',2022,15,3),(13,'car','Koenigsegg Agera RS',2015,10,3),(14,'car','Lotus Carlton',1992,40,3),(15,'car','Audi RS6 Avant',2024,60,4),(16,'car','Skoda Octavia',2022,40,4),(17,'car','Nissan Micra',2020,20,4),(18,'car','Seat Cordoba',1995,40,3),(19,'car','BMW E60',2006,40,3),(20,'car','Hyundai Santa Fe',2008,70,3),(21,'car','Volkswagen Golf 2',1985,35,10),(22,'car','Lada VAZ2105',1987,40,8),(23,'truck','Daf XF105',2009,600,5),(24,'car','Volkswagen Passat B6',2013,40,6),(25,'car','ZAZ-965',1962,20,7),(26,'car','Pagani Zonda R',2010,15,9),(27,'car','Ferrari F40',1990,15,3),(28,'car','Mazda 787B',1991,15,5),(29,'car','Hyundai Santa Fe',2025,80,5),(30,'car','Mclaren Senna GTR',2019,15,10),(31,'car','Suzuki Vitara',2004,60,3),(32,'Motorcycle','Kawasaki Ninja H2',2024,0,4),(33,'car','Mini Cooper S',2016,30,2),(34,'car','Lamborghini Countach LP5000 Quattrovalove',1987,15,3),(35,'car','Honda Civic Type-R',1996,35,4),(36,'car','Volga GAZ-21',1956,30,4),(37,'car','DMC Delorean',1982,30,3),(38,'truck','Kamaz 53212',1990,600,6),(39,'truck','Scania R500',2004,700,7),(40,'car','Ford F-150',2011,350,6);
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouses`
--

DROP TABLE IF EXISTS `warehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouses` (
  `WarehouseID` int NOT NULL,
  `StreetAddress` varchar(45) NOT NULL,
  `CityID` int NOT NULL,
  `Capacity` int NOT NULL,
  UNIQUE KEY `WarehouseID_UNIQUE` (`WarehouseID`),
  KEY `CityID_idx` (`CityID`),
  CONSTRAINT `CityID` FOREIGN KEY (`CityID`) REFERENCES `cities` (`CityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouses`
--

LOCK TABLES `warehouses` WRITE;
/*!40000 ALTER TABLE `warehouses` DISABLE KEYS */;
INSERT INTO `warehouses` VALUES (1,'18, Rumen voyvoda',5,300),(2,'52, Hristo Botev',1,67),(3,'82, O\'block',22,24),(4,'69, DENILAKIZ',8,5),(5,'01, Arsen',14,200),(6,'67, NeznamSiKude',14,269),(7,'09, Poop',15,90),(8,'Izgrew bl. 196',1,100),(9,'Dobry Chintulow 52',12,50),(10,'Komertsijna 52',17,10);
/*!40000 ALTER TABLE `warehouses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workers`
--

DROP TABLE IF EXISTS `workers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workers` (
  `idworker` int NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `age` int NOT NULL,
  `hire_date` date NOT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `warehouseID` int DEFAULT NULL,
  `factoryID` int DEFAULT NULL,
  `DepID` int NOT NULL,
  PRIMARY KEY (`idworker`),
  KEY `FN_IDWarehouse_idx` (`warehouseID`),
  KEY `FN_IDFactory_idx` (`factoryID`),
  KEY `FN_IDDep_idx` (`DepID`),
  CONSTRAINT `FN_IDDep` FOREIGN KEY (`DepID`) REFERENCES `departments` (`iddepartments`),
  CONSTRAINT `FN_IDFactory` FOREIGN KEY (`factoryID`) REFERENCES `factories` (`FactoryID`),
  CONSTRAINT `FN_IDWarehouse` FOREIGN KEY (`warehouseID`) REFERENCES `warehouses` (`WarehouseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workers`
--

LOCK TABLES `workers` WRITE;
/*!40000 ALTER TABLE `workers` DISABLE KEYS */;
INSERT INTO `workers` VALUES (1,'Arseniy','Donchenko',21,'2018-11-11',69420.00,5,NULL,6),(2,'Mumunski','Bubunski',24,'2020-11-11',67000.00,3,NULL,6),(3,'Denis','Benson',24,'2020-11-20',6.20,4,NULL,7),(4,'Boris','Ivanov',27,'2019-11-11',5815.00,1,NULL,6),(5,'Gosho','Schemata',26,'2020-11-11',9999.00,3,NULL,8),(6,'Max','NqkoiSiTam',90,'1959-11-11',5.12,7,NULL,8),(7,'Gari','Kasparow',50,'2025-11-11',6918.00,2,NULL,5),(8,'Terry','Davis',48,'2013-03-04',500000.00,1,NULL,1),(9,'Kris','Tavshana',22,'2024-05-22',6731.00,3,NULL,4),(20,'Georgi','Vasilev',44,'2020-03-11',3600.00,2,NULL,3),(21,'Ivan','Kostov',31,'2022-05-18',2400.00,2,NULL,2),(22,'Plamen','Rusev',29,'2023-04-02',2100.00,2,NULL,2),(23,'Nikolay','Hristov',38,'2021-06-21',1800.00,2,NULL,6),(24,'Petar','Iliev',41,'2020-09-09',2000.00,2,NULL,6),(25,'Stoyan','Petkov',35,'2022-11-14',1700.00,2,NULL,8),(26,'Radoslav','Angelov',28,'2023-01-19',1500.00,2,NULL,8),(27,'Martin','Stoyanov',46,'2019-07-07',3900.00,3,NULL,3),(28,'Dimitar','Naydenov',34,'2021-10-12',2600.00,3,NULL,2),(29,'Viktor','Popov',30,'2022-08-01',1600.00,3,NULL,6),(30,'Asen','Kirov',39,'2020-05-26',1900.00,3,NULL,6),(31,'Kaloyan','Panchev',26,'2024-02-10',1500.00,3,NULL,7),(32,'Borislav','Nikov',42,'2018-12-03',1800.00,3,NULL,8),(33,'Hristo','Yankov',37,'2021-03-16',1700.00,3,NULL,8),(34,'Petko','Ivanov',29,'2023-06-20',1600.00,3,NULL,8),(35,'Stefan','Kolev',50,'2017-04-22',4000.00,4,NULL,3),(36,'Milen','Georgiev',33,'2022-09-18',2300.00,4,NULL,2),(37,'Daniel','Marinov',27,'2024-01-11',1500.00,4,NULL,6),(38,'Yordan','Dimitrov',45,'2019-08-30',2100.00,4,NULL,6),(39,'Valentin','Radev',41,'2020-10-25',1900.00,4,NULL,6),(40,'Todor','Zhelev',36,'2021-05-05',1600.00,4,NULL,8),(41,'Angel','Petrov',32,'2022-02-14',1500.00,4,NULL,8),(42,'Nikolay','Todorov',48,'2016-06-01',3700.00,5,NULL,3),(43,'Krasimir','Bozhkov',18,'2025-09-09',2800.00,5,NULL,2),(44,'Ivan','Mitev',28,'2023-03-17',1700.00,5,NULL,6),(45,'Petar','Dachev',39,'2020-11-23',2000.00,5,NULL,6),(46,'Stanislav','Markov',31,'2022-07-04',1500.00,5,NULL,8),(47,'Rumen','Atanasov',44,'2019-01-15',1800.00,5,NULL,8),(48,'Georgi','Lazarov',34,'2021-04-19',1700.00,5,NULL,8),(49,'Veselin','Kolev',52,'2015-02-08',3800.00,6,NULL,3),(50,'Ivo','Penev',29,'2023-05-27',2200.00,6,NULL,2),(51,'Simeon','Ivanov',36,'2021-06-16',1600.00,6,NULL,6),(52,'Borislav','Kanev',41,'2019-09-29',1900.00,6,NULL,6),(53,'Dimitar','Stanchev',33,'2022-12-01',1700.00,6,NULL,8),(54,'Rosen','Dobrev',38,'2020-08-11',1500.00,6,NULL,8),(55,'Plamen','Angelov',47,'2018-03-19',3400.00,7,NULL,3),(56,'Hristo','Velikov',34,'2021-07-22',2600.00,7,NULL,2),(57,'Kiril','Pavlov',28,'2023-10-05',1800.00,7,NULL,6),(58,'Tihomir','Petrov',40,'2020-02-28',2100.00,7,NULL,6),(59,'Neno','Krastev',31,'2022-06-14',1600.00,7,NULL,7),(60,'Yavor','Tenev',36,'2021-09-01',1700.00,7,NULL,8),(61,'Vladimir','Ilchev',44,'2019-12-20',1900.00,7,NULL,8),(62,'Radoslav','Nikolov',49,'2017-01-13',3950.00,8,NULL,3),(63,'Petyo','Hadjiev',19,'2024-10-08',2900.00,8,NULL,2),(64,'Stancho','Radev',42,'2019-04-25',2000.00,8,NULL,6),(65,'Ivan','Angelov',34,'2022-05-02',1700.00,8,NULL,6),(66,'Mitko','Popov',29,'2023-11-11',1500.00,8,NULL,8),(67,'Todor','Mihaylov',45,'2018-06-30',1900.00,8,NULL,8),(68,'Emil','Dimitrov',51,'2016-09-09',3600.00,9,NULL,3),(69,'Bozhidar','Peev',32,'2022-01-21',2500.00,9,NULL,2),(70,'Lyubomir','Zhelev',39,'2020-04-07',1900.00,9,NULL,6),(71,'Kalin','Marchev',27,'2024-02-03',1600.00,9,NULL,6),(72,'Rumen','Tsvetkov',41,'2019-08-12',1800.00,9,NULL,8),(73,'Hristo','Zlatkov',35,'2021-11-18',1700.00,9,NULL,8),(74,'Tsvetan','Iliev',55,'2014-05-15',4000.00,10,NULL,3),(75,'Nedyalko','Petrov',38,'2020-06-03',3000.00,10,NULL,2),(76,'Dobromir','Yordanov',33,'2022-03-14',2000.00,10,NULL,6),(77,'Lyubo','Hristov',46,'2018-09-22',2200.00,10,NULL,6),(78,'Nikola','Stanev',29,'2023-07-10',1500.00,10,NULL,8),(79,'Georgi','Malchev',41,'2019-02-17',1800.00,10,NULL,8),(80,'Ivan','Kolev',34,'2021-05-12',3000.00,NULL,1,5),(81,'Petar','Dimitrov',29,'2022-03-18',1700.00,NULL,1,4),(82,'Georgi','Nachev',41,'2020-11-07',1900.00,NULL,1,4),(83,'Milen','Todorov',36,'2019-08-25',2100.00,NULL,1,4),(84,'Hristo','Ivanov',27,'2023-06-14',1500.00,NULL,1,4),(85,'Radoslav','Angelov',45,'2018-02-10',2200.00,NULL,1,4),(86,'Borislav','Nikov',39,'2020-09-03',1800.00,NULL,1,9),(87,'Stoyan','Petkov',33,'2021-12-01',1600.00,NULL,1,9),(88,'Dimitar','Iliev',47,'2017-04-19',2300.00,NULL,1,9),(89,'Kaloyan','Panchev',31,'2022-07-08',1900.00,NULL,1,9),(90,'Nikolay','Hristov',48,'2016-01-22',3200.00,NULL,2,5),(91,'Martin','Stoyanov',35,'2021-10-15',2000.00,NULL,2,4),(92,'Viktor','Popov',28,'2023-02-09',1500.00,NULL,2,4),(93,'Asen','Kirov',42,'2019-06-27',2100.00,NULL,2,4),(94,'Plamen','Rusev',37,'2020-08-11',1800.00,NULL,2,4),(95,'Angel','Petrov',44,'2018-12-05',2400.00,NULL,2,9),(96,'Yordan','Dimitrov',31,'2022-09-14',1700.00,NULL,2,9),(97,'Todor','Zhelev',39,'2020-03-03',2000.00,NULL,2,9),(98,'Stanislav','Markov',26,'2024-01-18',1500.00,NULL,2,9),(99,'Stefan','Kolev',52,'2014-05-09',3500.00,NULL,3,5),(100,'Daniel','Marinov',29,'2023-04-01',1600.00,NULL,3,4),(101,'Valentin','Radev',41,'2019-07-23',2100.00,NULL,3,4),(102,'Krasimir','Bozhkov',36,'2020-10-30',1900.00,NULL,3,4),(103,'Petko','Ivanov',33,'2021-11-17',1800.00,NULL,3,4),(104,'Rumen','Atanasov',46,'2018-02-14',2200.00,NULL,3,4),(105,'Georgi','Lazarov',38,'2020-06-08',2000.00,NULL,3,9),(106,'Hristo','Yankov',34,'2021-09-26',1700.00,NULL,3,9),(107,'Vladimir','Ilchev',49,'2016-12-12',2400.00,NULL,3,9),(108,'Neno','Krastev',28,'2023-08-04',1600.00,NULL,3,9),(109,'Leoni','Dimitrova',26,'2022-03-19',6700.00,NULL,4,5),(110,'Ivo','Penev',32,'2022-05-21',1800.00,NULL,4,4),(111,'Simeon','Ivanov',39,'2020-01-28',2100.00,NULL,4,4),(112,'Dobromir','Yordanov',27,'2024-02-02',1500.00,NULL,4,4),(113,'Lyubo','Hristov',44,'2018-09-09',2000.00,NULL,4,4),(114,'Nikola','Stanev',35,'2021-06-16',1700.00,NULL,4,9),(115,'Georgi','Malchev',41,'2019-11-24',2300.00,NULL,4,9),(116,'Tsvetan','Iliev',53,'2014-04-05',2500.00,NULL,4,9),(117,'Rosen','Dobrev',30,'2022-10-01',1600.00,NULL,4,9),(118,'Plamen','Angelov',47,'2017-07-14',3100.00,NULL,5,5),(119,'Hristo','Velikov',34,'2021-03-11',1900.00,NULL,5,4),(120,'Kiril','Pavlov',29,'2023-06-27',1600.00,NULL,5,4),(121,'Tihomir','Petrov',40,'2019-02-18',2200.00,NULL,5,4),(122,'Mitko','Popov',26,'2024-01-09',1500.00,NULL,5,4),(123,'Yavor','Tenev',36,'2020-05-20',1800.00,NULL,5,9),(124,'Veselin','Kolev',48,'2016-08-03',2400.00,NULL,5,9),(125,'Radoslav','Nikolov',33,'2021-12-15',1700.00,NULL,5,9),(126,'Petyo','Hadjiev',41,'2019-04-28',2100.00,NULL,5,9),(127,'Tsvetan','Kirov',55,'2013-01-17',3400.00,NULL,6,5),(128,'Nedyalko','Petrov',38,'2020-06-03',2000.00,NULL,6,4),(129,'Dobri','Georgiev',31,'2022-02-14',1700.00,NULL,6,4),(130,'Lyubomir','Zhelev',46,'2018-09-22',2200.00,NULL,6,4),(131,'Stancho','Radev',28,'2023-07-10',1500.00,NULL,6,4),(132,'Nikola','Kanev',42,'2019-11-01',1800.00,NULL,6,9),(133,'Georgi','Tsvetkov',35,'2021-05-19',2300.00,NULL,6,9),(134,'Ivan','Malinov',50,'2015-10-06',2500.00,NULL,6,9),(135,'Petar','Bozhilov',29,'2023-03-22',1600.00,NULL,6,9),(136,'Denis','Hasan',18,'2024-10-23',35.00,4,NULL,2),(137,'Yavor','Tinkov',18,'2024-12-27',4000.00,4,NULL,8);
/*!40000 ALTER TABLE `workers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-16 21:35:41

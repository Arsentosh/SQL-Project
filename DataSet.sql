CREATE TABLE `cities` (
  `CityID` int NOT NULL,
  `Name` varchar(25) NOT NULL,
  `CountryID` int NOT NULL,
  PRIMARY KEY (`CityID`),
  KEY `FN_CountryID_idx` (`CountryID`),
  CONSTRAINT `FN_CountryID` FOREIGN KEY (`CountryID`) REFERENCES `countries` (`CountryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `nagibators`.`cities`
(`CityID`,
`Name`,
`CountryID`)
VALUES
(<{CityID: }>,
<{Name: }>,
<{CountryID: }>);
CREATE TABLE `countries` (
  `CountryID` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`CountryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `nagibators`.`countries`
(`CountryID`,
`Name`)
VALUES
(<{CountryID: }>,
<{Name: }>);
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
INSERT INTO `nagibators`.`customers`
(`CustomersID`,
`CityID`,
`first_name`,
`last_name`,
`phoneNumber`,
`email`,
`address`)
VALUES
(<{CustomersID: }>,
<{CityID: }>,
<{first_name: }>,
<{last_name: }>,
<{phoneNumber: }>,
<{email: }>,
<{address: }>);
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
INSERT INTO `nagibators`.`deliveries`
(`DeliveryID`,
`FactoryID`,
`WarehouseID`,
`VehicleID`,
`WorkerID`)
VALUES
(<{DeliveryID: }>,
<{FactoryID: }>,
<{WarehouseID: }>,
<{VehicleID: }>,
<{WorkerID: }>);
CREATE TABLE `departments` (
  `iddepartments` int NOT NULL AUTO_INCREMENT,
  `department` varchar(30) NOT NULL,
  PRIMARY KEY (`iddepartments`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `nagibators`.`departments`
(`iddepartments`,
`department`)
VALUES
(<{iddepartments: }>,
<{department: }>);
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
INSERT INTO `nagibators`.`factories`
(`FactoryID`,
`CityId`,
`Address`,
`DaysWithoutAccident`,
`CurrentlyProducing`)
VALUES
(<{FactoryID: }>,
<{CityId: }>,
<{Address: }>,
<{DaysWithoutAccident: }>,
<{CurrentlyProducing: }>);
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
INSERT INTO `nagibators`.`orders`
(`OrderID`,
`WarehouseID`,
`CityID`,
`CustomerID`,
`StockID`,
`VehicleID`,
`WorkerID`,
`PaymentsID`,
`AmountOfStock`,
`DepartmentDate`)
VALUES
(<{OrderID: }>,
<{WarehouseID: }>,
<{CityID: }>,
<{CustomerID: }>,
<{StockID: }>,
<{VehicleID: }>,
<{WorkerID: }>,
<{PaymentsID: }>,
<{AmountOfStock: }>,
<{DepartmentDate: }>);
CREATE TABLE `payments` (
  `idpayments` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `CustomersID` int NOT NULL,
  `CardNum` bigint DEFAULT NULL,
  `PaymentType` enum('cash','card','online') DEFAULT NULL,
  `isFinished` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpayments`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `nagibators`.`payments`
(`idpayments`,
`price`,
`CustomersID`,
`CardNum`,
`PaymentType`,
`isFinished`)
VALUES
(<{idpayments: }>,
<{price: }>,
<{CustomersID: }>,
<{CardNum: }>,
<{PaymentType: }>,
<{isFinished: 0}>);
CREATE TABLE `stock_available` (
  `idStocks` int NOT NULL,
  `warehouseID` int NOT NULL,
  `amount` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idStocks`,`warehouseID`),
  KEY `WarehouseID_idx` (`warehouseID`),
  CONSTRAINT `FN_StockID` FOREIGN KEY (`idStocks`) REFERENCES `stock_types` (`StockID`),
  CONSTRAINT `FN_WarehouseID` FOREIGN KEY (`warehouseID`) REFERENCES `warehouses` (`WarehouseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `nagibators`.`stock_available`
(`idStocks`,
`warehouseID`,
`amount`)
VALUES
(<{idStocks: }>,
<{warehouseID: }>,
<{amount: 1}>);
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
INSERT INTO `nagibators`.`stock_imports`
(`MovementID`,
`StockID`,
`VehID`,
`WorkerID`,
`WarehouseID`,
`Amount`,
`Date`)
VALUES
(<{MovementID: }>,
<{StockID: }>,
<{VehID: }>,
<{WorkerID: }>,
<{WarehouseID: }>,
<{Amount: }>,
<{Date: }>);
CREATE TABLE `stock_types` (
  `StockID` int NOT NULL AUTO_INCREMENT,
  `StockName` varchar(45) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`StockID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `nagibators`.`stock_types`
(`StockID`,
`StockName`,
`Price`,
`Description`)
VALUES
(<{StockID: }>,
<{StockName: }>,
<{Price: }>,
<{Description: }>);
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
INSERT INTO `nagibators`.`vehicles`
(`idVehicle`,
`type`,
`makeandmodel`,
`Year`,
`VehCapacity`,
`WarehouseID`)
VALUES
(<{idVehicle: }>,
<{type: }>,
<{makeandmodel: }>,
<{Year: }>,
<{VehCapacity: }>,
<{WarehouseID: }>);
CREATE TABLE `warehouses` (
  `WarehouseID` int NOT NULL,
  `StreetAddress` varchar(45) NOT NULL,
  `CityID` int NOT NULL,
  `Capacity` int NOT NULL,
  UNIQUE KEY `WarehouseID_UNIQUE` (`WarehouseID`),
  KEY `CityID_idx` (`CityID`),
  CONSTRAINT `CityID` FOREIGN KEY (`CityID`) REFERENCES `cities` (`CityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `nagibators`.`warehouses`
(`WarehouseID`,
`StreetAddress`,
`CityID`,
`Capacity`)
VALUES
(<{WarehouseID: }>,
<{StreetAddress: }>,
<{CityID: }>,
<{Capacity: }>);
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
INSERT INTO `nagibators`.`workers`
(`idworker`,
`first_name`,
`last_name`,
`age`,
`hire_date`,
`salary`,
`warehouseID`,
`factoryID`,
`DepID`)
VALUES
(<{idworker: }>,
<{first_name: }>,
<{last_name: }>,
<{age: }>,
<{hire_date: }>,
<{salary: }>,
<{warehouseID: }>,
<{factoryID: }>,
<{DepID: }>);

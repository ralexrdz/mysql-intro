-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `beneficios`
--

DROP TABLE IF EXISTS `beneficios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beneficios` (
  `idbeneficios` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idbeneficios`),
  UNIQUE KEY `idbeneficios_UNIQUE` (`idbeneficios`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beneficios`
--

LOCK TABLES `beneficios` WRITE;
/*!40000 ALTER TABLE `beneficios` DISABLE KEYS */;
INSERT INTO `beneficios` VALUES (1,'Playera','Playera'),(2,'Gorra','Gorra'),(3,'Paraguas','Paraguas'),(4,'Consulta Médica','Consulta Médica'),(5,'Recarga Telefónica','Recarga Telefónica'),(6,'Capacitación','Capacitación');
/*!40000 ALTER TABLE `beneficios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beneficios_niveles`
--

DROP TABLE IF EXISTS `beneficios_niveles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beneficios_niveles` (
  `niveles_idniveles` int unsigned NOT NULL,
  `beneficios_idbeneficios` int NOT NULL,
  PRIMARY KEY (`niveles_idniveles`,`beneficios_idbeneficios`),
  KEY `fk_beneficios_niveles_beneficios1_idx` (`beneficios_idbeneficios`),
  CONSTRAINT `fk_beneficios_niveles_beneficios1` FOREIGN KEY (`beneficios_idbeneficios`) REFERENCES `beneficios` (`idbeneficios`),
  CONSTRAINT `fk_beneficios_niveles_niveles1` FOREIGN KEY (`niveles_idniveles`) REFERENCES `niveles` (`idniveles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beneficios_niveles`
--

LOCK TABLES `beneficios_niveles` WRITE;
/*!40000 ALTER TABLE `beneficios_niveles` DISABLE KEYS */;
INSERT INTO `beneficios_niveles` VALUES (1,1),(2,1),(3,1),(1,2),(2,2),(3,2),(4,2),(2,3),(3,3),(4,3),(3,4),(4,4),(4,5),(4,6);
/*!40000 ALTER TABLE `beneficios_niveles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `idclientes` int NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `nombres` varchar(45) DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `niveles_idniveles` int unsigned NOT NULL,
  PRIMARY KEY (`idclientes`),
  UNIQUE KEY `idclientes_UNIQUE` (`idclientes`),
  KEY `fk_clientes_niveles_idx` (`niveles_idniveles`),
  CONSTRAINT `fk_clientes_niveles` FOREIGN KEY (`niveles_idniveles`) REFERENCES `niveles` (`idniveles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Se conocen como CES, Clientes Especiales';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes_intereses`
--

DROP TABLE IF EXISTS `clientes_intereses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes_intereses` (
  `intereses_idintereses` int NOT NULL,
  `clientes_idclientes` int NOT NULL,
  PRIMARY KEY (`intereses_idintereses`,`clientes_idclientes`),
  KEY `fk_clientes_intereses_clientes1_idx` (`clientes_idclientes`),
  CONSTRAINT `fk_clientes_intereses_clientes1` FOREIGN KEY (`clientes_idclientes`) REFERENCES `clientes` (`idclientes`),
  CONSTRAINT `fk_clientes_intereses_intereses1` FOREIGN KEY (`intereses_idintereses`) REFERENCES `intereses` (`idintereses`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes_intereses`
--

LOCK TABLES `clientes_intereses` WRITE;
/*!40000 ALTER TABLE `clientes_intereses` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes_intereses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intereses`
--

DROP TABLE IF EXISTS `intereses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intereses` (
  `idintereses` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fercha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idintereses`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intereses`
--

LOCK TABLES `intereses` WRITE;
/*!40000 ALTER TABLE `intereses` DISABLE KEYS */;
/*!40000 ALTER TABLE `intereses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niveles`
--

DROP TABLE IF EXISTS `niveles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `niveles` (
  `idniveles` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL COMMENT '	',
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idniveles`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niveles`
--

LOCK TABLES `niveles` WRITE;
/*!40000 ALTER TABLE `niveles` DISABLE KEYS */;
INSERT INTO `niveles` VALUES (1,'CES','A partir de $5000'),(2,'Plata','De $5001 a $1000'),(3,'Oro','De $10001 a $20000'),(4,'Black','De $20001 en adelante');
/*!40000 ALTER TABLE `niveles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenes`
--

DROP TABLE IF EXISTS `ordenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenes` (
  `ordenid` int NOT NULL,
  `clientes_idclientes` int NOT NULL,
  `fercha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `tipo_entrega` enum('piso','domicilio') NOT NULL,
  `estatus` enum('lista','en curso') NOT NULL,
  `comentarios` varchar(45) DEFAULT NULL,
  `producto_productoid` int NOT NULL,
  PRIMARY KEY (`ordenid`,`producto_productoid`),
  KEY `fk_ordenes_clientes1_idx` (`clientes_idclientes`),
  KEY `fk_ordenes_producto1_idx` (`producto_productoid`),
  CONSTRAINT `fk_ordenes_clientes1` FOREIGN KEY (`clientes_idclientes`) REFERENCES `clientes` (`idclientes`),
  CONSTRAINT `fk_ordenes_producto1` FOREIGN KEY (`producto_productoid`) REFERENCES `producto` (`productoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes`
--

LOCK TABLES `ordenes` WRITE;
/*!40000 ALTER TABLE `ordenes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `productoid` int NOT NULL AUTO_INCREMENT,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `cantidad_altillo` int unsigned DEFAULT NULL,
  `cantidad_piso` int unsigned DEFAULT NULL,
  PRIMARY KEY (`productoid`),
  UNIQUE KEY `productoid_UNIQUE` (`productoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-28 17:59:55

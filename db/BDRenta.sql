-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: bdrenta
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `adquisicion`
--

DROP TABLE IF EXISTS `adquisicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adquisicion` (
  `idAdquisicion` int(11) NOT NULL,
  `idProveedorAdq` int(11) NOT NULL,
  `idEmpleadoAdq` int(11) NOT NULL,
  `FechaAdquisicion` date NOT NULL,
  `TotalAdquisicion` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idAdquisicion`,`idProveedorAdq`,`idEmpleadoAdq`),
  KEY `EmpleadoAdquisicion_idx` (`idEmpleadoAdq`),
  KEY `ProveedorAdquisicion` (`idProveedorAdq`),
  CONSTRAINT `EmpleadoAdquisicion` FOREIGN KEY (`idEmpleadoAdq`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `ProveedorAdquisicion` FOREIGN KEY (`idProveedorAdq`) REFERENCES `proveedor` (`idProveedor`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adquisicion`
--

LOCK TABLES `adquisicion` WRITE;
/*!40000 ALTER TABLE `adquisicion` DISABLE KEYS */;
INSERT INTO `adquisicion` VALUES (1,1,1,'2018-02-03',350750.00),(2,1,1,'2018-02-05',27900.00),(3,1,2,'2018-02-06',400500.00),(4,2,2,'2018-02-02',676321.75),(5,2,2,'2018-02-04',499999.99),(6,3,7,'2018-02-02',198654.50),(7,5,2,'2018-02-01',500000.00),(8,6,7,'2018-02-08',125670.90),(9,7,2,'2018-02-08',487500.65),(10,8,7,'2018-02-10',687230.00);
/*!40000 ALTER TABLE `adquisicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automovil`
--

DROP TABLE IF EXISTS `automovil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automovil` (
  `Matricula` varchar(10) NOT NULL,
  `NombreAuto` varchar(50) NOT NULL,
  `ColorAuto` varchar(45) NOT NULL,
  `ModeloAuto` int(4) NOT NULL,
  `Capacidad` int(2) NOT NULL,
  `Kilometraje` int(11) NOT NULL,
  `idSucursalAuto` int(11) NOT NULL,
  `MarcaAuto` int(11) NOT NULL,
  `TipoAuto` int(11) NOT NULL,
  PRIMARY KEY (`Matricula`),
  KEY `SucursalAutomovil_idx` (`idSucursalAuto`),
  KEY `Automovil_MarcaAutomovil_idx` (`MarcaAuto`),
  KEY `TipoAutoAutomovil_idx` (`TipoAuto`),
  CONSTRAINT `Automovil_MarcaAutomovil` FOREIGN KEY (`MarcaAuto`) REFERENCES `automovil_marca` (`idMarca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `SucursalAutomovil` FOREIGN KEY (`idSucursalAuto`) REFERENCES `sucursal` (`idSucursal`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `TipoAutoAutomovil` FOREIGN KEY (`TipoAuto`) REFERENCES `tipo_auto` (`idTipoAuto`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automovil`
--

LOCK TABLES `automovil` WRITE;
/*!40000 ALTER TABLE `automovil` DISABLE KEYS */;
INSERT INTO `automovil` VALUES ('AWT-931','Koleos','Azul Marino',2017,5,24571,2,7,4),('AZB-456','Golf','Azul Marino',2010,4,356876,1,1,1),('COL-498','Mustang','Rojo',2010,5,300456,2,2,7),('DEL-34-56','i10','Gris',2015,4,75897,3,8,3),('FDD-31-72','Camry','Blanco',2000,6,379651,3,6,5),('LIZ-501','Lobo','Negro',2005,3,267412,1,2,6),('RDG-541','Kicks','Blanco',2016,4,91756,2,5,2),('SAQ-185','Beetle','Amarillo',2007,5,267561,2,1,9),('TTL-45-66','SAIC','Cafe',2017,8,15896,3,3,8),('XET-737','Transporter Combi','Blanco',1985,8,478512,1,1,10);
/*!40000 ALTER TABLE `automovil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automovil_imagen`
--

DROP TABLE IF EXISTS `automovil_imagen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automovil_imagen` (
  `MatriculaAutomovilImagen` varchar(10) NOT NULL,
  `idImagenAutomovilImagen` int(11) NOT NULL,
  `DescImg` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MatriculaAutomovilImagen`,`idImagenAutomovilImagen`),
  KEY `Imagen-AutomovilImagen_idx` (`idImagenAutomovilImagen`),
  CONSTRAINT `Automovil-AutomovilImagen` FOREIGN KEY (`MatriculaAutomovilImagen`) REFERENCES `automovil` (`Matricula`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `Imagen-AutomovilImagen` FOREIGN KEY (`idImagenAutomovilImagen`) REFERENCES `imagen` (`idImagen`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automovil_imagen`
--

LOCK TABLES `automovil_imagen` WRITE;
/*!40000 ALTER TABLE `automovil_imagen` DISABLE KEYS */;
/*!40000 ALTER TABLE `automovil_imagen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automovil_marca`
--

DROP TABLE IF EXISTS `automovil_marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automovil_marca` (
  `idMarca` int(11) NOT NULL,
  `NomMarca` varchar(70) NOT NULL,
  PRIMARY KEY (`idMarca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automovil_marca`
--

LOCK TABLES `automovil_marca` WRITE;
/*!40000 ALTER TABLE `automovil_marca` DISABLE KEYS */;
INSERT INTO `automovil_marca` VALUES (1,'Volkswagen\r'),(2,'Ford\r'),(3,'General Motors \r'),(5,'Nissan\r'),(6,'Toyota\r'),(7,'Renault\r'),(8,'Hunday\r'),(9,'KIA\r'),(10,'Seat');
/*!40000 ALTER TABLE `automovil_marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `RFCCliente` varchar(15) NOT NULL,
  PRIMARY KEY (`idCliente`),
  CONSTRAINT `PersonaCliente` FOREIGN KEY (`idCliente`) REFERENCES `persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (8,'FORLCI870129'),(9,'MAVLJR850623\r'),(10,'DEBTR910521\r'),(11,'BABRJ770301\r'),(12,'MOLPL880917\r'),(13,'CAZRJJ951012\r'),(14,'PEGRZ980925\r'),(15,'MISLMA901111');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_adquisicion`
--

DROP TABLE IF EXISTS `detalle_adquisicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_adquisicion` (
  `idDetalle_Adquisicion` int(11) NOT NULL,
  `idAdquisicionDetalle_Adq` int(11) NOT NULL,
  `NombreAutomovil` varchar(50) NOT NULL,
  `Modelo` int(4) NOT NULL,
  `Unidades` int(11) NOT NULL,
  `PrecioU` decimal(10,2) NOT NULL,
  `TotalDet` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idDetalle_Adquisicion`,`idAdquisicionDetalle_Adq`),
  KEY `AdquisicionDetalle_Adquisicion_idx` (`idAdquisicionDetalle_Adq`),
  CONSTRAINT `AdquisicionDetalle_Adquisicion` FOREIGN KEY (`idAdquisicionDetalle_Adq`) REFERENCES `adquisicion` (`idAdquisicion`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_adquisicion`
--

LOCK TABLES `detalle_adquisicion` WRITE;
/*!40000 ALTER TABLE `detalle_adquisicion` DISABLE KEYS */;
INSERT INTO `detalle_adquisicion` VALUES (1,1,'Golf',2010,1,350750.00,350750.00),(2,1,'Transporter Combi',1985,1,27900.00,27900.00),(3,1,'Beetle',2007,1,400500.00,400500.00),(4,1,'Mustang',2010,1,676321.75,676321.75),(5,1,'Lobo',2005,1,499999.99,499999.99),(6,1,'SAIC',2017,1,198654.50,198654.50),(7,1,'Kicks',2016,1,500000.00,500000.00),(8,1,'Camrv',2000,1,125670.90,125670.90),(9,1,'Koleos',2017,1,487500.65,487500.65),(10,1,'i10',2015,1,687230.00,687230.00);
/*!40000 ALTER TABLE `detalle_adquisicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_renta`
--

DROP TABLE IF EXISTS `detalle_renta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_renta` (
  `idDetalle_Renta` int(11) NOT NULL,
  `idRentaDetalle_Renta` int(11) NOT NULL,
  `idTipoServDetalle_Renta` int(11) NOT NULL,
  `UnidadesDet_Rent` int(11) NOT NULL,
  `TotalDet_Rent` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idDetalle_Renta`,`idRentaDetalle_Renta`),
  KEY `RentaDetalle_Renta_idx` (`idRentaDetalle_Renta`),
  KEY `Tipo_ServicioDetalle_Renta_idx` (`idTipoServDetalle_Renta`),
  CONSTRAINT `RentaDetalle_Renta` FOREIGN KEY (`idRentaDetalle_Renta`) REFERENCES `renta` (`idRenta`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `Tipo_ServicioDetalle_Renta` FOREIGN KEY (`idTipoServDetalle_Renta`) REFERENCES `tipo_servicio` (`idTipoServicio`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_renta`
--

LOCK TABLES `detalle_renta` WRITE;
/*!40000 ALTER TABLE `detalle_renta` DISABLE KEYS */;
INSERT INTO `detalle_renta` VALUES (1,1,3,1,700.00),(2,1,1,1,300.00),(3,1,1,1,300.00),(3,2,4,2,100.00),(4,1,3,1,700.00),(5,1,3,1,700.00);
/*!40000 ALTER TABLE `detalle_renta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL,
  `NSS` int(11) NOT NULL,
  `Tipo` int(11) NOT NULL,
  PRIMARY KEY (`idEmpleado`),
  KEY `TipoEmpleadoEmpleado_idx` (`Tipo`),
  CONSTRAINT `PersonaEmpleado ` FOREIGN KEY (`idEmpleado`) REFERENCES `persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `TipoEmpleadoEmpleado` FOREIGN KEY (`Tipo`) REFERENCES `tipo_empleado` (`idTipoEmpleado`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,970315102,1),(2,641020610,1),(3,900258593,2),(4,870624647,2),(5,950808468,2),(6,920524657,2),(7,730107758,1);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagen`
--

DROP TABLE IF EXISTS `imagen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagen` (
  `idImagen` int(11) NOT NULL AUTO_INCREMENT,
  `NombreImagen` varchar(45) NOT NULL,
  `Extension` varchar(5) NOT NULL,
  `ImgB` mediumblob NOT NULL,
  PRIMARY KEY (`idImagen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagen`
--

LOCK TABLES `imagen` WRITE;
/*!40000 ALTER TABLE `imagen` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `idPersona` int(11) NOT NULL,
  `NomPersona` varchar(50) NOT NULL,
  `ApPatPersona` varchar(40) NOT NULL,
  `ApMatPersona` varchar(40) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `EstadoPersona` varchar(50) NOT NULL,
  `MunicipioPersona` varchar(50) NOT NULL,
  `CPPersona` int(11) NOT NULL,
  `CallePersona` varchar(60) NOT NULL,
  `ColoniaPersona` varchar(45) NOT NULL,
  PRIMARY KEY (`idPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'Manuel','Lopez','Salazar','Gfdc54','Ciudad de Mexico','Alvaro Obregon',42601,'Lirio','Arboledas\r'),(2,'Maria del Rosario',' Espinoza',' Resendiz','Fsa1v','Ciudad de Mexico','Azcapotzalco',20822,'Zempahuacan','Del Gas\r'),(3,'Jesus Alejandro','Contreras','Arriola','CEUL98q','Ciudad de Mexico','Gustavo A. Madero',12309,'Neptuno',' Nueva Indutrial Vallejo\r'),(4,'Eduardo','Ariza','Garcia','FDDDSD7','Estado de Mexico','Tlalnepantla de Baz',54174,'Nicolas Bravo','Cola de Caballo\r'),(5,'Amairani','Oropeza','Silva','bqlop98y','Estado de Mexico','Tepotzotlan',44901,'Uno','Canadas de Cisneros\r'),(6,'Ismael','Rojas','Herrera','wwwhttp77','Estado de Mexico','Tlalnepantla de Baz',54120,'Oceano Pacifico','Ex Ejido San Lucas\r'),(7,'Gloria','Mujica','Corpus','GmCodxx9s12','Ciudad de Mexico','Miguel Hidalgo',67891,'Manuel Gutierrez Najera','Maravillas\r'),(8,'Cristian','Roldan','Flores','cvcpcx762','Ciudad de Mexico','Xochimilco',12953,'Paseo de las Flores','Moctezuma\r'),(9,'Jose Rafael','Martinez','Valenzuela','eyb45wP','Ciudad de Mexico','Cuauhtemoc',68300,'Av. 20 de noviembre','Centro\r'),(10,'Rosa','Delgado','Blanco','roSaDb564','Ciudad de Mexico','Iztacalco',34189,'Francisco I. Madero','Juventud Rosas\r'),(11,'Jesus Emmanuel','Bautista','Bravo','cpcvsyw23','Ciudad de Mexico','Iztacalco',34561,'Calle 3','Los Picos de Iztacalco\r'),(12,'Laura','Monroy','Lopez','dfcaXSS','Ciudad de Mexico','Iztacalco',33234,'Xoconoxtle','Infonavit Iztacalco\r'),(13,'Jose de Jesus','Camacho','Zarate','T5T6tgfcV','Ciudad de Mexico','Gustavo A. Madero',78923,'Irapuato','Claveria\r'),(14,'Zoe','Perez','Garcia','zOy230299','Ciudad de Mexico','Gustavo A. Madero',76541,'Poniente 52','Obrero Popular\r'),(15,'Marco Antonio','Miguel','Salgado','MMHFJ543','Ciudad de Mexico','Miguel Hidalgo',56123,'','Lago Superior');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona_correo`
--

DROP TABLE IF EXISTS `persona_correo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona_correo` (
  `idPersonaPerC` int(11) NOT NULL,
  `CorreoPerC` varchar(35) NOT NULL,
  PRIMARY KEY (`idPersonaPerC`,`CorreoPerC`),
  CONSTRAINT `PersonaPersona_Correo` FOREIGN KEY (`idPersonaPerC`) REFERENCES `persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona_correo`
--

LOCK TABLES `persona_correo` WRITE;
/*!40000 ALTER TABLE `persona_correo` DISABLE KEYS */;
INSERT INTO `persona_correo` VALUES (1,'manuelLS007@gmail.com\r'),(2,'MariaRoszAriO1@hotmail.com.mx\r'),(2,'maRos2318@yahoo.com.mx\r'),(3,'deathAzul15@live.com\r'),(4,'maquinacementera1001@hotmail.com	\r'),(5,'amairaniBonis987@outlook.com\r'),(5,'laChiquiz@hotmail.com\r'),(6,'ismaRojHerMex@gmail.com\r'),(7,'gloryInParis77@yahoo.com\r'),(8,'criiizRoldanF98@outlook.com\r'),(9,'josraMartiVale5@hotmail.com\r'),(10,'rositaDelgado</3@gamil.com\r'),(11,'jisusAmerica43@hotmail.com\r'),(12,'lauMonLop124@outlook.com\r'),(13,'XDCXyoutube@gmail.com\r'),(14,'zoePerezGarcia01@hotmail.com\r'),(15,'maAntonioMigSalgadoAdmn@outlook.com');
/*!40000 ALTER TABLE `persona_correo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona_telefono`
--

DROP TABLE IF EXISTS `persona_telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona_telefono` (
  `idPersonaPerT` int(11) NOT NULL,
  `TelefonoPerT` varchar(15) NOT NULL,
  PRIMARY KEY (`idPersonaPerT`,`TelefonoPerT`),
  CONSTRAINT `PersonaPerosna_Correo` FOREIGN KEY (`idPersonaPerT`) REFERENCES `persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona_telefono`
--

LOCK TABLES `persona_telefono` WRITE;
/*!40000 ALTER TABLE `persona_telefono` DISABLE KEYS */;
INSERT INTO `persona_telefono` VALUES (1,'55-87-09-12-73\r'),(1,'57-43-45-11\r'),(2,'22-27-88-43\r'),(3,'55-65-21-56-08\r'),(5,'55-95-51-73-55\r'),(6,'55-17-43-28-01\r'),(6,'55-45-79-12-99\r'),(6,'86-95-67-18\r'),(7,'55-42-67-18-34\r'),(8,'55-43-65-78-09\r'),(9,'55-55-45-09-38\r'),(10,'55-18-63-90-43\r'),(11,'55-26-30-87-31\r'),(11,'55-31-85-90-65\r'),(12,'55-13-67-89-15\r'),(13,'55-56-88-36-60\r'),(14,'55-67-52-11-03\r'),(15,'55-18-42-68-93\r'),(15,'76-35-53-10');
/*!40000 ALTER TABLE `persona_telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `idProveedor` int(11) NOT NULL,
  `NombreProv` varchar(60) NOT NULL,
  PRIMARY KEY (`idProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Volkswagen de Mexico S.A. DE C.V. \r'),(2,'Ford Motor Company S.A DE C.V. \r'),(3,'General Motors de Mexico S.DE R.L DE C.V.\r'),(5,'Nissan Motor Company S.A DE C.V.\r'),(6,'Toyota Motor Sales Mexico S. R.L. C.V.\r'),(7,'Renault Mexico S.A DE C.V.\r'),(8,'Hunday Motor Sales Mexico S.A. DE C.V.\r'),(9,'KIA Motors Mexico S.A. DE C.V.\r'),(10,'Seat S.A.');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor_correo`
--

DROP TABLE IF EXISTS `proveedor_correo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor_correo` (
  `idProveedorProvC` int(11) NOT NULL,
  `CorreoProvC` varchar(35) NOT NULL,
  PRIMARY KEY (`idProveedorProvC`,`CorreoProvC`),
  CONSTRAINT `ProveedorProveedor_Correo` FOREIGN KEY (`idProveedorProvC`) REFERENCES `proveedor` (`idProveedor`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor_correo`
--

LOCK TABLES `proveedor_correo` WRITE;
/*!40000 ALTER TABLE `proveedor_correo` DISABLE KEYS */;
INSERT INTO `proveedor_correo` VALUES (1,'volkswagenmexico@vwm.com\r'),(2,'fordsalesmexico@fordcompany.com\r'),(3,'gmsalesMexico@generalmotors.com\r'),(5,'nissanmx@nissanmc.com\r'),(6,'toyotamotorcompanysales@toyota.com\r'),(7,'renaultsales@renault.com\r'),(8,'hundayMexicoSales@kia.com\r'),(9,'KIAMotors@kia.com\r'),(10,'seatventas@seat.es');
/*!40000 ALTER TABLE `proveedor_correo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor_sucursal`
--

DROP TABLE IF EXISTS `proveedor_sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor_sucursal` (
  `idProveedorPS` int(11) NOT NULL,
  `idSucursalPS` int(11) NOT NULL,
  PRIMARY KEY (`idProveedorPS`,`idSucursalPS`),
  KEY `SucursalProveedor_Sucursal_idx` (`idSucursalPS`),
  CONSTRAINT `ProveedorPorveedor_Sucursal` FOREIGN KEY (`idProveedorPS`) REFERENCES `proveedor` (`idProveedor`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `SucursalProveedor_Sucursal` FOREIGN KEY (`idSucursalPS`) REFERENCES `sucursal` (`idSucursal`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor_sucursal`
--

LOCK TABLES `proveedor_sucursal` WRITE;
/*!40000 ALTER TABLE `proveedor_sucursal` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor_sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor_telefono`
--

DROP TABLE IF EXISTS `proveedor_telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor_telefono` (
  `idProveedorProvT` int(11) NOT NULL,
  `TelefonoProvT` varchar(25) NOT NULL,
  PRIMARY KEY (`TelefonoProvT`,`idProveedorProvT`),
  KEY `ProveedorProveedor_Telefono_idx` (`idProveedorProvT`),
  CONSTRAINT `ProveedorProveedor_Telefono` FOREIGN KEY (`idProveedorProvT`) REFERENCES `proveedor` (`idProveedor`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor_telefono`
--

LOCK TABLES `proveedor_telefono` WRITE;
/*!40000 ALTER TABLE `proveedor_telefono` DISABLE KEYS */;
INSERT INTO `proveedor_telefono` VALUES (1,'01-222-3035969\r'),(1,'55-50-70-88-00\r'),(2,'01-800-201-99-98\r'),(2,'01-800-719-84-66\r'),(3,'01-800-508-0000 \r'),(5,'01-449-139-5871\r'),(5,'55-53-33-99-00\r'),(6,'55-86-47-80-00\r'),(6,'800-331-4331 \r'),(7,'01-449-139-5872\r'),(7,'55-51-33-60-80\r'),(8,'52-442-713-5330\r'),(8,'55-41-22-20-00\r'),(9,'01-5547-800-542\r'),(9,'55-28-81-19-00\r'),(10,'01-800-202-06-80'),(10,'01-800-835-7328\r');
/*!40000 ALTER TABLE `proveedor_telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `renta`
--

DROP TABLE IF EXISTS `renta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `renta` (
  `idRenta` int(11) NOT NULL,
  `idClienteRenta` int(11) NOT NULL,
  `MatriculaRenta` varchar(10) NOT NULL,
  `FechaInicio` date NOT NULL,
  `FechaFin` date NOT NULL,
  `Total` decimal(10,2) NOT NULL,
  `TipoPago` varchar(20) NOT NULL,
  PRIMARY KEY (`idRenta`,`idClienteRenta`,`MatriculaRenta`),
  KEY `ClienteRenta_idx` (`idClienteRenta`),
  KEY `AutomovilRenta_idx` (`MatriculaRenta`),
  CONSTRAINT `AutomovilRenta` FOREIGN KEY (`MatriculaRenta`) REFERENCES `automovil` (`Matricula`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `ClienteRenta` FOREIGN KEY (`idClienteRenta`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `renta`
--

LOCK TABLES `renta` WRITE;
/*!40000 ALTER TABLE `renta` DISABLE KEYS */;
INSERT INTO `renta` VALUES (1,8,'AZB-456','2018-02-18','2018-02-21',700.00,'Efectivo\r'),(2,9,'RDG-541','2018-02-19','2018-02-20',300.00,'Tarjeta de debito\r'),(3,8,'AZB-456','2018-02-24','2018-02-27',400.00,'Efectivo\r'),(4,10,'SAQ-185','2018-03-01','2018-03-07',700.00,'Deposito\r'),(5,8,'COL-498','2018-03-03','2018-03-09',700.00,'Tarjeta de credito\r');
/*!40000 ALTER TABLE `renta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sucursal` (
  `idSucursal` int(11) NOT NULL AUTO_INCREMENT,
  `NomSucursal` varchar(50) NOT NULL,
  `EstadoSucursal` varchar(30) NOT NULL,
  `ColoniaSucursal` varchar(45) NOT NULL,
  `CalleSucursal` varchar(45) NOT NULL,
  `CPSucursal` int(11) NOT NULL,
  `TelSucursal` varchar(20) NOT NULL,
  PRIMARY KEY (`idSucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (1,'Presta Autos Azcapotzalco','Ciudad de Mexico','Claveria','Miguel Hidalgo',20134,'55-12-45-67-90\r'),(2,'Presta Autos Centro','Ciudad de Mexico','Centro','Eje Central Lazaro Cardenas',10345,'55-89-12-44-10\r'),(3,'Presta Autos Santa Monica','Estado de Mexico','Tlalnepantla Centro','Av. Santa Monica',24569,'55-45-61-23-09');
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal_persona`
--

DROP TABLE IF EXISTS `sucursal_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sucursal_persona` (
  `idSucursalSP` int(11) NOT NULL,
  `idPersonaSP` int(11) NOT NULL,
  PRIMARY KEY (`idSucursalSP`,`idPersonaSP`),
  KEY `PersonaSucursal_Persona_idx` (`idPersonaSP`),
  CONSTRAINT `PersonaSucursal_Persona` FOREIGN KEY (`idPersonaSP`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `SucursalSucursal_Persona` FOREIGN KEY (`idSucursalSP`) REFERENCES `sucursal` (`idSucursal`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal_persona`
--

LOCK TABLES `sucursal_persona` WRITE;
/*!40000 ALTER TABLE `sucursal_persona` DISABLE KEYS */;
INSERT INTO `sucursal_persona` VALUES (1,1),(2,2),(2,3),(2,4),(3,5),(1,6),(3,7);
/*!40000 ALTER TABLE `sucursal_persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_auto`
--

DROP TABLE IF EXISTS `tipo_auto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_auto` (
  `idTipoAuto` int(11) NOT NULL,
  `TipoAutomovil` varchar(50) NOT NULL,
  PRIMARY KEY (`idTipoAuto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_auto`
--

LOCK TABLES `tipo_auto` WRITE;
/*!40000 ALTER TABLE `tipo_auto` DISABLE KEYS */;
INSERT INTO `tipo_auto` VALUES (1,'Hatchback\r'),(2,'CUV\r'),(3,'Sedan\r'),(4,'SUV\r'),(5,'Station Wagon\r'),(6,'Pick Up\r'),(7,'Coupe\r'),(8,'Minivan\r'),(9,'Convertible\r'),(10,'Van\r'),(11,'Super Deportivo\r');
/*!40000 ALTER TABLE `tipo_auto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_empleado`
--

DROP TABLE IF EXISTS `tipo_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_empleado` (
  `idTipoEmpleado` int(11) NOT NULL,
  `DescEmpleado` varchar(50) NOT NULL,
  PRIMARY KEY (`idTipoEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_empleado`
--

LOCK TABLES `tipo_empleado` WRITE;
/*!40000 ALTER TABLE `tipo_empleado` DISABLE KEYS */;
INSERT INTO `tipo_empleado` VALUES (1,'Administrador\r'),(2,'Agente de Venta\r');
/*!40000 ALTER TABLE `tipo_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_servicio`
--

DROP TABLE IF EXISTS `tipo_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_servicio` (
  `idTipoServicio` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Descripción` varchar(80) NOT NULL,
  `Costo` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idTipoServicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_servicio`
--

LOCK TABLES `tipo_servicio` WRITE;
/*!40000 ALTER TABLE `tipo_servicio` DISABLE KEYS */;
INSERT INTO `tipo_servicio` VALUES (1,'Prestamo Corto','Renta de un vehiculo de uno a dos dias',300.00),(2,'Prestamo Mediano','Renta de un vehiculo de tres a dos cinco',500.00),(3,'Prestamo Largo','Renta de un vehiculo de seis a siete dias',700.00),(4,'Cargo Dia extra presamo corto','Pago extra por retardo en la entrega a corto plazo',50.00),(5,'Cargo Dia extra presamo mediano','Pago extra por retardo en la entrega a mediano plazo',70.00),(6,'Cargo Dia extra presamo largo','Pago extra por retardo en la entrega a largo plazo',100.00);
/*!40000 ALTER TABLE `tipo_servicio` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-21 13:03:14

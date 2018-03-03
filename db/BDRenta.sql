-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema BDRenta
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `BDRenta` ;

-- -----------------------------------------------------
-- Schema BDRenta
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BDRenta` DEFAULT CHARACTER SET utf8 ;
USE `BDRenta` ;

-- -----------------------------------------------------
-- Table `BDRenta`.`Proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDRenta`.`Proveedor` (
  `idProveedor` INT NOT NULL,
  `NombreProv` NVARCHAR(60) NOT NULL,
  PRIMARY KEY (`idProveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDRenta`.`Sucursal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDRenta`.`Sucursal` (
  `idSucursal` INT NOT NULL AUTO_INCREMENT,
  `NomSucursal` VARCHAR(50) NOT NULL,
  `EstadoSucursal` VARCHAR(30) NOT NULL,
  `ColoniaSucursal` VARCHAR(45) NOT NULL,
  `CalleSucursal` VARCHAR(45) NOT NULL,
  `CPSucursal` INT NOT NULL,
  `TelSucursal` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idSucursal`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDRenta`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDRenta`.`Persona` (
  `idPersona` INT NOT NULL,
  `NomPersona` NVARCHAR(50) NOT NULL,
  `ApPatPersona` NVARCHAR(40) NOT NULL,
  `ApMatPersona` NVARCHAR(40) NOT NULL,
  `Password` VARCHAR(50) NOT NULL,
  `EstadoPersona` VARCHAR(50) NOT NULL,
  `MunicipioPersona` VARCHAR(50) NOT NULL,
  `CPPersona` INT NOT NULL,
  `CallePersona` VARCHAR(60) NOT NULL,
  `ColoniaPersona` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPersona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDRenta`.`Tipo_Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDRenta`.`Tipo_Empleado` (
  `idTipoEmpleado` INT NOT NULL,
  `DescEmpleado` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idTipoEmpleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDRenta`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDRenta`.`Empleado` (
  `idEmpleado` INT NOT NULL,
  `NSS` INT NOT NULL,
  `Tipo` INT NOT NULL,
  PRIMARY KEY (`idEmpleado`),
  INDEX `TipoEmpleadoEmpleado_idx` (`Tipo` ASC),
  CONSTRAINT `PersonaEmpleado `
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `BDRenta`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `TipoEmpleadoEmpleado`
    FOREIGN KEY (`Tipo`)
    REFERENCES `BDRenta`.`Tipo_Empleado` (`idTipoEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDRenta`.`Adquisicion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDRenta`.`Adquisicion` (
  `idAdquisicion` INT NOT NULL,
  `idProveedorAdq` INT NOT NULL,
  `idEmpleadoAdq` INT NOT NULL,
  `FechaAdquisicion` DATE NOT NULL,
  `TotalAdquisicion` DOUBLE NOT NULL,
  PRIMARY KEY (`idAdquisicion`, `idProveedorAdq`, `idEmpleadoAdq`),
  INDEX `EmpleadoAdquisicion_idx` (`idEmpleadoAdq` ASC),
  CONSTRAINT `ProveedorAdquisicion`
    FOREIGN KEY (`idProveedorAdq`)
    REFERENCES `BDRenta`.`Proveedor` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `EmpleadoAdquisicion`
    FOREIGN KEY (`idEmpleadoAdq`)
    REFERENCES `BDRenta`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDRenta`.`Automovil_Marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDRenta`.`Automovil_Marca` (
  `idMarca` INT NOT NULL,
  `NomMarca` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`idMarca`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDRenta`.`Tipo_Auto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDRenta`.`Tipo_Auto` (
  `idTipoAuto` INT NOT NULL,
  `TipoAutomovil` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idTipoAuto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDRenta`.`Automovil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDRenta`.`Automovil` (
  `Matricula` VARCHAR(10) NOT NULL,
  `NombreAuto` VARCHAR(50) NOT NULL,
  `ColorAuto` VARCHAR(45) NOT NULL,
  `ModeloAuto` INT(4) NOT NULL,
  `Capacidad` INT(2) NOT NULL,
  `Kilometraje` INT NOT NULL,
  `idSucursalAuto` INT NOT NULL,
  `MarcaAuto` INT NOT NULL,
  `TipoAuto` INT NOT NULL,
  PRIMARY KEY (`Matricula`),
  INDEX `SucursalAutomovil_idx` (`idSucursalAuto` ASC),
  INDEX `Automovil_MarcaAutomovil_idx` (`MarcaAuto` ASC),
  INDEX `TipoAutoAutomovil_idx` (`TipoAuto` ASC),
  CONSTRAINT `SucursalAutomovil`
    FOREIGN KEY (`idSucursalAuto`)
    REFERENCES `BDRenta`.`Sucursal` (`idSucursal`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `Automovil_MarcaAutomovil`
    FOREIGN KEY (`MarcaAuto`)
    REFERENCES `BDRenta`.`Automovil_Marca` (`idMarca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `TipoAutoAutomovil`
    FOREIGN KEY (`TipoAuto`)
    REFERENCES `BDRenta`.`Tipo_Auto` (`idTipoAuto`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDRenta`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDRenta`.`Cliente` (
  `idCliente` INT NOT NULL,
  `RFCCliente` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idCliente`),
  CONSTRAINT `PersonaCliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `BDRenta`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDRenta`.`Renta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDRenta`.`Renta` (
  `idRenta` INT NOT NULL,
  `idClienteRenta` INT NOT NULL,
  `MatriculaRenta` VARCHAR(10) NOT NULL,
  `FechaInicio` DATE NOT NULL,
  `FechaFin` DATE NOT NULL,
  `Total` DOUBLE NOT NULL,
  `TipoPago` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idRenta`, `idClienteRenta`, `MatriculaRenta`),
  INDEX `ClienteRenta_idx` (`idClienteRenta` ASC),
  INDEX `AutomovilRenta_idx` (`MatriculaRenta` ASC),
  CONSTRAINT `ClienteRenta`
    FOREIGN KEY (`idClienteRenta`)
    REFERENCES `BDRenta`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `AutomovilRenta`
    FOREIGN KEY (`MatriculaRenta`)
    REFERENCES `BDRenta`.`Automovil` (`Matricula`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDRenta`.`Persona_Telefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDRenta`.`Persona_Telefono` (
  `idPersonaPerT` INT NOT NULL,
  `TelefonoPerT` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idPersonaPerT`, `TelefonoPerT`),
  CONSTRAINT `PersonaPerosna_Correo`
    FOREIGN KEY (`idPersonaPerT`)
    REFERENCES `BDRenta`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDRenta`.`Persona_Correo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDRenta`.`Persona_Correo` (
  `idPersonaPerC` INT NOT NULL,
  `CorreoPerC` VARCHAR(35) NOT NULL,
  PRIMARY KEY (`idPersonaPerC`, `CorreoPerC`),
  CONSTRAINT `PersonaPersona_Correo`
    FOREIGN KEY (`idPersonaPerC`)
    REFERENCES `BDRenta`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDRenta`.`Proveedor_Telefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDRenta`.`Proveedor_Telefono` (
  `idProveedorProvT` INT NOT NULL,
  `TelefonoProvT` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`TelefonoProvT`, `idProveedorProvT`),
  INDEX `ProveedorProveedor_Telefono_idx` (`idProveedorProvT` ASC),
  CONSTRAINT `ProveedorProveedor_Telefono`
    FOREIGN KEY (`idProveedorProvT`)
    REFERENCES `BDRenta`.`Proveedor` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDRenta`.`Proveedor_Correo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDRenta`.`Proveedor_Correo` (
  `idProveedorProvC` INT NOT NULL,
  `CorreoProvC` VARCHAR(35) NOT NULL,
  PRIMARY KEY (`idProveedorProvC`, `CorreoProvC`),
  CONSTRAINT `ProveedorProveedor_Correo`
    FOREIGN KEY (`idProveedorProvC`)
    REFERENCES `BDRenta`.`Proveedor` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDRenta`.`Sucursal_Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDRenta`.`Sucursal_Persona` (
  `idSucursalSP` INT NOT NULL,
  `idPersonaSP` INT NOT NULL,
  PRIMARY KEY (`idSucursalSP`, `idPersonaSP`),
  INDEX `PersonaSucursal_Persona_idx` (`idPersonaSP` ASC),
  CONSTRAINT `SucursalSucursal_Persona`
    FOREIGN KEY (`idSucursalSP`)
    REFERENCES `BDRenta`.`Sucursal` (`idSucursal`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `PersonaSucursal_Persona`
    FOREIGN KEY (`idPersonaSP`)
    REFERENCES `BDRenta`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDRenta`.`Proveedor_Sucursal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDRenta`.`Proveedor_Sucursal` (
  `idProveedorPS` INT NOT NULL,
  `idSucursalPS` INT NOT NULL,
  PRIMARY KEY (`idProveedorPS`, `idSucursalPS`),
  INDEX `SucursalProveedor_Sucursal_idx` (`idSucursalPS` ASC),
  CONSTRAINT `ProveedorPorveedor_Sucursal`
    FOREIGN KEY (`idProveedorPS`)
    REFERENCES `BDRenta`.`Proveedor` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `SucursalProveedor_Sucursal`
    FOREIGN KEY (`idSucursalPS`)
    REFERENCES `BDRenta`.`Sucursal` (`idSucursal`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDRenta`.`Imagen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDRenta`.`Imagen` (
  `idImagen` INT NOT NULL AUTO_INCREMENT,
  `NombreImagen` VARCHAR(45) NOT NULL,
  `Extension` VARCHAR(5) NOT NULL,
  `ImgB` MEDIUMBLOB NOT NULL,
  PRIMARY KEY (`idImagen`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDRenta`.`Automovil_Imagen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDRenta`.`Automovil_Imagen` (
  `MatriculaAutomovilImagen` VARCHAR(10) NOT NULL,
  `idImagenAutomovilImagen` INT NOT NULL,
  `DescImg` VARCHAR(45) NULL,
  PRIMARY KEY (`MatriculaAutomovilImagen`, `idImagenAutomovilImagen`),
  INDEX `Imagen-AutomovilImagen_idx` (`idImagenAutomovilImagen` ASC),
  CONSTRAINT `Imagen-AutomovilImagen`
    FOREIGN KEY (`idImagenAutomovilImagen`)
    REFERENCES `BDRenta`.`Imagen` (`idImagen`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `Automovil-AutomovilImagen`
    FOREIGN KEY (`MatriculaAutomovilImagen`)
    REFERENCES `BDRenta`.`Automovil` (`Matricula`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDRenta`.`Tipo_Servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDRenta`.`Tipo_Servicio` (
  `idTipoServicio` INT NOT NULL,
  `Nombre` VARCHAR(30) NOT NULL,
  `Descripción` VARCHAR(50) NOT NULL,
  `Dias` TINYINT(3) NOT NULL,
  PRIMARY KEY (`idTipoServicio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDRenta`.`Detalle_Renta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDRenta`.`Detalle_Renta` (
  `idDetalle_Renta` INT NOT NULL,
  `idRentaDetalle_Renta` INT NOT NULL,
  `idTipoServDetalle_Renta` INT NOT NULL,
  `UnidadesDet_Rent` INT NOT NULL,
  `TotalDet_Rent` DOUBLE NOT NULL,
  PRIMARY KEY (`idDetalle_Renta`, `idRentaDetalle_Renta`),
  INDEX `RentaDetalle_Renta_idx` (`idRentaDetalle_Renta` ASC),
  INDEX `Tipo_ServicioDetalle_Renta_idx` (`idTipoServDetalle_Renta` ASC),
  CONSTRAINT `RentaDetalle_Renta`
    FOREIGN KEY (`idRentaDetalle_Renta`)
    REFERENCES `BDRenta`.`Renta` (`idRenta`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `Tipo_ServicioDetalle_Renta`
    FOREIGN KEY (`idTipoServDetalle_Renta`)
    REFERENCES `BDRenta`.`Tipo_Servicio` (`idTipoServicio`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDRenta`.`Detalle_Adquisicion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDRenta`.`Detalle_Adquisicion` (
  `idDetalle_Adquisicion` INT NOT NULL,
  `idAdquisicionDetalle_Adq` INT NOT NULL,
  `NombreAutomovil` VARCHAR(50) NOT NULL,
  `Modelo` INT(4) NOT NULL,
  `Unidades` INT NOT NULL,
  `PrecioU` DOUBLE NOT NULL,
  `TotalDet` DOUBLE NOT NULL,
  PRIMARY KEY (`idDetalle_Adquisicion`, `idAdquisicionDetalle_Adq`),
  INDEX `AdquisicionDetalle_Adquisicion_idx` (`idAdquisicionDetalle_Adq` ASC),
  CONSTRAINT `AdquisicionDetalle_Adquisicion`
    FOREIGN KEY (`idAdquisicionDetalle_Adq`)
    REFERENCES `BDRenta`.`Adquisicion` (`idAdquisicion`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

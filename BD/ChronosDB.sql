CREATE DATABASE chronos;

USE chronos;

CREATE TABLE `TblRoles` (
    `RolIdRol` int (3) NOT NULL AUTO_INCREMENT,
    `RolRol` VARCHAR (48) NOT NULL,
    `RolCrear` VARCHAR (2) NOT NULL,
    `RolLeer` VARCHAR (2) NOT NULL,
    `RolActualizar` VARCHAR (2) NOT NULL,
    `RolBorrar` VARCHAR (2) NOT NULL, 
    PRIMARY KEY (`RolIdRol`)
);

CREATE USER '1'@'%' IDENTIFIED BY '8a56bac869374c669443a1626ff0967af258123f83faf6b55e31dd541e6bbd90308a3385713294bf2e8861bc8cf8f8feda41f9c4db19d5811a6b5de85eac9870';
GRANT ALL PRIVILEGES ON *.* TO '1'@'%' REQUIRE NONE WITH GRANT OPTION MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;
GRANT ALL PRIVILEGES ON `chronos`.* TO '1'@'%';

CREATE TABLE `TblCargos` (
   `CarIdCargo` INT (3) NOT NULL AUTO_INCREMENT,
   `CarCargo` VARCHAR (64) NOT NULL,
   PRIMARY KEY (`CarIdCargo`)
   );

CREATE TABLE`TblEspecialidades` (
    `EspIdEspecialidad` INT (3) NOT NULL AUTO_INCREMENT,
    `EspEspecialidad` VARCHAR (48) NOT NULL,
    `EspTalHumano` VARCHAR (4),
    `EspTalHumanoUsuario` VARCHAR (4),
    `EspTalHumanoActUsuario` VARCHAR (4),
    `EspTalHumanoRoles` VARCHAR (4),
    `EspTalHumanoCargos` VARCHAR (4),
    `EspTalEspecialidad` VARCHAR (4),
    `EspTalHumanoSedes` VARCHAR (4),
    `EspTalHumanoDeptoCiudad` VARCHAR (4),
    `EspTalHumanoTpDocumento` VARCHAR (4),
    `EspMatBeneficiario` VARCHAR (4),
    `EspMatBeneficiarioListaAsis` VARCHAR (4),
    `EspMatBeneficiarioMatBen` VARCHAR (4),
    `EspMatBeneficiarioActMatBen` VARCHAR (4),
    `EspMatBeneficiarioAcuBen` VARCHAR (4),
    `EspMatBeneficiarioActAcuBen` VARCHAR (4),
    `EspMatBeneficiarioTpBen` VARCHAR (4),
    `EspMatBeneficiarioEstrato` VARCHAR (4),
    `EspMatBeneficiarioModAt` VARCHAR (4),
    `EspMatBeneficiarioGenero` VARCHAR (4),
    `EspMatBeneficiarioParentesco` VARCHAR (4),
    `EspMatBeneficiarioBenSisben` VARCHAR (4),
    `EspTamizaje` VARCHAR (4),
    `EspTamizajeTami` VARCHAR (4),
    `EspTamizajeDiagnostico` VARCHAR (4),
    `EspInventario` VARCHAR (4),
    `EspInventarioStock` VARCHAR (4),
    `EspInventarioPedido` VARCHAR (4),
    `EspInventarioEntInv` VARCHAR (4),
    `EspInventarioSalCon` VARCHAR (4),
    `EspInventarioSalPro` VARCHAR (4),
    `EspInventarioDevInv` VARCHAR (4),
    `EspInventarioProvee` VARCHAR (4),
    `EspInventarioBasico` VARCHAR (4),
    `EspConsultas` VARCHAR (4),
    `EspConsultasConsUsuario` VARCHAR (4),
    `EspConsultasInv` VARCHAR (4),
    `EspConsultasInvConEntInv` VARCHAR (4),
    `EspConsultasInvConSalCon` VARCHAR (4),
    `EspConsultasInvConSalPro` VARCHAR (4),
    `EspConsultasInvConDevInv` VARCHAR (4),

    PRIMARY KEY (`EspIdEspecialidad`)
   );

CREATE TABLE `TblDepartamento` (
    `DepIdDepartamento` INT (3) NOT NULL AUTO_INCREMENT,
    `DepDepartamento` VARCHAR (64) NOT NULL,
    PRIMARY KEY (`DepIdDepartamento`)
    );

CREATE TABLE `TblCiudad` (
    `CiuIdCiudad` INT (4) NOT NULL AUTO_INCREMENT,
    `CiuCiudad` VARCHAR (64) NOT NULL,
    `TblDepartamento_DepIdDepartamento` INT(3) NOT NULL,
    PRIMARY KEY (`CiuIdCiudad`),
    foreign KEY (`TblDepartamento_DepIdDepartamento`) REFERENCES `TblDepartamento` (`DepIdDepartamento`)
    );

CREATE TABLE `TblSedesAtencion` (
    `SedIdSede` INT (3) NOT NULL AUTO_INCREMENT,
    `SedSede` VARCHAR (48) NOT NULL,
    `TblCiudad_CiuIdCiudad` INT (4) NOT NULL,
    PRIMARY KEY (`SedIdSede`),
    FOREIGN KEY (`TblCiudad_CiuIdCiudad`) REFERENCES `TblCiudad` (`CiuIdCiudad`)
    );

CREATE TABLE `TblTipoBeneficiario` (
    `TpBenIdTipoBeneficiario` int (2) NOT NULL AUTO_INCREMENT,
    `TpBenTipoBeneficiario` VARCHAR (48) NOT NULL,
    PRIMARY KEY (`TpBenIdTipoBeneficiario`)
    );

CREATE TABLE `TblEstrato` (
    `EstIdEst` INT (3) NOT NULL AUTO_INCREMENT,
    `EstEstrato` VARCHAR (10) NOT NULL,
    PRIMARY KEY (`EstIdEst`)
    );

CREATE TABLE `TblGenero` (
    `GenIdGenero` INT (2) NOT NULL AUTO_INCREMENT,
    `GenGenero` VARCHAR (24) NOT NULL,
    PRIMARY KEY (`GenIdGenero`)
    );

CREATE TABLE `TblParentesco` (
    `ParIdParentesco` INT (2) NOT NULL AUTO_INCREMENT,
    `ParParentesco` VARCHAR (24) NOT NULL,
    PRIMARY KEY  (`ParIdParentesco`)
    );

CREATE TABLE `TblTiposProductos` (
    `TipTiposProductos` INT (2) NOT NULL AUTO_INCREMENT,
    `TipTipoProducto` VARCHAR (32) NOT NULL,
    PRIMARY KEY (`TipTiposProductos`)
    );

CREATE TABLE `TblTiposDocumentos` (
    `TipIDTipoDocumento` INT (2) NOT NULL AUTO_INCREMENT,
    `TipTipoDocumento` VARCHAR (48) NOT NULL,
    PRIMARY KEY (`TipIDTipoDocumento`)
    );

CREATE TABLE `TbltalentoHumano` (
    `TalIdProfesionalCedula` VARCHAR (13) NOT NULL,
    `TalClaveProfesional` VARCHAR (1024) NOT NULL,
    `TalPrimerNombre` VARCHAR (64) NOT NULL,
    `TalSegundoNombre` VARCHAR (64),
    `TalPrimerApellido` VARCHAR (64) NOT NULL,
    `TalSegundoApellido` VARCHAR (64),
    `TalTelefono` VARCHAR (17) NOT NULL,
    `TalActivoInactivo` BOOL NOT NULL COMMENT '1 para activo, 0 para inactivo',
    `TblEspecialidades_EspIdEspecialidad` INT(3) NOT NULL,
    `TblSedesAtencion_SedIdSede` INT(3) NOT NULL,
    `TblCargos_CarIdCargo` INT(3) NOT NULL,
    `TblRoles_RolIdRol` INT(3) NOT NULL,
    `TblTiposDocumentos_TipIDTipoDocumento` INT (2) NOT NULL,
    PRIMARY KEY (`TalIdProfesionalCedula`),
    FOREIGN KEY (`TblEspecialidades_EspIdEspecialidad`) references `TblEspecialidades` (`EspIdEspecialidad`),
    FOREIGN KEY (`TblSedesAtencion_SedIdSede`) references `TblSedesAtencion` (`SedIdSede`),
    FOREIGN KEY (`TblCargos_CarIdCargo`) references `TblCargos` (`CarIdCargo`),
    FOREIGN KEY (`TblTiposDocumentos_TipIDTipoDocumento`) references `TblTiposDocumentos` (`TipIDTipoDocumento`),
    FOREIGN KEY (`TblRoles_RolIdRol`) references `TblRoles` (`RolIdRol`)
    );

CREATE TABLE `TblModalidAdatencion`(
`MoAteIdModalidadAtencion` INT(2) AUTO_INCREMENT,
`MoAteModalidadAtencion` VARCHAR(64) NOT NULL,
PRIMARY KEY (`MoAteIdModalidadAtencion`)
);


CREATE TABLE `TblSisben` (
    `TblSisIdSisben` INT (2) AUTO_INCREMENT,
    `GrupoSisben` VARCHAR (4) NOT NULL,
    PRIMARY KEY (`TblSisIdSisben`)
    );

CREATE TABLE `TblBeneficiario` (
    `BenId` VARCHAR (13) NOT NULL,
    `BenPrimerNombre` VARCHAR (64) NOT NULL,
    `BenSegundoNombre` VARCHAR (64),
    `BenPrimerApellido` VARCHAR (64) NOT NULL,
    `BenSegundoApellido` VARCHAR (64),
    `BenFechaNacimiento` DATE NOT NULL,
    `BenDireccion` VARCHAR (128) NOT NULL,
    `BenFechaMatricula` DATETIME NOT NULL,
    `TblEstrato_EstIdEst` INT(3) NOT NULL,
  	`TblSisben_TblSisIdSisben` INT(2) NOT NULL,
    `TblGenero_GenIdGenero` INT(2) NOT NULL,
    `TblTipoBeneficiario_TpBenIdTipoBeneficiario` INT(2) NOT NULL,
    `TblModalidAdatencion_MoAteIdModalidadAtencion` INT(2) NOT NULL,
    `BenEstado` BOOL NOT NULL COMMENT '1 para activo, 0 para inactivo',
  	`TblCiudad_CiuIdCiudad_Nac` INT (4) NOT NULL,
    `TblCiudad_CiuIdCiudad_Res` INT (4) NOT NULL,
    `TblTiposDocumentos_TpIdBen` INT (2) NOT NULL,
    `TblSedesAtencion_SedIdBen` INT(2) NOT NULL,
    FOREIGN KEY (`TblCiudad_CiuIdCiudad_Nac`) REFERENCES `TblCiudad` (`CiuIdCiudad`),
    FOREIGN KEY (`TblCiudad_CiuIdCiudad_Res`) REFERENCES `TblCiudad` (`CiuIdCiudad`),
    FOREIGN KEY (`TblTiposDocumentos_TpIdBen`) REFERENCES `TblTiposDocumentos` (`TipIDTipoDocumento`),
    FOREIGN KEY (`TblSedesAtencion_SedIdBen`) REFERENCES `TblSedesAtencion` (`SedIdSede`),

    PRIMARY KEY (`BenId`),
    FOREIGN KEY (`TblEstrato_EstIdEst`) REFERENCES `TblEstrato` (`EstIdEst`),
    FOREIGN KEY (`TblSisben_TblSisIdSisben`) REFERENCES `TblSisben` (`TblSisIdSisben`),
    FOREIGN KEY (`TblGenero_GenIdGenero`) REFERENCES `TblGenero` (`GenIdGenero`),
    FOREIGN KEY (`TblTipoBeneficiario_TpBenIdTipoBeneficiario`) REFERENCES `TblTipoBeneficiario` (`TpBenIdTipoBeneficiario`),
    FOREIGN KEY (`TblModalidAdatencion_MoAteIdModalidadAtencion`) REFERENCES `TblModalidAdatencion` (`MoAteIdModalidadAtencion`)
    );

CREATE TABLE `TblAdultoResponsable` (
    `AdResId` VARCHAR (13) NOT NULL,
    `AdResPrimerNombre` VARCHAR (64) NOT NULL,
    `AdResSegundoNombre` VARCHAR (64),
    `AdResPrimerApellido` VARCHAR (64) NOT NULL,
    `AdResSegundoApellido` VARCHAR (64),
    `AdResTelefono1` VARCHAR (17) NOT NULL,
    `AdResTelefono2` VARCHAR (17),
    `AdResDireccion` VARCHAR (17) NOT NULL,
    `TblEstrato_EstIdEst` INT(3),
    `TblGenero_GenIdGenero` INT(2),
    `TblParentesco_ParIdParentesco` INT(2) NOT NULL,
    PRIMARY KEY  (`AdResId`),
    FOREIGN KEY (`TblEstrato_EstIdEst`) REFERENCES `TblEstrato` (`EstIdEst`),
    FOREIGN KEY (`TblGenero_GenIdGenero`) REFERENCES `TblGenero` (`GenIdGenero`),
    FOREIGN KEY (`TblParentesco_ParIdParentesco`) REFERENCES `TblParentesco` (`ParIdParentesco`)
    );

CREATE TABLE `TblBeneficiario_TblAdultoResponsable` (
    `TblBeneficiario_BenId` VARCHAR (13) NOT NULL,
    `TblAdultoResponsable_AdResId` VARCHAR (13) NOT NULL,
    PRIMARY KEY (`TblBeneficiario_BenId`,`TblAdultoResponsable_AdResId`),
    FOREIGN KEY (`TblBeneficiario_BenId`) references `TblBeneficiario` (`BenId`),
    FOREIGN KEY (`TblAdultoResponsable_AdResId`) REFERENCES `TblAdultoResponsable` (`AdResId`)
    );
-- agregado apartir de aquí 21/08/2021

CREATE TABLE `TblClasificacionNutricional` (
    `IdClasificacionNut` INT (2) AUTO_INCREMENT,
    `ClasDesN` VARCHAR (64) NOT NULL,
    PRIMARY KEY (`IdClasificacionNut`)
    );

 CREATE TABLE `TblClasificacionPerB` (
    `IdClasificacionPB` INT (2) AUTO_INCREMENT,
    `ClasDesPB` VARCHAR (64) NOT NULL,
    PRIMARY KEY (`IdClasificacionPB`)
    );

 CREATE TABLE `TblClasificacionPerC` (
    `IdClasificacionPC` INT (2) AUTO_INCREMENT,
    `ClasDesPC` VARCHAR (64) NOT NULL,
    PRIMARY KEY (`IdClasificacionPC`)
    );

-- end 21/08/2021
CREATE TABLE `TblRelTamizajeNutricional` (
    `TamIdHistoriaN` INT (8) AUTO_INCREMENT,
    `TamDiagnosticoNutri` VARCHAR (256) NOT NULL,
    `TamPeso` FLOAT (20,2) NOT NULL,
    `TamTalla` FLOAT (20,2) NOT NULL,
    `TamPBraquial` FLOAT (20,2) NOT NULL,
    `TamPCefalico` FLOAT (20,2) NOT NULL,
    `TamFechaAtencion` DATE NOT NULL,
    `TamObservaciones` VARCHAR (1024) NOT NULL,
    `TblBeneficiario_BenId` VARCHAR (13) NOT NULL,
    `TblSedesAtencion_SedIdSede` INT(3) NOT NULL,
    `TblClasificacionNutricional_IdClasificacionNut` INT (2) NOT NULL,
    `TblClasificacionPerB_IdClasificacionPB` INT (2) NOT NULL,
    `TblClasificacionPerC_IdClasificacionPC` INT (2) NOT NULL,
    PRIMARY KEY  (`TamIdHistoriaN`),
    FOREIGN KEY (`TblBeneficiario_BenId`) REFERENCES `TblBeneficiario` (`BenId`),
    FOREIGN KEY (`TblSedesAtencion_SedIdSede`) REFERENCES `TblSedesAtencion` (`SedIdSede`),
    FOREIGN KEY (`TblClasificacionNutricional_IdClasificacionNut`) REFERENCES `TblClasificacionNutricional` (`IdClasificacionNut`),
    FOREIGN KEY (`TblClasificacionPerB_IdClasificacionPB`) REFERENCES `TblClasificacionPerB` (`IdClasificacionPB`),
    FOREIGN KEY (`TblClasificacionPerC_IdClasificacionPC`) REFERENCES `TblClasificacionPerC` (`IdClasificacionPC`)
    );



CREATE TABLE `TblAsistencia` (
    `AsiIdAsistente` INT (9) NOT NULL AUTO_INCREMENT,
    `AsiFechaControlAsistencia` DATETIME NOT NULL,
    `AsiEstadoAsistencia`  BOOL NOT NULL COMMENT '1 para presente, 0 para ausente',
    `TblBeneficiario_BenId` VARCHAR (13) NOT NULL,
  	`TblSedesAtencion_SedIdSede` INT(2) NOT NULL,
    `TbltalentoHumano_TalIdProfesionalCedula` VARCHAR(13) NOT NULL,
    PRIMARY KEY (`AsiIdAsistente`),
    FOREIGN KEY (`TblBeneficiario_BenId`) REFERENCES `TblBeneficiario` (`BenId`),
    FOREIGN KEY (`TblSedesAtencion_SedIdSede`) REFERENCES `TblSedesAtencion` (`SedIdSede`),
    FOREIGN KEY (`TbltalentoHumano_TalIdProfesionalCedula`) REFERENCES `TbltalentoHumano` (`TalIdProfesionalCedula`)
    );

CREATE TABLE `TblMarca` (
    `MarIdMarca` INT (3) NOT NULL AUTO_INCREMENT,
    `MarMarca` VARCHAR (48) NOT NULL,
    PRIMARY KEY (`MarIdMarca`)
    );

CREATE TABLE `TblUnidadesMedidas` (
    `UniIdUnidadMedida` INT (3) NOT NULL AUTO_INCREMENT,
    `UniUnidadMedida` VARCHAR (9) NOT NULL,
    `UniDescripcionUnidadMedida` VARCHAR (24) NOT NULL,
    PRIMARY KEY  (`UniIdUnidadMedida`)
    );

CREATE TABLE `TblProducto` (
    `ProIdProducto` VARCHAR(10) NOT NULL,
    `ProNombreProducto` VARCHAR (128) NOT NULL,
    `ProFechaCreacion` DATETIME NOT NULL,
    `TblMarca_MarIdMarca` INT (3) NOT NULL,
    `TblUnidadesMedidas_UniIdUnidadMedida` INT(3) NOT NULL,
    `TblTiposProductos_TipTiposProductos` INT (2) NOT NULL,
    PRIMARY KEY (`ProIdProducto`),
    FOREIGN KEY (`TblMarca_MarIdMarca`) REFERENCES `TblMarca` (`MarIdMarca`),
    FOREIGN KEY (`TblUnidadesMedidas_UniIdUnidadMedida`) REFERENCES `TblUnidadesMedidas` (`UniIdUnidadMedida`),
    FOREIGN KEY (`TblTiposProductos_TipTiposProductos`) REFERENCES `TblTiposProductos` (`TipTiposProductos`)
    );

CREATE TABLE `TblProveedor` (
    `PrvNitProveedor` VARCHAR (12) NOT NULL,
    `PrvPersonaContacto` VARCHAR (128) NOT NULL,
    `PrvRazonSocial` VARCHAR (128) NOT NULL,
    `PrvEmail` VARCHAR (64) NOT NULL,
    `PrvDireccion` VARCHAR (64) NOT NULL,
    `PrvTelefono` VARCHAR (17) NOT NULL,
    `PrvTelefono2` VARCHAR (17),
    `TblCiudad_CiuIdCiudad` INT (4) NOT NULL,
    PRIMARY KEY (`PrvNitProveedor`),
    FOREIGN KEY (`TblCiudad_CiuIdCiudad`) REFERENCES `TblCiudad` (`CiuIdCiudad`)
    );

CREATE TABLE `TblPedido` (
    `PedIDpedido` INT (5) AUTO_INCREMENT,
    `PedFecha` DATE NOT NULL,
    `PedObservacion` VARCHAR (256) NOT NULL,
    `TblProveedor_PrvNitProveedor` VARCHAR (12) NOT NULL,
    PRIMARY KEY (`PedIDpedido`),
    FOREIGN KEY (`TblProveedor_PrvNitProveedor`) REFERENCES `TblProveedor` (`PrvNitProveedor`)
    );

CREATE TABLE `TblDetallePedido` (
    `TblPedido_PedIDpedido` INT(5) NOT NULL,
    `TblProducto_ProIDProducto` VARCHAR(10) NOT NULL,
    `DetValorUnitario` FLOAT (20,2) NOT NULL,
    `DetCantidad` FLOAT (20,2) NOT NULL,
    PRIMARY KEY (`TblPedido_PedIDpedido`,`TblProducto_ProIDProducto`),
    FOREIGN KEY (`TblPedido_PedIDpedido`) REFERENCES `TblPedido` (`PedIDpedido`),
    FOREIGN KEY (`TblProducto_ProIDProducto`) REFERENCES `TblProducto` (`ProIDProducto`)
    );

CREATE TABLE `TblEntradaInventario` (
    `EntIdEntradaInventario` INT (5) NOT NULL AUTO_INCREMENT,
    `EntFechaEntradaInventario` DATETIME NOT NULL,
    `EntObservacionesGen` VARCHAR (256) NOT NULL,
    `TblProveedor_PrvNitProveedor` VARCHAR (12) NOT NULL,
    `TblPedido_PedIDpedido` INT (5) NOT NULL,
    PRIMARY KEY (`EntIdEntradaInventario`),
    FOREIGN KEY (`TblPedido_PedIDpedido`) REFERENCES `TblPedido` (`PedIDpedido`),
    FOREIGN KEY (`TblProveedor_PrvNitProveedor`) REFERENCES `TblProveedor` (`PrvNitProveedor`)
    );
 
CREATE TABLE `TblDetalleEntradaInventario` (
    `DEICantidad` FLOAT (20,2) NOT NULL,
    `DEIValUnitario` FLOAT (20,2) NOT NULL,
    `DEIObservacion` VARCHAR (128) NOT NULL,
    `DEIVerificacion` BOOL COMMENT '1 para activo, 0 para inactivo',
    `TblEntradaInventario_EntIdEntradaInventario` INT (5) NOT NULL,
    `TblProducto_ProIdProducto` VARCHAR (10) NOT NULL,
    PRIMARY KEY (`TblEntradaInventario_EntIdEntradaInventario`, `TblProducto_ProIdProducto`),
    FOREIGN KEY (`TblEntradaInventario_EntIdEntradaInventario`) REFERENCES `TblEntradaInventario` (`EntIdEntradaInventario`),
    FOREIGN KEY (`TblProducto_ProIdProducto`) REFERENCES `TblProducto` (`ProIdProducto`)
    );

CREATE TABLE `TblStockPrincipal` (
    `SPCantidad` FLOAT(20,2) NOT NULL,
    `TblProducto_ProIdProducto` VARCHAR(10) NOT NULL,
    PRIMARY KEY (`TblProducto_ProIdProducto`),
    FOREIGN KEY (`TblProducto_ProIdProducto`) REFERENCES `TblProducto` (`ProIdProducto`)
    );

CREATE TABLE `TblStockOtrasSedes` (
    `SOSCantidad` FLOAT(20,2) NOT NULL,
    `TblProducto_ProIdProducto` VARCHAR(10) NOT NULL,
    `TblSedesAtencion_SedIdSede` INT(6) NOT NULL,
    PRIMARY KEY (`TblProducto_ProIdProducto`, `TblSedesAtencion_SedIdSede`),
    FOREIGN KEY (`TblSedesAtencion_SedIdSede`) REFERENCES `TblSedesAtencion` (`SedIdSede`),
    FOREIGN KEY (`TblProducto_ProIdProducto`) REFERENCES `TblProducto` (`ProIdProducto`)
    );

CREATE TABLE `TblSalidaInventario` (
    `SalIdSalidaInventario` INT (6) NOT NULL AUTO_INCREMENT,
    `SalFechaSalidaInventario` DATETIME NOT NULL,
    `SalObseravaciones` VARCHAR (256) NOT NULL,
    `TblSedesAtencion_SedIdSede` INT (6) NOT NULL,
    PRIMARY KEY (`SalIdSalidaInventario`),
    FOREIGN KEY (`TblSedesAtencion_SedIdSede`) REFERENCES `TblSedesAtencion` (`SedIdSede`)
    );

CREATE TABLE `TblDetallesalidaInventario` (
    `DSICantidad` FLOAT (20,2) NOT NULL,
    `TblSalidaInventario_SalIdSalidaInventario` INT (6) NOT NULL,
    `TblProducto_ProIdProducto` VARCHAR (10) NOT NULL,
    PRIMARY KEY (`TblSalidaInventario_SalIdSalidaInventario`, `TblProducto_ProIdProducto`),
    FOREIGN KEY (`TblSalidaInventario_SalIdSalidaInventario`) REFERENCES `TblSalidaInventario` (`SalIdSalidaInventario`),
    FOREIGN KEY (`TblProducto_ProIdProducto`) REFERENCES `TblProducto` (`ProIdProducto`)
    );

CREATE TABLE `TblDevolucionInventario` (
    `DevIdDevolucionInventario` INT (6) NOT NULL AUTO_INCREMENT,
    `DevFechaDevolucionInventario` DATETIME NOT NULL,
    `DevObseravacionesDevolucionInventario` VARCHAR (256) NOT NULL,
    `TblSedesAtencion_SedIdSede` INT (6) NOT NULL,
    PRIMARY KEY (`DevIdDevolucionInventario`),
    FOREIGN KEY (`TblSedesAtencion_SedIdSede`) REFERENCES `TblSedesAtencion` (`SedIdSede`)
    );

CREATE TABLE `TblDetalleDevolucionInventario` (
    `DevInvCantidad` FLOAT (20,2) NOT NULL,
    `TblDevolucionInventario_DevIdDevolucionInventario` INT (6) NOT NULL,
    `TblProducto_ProIdProducto` VARCHAR (10) NOT NULL,
    PRIMARY KEY (`TblDevolucionInventario_DevIdDevolucionInventario`, `TblProducto_ProIdProducto`),
    FOREIGN KEY (`TblDevolucionInventario_DevIdDevolucionInventario`) REFERENCES `TblDevolucionInventario` (`DevIdDevolucionInventario`),
    FOREIGN KEY (`TblProducto_ProIdProducto`) REFERENCES `TblProducto` (`ProIdProducto`)
    );

CREATE TABLE `TblDevolucionProveedor` (
    `DevIdDevolucion` INT (4) NOT NULL AUTO_INCREMENT,
    `DevFechaDevolucion` DATETIME NOT NULL,
    `DevObservacion` VARCHAR (256) NOT NULL,
    `TblProveedor_PrvNitProveedor` VARCHAR (12) NOT NULL,
    PRIMARY KEY (`DevIdDevolucion`),
    FOREIGN KEY (`TblProveedor_PrvNitProveedor`) REFERENCES `TblProveedor` (`PrvNitProveedor`)
    );

CREATE TABLE `TblDetalleDevolucionProveedor` (
    `DDPCantidad` FLOAT (20,2) NOT NULL,
    `TblDevolucionProveedor_DevIdDevolucion` INT (4) NOT NULL,
    `TblProducto_ProIdProducto` VARCHAR (10) NOT NULL,
    PRIMARY KEY (`TblDevolucionProveedor_DevIdDevolucion` , `TblProducto_ProIdProducto`),
    FOREIGN KEY (`TblDevolucionProveedor_DevIdDevolucion`) REFERENCES `TblDevolucionProveedor` (`DevIdDevolucion`),
    FOREIGN KEY (`TblProducto_ProIdProducto`) REFERENCES `TblProducto` (`ProIdProducto`)
    );

CREATE TABLE `TblCantidadDisponible`(
`TblProducto_ProIdProducto` VARCHAR(10) NOT NULL,
`CantidadDisponible` FLOAT(20,2) NOT NULL,
PRIMARY KEY(`TblProducto_ProIdProducto`),
FOREIGN KEY(`TblProducto_ProIdProducto`) REFERENCES `TblProducto`(`ProIdProducto`)
);

CREATE TABLE `TblCantidadSede`(
`TblProducto_ProIdProducto` VARCHAR(10) NOT NULL,
`CantidadDisponibleSede` FLOAT(20,2) NOT NULL,
`TblSedesAtencion_SedIdSede` INT(2) NOT NULL,
PRIMARY KEY(`TblProducto_ProIdProducto`, `TblSedesAtencion_SedIdSede`),
FOREIGN KEY(`TblProducto_ProIdProducto`) REFERENCES `TblProducto`(`ProIdProducto`),
FOREIGN KEY(`TblSedesAtencion_SedIdSede`) REFERENCES `TblSedesAtencion`(`SedIdSede`)
);

#TABLAS PARA TRIGGER

CREATE TABLE `TgTbltalentoHumano`(
`IDTgTalentoHumano` INT AUTO_INCREMENT,
`TblEspecialidades_EspIdEspecialidadN` INT(3),
`TblSedesAtencion_SedIdSedeN` INT(3),
`TalIdProfesionalCedulaN` VARCHAR(13) NOT NULL,
`TalClaveProfesionalN` VARCHAR (1024),
`TblCargos_CarIdCargoN` INT(3),
`TblRoles_RolIdRolN` INT(3),
`TalPrimerNombreN` VARCHAR(64),
`TalSegundoNombreN` VARCHAR(64),
`TalPrimerApellidoN` VARCHAR(64),
`TalSegundoApellidoN` VARCHAR(64),
`TalTelefonoN` VARCHAR(17),
`TalActivoInactivoN` BOOL COMMENT '1 para activo, 0 para inactivo',
`TblTiposDocumentos_TipIDTipoDocumentoN` INT(2),
`TblEspecialidades_EspIdEspecialidadA` INT(3),
`TblSedesAtencion_SedIdSedeA` INT(3),
`TalClaveProfesionalA` VARCHAR (1024),
`TblCargos_CarIdCargoA` INT(3),
`TblRoles_RolIdRolA` INT(3),
`TalPrimerNombreA` VARCHAR(64),
`TalSegundoNombreA` VARCHAR(64),
`TalPrimerApellidoA` VARCHAR(64),
`TalSegundoApellidoA` VARCHAR(64),
`TalTelefonoA` VARCHAR(17),
`TalActivoInactivoA` BOOL COMMENT '1 para activo, 0 para inactivo',
`TblTiposDocumentos_TipIDTipoDocumentoA` INT(2),
`UsuarioSis` VARCHAR(13),
`FechaMod` DATETIME,
`TipoMovimiento` VARCHAR(30),
PRIMARY KEY (`IDTgTalentoHumano`)
);

CREATE TABLE `TgTblBeneficiario`(
`IdTgBen` INT AUTO_INCREMENT,
`BenId` VARCHAR(13),
`TblEstrato_EstIdEstN` INT(3),
`BenSegundoApellidoN` VARCHAR(64),
`BenPrimerApellidoN` VARCHAR(64),
`BenSegundoNombreN` VARCHAR(64),
`BenPrimerNombreN` VARCHAR(64),
`BenFechaNacimientoN` DATE,
`BenDireccionN` VARCHAR(128),
`TblModalidAdatencion_MoAteIdModalidadAtencionN` INT(2),
`BenEstadoN` BOOL  COMMENT '1 para activo, 0 para inactivo',
`TblSisben_TblSisIdSisbenN` INT(2),
`TblCiudad_CiuIdCiudad_NacN` INT(4),
`TblEstrato_EstIdEstA` INT(3),
`BenSegundoApellidoA` VARCHAR(64),
`BenPrimerApellidoA` VARCHAR(64),
`BenSegundoNombreA` VARCHAR(64),
`BenPrimerNombreA` VARCHAR(64),
`BenFechaNacimientoA` DATE,
`BenDireccionA` VARCHAR(128),
`TblModalidAdatencion_MoAteIdModalidadAtencionA` INT(2),
`BenEstadoA` BOOL COMMENT '1 para activo, 0 para inactivo',
`UsuarioSis` VARCHAR(13),
`FechaMod` DATETIME,
`TipoMovimiento` VARCHAR(30),
`TblSisben_TblSisIdSisbenA` INT(2),
`TblCiudad_CiuIdCiudad_NacA` INT(2),
PRIMARY KEY (`IdTgBen`)
);

CREATE TABLE `TgTblAdultoResponsable`(
`IdTgAdRes` INT AUTO_INCREMENT,
`AdResIdN` VARCHAR(13),
`TblEstrato_EstIdEstN` INT(3),
`AdResSegundoApellidoN` VARCHAR(64),
`AdResPrimerApellidoN` VARCHAR(64),
`AdResSegundoNombreN` VARCHAR(64),
`AdResPrimerNombreN` VARCHAR(64),
`AdResTelefono1N` VARCHAR(17),
`AdResTelefono2N` VARCHAR(17),
`AdResDireccionN` VARCHAR(128),
`TblEstrato_EstIdEstA` INT(3),
`AdResSegundoApellidoA` VARCHAR(64),
`AdResPrimerApellidoA` VARCHAR(64),
`AdResSegundoNombreA` VARCHAR(64),
`AdResPrimerNombreA` VARCHAR(64),
`AdResTelefono1A` VARCHAR(17),
`AdResTelefono2A` VARCHAR(17),
`AdResDireccionA` VARCHAR(128),
`UsuarioSis` VARCHAR(13),
`FechaMod` DATETIME,
`TipoMovimiento` VARCHAR(30),
PRIMARY KEY (`IdTgAdRes`)
);

CREATE TABLE `TgTblRelTamizajeNutricional`(
`TamIdHistoriaN` INT(8),
`UsuarioSis` VARCHAR(13),
`FechaMod` DATETIME,
`TipoMovimiento` VARCHAR(30),
PRIMARY KEY(`TamIdHistoriaN`)
);


CREATE TABLE `TgTblCantidadDisponible`(
`IdTgCantidadDisponible` INT AUTO_INCREMENT,
`TblProducto_ProIdProductoN` VARCHAR(10),
`CantidadDisponibleN` FLOAT(20,2),
`TblProducto_ProIdProductoA` VARCHAR(10),
`CantidadDisponibleA` FLOAT(20,2),
`UsuarioSis` VARCHAR(13),
`FechaMod` DATETIME,
`TipoMovimiento` VARCHAR(30),
PRIMARY KEY(`IdTgCantidadDisponible`)
);

CREATE TABLE `TgTblCantidadSede`(
`IdTgCantidadSede` INT AUTO_INCREMENT,
`TblProducto_ProIdProductoN` VARCHAR(10),
`CantidadDisponibleN` FLOAT(20,2),
`TblSedesAtencion_SedIdSedeN` INT(2),
`TblProducto_ProIdProductoA` VARCHAR(10),
`CantidadDisponibleA` FLOAT(20,2),
`TblSedesAtencion_SedIdSedeA` INT(2),
`UsuarioSis` VARCHAR(13),
`FechaMod` DATETIME,
`TipoMovimiento` VARCHAR(30),
PRIMARY KEY(`IdTgCantidadSede`)
);

CREATE TABLE `TgTblProducto`(
`IdTgProducto` INT AUTO_INCREMENT,
`ProIdProducto` VARCHAR(10),
`ProNombreProductoN` VARCHAR(128),
`ProNombreProductoA` VARCHAR(128),
`UsuarioSis` VARCHAR(13),
`FechaMod` DATETIME,
`TipoMovimiento` VARCHAR(30),
PRIMARY KEY (`IdTgProducto`)
);

CREATE TABLE `TgTblProveedor` (
`IdTgProveedor` INT AUTO_INCREMENT,
`PrvNitProveedorN` VARCHAR(12),
`PrvPersonaContactoN` VARCHAR(128),
`PrvEmailN` VARCHAR(64),
`PrvDireccionN` VARCHAR(64),
`PrvTelefonoN` VARCHAR(17),
`PrvTelefono2N` VARCHAR(17),
`TblCiudad_CiuIdCiudadN` INT(4),
`PrvPersonaContactoA` VARCHAR(128),
`PrvEmailA` VARCHAR(64),
`PrvDireccionA` VARCHAR(64),
`PrvTelefonoA` VARCHAR(17),
`PrvTelefono2A` VARCHAR(17),
`ProvFechaCreacionA` DATETIME,
`TblCiudad_CiuIdCiudadA` INT(4),
`UsuarioSis` VARCHAR(13),
`FechaMod` DATETIME,
`TipoMovimiento` VARCHAR(30),
PRIMARY KEY (`IdTgProveedor`)
);

CREATE TABLE `TgTblPedido` (
`PedIDpedidoC` INT,
`UsuarioSis` VARCHAR(13),
`FechaMod` DATETIME,
`TipoMovimiento` VARCHAR(30),
PRIMARY KEY (`PedIDpedidoC`)
);

CREATE TABLE `TgTblEntradaInventario` (
`EntIdEntradaInventarioC` INT,
`UsuarioSis` VARCHAR(13),
`FechaMod` DATETIME,
`TipoMovimiento` VARCHAR(30),
PRIMARY KEY (`EntIdEntradaInventarioC`)
);

CREATE TABLE `TgTblSalidaInventario`(
`SalIdSalidaInventarioC` INT,
`UsuarioSis` VARCHAR(13),
`FechaMod` DATETIME,
`TipoMovimiento` VARCHAR(30),
PRIMARY KEY (`SalIdSalidaInventarioC`)
);

CREATE TABLE `TgTblDevolucionProveedor`(
`DevIdDevolucionC` INT,
`UsuarioSis` VARCHAR(13),
`FechaMod` DATETIME,
`TipoMovimiento` VARCHAR(30),
PRIMARY KEY (`DevIdDevolucionC`)
);

CREATE TABLE TgTblAsistencia(
`AsiIdAsistente` int(9) AUTO_INCREMENT,
`TblBeneficiario_BenId` VARCHAR(13),
`AsiFechaControlAsistencia` DATETIME,
`AsiEstadoAsistencia`  BOOL NOT NULL COMMENT '1 para presente, 0 para ausente',
`TblSedesAtencion_SedIdSede` INT(2),
`UsuarioSis` VARCHAR(13),
`FechaMod` DATETIME,
`TipoMovimiento` VARCHAR(13),
PRIMARY KEY (`AsiIdAsistente`)
);


INSERT INTO `TblCargos`(`CarCargo`) VALUES ('Admin');
INSERT INTO `TblRoles`(`RolRol`, `RolCrear`, `RolLeer`, `RolActualizar`, `RolBorrar`) VALUES ('Admin','Si','Si','Si','Si');
INSERT INTO `TblDepartamento`(`DepDepartamento`) VALUES ('Cundinamarca');
INSERT INTO `TblCiudad`(`CiuCiudad`, `TblDepartamento_DepIdDepartamento`) VALUES ('Bogotá DC', 1);
INSERT INTO `TblSedesAtencion`(`SedSede`, `TblCiudad_CiuIdCiudad`) VALUES ('Principal Bogotá', 1);
INSERT INTO `TblTiposDocumentos`(`TipTipoDocumento`) VALUES ('Cédula');
INSERT INTO `TblEspecialidades`(`EspEspecialidad`, `EspTalHumano`, `EspTalHumanoUsuario`, `EspTalHumanoActUsuario`, `EspTalHumanoRoles`, `EspTalHumanoCargos`, `EspTalEspecialidad`, `EspTalHumanoSedes`, `EspTalHumanoDeptoCiudad`, `EspTalHumanoTpDocumento`, `EspMatBeneficiario`, `EspMatBeneficiarioListaAsis`, `EspMatBeneficiarioMatBen`, `EspMatBeneficiarioActMatBen`, `EspMatBeneficiarioAcuBen`, `EspMatBeneficiarioActAcuBen`, `EspMatBeneficiarioTpBen`, `EspMatBeneficiarioEstrato`, `EspMatBeneficiarioModAt`, `EspMatBeneficiarioGenero`, `EspMatBeneficiarioParentesco`, `EspMatBeneficiarioBenSisben`, `EspTamizaje`, `EspTamizajeTami`, `EspTamizajeDiagnostico`, `EspInventario`, `EspInventarioStock`, `EspInventarioPedido`, `EspInventarioEntInv`, `EspInventarioSalCon`, `EspInventarioSalPro`, `EspInventarioDevInv`, `EspInventarioProvee`, `EspInventarioBasico`, `EspConsultas`, `EspConsultasConsUsuario`, `EspConsultasInv`, `EspConsultasInvConEntInv`, `EspConsultasInvConSalCon`, `EspConsultasInvConSalPro`, `EspConsultasInvConDevInv`) VALUES ('Administrador','Si','Si','Si','Si','Si','Si','Si','Si','Si','Si','Si','Si','Si','Si','Si','Si','Si','Si','Si','Si','Si','Si','Si','Si','Si','Si','Si','Si','Si','Si','Si','Si','Si','Si','Si','Si','Si','Si','Si','Si');
INSERT INTO `TbltalentoHumano`(`TalIdProfesionalCedula`, `TalClaveProfesional`, `TalPrimerNombre`, `TalSegundoNombre`, `TalPrimerApellido`, `TalSegundoApellido`, `TalTelefono`, `TalActivoInactivo`, `TblEspecialidades_EspIdEspecialidad`, `TblSedesAtencion_SedIdSede`, `TblCargos_CarIdCargo`, `TblRoles_RolIdRol`, `TblTiposDocumentos_TipIDTipoDocumento`) VALUES ('1','8a56bac869374c669443a1626ff0967af258123f83faf6b55e31dd541e6bbd90308a3385713294bf2e8861bc8cf8f8feda41f9c4db19d5811a6b5de85eac9870','Administrador','Sistema','Chronos','Cormaun','7777777','1',1,1,1,1,1);


-- Procedimientos almacenados para ingreso de roles

DELIMITER //
CREATE PROCEDURE InRoles(IN InRolRol VARCHAR(48))
BEGIN
INSERT INTO `TblRoles`(`RolRol`)
    VALUES (InRolRol);
END //


-- Procedimientos almacenados para consultar los roles ingresados

DELIMITER //
CREATE PROCEDURE CnRoles()
BEGIN
SELECT *
FROM `TblRoles`
ORDER BY `RolRol` asc;
END //


-- Prodecimiento almacenado para ingresar Cargos

DELIMITER //
CREATE PROCEDURE InCargos(IN InCargos VARCHAR(64))
BEGIN
INSERT INTO `TblCargos`(`CarCargo`)
    VALUES (InCargos);
END //


-- Procedimiento almacenado para consultar Cargos

DELIMITER //
CREATE PROCEDURE CnCargos()
BEGIN
SELECT *
FROM `TblCargos`
ORDER BY `CarCargo` asc;
END //


-- Procedimineto almacenado para ingresar Especialidades

DELIMITER //
CREATE PROCEDURE InEspecialidades(IN InEspecialidades VARCHAR (64))
BEGIN
INSERT INTO `TblEspecialidades`(`EspEspecialidad`)
    VALUES (InEspecialidades);
END //


-- Procedimiento almacenado para consultar Especialidades

DELIMITER //
CREATE PROCEDURE CnEspecialidades()
BEGIN
SELECT *
FROM `TblEspecialidades`
ORDER BY `EspEspecialidad` ASC;
END //


-- Procedimineto almacenado para ingresar Departamento

DELIMITER //
CREATE PROCEDURE InDepartamento(IN InDepartamento VARCHAR (64))
BEGIN
INSERT INTO `TblDepartamento`(`DepDepartamento`)
    VALUES (InDepartamento);
END //


-- Procedimiento almacenado para consultar Departamento

DELIMITER //
CREATE PROCEDURE CnDepartamento()
BEGIN
SELECT *
FROM `TblDepartamento`
ORDER BY `DepDepartamento` DESC;
END //



-- Procedimineto almacenado para ingresar Ciudad

DELIMITER //
CREATE PROCEDURE InCiudad(IN InCiuCiudad VARCHAR (64), IN InTblDepartamento_DepIdDepartamento INT(3))
BEGIN
INSERT INTO `TblCiudad`(`CiuCiudad`,`TblDepartamento_DepIdDepartamento`)
    VALUES (InCiuCiudad, InTblDepartamento_DepIdDepartamento);
END //


-- Procedimiento almacenado para consultar Ciudad

DELIMITER //
CREATE PROCEDURE CnCiudad()
BEGIN
SELECT *
FROM `TblCiudad`
ORDER BY `CiuCiudad` DESC;
END //



-- Procedimineto almacenado para ingresar Sedes Atencion

DELIMITER //
CREATE PROCEDURE InSedesAtencion(IN InSedSede VARCHAR(48), IN InTblCiudad_CiuIdCiudad INT(4))
BEGIN
INSERT INTO `TblSedesAtencion`(`SedSede`,`TblCiudad_CiuIdCiudad`)
    VALUES (InSedSede, InTblCiudad_CiuIdCiudad);
END //


-- Procedimiento almacenado general para consultar Sedes Atencion

DELIMITER //
CREATE PROCEDURE CnSedesAtencion()
BEGIN
SELECT *
FROM `TblAedesAtencion`
ORDER BY `TblCiudad_CiuIdCiudad` ASC;
END //


-- Procedimiento almacenado para consultar Sedes Atencion por ciudad

DELIMITER //
CREATE PROCEDURE CnSedesAtencionxciudad(IN CnTblCiudad_CiuIdCiudad INT(4))
BEGIN
SELECT *
FROM `TblSedesAtencion`
WHERE `TblCiudad_CiuIdCiudad` = CnTblCiudad_CiuIdCiudad
ORDER BY `SedSede` ASC;
END //


-- Procedimineto almacenado para ingresar Tipo Beneficiario

DELIMITER //
CREATE PROCEDURE InTipoBeneficiario(IN InTpBenTipoBeneficiario VARCHAR(48))
BEGIN
INSERT INTO `TblTipoBeneficiario`(`TpBenTipoBeneficiario`)
    VALUES (InTpBenTipoBeneficiario);
END //


-- Procedimiento almacenado para consultar Tipo Beneficiario

DELIMITER //
CREATE PROCEDURE CnTipoBeneficiario()
BEGIN
SELECT *
FROM `TblTipoBeneficiario`
ORDER BY `TpBenTipoBeneficiario` ASC;
END //


-- Procedimineto almacenado para ingresar Estrato

DELIMITER //
CREATE PROCEDURE InEstrato(IN InEstEstrato VARCHAR(10))
BEGIN
INSERT INTO `TblEstrato`(`EstEstrato`)
    VALUES (InEstEstrato);
END //


-- Procedimiento almacenado para consultar Estrato

DELIMITER //
CREATE PROCEDURE CnEstrato()
BEGIN
SELECT *
FROM `TblEstrato`
ORDER BY `EstEstrato` ASC;
END //



-- Procedimineto almacenado para ingresar Modalidad Atencion

DELIMITER //
CREATE PROCEDURE InModalidadAtencion(IN InMoAteModalidadAtencion VARCHAR(64))
BEGIN
INSERT INTO `TblModalidAdatencion`(`MoAteModalidadAtencion`)
    VALUES (InMoAteModalidadAtencion);
END //


-- Procedimiento almacenado para consultar Modalidad Atencion

DELIMITER //
CREATE PROCEDURE CnModalidadAtencion()
BEGIN
SELECT *
FROM `TblModalidAdatencion`
ORDER BY `MoAteModalidadAtencion` ASC;
END //


-- Procedimineto almacenado para ingresar Genero

DELIMITER //
CREATE PROCEDURE InGenero(IN InGenGenero VARCHAR(24))
BEGIN
INSERT INTO `TblGenero`(`GenGenero`)
    VALUES (InGenGenero);
END //


-- Procedimiento almacenado para consultar Genero

DELIMITER //
CREATE PROCEDURE CnGenero()
BEGIN
SELECT *
FROM `TblGenero`
ORDER BY `GenGenero` ASC;
END //


-- Procedimineto almacenado para ingresar Parentesco

DELIMITER //
CREATE PROCEDURE InParentesco(IN InParParentesco VARCHAR(24))
BEGIN
INSERT INTO `TblParentesco`(`ParParentesco`)
    VALUES (InParParentesco);
END //


-- Procedimiento almacenado para consultar Parentesco

DELIMITER //
CREATE PROCEDURE CnParentesco()
BEGIN
SELECT *
FROM `TblParentesco`
ORDER BY `ParParentesco` ASC;
END //


-- ##MARCA
-- Procedimineto almacenado para ingresar Marca

DELIMITER //
CREATE PROCEDURE InMarca(IN InMarMarca VARCHAR(48))
BEGIN
INSERT INTO `TblMarca`(`MarMarca`)
    VALUES (InMarMarca);
END //


-- Procedimiento almacenado para consultar Marca

DELIMITER //
CREATE PROCEDURE CnMarca()
BEGIN
SELECT *
FROM `TblMarca`
ORDER BY `MarMarca` ASC;
END //


-- Procedimineto almacenado para ingresar Unidades Medidas

DELIMITER //
CREATE PROCEDURE InUnidadesMedidas(IN InUniUnidadMedida VARCHAR(9),IN InUniDescripcionUnidadMedida VARCHAR(24))
BEGIN
INSERT INTO `TblUnidadesMedidas`(`UniUnidadMedida`,`UniDescripcionUnidadMedida`)
    VALUES (InUniUnidadMedida, InUniDescripcionUnidadMedida);
END //


-- Procedimiento almacenado para consultar Unidades Medidas

DELIMITER //
CREATE PROCEDURE CnUnidadesMedidas()
BEGIN
SELECT *
FROM `TblUnidadesMedidas`
ORDER BY `UniDescripcionUnidadMedida` ASC;
END //


-- Procedimiento almacenado para consultar Unidades Medidas

DELIMITER //
CREATE PROCEDURE CnDescripcionUnidadesMedidas(CnUniDescripcionUnidadMedida VARCHAR(24))
BEGIN
SELECT *
FROM `TblUnidadesMedidas`
WHERE `UniDescripcionUnidadMedida`LIKE CONCAT('%', CnUniDescripcionUnidadMedida)
    OR `UniDescripcionUnidadMedida`LIKE CONCAT( CnUniDescripcionUnidadMedida,'%')
    OR `UniDescripcionUnidadMedida`LIKE CONCAT('%', CnUniDescripcionUnidadMedida,'%')
ORDER BY `UniDescripcionUnidadMedida` ASC;
END //


-- Procedimineto almacenado para ingresar TiposProductos

DELIMITER //
CREATE PROCEDURE InTiposProductos(IN InTipTipoProducto VARCHAR(32))
BEGIN
INSERT INTO `TblTiposProductos`(`TipTipoProducto`)
    VALUES (InTipTipoProducto);
END //


-- Procedimiento almacenado para consultar TiposProductos

DELIMITER //
CREATE PROCEDURE CnTiposProductos()
BEGIN
SELECT *
FROM `TblTiposProductos`
ORDER BY `TipTipoProducto` ASC;
END //



-- Procedimineto almacenado para ingresar Talentohumano

DELIMITER //
CREATE PROCEDURE InTalentohumano
(IN InTblEspecialidades_EspIdEspecialidad INT(3),
IN InTblSedesAtencion_SedIdSede INT(3),
IN InTalIdProfesionalCedula VARCHAR(13),
IN InTalClaveProfesional VARCHAR (1024),
IN InTblCargos_CarIdCargo INT(3),
IN InTblRoles_RolIdRol INT(3),
IN InTalPrimerNombre VARCHAR(64),
IN InTalSegundoNombre VARCHAR(64),
IN InTalPrimerApellido VARCHAR(64),
IN InTalSegundoApellido VARCHAR(64),
IN InTalTelefono VARCHAR(17),
IN InTalActivoInactivo BOOL,
IN InTblTiposDocumentos_TipIDTipoDocumento INT(2))
BEGIN
INSERT INTO `TbltalentoHumano`(`TblEspecialidades_EspIdEspecialidad`,
`TblSedesAtencion_SedIdSede`,`TalIdProfesionalCedula`,`TalClaveProfesional`,
`TblCargos_CarIdCargo`,`TblRoles_RolIdRol`,
`TalPrimerNombre`,`TalSegundoNombre`,
`TalPrimerApellido`,`TalSegundoApellido`,
`TalTelefono`,`TalActivoInactivo`, `TblTiposDocumentos_TipIDTipoDocumento`)
    VALUES (InTblEspecialidades_EspIdEspecialidad,
    InTblSedesAtencion_SedIdSede,
    InTalClaveProfesional,
    InTalIdProfesionalCedula,
    InTblCargos_CarIdCargo,
    InTblRoles_RolIdRol,
    InTalPrimerNombre,
    InTalSegundoNombre,
    InTalPrimerApellido,
    InTalSegundoApellido,
    InTalTelefono,
    InTalActivoInactivo,
    InTblTiposDocumentos_TipIDTipoDocumento);
END //


-- Procedimiento almacenado para consulta general Talentohumano

DELIMITER //
CREATE PROCEDURE CnTalentohumano()
BEGIN
SELECT *
FROM `TbltalentoHumano`
ORDER BY `TalPrimerApellido` ASC;
END //


-- Procedimiento almacenado para consulta por documento Talentohumano

DELIMITER //
CREATE PROCEDURE CnDcTalentohumano(CnDcTalIdProfesionalCedula VARCHAR(13))
BEGIN
SELECT *
FROM `TbltalentoHumano`
WHERE `TalIdProfesionalCedula` LIKE CONCAT (`CnDcTalIdProfesionalCedula`,'%')
ORDER BY `TalIdProfesionalCedula` ASC;
END //


-- Procedimiento almacenado para consulta  cargo Talentohumano

DELIMITER //
CREATE PROCEDURE CnCrTalentohumano(CnCrTblCargos_CarIdCargo INT(3))
BEGIN
SELECT *
FROM `TbltalentoHumano`
WHERE `TblCargos_CarIdCargo` LIKE CONCAT (CnCrTblCargos_CarIdCargo,'%')
ORDER BY `TalPrimerApellido` ASC;
END //


-- Procedimiento almacenado para consulta especialidad Talentohumano

DELIMITER //
CREATE PROCEDURE CnEsTalentohumano(CnEsTblEspecialidades_EspIdEspecialidad INT(3))
BEGIN
SELECT *
FROM `TbltalentoHumano`
WHERE `TblEspecialidades_EspIdEspecialidad`
LIKE CONCAT (CnEsTblEspecialidades_EspIdEspecialidad,'%')
ORDER BY `TalPrimerApellido` ASC;
END //


-- Procedimiento almacenado para consulta especialidad en cruce activo/inactivo Talentohumano

DELIMITER //
CREATE PROCEDURE CnEsAcInTalentohumano(CnEsTblEspecialidades_EspIdEspecialidad INT(3),
`CnAcInTalActivoInactivo` BOOL)
BEGIN
SELECT *
FROM `TbltalentoHumano`
WHERE `TblEspecialidades_EspIdEspecialidad`
LIKE CONCAT (CnEsTblEspecialidades_EspIdEspecialidad,'%')
AND `TalActivoInactivo` = `CnAcInTalActivoInactivo`
ORDER BY `TalPrimerApellido` ASC;
END //


-- Procedimiento almacenado para consulta rol en cruce sede atención Talentohumano

DELIMITER //
CREATE PROCEDURE CnRlSaTalentohumano(CnRlTblRoles_RolIdRol INT(3),
CnSaTblSedesAtencion_SedIdSede INT(3))
BEGIN
SELECT *
FROM `TbltalentoHumano`
WHERE `TblRoles_RolIdRol` = CnRlTblRoles_RolIdRol
AND `TblSedesAtencion_SedIdSede` = CnSaTblSedesAtencion_SedIdSede
ORDER BY `TblRoles_RolIdRol` ASC;
END //




-- ##BENEFICIARIO

-- Procedimineto almacenado para ingresar Beneficiario

DELIMITER //
CREATE PROCEDURE InBeneficiario
(IN InBenId VARCHAR(13),
IN InTblEstrato_EstIdEst INT(3),
IN InBenSegundoApellido VARCHAR(64),
IN InBenPrimerApellido VARCHAR(64),
IN InBenSegundoNombre VARCHAR(64),
IN InBenPrimerNombre VARCHAR(64),
IN InBenFechaNacimiento DATE,
IN InTblGenero_GenIdGenero INT(2),
IN InBenDireccion VARCHAR(128),
IN InBenFechaMatricula DATETIME,
IN InTblModalidAdatencion_MoAteIdModalidadAtencion INT(2),
IN InTblCiudad_CiuIdCiudad_Nac INT (4),
IN InBenEstado BOOL)
BEGIN
INSERT INTO `TblBeneficiario`(`BenId`,
`TblEstrato_EstIdEst`,`BenSegundoApellido`,
`BenPrimerApellido`,`BenSegundoNombre`,
`BenPrimerNombre`,`BenFechaNacimiento`,
`TblGenero_GenIdGenero`,`BenDireccion`,
`BenFechaMatricula`,`TblTipoBeneficiario_TpBenIdTipoBeneficiario`,`TblModalidAdatencion_MoAteIdModalidadAtencion`
,`InTblCiudad_CiuIdCiudad_Nac`,`BenEstado`)
    VALUES (
    InBenId,
    InTblEstrato_EstIdEst,
    InBenSegundoApellido,
    InBenPrimerApellido,
    InBenSegundoNombre,
    InBenPrimerNombre,
    InBenFechaNacimiento,
    InTblGenero_GenIdGenero,
    InBenDireccion,
    InBenFechaMatricula,
    InTblModalidAdatencion_MoAteIdModalidadAtencion,
    InTblCiudad_CiuIdCiudad_Nac,
    InBenEstado
    );
END //


-- Procedimiento almacenado para consulta general Beneficiario

DELIMITER //
CREATE PROCEDURE CnBeneficiario()
BEGIN
SELECT *
FROM `TblBeneficiario`
ORDER BY `BenPrimerApellido` ASC;
END //




-- Procedimiento almacenado para consulta por documento Beneficiario

DELIMITER //
CREATE PROCEDURE CnDcBeneficiario(CnDcBenId VARCHAR(13))
BEGIN
SELECT *
FROM `TblBeneficiario`
WHERE `BenId` LIKE CONCAT (CnDcBenId,'%')
ORDER BY `BenId` ASC;
END //


-- Procedimiento almacenado para consulta género Beneficiario

DELIMITER //
CREATE PROCEDURE CnGrBeneficiario(CnGrTblGenero_GenIdGenero INT(2))
BEGIN
SELECT *
FROM `TblBeneficiario`
WHERE `BenId` LIKE CONCAT (CnGrTblGenero_GenIdGenero,'%')
ORDER BY `BenPrimerApellido` ASC;
END //



-- Procedimiento almacenado para consulta género en cruce activo/inactivo Beneficiario

DELIMITER //
CREATE PROCEDURE CnGeAcInTalentohumano(CnGeTblGenero_GenIdGenero INT(2),
`CnAcInBenEstado` BOOL)
BEGIN
SELECT *
FROM `TblBeneficiario`
WHERE `TblGenero_GenIdGenero`
LIKE CONCAT (CnGeTblGenero_GenIdGenero,'%')
AND `BenEstado` = `CnAcInBenEstado`
ORDER BY `BenPrimerApellido` ASC;
END //



-- ##ALDULTO RESPONSABLE

-- Procedimineto almacenado para ingresar Adulto responsable


DELIMITER //
CREATE PROCEDURE InAdultoResponsable
(IN InAdResId VARCHAR(13),
IN InTblEstrato_EstIdEst INT(3),
IN InAdResSegundoApellido VARCHAR(64),
IN InAdResPrimerApellido VARCHAR(64),
IN InAdResSegundoNombre VARCHAR(64),
IN InAdResPrimerNombre VARCHAR(64),
IN InAdResTelefono1 VARCHAR(17),
IN InAdResTelefono2 VARCHAR(17),
IN InTblGenero_GenIdGenero INT(2),
IN InAdResDireccion VARCHAR(128),
IN InTblParentesco_ParIdParentesco INT(2))
BEGIN
INSERT INTO `TblAdultoResponsable`(
`AdResId`,
`TblEstrato_EstIdEst`,
`AdResSegundoApellido`,
`AdResPrimerApellido`,
`AdResSegundoNombre`,
`AdResPrimerNombre`,
`AdResTelefono1`,
`AdResTelefono2`,
`TblGenero_GenIdGenero`,
`AdResDireccion`,
`TblParentesco_ParIdParentesco`)
    VALUES (InAdResId,
    InTblEstrato_EstIdEst,
    InAdResSegundoApellido,
    InAdResPrimerApellido,
    InAdResSegundoNombre,
    InAdResPrimerNombre,
    InAdResTelefono1,
    InAdResTelefono2,
    InTblGenero_GenIdGenero,
    InAdResDireccion,
    InTblParentesco_ParIdParentesco
    );
END //


-- Procedimiento almacenado para consulta general Adulto responsable

DELIMITER //
CREATE PROCEDURE CnAdultoResponsable()
BEGIN
SELECT *
FROM `TblAdultoResponsable`
ORDER BY `AdResPrimerApellido` ASC;
END //


-- Procedimiento almacenado para consulta por documento Adulto responsable

DELIMITER //
CREATE PROCEDURE CnDcAdultoResponsable(CnDcAdResId VARCHAR(13))
BEGIN
SELECT *
FROM `TblAdultoResponsable`
WHERE `AdResId` LIKE CONCAT (CnDcAdResId,'%')
ORDER BY `AdResId` ASC;
END //


-- Procedimiento almacenado para consulta género Adulto responsable

DELIMITER //
CREATE PROCEDURE CnGrAdultoResponsable(CnGrTblGenero_GenIdGenero INT(2))
BEGIN
SELECT *
FROM `TblAdultoResponsable`
WHERE `AdResId` LIKE CONCAT (CnGrTblGenero_GenIdGenero,'%')
ORDER BY `AdResPrimerApellido` ASC;
END //



-- Procedimiento almacenado para consulta género en cruce activo/inactivo Adulto responsable

DELIMITER //
CREATE PROCEDURE CnGeAcInAdultoResponsable(CnGeTblGenero_GenIdGenero INT(2),
CnAcInBenEstado BOOL)
BEGIN
SELECT *
FROM `TblBeneficiario`
WHERE `TblGenero_GenIdGenero`
LIKE CONCAT (CnGeTblGenero_GenIdGenero,'%')
AND `BenEstado` = CnAcInBenEstado
ORDER BY `BenPrimerApellido` ASC;
END //





-- ##Tamizaje Nutricional

-- Procedimineto almacenado para ingresar Tamizaje Nutricional


DELIMITER //
CREATE PROCEDURE InTamizajeNutricional
(IN InTblBeneficiario_BenId VARCHAR(13),
IN InTamIdHistoriaN INT(8),
IN InTamDiagnosticoNutri VARCHAR(256),
IN InTamPeso FLOAT(20,2),
IN InTamTalla FLOAT(20,2),
IN InTamPBraquial FLOAT(20,2),
IN InTamPCefalico FLOAT(20,2),
IN InTamFechaAtencion DATETIME,
IN InTbltalentoHumano_TalIdProfesionalCedula VARCHAR(13),
IN InTamObservaciones VARCHAR(1024),
IN InTblSedesAtencion_SedIdSede INT(3),
IN InTblClasificacionNutricional_IdClasificacionNut INT(2),
IN InTblClasificacionPerB_IdClasificacionPB INT(2),
IN InTblClasificacionPerC_IdClasificacionPC INT(2))
BEGIN
INSERT INTO `TblRelTamizajeNutricional`(
`TblBeneficiario_BenId`,
`TamIdHistoriaN`,
`TamDiagnosticoNutri`,
`TamPeso`,
`TamTalla`,
`TamPBraquial`,
`TamPCefalico`,
`TamFechaAtencion`,
`TbltalentoHumano_TalIdProfesionalCedula`,
`TamObservaciones`,
`TblSedesAtencion_SedIdSede`,
`TblClasificacionNutricional_IdClasificacionNut`,
`TblClasificacionPerB_IdClasificacionPB`,
`TblClasificacionPerC_IdClasificacionPC`)
    VALUES (InTblBeneficiario_BenId,
    InTamIdHistoriaN,
    InTamDiagnosticoNutri,
    InTamPeso,
    InTamTalla,
    InTamPBraquial,
    InTamPCefalico,
    InTamFechaAtencion,
    InTbltalentoHumano_TalIdProfesionalCedula,
    InTamObservaciones,
    InTblSedesAtencion_SedIdSede,
    InTblClasificacionNutricional_IdClasificacionNut,
    InTblClasificacionPerB_IdClasificacionPB,
    InTblClasificacionPerC_IdClasificacionPC);
END //


-- Procedimiento almacenado para consulta general Tamizaje Nutricional

DELIMITER //
CREATE PROCEDURE CnTamizajeNutricional()
BEGIN
SELECT *
FROM `TblRelTamizajeNutricional`
ORDER BY `TblBeneficiario_BenId` ASC;
END //


-- Procedimiento almacenado para consulta por ID Tamizaje Nutricional

DELIMITER //
CREATE PROCEDURE CnIdTamizajeNutricional(CnIdTamIdHistoriaN INT(8))
BEGIN
SELECT *
FROM `TblRelTamizajeNutricional`
WHERE `TamIdHistoriaN` LIKE CONCAT (CnIdTamIdHistoriaN,'%')
ORDER BY `TblBeneficiario_BenId` ASC;
END //


-- Procedimiento almacenado para consulta fecha creación Tamizaje Nutricional

DELIMITER //
CREATE PROCEDURE CnFcTamizajeNutricional(CnFcreTamizajeNutricional DATETIME)
BEGIN
SELECT *
FROM `TblRelTamizajeNutricional`
WHERE `TamFechaAtencion` LIKE CONCAT (CnFcreTamizajeNutricional,'%')
ORDER BY `TblBeneficiario_BenId` ASC;
END //



-- ##Producto

-- Procedimiento almacenado para ingresar Producto

DELIMITER //
CREATE PROCEDURE InProducto(IN InProIdProducto VARCHAR(10),
IN InTblMarca_MarIdMarca INT(3),
IN InTblUnidadesMedidas_UniIdUnidadMedida INT(3),
IN InTblTiposProductos_TipTiposProductos INT(2),
IN InProNombreProducto VARCHAR(128),
IN InProFechaCreacion DATETIME)
BEGIN
INSERT INTO `TblProducto`(`ProIdProducto`,
`TblMarca_MarIdMarca`,
`TblUnidadesMedidas_UniIdUnidadMedida`,
`TblTiposProductos_TipTiposProductos`,
`ProNombreProducto`,
`ProFechaCreacion`)
    VALUES (InProIdProducto,
    InTblMarca_MarIdMarca,
    InTblUnidadesMedidas_UniIdUnidadMedida,
    InTblTiposProductos_TipTiposProductos,
    InProNombreProducto,
    InProFechaCreacion);
END //


-- Procedimiento almacenado para consultar Producto

DELIMITER //
CREATE PROCEDURE CnProducto()
BEGIN
SELECT *
FROM `TblProducto`
ORDER BY `ProIdProducto` ASC;
END //


-- Procedimiento almacenado para consulta por Nombre Producto

DELIMITER //
CREATE PROCEDURE CnNmPrProducto(CnNmProNombreProducto INT(8))
BEGIN
SELECT *
FROM `TblProducto`
WHERE `ProNombreProducto` LIKE CONCAT (CnNmProNombreProducto,'%')
ORDER BY `ProIdProducto` ASC;
END //


-- Procedimiento almacenado para consulta por código Producto

DELIMITER //
CREATE PROCEDURE CnCdPrProducto(CnCdProIdProducto VARCHAR(10))
BEGIN
SELECT *
FROM `TblProducto`
WHERE `ProIdProducto` LIKE CONCAT (CnCdProIdProducto,'%')
ORDER BY `ProIdProducto` ASC;
END //


-- Procedimiento almacenado para consulta nombre producto en cruce marca ## revisar si es funcional o no?

DELIMITER //
CREATE PROCEDURE CnNmPrMrMarProducto(CnNmPrProNombreProducto VARCHAR(128),
CnPrMrTblMarca_MarIdMarca INT(3))
BEGIN
SELECT *
FROM `TblProducto`
WHERE `ProNombreProducto`
LIKE CONCAT (CnNmPrProNombreProducto,'%')
AND `TblMarca_MarIdMarca` = `CnPrMrTblMarca_MarIdMarca`
ORDER BY `ProNombreProducto` ASC;
END //



--######## Proveedor

-- Procedimiento almacenado para ingresar Proveedor

DELIMITER //
CREATE PROCEDURE InProveedor
(IN InPrvNitProveedor VARCHAR(12),
IN InPrvPersonaContacto VARCHAR(128),
IN InPrvRazonSocial VARCHAR(128),
IN InPrvEmail VARCHAR(64),
IN InPrvDireccion VARCHAR(64),
IN InPrvTelefono VARCHAR(17),
IN InPrvTelefono2 VARCHAR(17),
IN InProvFechaCreacion DATETIME,
IN InTblCiudad_CiuIdCiudad INT(4))
BEGIN
INSERT INTO `TblProveedor`(
`PrvNitProveedor`,
`PrvPersonaContacto`,
`PrvRazonSocial`,
`PrvEmail`,
`PrvDireccion`,
`PrvTelefono`,
`PrvTelefono2`,
`ProvFechaCreacion`,
`TblCiudad_CiuIdCiudad`)
    VALUES (InPrvNitProveedor,
    InPrvPersonaContacto,
    InPrvRazonSocial,
    InPrvEmail,
    InPrvDireccion,
    InPrvTelefono,
    InPrvTelefono2,
    InProvFechaCreacion,
    InTblCiudad_CiuIdCiudad);
END //


-- Procedimiento almacenado para consulta ID general Proveedor

DELIMITER //
CREATE PROCEDURE CnProveedor()
BEGIN
SELECT *
FROM `TblProveedor`
ORDER BY `PrvNitProveedor` ASC;
END //


-- Procedimiento almacenado para consulta por PrvPersonaContacto Proveedor

DELIMITER //
CREATE PROCEDURE CnPProveedor(CnPPrvPersonaContacto INT(8))
BEGIN
SELECT *
FROM `TblProveedor`
WHERE `PrvPersonaContacto` LIKE CONCAT (CnPPrvPersonaContacto,'%')
ORDER BY `PrvNitProveedor` ASC;
END //



-- Procedimiento almacenado para consulta RazonSocial en cruce con ciudad, revisar si es funcional o no?

DELIMITER //
CREATE PROCEDURE CnRsCProveedor(CnRsPrvRazonSocial VARCHAR(128),
CnCTblCiudad_CiuIdCiudad INT(4))
BEGIN
SELECT *
FROM `TblProveedor`
WHERE `PrvRazonSocial`
LIKE CONCAT (CnRsPrvRazonSocial,'%')
AND `TblCiudad_CiuIdCiudad` = CnCTblCiudad_CiuIdCiudad
ORDER BY `PrvNitProveedor` ASC;
END //



-- ##Pedido
-- Procedimineto almacenado para ingresar Pedido

DELIMITER //
CREATE PROCEDURE InPedido(IN InPedIDpedido VARCHAR(48),
IN InPedFecha DATE,
IN InPedObservacion VARCHAR(256),
IN InTblProveedor_PrvNitProveedor VARCHAR(12))
BEGIN
INSERT INTO `TblPedido`(`PedIDpedido`,`PedFecha`,`PedObservacion`,`TblProveedor_PrvNitProveedor`)
    VALUES (InPedIDpedido, InPedFecha, InPedObservacion, InTblProveedor_PrvNitProveedor
    );
END //


-- Procedimiento almacenado para consulta general Pedido

DELIMITER //
CREATE PROCEDURE CnPedido()
BEGIN
SELECT *
FROM `TblPedido`
ORDER BY `PedIDpedido` ASC;
END //


-- Procedimiento almacenado para consulta PedIDpedido en cruce con TblProveedor_PrvNitProveedor,
-- revisar si es funcional o no?

DELIMITER //
CREATE PROCEDURE CnIdPrCPedido(CnPedIDpedido INT(5),
CnPrvTblProveedor_PrvNitProveedor VARCHAR(12))
BEGIN
SELECT *
FROM `TblPedido`
WHERE `PedIDpedido`
LIKE CONCAT (CnPedIDpedido,'%')
AND `TblProveedor_PrvNitProveedor` = CnPrvTblProveedor_PrvNitProveedor
ORDER BY `PedIDpedido` ASC;
END //




-- ##Detalle Pedido
-- Procedimineto almacenado para ingresar Detalle Pedido--


DELIMITER //
CREATE PROCEDURE InDetallepedido(IN InTblPedido_PedIDpedido INT(5),
IN InTblProducto_ProIDProducto VARCHAR(10),
IN InDetValorUnitario FLOAT(20,2),
IN InDetCantidad FLOAT(20,2))
BEGIN
INSERT INTO `TblDetallePedido`(`TblPedido_PedIDpedido`,
`TblProducto_ProIDProducto`,
`DetValorUnitario`,
`DetCantidad`)
    VALUES (InTblPedido_PedIDpedido,
    InTblProducto_ProIDProducto,
    InDetValorUnitario,
    InDetCantidad
    );
END //


-- Procedimiento almacenado para consulta general Detalle Pedido

DELIMITER //
CREATE PROCEDURE CnDetallePedido()
BEGIN
SELECT *
FROM `TblDetallePedido`
ORDER BY `TblPedido_PedIDpedido` ASC;
END //



-- ##Entrada Inventario
-- Procedimineto almacenado para ingresar Entrada Inventario--

DELIMITER //
CREATE PROCEDURE InEntradaInventario(
IN InEntIdEntradaInventario VARCHAR(10),
IN InTblProveedor_PrvNitProveedor VARCHAR(12),
IN InEntFechaEntradaInventario DATE,
IN InEntObservacionesGen VARCHAR(256)
)
BEGIN
INSERT INTO `TblEntradaInventario`(`EntIdEntradaInventario`,
`TblProveedor_PrvNitProveedor`,
`EntFechaEntradaInventario`,
`EntObservacionesGen`
)
    VALUES (InEntIdEntradaInventario,
    InTblProveedor_PrvNitProveedor,
    InEntFechaEntradaInventario,
    InEntObservacionesGen
    );
END //


-- Procedimiento almacenado para consulta general Entrada Inventario

DELIMITER //
CREATE PROCEDURE CnEntradaInventario()
BEGIN
SELECT *
FROM `TblEntradaInventario`
ORDER BY `EntIdEntradaInventario` ASC;
END //



-- ##DetalleEntradaInventario
-- Procedimineto almacenado para ingresar Detalle EntradaInventario--

DELIMITER //
CREATE PROCEDURE InDetalleEntradaInventario(
IN InTblEntradaInventario_EntIdEntradaInventario INT(5),
IN InTblProducto_ProIdProducto VARCHAR(10),
IN InDEICantidad FLOAT (20,2),
IN InDEIObservacion VARCHAR(128),
IN InDEIVerificacion BOOL)
BEGIN
INSERT INTO `TblDetalleEntradaInventario`(
`TblEntradaInventario_EntIdEntradaInventario`,
`TblProducto_ProIdProducto`,
`DEICantidad`,
`DEIObservacion`,
`DEIVerificacion`
)
    VALUES (
    InTblEntradaInventario_EntIdEntradaInventario,
    InTblProducto_ProIdProducto,
    InDEICantidad,
    InDEIObservacion,
    InDEIVerificacion
    );
END //


-- Procedimiento almacenado para consulta general Detalle EntradaInventario--

DELIMITER //
CREATE PROCEDURE CnDetalleEntradaInventario()
BEGIN
SELECT *
FROM `TblDetalleEntradaInventario`
ORDER BY `TblEntradaInventario_EntIdEntradaInventario` ASC;
END //


-- Procedimiento almacenado para consulta salida sede

DELIMITER //
CREATE PROCEDURE CnSaSdSalidaInventario(CnSalIdSalidaInventario INT(4))
BEGIN
SELECT *
FROM `TblSalidaInventario`
WHERE `SalIdSalidaInventario` = CnSalIdSalidaInventario
ORDER BY `SalIdSalidaInventario` ASC;
END //


-- Procedimiento almacenado para consulta entrada de Detalle EntradaInventario--

DELIMITER //
CREATE PROCEDURE CnEnEntradaInventario(CnTblEntradaInventario_EntIdEntradaInventario INT(5))
BEGIN
SELECT *
FROM `TblDetalleEntradaInventario`
WHERE `TblEntradaInventario_EntIdEntradaInventario` LIKE (CnTblEntradaInventario_EntIdEntradaInventario,'%')
ORDER BY `TblEntradaInventario_EntIdEntradaInventario` ASC;
END //


-- Procedimiento almacenado para consulta ID producto de Detalle EntradaInventario--

DELIMITER //
CREATE PROCEDURE CnIdEntradaInventario(CnTblProducto_ProIdProducto VARCHAR(10))
BEGIN
SELECT *
FROM `TblDetalleEntradaInventario`
WHERE `TblProducto_ProIdProducto` LIKE (CnTblProducto_ProIdProducto,'%')
ORDER BY `TblProducto_ProIdProducto` ASC;
END //



-- ## Salida Inventario
-- Procedimineto almacenado para ingresar Salida Inventario


DELIMITER //
CREATE PROCEDURE InSalidaInventario(
IN InSalIdSalidaInventario INT(6),
IN InTblSedesAtencion_SedIdSede INT(2),
IN InSalFechaSalidaInventario DATETIME,
IN InSalObseravaciones VARCHAR(256)
)
BEGIN
INSERT INTO `TblSalidaInventario`(
`SalIdSalidaInventario`,
`TblSedesAtencion_SedIdSede`,
`SalFechaSalidaInventario`,
`SalObseravaciones`
)
    VALUES (
    InSalIdSalidaInventario,
    InTblSedesAtencion_SedIdSede,
    InSalFechaSalidaInventario,
    InSalObseravaciones
    );
END //


-- Procedimiento almacenado para consulta general Detalle Salida Inventario

DELIMITER //
CREATE PROCEDURE CnSalidaInventario()
BEGIN
SELECT *
FROM `TblSalidaInventario`
ORDER BY `SalIdSalidaInventario` ASC;
END //

 -- ------------------------------ Procedimiento almacenado para consulta salida Detalle Salida Inventario
DELIMITER //
CREATE PROCEDURE CnSaDetalleSalidaInventario(CnSaDtTblSalidaInventario_SalIdSalidaInventario INT(6))
BEGIN
SELECT *
FROM `TblDetallesalidaInventario`
WHERE `TblSalidaInventario_SalIdSalidaInventario` = CnSaDtTblSalidaInventario_SalIdSalidaInventario
ORDER BY `TblSalidaInventario_SalIdSalidaInventario` ASC;
END //


-- Procedimiento almacenado para consulta producto Detalle Salida Inventario

DELIMITER //
CREATE PROCEDURE CnSaProDetalleSalidaInventario(CnSaProDtTblProducto_ProIdProducto VARCHAR(10))
BEGIN
SELECT *
FROM `TblDetallesalidaInventario`
WHERE `TblProducto_ProIdProducto` = CnSaProDtTblProducto_ProIdProducto
ORDER BY `TblSalidaInventario_SalIdSalidaInventario` ASC;
END //

-- ------------------------------------------------------------------------------------------------------------
-- ## Devolucion Proveedor
-- Procedimineto almacenado para ingresar Devolucion Proveedor


DELIMITER //
CREATE PROCEDURE InDevolucionProveedor(
IN InTblProveedor_PrvNitProveedor VARCHAR(13),
IN InDevIdDevolucion INT(4),
IN InDevFechaDevolucion DATETIME,
IN InDevObservacion VARCHAR(256)
)
BEGIN
INSERT INTO `TblDevolucionProveedor`(
`TblProveedor_PrvNitProveedor`,
`DevIdDevolucion`,
`DevFechaDevolucion`,
`DevObservacion`
)
    VALUES (
    InTblProveedor_PrvNitProveedor,
    InDevIdDevolucion,
    InDevFechaDevolucion,
    InDevObservacion
    );
END //


-- Procedimiento almacenado para consulta general Devolucion Proveedor

DELIMITER //
CREATE PROCEDURE CnDevolucionProveedor()
BEGIN
SELECT *
FROM `TblDevolucionProveedor`
ORDER BY `DevIdDevolucion` ASC;
END //


-- Procedimiento almacenado para consulta ID de Devolucion Proveedor

DELIMITER //
CREATE PROCEDURE CnIdDevolucionProveedor(CnDevIdDevolucion INT(4))
BEGIN
SELECT *
FROM `TblDevolucionProveedor`
WHERE `DevIdDevolucion` = CnDevIdDevolucion
ORDER BY `DevIdDevolucion` ASC;
END //




-- -----------------------------------------------------------------------------------------------------------
-- ## DetalleDevolucionProveedor
-- Procedimineto almacenado para ingresar Detalle Devolucion Proveedor


DELIMITER //
CREATE PROCEDURE InDetalleDevolucionProveedor(
IN InTblDevolucionProveedor_DevIdDevolucion INT(4),
IN InTblProducto_ProIdProducto VARCHAR(10),
IN InDDPCantidad FLOAT(20,2)
)
BEGIN
INSERT INTO `TblDetalleDevolucionProveedor`(
`TblDevolucionProveedor_DevIdDevolucion`,
`TblProducto_ProIdProducto`,
`DDPCantidad`
)
    VALUES (
    InTblDevolucionProveedor_DevIdDevolucion,
    InTblProducto_ProIdProducto,
    InDDPCantidad
    );
END //


-- Procedimiento almacenado para consulta general Detalle Devolucion Proveedor

DELIMITER //
CREATE PROCEDURE CnDetalleDevolucionProveedor()
BEGIN
SELECT *
FROM `TblDetalleDevolucionProveedor`
ORDER BY `DevIdDevolucion` ASC;
END //


-- Procedimiento almacenado para consulta ID Detalle Devolucion Proveedor

DELIMITER //
CREATE PROCEDURE CnIdDetalleDevolucionProveedor(CnTblDevolucionProveedor_DevIdDevolucion INT(4))
BEGIN
SELECT *
FROM `TblDetalleDevolucionProveedor`
WHERE `TblDevolucionProveedor_DevIdDevolucion` = CnTblDevolucionProveedor_DevIdDevolucion
ORDER BY `TblDevolucionProveedor_DevIdDevolucion` ASC;
END //


-- Procedimiento almacenado para consulta PRODUCTO Detalle Devolucion Proveedor

DELIMITER //
CREATE PROCEDURE CnPrDetalleDevolucionProveedor(CnTblProducto_ProIdProducto VARCHAR(4))
BEGIN
SELECT *
FROM `TblDetalleDevolucionProveedor`
WHERE `TblProducto_ProIdProducto` = `CnTblProducto_ProIdProducto`
ORDER BY `TblDevolucionProveedor_DevIdDevolucion` ASC;
END //


-- Procedimineto almacenado para ingresar Clasificación nutricional

DELIMITER //
CREATE PROCEDURE InClasificacionNutricional(IN InClasDesN VARCHAR(64))
BEGIN
INSERT INTO `TblClasificacionNutricional`(`ClasDesN`)
    VALUES (InClasDesN);
END //



-- Procedimiento almacenado para consultar Clasificación nutricional

DELIMITER //
CREATE PROCEDURE CnClasificacionNutricional()
BEGIN
SELECT *
FROM `TblClasificacionNutricional`
ORDER BY `ClasDesN` asc;
END //




 -- ##SISBEN

-- Procedimineto almacenado para ingresar Sisben --REVISAR Y MODIFICAR

DELIMITER //
CREATE PROCEDURE InSisben
(IN InGrupoSisben VARCHAR(13))
BEGIN
INSERT INTO `TblSisben`(`GrupoSisben`)
    VALUES (InGrupoSisben);
END //


-- Procedimiento almacenado para consulta general sisben --REVISAR Y MODIFICAR

DELIMITER //
CREATE PROCEDURE CnSisben()
BEGIN
SELECT *
FROM `TblSisben`
ORDER BY `GrupoSisben` ASC;
END //


-- Procedimineto almacenado para ingresar Perimetro braquial

DELIMITER //
CREATE PROCEDURE InClasificacionPerB(IN InClasDesPB VARCHAR(64))
BEGIN
INSERT INTO `TblClasificacionPerB`(`ClasDesPB`)
    VALUES (InClasDesPB);
END //



-- Procedimiento almacenado para consultar perimetro braquial

DELIMITER //
CREATE PROCEDURE CnClasificacionPerB()
BEGIN
SELECT *
FROM `TblClasificacionPerB`
ORDER BY `ClasDesPB` asc;
END //


 -- Procedimineto almacenado para ingresar Clasificación perimetro cefalico

DELIMITER //
CREATE PROCEDURE InClasificacionPerC(IN InClasDesPC VARCHAR(64))
BEGIN
INSERT INTO `TblClasificacionPerC`(`ClasDesPC`)
    VALUES (InClasDesPC);
END //



-- Procedimiento almacenado para consultar Clasificación perimetro cefalico

DELIMITER //
CREATE PROCEDURE CnClasificacionPerC()
BEGIN
SELECT *
FROM `TblClasificacionPerC`
ORDER BY `ClasDesPC` asc;
END //


-- Procedimiento almacenado para ingreso asistencia

DELIMITER //
CREATE PROCEDURE ProAsistencia(IN InAsiIdAsistente INT(9),  IN InTblBeneficiario_BenId VARCHAR(13), IN InAsiEstadoAsistencia BOOL, IN InTblSedesAtencion_SedIdSede INT(2), IN InTbltalentoHumano_TalIdProfesionalCedula VARCHAR (13))
BEGIN
INSERT INTO `TblAsistencia`(`AsiIdAsistente`, `TblBeneficiario_BenId`, `AsiFechaControlAsistencia`,`AsiEstadoAsistencia`, `TblSedesAtencion_SedIdSede`,`TbltalentoHumano_TalIdProfesionalCedula`)
    VALUES(InAsiIdAsistente, InTblBeneficiario_BenId, CURRENT_TIMESTAMP(), InAsiEstadoAsistencia, InTblSedesAtencion_SedIdSede, InTbltalentoHumano_TalIdProfesionalCedula);
END //


-- Procedimiento almacenado para consulta general Asistencia

DELIMITER //
CREATE PROCEDURE ConsultaGen()
BEGIN
SELECT * FROM TblAsistencia;
END //


-- Procedimiento almacenado para consulta por fecha de Asistencia

DELIMITER //
CREATE PROCEDURE ConsultaFecha(IN InAsiFechaControlAsistencia1 DATE, IN InAsiFechaControlAsistencia2 DATE)
BEGIN
SELECT * FROM `TblAsistencia` WHERE `AsiFechaControlAsistencia` BETWEEN InAsiFechaControlAsistencia1 AND InAsiFechaControlAsistencia2 ORDER BY AsiFechaControlAsistencia;
END //


-- Procedimiento almacenado para consulta por IdBeneficiario asistencia

DELIMITER //
CREATE PROCEDURE ConsultaPorBeneficiario(IN InTblBeneficiario_BenId VARCHAR(13))
BEGIN
SELECT * FROM `TblAsistencia` WHERE `TblBeneficiario_BenId` = InTblBeneficiario_BenId;
END //




-- aquí empiezan las funciones

-- FUNCIONES, ¿cuántos profesionales hay activos?

DELIMITER //
CREATE FUNCTION FnEstadoTalentoHumano(FnTalActivoInactivo BOOL)
RETURNS INT
DETERMINISTIC
READS SQL DATA 
BEGIN
DECLARE CantEstado INT;
SELECT COUNT(*) INTO CantEstado FROM `TbltalentoHumano` WHERE `TalActivoInactivo` = FnTalActivoInactivo;
RETURN CantEstado;
END //


-- Función, ¿cúantos profesioanles hay en la sede x, en la especialidad y, cuantos profesioanles hay en determinado cargo?

DELIMITER //
CREATE FUNCTION FnCrSdEsTalentoHumano(FnTblEspecialidades_EspIdEspecialidad INT(3),
FnTblCargos_CarIdCargo INT(3),
FnTblSedesAtencion_SedIdSede INT(3))
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
DECLARE CantDetTalentoHumano INT;
SELECT COUNT(*) INTO CantDetTalentoHumano
FROM `TbltalentoHumano`
WHERE `TblEspecialidades_EspIdEspecialidad` = FnTblEspecialidades_EspIdEspecialidad
AND `TblCargos_CarIdCargo` = FnTblCargos_CarIdCargo
AND `TblSedesAtencion_SedIdSede` = FnTblSedesAtencion_SedIdSede;
RETURN CantDetTalentoHumano;
END //



-- Función ¿cuántos niños hay activos?
DELIMITER //
CREATE FUNCTION FnEstadoBeneficiarios(FnBenAc BOOL)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
DECLARE CantEstBen INT;
SELECT COUNT(*) INTO CantEstBen FROM `TblBeneficiario` WHERE `BenEstado` = FnBenAc;
RETURN CantEstBen;
END //



 -- Función, Funcion, ¿cuantos niños hay de determinado estrato?
DELIMITER //
CREATE FUNCTION FnCantEstrato(FnCantEstr INT(3))
RETURNS INT
DETERMINISTIC
READS SQL DATA 
BEGIN
DECLARE CantEstrato INT;
SELECT COUNT(*) INTO CantEstrato FROM `TblBeneficiario` WHERE `TblEstrato_EstIdEst` = FnCantEstr;
RETURN CantEstrato;
END //


 -- Función, Funcion, ¿cuantos niños hay de determinado grupo sisben?

DELIMITER //
CREATE FUNCTION FnCantNiSisben(FnGrupoSisben INT(3))
RETURNS INT
DETERMINISTIC
READS SQL DATA 
BEGIN
DECLARE CantNiSisben INT;
SELECT COUNT(*) INTO CantNiSisben FROM `TblBeneficiario` WHERE `TblSisben_TblSisIdSisben` = FnGrupoSisben;
RETURN CantNiSisben;
END //


 -- Función¿cántos niños hay de determinada edad?

DELIMITER //
CREATE FUNCTION FnEdadBeneficiario(FnEdBen INT(2))
RETURNS INT
DETERMINISTIC
READS SQL DATA 
BEGIN
DECLARE CantEdBen INT;
SELECT COUNT(*) INTO CantEdBen FROM `TblBeneficiario` WHERE `BenFechaNacimiento` = FnEdBen;
RETURN CantEdBen;
END //



-- Función, ¿cuántos niños hay de determinado género? -- ya quedo revisada en consola

DELIMITER //
CREATE FUNCTION FnGeBeneficiario(FnGeBen INT (2))
RETURNS INT
DETERMINISTIC
READS SQL DATA 
BEGIN
DECLARE CantGeBen INT;
SELECT COUNT(*) INTO CantGeBen FROM `TblBeneficiario` WHERE `TblGenero_GenIdGenero` = FnGeBen;
RETURN CantGeBen;
END //


-- función ¿cuántos niños hay en determinada modalidad de atención? -- ya quedo revisada en consola, revisar el llamado

DELIMITER //
CREATE FUNCTION FnMdAteBeneficiario(FnMdAteBen INT(2))
RETURNS INT
DETERMINISTIC
READS SQL DATA 
BEGIN
DECLARE CanMdAteBen INT;
SELECT COUNT(*)
INTO CanMdAteBen
FROM `TblBeneficiario`
WHERE `TblModalidAdatencion_MoAteIdModalidadAtencion` = FnMdAteBen;
RETURN CanMdAteBen;
END //


 -- Función, Función. ¿un adulto responsable, cuantos beneficiarios tiene a cargo?

DELIMITER //
CREATE FUNCTION FnBeneficiarioxAdulto(FnAdResId VARCHAR(13))
RETURNS INT
DETERMINISTIC
READS SQL DATA 
BEGIN
DECLARE CantBeneficiarioxAdulto INT;
SELECT COUNT(*) INTO `CantBeneficiarioxAdulto` FROM `TblBeneficiario_TblAdultoResponsable` WHERE `TblAdultoResponsable_AdResId` = FnAdResId;
RETURN CantBeneficiarioxAdulto;
END //



 -- FUNCIONES DE LA TABLA DETALLE PEDIDO
 -- Función ¿el valor máximo de un producto?


DELIMITER //
CREATE FUNCTION FnVlrMaxProducto(FnTblProducto_ProIDProducto VARCHAR(10))
RETURNS FLOAT
DETERMINISTIC
READS SQL DATA 
BEGIN
DECLARE VlrMaxProducto FLOAT;
SELECT MAX(`DetValorUnitario`) AS `ValorMaximoProducto`
INTO `VlrMaxProducto`
FROM `TblDetallePedido`
WHERE `TblProducto_ProIDProducto`= FnTblProducto_ProIDProducto;
RETURN VlrMaxProducto;
END //





-- FUNCIONES DE LA TABLA DETALLE PEDIDO
-- Función ¿el valor mínimo de un producto?


DELIMITER //
CREATE FUNCTION FnVlrMinProducto(FnTblProducto_ProIDProducto VARCHAR(10))
RETURNS FLOAT
DETERMINISTIC
READS SQL DATA 
BEGIN
DECLARE VlrMinProducto FLOAT;
SELECT MAX(`DetValorUnitario`) AS `ValorMinimoProducto`
INTO `VlrMinProducto`
FROM `TblDetallePedido`
WHERE `TblProducto_ProIDProducto`=FnTblProducto_ProIDProducto;
RETURN VlrMinProducto;
END //


-- Funciones ¿el valor promedio de un producto? -- REVISAR E NGRESAR A CONSOLA

DELIMITER //
CREATE FUNCTION FnVlrPromProducto(FnTblProducto_ProIDProducto VARCHAR(10))
RETURNS FLOAT
DETERMINISTIC
READS SQL DATA 
BEGIN
DECLARE VlrPromProducto FLOAT;
SELECT AVG (`DetValorUnitario`) AS `ValorPromedioProducto`
INTO `VlrPromProducto`
FROM `TblDetallePedido`
WHERE `TblProducto_ProIDProducto`=FnTblProducto_ProIDProducto;
RETURN VlrPromProducto;
END //



-- Función, ¿cuántos niños hay con determinado diagnostico?
-- revisar el WHERE, de acuerdo a la nueva tabla

DELIMITER //
CREATE FUNCTION FnClNuBeneficiario(FnClNuBen INT (2))
RETURNS INT
DETERMINISTIC
READS SQL DATA 
BEGIN
DECLARE CantClNuBen INT;
SELECT COUNT(*) INTO CantClNuBen
FROM `TblRelTamizajeNutricional`
WHERE `TblClasificacionNutricional_IdClasificacionNut` = FnClNuBen;
RETURN CantClNuBen;
END //


-- Función, ¿cuántos niños hay con determinado diagnostico? perimetro braquial

DELIMITER //
CREATE FUNCTION FnPerBBeneficiario(FnPerBBen INT (2))
RETURNS INT
DETERMINISTIC
READS SQL DATA 
BEGIN
DECLARE CantPerBBen INT;
SELECT COUNT(*) INTO CantPerBBen FROM `TblRelTamizajeNutricional` WHERE `TblClasificacionPerB_IdClasificacionPB` = FnPerBBen;
RETURN CantPerBBen;
END //



-- Función, ¿cuántos niños hay con determinado clasificación PerC?

DELIMITER //
CREATE FUNCTION FnPerCBeneficiario(FnPerCBen INT (2))
RETURNS INT
DETERMINISTIC
READS SQL DATA 
BEGIN
DECLARE CantPerCBen INT;
SELECT COUNT(*) INTO CantPerCBen
FROM `TblRelTamizajeNutricional`
WHERE `TblClasificacionPerC_IdClasificacionPC` = FnPerCBen;
RETURN CantPerCBen;
END //


-- Función, ¿Cuántos asistentes en determinadas fechas?

DELIMITER //
CREATE FUNCTION FnAsistenciaxFecha(FnFecha1 DATE, FnFecha2 DATE)
RETURNS INT
DETERMINISTIC
READS SQL DATA 
BEGIN
DECLARE CantAsistentesxFecha INT;
SELECT COUNT(*) INTO `CantAsistentesxFecha` FROM `TblAsistencia` WHERE `AsiFechaControlAsistencia` BETWEEN `FnFecha1` AND FnFecha2;
RETURN CantAsistentesxFecha;
END //


-- Función, ¿Cuántos beneficiarios por sede?

DELIMITER //
CREATE FUNCTION FnCantAsisxSede(FnSedesAtencion INT(2))
RETURNS INT
DETERMINISTIC
READS SQL DATA 
BEGIN
DECLARE CantAsistenciaxSede INT;
SELECT COUNT(*) INTO `CantAsistenciaxSede` FROM `TblAsistencia` WHERE `TblSedesAtencion_SedIdSede` = FnSedesAtencion;
RETURN CantAsistenciaxSede;
END //




--  ¿cuántos niños tienen determinada clasificación nutricional según género?

DELIMITER //
CREATE FUNCTION FnDxClGeBeneficiario(FnTblClasificacionNutricional_IdClasificacionNut INT(8), FnTblGenero_GenIdGenero INT (2))
RETURNS INT
DETERMINISTIC
READS SQL DATA 
BEGIN
DECLARE CantDxClGeBeneficiario INT;
SELECT COUNT(*)
INTO CantDxClGeBeneficiario
FROM TblRelTamizajeNutricional tbtm
INNER JOIN TblBeneficiario tbbn ON tbtm.TblBeneficiario_BenId = tbbn.BenId
WHERE tbtm.TblClasificacionNutricional_IdClasificacionNut = FnTblClasificacionNutricional_IdClasificacionNut
AND tbbn.TblGenero_GenIdGenero = FnTblGenero_GenIdGenero;
RETURN CantDxClGeBeneficiario;
END //


--  ¿cuántos niños tienen determinada clasificación PerB según género?

DELIMITER //
CREATE FUNCTION FnDxClPerBeGeBeneficiario(FnTblClasificacionPerB_IdClasificacionPB INT(2), FnTblGenero_GenIdGenero INT (2))
RETURNS INT
DETERMINISTIC
READS SQL DATA 
BEGIN
DECLARE CantDxClPerBeGeBeneficiario INT;
SELECT COUNT(*)
INTO CantDxClPerBeGeBeneficiario
FROM TblRelTamizajeNutricional tbtm
INNER JOIN TblBeneficiario tbbn ON tbtm.TblBeneficiario_BenId = tbbn.BenId
WHERE tbtm.TblClasificacionPerB_IdClasificacionPB = FnTblClasificacionPerB_IdClasificacionPB
AND tbbn.TblGenero_GenIdGenero = FnTblGenero_GenIdGenero;
RETURN CantDxClPerBeGeBeneficiario;
END //


--  ¿cuántos niños tienen determinada clasificación PerC según género?

DELIMITER //
CREATE FUNCTION FnDxClPerCeGeBeneficiario(FnTblClasificacionPerC_IdClasificacionPC INT(8), FnTblGenero_GenIdGenero INT (2))
RETURNS INT
DETERMINISTIC
READS SQL DATA 
BEGIN
DECLARE CantDxClPerCeGeBeneficiario INT;
SELECT COUNT(*)
INTO CantDxClPerCeGeBeneficiario
FROM TblRelTamizajeNutricional tbtm
INNER JOIN TblBeneficiario tbbn ON tbtm.TblBeneficiario_BenId = tbbn.BenId
WHERE tbtm.TblClasificacionPerC_IdClasificacionPC = FnTblClasificacionPerC_IdClasificacionPC
AND tbbn.TblGenero_GenIdGenero = FnTblGenero_GenIdGenero;
RETURN CantDxClPerCeGeBeneficiario;
END //


 -- Función, ¿la cantidad de productos por verificación? Yuen

DELIMITER //
CREATE FUNCTION FnCantProductosVerificados(FnCantProVer BOOL)
RETURNS INT
DETERMINISTIC
READS SQL DATA 
BEGIN
DECLARE CantProdVer INT;
SELECT COUNT(*) INTO CantProdVer FROM `TblDetalleEntradaInventario` WHERE `DEIVerificacion` = FnCantProVer;
RETURN CantProdVer;
END //



-- TRIGGERS 


-- Trigger control ingreso de producto.
DELIMITER //
CREATE TRIGGER TgProducto 
AFTER INSERT ON TblProducto
FOR EACH ROW
BEGIN
INSERT INTO TgTblProducto(`ProIdProducto`,`UsuarioSis`,`FechaMod`,`TipoMovimiento`)
VALUES(new.ProIdProducto, CURRENT_USER, CURRENT_TIMESTAMP, 'Ingreso');
END //


-- Trigger control de actualización de la descripciòn Producto.

DELIMITER //
CREATE TRIGGER TgProductoUp
BEFORE UPDATE ON TblProducto
FOR EACH ROW
BEGIN
INSERT INTO TgTblProducto (`ProIdProducto`,`ProNombreProductoA`, `ProNombreProductoN`, `UsuarioSis`, `FechaMod`,`TipoMovimiento`)
VALUES(NEW.ProIdProducto, OLD.ProNombreProducto, NEW.ProNombreProducto, CURRENT_USER, CURRENT_TIMESTAMP, 'Modificación');
END //


-- Trigger control de creación de la descripciòn talento humano.
DELIMITER //
CREATE TRIGGER TgInTalentoHumano
AFTER INSERT ON TbltalentoHumano
FOR EACH ROW
BEGIN
INSERT INTO TgTbltalentoHumano(`TalIdProfesionalCedulaN`, `UsuarioSis`, `FechaMod`, `TipoMovimiento`)
VALUES(new.TalIdProfesionalCedula, CURRENT_USER, CURRENT_TIMESTAMP,'Creación');
END//


-- Trigger control de actualización de talento humano.

DELIMITER //
CREATE TRIGGER TgTbltalentoHumanoUp
BEFORE UPDATE ON TbltalentoHumano
FOR EACH ROW
BEGIN
INSERT INTO TgTbltalentoHumano(`TblEspecialidades_EspIdEspecialidadN`,`TblSedesAtencion_SedIdSedeN`,`TalIdProfesionalCedulaN`, `TalClaveProfesionalN`,`TblCargos_CarIdCargoN`,`TblRoles_RolIdRolN`,`TalPrimerNombreN`,`TalSegundoNombreN`,`TalPrimerApellidoN`,`TalSegundoApellidoN`,`TalTelefonoN`,`TalActivoInactivoN`,`TblEspecialidades_EspIdEspecialidadA`,`TblSedesAtencion_SedIdSedeA`,`TalClaveProfesionalA`,`TblCargos_CarIdCargoA`,`TblRoles_RolIdRolA`,`TalPrimerNombreA`,`TalSegundoNombreA`,`TalPrimerApellidoA`,`TalSegundoApellidoA`,`TalTelefonoA`,`TalActivoInactivoA`,`UsuarioSis`,`FechaMod`,`TipoMovimiento`)
VALUES(NEW.TblEspecialidades_EspIdEspecialidad, NEW.TblSedesAtencion_SedIdSede, NEW.TalIdProfesionalCedula, NEW.TalClaveProfesional,NEW.TblCargos_CarIdCargo, NEW.TblRoles_RolIdRol, NEW.TalPrimerNombre, NEW.TalSegundoNombre, NEW.TalPrimerApellido, NEW.TalSegundoApellido, NEW.TalTelefono, NEW.TalActivoInactivo, OLD.TblEspecialidades_EspIdEspecialidad, OLD.TblSedesAtencion_SedIdSede, OLD.TalClaveProfesional, OLD.TblCargos_CarIdCargo, OLD.TblRoles_RolIdRol, OLD.TalPrimerNombre, OLD.TalSegundoNombre, OLD.TalPrimerApellido, OLD.TalSegundoApellido, OLD.TalTelefono, OLD.TalActivoInactivo, CURRENT_USER, CURRENT_TIMESTAMP, 'Modificación');
END//



-- Falta Verificar en servidor-- Trigger control de creación de la descripciòn Beneficiario.

DELIMITER //
CREATE TRIGGER TgTblBeneficiario
AFTER INSERT ON TblBeneficiario
FOR EACH ROW
BEGIN
INSERT INTO TgTblBeneficiario(`BenId`, `UsuarioSis`, `FechaMod`, `TipoMovimiento`)
VALUES(NEW.BenId, CURRENT_USER, CURRENT_TIMESTAMP,'Creación');
END//


-- falta verificar en servidor -- Trigger control de actualización de Beneficiario.

DELIMITER //
CREATE TRIGGER TgTblBeneficiarioUp
BEFORE UPDATE ON TblBeneficiario
FOR EACH ROW
BEGIN
INSERT INTO TgTblBeneficiario(`BenId`, `TblEstrato_EstIdEstN`, `BenSegundoApellidoN`, `BenPrimerApellidoN`, `BenSegundoNombreN`, `BenPrimerNombreN`, `BenFechaNacimientoN`, `BenDireccionN`, `TblModalidAdatencion_MoAteIdModalidadAtencionN`, `BenEstadoN`, `TblSisben_TblSisIdSisbenN`, `TblCiudad_CiuIdCiudad_NacN`, `TblEstrato_EstIdEstA`, `BenSegundoApellidoA`, `BenPrimerApellidoA`, `BenSegundoNombreA`, `BenPrimerNombreA`, `BenFechaNacimientoA`, `BenDireccionA`, `TblModalidAdatencion_MoAteIdModalidadAtencionA`, `BenEstadoA`, `UsuarioSis`, `FechaMod`, `TipoMovimiento`, `TblSisben_TblSisIdSisbenA`, `TblCiudad_CiuIdCiudad_NacA`)
VALUES(NEW.BenId, NEW.TblEstrato_EstIdEst, NEW.BenSegundoApellido, NEW.BenPrimerApellido, NEW.BenSegundoNombre, NEW.BenPrimerNombre, NEW.BenFechaNacimiento, NEW.BenDireccion, NEW.TblModalidAdatencion_MoAteIdModalidadAtencion, NEW.BenEstado, NEW.TblSisben_TblSisIdSisben, NEW.TblCiudad_CiuIdCiudad_Nac, OLD.TblEstrato_EstIdEst, OLD.BenSegundoApellido, OLD.BenPrimerApellido, OLD.BenSegundoNombre, OLD.BenPrimerNombre, OLD.BenFechaNacimiento, OLD.BenDireccion, OLD.TblModalidAdatencion_MoAteIdModalidadAtencion, OLD.BenEstado, CURRENT_USER, CURRENT_TIMESTAMP, 'Modificación', OLD.TblSisben_TblSisIdSisben, OLD.TblCiudad_CiuIdCiudad_Nac);
END//


-- Falta Verificar en servidor-- Trigger control de creación de la descripciòn adulto responsable.
DELIMITER //
CREATE TRIGGER TgTblAdultoResponsable
AFTER INSERT ON TblAdultoResponsable
FOR EACH ROW
BEGIN
INSERT INTO TgTblAdultoResponsable(`AdResIdN`,`UsuarioSis`, `FechaMod`, `TipoMovimiento`)
VALUES(NEW.AdResId, CURRENT_USER, CURRENT_TIMESTAMP,'Creación');
END//


-- falta verificar en servidor -- Trigger control de actualización de adulto responsable.
DELIMITER //
CREATE TRIGGER TgTblAdultoResponsableUp
BEFORE UPDATE ON TblAdultoResponsable
FOR EACH ROW
BEGIN
INSERT INTO TgTblAdultoResponsable(`AdResIdN`, `TblEstrato_EstIdEstN`, `AdResSegundoApellidoN`,`AdResPrimerApellidoN`,`AdResSegundoNombreN`,`AdResPrimerNombreN`,`AdResTelefono1N`,`AdResTelefono2N`,`AdResDireccionN`,`TblEstrato_EstIdEstA`, `AdResSegundoApellidoA`, `AdResPrimerApellidoA`, `AdResSegundoNombreA`, `AdResPrimerNombreA`, `AdResTelefono1A`, `AdResTelefono2A`, `AdResDireccionA`, `UsuarioSis`, `FechaMod`, `TipoMovimiento`)
VALUES(NEW.AdResId, NEW.TblEstrato_EstIdEst, NEW.AdResSegundoApellido, NEW.AdResPrimerApellido, NEW.AdResSegundoNombre, NEW.AdResPrimerNombre, NEW.AdResTelefono1, NEW.AdResTelefono2, NEW.AdResDireccion, OLD.TblEstrato_EstIdEst, OLD.AdResSegundoApellido, OLD.AdResPrimerApellido, OLD.AdResSegundoNombre, OLD.AdResPrimerNombre, OLD.AdResTelefono1, OLD.AdResTelefono2, OLD.AdResDireccion, CURRENT_USER, CURRENT_TIMESTAMP, 'Modificación');
END//



-- Trigger control ingreso de Tamizaje Nutricional
DELIMITER //
CREATE TRIGGER TgTamizajeNutricional 
AFTER INSERT ON TblRelTamizajeNutricional
FOR EACH ROW
BEGIN
INSERT INTO TgTblRelTamizajeNutricional(`TamIdHistoriaN`,`UsuarioSis`,`FechaMod`,`TipoMovimiento`)
VALUES(new.TamIdHistoriaN, CURRENT_USER, CURRENT_TIMESTAMP, 'Ingreso');
END //



-- Trigger Cantidad Disponible Creación

DELIMITER //
CREATE TRIGGER TgCrCantidadDisponible
AFTER INSERT ON TblCantidadDisponible
FOR EACH ROW
BEGIN
INSERT INTO TgTblCantidadDisponible(`TblProducto_ProIdProductoN`, `CantidadDisponibleN`, `UsuarioSis`, `FechaMod`, `TipoMovimiento`)
VALUES(NEW.TblProducto_ProIdProducto, NEW.CantidadDisponible, CURRENT_USER, CURRENT_TIMESTAMP, 'Creación');
END //
DELIMITER

-- Trigger Cantidad Disponible Actualización.

DELIMITER TgUPCantidadDisponible
BEFORE UPDATE ON TblCantidadDisponible
FOR EACH ROW
BEGIN
INSERT INTO TgTblCantidadDisponible(`TblProducto_ProIdProductoN`, `CantidadDisponibleN`, `TblProducto_ProIdProductoA`, `CantidadDisponibleA`, `UsuarioSis`, `FechaMod`, `TipoMovimiento`)
VALUES(NEW.TblProducto_ProIdProducto, NEW.CantidadDisponible, OLD.TblProducto_ProIdProducto, OLD.CantidadDisponible, CURRENT_USER, CURRENT_TIMESTAMP, 'Actualización');
END //


-- Trigger ingreso de Cantidad Sede

DELIMITER //
CREATE TRIGGER TgCantidadSede
AFTER INSERT ON TblCantidadSede
FOR EACH ROW
BEGIN
INSERT INTO TgTblCantidadSede(`TblProducto_ProIdProductoN`, `CantidadDisponibleN`, `TblSedesAtencion_SedIdSedeN`, `UsuarioSis`, `FechaMod`, `TipoMovimiento`)
VALUES(NEW.TblProducto_ProIdProducto, NEW.CantidadDisponibleSede, NEW.TblSedesAtencion_SedIdSede, CURRENT_USER, CURRENT_TIMESTAMP, 'Creación');
END //

-- Trigger actualización de Cantidad Sede

DELIMITER //
CREATE TRIGGER TgCantidadSedeUp
AFTER UPDATE ON TblCantidadSede
FOR EACH ROW
BEGIN
INSERT INTO TgTblCantidadSede(`TblProducto_ProIdProductoN`, `CantidadDisponibleN`, `TblSedesAtencion_SedIdSedeN`,
`TblProducto_ProIdProductoA`, `CantidadDisponibleA`, `TblSedesAtencion_SedIdSedeA`,
`UsuarioSis`, `FechaMod`, `TipoMovimiento`)
VALUES(NEW.TblProducto_ProIdProducto, NEW.CantidadDisponibleSede, NEW.TblSedesAtencion_SedIdSede, 
OLD.TblProducto_ProIdProducto, OLD.CantidadDisponibleSede, OLD.TblSedesAtencion_SedIdSede,
CURRENT_USER, CURRENT_TIMESTAMP, 'Actualización');
END //


-- Trigger creación proveedor.

DELIMITER //
CREATE TRIGGER TgProveedor
AFTER INSERT ON TblProveedor
FOR EACH ROW 
BEGIN
INSERT INTO TgTblProveedor(`PrvNitProveedorN`, `UsuarioSis`, `FechaMod`, `TipoMovimiento`)
VALUES(NEW.PrvNitProveedor, CURRENT_USER, CURRENT_TIMESTAMP, 'Ingreso');
END //


-- Trigger Actualización Proveedor.

DELIMITER //
CREATE TRIGGER TgProveedorUp
AFTER UPDATE ON TblProveedor
FOR EACH ROW
BEGIN
INSERT INTO TgTblProveedor(`PrvNitProveedorN`, `PrvPersonaContactoN`, `PrvEmailN`, `PrvDireccionN`, `PrvTelefonoN`, `PrvTelefono2N`, `TblCiudad_CiuIdCiudadN`, `PrvPersonaContactoA`, `PrvEmailA`, `PrvDireccionA`, `PrvTelefonoA`, `PrvTelefono2A`, `TblCiudad_CiuIdCiudadA`, `UsuarioSis`, `FechaMod`, `TipoMovimiento`)
VALUES(NEW.PrvNitProveedor, NEW.PrvPersonaContacto, NEW.PrvEmail, NEW.PrvDireccion, NEW.PrvTelefono, NEW.PrvTelefono2, NEW.TblCiudad_CiuIdCiudad, OLD.PrvPersonaContacto, OLD.PrvEmail, OLD.PrvDireccion, old.PrvTelefono, OLD.PrvTelefono2, OLD.TblCiudad_CiuIdCiudad, CURRENT_USER, CURRENT_TIMESTAMP, 'Actualización');
END //



-- Trigger ingreso de Pedido

DELIMITER //
CREATE TRIGGER TgPedido
AFTER INSERT ON TblPedido
FOR EACH ROW
BEGIN
INSERT INTO TgTblPedido(`PedIDpedidoC`, `UsuarioSis`, `FechaMod`, `TipoMovimiento`)
VALUES(NEW.PedIDpedido, CURRENT_USER, CURRENT_TIMESTAMP, 'Creación');
END //



-- Trigger ingreso de Entrada Inventario

DELIMITER //
CREATE TRIGGER TgEntradaInventario
AFTER INSERT ON TblEntradaInventario
FOR EACH ROW
BEGIN
INSERT INTO TgTblEntradaInventario(`EntIdEntradaInventarioC`, `UsuarioSis`, `FechaMod`, `TipoMovimiento`)
VALUES(NEW.EntIdEntradaInventario, CURRENT_USER, CURRENT_TIMESTAMP, 'Creación');
END //


-- Trigger ingreso de Salida Inventario

DELIMITER //
CREATE TRIGGER TgSalidaInventario
AFTER INSERT ON TblSalidaInventario
FOR EACH ROW
BEGIN
INSERT INTO TgTblSalidaInventario(`SalIdSalidaInventarioC`, `UsuarioSis`, `FechaMod`, `TipoMovimiento`)
VALUES(NEW.SalIdSalidaInventario, CURRENT_USER, CURRENT_TIMESTAMP, 'Creación');
END //


-- Trigger ingreso de Devolucion Proveedor

DELIMITER //
CREATE TRIGGER TgDevolucionProveedor
AFTER INSERT ON TblDevolucionProveedor
FOR EACH ROW
BEGIN
INSERT INTO TgTblDevolucionProveedor(`DevIdDevolucionC`, `UsuarioSis`, `FechaMod`, `TipoMovimiento`)
VALUES(NEW.DevIdDevolucion, CURRENT_USER, CURRENT_TIMESTAMP, 'Creación');
END //



-- Trigger ingreso de Devolucion Proveedor

DELIMITER //
CREATE TRIGGER TgAsistencia
AFTER INSERT ON TblAsistencia
FOR EACH ROW
BEGIN
INSERT INTO TgTblAsistencia(`TblBeneficiario_BenId`, `AsiFechaControlAsistencia`, `AsiEstadoAsistencia`, `TblSedesAtencion_SedIdSede`, `UsuarioSis`, `FechaMod`, `TipoMovimiento`)
VALUES(NEW.TblBeneficiario_BenId, NEW.AsiFechaControlAsistencia, NEW.AsiEstadoAsistencia, NEW.TblSedesAtencion_SedIdSede, CURRENT_USER, CURRENT_TIMESTAMP, 'Creación');
END //

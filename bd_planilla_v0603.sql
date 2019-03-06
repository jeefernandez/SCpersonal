/*
SQLyog Enterprise Trial - MySQL GUI v5.01
Host - 5.5.5-10.1.36-MariaDB : Database - planilla
*********************************************************************
Server version : 5.5.5-10.1.36-MariaDB
*/


/*Table structure for table `areas` */

CREATE TABLE `areas` (
  `id_area` tinyint(4) NOT NULL,
  `nom_area` varchar(50) NOT NULL,
  `est_area` char(1) NOT NULL,
  PRIMARY KEY (`id_area`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `areas` */

insert into `areas` values (1,'Recursos Humanos','1');
insert into `areas` values (2,'Producción','1');
insert into `areas` values (3,'Contabilidad','1');

/*Table structure for table `bonificacion_personal` */

CREATE TABLE `bonificacion_personal` (
  `idbonfi` int(11) NOT NULL,
  `id_tipo_bonifi` int(11) DEFAULT NULL,
  `idpersonal` int(11) DEFAULT NULL,
  `idplanilla` int(11) DEFAULT NULL,
  `idperiodo` int(11) DEFAULT NULL,
  `nummes` varchar(2) DEFAULT NULL,
  `valor_bonfi` decimal(10,2) DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`idbonfi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `cargos` */

CREATE TABLE `cargos` (
  `id_cargo` tinyint(4) NOT NULL,
  `nom_cargo` varchar(50) NOT NULL,
  `est_cargo` char(1) NOT NULL,
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cargos` */

insert into `cargos` values (1,'Conserje','1');
insert into `cargos` values (2,'Secretaria','1');
insert into `cargos` values (3,'Contador','1');
insert into `cargos` values (4,'Administrador','1');
insert into `cargos` values (5,'Programador','0');

/*Table structure for table `configurar_planilla` */

CREATE TABLE `configurar_planilla` (
  `idconfig` int(11) NOT NULL,
  `idperiodo` int(11) DEFAULT NULL,
  `idtipopla` int(11) DEFAULT NULL,
  `numes` varchar(2) DEFAULT NULL,
  `obs` text,
  `estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`idconfig`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `configurar_planilla` */

insert into `configurar_planilla` values (1,1,1,'01','Pago de Trabajadores','1');
insert into `configurar_planilla` values (2,1,1,'02','','0');
insert into `configurar_planilla` values (3,1,1,'03','','0');
insert into `configurar_planilla` values (4,1,2,'03','Utilidades','0');
insert into `configurar_planilla` values (5,2,1,'01','','0');

/*Table structure for table `descuento_personal` */

CREATE TABLE `descuento_personal` (
  `idtdsto` int(11) NOT NULL,
  `id_tipo_dscto` int(11) NOT NULL,
  `id_personal` int(11) DEFAULT NULL,
  `id_planilla` int(11) DEFAULT NULL,
  `id_periodo` int(11) DEFAULT NULL,
  `nummes` varchar(2) DEFAULT NULL,
  `valor_dscto` decimal(10,2) DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`idtdsto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `periodo` (
  `idperiodo` int(11) NOT NULL,
  `nameperiodo` varchar(50) DEFAULT NULL,
  `namecorto` varchar(20) DEFAULT NULL,
  `fechareg` date DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`idperiodo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `periodo` */

insert into `periodo` values (1,'2019','19','2019-01-01','1');

/*Table structure for table `personal` */

CREATE TABLE `personal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigoper` varchar(100) NOT NULL,
  `dno` char(8) DEFAULT NULL,
  `nombre` varchar(150) NOT NULL,
  `apellido` varchar(150) NOT NULL,
  `email` varchar(200) NOT NULL,
  `Passwordp` varchar(180) NOT NULL,
  `sexo` varchar(100) NOT NULL,
  `fechanac` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `pais` varchar(200) NOT NULL,
  `telefono` varchar(11) NOT NULL,
  `area` int(11) NOT NULL,
  `cargo` int(11) DEFAULT NULL,
  `sueldo` decimal(10,2) DEFAULT NULL,
  `estado` int(1) NOT NULL,
  `fecIngreso` date DEFAULT NULL,
  `sistema` char(3) NOT NULL,
  `numero` varchar(25) DEFAULT NULL,
  `tipouser` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `personal` */

insert into `personal` values (1,'EMP10806121','34343433','Jose','Fernandez','admin@admin.com','45e340b2402d2f6271a6c49e8e7ba06d','M','2019-02-15','Av las palmeras N° 546','Chiclayo','sochi','6587976',1,4,'434.00',1,'2017-11-10','ONP','',1);
insert into `personal` values (3,'09907887','14567890','Romina','Pacheco Diaz','rayanpa@gmail.com','','F','2019-01-30','Jr. Cusco N° 344','Trujillo','cusco','343434',1,2,'122.00',1,'2018-06-26','ONP','',0);
insert into `personal` values (5,'','12362514','Carlos','Capuñay Lopez','lopezjimmy@gmail.com','','M','2019-02-13','Jr la Unión N° 3434','Monsefu','','979343451',2,3,'1250.00',1,'2019-02-14','ONP','0001',0);
insert into `personal` values (6,'0006','34543543','Jacinto','Hernandz teran','hernana@gmail.com','202cb962ac59075b964b07152d234b70','M','2019-02-14','Los treboles','Tuman','','77878',1,3,'3434.00',1,'2019-02-14','AFP','34',1);

/*Table structure for table `planilla` */

CREATE TABLE `planilla` (
  `idplanilla` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `idperiodo` int(11) DEFAULT NULL,
  `idtipoplanilla` int(11) DEFAULT NULL,
  `idtrabajador` int(11) DEFAULT NULL,
  `sueldo` decimal(10,2) DEFAULT NULL,
  `total_dscto` decimal(10,2) DEFAULT NULL,
  `total_bonf` decimal(10,2) DEFAULT NULL,
  `netopagar` decimal(10,2) DEFAULT NULL,
  `estadoplanilla` char(1) DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`idplanilla`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `planilla` */

/*Table structure for table `sistema_pension` */

CREATE TABLE `sistema_pension` (
  `idtipo` int(11) NOT NULL,
  `name_sp` varchar(150) DEFAULT NULL,
  `valor_sp` decimal(10,2) DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`idtipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sistema_pension` */

/*Table structure for table `tipo_bonificacion` */

CREATE TABLE `tipo_bonificacion` (
  `idbonificacion` int(11) NOT NULL,
  `namebonificacion` varchar(125) DEFAULT NULL,
  `namecorto` varchar(5) DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`idbonificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipo_bonificacion` */

insert into `tipo_bonificacion` values (1,'Horas extras',NULL,'1');
insert into `tipo_bonificacion` values (2,'Famillar',NULL,'1');
insert into `tipo_bonificacion` values (3,'Comisiones',NULL,'1');

/*Table structure for table `tipo_descuento` */

CREATE TABLE `tipo_descuento` (
  `iddescuento` int(11) NOT NULL,
  `namedescuento` varchar(125) DEFAULT NULL,
  `nombrecorto` varchar(5) DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`iddescuento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipo_descuento` */

insert into `tipo_descuento` values (1,'AFP',NULL,'1');
insert into `tipo_descuento` values (2,'Seguro SIS',NULL,'1');
insert into `tipo_descuento` values (3,'Asignacion Familiar',NULL,'0');
insert into `tipo_descuento` values (4,'Seguro EsSalud',NULL,'1');

/*Table structure for table `tipoplanilla` */

CREATE TABLE `tipoplanilla` (
  `idtipoplanilla` int(11) NOT NULL,
  `nameplanilla` varchar(50) DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`idtipoplanilla`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipoplanilla` */

insert into `tipoplanilla` values (1,'Empleados','1');
insert into `tipoplanilla` values (2,'Obreros','1');
insert into `tipoplanilla` values (3,'Services','1');
insert into `tipoplanilla` values (4,'Externa','1');



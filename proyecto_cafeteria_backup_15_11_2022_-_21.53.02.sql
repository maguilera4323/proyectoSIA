

CREATE TABLE `TBL_Clientes` (
  `id_clientes` int NOT NULL AUTO_INCREMENT,
  `nom_cliente` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `rtn_cliente` varchar(40) DEFAULT NULL,
  `dni_clinte` varchar(20) DEFAULT NULL,
  `tel_cliente` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id_clientes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `TBL_Proveedores` (
  `id_Proveedores` int NOT NULL AUTO_INCREMENT,
  `nom_proveedor` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `rtn_proveedor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tel_proveedor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `correo_proveedor` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dir_proveedor` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_Proveedores`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_Proveedores VALUES("1","LEYDE","0801199722659","22201345","sula@gmail.com","Tegucigalpa M.D.C");
INSERT INTO TBL_Proveedores VALUES("2","JOSE MARTINEZ","0982001112223","97238991","josem@gmail.com","Res.Las Uvas");
INSERT INTO TBL_Proveedores VALUES("4","CAFE MAYA","840983284384","99944499","cafemaya@gmail.com","Tegucigalpa M.D.C");
INSERT INTO TBL_Proveedores VALUES("6","PLATICOS Y MAS","0202020202020","99999999","platicos@gmail.com","Tegucigalpa");



CREATE TABLE `TBL_bitacora` (
  `id_bitacora` int NOT NULL AUTO_INCREMENT,
  `id_objeto` int DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `id_usuario` int DEFAULT NULL,
  `accion` tinytext NOT NULL COMMENT 'accion realizada si es un ingreso nuevo, actualizacion. eliminacion o una consulta.',
  `descripcion` text,
  PRIMARY KEY (`id_bitacora`),
  KEY `FK_TBL_bitacora_TBL_usuarios` (`id_usuario`),
  CONSTRAINT `FK_TBL_bitacora_TBL_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `TBL_usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_bitacora VALUES("1","0","2022-11-15 19:07:45","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2","0","2022-11-15 19:08:02","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("3","0","2022-11-15 19:08:03","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("4","0","2022-11-15 19:09:30","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("5","0","2022-11-15 19:09:31","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("6","0","2022-11-15 20:01:46","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("7","1","2022-11-15 20:01:47","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("8","1","2022-11-15 20:04:49","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("9","0","2022-11-15 20:05:09","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("10","0","2022-11-15 20:05:28","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("11","1","2022-11-15 20:06:15","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("12","0","2022-11-15 20:06:30","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("13","0","2022-11-15 20:06:48","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("14","0","2022-11-15 20:07:23","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("15","0","2022-11-15 20:09:41","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("16","1","2022-11-15 20:09:42","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("17","0","2022-11-15 20:14:19","1","Cambio de vista","El usuario ADMIN entró a la vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("18","0","2022-11-15 20:17:25","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("19","0","2022-11-15 20:17:33","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("20","1","2022-11-15 20:17:34","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("21","0","2022-11-15 20:20:17","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("22","0","2022-11-15 20:20:27","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("23","0","2022-11-15 20:23:07","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("24","0","2022-11-15 20:23:07","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("25","0","2022-11-15 20:23:24","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("26","0","2022-11-15 20:23:41","1","Creación de Permiso","El usuario ADMIN creó un nuevo permiso en el sistema");
INSERT INTO TBL_bitacora VALUES("27","0","2022-11-15 20:23:43","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("28","0","2022-11-15 20:24:12","1","Creación de Permiso","El usuario ADMIN creó un nuevo permiso en el sistema");
INSERT INTO TBL_bitacora VALUES("29","0","2022-11-15 20:24:14","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("30","0","2022-11-15 20:24:36","1","Cambio de vista","El usuario ADMIN entró a la vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("31","0","2022-11-15 20:26:01","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("32","0","2022-11-15 20:26:15","1","Creación de Permiso","El usuario ADMIN creó un nuevo permiso en el sistema");
INSERT INTO TBL_bitacora VALUES("33","0","2022-11-15 20:26:16","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("34","0","2022-11-15 20:27:14","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("35","1","2022-11-15 20:29:42","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("36","1","2022-11-15 20:29:51","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("37","1","2022-11-15 20:31:43","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("38","1","2022-11-15 20:32:18","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("39","1","2022-11-15 20:32:43","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("40","1","2022-11-15 20:35:28","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("41","1","2022-11-15 20:35:40","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("42","1","2022-11-15 20:36:12","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("43","1","2022-11-15 20:36:19","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("44","1","2022-11-15 20:38:06","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("45","2","2022-11-15 20:38:11","1","Cierre de sesión","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("46","1","2022-11-15 20:38:27","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("47","1","2022-11-15 20:43:56","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("48","1","2022-11-15 20:44:03","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("49","1","2022-11-15 20:44:10","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("50","1","2022-11-15 21:01:31","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("51","1","2022-11-15 21:01:40","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("52","0","2022-11-15 21:11:18","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("53","0","2022-11-15 21:11:43","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("54","0","2022-11-15 21:12:16","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("55","0","2022-11-15 21:12:18","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("56","0","2022-11-15 21:12:27","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("57","1","2022-11-15 21:12:35","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("58","0","2022-11-15 21:12:43","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("59","0","2022-11-15 21:13:09","1","Creación de Permiso","El usuario ADMIN creó un nuevo permiso en el sistema");
INSERT INTO TBL_bitacora VALUES("60","0","2022-11-15 21:13:11","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("61","0","2022-11-15 21:14:12","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("62","0","2022-11-15 21:15:45","1","Creación de Permiso","El usuario ADMIN creó un nuevo permiso en el sistema");
INSERT INTO TBL_bitacora VALUES("63","0","2022-11-15 21:15:47","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("64","0","2022-11-15 21:18:34","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("65","0","2022-11-15 21:20:28","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("66","0","2022-11-15 21:21:15","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("67","0","2022-11-15 21:21:26","1","Creación de Permiso","El usuario ADMIN creó un nuevo permiso en el sistema");
INSERT INTO TBL_bitacora VALUES("68","0","2022-11-15 21:21:28","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("69","0","2022-11-15 21:21:38","1","Creación de Permiso","El usuario ADMIN creó un nuevo permiso en el sistema");
INSERT INTO TBL_bitacora VALUES("70","0","2022-11-15 21:21:40","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("71","0","2022-11-15 21:26:43","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("72","0","2022-11-15 21:27:03","1","Creación de Permiso","El usuario ADMIN creó un nuevo permiso en el sistema");
INSERT INTO TBL_bitacora VALUES("73","0","2022-11-15 21:27:04","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("74","0","2022-11-15 21:28:26","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("75","0","2022-11-15 21:30:20","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("76","0","2022-11-15 21:32:33","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("77","0","2022-11-15 21:33:16","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("78","0","2022-11-15 21:33:56","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("79","0","2022-11-15 21:34:02","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("80","0","2022-11-15 21:34:28","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("81","0","2022-11-15 21:35:12","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("82","1","2022-11-15 21:35:22","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("83","0","2022-11-15 21:36:25","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("84","0","2022-11-15 21:36:29","1","Cambio de vista","El usuario ADMIN entró a la vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("85","0","2022-11-15 21:36:34","1","Creación de Permiso","El usuario ADMIN creó un nuevo permiso en el sistema");
INSERT INTO TBL_bitacora VALUES("86","0","2022-11-15 21:36:35","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("87","0","2022-11-15 21:36:48","1","Creación de Permiso","El usuario ADMIN creó un nuevo permiso en el sistema");
INSERT INTO TBL_bitacora VALUES("88","0","2022-11-15 21:36:50","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("89","0","2022-11-15 21:37:42","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("90","0","2022-11-15 21:39:55","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("91","0","2022-11-15 21:40:33","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("92","0","2022-11-15 21:42:15","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("93","0","2022-11-15 21:44:16","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("94","0","2022-11-15 21:46:02","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("95","0","2022-11-15 21:47:30","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("96","0","2022-11-15 21:50:10","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("97","1","2022-11-15 21:50:10","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("98","0","2022-11-15 21:51:18","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("99","1","2022-11-15 21:52:36","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("100","0","2022-11-15 21:52:40","1","Cambio de vista","El usuario ADMIN entró a la vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("101","0","2022-11-15 21:52:51","1","Cambio de vista","El usuario ADMIN entró a la vista de Proveedores");



CREATE TABLE `TBL_categoria_produ` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nom_categoria` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Guarda el nombre de la categoría a la que pertenece un producto',
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_categoria_produ VALUES("1","COMESTIBLES");
INSERT INTO TBL_categoria_produ VALUES("2","EQUIPO");



CREATE TABLE `TBL_compras` (
  `id_compra` int NOT NULL AUTO_INCREMENT,
  `id_proveedor` int DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  `id_estado_compra` int DEFAULT NULL,
  `fech_compra` date DEFAULT NULL,
  `total_compra` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `FK_compra_proveedor_idx` (`id_proveedor`),
  KEY `FK_compra_usu_idx` (`id_usuario`),
  KEY `FK_estado_compra_idx` (`id_estado_compra`),
  CONSTRAINT `FK_TBL_compras_TBL_Proveedores` FOREIGN KEY (`id_proveedor`) REFERENCES `TBL_Proveedores` (`id_Proveedores`),
  CONSTRAINT `FK_TBL_compras_TBL_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `TBL_usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `TBL_descuentos` (
  `id_descuentos` int NOT NULL AUTO_INCREMENT,
  `nom_descuento` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `porcentaje_descuento` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`id_descuentos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `TBL_detalle_compra` (
  `id_detalle_compra` int NOT NULL AUTO_INCREMENT,
  `id_compra` int DEFAULT NULL,
  `id_insumos` int DEFAULT NULL,
  `cantidad_comprada` int DEFAULT NULL,
  `precio_costo` decimal(7,2) DEFAULT NULL,
  `fecha_caducidad` date NOT NULL,
  PRIMARY KEY (`id_detalle_compra`),
  KEY `FK_compra_detalle_idx` (`id_compra`),
  KEY `FK_TBL_detalle_compra_TBL_insumos` (`id_insumos`),
  CONSTRAINT `FK_compra_detalle` FOREIGN KEY (`id_compra`) REFERENCES `TBL_compras` (`id_compra`),
  CONSTRAINT `FK_TBL_detalle_compra_TBL_insumos` FOREIGN KEY (`id_insumos`) REFERENCES `TBL_insumos` (`id_insumos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `TBL_estado_compras` (
  `id_estado_compra` int NOT NULL AUTO_INCREMENT,
  `nom_estado_compra` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `TBL_estado_pedido` (
  `id_estado_pedido` int NOT NULL AUTO_INCREMENT,
  `estado_pedido` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'aqui se colocara si el pedido ya fue facturado o si fue anulado',
  PRIMARY KEY (`id_estado_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `TBL_estado_promociones` (
  `id_estado_promociones` int NOT NULL AUTO_INCREMENT,
  `nom_estado_promociones` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado_promociones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `TBL_forma_pago` (
  `id_forma_pago` int NOT NULL AUTO_INCREMENT,
  `forma_pago` enum('efectivo','tarjeta','cheque') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `descripcion` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_forma_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `TBL_insumos` (
  `id_insumos` int NOT NULL AUTO_INCREMENT,
  `nom_insumo` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_categoria` int DEFAULT NULL,
  `cant_max` int DEFAULT NULL,
  `cant_min` int DEFAULT NULL,
  `unidad_medida` enum('LB','UN','L','GAL') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_insumos`),
  KEY `FK_categoria_insumos_idx` (`id_categoria`),
  CONSTRAINT `FK_categoria_insumos` FOREIGN KEY (`id_categoria`) REFERENCES `TBL_categoria_produ` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_insumos VALUES("1","CAFE","1","295","125","LB");
INSERT INTO TBL_insumos VALUES("2","GALLETA","2","12","3","UN");
INSERT INTO TBL_insumos VALUES("3","AZUCAR","1","126","45","LB");
INSERT INTO TBL_insumos VALUES("5","A","1","13","2","LB");



CREATE TABLE `TBL_inventario` (
  `id_inventario` int NOT NULL AUTO_INCREMENT,
  `id_insumo` int DEFAULT NULL,
  `cant_existencia` int DEFAULT NULL,
  PRIMARY KEY (`id_inventario`),
  KEY `FK_inventario_insumos_idx` (`id_insumo`),
  CONSTRAINT `FK_TBL_inventario_TBL_insumos` FOREIGN KEY (`id_insumo`) REFERENCES `TBL_insumos` (`id_insumos`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_inventario VALUES("1","1","67");
INSERT INTO TBL_inventario VALUES("2","2","8");



CREATE TABLE `TBL_movi_inventario` (
  `id_cardex` int NOT NULL AUTO_INCREMENT,
  `id_insumos` int DEFAULT NULL,
  `cant_movimiento` int DEFAULT NULL,
  `tipo_movimiento` varchar(45) DEFAULT NULL,
  `fecha_moviemiento` datetime DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_cardex`),
  KEY `FK_insumos_idx` (`id_insumos`),
  KEY `FK_usuario_idx` (`id_usuario`,`id_insumos`) USING BTREE,
  CONSTRAINT `FK_TBL_movi_inventario_TBL_insumos` FOREIGN KEY (`id_insumos`) REFERENCES `TBL_insumos` (`id_insumos`),
  CONSTRAINT `FK_TBL_movi_inventario_TBL_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `TBL_usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `TBL_ms_hist_contrasena` (
  `id_hist` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `contrasena` varchar(50) NOT NULL,
  `creado_por` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `modificado_por` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_hist`),
  KEY `FK_TBL_ms_hist_contrasena_TBL_usuarios` (`id_usuario`),
  CONSTRAINT `FK_TBL_ms_hist_contrasena_TBL_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `TBL_usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `TBL_ms_parametros` (
  `id_parametro` int NOT NULL AUTO_INCREMENT,
  `parametro` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `valor` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_usuario` int NOT NULL,
  `creado_por` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `modificado_por` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_parametro`),
  KEY `FK_TBL_ms_parametros_TBL_usuarios` (`id_usuario`),
  CONSTRAINT `FK_TBL_ms_parametros_TBL_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `TBL_usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO TBL_ms_parametros VALUES("1","ADMIN_INTENTOS_INVALIDOS","2","1","ADMIN","2022-10-10 17:58:32","ADMIN","2022-10-10 17:58:32");
INSERT INTO TBL_ms_parametros VALUES("2","MIN_CONTRASENA","5","1","ADMIN","2022-10-10 18:00:33","ADMIN","2022-10-10 18:00:33");
INSERT INTO TBL_ms_parametros VALUES("3","MAX_CONTRASENA","10","1","ADMIN","2022-10-10 18:00:48","ADMIN","2022-10-10 18:00:48");
INSERT INTO TBL_ms_parametros VALUES("4","ADMIN_DIAS_VIGENCIA","360","1","ADMIN","2022-10-16 17:22:18","ADMIN","2022-10-16 17:22:18");
INSERT INTO TBL_ms_parametros VALUES("5","HORASVIGENCIA_CODIGO_CORREO","24","1","ADMIN","2022-10-20 02:24:24","ADMIN","2022-10-20 02:24:24");
INSERT INTO TBL_ms_parametros VALUES("6","PREGUNTAS_A_CONTESTAR","3","1","ADMIN","2022-10-25 22:01:25","ADMIN","2022-10-25 22:01:25");



CREATE TABLE `TBL_ms_preguntas_usuario` (
  `id_pregunta` int NOT NULL,
  `id_usuario` int NOT NULL,
  `respuesta` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `creado_por` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `modificado_por` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  KEY `FK_TBL_ms_preguntas_usuario_TBL_preguntas` (`id_pregunta`),
  KEY `FK_TBL_ms_preguntas_usuario_TBL_usuarios` (`id_usuario`),
  CONSTRAINT `FK_TBL_ms_preguntas_usuario_TBL_preguntas` FOREIGN KEY (`id_pregunta`) REFERENCES `TBL_preguntas` (`id_pregunta`),
  CONSTRAINT `FK_TBL_ms_preguntas_usuario_TBL_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `TBL_usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




CREATE TABLE `TBL_ms_roles` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `rol` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `descripcion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `creado_por` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `modificado_por` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_ms_roles VALUES("1","ADMIN SISTEMA","Rol encargado de la gestion total del sistema","ADMIN","2022-11-08 18:46:07","","");
INSERT INTO TBL_ms_roles VALUES("2","ADMIN INVENTARIO","Rol encargado de las compras y gestion de insumos de la empresa","ADMIN","2022-11-08 18:47:13","","");
INSERT INTO TBL_ms_roles VALUES("3","VENDEDOR","Rol encargado de la facturacion y ventas de los productos de la empresa","ADMIN","2022-11-08 18:48:45","","");



CREATE TABLE `TBL_objetos` (
  `id_objeto` int NOT NULL AUTO_INCREMENT,
  `objeto` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `tipo_objeto` enum('Home','Proveedores','Insumos','Productos','Compras','Facturacion','Mantenimiento') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `creado_por` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `modificado_por` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_objeto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_objetos VALUES("1","HOME","Vista principal del sistema","Home","ADMIN","2022-11-15 19:08:01","","");
INSERT INTO TBL_objetos VALUES("2","LISTA PROVEEDORES","Contiene la lista de los proveedores de insumos de la empresa","Proveedores","ADMIN","2022-11-15 19:09:29","","");
INSERT INTO TBL_objetos VALUES("3","AGREGAR PROVEEDOR","Creación de un nuevo proveedor en el sistema","Proveedores","ADMIN","2022-11-15 21:12:15","","");



CREATE TABLE `TBL_pedido_descuentos` (
  `id_descuentos` int NOT NULL AUTO_INCREMENT,
  `id_pedidos` int NOT NULL,
  `total_descontado` decimal(6,2) DEFAULT NULL,
  KEY `FK_descu_idx` (`id_descuentos`),
  KEY `KF_pedido_pedi_desc_idx` (`id_pedidos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `TBL_pedidos` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `num_factura` int DEFAULT NULL,
  `fech_pedido` date DEFAULT NULL,
  `fech_entrega` date DEFAULT NULL,
  `sitio_entrega` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_estado_pedido` int DEFAULT NULL,
  `sub_total` decimal(8,2) DEFAULT NULL,
  `ISV` decimal(3,2) DEFAULT NULL,
  `total` decimal(8,2) DEFAULT NULL,
  `id_forma_pago` int DEFAULT NULL,
  `fech_facturacion` date DEFAULT NULL,
  `porcentaje_isv` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `FK_cliente_pedido_idx` (`id_cliente`),
  KEY `FK_estado_pedido_idx` (`id_estado_pedido`),
  KEY `FK_pago_pedido_idx` (`id_forma_pago`),
  CONSTRAINT `FK_TBL_pedidos_TBL_Clientes` FOREIGN KEY (`id_cliente`) REFERENCES `TBL_Clientes` (`id_clientes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `TBL_pedidos_promociones` (
  `id_pedido_promocion` int NOT NULL AUTO_INCREMENT,
  `id_promocion` int DEFAULT NULL,
  `id_pedido` int DEFAULT NULL,
  `precio_venta` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id_pedido_promocion`),
  KEY `FK_promo_idx` (`id_promocion`),
  KEY `FK_pedido_idx` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `TBL_permisos` (
  `id_rol` int NOT NULL,
  `id_objeto` int NOT NULL,
  `permiso_insercion` varchar(5) NOT NULL,
  `permiso_actualizacion` varchar(5) NOT NULL,
  `permiso_eliminacion` varchar(5) NOT NULL,
  `permiso_consulta` varchar(5) NOT NULL,
  `creado_por` varchar(50) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `modificado_por` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  KEY `id_rol` (`id_rol`),
  KEY `id_objeto` (`id_objeto`),
  CONSTRAINT `FK_TBL_permisos_TBL_ms_roles` FOREIGN KEY (`id_rol`) REFERENCES `TBL_ms_roles` (`id_rol`),
  CONSTRAINT `TBL_permisos_ibfk_2` FOREIGN KEY (`id_objeto`) REFERENCES `TBL_objetos` (`id_objeto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_permisos VALUES("1","2","0","0","0","0","ADMIN","2022-11-15 21:21:26","","");
INSERT INTO TBL_permisos VALUES("3","3","0","0","0","0","ADMIN","2022-11-15 21:21:38","","");
INSERT INTO TBL_permisos VALUES("1","1","0","0","0","0","ADMIN","2022-11-15 21:27:02","","");
INSERT INTO TBL_permisos VALUES("3","2","0","0","0","0","ADMIN","2022-11-15 21:36:33","","");
INSERT INTO TBL_permisos VALUES("2","1","0","0","0","0","ADMIN","2022-11-15 21:36:48","","");



CREATE TABLE `TBL_preguntas` (
  `id_pregunta` int NOT NULL AUTO_INCREMENT,
  `pregunta` varchar(50) NOT NULL,
  `creado_por` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `modificado_por` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_pregunta`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_preguntas VALUES("1","Cual es su deporte favorito?","ADMIN","2022-09-21 00:00:00","ADMIN","2022-09-21 00:00:00");
INSERT INTO TBL_preguntas VALUES("2","Nombre de su mascota","ADMIN","2022-09-23 00:00:00","ADMIN","2022-09-23 00:00:00");
INSERT INTO TBL_preguntas VALUES("3","Lugar de nacimiento","ADMIN","2022-09-23 00:00:00","ADMIN","2022-09-23 00:00:00");
INSERT INTO TBL_preguntas VALUES("4","Comida favorita","ADMIN","2022-09-23 00:00:00","ADMIN","2022-09-23 00:00:00");
INSERT INTO TBL_preguntas VALUES("5","Nombre de su primer hijo(a)?","ADMIN","2022-09-21 00:00:00","ADMIN","2022-09-21 00:00:00");
INSERT INTO TBL_preguntas VALUES("10","Serie favorita?","ADMIN","2022-11-14 16:54:45","ADMIN","2022-11-14 16:56:12");



CREATE TABLE `TBL_producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `nom_producto` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_tipo_produ` int DEFAULT NULL,
  `des_produ` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `precio_produ` decimal(5,2) DEFAULT NULL,
  `foto_produ` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'CAMBIAR A FORMATO DE FOTO',
  PRIMARY KEY (`id_producto`),
  KEY `FK_idproducto_tippro_idx` (`id_tipo_produ`),
  CONSTRAINT `FK_TBL_producto_TBL_tipo_producto` FOREIGN KEY (`id_tipo_produ`) REFERENCES `TBL_tipo_producto` (`id_tipo_produ`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_producto VALUES("20","SASAD","1","DADASDASDAD","120.00","SASAD.jpg");
INSERT INTO TBL_producto VALUES("21","SASAD","1","DADASDASDAD","120.00","SASAD.jpg");
INSERT INTO TBL_producto VALUES("27","CAFE","1","buen cafe","122.00","../productos_img/descarga.png");
INSERT INTO TBL_producto VALUES("28","GGGG","2","bxchbfs","56.00","../productos_img/delta.jpg");
INSERT INTO TBL_producto VALUES("32","BUEN","1","desc","153.00","../productos_img/cafe.jpg");
INSERT INTO TBL_producto VALUES("33","BENEFICO","1","fer","565.00","../productos_img/beneficio.jpg");
INSERT INTO TBL_producto VALUES("34","CARABINERO","1","ggg","123.00","../productos_img/corazon.webp");
INSERT INTO TBL_producto VALUES("35","HHHH","1","gfhgf","123.00","../productos_img/cafe.jpg");
INSERT INTO TBL_producto VALUES("36","VVVVV","1","dfd","234.00","../productos_img/corazon.webp");
INSERT INTO TBL_producto VALUES("37","FFFF","1","fff","444.00","../productos_img/maxresdefault.jpg");
INSERT INTO TBL_producto VALUES("38","ULTIMO","3","fff","767.00","../productos_img/maxresdefault.jpg");
INSERT INTO TBL_producto VALUES("39","ZFJG","1","vsgsdfsdf","12.00","../productos_img/727204.png");



CREATE TABLE `TBL_promociones` (
  `id_promociones` int NOT NULL AUTO_INCREMENT,
  `nom_promocion` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fech_ini_promo` date DEFAULT NULL,
  `fech_fin_promo` date DEFAULT NULL,
  `id_estado_promocio` int DEFAULT NULL,
  `precio_promocion` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`id_promociones`),
  KEY `FK_promocion_estado_idx` (`id_estado_promocio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `TBL_promociones_productos` (
  `id_promociones_productos` int NOT NULL AUTO_INCREMENT,
  `id_promociones` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `cantidad` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `precio_venta` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id_promociones_productos`),
  KEY `id_promociones` (`id_promociones`),
  KEY `id_producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `TBL_recetario` (
  `id_recetario` int NOT NULL AUTO_INCREMENT,
  `id_producto` int DEFAULT NULL,
  `id_insumo` int DEFAULT NULL,
  `cant_insumo` int DEFAULT NULL,
  PRIMARY KEY (`id_recetario`),
  KEY `FK_produ_recetario_idx` (`id_producto`),
  KEY `FK_insumo_recetario_idx` (`id_insumo`),
  CONSTRAINT `FK_TBL_recetario_TBL_insumos` FOREIGN KEY (`id_insumo`) REFERENCES `TBL_insumos` (`id_insumos`),
  CONSTRAINT `FK_TBL_recetario_TBL_producto` FOREIGN KEY (`id_producto`) REFERENCES `TBL_producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_recetario VALUES("1","27","3","12");



CREATE TABLE `TBL_restablece_clave_email` (
  `id_restablecer` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `codigo` int DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_restablecer`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




CREATE TABLE `TBL_talonario_cai` (
  `id_talonario_cai` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `num_cai` int NOT NULL,
  `rango_inicial` int NOT NULL,
  `rango_final` int NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `obs_cai` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_talonario_cai`),
  KEY `FK_TBL_talonario_cai_TBL_usuarios` (`id_usuario`),
  CONSTRAINT `FK_TBL_talonario_cai_TBL_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `TBL_usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




CREATE TABLE `TBL_tipo_producto` (
  `id_tipo_produ` int NOT NULL AUTO_INCREMENT COMMENT 'Entidad encargada de la clasificación de los productos, así como de la presentación o tamaño de estos',
  `tipo_producto` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'este se refiere a los productoq ue vende la empresa. ejemplo cafe o granita',
  `tamaño_producto` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `clasificacion_producto` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'verificar si se puede colocar como enum\npara elegir la categoria',
  PRIMARY KEY (`id_tipo_produ`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_tipo_producto VALUES("1","bebida","12 ONZ","a");
INSERT INTO TBL_tipo_producto VALUES("2","pan","1","b");
INSERT INTO TBL_tipo_producto VALUES("3","ASD","FSDFSDFS","sfsdfsf");



CREATE TABLE `TBL_usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nombre_usuario` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado_usuario` enum('Activo','Inactivo','Bloqueado','Nuevo') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contrasena` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_rol` int NOT NULL,
  `fecha_ultima_conexion` datetime DEFAULT NULL,
  `preguntas_contestadas` int DEFAULT NULL,
  `primer_ingreso` int DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `correo_electronico` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `creado_por` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `modificado_por` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO TBL_usuarios VALUES("1","ADMIN","ADMINISTRADOR","Activo","$2y$12$d9ZLQGv4lBE4Lcv2atFD2ODwdR7jwqQh3uXhTJ0jFeRWVucd6YXrG","1","2023-10-23 00:00:00","1","1","2023-10-23","admincitycoffee@gmail.com","ADMIN","2022-10-28 13:44:33","ADMIN","2022-10-28 13:44:33");
INSERT INTO TBL_usuarios VALUES("6","MARIOS","MARIO SILVA","Activo","$2y$12$eGEOPtCxe2A0Uf7rSRNoiu2il.85SaT0y4eJheaCQxChMELNAnAbK","2","","","1","2023-11-07","karimhernandez233@gmail.com","ADMIN","2022-11-08 19:38:27","MARIOS","2022-11-12 17:41:09");
INSERT INTO TBL_usuarios VALUES("7","nuevo","prueba","Activo","$2y$12$eGEOPtCxe2A0Uf7rSRNoiu2il.85SaT0y4eJheaCQxChMELNAnAbK","2","","","1","2023-11-07","roman@gmial.com","ADMIN","2022-11-08 19:38:37","ADMIN","2022-11-12 17:41:09");


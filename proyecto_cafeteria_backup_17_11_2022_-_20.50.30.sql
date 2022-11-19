

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_Proveedores VALUES("1","LEYDE","0801199722659","22201345","sula@gmail.com","Tegucigalpa M.D.C");
INSERT INTO TBL_Proveedores VALUES("2","JOSE MARTINEZ","0982001112223","97238991","josem@gmail.com","Res.Las Uvas");
INSERT INTO TBL_Proveedores VALUES("4","CAFE MAYA","840983284384","99944499","cafemaya@gmail.com","Tegucigalpa M.D.C");
INSERT INTO TBL_Proveedores VALUES("6","PLATICOS Y MAS","0202020202020","99999999","platicos@gmail.com","Tegucigalpa");
INSERT INTO TBL_Proveedores VALUES("7","EL CAÑAL","0000000000000","22453245","elcañanhn@gmail.com","Carretera hacia");



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
) ENGINE=InnoDB AUTO_INCREMENT=792 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
INSERT INTO TBL_bitacora VALUES("102","1","2022-11-15 21:53:17","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("103","0","2022-11-15 21:53:43","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("104","0","2022-11-15 21:54:18","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("105","1","2022-11-15 21:54:19","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("106","1","2022-11-15 21:54:26","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("107","1","2022-11-15 21:54:35","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("108","0","2022-11-15 21:54:48","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("109","0","2022-11-15 21:55:36","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("110","0","2022-11-15 21:56:06","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("111","0","2022-11-15 21:56:08","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("112","0","2022-11-15 21:56:09","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("113","0","2022-11-15 21:56:22","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("114","1","2022-11-15 21:56:50","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("115","0","2022-11-15 21:57:39","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("116","0","2022-11-15 22:00:38","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("117","0","2022-11-15 22:01:06","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("118","0","2022-11-15 22:01:48","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("119","1","2022-11-15 22:01:51","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("120","0","2022-11-15 22:02:10","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("121","0","2022-11-15 22:02:59","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("122","1","2022-11-15 22:03:09","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("123","0","2022-11-15 22:03:17","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("124","0","2022-11-15 22:03:58","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("125","0","2022-11-15 22:04:08","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("126","0","2022-11-15 22:04:17","1","Cambio de vista","El usuario ADMIN entró a la vista de Preguntas");
INSERT INTO TBL_bitacora VALUES("127","0","2022-11-15 22:06:01","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("128","0","2022-11-15 22:07:11","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("129","0","2022-11-15 22:09:11","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("130","0","2022-11-15 22:09:30","1","Cambio de vista","El usuario ADMIN entró a la vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("131","0","2022-11-15 22:10:23","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("132","0","2022-11-15 22:11:02","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("133","0","2022-11-15 22:12:22","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("134","0","2022-11-15 22:13:13","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("135","0","2022-11-15 22:14:24","1","Cambio de vista","El usuario ADMIN entró a la vista de Preguntas");
INSERT INTO TBL_bitacora VALUES("136","0","2022-11-15 22:14:32","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("137","0","2022-11-15 22:14:50","1","Cambio de vista","El usuario ADMIN entró a la vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("138","0","2022-11-15 22:14:57","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("139","0","2022-11-15 22:15:03","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("140","1","2022-11-15 22:15:06","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("141","0","2022-11-15 22:15:14","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("142","2","2022-11-15 22:15:20","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("143","2","2022-11-15 22:15:26","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("144","0","2022-11-15 22:15:27","1","Cambio de vista","El usuario ADMIN entró a la vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("145","0","2022-11-15 22:15:30","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("146","1","2022-11-15 22:15:41","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("147","0","2022-11-15 22:15:45","1","Cambio de vista","El usuario ADMIN entró a la vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("148","2","2022-11-15 22:15:49","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("149","2","2022-11-15 22:16:13","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("150","2","2022-11-15 22:16:20","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("151","2","2022-11-15 22:16:40","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("152","2","2022-11-15 22:17:04","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("153","2","2022-11-15 22:17:09","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("154","2","2022-11-15 22:17:21","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("155","2","2022-11-15 22:17:26","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("156","0","2022-11-15 22:20:28","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("157","0","2022-11-15 22:22:15","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("158","2","2022-11-15 22:23:35","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("159","0","2022-11-15 22:26:08","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("160","0","2022-11-15 22:27:08","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("161","0","2022-11-15 22:27:17","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("162","0","2022-11-15 22:30:31","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("163","0","2022-11-15 22:31:58","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("164","0","2022-11-15 22:32:05","1","Permiso eliminado","El usuario ADMIN eliminó un permiso del sistema");
INSERT INTO TBL_bitacora VALUES("165","0","2022-11-15 22:32:08","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("166","0","2022-11-15 22:32:16","1","Permiso eliminado","El usuario ADMIN eliminó un permiso del sistema");
INSERT INTO TBL_bitacora VALUES("167","0","2022-11-15 22:32:18","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("168","0","2022-11-15 22:32:23","1","Permiso eliminado","El usuario ADMIN eliminó un permiso del sistema");
INSERT INTO TBL_bitacora VALUES("169","0","2022-11-15 22:32:25","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("170","0","2022-11-15 22:34:12","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("171","0","2022-11-15 22:34:25","6","Inicio de sesion","El usuario MARIOS entró al sistema");
INSERT INTO TBL_bitacora VALUES("172","1","2022-11-15 22:34:25","6","Cambio de vista","El usuario MARIOS entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("173","1","2022-11-15 22:34:33","6","Cambio de vista","El usuario MARIOS entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("174","1","2022-11-15 22:36:06","6","Cambio de vista","El usuario MARIOS entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("175","1","2022-11-15 22:36:14","6","Cambio de vista","El usuario MARIOS entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("176","1","2022-11-15 22:38:20","6","Cambio de vista","El usuario MARIOS entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("177","1","2022-11-15 22:38:26","6","Cambio de vista","El usuario MARIOS entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("178","0","2022-11-15 22:38:30","6","Cierre de sesión","El usuario MARIOS salió del sistema");
INSERT INTO TBL_bitacora VALUES("179","0","2022-11-15 22:38:36","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("180","0","2022-11-15 22:38:37","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("181","1","2022-11-15 22:38:38","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("182","1","2022-11-15 22:38:53","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("183","0","2022-11-15 22:41:02","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("184","1","2022-11-15 22:41:03","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("185","0","2022-11-15 22:43:23","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("186","1","2022-11-15 22:43:36","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("187","1","2022-11-15 22:43:41","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("188","0","2022-11-15 22:43:47","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("189","0","2022-11-15 22:44:04","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("190","0","2022-11-15 22:45:00","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("191","0","2022-11-15 22:51:22","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("192","0","2022-11-15 22:55:48","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("193","0","2022-11-15 23:00:56","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("194","0","2022-11-15 23:02:00","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("195","0","2022-11-15 23:03:32","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("196","0","2022-11-15 23:04:15","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("197","0","2022-11-15 23:11:29","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("198","0","2022-11-15 23:11:39","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("199","0","2022-11-15 23:13:48","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("200","0","2022-11-15 23:13:53","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("201","0","2022-11-15 23:14:01","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("202","1","2022-11-15 23:14:01","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("203","0","2022-11-15 23:14:10","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("204","0","2022-11-15 23:15:20","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("205","0","2022-11-15 23:17:09","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("206","0","2022-11-15 23:17:18","1","Modificación de Permiso","El usuario ADMIN actualizó un permiso del sistema");
INSERT INTO TBL_bitacora VALUES("207","0","2022-11-15 23:17:24","1","Modificación de Permiso","El usuario ADMIN actualizó un permiso del sistema");
INSERT INTO TBL_bitacora VALUES("208","0","2022-11-15 23:17:29","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("209","0","2022-11-15 23:17:37","1","Modificación de Permiso","El usuario ADMIN actualizó un permiso del sistema");
INSERT INTO TBL_bitacora VALUES("210","0","2022-11-15 23:18:06","1","Cambio de vista","El usuario ADMIN entró a la vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("211","0","2022-11-15 23:18:45","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("212","0","2022-11-15 23:19:26","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("213","0","2022-11-15 23:19:40","1","Modificación de Permiso","El usuario ADMIN actualizó un permiso del sistema");
INSERT INTO TBL_bitacora VALUES("214","0","2022-11-15 23:19:58","1","Modificación de Permiso","El usuario ADMIN actualizó un permiso del sistema");
INSERT INTO TBL_bitacora VALUES("215","0","2022-11-15 23:21:51","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("216","0","2022-11-15 23:23:46","1","Creación de Permiso","El usuario ADMIN creó un nuevo permiso en el sistema");
INSERT INTO TBL_bitacora VALUES("217","0","2022-11-15 23:23:57","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("218","1","2022-11-15 23:42:01","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("219","0","2022-11-15 23:42:39","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("220","0","2022-11-15 23:43:42","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("221","0","2022-11-15 23:43:48","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("222","0","2022-11-15 23:51:14","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("223","1","2022-11-15 23:51:14","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("224","0","2022-11-15 23:51:42","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("225","0","2022-11-15 23:52:09","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("226","1","2022-11-15 23:56:52","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("227","1","2022-11-15 23:57:08","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("228","1","2022-11-15 23:57:50","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("229","1","2022-11-15 23:57:57","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("230","0","2022-11-15 23:58:13","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("231","0","2022-11-15 23:59:11","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("232","0","2022-11-16 10:01:53","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("233","1","2022-11-16 10:01:53","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("234","1","2022-11-16 10:02:02","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("235","0","2022-11-16 10:03:57","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("236","0","2022-11-16 10:04:48","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("237","0","2022-11-16 10:04:50","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("238","0","2022-11-16 10:11:46","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("239","0","2022-11-16 10:11:55","1","Permiso eliminado","El usuario ADMIN eliminó un permiso del sistema");
INSERT INTO TBL_bitacora VALUES("240","0","2022-11-16 10:11:56","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("241","0","2022-11-16 10:12:41","1","Creación de Permiso","El usuario ADMIN creó un nuevo permiso en el sistema");
INSERT INTO TBL_bitacora VALUES("242","0","2022-11-16 10:12:43","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("243","1","2022-11-16 10:12:51","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("244","0","2022-11-16 10:12:58","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("245","1","2022-11-16 10:13:24","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("246","2","2022-11-16 10:13:56","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("247","1","2022-11-16 10:14:02","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("248","2","2022-11-16 10:14:23","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("249","2","2022-11-16 10:14:29","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("250","0","2022-11-16 10:32:06","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("251","0","2022-11-16 10:32:10","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("252","0","2022-11-16 10:32:17","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("253","0","2022-11-16 10:32:20","1","Cambio de vista","El usuario ADMIN entró a la vista de Inventario Disponible");
INSERT INTO TBL_bitacora VALUES("254","0","2022-11-16 10:32:23","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("255","0","2022-11-16 10:34:25","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("256","0","2022-11-16 10:34:59","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("257","0","2022-11-16 10:35:00","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("258","0","2022-11-16 10:35:41","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("259","0","2022-11-16 10:35:42","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("260","0","2022-11-16 10:36:19","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("261","0","2022-11-16 10:36:21","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("262","1","2022-11-16 10:40:03","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("263","1","2022-11-16 10:40:11","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("264","0","2022-11-16 10:40:29","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("265","0","2022-11-16 10:40:42","1","Creación de Permiso","El usuario ADMIN creó un nuevo permiso en el sistema");
INSERT INTO TBL_bitacora VALUES("266","0","2022-11-16 10:40:44","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("267","5","2022-11-16 10:40:49","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("268","1","2022-11-16 10:42:55","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("269","5","2022-11-16 10:43:14","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("270","5","2022-11-16 10:43:19","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("271","5","2022-11-16 10:43:23","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("272","5","2022-11-16 10:45:20","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("273","5","2022-11-16 10:45:27","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("274","0","2022-11-16 10:59:19","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("275","0","2022-11-16 11:05:52","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("276","0","2022-11-16 11:06:37","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("277","0","2022-11-16 11:06:38","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("278","0","2022-11-16 11:07:33","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("279","0","2022-11-16 11:07:34","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("280","0","2022-11-16 11:07:42","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("281","0","2022-11-16 11:07:47","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("282","0","2022-11-16 11:09:15","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("283","2","2022-11-16 11:09:32","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("284","2","2022-11-16 11:09:37","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("285","2","2022-11-16 11:09:46","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("286","0","2022-11-16 11:10:13","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("287","0","2022-11-16 11:10:52","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("288","0","2022-11-16 11:10:53","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("289","0","2022-11-16 11:11:45","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("290","0","2022-11-16 11:11:47","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("291","0","2022-11-16 11:13:06","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("292","0","2022-11-16 11:13:21","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("293","0","2022-11-16 11:13:23","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("294","0","2022-11-16 11:15:04","1","Modificación de objeto","El usuario ADMIN actualizó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("295","0","2022-11-16 11:15:06","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("296","0","2022-11-16 11:21:20","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("297","0","2022-11-16 11:21:37","1","Creación de Permiso","El usuario ADMIN creó un nuevo permiso en el sistema");
INSERT INTO TBL_bitacora VALUES("298","0","2022-11-16 11:21:38","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("299","5","2022-11-16 11:21:51","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("300","5","2022-11-16 11:21:56","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("301","5","2022-11-16 11:22:02","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("302","0","2022-11-16 11:22:49","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("303","0","2022-11-16 11:23:00","1","Creación de Permiso","El usuario ADMIN creó un nuevo permiso en el sistema");
INSERT INTO TBL_bitacora VALUES("304","0","2022-11-16 11:23:01","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("305","4","2022-11-16 11:24:37","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("306","1","2022-11-16 11:25:01","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("307","1","2022-11-16 11:26:18","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("308","3","2022-11-16 11:26:22","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("309","1","2022-11-16 11:26:27","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("310","1","2022-11-16 11:27:02","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("311","3","2022-11-16 11:27:06","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("312","3","2022-11-16 11:27:11","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("313","0","2022-11-16 11:27:40","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("314","0","2022-11-16 11:50:42","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("315","0","2022-11-16 11:51:23","1","Modificación de objeto","El usuario ADMIN actualizó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("316","0","2022-11-16 11:51:24","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("317","0","2022-11-16 11:51:48","1","Modificación de objeto","El usuario ADMIN actualizó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("318","0","2022-11-16 11:51:50","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("319","0","2022-11-16 11:51:57","1","Modificación de objeto","El usuario ADMIN actualizó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("320","0","2022-11-16 11:51:59","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("321","0","2022-11-16 11:52:28","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("322","0","2022-11-16 11:52:29","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("323","0","2022-11-16 11:52:40","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("324","0","2022-11-16 11:53:00","1","Creación de Permiso","El usuario ADMIN creó un nuevo permiso en el sistema");
INSERT INTO TBL_bitacora VALUES("325","0","2022-11-16 11:53:01","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("326","1","2022-11-16 11:54:43","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("327","0","2022-11-16 11:55:01","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("328","6","2022-11-16 11:55:07","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("329","0","2022-11-16 11:55:23","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("330","0","2022-11-16 11:55:37","6","Inicio de sesion","El usuario MARIOS entró al sistema");
INSERT INTO TBL_bitacora VALUES("331","1","2022-11-16 11:55:37","6","Cambio de vista","El usuario MARIOS entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("332","1","2022-11-16 11:55:50","6","Cambio de vista","El usuario MARIOS entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("333","0","2022-11-16 11:55:54","6","Cierre de sesión","El usuario MARIOS salió del sistema");
INSERT INTO TBL_bitacora VALUES("334","0","2022-11-16 11:58:42","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("335","1","2022-11-16 11:58:43","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("336","6","2022-11-16 12:22:12","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("337","6","2022-11-16 12:22:16","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("338","6","2022-11-16 12:22:31","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("339","6","2022-11-16 12:22:33","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("340","6","2022-11-16 12:22:44","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("341","6","2022-11-16 12:22:55","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("342","0","2022-11-16 12:23:43","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("343","0","2022-11-16 12:24:30","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("344","0","2022-11-16 12:24:32","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("345","0","2022-11-16 12:24:48","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("346","0","2022-11-16 12:25:01","1","Creación de Permiso","El usuario ADMIN creó un nuevo permiso en el sistema");
INSERT INTO TBL_bitacora VALUES("347","0","2022-11-16 12:25:03","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("348","1","2022-11-16 12:28:19","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("349","7","2022-11-16 12:31:01","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("350","1","2022-11-16 12:31:03","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("351","7","2022-11-16 12:31:32","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("352","1","2022-11-16 12:31:34","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("353","1","2022-11-16 12:32:00","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("354","7","2022-11-16 12:32:06","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("355","7","2022-11-16 12:32:45","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("356","7","2022-11-16 12:33:30","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("357","1","2022-11-16 12:33:32","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("358","1","2022-11-16 12:34:37","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("359","7","2022-11-16 12:34:43","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("360","7","2022-11-16 12:35:45","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("361","7","2022-11-16 12:36:11","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("362","7","2022-11-16 12:37:31","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("363","7","2022-11-16 12:37:54","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("364","1","2022-11-16 12:37:55","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("365","7","2022-11-16 12:38:04","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("366","1","2022-11-16 12:38:05","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("367","1","2022-11-16 12:38:37","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("368","7","2022-11-16 12:38:43","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("369","1","2022-11-16 12:38:45","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("370","1","2022-11-16 12:38:59","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("371","7","2022-11-16 12:39:04","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("372","7","2022-11-16 12:40:22","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("373","7","2022-11-16 12:42:05","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("374","7","2022-11-16 12:42:35","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("375","7","2022-11-16 12:43:13","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("376","7","2022-11-16 12:43:42","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("377","1","2022-11-16 12:43:53","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("378","7","2022-11-16 12:44:01","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("379","7","2022-11-16 12:47:11","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("380","7","2022-11-16 12:48:27","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("381","7","2022-11-16 12:48:29","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("382","7","2022-11-16 12:48:32","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("383","7","2022-11-16 12:48:34","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("384","7","2022-11-16 12:48:36","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("385","7","2022-11-16 12:48:39","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("386","7","2022-11-16 12:48:42","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("387","7","2022-11-16 12:48:45","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("388","1","2022-11-16 12:48:46","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("389","1","2022-11-16 12:50:52","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("390","7","2022-11-16 12:50:59","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("391","7","2022-11-16 12:51:13","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("392","7","2022-11-16 12:55:09","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("393","7","2022-11-16 12:58:27","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("394","7","2022-11-16 12:58:36","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("395","7","2022-11-16 12:59:22","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("396","7","2022-11-16 12:59:27","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("397","7","2022-11-16 12:59:32","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("398","0","2022-11-16 18:06:02","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("399","1","2022-11-16 18:06:03","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("400","0","2022-11-16 18:06:12","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("401","0","2022-11-16 18:07:35","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("402","0","2022-11-16 18:07:42","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("403","0","2022-11-16 19:49:44","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("404","1","2022-11-16 19:49:44","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("405","0","2022-11-16 19:54:29","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("406","0","2022-11-16 19:54:49","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("407","1","2022-11-16 19:54:54","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("408","2","2022-11-16 19:55:02","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("409","0","2022-11-16 20:00:07","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("410","0","2022-11-16 20:00:25","1","Cambio de vista","El usuario ADMIN entró a la vista de Inventario Disponible");
INSERT INTO TBL_bitacora VALUES("411","0","2022-11-16 20:00:31","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("412","0","2022-11-16 20:01:06","1","Producto Eliminado","El usuario ADMIN Elimino un producto del sistema");
INSERT INTO TBL_bitacora VALUES("413","0","2022-11-16 20:01:12","1","Producto Eliminado","El usuario ADMIN Elimino un producto del sistema");
INSERT INTO TBL_bitacora VALUES("414","0","2022-11-16 20:01:39","1","Producto Eliminado","El usuario ADMIN Elimino un producto del sistema");
INSERT INTO TBL_bitacora VALUES("415","2","2022-11-16 20:04:16","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("416","0","2022-11-16 20:07:31","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("417","1","2022-11-16 20:07:31","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("418","7","2022-11-16 20:08:13","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("419","7","2022-11-16 20:08:20","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("420","7","2022-11-16 20:08:36","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("421","0","2022-11-16 20:08:55","1","Modificación de objeto","El usuario ADMIN actualizó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("422","7","2022-11-16 20:08:57","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("423","0","2022-11-16 20:09:08","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("424","0","2022-11-16 20:09:22","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("425","0","2022-11-16 20:09:29","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("426","1","2022-11-16 20:09:29","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("427","0","2022-11-16 20:09:45","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("428","0","2022-11-16 20:10:45","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("429","0","2022-11-16 20:12:03","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("430","7","2022-11-16 20:12:14","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("431","0","2022-11-16 20:12:45","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("432","7","2022-11-16 20:12:47","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("433","0","2022-11-16 20:12:56","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("434","0","2022-11-16 20:13:10","1","Creación de Permiso","El usuario ADMIN creó un nuevo permiso en el sistema");
INSERT INTO TBL_bitacora VALUES("435","0","2022-11-16 20:13:11","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("436","6","2022-11-16 20:13:16","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("437","0","2022-11-16 20:13:18","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("438","7","2022-11-16 20:13:28","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("439","0","2022-11-16 20:13:35","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("440","0","2022-11-16 20:13:42","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("441","0","2022-11-16 20:13:49","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("442","0","2022-11-16 20:13:56","1","Cambio de vista","El usuario ADMIN entró a la vista de Preguntas");
INSERT INTO TBL_bitacora VALUES("443","7","2022-11-16 20:14:05","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("444","1","2022-11-16 20:15:34","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("445","1","2022-11-16 20:15:46","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("446","1","2022-11-16 20:16:02","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("447","8","2022-11-16 20:16:26","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Roles");
INSERT INTO TBL_bitacora VALUES("448","1","2022-11-16 20:16:48","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("449","1","2022-11-16 20:18:25","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("450","8","2022-11-16 20:18:31","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Roles");
INSERT INTO TBL_bitacora VALUES("451","8","2022-11-16 20:22:58","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Roles");
INSERT INTO TBL_bitacora VALUES("452","8","2022-11-16 20:23:04","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Roles");
INSERT INTO TBL_bitacora VALUES("453","8","2022-11-16 20:23:15","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Roles");
INSERT INTO TBL_bitacora VALUES("454","0","2022-11-16 20:23:36","1","Modificación de rol","El usuario ADMIN actualizó un rol del sistema");
INSERT INTO TBL_bitacora VALUES("455","8","2022-11-16 20:23:37","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Roles");
INSERT INTO TBL_bitacora VALUES("456","0","2022-11-16 20:23:47","1","Cambio de vista","El usuario ADMIN entró a la vista de Preguntas");
INSERT INTO TBL_bitacora VALUES("457","7","2022-11-16 20:24:35","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("458","0","2022-11-16 20:25:17","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("459","7","2022-11-16 20:25:18","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("460","0","2022-11-16 20:25:26","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("461","0","2022-11-16 20:25:57","1","Creación de Permiso","El usuario ADMIN creó un nuevo permiso en el sistema");
INSERT INTO TBL_bitacora VALUES("462","0","2022-11-16 20:25:58","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("463","1","2022-11-16 20:28:24","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("464","9","2022-11-16 20:28:38","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Parámetros");
INSERT INTO TBL_bitacora VALUES("465","9","2022-11-16 20:30:36","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Parámetros");
INSERT INTO TBL_bitacora VALUES("466","9","2022-11-16 20:30:42","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Parámetros");
INSERT INTO TBL_bitacora VALUES("467","9","2022-11-16 20:30:51","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Parámetros");
INSERT INTO TBL_bitacora VALUES("468","9","2022-11-16 20:31:01","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Parámetros");
INSERT INTO TBL_bitacora VALUES("469","9","2022-11-16 20:32:54","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Parámetros");
INSERT INTO TBL_bitacora VALUES("470","9","2022-11-16 20:33:01","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Parámetros");
INSERT INTO TBL_bitacora VALUES("471","9","2022-11-16 20:33:12","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Parámetros");
INSERT INTO TBL_bitacora VALUES("472","9","2022-11-16 20:33:18","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Parámetros");
INSERT INTO TBL_bitacora VALUES("473","0","2022-11-16 20:33:32","1","Cambio de vista","El usuario ADMIN entró a la vista de Preguntas");
INSERT INTO TBL_bitacora VALUES("474","7","2022-11-16 20:38:20","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("475","0","2022-11-16 20:39:00","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("476","7","2022-11-16 20:39:02","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("477","0","2022-11-16 20:40:12","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("478","0","2022-11-16 20:40:24","1","Creación de Permiso","El usuario ADMIN creó un nuevo permiso en el sistema");
INSERT INTO TBL_bitacora VALUES("479","0","2022-11-16 20:40:25","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("480","1","2022-11-16 20:40:37","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("481","0","2022-11-16 20:40:39","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("482","1","2022-11-16 20:40:40","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("483","0","2022-11-16 20:48:15","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("484","0","2022-11-16 20:51:42","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("485","0","2022-11-16 20:52:50","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("486","0","2022-11-16 20:53:06","1","Cambio de vista","El usuario ADMIN entró a la vista de Inventario Disponible");
INSERT INTO TBL_bitacora VALUES("487","10","2022-11-16 20:53:33","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Preguntas");
INSERT INTO TBL_bitacora VALUES("488","10","2022-11-16 20:53:39","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Preguntas");
INSERT INTO TBL_bitacora VALUES("489","10","2022-11-16 20:55:17","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Preguntas");
INSERT INTO TBL_bitacora VALUES("490","10","2022-11-16 20:55:29","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Preguntas");
INSERT INTO TBL_bitacora VALUES("491","2","2022-11-16 20:55:50","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("492","10","2022-11-16 20:55:55","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Preguntas");
INSERT INTO TBL_bitacora VALUES("493","1","2022-11-16 20:57:21","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("494","0","2022-11-16 20:57:30","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("495","0","2022-11-16 21:01:11","1","Modificación de Permiso","El usuario ADMIN actualizó un permiso del sistema");
INSERT INTO TBL_bitacora VALUES("496","0","2022-11-16 21:01:32","1","Modificación de Permiso","El usuario ADMIN actualizó un permiso del sistema");
INSERT INTO TBL_bitacora VALUES("497","0","2022-11-16 21:01:56","1","Modificación de Permiso","El usuario ADMIN actualizó un permiso del sistema");
INSERT INTO TBL_bitacora VALUES("498","0","2022-11-16 21:02:54","1","Modificación de Permiso","El usuario ADMIN actualizó un permiso del sistema");
INSERT INTO TBL_bitacora VALUES("499","0","2022-11-16 21:02:56","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("500","0","2022-11-16 21:09:25","1","Modificación de Permiso","El usuario ADMIN actualizó un permiso del sistema");
INSERT INTO TBL_bitacora VALUES("501","0","2022-11-16 21:09:26","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("502","1","2022-11-16 21:09:38","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("503","0","2022-11-16 21:09:48","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("504","0","2022-11-16 21:10:00","1","Modificación de Permiso","El usuario ADMIN actualizó un permiso del sistema");
INSERT INTO TBL_bitacora VALUES("505","0","2022-11-16 21:10:01","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("506","7","2022-11-16 21:11:12","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("507","0","2022-11-16 21:12:05","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("508","7","2022-11-16 21:12:06","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("509","0","2022-11-16 21:12:52","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("510","0","2022-11-16 21:14:37","1","Creación de Permiso","El usuario ADMIN creó un nuevo permiso en el sistema");
INSERT INTO TBL_bitacora VALUES("511","11","2022-11-16 21:14:39","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("512","1","2022-11-16 21:14:53","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("513","1","2022-11-16 21:15:02","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("514","1","2022-11-16 21:16:53","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("515","11","2022-11-16 21:17:12","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("516","11","2022-11-16 21:17:17","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("517","11","2022-11-16 21:18:50","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("518","11","2022-11-16 21:18:56","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("519","11","2022-11-16 21:19:14","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("520","0","2022-11-16 21:19:23","1","Modificación de Permiso","El usuario ADMIN actualizó un permiso del sistema");
INSERT INTO TBL_bitacora VALUES("521","11","2022-11-16 21:19:25","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("522","0","2022-11-16 21:19:37","1","Modificación de Permiso","El usuario ADMIN actualizó un permiso del sistema");
INSERT INTO TBL_bitacora VALUES("523","11","2022-11-16 21:19:39","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("524","0","2022-11-16 21:19:54","1","Modificación de Permiso","El usuario ADMIN actualizó un permiso del sistema");
INSERT INTO TBL_bitacora VALUES("525","11","2022-11-16 21:19:55","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("526","7","2022-11-16 21:20:01","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("527","7","2022-11-16 21:20:42","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("528","8","2022-11-16 21:21:31","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Roles");
INSERT INTO TBL_bitacora VALUES("529","11","2022-11-16 21:21:46","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("530","9","2022-11-16 21:22:06","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Parámetros");
INSERT INTO TBL_bitacora VALUES("531","10","2022-11-16 21:22:19","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Preguntas");
INSERT INTO TBL_bitacora VALUES("532","0","2022-11-16 21:58:49","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("533","1","2022-11-16 21:58:50","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("534","0","2022-11-16 21:59:02","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("535","0","2022-11-16 22:17:17","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("536","0","2022-11-16 22:18:00","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("537","0","2022-11-16 22:18:08","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("538","0","2022-11-16 22:18:49","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("539","0","2022-11-16 22:21:56","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("540","1","2022-11-16 22:23:45","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("541","0","2022-11-16 22:24:04","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("542","0","2022-11-16 22:24:15","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("543","1","2022-11-16 22:24:15","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("544","11","2022-11-16 22:24:24","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("545","0","2022-11-16 22:25:52","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("546","0","2022-11-16 22:38:50","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("547","0","2022-11-16 22:40:10","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("548","0","2022-11-16 22:41:52","1","Creación de Parámetro","El usuario ADMIN creó un nuevo parámetro en el sistema");
INSERT INTO TBL_bitacora VALUES("549","0","2022-11-16 22:41:55","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("550","0","2022-11-16 22:44:54","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("551","0","2022-11-16 22:45:39","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("552","0","2022-11-16 22:57:26","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("553","0","2022-11-16 23:08:02","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("554","0","2022-11-16 23:11:11","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("555","0","2022-11-16 23:13:03","1","Modificación de Recetario","El usuario ADMIN actualizó Recetario del sistema");
INSERT INTO TBL_bitacora VALUES("556","0","2022-11-16 23:13:06","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("557","0","2022-11-16 23:13:29","1","Modificación de Recetario","El usuario ADMIN actualizó Recetario del sistema");
INSERT INTO TBL_bitacora VALUES("558","0","2022-11-16 23:13:44","1","Modificación de Recetario","El usuario ADMIN actualizó Recetario del sistema");
INSERT INTO TBL_bitacora VALUES("559","0","2022-11-16 23:15:32","1","Modificación de Recetario","El usuario ADMIN actualizó Recetario del sistema");
INSERT INTO TBL_bitacora VALUES("560","0","2022-11-16 23:15:36","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("561","0","2022-11-16 23:21:20","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("562","0","2022-11-16 23:21:28","1","Parámetro eliminado","El usuario ADMIN eliminó un parámetro del sistema");
INSERT INTO TBL_bitacora VALUES("563","0","2022-11-16 23:21:31","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("564","0","2022-11-16 23:22:02","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("565","0","2022-11-16 23:24:45","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("566","0","2022-11-16 23:24:53","1","Recetario eliminado","El usuario ADMIN eliminó un recetario del sistema");
INSERT INTO TBL_bitacora VALUES("567","0","2022-11-16 23:24:55","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("568","0","2022-11-16 23:32:17","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("569","0","2022-11-16 23:36:49","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("570","0","2022-11-16 23:37:50","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("571","0","2022-11-16 23:39:30","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("572","0","2022-11-16 23:41:22","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("573","0","2022-11-16 23:44:44","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("574","0","2022-11-16 23:46:47","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("575","0","2022-11-16 23:47:10","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("576","0","2022-11-16 23:48:35","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("577","0","2022-11-17 00:04:11","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("578","0","2022-11-17 00:04:49","1","Creación de Parámetro","El usuario ADMIN creó un nuevo parámetro en el sistema");
INSERT INTO TBL_bitacora VALUES("579","0","2022-11-17 00:04:51","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("580","0","2022-11-17 00:05:03","1","Modificación de Recetario","El usuario ADMIN actualizó Recetario del sistema");
INSERT INTO TBL_bitacora VALUES("581","0","2022-11-17 00:05:11","1","Modificación de Recetario","El usuario ADMIN actualizó Recetario del sistema");
INSERT INTO TBL_bitacora VALUES("582","0","2022-11-17 00:05:45","1","Recetario eliminado","El usuario ADMIN eliminó un recetario del sistema");
INSERT INTO TBL_bitacora VALUES("583","0","2022-11-17 00:05:47","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("584","0","2022-11-17 00:08:41","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("585","0","2022-11-17 00:08:56","1","Creación de Receta","El usuario ADMIN creó una nueva receta en el sistema");
INSERT INTO TBL_bitacora VALUES("586","0","2022-11-17 00:08:58","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("587","0","2022-11-17 00:09:12","1","Modificación de Receta","El usuario ADMIN actualizó una Receta del sistema");
INSERT INTO TBL_bitacora VALUES("588","0","2022-11-17 00:09:14","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("589","0","2022-11-17 00:12:13","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("590","1","2022-11-17 00:12:14","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("591","2","2022-11-17 00:12:53","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("592","10","2022-11-17 00:32:18","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Preguntas");
INSERT INTO TBL_bitacora VALUES("593","6","2022-11-17 00:38:28","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("594","6","2022-11-17 00:43:33","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("595","6","2022-11-17 00:43:52","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("596","6","2022-11-17 00:49:05","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("597","6","2022-11-17 00:51:26","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("598","6","2022-11-17 00:53:44","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("599","6","2022-11-17 00:54:50","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("600","6","2022-11-17 00:56:20","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("601","6","2022-11-17 00:56:54","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("602","6","2022-11-17 00:57:46","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("603","6","2022-11-17 00:58:11","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("604","6","2022-11-17 00:59:01","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("605","6","2022-11-17 00:59:42","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("606","6","2022-11-17 01:01:19","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("607","6","2022-11-17 01:01:44","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("608","6","2022-11-17 01:02:49","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("609","6","2022-11-17 01:05:00","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("610","6","2022-11-17 01:05:31","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("611","6","2022-11-17 01:07:42","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("612","6","2022-11-17 01:09:25","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("613","6","2022-11-17 01:09:59","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("614","6","2022-11-17 01:10:50","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("615","0","2022-11-17 01:11:26","1","Creación de usuario","El usuario ADMIN creó un nuevo usuario en el sistema");
INSERT INTO TBL_bitacora VALUES("616","6","2022-11-17 01:11:45","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("617","6","2022-11-17 01:14:52","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("618","0","2022-11-17 01:15:32","1","Creación de usuario","El usuario ADMIN creó un nuevo usuario en el sistema");
INSERT INTO TBL_bitacora VALUES("619","6","2022-11-17 01:15:36","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("620","6","2022-11-17 01:20:17","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("621","6","2022-11-17 01:22:28","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("622","6","2022-11-17 01:25:47","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("623","6","2022-11-17 01:26:55","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("624","8","2022-11-17 01:27:18","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Roles");
INSERT INTO TBL_bitacora VALUES("625","0","2022-11-17 01:27:57","1","Creación de Rol","El usuario ADMIN creó un nuevo rol en el sistema");
INSERT INTO TBL_bitacora VALUES("626","8","2022-11-17 01:27:59","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Roles");
INSERT INTO TBL_bitacora VALUES("627","6","2022-11-17 01:28:07","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("628","6","2022-11-17 01:28:40","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("629","6","2022-11-17 01:29:53","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("630","6","2022-11-17 01:30:14","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("631","6","2022-11-17 01:32:58","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("632","6","2022-11-17 01:34:47","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("633","0","2022-11-17 01:34:58","1","Modificación de usuario","El usuario ADMIN actualizó un usuario del sistema");
INSERT INTO TBL_bitacora VALUES("634","6","2022-11-17 01:35:00","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("635","0","2022-11-17 01:35:46","1","Eliminacion de usuario","El usuario ADMIN eliminó un usuario del sistema");
INSERT INTO TBL_bitacora VALUES("636","6","2022-11-17 01:35:48","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("637","0","2022-11-17 01:35:53","1","Eliminacion de usuario","El usuario ADMIN eliminó un usuario del sistema");
INSERT INTO TBL_bitacora VALUES("638","6","2022-11-17 01:35:55","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("639","6","2022-11-17 01:39:07","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("640","6","2022-11-17 01:39:13","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("641","6","2022-11-17 01:41:17","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("642","6","2022-11-17 01:41:22","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("643","1","2022-11-17 01:41:34","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("644","2","2022-11-17 01:42:21","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("645","3","2022-11-17 01:42:35","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("646","3","2022-11-17 01:42:49","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("647","3","2022-11-17 01:53:19","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("648","3","2022-11-17 01:54:00","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("649","4","2022-11-17 01:54:03","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("650","3","2022-11-17 01:54:07","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("651","3","2022-11-17 01:54:22","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("652","3","2022-11-17 01:55:37","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("653","3","2022-11-17 01:55:57","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("654","3","2022-11-17 01:56:20","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("655","3","2022-11-17 01:56:45","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("656","6","2022-11-17 01:56:50","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("657","3","2022-11-17 01:56:55","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("658","3","2022-11-17 02:05:56","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("659","6","2022-11-17 02:06:07","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("660","3","2022-11-17 02:06:10","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("661","3","2022-11-17 02:06:21","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("662","3","2022-11-17 02:07:06","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("663","3","2022-11-17 02:08:10","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("664","3","2022-11-17 02:10:40","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("665","3","2022-11-17 02:11:29","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("666","3","2022-11-17 02:12:45","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("667","3","2022-11-17 02:13:01","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("668","3","2022-11-17 02:13:26","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("669","3","2022-11-17 02:15:04","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("670","3","2022-11-17 02:16:09","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("671","3","2022-11-17 02:21:31","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("672","3","2022-11-17 02:22:17","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("673","0","2022-11-17 02:22:34","1","Creación de Insumo","El usuario ADMIN creó un nuevo insumo en el sistema");
INSERT INTO TBL_bitacora VALUES("674","3","2022-11-17 02:22:40","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("675","3","2022-11-17 02:31:48","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("676","0","2022-11-17 02:32:04","1","Modificación de insumo","El usuario ADMIN actualizó un insumo en el sistema");
INSERT INTO TBL_bitacora VALUES("677","3","2022-11-17 02:32:11","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("678","3","2022-11-17 02:32:46","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("679","3","2022-11-17 02:34:12","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("680","0","2022-11-17 02:34:20","1","Modificación de insumo","El usuario ADMIN actualizó un insumo en el sistema");
INSERT INTO TBL_bitacora VALUES("681","3","2022-11-17 02:34:21","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("682","0","2022-11-17 02:34:55","1","Insumo eliminado","El usuario ADMIN eliminó un insumo del sistema");
INSERT INTO TBL_bitacora VALUES("683","3","2022-11-17 02:34:57","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("684","0","2022-11-17 02:35:02","1","Insumo eliminado","El usuario ADMIN eliminó un insumo del sistema");
INSERT INTO TBL_bitacora VALUES("685","3","2022-11-17 02:35:04","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("686","3","2022-11-17 02:36:50","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("687","3","2022-11-17 02:37:13","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("688","4","2022-11-17 02:37:24","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("689","3","2022-11-17 02:37:31","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("690","6","2022-11-17 02:37:34","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("691","3","2022-11-17 02:37:39","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("692","3","2022-11-17 02:41:45","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("693","3","2022-11-17 02:42:13","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("694","3","2022-11-17 02:42:19","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("695","3","2022-11-17 02:42:23","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("696","1","2022-11-17 02:42:34","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("697","3","2022-11-17 02:42:45","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("698","3","2022-11-17 02:43:11","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("699","1","2022-11-17 02:43:20","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("700","0","2022-11-17 04:42:53","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("701","1","2022-11-17 04:42:54","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("702","2","2022-11-17 05:00:13","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("703","0","2022-11-17 06:24:00","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("704","1","2022-11-17 06:24:00","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("705","1","2022-11-17 06:34:23","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("706","1","2022-11-17 06:47:14","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("707","0","2022-11-17 06:47:22","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("708","0","2022-11-17 06:48:48","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("709","1","2022-11-17 06:48:48","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("710","1","2022-11-17 06:49:25","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("711","1","2022-11-17 06:51:37","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("712","1","2022-11-17 06:52:04","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("713","1","2022-11-17 06:54:23","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("714","1","2022-11-17 06:55:07","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("715","1","2022-11-17 06:55:59","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("716","1","2022-11-17 06:56:49","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("717","1","2022-11-17 06:57:46","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("718","1","2022-11-17 06:59:30","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("719","1","2022-11-17 07:25:57","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("720","1","2022-11-17 07:32:55","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("721","1","2022-11-17 07:34:19","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("722","1","2022-11-17 07:57:43","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("723","1","2022-11-17 07:58:21","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("724","1","2022-11-17 07:58:41","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("725","1","2022-11-17 07:59:19","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("726","1","2022-11-17 08:17:30","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("727","1","2022-11-17 08:18:32","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("728","1","2022-11-17 08:19:10","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("729","1","2022-11-17 08:19:48","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("730","1","2022-11-17 08:20:04","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("731","0","2022-11-17 08:22:27","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("732","1","2022-11-17 08:22:28","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("733","1","2022-11-17 08:22:44","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("734","1","2022-11-17 08:25:52","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("735","6","2022-11-17 08:59:32","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("736","1","2022-11-17 12:02:50","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("737","6","2022-11-17 12:49:30","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("738","0","2022-11-17 15:12:19","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("739","1","2022-11-17 15:12:20","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("740","1","2022-11-17 15:34:56","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("741","2","2022-11-17 15:35:23","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("742","2","2022-11-17 15:35:41","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("743","0","2022-11-17 15:59:14","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("744","1","2022-11-17 15:59:15","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("745","0","2022-11-17 16:02:49","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("746","1","2022-11-17 16:02:50","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("747","0","2022-11-17 04:25:37","","Creación de Compra","El usuario ADMIN realizó una nueva compra en el sistema");
INSERT INTO TBL_bitacora VALUES("748","0","2022-11-17 04:28:16","","Creación de Compra","El usuario ADMIN realizó una nueva compra en el sistema");
INSERT INTO TBL_bitacora VALUES("749","0","2022-11-17 04:47:13","","Creación de Compra","El usuario ADMIN realizó una nueva compra en el sistema");
INSERT INTO TBL_bitacora VALUES("750","0","2022-11-17 04:48:09","","Creación de Compra","El usuario ADMIN realizó una nueva compra en el sistema");
INSERT INTO TBL_bitacora VALUES("751","0","2022-11-17 04:49:00","","Creación de Compra","El usuario ADMIN realizó una nueva compra en el sistema");
INSERT INTO TBL_bitacora VALUES("752","0","2022-11-17 05:16:54","","Creación de Compra","El usuario ADMIN realizó una nueva compra en el sistema");
INSERT INTO TBL_bitacora VALUES("753","0","2022-11-17 05:17:04","","Creación de Compra","El usuario ADMIN realizó una nueva compra en el sistema");
INSERT INTO TBL_bitacora VALUES("754","0","2022-11-17 05:17:46","","Creación de Compra","El usuario ADMIN realizó una nueva compra en el sistema");
INSERT INTO TBL_bitacora VALUES("755","0","2022-11-17 05:18:18","","Creación de Compra","El usuario ADMIN realizó una nueva compra en el sistema");
INSERT INTO TBL_bitacora VALUES("756","0","2022-11-17 05:19:56","","Creación de Compra","El usuario ADMIN realizó una nueva compra en el sistema");
INSERT INTO TBL_bitacora VALUES("757","0","2022-11-17 05:28:31","","Creación de Compra","El usuario ADMIN realizó una nueva compra en el sistema");
INSERT INTO TBL_bitacora VALUES("758","0","2022-11-17 05:28:56","","Creación de Compra","El usuario ADMIN realizó una nueva compra en el sistema");
INSERT INTO TBL_bitacora VALUES("759","0","2022-11-17 05:30:03","","Creación de Compra","El usuario ADMIN realizó una nueva compra en el sistema");
INSERT INTO TBL_bitacora VALUES("760","0","2022-11-17 05:30:23","","Creación de Compra","El usuario ADMIN realizó una nueva compra en el sistema");
INSERT INTO TBL_bitacora VALUES("761","0","2022-11-17 05:30:43","","Creación de Compra","El usuario ADMIN realizó una nueva compra en el sistema");
INSERT INTO TBL_bitacora VALUES("762","0","2022-11-17 05:30:59","","Creación de Compra","El usuario ADMIN realizó una nueva compra en el sistema");
INSERT INTO TBL_bitacora VALUES("763","0","2022-11-17 05:32:03","","Creación de Compra","El usuario ADMIN realizó una nueva compra en el sistema");
INSERT INTO TBL_bitacora VALUES("764","1","2022-11-17 17:37:23","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("765","2","2022-11-17 17:37:29","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("766","2","2022-11-17 17:37:35","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("767","3","2022-11-17 17:37:54","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("768","4","2022-11-17 17:38:01","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("769","0","2022-11-17 17:38:10","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("770","0","2022-11-17 17:39:06","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("771","6","2022-11-17 17:40:03","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("772","7","2022-11-17 17:40:58","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("773","9","2022-11-17 17:41:16","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Parámetros");
INSERT INTO TBL_bitacora VALUES("774","1","2022-11-17 17:42:17","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("775","0","2022-11-17 18:21:23","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("776","1","2022-11-17 18:21:24","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("777","3","2022-11-17 18:21:46","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("778","0","2022-11-17 18:21:50","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("779","2","2022-11-17 19:29:41","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("780","0","2022-11-17 07:31:06","1","Creación de Proveedor","El usuario ADMIN creó un nuevo proveedor en el sistema");
INSERT INTO TBL_bitacora VALUES("781","2","2022-11-17 19:31:15","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("782","0","2022-11-17 19:40:58","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("783","1","2022-11-17 19:40:59","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("784","1","2022-11-17 19:41:12","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("785","1","2022-11-17 19:41:18","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("786","0","2022-11-17 19:42:16","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("787","0","2022-11-17 20:48:55","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("788","1","2022-11-17 20:48:55","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("789","3","2022-11-17 20:49:07","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("790","4","2022-11-17 20:49:13","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("791","1","2022-11-17 20:49:23","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");



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
  `fech_compra` datetime DEFAULT NULL,
  `total_compra` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `FK_compra_proveedor_idx` (`id_proveedor`),
  KEY `FK_compra_usu_idx` (`id_usuario`),
  KEY `FK_estado_compra_idx` (`id_estado_compra`),
  CONSTRAINT `FK_TBL_compras_TBL_Proveedores` FOREIGN KEY (`id_proveedor`) REFERENCES `TBL_Proveedores` (`id_Proveedores`),
  CONSTRAINT `FK_TBL_compras_TBL_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `TBL_usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_compras VALUES("1","1","1","1","2022-11-17 00:00:00","24.00");
INSERT INTO TBL_compras VALUES("2","2","1","2","2022-11-17 00:00:00","369.00");
INSERT INTO TBL_compras VALUES("3","2","1","2","2022-11-17 00:00:00","649.00");
INSERT INTO TBL_compras VALUES("4","1","1","1","2022-11-17 16:48:09","60.00");
INSERT INTO TBL_compras VALUES("5","6","1","1","2022-11-17 16:48:59","552.00");
INSERT INTO TBL_compras VALUES("6","1","1","2","2022-11-17 17:16:53","342.72");
INSERT INTO TBL_compras VALUES("7","1","1","2","2022-11-17 17:17:03","342.72");
INSERT INTO TBL_compras VALUES("8","1","1","2","2022-11-17 17:17:46","342.72");
INSERT INTO TBL_compras VALUES("9","1","1","2","2022-11-17 17:18:18","342.72");
INSERT INTO TBL_compras VALUES("10","1","1","2","2022-11-17 17:19:56","342.72");
INSERT INTO TBL_compras VALUES("11","1","1","2","2022-11-17 17:28:30","342.72");
INSERT INTO TBL_compras VALUES("12","1","1","2","2022-11-17 17:28:55","342.72");
INSERT INTO TBL_compras VALUES("13","1","1","2","2022-11-17 17:30:02","342.72");
INSERT INTO TBL_compras VALUES("14","1","1","2","2022-11-17 17:30:23","342.72");
INSERT INTO TBL_compras VALUES("15","1","1","2","2022-11-17 17:30:42","342.72");
INSERT INTO TBL_compras VALUES("16","1","1","2","2022-11-17 17:30:58","342.72");
INSERT INTO TBL_compras VALUES("17","1","1","2","2022-11-17 17:32:02","342.72");



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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_estado_compras VALUES("1","PENDIENTE");
INSERT INTO TBL_estado_compras VALUES("2","REALIZADA");



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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_insumos VALUES("1","CAFE","1","295","125","LB");
INSERT INTO TBL_insumos VALUES("2","GALLETA","2","12","3","UN");
INSERT INTO TBL_insumos VALUES("3","AZUCAR","1","126","45","LB");



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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_ms_roles VALUES("1","ADMIN SISTEMA","Rol encargado de la gestion total del sistema y los datos del mismo","ADMIN","2022-11-08 18:46:07","ADMIN","2022-11-16 20:23:35");
INSERT INTO TBL_ms_roles VALUES("2","ADMIN INVENTARIO","Rol encargado de las compras y gestion de insumos de la empresa","ADMIN","2022-11-08 18:47:13","","");
INSERT INTO TBL_ms_roles VALUES("3","VENDEDOR","Rol encargado de la facturacion y ventas de los productos de la empresa","ADMIN","2022-11-08 18:48:45","","");
INSERT INTO TBL_ms_roles VALUES("4","DEFAULT","Rol sin privilegios para entrar al sistema","ADMIN","2022-11-17 01:27:56","","");



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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_objetos VALUES("1","HOME","Pantalla principal del sistema","Home","ADMIN","2022-11-16 11:06:36","","");
INSERT INTO TBL_objetos VALUES("2","PROVEEDORES","Creación y gestión de los proveedores de insumos de la empresa","Proveedores","ADMIN","2022-11-16 11:07:32","ADMIN","2022-11-16 11:51:57");
INSERT INTO TBL_objetos VALUES("3","INSUMOS","Creación y gestión de los insumos utilizados por la empresa","Insumos","ADMIN","2022-11-16 11:10:51","ADMIN","2022-11-16 11:51:48");
INSERT INTO TBL_objetos VALUES("4","INVENTARIO","Contiene las existencias en bodega de los insumos de la empresa","Insumos","ADMIN","2022-11-16 11:11:44","","");
INSERT INTO TBL_objetos VALUES("5","MOVIM_INVENTARIO","Muestra las entradas y salidas de inventario por motivo de compras de insumos o ventas de productos","Home","ADMIN","2022-11-16 11:13:20","ADMIN","2022-11-16 20:08:55");
INSERT INTO TBL_objetos VALUES("6","USUARIOS","Creación y gestión de los usuarios del sistema","Mantenimiento","ADMIN","2022-11-16 11:52:27","","");
INSERT INTO TBL_objetos VALUES("7","OBJETOS","Creación y gestión de los módulos que componen el sistema","Mantenimiento","ADMIN","2022-11-16 12:24:29","","");
INSERT INTO TBL_objetos VALUES("8","ROLES","Creación y gestión de los roles de usuario","Mantenimiento","ADMIN","2022-11-16 20:12:44","","");
INSERT INTO TBL_objetos VALUES("9","PARAMETROS","Creación y gestión de los parámetros utilizados por el sistema","Mantenimiento","ADMIN","2022-11-16 20:25:16","","");
INSERT INTO TBL_objetos VALUES("10","PREGUNTAS","Creación y gestión de las preguntas de recuperación del sistema","Mantenimiento","ADMIN","2022-11-16 20:39:00","","");
INSERT INTO TBL_objetos VALUES("11","PERMISOS","Creación y gestión de los permisos otorgados para realizar acciones en el sistema","Mantenimiento","ADMIN","2022-11-16 21:12:04","","");



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
  CONSTRAINT `FK_TBL_permisos_TBL_ms_roles` FOREIGN KEY (`id_rol`) REFERENCES `TBL_ms_roles` (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_permisos VALUES("1","2","1","1","1","1","ADMIN","2022-11-15 21:21:26","ADMIN","2022-11-16 21:19:23");
INSERT INTO TBL_permisos VALUES("1","3","1","1","1","1","ADMIN","2022-11-16 11:21:36","","");
INSERT INTO TBL_permisos VALUES("1","4","0","0","0","1","ADMIN","2022-11-16 11:23:00","","");
INSERT INTO TBL_permisos VALUES("1","6","1","1","1","1","ADMIN","2022-11-16 11:52:59","ADMIN","2022-11-16 21:09:59");
INSERT INTO TBL_permisos VALUES("1","7","1","1","1","1","ADMIN","2022-11-16 12:25:00","","");
INSERT INTO TBL_permisos VALUES("1","8","1","1","1","1","ADMIN","2022-11-16 20:13:09","ADMIN","2022-11-16 21:19:37");
INSERT INTO TBL_permisos VALUES("1","9","1","1","1","1","ADMIN","2022-11-16 20:25:56","ADMIN","2022-11-16 21:19:53");
INSERT INTO TBL_permisos VALUES("1","10","1","1","1","1","ADMIN","2022-11-16 20:40:24","","");
INSERT INTO TBL_permisos VALUES("1","11","1","1","1","1","ADMIN","2022-11-16 21:14:37","","");



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

INSERT INTO TBL_producto VALUES("27","CAFE","1","buen cafe","122.00","../productos_img/descarga.png");
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_recetario VALUES("1","27","3","12");
INSERT INTO TBL_recetario VALUES("4","32","2","4");



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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO TBL_usuarios VALUES("1","ADMIN","ADMINISTRADOR","Activo","$2y$12$d9ZLQGv4lBE4Lcv2atFD2ODwdR7jwqQh3uXhTJ0jFeRWVucd6YXrG","1","2023-10-23 00:00:00","1","1","2023-10-23","admincitycoffee@gmail.com","ADMIN","2022-10-28 13:44:33","ADMIN","2022-10-28 13:44:33");
INSERT INTO TBL_usuarios VALUES("6","MARIOS","MARIO SILVA","Activo","$2y$12$eGEOPtCxe2A0Uf7rSRNoiu2il.85SaT0y4eJheaCQxChMELNAnAbK","2","","","1","2023-11-07","karimhernandez233@gmail.com","ADMIN","2022-11-08 19:38:27","MARIOS","2022-11-12 17:41:09");
INSERT INTO TBL_usuarios VALUES("7","nuevo","prueba","Activo","$2y$12$eGEOPtCxe2A0Uf7rSRNoiu2il.85SaT0y4eJheaCQxChMELNAnAbK","2","","","1","2023-11-07","roman@gmial.com","ADMIN","2022-11-08 19:38:37","ADMIN","2022-11-12 17:41:09");


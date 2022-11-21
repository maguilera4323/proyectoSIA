

CREATE TABLE `TBL_Clientes` (
  `id_clientes` int NOT NULL AUTO_INCREMENT,
  `nom_cliente` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `rtn_cliente` varchar(40) DEFAULT NULL,
  `dni_clinte` varchar(20) DEFAULT NULL,
  `tel_cliente` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id_clientes`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_Clientes VALUES("1","SULA","0808-0225-12429-4","0808-0225-12429","8733-9514");



CREATE TABLE `TBL_Proveedores` (
  `id_Proveedores` int NOT NULL AUTO_INCREMENT,
  `nom_proveedor` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `rtn_proveedor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tel_proveedor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `correo_proveedor` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dir_proveedor` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_Proveedores`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=1174 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
INSERT INTO TBL_bitacora VALUES("792","6","2022-11-17 20:51:21","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("793","0","2022-11-17 21:32:51","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("794","1","2022-11-17 21:32:51","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("795","1","2022-11-17 21:36:54","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("796","0","2022-11-17 21:40:15","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("797","0","2022-11-17 23:33:58","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("798","1","2022-11-17 23:33:59","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("799","0","2022-11-17 23:34:35","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("800","0","2022-11-18 11:39:13","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("801","1","2022-11-18 11:39:14","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("802","1","2022-11-18 12:43:18","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("803","1","2022-11-18 14:05:33","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("804","1","2022-11-18 14:22:32","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("805","0","2022-11-18 14:41:52","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("806","1","2022-11-18 14:41:53","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("807","2","2022-11-18 14:42:09","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("808","1","2022-11-18 14:42:17","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("809","0","2022-11-18 14:51:40","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("810","1","2022-11-18 14:51:41","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("811","2","2022-11-18 14:53:13","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("812","0","2022-11-18 14:59:06","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("813","0","2022-11-18 15:18:19","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("814","0","2022-11-18 15:22:06","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("815","0","2022-11-18 15:23:01","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("816","0","2022-11-18 15:25:12","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("817","0","2022-11-18 15:26:13","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("818","0","2022-11-18 15:28:59","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("819","0","2022-11-18 15:29:31","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("820","0","2022-11-18 15:45:08","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("821","0","2022-11-18 15:45:54","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("822","3","2022-11-18 15:58:29","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("823","0","2022-11-18 15:58:48","1","Creación de Insumo","El usuario ADMIN creó un nuevo insumo en el sistema");
INSERT INTO TBL_bitacora VALUES("824","0","2022-11-18 15:59:02","1","Creación de Insumo","El usuario ADMIN creó un nuevo insumo en el sistema");
INSERT INTO TBL_bitacora VALUES("825","4","2022-11-18 16:00:34","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("826","3","2022-11-18 16:00:39","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("827","0","2022-11-18 16:00:57","1","Creación de Insumo","El usuario ADMIN creó un nuevo insumo en el sistema");
INSERT INTO TBL_bitacora VALUES("828","0","2022-11-18 16:01:52","1","Creación de Insumo","El usuario ADMIN creó un nuevo insumo en el sistema");
INSERT INTO TBL_bitacora VALUES("829","3","2022-11-18 16:02:33","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("830","0","2022-11-18 16:02:46","1","Creación de Insumo","El usuario ADMIN creó un nuevo insumo en el sistema");
INSERT INTO TBL_bitacora VALUES("831","3","2022-11-18 16:02:49","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("832","0","2022-11-18 16:03:43","1","Creación de Insumo","El usuario ADMIN creó un nuevo insumo en el sistema");
INSERT INTO TBL_bitacora VALUES("833","3","2022-11-18 16:03:45","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("834","4","2022-11-18 16:04:46","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("835","4","2022-11-18 16:05:17","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("836","3","2022-11-18 16:06:32","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("837","0","2022-11-18 16:06:48","1","Creación de Insumo","El usuario ADMIN creó un nuevo insumo en el sistema");
INSERT INTO TBL_bitacora VALUES("838","3","2022-11-18 16:06:50","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("839","4","2022-11-18 16:06:54","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("840","0","2022-11-18 16:29:22","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("841","1","2022-11-18 16:47:48","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("842","3","2022-11-18 16:47:52","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("843","0","2022-11-18 16:56:34","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("844","0","2022-11-18 17:02:54","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("845","0","2022-11-18 17:05:57","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("846","0","2022-11-18 17:06:34","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("847","0","2022-11-18 17:06:49","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("848","4","2022-11-18 17:07:20","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("849","3","2022-11-18 17:09:23","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("850","3","2022-11-18 17:11:52","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("851","4","2022-11-18 17:11:57","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("852","4","2022-11-18 17:14:22","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("853","4","2022-11-18 17:14:43","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("854","3","2022-11-18 17:14:46","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("855","4","2022-11-18 17:15:11","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("856","4","2022-11-18 17:16:12","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("857","4","2022-11-18 17:16:54","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("858","4","2022-11-18 17:17:40","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("859","3","2022-11-18 17:17:44","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("860","4","2022-11-18 17:17:51","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("861","6","2022-11-18 17:17:55","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("862","6","2022-11-18 17:17:56","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("863","6","2022-11-18 17:18:28","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("864","3","2022-11-18 17:18:31","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("865","4","2022-11-18 17:18:34","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("866","3","2022-11-18 17:18:37","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("867","4","2022-11-18 17:18:41","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("868","4","2022-11-18 17:18:45","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("869","4","2022-11-18 17:22:34","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("870","4","2022-11-18 17:23:25","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("871","3","2022-11-18 17:25:16","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("872","1","2022-11-18 17:25:20","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("873","6","2022-11-18 17:45:11","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("874","0","2022-11-18 17:53:47","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("875","1","2022-11-18 17:54:09","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("876","4","2022-11-18 17:54:17","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("877","4","2022-11-18 17:57:38","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("878","3","2022-11-18 17:58:15","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("879","0","2022-11-18 17:58:36","1","Creación de Insumo","El usuario ADMIN creó un nuevo insumo en el sistema");
INSERT INTO TBL_bitacora VALUES("880","3","2022-11-18 17:58:37","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("881","4","2022-11-18 17:58:41","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("882","0","2022-11-18 17:58:59","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("883","1","2022-11-18 17:59:09","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("884","0","2022-11-18 18:07:51","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("885","1","2022-11-18 18:09:48","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("886","4","2022-11-18 18:10:24","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("887","0","2022-11-18 20:54:35","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("888","0","2022-11-18 20:55:13","6","Inicio de sesion","El usuario MARIOS entró al sistema");
INSERT INTO TBL_bitacora VALUES("889","1","2022-11-18 20:55:16","6","Cambio de vista","El usuario MARIOS entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("890","0","2022-11-18 21:29:38","6","Inicio de sesion","El usuario MARIOS entró al sistema");
INSERT INTO TBL_bitacora VALUES("891","1","2022-11-18 21:29:43","6","Cambio de vista","El usuario MARIOS entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("892","0","2022-11-19 07:07:30","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("893","1","2022-11-19 07:07:31","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("894","1","2022-11-19 07:07:56","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("895","1","2022-11-19 07:08:06","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("896","2","2022-11-19 07:08:11","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("897","2","2022-11-19 07:08:22","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("898","2","2022-11-19 07:11:45","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("899","7","2022-11-19 07:25:01","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("900","3","2022-11-19 07:25:21","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("901","3","2022-11-19 07:26:31","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("902","3","2022-11-19 07:27:31","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("903","3","2022-11-19 07:31:36","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("904","3","2022-11-19 07:32:12","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("905","3","2022-11-19 07:32:59","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("906","3","2022-11-19 07:33:22","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("907","3","2022-11-19 07:34:47","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("908","3","2022-11-19 07:35:12","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("909","3","2022-11-19 07:35:35","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("910","3","2022-11-19 07:35:51","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("911","0","2022-11-19 07:36:00","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("912","0","2022-11-19 07:36:09","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("913","1","2022-11-19 07:36:10","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("914","3","2022-11-19 07:36:15","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("915","3","2022-11-19 07:37:04","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("916","3","2022-11-19 07:38:10","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("917","3","2022-11-19 07:41:12","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("918","3","2022-11-19 07:42:00","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("919","3","2022-11-19 07:42:32","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("920","6","2022-11-19 07:42:43","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("921","6","2022-11-19 07:44:49","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("922","7","2022-11-19 07:45:28","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("923","7","2022-11-19 07:46:31","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("924","8","2022-11-19 07:46:47","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Roles");
INSERT INTO TBL_bitacora VALUES("925","8","2022-11-19 07:47:30","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Roles");
INSERT INTO TBL_bitacora VALUES("926","11","2022-11-19 07:47:52","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("927","11","2022-11-19 07:49:22","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("928","9","2022-11-19 07:49:44","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Parámetros");
INSERT INTO TBL_bitacora VALUES("929","9","2022-11-19 07:50:54","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Parámetros");
INSERT INTO TBL_bitacora VALUES("930","10","2022-11-19 07:51:07","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Preguntas");
INSERT INTO TBL_bitacora VALUES("931","10","2022-11-19 07:51:39","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Preguntas");
INSERT INTO TBL_bitacora VALUES("932","0","2022-11-19 07:51:58","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("933","0","2022-11-19 07:53:45","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("934","0","2022-11-19 07:55:03","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("935","0","2022-11-19 07:55:39","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("936","0","2022-11-19 07:55:48","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("937","0","2022-11-19 07:57:10","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("938","0","2022-11-19 07:57:43","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("939","0","2022-11-19 07:58:21","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("940","0","2022-11-19 07:59:13","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("941","0","2022-11-19 07:59:33","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("942","0","2022-11-19 08:00:00","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("943","0","2022-11-19 08:01:10","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("944","0","2022-11-19 08:02:07","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("945","0","2022-11-19 08:03:18","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("946","0","2022-11-19 08:03:31","1","Modificación de Receta","El usuario ADMIN actualizó una Receta del sistema");
INSERT INTO TBL_bitacora VALUES("947","0","2022-11-19 08:03:32","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("948","0","2022-11-19 08:04:19","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("949","0","2022-11-19 08:04:30","6","Inicio de sesion","El usuario MARIOS entró al sistema");
INSERT INTO TBL_bitacora VALUES("950","1","2022-11-19 08:04:30","6","Cambio de vista","El usuario MARIOS entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("951","0","2022-11-19 08:42:46","6","Cierre de sesión","El usuario MARIOS salió del sistema");
INSERT INTO TBL_bitacora VALUES("952","0","2022-11-19 08:56:00","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("953","1","2022-11-19 08:56:00","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("954","4","2022-11-19 08:56:20","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("955","4","2022-11-19 08:56:53","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("956","0","2022-11-19 11:17:05","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("957","1","2022-11-19 11:17:06","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("958","2","2022-11-19 11:18:33","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("959","0","2022-11-19 11:28:07","1","Producto Eliminado","El usuario ADMIN Elimino un producto del sistema");
INSERT INTO TBL_bitacora VALUES("960","0","2022-11-19 11:29:38","1","Producto Eliminado","El usuario ADMIN Elimino un producto del sistema");
INSERT INTO TBL_bitacora VALUES("961","0","2022-11-19 11:30:01","1","Producto Eliminado","El usuario ADMIN Elimino un producto del sistema");
INSERT INTO TBL_bitacora VALUES("962","0","2022-11-19 11:33:46","1","Agregar Producto","Se agrego un nuevo producto en el sistema");
INSERT INTO TBL_bitacora VALUES("963","0","2022-11-19 11:34:12","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("964","0","2022-11-19 12:29:26","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("965","1","2022-11-19 12:29:27","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("966","0","2022-11-19 12:31:31","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("967","1","2022-11-19 12:31:32","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("968","0","2022-11-19 13:58:01","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("969","1","2022-11-19 13:58:03","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("970","1","2022-11-19 13:59:55","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("971","1","2022-11-19 14:00:00","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("972","1","2022-11-19 14:00:16","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("973","1","2022-11-19 14:00:58","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("974","0","2022-11-19 14:03:51","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("975","1","2022-11-19 14:03:52","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("976","1","2022-11-19 14:05:19","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("977","0","2022-11-19 15:40:06","6","Inicio de sesion","El usuario MARIOS entró al sistema");
INSERT INTO TBL_bitacora VALUES("978","1","2022-11-19 15:40:07","6","Cambio de vista","El usuario MARIOS entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("979","1","2022-11-19 16:29:09","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("980","2","2022-11-19 16:30:03","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("981","2","2022-11-19 16:32:58","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("982","0","2022-11-19 16:39:05","1","Producto Eliminado","El usuario ADMIN Elimino un producto del sistema");
INSERT INTO TBL_bitacora VALUES("983","1","2022-11-19 16:39:19","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("984","0","2022-11-19 17:04:38","6","Inicio de sesion","El usuario MARIOS entró al sistema");
INSERT INTO TBL_bitacora VALUES("985","1","2022-11-19 17:04:39","6","Cambio de vista","El usuario MARIOS entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("986","0","2022-11-19 17:59:33","6","Inicio de sesion","El usuario MARIOS entró al sistema");
INSERT INTO TBL_bitacora VALUES("987","1","2022-11-19 17:59:34","6","Cambio de vista","El usuario MARIOS entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("988","0","2022-11-19 18:28:23","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("989","1","2022-11-19 18:28:23","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("990","2","2022-11-19 18:33:05","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("991","0","2022-11-19 18:42:21","6","Inicio de sesion","El usuario MARIOS entró al sistema");
INSERT INTO TBL_bitacora VALUES("992","1","2022-11-19 18:42:22","6","Cambio de vista","El usuario MARIOS entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("993","2","2022-11-19 18:42:33","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("994","2","2022-11-19 19:15:10","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("995","2","2022-11-19 19:23:15","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("996","2","2022-11-19 19:23:56","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("997","2","2022-11-19 19:38:22","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("998","2","2022-11-19 19:39:19","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("999","2","2022-11-19 19:40:31","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1000","2","2022-11-19 19:54:18","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1001","2","2022-11-19 19:57:46","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1002","2","2022-11-19 20:09:28","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1003","2","2022-11-19 20:09:49","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1004","1","2022-11-19 20:35:44","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1005","2","2022-11-19 20:47:08","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1006","2","2022-11-19 20:49:27","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1007","0","2022-11-19 20:53:53","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("1008","1","2022-11-19 20:53:54","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1009","3","2022-11-19 20:55:45","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1010","1","2022-11-19 20:55:51","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1011","0","2022-11-19 21:05:36","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("1012","1","2022-11-19 21:05:37","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1013","2","2022-11-19 21:07:33","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1014","2","2022-11-19 21:12:28","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1015","1","2022-11-19 21:12:59","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1016","2","2022-11-19 21:13:09","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1017","2","2022-11-19 21:13:53","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1018","3","2022-11-19 21:15:02","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1019","4","2022-11-19 21:15:13","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("1020","3","2022-11-19 21:15:23","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1021","4","2022-11-19 21:15:26","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("1022","4","2022-11-19 21:15:37","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("1023","3","2022-11-19 21:15:45","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1024","0","2022-11-19 21:16:30","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("1025","3","2022-11-19 21:16:41","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1026","6","2022-11-19 21:18:12","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("1027","7","2022-11-19 21:26:09","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1028","8","2022-11-19 21:26:12","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Roles");
INSERT INTO TBL_bitacora VALUES("1029","11","2022-11-19 21:26:14","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("1030","0","2022-11-19 21:32:46","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("1031","0","2022-11-19 21:32:54","6","Inicio de sesion","El usuario MARIOS entró al sistema");
INSERT INTO TBL_bitacora VALUES("1032","1","2022-11-19 21:32:54","6","Cambio de vista","El usuario MARIOS entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1033","0","2022-11-19 21:42:14","6","Inicio de sesion","El usuario MARIOS entró al sistema");
INSERT INTO TBL_bitacora VALUES("1034","1","2022-11-19 21:42:16","6","Cambio de vista","El usuario MARIOS entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1035","2","2022-11-19 21:43:29","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1036","2","2022-11-19 21:52:05","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1037","2","2022-11-19 21:52:18","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1038","2","2022-11-19 21:52:27","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1039","0","2022-11-19 09:52:51","1","Creación de Proveedor","El usuario ADMIN creó un nuevo proveedor en el sistema");
INSERT INTO TBL_bitacora VALUES("1040","2","2022-11-19 21:52:56","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1041","0","2022-11-19 09:53:10","1","Modificación de proveedor","El usuario ADMIN actualizó un proveedor en el sistema");
INSERT INTO TBL_bitacora VALUES("1042","2","2022-11-19 21:53:23","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1043","0","2022-11-19 21:53:32","1","Proveedor eliminado","El usuario ADMIN eliminó un proveedor del sistema");
INSERT INTO TBL_bitacora VALUES("1044","2","2022-11-19 21:53:35","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1045","1","2022-11-19 22:22:59","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1046","2","2022-11-19 22:23:15","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1047","2","2022-11-19 22:23:19","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1048","3","2022-11-19 22:23:50","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1049","4","2022-11-19 22:24:02","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("1050","6","2022-11-19 22:51:55","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("1051","2","2022-11-19 22:53:08","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1052","2","2022-11-19 22:53:19","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1053","2","2022-11-19 22:54:12","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1054","2","2022-11-19 22:54:24","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1055","0","2022-11-19 22:57:34","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("1056","1","2022-11-19 22:57:35","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1057","0","2022-11-19 22:57:46","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("1058","0","2022-11-19 22:57:55","6","Inicio de sesion","El usuario MARIOS entró al sistema");
INSERT INTO TBL_bitacora VALUES("1059","1","2022-11-19 22:57:55","6","Cambio de vista","El usuario MARIOS entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1060","2","2022-11-19 22:58:56","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1061","2","2022-11-19 22:59:03","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1062","2","2022-11-19 23:08:49","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1063","0","2022-11-19 23:18:56","6","Cierre de sesión","El usuario MARIOS salió del sistema");
INSERT INTO TBL_bitacora VALUES("1064","0","2022-11-19 23:19:12","6","Inicio de sesion","El usuario MARIOS entró al sistema");
INSERT INTO TBL_bitacora VALUES("1065","1","2022-11-19 23:19:12","6","Cambio de vista","El usuario MARIOS entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1066","0","2022-11-19 23:23:56","6","Cierre de sesión","El usuario MARIOS salió del sistema");
INSERT INTO TBL_bitacora VALUES("1067","0","2022-11-19 23:24:08","6","Inicio de sesion","El usuario MARIOS entró al sistema");
INSERT INTO TBL_bitacora VALUES("1068","1","2022-11-19 23:24:09","6","Cambio de vista","El usuario MARIOS entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1069","0","2022-11-19 23:26:57","6","Inicio de sesion","El usuario JUAN entró al sistema");
INSERT INTO TBL_bitacora VALUES("1070","1","2022-11-19 23:26:57","6","Cambio de vista","El usuario JUAN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1071","0","2022-11-19 23:28:38","6","Inicio de sesion","El usuario JUAN entró al sistema");
INSERT INTO TBL_bitacora VALUES("1072","1","2022-11-19 23:28:38","6","Cambio de vista","El usuario JUAN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1073","0","2022-11-19 23:30:47","6","Cierre de sesión","El usuario JUAN salió del sistema");
INSERT INTO TBL_bitacora VALUES("1074","0","2022-11-19 23:31:02","6","Inicio de sesion","El usuario JUAN entró al sistema");
INSERT INTO TBL_bitacora VALUES("1075","1","2022-11-19 23:31:02","6","Cambio de vista","El usuario JUAN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1076","0","2022-11-19 23:34:14","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("1077","1","2022-11-19 23:34:15","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1078","0","2022-11-19 23:52:01","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1079","0","2022-11-19 23:53:34","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1080","0","2022-11-20 00:03:31","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1081","0","2022-11-20 00:04:58","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1082","0","2022-11-20 00:26:45","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1083","0","2022-11-20 00:28:15","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1084","0","2022-11-20 00:31:58","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1085","0","2022-11-20 00:34:52","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1086","0","2022-11-20 00:46:32","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1087","0","2022-11-20 00:47:11","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1088","0","2022-11-20 01:20:35","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1089","0","2022-11-20 01:20:53","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1090","0","2022-11-20 01:30:24","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1091","0","2022-11-20 01:31:25","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1092","0","2022-11-20 01:32:22","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1093","0","2022-11-20 01:32:45","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1094","0","2022-11-20 01:33:52","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1095","0","2022-11-20 01:35:11","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1096","0","2022-11-20 09:54:41","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("1097","1","2022-11-20 09:54:42","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1098","3","2022-11-20 11:10:45","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1099","0","2022-11-20 11:11:03","1","Creación de Insumo","El usuario ADMIN creó un nuevo insumo en el sistema");
INSERT INTO TBL_bitacora VALUES("1100","3","2022-11-20 11:11:05","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1101","0","2022-11-20 11:12:41","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("1102","1","2022-11-20 11:12:42","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1103","3","2022-11-20 11:14:45","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1104","3","2022-11-20 11:16:18","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1105","0","2022-11-20 11:24:56","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1106","0","2022-11-20 12:01:44","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("1107","1","2022-11-20 12:01:45","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1108","6","2022-11-20 12:47:06","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("1109","1","2022-11-20 12:55:17","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1110","0","2022-11-20 12:56:19","1","Producto Eliminado","El usuario ADMIN Elimino un producto del sistema");
INSERT INTO TBL_bitacora VALUES("1111","0","2022-11-20 01:07:01","1","Agregar Producto","Se agrego un nuevo producto en el sistema");
INSERT INTO TBL_bitacora VALUES("1112","0","2022-11-20 13:07:13","1","Producto Eliminado","El usuario ADMIN Elimino un producto del sistema");
INSERT INTO TBL_bitacora VALUES("1113","0","2022-11-20 01:09:17","1","Agregar Producto","Se agrego un nuevo producto en el sistema");
INSERT INTO TBL_bitacora VALUES("1114","1","2022-11-20 13:12:59","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1115","1","2022-11-20 13:14:57","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1116","0","2022-11-20 13:18:12","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1117","0","2022-11-20 13:22:30","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1118","0","2022-11-20 13:23:30","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1119","0","2022-11-20 13:23:45","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1120","0","2022-11-20 13:25:21","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1121","0","2022-11-20 13:25:44","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1122","0","2022-11-20 13:26:52","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1123","1","2022-11-20 13:27:52","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1124","3","2022-11-20 13:28:02","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1125","4","2022-11-20 13:28:07","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("1126","0","2022-11-20 13:44:59","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("1127","0","2022-11-20 13:45:11","6","Inicio de sesion","El usuario JUAN entró al sistema");
INSERT INTO TBL_bitacora VALUES("1128","1","2022-11-20 13:45:12","6","Cambio de vista","El usuario JUAN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1129","1","2022-11-20 13:45:20","6","Cambio de vista","El usuario JUAN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1130","1","2022-11-20 13:45:31","6","Cambio de vista","El usuario JUAN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1131","0","2022-11-20 13:45:36","6","Cierre de sesión","El usuario JUAN salió del sistema");
INSERT INTO TBL_bitacora VALUES("1132","0","2022-11-20 13:45:48","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("1133","1","2022-11-20 13:45:48","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1134","7","2022-11-20 13:45:57","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1135","0","2022-11-20 13:46:23","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("1136","6","2022-11-20 14:21:30","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("1137","0","2022-11-20 15:38:34","1","Cambio de vista","El usuario ADMIN entró a la vista Recetario");
INSERT INTO TBL_bitacora VALUES("1138","0","2022-11-20 15:39:57","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("1139","0","2022-11-20 15:52:23","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("1140","1","2022-11-20 15:52:24","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1141","1","2022-11-20 15:58:58","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1142","1","2022-11-20 15:59:01","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1143","1","2022-11-20 15:59:04","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1144","1","2022-11-20 15:59:08","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1145","1","2022-11-20 15:59:10","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1146","1","2022-11-20 15:59:13","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1147","1","2022-11-20 15:59:15","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1148","1","2022-11-20 15:59:18","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1149","1","2022-11-20 16:13:46","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1150","2","2022-11-20 16:14:20","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1151","0","2022-11-20 16:58:42","1","Producto Eliminado","El usuario ADMIN Elimino un producto del sistema");
INSERT INTO TBL_bitacora VALUES("1152","0","2022-11-20 05:04:27","1","Agregar Producto","Se agrego un nuevo producto en el sistema");
INSERT INTO TBL_bitacora VALUES("1153","0","2022-11-20 05:05:35","1","Agregar Producto","Se agrego un nuevo producto en el sistema");
INSERT INTO TBL_bitacora VALUES("1154","0","2022-11-20 17:05:53","1","Producto Eliminado","El usuario ADMIN Elimino un producto del sistema");
INSERT INTO TBL_bitacora VALUES("1155","1","2022-11-20 17:12:45","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1156","0","2022-11-20 17:13:37","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("1157","0","2022-11-20 17:13:50","6","Inicio de sesion","El usuario JUAN entró al sistema");
INSERT INTO TBL_bitacora VALUES("1158","1","2022-11-20 17:13:51","6","Cambio de vista","El usuario JUAN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1159","1","2022-11-20 17:13:59","6","Cambio de vista","El usuario JUAN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1160","0","2022-11-20 17:14:13","6","Cierre de sesión","El usuario JUAN salió del sistema");
INSERT INTO TBL_bitacora VALUES("1161","0","2022-11-20 17:14:24","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("1162","1","2022-11-20 17:14:25","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1163","6","2022-11-20 17:14:34","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("1164","0","2022-11-20 17:42:19","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1165","4","2022-11-20 17:42:34","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("1166","4","2022-11-20 17:42:52","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("1167","0","2022-11-20 20:20:21","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("1168","1","2022-11-20 20:20:22","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1169","1","2022-11-20 20:35:23","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1170","1","2022-11-20 20:46:13","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1171","0","2022-11-20 08:46:17","1","Agregar Producto","Se agrego un nuevo producto en el sistema");
INSERT INTO TBL_bitacora VALUES("1172","0","2022-11-20 20:46:50","1","Producto Eliminado","El usuario ADMIN Elimino un producto del sistema");
INSERT INTO TBL_bitacora VALUES("1173","2","2022-11-20 21:02:54","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");



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
  CONSTRAINT `FK_TBL_compras_TBL_estado_compras` FOREIGN KEY (`id_estado_compra`) REFERENCES `TBL_estado_compras` (`id_estado_compra`),
  CONSTRAINT `FK_TBL_compras_TBL_Proveedores` FOREIGN KEY (`id_proveedor`) REFERENCES `TBL_Proveedores` (`id_Proveedores`),
  CONSTRAINT `FK_TBL_compras_TBL_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `TBL_usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_compras VALUES("1","1","1","1","2022-11-17","24.00");
INSERT INTO TBL_compras VALUES("2","2","1","2","2022-11-17","369.00");
INSERT INTO TBL_compras VALUES("3","2","1","2","2022-11-17","649.00");
INSERT INTO TBL_compras VALUES("4","1","1","1","2022-11-17","60.00");
INSERT INTO TBL_compras VALUES("5","6","1","1","2022-11-17","552.00");
INSERT INTO TBL_compras VALUES("6","1","1","2","2022-11-17","342.72");
INSERT INTO TBL_compras VALUES("7","1","1","2","2022-11-17","342.72");
INSERT INTO TBL_compras VALUES("8","1","1","2","2022-11-17","342.72");
INSERT INTO TBL_compras VALUES("9","1","1","2","2022-11-17","342.72");
INSERT INTO TBL_compras VALUES("10","1","1","2","2022-11-17","342.72");
INSERT INTO TBL_compras VALUES("11","1","1","2","2022-11-17","342.72");
INSERT INTO TBL_compras VALUES("12","1","1","2","2022-11-17","342.72");
INSERT INTO TBL_compras VALUES("13","1","1","2","2022-11-17","342.72");
INSERT INTO TBL_compras VALUES("14","1","1","2","2022-11-17","342.72");
INSERT INTO TBL_compras VALUES("15","1","1","2","2022-11-17","342.72");
INSERT INTO TBL_compras VALUES("16","1","1","2","2022-11-17","342.72");
INSERT INTO TBL_compras VALUES("17","1","1","2","2022-11-17","342.72");
INSERT INTO TBL_compras VALUES("18","1","1","1","","20.00");
INSERT INTO TBL_compras VALUES("19","1","1","1","","20.00");
INSERT INTO TBL_compras VALUES("20","1","1","1","","72.00");
INSERT INTO TBL_compras VALUES("21","1","1","1","","72.00");
INSERT INTO TBL_compras VALUES("22","1","1","1","","72.00");
INSERT INTO TBL_compras VALUES("23","1","1","1","","12.00");
INSERT INTO TBL_compras VALUES("24","1","1","1","2022-11-18","1.00");
INSERT INTO TBL_compras VALUES("25","1","1","1","2022-11-18","1.00");
INSERT INTO TBL_compras VALUES("26","1","1","1","2022-11-18","24.00");
INSERT INTO TBL_compras VALUES("27","1","1","1","2022-11-18","24.00");
INSERT INTO TBL_compras VALUES("28","1","1","1","2022-11-18","12.00");
INSERT INTO TBL_compras VALUES("29","1","1","1","2022-11-18","12.00");
INSERT INTO TBL_compras VALUES("30","1","1","1","2022-11-18","60.00");
INSERT INTO TBL_compras VALUES("31","1","1","1","2022-11-18","60.00");
INSERT INTO TBL_compras VALUES("32","1","1","1","2022-11-18","60.00");
INSERT INTO TBL_compras VALUES("33","1","1","1","2022-11-18","60.00");
INSERT INTO TBL_compras VALUES("34","1","1","1","2022-11-18","60.00");
INSERT INTO TBL_compras VALUES("35","1","1","1","2022-11-18","60.00");
INSERT INTO TBL_compras VALUES("36","1","1","1","2022-11-18","60.00");
INSERT INTO TBL_compras VALUES("37","1","1","1","2022-11-18","60.00");
INSERT INTO TBL_compras VALUES("38","4","1","1","2022-11-18","24.00");
INSERT INTO TBL_compras VALUES("39","4","1","1","2022-11-18","24.00");
INSERT INTO TBL_compras VALUES("40","4","1","1","2022-11-18","24.00");
INSERT INTO TBL_compras VALUES("41","4","1","1","2022-11-18","24.00");
INSERT INTO TBL_compras VALUES("42","4","1","1","2022-11-18","24.00");
INSERT INTO TBL_compras VALUES("43","4","1","1","2022-11-18","24.00");
INSERT INTO TBL_compras VALUES("44","4","1","1","2022-11-18","24.00");
INSERT INTO TBL_compras VALUES("45","4","1","1","2022-11-18","24.00");
INSERT INTO TBL_compras VALUES("46","4","1","1","2022-11-18","24.00");
INSERT INTO TBL_compras VALUES("47","4","1","1","2022-11-18","24.00");
INSERT INTO TBL_compras VALUES("48","1","1","2","2022-11-18","1440.00");
INSERT INTO TBL_compras VALUES("49","1","1","2","2022-11-18","1440.00");
INSERT INTO TBL_compras VALUES("50","1","1","2","2022-11-18","1440.00");
INSERT INTO TBL_compras VALUES("51","1","1","2","2022-11-18","1440.00");
INSERT INTO TBL_compras VALUES("52","1","1","1","2022-11-18","12.00");
INSERT INTO TBL_compras VALUES("53","1","1","1","2022-11-18","12.00");
INSERT INTO TBL_compras VALUES("54","1","1","1","2022-11-18","12.00");
INSERT INTO TBL_compras VALUES("55","1","1","1","2022-11-18","12.00");
INSERT INTO TBL_compras VALUES("56","1","1","1","2022-11-18","12.00");
INSERT INTO TBL_compras VALUES("57","1","1","1","2022-11-18","12.00");
INSERT INTO TBL_compras VALUES("58","1","1","1","2022-11-18","12.00");
INSERT INTO TBL_compras VALUES("59","1","1","1","2022-11-18","12.00");
INSERT INTO TBL_compras VALUES("60","4","1","1","2022-11-18","240.00");
INSERT INTO TBL_compras VALUES("61","4","1","1","2022-11-18","120.00");
INSERT INTO TBL_compras VALUES("62","2","6","1","2022-11-19","1037.00");
INSERT INTO TBL_compras VALUES("63","2","6","1","2022-11-19","1037.00");
INSERT INTO TBL_compras VALUES("64","1","1","2","2022-11-19","12.00");
INSERT INTO TBL_compras VALUES("65","1","1","2","2022-11-19","24.00");
INSERT INTO TBL_compras VALUES("66","1","1","2","2022-11-19","24.00");
INSERT INTO TBL_compras VALUES("67","1","1","2","2022-11-20","24.00");
INSERT INTO TBL_compras VALUES("68","1","1","2","2022-11-20","24.00");
INSERT INTO TBL_compras VALUES("69","1","1","2","2022-11-20","24.00");
INSERT INTO TBL_compras VALUES("70","1","1","2","2022-11-20","24.00");
INSERT INTO TBL_compras VALUES("71","1","1","2","2022-11-20","24.00");
INSERT INTO TBL_compras VALUES("72","1","1","2","2022-11-20","24.00");
INSERT INTO TBL_compras VALUES("73","1","1","2","2022-11-20","24.00");
INSERT INTO TBL_compras VALUES("74","1","1","2","2022-11-20","24.00");
INSERT INTO TBL_compras VALUES("75","1","1","2","2022-11-20","24.00");
INSERT INTO TBL_compras VALUES("76","1","1","2","2022-11-20","24.00");
INSERT INTO TBL_compras VALUES("77","1","1","2","2022-11-20","24.00");
INSERT INTO TBL_compras VALUES("78","1","1","2","2022-11-20","24.00");
INSERT INTO TBL_compras VALUES("79","1","1","2","2022-11-20","24.00");
INSERT INTO TBL_compras VALUES("80","1","1","2","2022-11-20","24.00");
INSERT INTO TBL_compras VALUES("81","1","1","2","2022-11-20","24.00");
INSERT INTO TBL_compras VALUES("82","1","1","2","2022-11-20","24.00");
INSERT INTO TBL_compras VALUES("83","1","1","2","2022-11-20","72.00");
INSERT INTO TBL_compras VALUES("84","4","1","1","2022-11-20","48.00");
INSERT INTO TBL_compras VALUES("85","4","1","1","2022-11-20","48.00");
INSERT INTO TBL_compras VALUES("86","4","1","1","2022-11-20","48.00");
INSERT INTO TBL_compras VALUES("87","4","1","1","2022-11-20","48.00");
INSERT INTO TBL_compras VALUES("88","4","1","1","2022-11-20","48.00");
INSERT INTO TBL_compras VALUES("89","4","1","1","2022-11-20","48.00");
INSERT INTO TBL_compras VALUES("90","1","1","1","2022-10-09","100000.00");
INSERT INTO TBL_compras VALUES("91","7","1","1","2022-11-20","1294.00");



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
  `precio_costo` decimal(10,2) DEFAULT NULL,
  `fecha_caducidad` date DEFAULT NULL,
  PRIMARY KEY (`id_detalle_compra`),
  KEY `FK_TBL_detalle_compra_TBL_compras` (`id_compra`),
  KEY `FK_TBL_detalle_compra_TBL_insumos` (`id_insumos`),
  CONSTRAINT `FK_TBL_detalle_compra_TBL_compras` FOREIGN KEY (`id_compra`) REFERENCES `TBL_compras` (`id_compra`),
  CONSTRAINT `FK_TBL_detalle_compra_TBL_insumos` FOREIGN KEY (`id_insumos`) REFERENCES `TBL_insumos` (`id_insumos`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_detalle_compra VALUES("1","1","1","12","1.00","2022-11-29");
INSERT INTO TBL_detalle_compra VALUES("2","1","1","12","5.00","2022-11-20");
INSERT INTO TBL_detalle_compra VALUES("3","1","1","12","5.00","2022-11-20");
INSERT INTO TBL_detalle_compra VALUES("4","1","1","12","5.00","2022-11-20");
INSERT INTO TBL_detalle_compra VALUES("5","1","1","12","5.00","2022-11-20");
INSERT INTO TBL_detalle_compra VALUES("6","1","1","12","5.00","2022-11-20");
INSERT INTO TBL_detalle_compra VALUES("7","1","1","12","5.00","2022-11-20");
INSERT INTO TBL_detalle_compra VALUES("8","1","1","12","5.00","2022-11-20");
INSERT INTO TBL_detalle_compra VALUES("9","1","1","12","5.00","2022-11-20");
INSERT INTO TBL_detalle_compra VALUES("10","1","1","12","2.00","2022-11-18");
INSERT INTO TBL_detalle_compra VALUES("11","1","1","12","2.00","2022-11-18");
INSERT INTO TBL_detalle_compra VALUES("12","1","1","12","2.00","2022-11-18");
INSERT INTO TBL_detalle_compra VALUES("13","1","1","12","2.00","2022-11-18");
INSERT INTO TBL_detalle_compra VALUES("14","1","1","12","2.00","2022-11-18");
INSERT INTO TBL_detalle_compra VALUES("15","1","1","12","2.00","2022-11-18");
INSERT INTO TBL_detalle_compra VALUES("16","1","1","12","2.00","2022-11-18");
INSERT INTO TBL_detalle_compra VALUES("17","1","1","12","2.00","2022-11-18");
INSERT INTO TBL_detalle_compra VALUES("18","1","1","12","2.00","2022-11-18");
INSERT INTO TBL_detalle_compra VALUES("19","1","1","12","2.00","2022-11-18");
INSERT INTO TBL_detalle_compra VALUES("22","1","1","120","12.00","2022-11-18");
INSERT INTO TBL_detalle_compra VALUES("25","1","1","12","1.00","1111-11-11");
INSERT INTO TBL_detalle_compra VALUES("26","1","1","12","1.00","1111-11-11");
INSERT INTO TBL_detalle_compra VALUES("27","1","1","12","1.00","2022-11-18");
INSERT INTO TBL_detalle_compra VALUES("28","1","1","12","1.00","1111-11-11");
INSERT INTO TBL_detalle_compra VALUES("29","1","1","12","1.00","1111-11-11");
INSERT INTO TBL_detalle_compra VALUES("30","1","1","20","12.00","2022-11-18");
INSERT INTO TBL_detalle_compra VALUES("31","1","2","10","12.00","2022-11-18");
INSERT INTO TBL_detalle_compra VALUES("32","1","1","12","2.00","2022-11-19");
INSERT INTO TBL_detalle_compra VALUES("33","1","1","12","2.00","2022-11-19");
INSERT INTO TBL_detalle_compra VALUES("34","1","1","12","2.00","2022-11-19");
INSERT INTO TBL_detalle_compra VALUES("35","1","1","12","2.00","2022-11-19");
INSERT INTO TBL_detalle_compra VALUES("36","1","1","12","2.00","2022-11-19");
INSERT INTO TBL_detalle_compra VALUES("37","1","1","12","2.00","2022-11-19");
INSERT INTO TBL_detalle_compra VALUES("38","1","1","12","2.00","2022-11-19");
INSERT INTO TBL_detalle_compra VALUES("39","1","1","12","2.00","2022-11-19");
INSERT INTO TBL_detalle_compra VALUES("40","1","1","12","2.00","2022-11-19");
INSERT INTO TBL_detalle_compra VALUES("41","1","1","12","2.00","2022-11-19");
INSERT INTO TBL_detalle_compra VALUES("42","1","1","12","2.00","2022-11-19");
INSERT INTO TBL_detalle_compra VALUES("43","1","1","12","2.00","2022-11-19");
INSERT INTO TBL_detalle_compra VALUES("44","1","1","12","2.00","2022-11-19");
INSERT INTO TBL_detalle_compra VALUES("45","1","1","12","2.00","2022-11-19");
INSERT INTO TBL_detalle_compra VALUES("46","1","1","12","2.00","2022-11-19");
INSERT INTO TBL_detalle_compra VALUES("47","1","1","12","2.00","2022-11-19");
INSERT INTO TBL_detalle_compra VALUES("48","1","1","12","2.00","2022-11-19");
INSERT INTO TBL_detalle_compra VALUES("49","1","1","12","2.00","2022-11-19");
INSERT INTO TBL_detalle_compra VALUES("50","1","1","12","1.00","2022-11-17");
INSERT INTO TBL_detalle_compra VALUES("51","1","3","12","2.00","2022-11-28");
INSERT INTO TBL_detalle_compra VALUES("52","1","2","12","3.00","2022-11-23");
INSERT INTO TBL_detalle_compra VALUES("53","1","2","12","1.00","2022-11-20");
INSERT INTO TBL_detalle_compra VALUES("54","1","2","12","3.00","2022-11-21");
INSERT INTO TBL_detalle_compra VALUES("55","1","2","12","1.00","2022-11-20");
INSERT INTO TBL_detalle_compra VALUES("56","1","2","12","3.00","2022-11-21");
INSERT INTO TBL_detalle_compra VALUES("57","2","2","12","1.00","2022-11-20");
INSERT INTO TBL_detalle_compra VALUES("58","2","2","12","3.00","2022-11-21");
INSERT INTO TBL_detalle_compra VALUES("59","2","2","12","1.00","2022-11-20");
INSERT INTO TBL_detalle_compra VALUES("60","1","2","12","3.00","2022-11-21");
INSERT INTO TBL_detalle_compra VALUES("61","1","2","12","1.00","2022-11-20");
INSERT INTO TBL_detalle_compra VALUES("62","1","2","12","3.00","2022-11-21");
INSERT INTO TBL_detalle_compra VALUES("63","1","2","12","1.00","2022-11-20");
INSERT INTO TBL_detalle_compra VALUES("64","1","2","12","3.00","2022-11-21");
INSERT INTO TBL_detalle_compra VALUES("65","90","2","12","7.00","2022-11-20");
INSERT INTO TBL_detalle_compra VALUES("66","90","2","12","8.00","2022-11-21");
INSERT INTO TBL_detalle_compra VALUES("67","90","2","12","9.00","2022-11-20");
INSERT INTO TBL_detalle_compra VALUES("68","91","1","12","12.00","2022-11-20");
INSERT INTO TBL_detalle_compra VALUES("69","91","2","10","115.00","2023-10-20");



CREATE TABLE `TBL_detalle_pedido` (
  `id_detalle_pedido` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `precio_venta` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_detalle_pedido`),
  KEY `FK_TBL_detalle_pedido_TBL_pedidos` (`id_pedido`),
  KEY `FK_TBL_detalle_pedido_TBL_producto` (`id_producto`),
  CONSTRAINT `FK_TBL_detalle_pedido_TBL_pedidos` FOREIGN KEY (`id_pedido`) REFERENCES `TBL_pedidos` (`id_pedido`),
  CONSTRAINT `FK_TBL_detalle_pedido_TBL_producto` FOREIGN KEY (`id_producto`) REFERENCES `TBL_producto` (`id_producto`)
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_insumos VALUES("1","CAFE","1","150","20","LB");
INSERT INTO TBL_insumos VALUES("2","AZUCAR","1","150","30","LB");
INSERT INTO TBL_insumos VALUES("3","VASOS","2","250","35","UN");



CREATE TABLE `TBL_inventario` (
  `id_insumo` int NOT NULL AUTO_INCREMENT,
  `cant_existencia` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_insumo`),
  CONSTRAINT `FK_TBL_inventario_TBL_insumos` FOREIGN KEY (`id_insumo`) REFERENCES `TBL_insumos` (`id_insumos`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_inventario VALUES("1","296");
INSERT INTO TBL_inventario VALUES("2","212");
INSERT INTO TBL_inventario VALUES("3","12");



CREATE TABLE `TBL_movi_inventario` (
  `id_cardex` int NOT NULL AUTO_INCREMENT,
  `id_insumos` int DEFAULT NULL,
  `cant_movimiento` int DEFAULT NULL,
  `tipo_movimiento` enum('Entrada','Salida') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fecha_movimiento` datetime DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_cardex`),
  KEY `FK_insumos_idx` (`id_insumos`),
  KEY `FK_usuario_idx` (`id_usuario`,`id_insumos`) USING BTREE,
  CONSTRAINT `FK_TBL_movi_inventario_TBL_insumos` FOREIGN KEY (`id_insumos`) REFERENCES `TBL_insumos` (`id_insumos`),
  CONSTRAINT `FK_TBL_movi_inventario_TBL_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `TBL_usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_movi_inventario VALUES("1","1","20","Entrada","2022-11-18 17:53:48","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("2","2","10","Entrada","2022-11-18 18:07:52","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("3","1","12","Entrada","2022-11-19 23:52:01","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("4","1","12","Entrada","2022-11-19 23:53:34","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("5","1","12","Entrada","2022-11-20 00:03:31","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("6","1","12","Entrada","2022-11-20 00:04:58","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("7","1","12","Entrada","2022-11-20 00:26:45","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("8","1","12","Entrada","2022-11-20 00:28:15","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("9","1","12","Entrada","2022-11-20 00:31:58","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("10","1","12","Entrada","2022-11-20 00:34:52","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("11","1","12","Entrada","2022-11-20 00:46:32","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("12","1","12","Entrada","2022-11-20 00:47:11","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("13","1","12","Entrada","2022-11-20 01:20:35","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("14","1","12","Entrada","2022-11-20 01:20:53","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("15","1","12","Entrada","2022-11-20 01:30:24","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("16","1","12","Entrada","2022-11-20 01:31:25","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("17","1","12","Entrada","2022-11-20 01:32:22","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("18","1","12","Entrada","2022-11-20 01:32:45","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("19","1","12","Entrada","2022-11-20 01:33:52","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("20","1","12","Entrada","2022-11-20 01:35:11","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("21","1","12","Entrada","2022-11-20 11:24:57","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("22","3","12","Entrada","2022-11-20 11:24:57","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("23","2","12","Entrada","2022-11-20 11:24:57","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("24","2","12","Entrada","2022-11-20 13:18:12","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("25","2","12","Entrada","2022-11-20 13:18:12","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("26","2","12","Entrada","2022-11-20 13:22:30","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("27","2","12","Entrada","2022-11-20 13:22:30","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("28","2","12","Entrada","2022-11-20 13:23:30","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("29","2","12","Entrada","2022-11-20 13:23:30","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("30","2","12","Entrada","2022-11-20 13:23:45","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("31","2","12","Entrada","2022-11-20 13:23:45","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("32","2","12","Entrada","2022-11-20 13:25:21","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("33","2","12","Entrada","2022-11-20 13:25:21","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("34","2","12","Entrada","2022-11-20 13:25:45","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("35","2","12","Entrada","2022-11-20 13:25:45","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("36","2","12","Entrada","2022-11-20 13:26:52","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("37","2","12","Entrada","2022-11-20 13:26:52","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("38","2","12","Entrada","2022-11-20 15:49:33","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("39","1","12","Entrada","2022-11-20 17:42:19","1","entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("40","2","10","Entrada","2022-11-20 17:42:19","1","entrada de insumos");



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
  KEY `KF_pedido_pedi_desc_idx` (`id_pedidos`),
  CONSTRAINT `FK_TBL_pedido_descuentos_TBL_descuentos` FOREIGN KEY (`id_descuentos`) REFERENCES `TBL_descuentos` (`id_descuentos`),
  CONSTRAINT `FK_TBL_pedido_descuentos_TBL_pedidos` FOREIGN KEY (`id_pedidos`) REFERENCES `TBL_pedidos` (`id_pedido`)
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
  CONSTRAINT `FK_TBL_pedidos_TBL_Clientes` FOREIGN KEY (`id_cliente`) REFERENCES `TBL_Clientes` (`id_clientes`),
  CONSTRAINT `FK_TBL_pedidos_TBL_forma_pago` FOREIGN KEY (`id_forma_pago`) REFERENCES `TBL_forma_pago` (`id_forma_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `TBL_pedidos_promociones` (
  `id_pedido_promocion` int NOT NULL AUTO_INCREMENT,
  `id_promocion` int DEFAULT NULL,
  `id_pedido` int DEFAULT NULL,
  `precio_venta` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id_pedido_promocion`),
  KEY `FK_promo_idx` (`id_promocion`),
  KEY `FK_pedido_idx` (`id_pedido`),
  CONSTRAINT `FK_TBL_pedidos_promociones_TBL_pedidos` FOREIGN KEY (`id_pedido`) REFERENCES `TBL_pedidos` (`id_pedido`),
  CONSTRAINT `FK_TBL_pedidos_promociones_TBL_promociones` FOREIGN KEY (`id_promocion`) REFERENCES `TBL_promociones` (`id_promociones`)
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
  CONSTRAINT `FK_TBL_permisos_TBL_objetos` FOREIGN KEY (`id_objeto`) REFERENCES `TBL_objetos` (`id_objeto`)
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
  `des_produ` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `precio_produ` decimal(10,2) DEFAULT NULL,
  `foto_produ` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'CAMBIAR A FORMATO DE FOTO',
  PRIMARY KEY (`id_producto`),
  KEY `FK_idproducto_tippro_idx` (`id_tipo_produ`),
  CONSTRAINT `FK_TBL_producto_TBL_tipo_producto` FOREIGN KEY (`id_tipo_produ`) REFERENCES `TBL_tipo_producto` (`id_tipo_produ`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_producto VALUES("3","AAAAAA","1","ASDADAS","12.00","../productos_img/c-postedin-image-47429.webp");



CREATE TABLE `TBL_promociones` (
  `id_promociones` int NOT NULL AUTO_INCREMENT,
  `nom_promocion` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fech_ini_promo` date DEFAULT NULL,
  `fech_fin_promo` date DEFAULT NULL,
  `id_estado_promocio` int DEFAULT NULL,
  `precio_promocion` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`id_promociones`),
  KEY `FK_promocion_estado_idx` (`id_estado_promocio`),
  CONSTRAINT `FK_TBL_promociones_TBL_estado_promociones` FOREIGN KEY (`id_estado_promocio`) REFERENCES `TBL_estado_promociones` (`id_estado_promociones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `TBL_promociones_productos` (
  `id_promociones_productos` int NOT NULL AUTO_INCREMENT,
  `id_promociones` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `cantidad` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `precio_venta` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id_promociones_productos`),
  KEY `id_promociones` (`id_promociones`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `FK_TBL_promociones_productos_TBL_producto` FOREIGN KEY (`id_producto`) REFERENCES `TBL_producto` (`id_producto`),
  CONSTRAINT `FK_TBL_promociones_productos_TBL_promociones` FOREIGN KEY (`id_promociones`) REFERENCES `TBL_promociones` (`id_promociones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `TBL_recetario` (
  `id_recetario` int NOT NULL AUTO_INCREMENT,
  `id_producto` int DEFAULT NULL,
  `id_insumo` int DEFAULT NULL,
  `cant_insumo` int DEFAULT NULL,
  PRIMARY KEY (`id_recetario`) USING BTREE,
  KEY `FK_produ_recetario_idx` (`id_producto`) USING BTREE,
  KEY `FK_insumo_recetario_idx` (`id_insumo`) USING BTREE,
  CONSTRAINT `FK_TBL_recetario_TBL_insumos` FOREIGN KEY (`id_insumo`) REFERENCES `TBL_insumos` (`id_insumos`),
  CONSTRAINT `FK_TBL_recetario_TBL_producto` FOREIGN KEY (`id_producto`) REFERENCES `TBL_producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




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
  PRIMARY KEY (`id_tipo_produ`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_tipo_producto VALUES("1","BEBIDA","12 ONZ","A");



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
INSERT INTO TBL_usuarios VALUES("6","JUAN","JUAN TORRES","Activo","$2y$12$QNkHwxDoFPz4M903VAHcGO7xQ0JxiEsFrQR5aSmbrtkfRe0g53oz6","2","","","1","2023-11-07","juan3@gmail.com","ADMIN","2022-11-08 19:38:27","MARIOS","2022-11-12 17:41:09");
INSERT INTO TBL_usuarios VALUES("7","nuevo","prueba","Activo","$2y$12$eGEOPtCxe2A0Uf7rSRNoiu2il.85SaT0y4eJheaCQxChMELNAnAbK","2","","","1","2023-11-07","roman@gmial.com","ADMIN","2022-11-08 19:38:37","ADMIN","2022-11-12 17:41:09");


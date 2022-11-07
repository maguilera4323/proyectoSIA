

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_Proveedores VALUES("1","SULA","84098328438482482","22201345","sula@gmail.com","Tegucigalpa M.D.C");
INSERT INTO TBL_Proveedores VALUES("2","JOSE MARTINEZ","0982001112223","97238991","josem@gmail.com","Res.Las Uvas");
INSERT INTO TBL_Proveedores VALUES("4","CAFE MAYA","840983284384","99944499","cafemaya@gmail.com","Tegucigalpa M.D.C");



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
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_bitacora VALUES("1","0","2022-10-28 13:39:20","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("2","0","2022-10-28 13:39:21","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("3","0","2022-10-28 13:39:24","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("4","0","2022-10-28 13:42:40","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("5","0","2022-10-28 13:42:40","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("6","0","2022-10-28 13:42:45","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("7","0","2022-10-28 13:42:54","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("8","0","2022-10-28 13:44:35","1","Creación de usuario","El usuario ADMIN creó un nuevo usuario en el sistema");
INSERT INTO TBL_bitacora VALUES("9","0","2022-10-28 13:44:40","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("10","0","2022-10-28 13:45:01","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("11","0","2022-10-28 13:49:22","2","Inicio de sesion","El usuario SHOTGUNWILLY entró al sistema");
INSERT INTO TBL_bitacora VALUES("12","0","2022-10-28 13:49:22","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("13","0","2022-10-28 13:49:29","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("14","0","2022-10-28 13:53:11","2","Cierre de sesión","El usuario SHOTGUNWILLY salió del sistema");
INSERT INTO TBL_bitacora VALUES("15","0","2022-10-28 16:03:54","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("16","0","2022-10-28 16:03:54","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("17","0","2022-10-28 16:06:09","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("18","0","2022-10-28 16:06:18","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("19","0","2022-10-28 16:06:32","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("20","0","2022-10-28 16:07:49","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("21","0","2022-10-28 16:07:58","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("22","0","2022-10-28 16:08:24","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("23","0","2022-10-28 16:09:04","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("24","0","2022-10-28 16:38:05","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("25","0","2022-10-28 16:38:05","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("26","0","2022-10-28 16:38:27","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("27","0","2022-10-28 16:38:41","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("28","0","2022-10-28 16:38:42","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("29","0","2022-10-28 16:38:53","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("30","0","2022-10-28 16:39:00","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("31","0","2022-10-28 16:40:55","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("32","0","2022-10-28 16:40:58","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("33","0","2022-10-28 16:41:57","1","Usuario inactivado","El usuario ADMIN inactivó un usuario del sistema");
INSERT INTO TBL_bitacora VALUES("34","0","2022-10-28 16:42:03","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("35","0","2022-10-28 16:42:57","1","Modificación de usuario","El usuario ADMIN actualizó un usuario del sistema");
INSERT INTO TBL_bitacora VALUES("36","0","2022-10-28 16:43:03","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("37","0","2022-10-28 16:48:34","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("38","0","2022-10-29 22:05:44","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("39","0","2022-10-29 22:05:45","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("40","0","2022-10-29 22:07:47","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("41","0","2022-10-29 22:08:05","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("42","0","2022-10-29 22:08:59","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("43","0","2022-10-29 22:10:53","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("44","0","2022-10-29 22:11:22","1","Usuario inactivado","El usuario ADMIN inactivó un usuario del sistema");
INSERT INTO TBL_bitacora VALUES("45","0","2022-10-29 22:11:28","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("46","0","2022-10-29 22:26:03","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("47","0","2022-10-29 22:26:03","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("48","0","2022-10-29 22:26:07","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("49","0","2022-10-29 22:27:53","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("50","0","2022-10-29 22:27:53","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("51","0","2022-10-29 22:27:56","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("52","0","2022-10-29 22:28:12","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("53","0","2022-10-29 22:47:38","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("54","0","2022-10-29 22:47:39","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("55","0","2022-10-29 22:48:11","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("56","0","2022-10-29 22:48:32","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("57","0","2022-10-29 22:48:42","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("58","0","2022-10-29 22:49:54","1","Creación de usuario","El usuario ADMIN creó un nuevo usuario en el sistema");
INSERT INTO TBL_bitacora VALUES("59","0","2022-10-29 22:50:22","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("60","0","2022-10-29 22:51:41","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("61","0","2022-10-29 22:54:43","4","Inicio de sesion","El usuario HOSTING entró al sistema");
INSERT INTO TBL_bitacora VALUES("62","0","2022-10-29 22:54:43","4","Cambio de vista","El usuario HOSTING entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("63","0","2022-10-29 22:55:23","4","Cierre de sesión","El usuario HOSTING salió del sistema");
INSERT INTO TBL_bitacora VALUES("64","0","2022-10-30 00:50:04","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("65","0","2022-10-30 00:50:05","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("66","0","2022-10-30 00:50:07","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("67","0","2022-10-30 00:50:24","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("68","0","2022-10-30 00:54:24","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("69","0","2022-10-30 00:54:28","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("70","0","2022-10-30 01:00:08","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("71","0","2022-10-30 01:19:01","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("72","0","2022-10-30 01:23:29","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("73","0","2022-10-30 01:26:00","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("74","0","2022-10-30 01:27:17","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("75","0","2022-10-30 01:27:19","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("76","0","2022-10-30 01:28:24","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("77","0","2022-10-30 18:14:38","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("78","0","2022-10-30 18:14:38","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("79","0","2022-10-30 18:15:01","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("80","0","2022-10-30 18:22:13","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("81","0","2022-10-30 18:22:45","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("82","0","2022-10-30 18:23:13","1","Usuario inactivado","El usuario ADMIN inactivó un usuario del sistema");
INSERT INTO TBL_bitacora VALUES("83","0","2022-10-30 18:23:15","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("84","0","2022-10-30 18:23:45","1","Modificación de usuario","El usuario ADMIN actualizó un usuario del sistema");
INSERT INTO TBL_bitacora VALUES("85","0","2022-10-30 18:23:49","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("86","0","2022-10-30 18:27:00","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("87","0","2022-10-30 20:06:07","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("88","0","2022-10-30 20:06:08","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("89","0","2022-10-30 20:07:21","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("90","0","2022-10-30 20:07:24","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("91","0","2022-10-30 20:07:26","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("92","0","2022-10-30 20:07:29","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("93","0","2022-10-30 20:07:31","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("94","0","2022-10-30 20:07:34","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("95","0","2022-10-30 20:07:36","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("96","0","2022-10-30 20:07:39","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("97","0","2022-10-30 08:36:43","","Creación de Proveedor","Se creó un nuevo proveedor en el sistema");
INSERT INTO TBL_bitacora VALUES("98","0","2022-10-30 08:37:17","","Creación de Proveedor","Se creó un nuevo proveedor en el sistema");
INSERT INTO TBL_bitacora VALUES("99","0","2022-10-30 09:04:06","","Modificación de proveedor","Se actualizó un proveedor en el sistema");
INSERT INTO TBL_bitacora VALUES("100","0","2022-10-30 21:33:38","1","Usuario inactivado","El usuario ADMIN inactivó un usuario del sistema");
INSERT INTO TBL_bitacora VALUES("101","0","2022-10-30 21:38:39","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("102","0","2022-10-30 21:53:15","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("103","0","2022-10-30 21:53:15","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("104","0","2022-10-30 21:53:19","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("105","0","2022-10-30 21:53:29","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("106","0","2022-10-30 21:58:48","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("107","0","2022-10-30 22:33:26","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("108","0","2022-10-30 22:33:30","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("109","0","2022-10-30 23:04:00","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("110","0","2022-10-30 23:04:57","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("111","0","2022-10-30 23:05:38","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("112","0","2022-10-30 23:06:13","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("113","0","2022-10-30 23:07:58","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("114","0","2022-10-30 23:08:57","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("115","0","2022-10-30 23:09:08","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("116","0","2022-10-30 23:09:12","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("117","0","2022-10-30 23:09:31","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("118","0","2022-10-30 23:10:09","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("119","0","2022-10-30 23:10:43","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("120","0","2022-10-30 23:12:30","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("121","0","2022-10-30 23:12:55","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("122","0","2022-10-30 23:13:21","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("123","0","2022-10-30 23:13:47","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("124","0","2022-10-30 23:14:48","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("125","0","2022-10-30 23:16:27","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("126","0","2022-10-30 23:19:54","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("127","0","2022-10-30 23:21:29","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("128","0","2022-10-30 23:21:46","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("129","0","2022-10-30 23:22:03","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("130","0","2022-10-30 23:32:49","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("131","0","2022-10-30 23:34:14","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("132","0","2022-10-31 00:41:17","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("133","0","2022-10-31 00:41:18","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("134","0","2022-10-31 01:01:06","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("135","0","2022-10-31 20:35:52","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("136","0","2022-10-31 20:35:53","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("137","0","2022-10-31 20:52:37","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("138","0","2022-10-31 20:52:59","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("139","0","2022-10-31 20:53:00","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("140","0","2022-10-31 20:53:11","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("141","0","2022-10-31 20:53:16","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("142","0","2022-11-01 19:49:28","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("143","0","2022-11-01 19:49:29","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("144","0","2022-11-01 20:19:40","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("145","0","2022-11-01 20:19:43","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("146","0","2022-11-02 11:50:43","2","Inicio de sesion","El usuario SHOTGUNWILLY entró al sistema");
INSERT INTO TBL_bitacora VALUES("147","0","2022-11-02 11:50:44","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("148","0","2022-11-02 11:51:10","2","Usuario inactivado","El usuario SHOTGUNWILLY inactivó un usuario del sistema");
INSERT INTO TBL_bitacora VALUES("149","0","2022-11-02 11:51:18","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("150","0","2022-11-02 11:51:24","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("151","0","2022-11-02 11:52:47","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("152","0","2022-11-02 11:53:12","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("153","0","2022-11-02 11:54:21","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("154","0","2022-11-02 11:55:07","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("155","0","2022-11-02 11:55:09","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("156","0","2022-11-02 11:57:25","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("157","0","2022-11-02 11:57:53","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("158","0","2022-11-02 14:45:35","2","Inicio de sesion","El usuario SHOTGUNWILLY entró al sistema");
INSERT INTO TBL_bitacora VALUES("159","0","2022-11-02 14:45:36","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("160","0","2022-11-02 14:45:49","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("161","0","2022-11-02 14:46:02","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("162","0","2022-11-02 14:51:37","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("163","0","2022-11-02 14:51:37","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("164","0","2022-11-02 14:51:44","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("165","0","2022-11-02 14:52:05","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("166","0","2022-11-02 14:52:18","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("167","0","2022-11-02 14:53:20","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("168","0","2022-11-02 14:54:37","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("169","0","2022-11-02 14:54:51","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("170","0","2022-11-02 15:47:41","","Creación de Insumo","Se creó un nuevo insumo en el sistema");
INSERT INTO TBL_bitacora VALUES("171","0","2022-11-02 15:47:44","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("172","0","2022-11-02 15:49:36","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("173","0","2022-11-02 16:10:24","","Creación de Insumo","Se creó un nuevo insumo en el sistema");
INSERT INTO TBL_bitacora VALUES("174","0","2022-11-02 16:10:28","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("175","0","2022-11-02 16:11:55","","Modificación de insumo","Se actualizó un insumo en el sistema");
INSERT INTO TBL_bitacora VALUES("176","0","2022-11-02 16:11:58","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("177","0","2022-11-02 16:12:07","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("178","0","2022-11-02 16:12:32","","Modificación de insumo","Se actualizó un insumo en el sistema");
INSERT INTO TBL_bitacora VALUES("179","0","2022-11-02 16:12:49","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("180","0","2022-11-02 16:18:43","","Modificación de insumo","Se actualizó un insumo en el sistema");
INSERT INTO TBL_bitacora VALUES("181","0","2022-11-02 16:18:47","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("182","0","2022-11-02 16:31:48","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("183","0","2022-11-02 16:32:47","2","Insumo eliminado","El usuario SHOTGUNWILLY eliminó un insumo del sistema");
INSERT INTO TBL_bitacora VALUES("184","0","2022-11-02 16:32:51","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("185","0","2022-11-02 17:29:22","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("186","0","2022-11-02 17:29:36","2","Cierre de sesión","El usuario SHOTGUNWILLY salió del sistema");
INSERT INTO TBL_bitacora VALUES("187","0","2022-11-02 17:29:47","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("188","0","2022-11-02 17:29:48","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("189","0","2022-11-02 17:32:00","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("190","0","2022-11-02 17:32:34","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("191","0","2022-11-02 17:33:01","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("192","0","2022-11-02 17:33:39","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("193","0","2022-11-02 17:33:44","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("194","0","2022-11-02 17:45:52","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("195","0","2022-11-02 17:52:16","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("196","0","2022-11-02 17:52:34","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("197","0","2022-11-02 17:52:58","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("198","0","2022-11-02 17:53:35","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("199","0","2022-11-02 17:56:57","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("200","0","2022-11-02 17:57:17","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("201","0","2022-11-02 17:57:40","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("202","0","2022-11-02 17:58:54","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("203","0","2022-11-02 18:00:47","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("204","0","2022-11-02 18:01:11","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("205","0","2022-11-02 18:02:04","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("206","0","2022-11-02 18:03:51","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("207","0","2022-11-02 18:04:01","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("208","0","2022-11-02 18:04:16","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("209","0","2022-11-02 18:13:09","1","Cambio de vista","El usuario ADMIN entró a la vista de Inventario");
INSERT INTO TBL_bitacora VALUES("210","0","2022-11-02 18:13:53","1","Cambio de vista","El usuario ADMIN entró a la vista de Inventario");
INSERT INTO TBL_bitacora VALUES("211","0","2022-11-02 18:13:57","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("212","0","2022-11-02 18:14:27","1","Cambio de vista","El usuario ADMIN entró a la vista de Inventario");
INSERT INTO TBL_bitacora VALUES("213","0","2022-11-02 18:18:25","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("214","0","2022-11-02 18:18:40","1","Cambio de vista","El usuario ADMIN entró a la vista de Inventario");
INSERT INTO TBL_bitacora VALUES("215","0","2022-11-02 18:25:08","1","Cambio de vista","El usuario ADMIN entró a la vista de Inventario");
INSERT INTO TBL_bitacora VALUES("216","0","2022-11-02 18:25:28","1","Cambio de vista","El usuario ADMIN entró a la vista de Inventario");
INSERT INTO TBL_bitacora VALUES("217","0","2022-11-02 18:25:43","1","Cambio de vista","El usuario ADMIN entró a la vista de Inventario");
INSERT INTO TBL_bitacora VALUES("218","0","2022-11-02 18:26:08","1","Cambio de vista","El usuario ADMIN entró a la vista de Inventario");
INSERT INTO TBL_bitacora VALUES("219","0","2022-11-02 18:26:50","1","Cambio de vista","El usuario ADMIN entró a la vista de Inventario");
INSERT INTO TBL_bitacora VALUES("220","0","2022-11-02 19:00:08","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("221","0","2022-11-02 19:11:39","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("222","0","2022-11-02 19:11:39","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("223","0","2022-11-02 19:11:43","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("224","0","2022-11-02 19:11:44","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("225","0","2022-11-02 19:12:10","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("226","0","2022-11-02 19:12:45","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("227","0","2022-11-02 19:12:55","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("228","0","2022-11-02 19:13:22","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("229","0","2022-11-02 19:13:27","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("230","0","2022-11-02 19:13:33","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("231","0","2022-11-02 19:16:40","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("232","0","2022-11-02 19:16:56","1","Cambio de vista","El usuario ADMIN entró a la vista de Inventario");
INSERT INTO TBL_bitacora VALUES("233","0","2022-11-02 19:20:29","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("234","0","2022-11-02 19:20:41","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("235","0","2022-11-02 19:20:50","1","Cambio de vista","El usuario ADMIN entró a la vista de Inventario");
INSERT INTO TBL_bitacora VALUES("236","0","2022-11-02 19:21:21","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("237","0","2022-11-02 19:22:24","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("238","0","2022-11-02 19:22:43","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("239","0","2022-11-02 19:28:12","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("240","0","2022-11-02 19:28:47","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("241","0","2022-11-02 19:30:16","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("242","0","2022-11-02 19:30:57","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("243","0","2022-11-02 22:24:41","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("244","0","2022-11-02 22:24:41","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("245","0","2022-11-02 22:24:45","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("246","0","2022-11-02 22:25:30","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("247","0","2022-11-02 22:35:18","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("248","0","2022-11-02 22:47:11","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("249","0","2022-11-02 22:47:47","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("250","0","2022-11-02 22:50:06","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("251","0","2022-11-02 22:50:07","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("252","0","2022-11-02 22:50:16","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("253","0","2022-11-02 22:50:23","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("254","0","2022-11-02 22:51:46","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("255","0","2022-11-02 22:52:26","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("256","0","2022-11-02 23:37:47","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("257","0","2022-11-02 23:37:48","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("258","0","2022-11-02 23:59:34","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("259","0","2022-11-03 00:24:06","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("260","0","2022-11-03 00:24:13","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("261","0","2022-11-03 00:24:15","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("262","0","2022-11-03 00:25:42","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("263","0","2022-11-03 00:25:52","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("264","0","2022-11-03 14:23:15","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("265","0","2022-11-03 14:23:16","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("266","0","2022-11-03 14:23:21","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("267","0","2022-11-03 14:23:52","2","Inicio de sesion","El usuario SHOTGUNWILLY entró al sistema");
INSERT INTO TBL_bitacora VALUES("268","0","2022-11-03 14:23:53","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("269","0","2022-11-03 14:30:59","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("270","0","2022-11-03 14:31:50","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("271","0","2022-11-03 14:31:56","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("272","0","2022-11-03 14:35:34","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("273","0","2022-11-03 15:02:32","2","Cierre de sesión","El usuario SHOTGUNWILLY salió del sistema");
INSERT INTO TBL_bitacora VALUES("274","0","2022-11-03 15:02:39","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("275","0","2022-11-03 15:02:40","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("276","0","2022-11-03 15:03:45","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("277","0","2022-11-03 15:04:43","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("278","0","2022-11-03 15:05:00","1","Modificación de usuario","El usuario ADMIN actualizó un usuario del sistema");
INSERT INTO TBL_bitacora VALUES("279","0","2022-11-03 15:05:03","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("280","0","2022-11-03 15:05:21","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("281","0","2022-11-03 15:05:48","2","Inicio de sesion","El usuario SHOTGUNWILLY entró al sistema");
INSERT INTO TBL_bitacora VALUES("282","0","2022-11-03 15:05:49","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("283","0","2022-11-03 15:12:56","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("284","0","2022-11-03 15:13:07","2","Cierre de sesión","El usuario SHOTGUNWILLY salió del sistema");
INSERT INTO TBL_bitacora VALUES("285","0","2022-11-03 15:13:15","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("286","0","2022-11-03 15:13:16","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("287","0","2022-11-03 15:13:22","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("288","0","2022-11-03 15:13:40","1","Modificación de usuario","El usuario ADMIN actualizó un usuario del sistema");
INSERT INTO TBL_bitacora VALUES("289","0","2022-11-03 15:13:44","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("290","0","2022-11-03 15:14:32","1","Modificación de usuario","El usuario ADMIN actualizó un usuario del sistema");
INSERT INTO TBL_bitacora VALUES("291","0","2022-11-03 15:14:36","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("292","0","2022-11-03 15:14:42","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("293","0","2022-11-03 15:15:37","2","Inicio de sesion","El usuario SHOTGUNWILLY entró al sistema");
INSERT INTO TBL_bitacora VALUES("294","0","2022-11-03 15:15:38","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("295","0","2022-11-03 15:16:08","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("296","0","2022-11-03 15:16:13","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("297","0","2022-11-03 15:19:13","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("298","0","2022-11-03 15:20:13","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("299","0","2022-11-03 15:20:35","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista de Inventario");
INSERT INTO TBL_bitacora VALUES("300","0","2022-11-03 15:22:33","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("301","0","2022-11-03 15:24:28","2","Cierre de sesión","El usuario SHOTGUNWILLY salió del sistema");
INSERT INTO TBL_bitacora VALUES("302","0","2022-11-03 20:43:10","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("303","0","2022-11-03 20:43:10","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("304","0","2022-11-03 21:58:48","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("305","0","2022-11-03 21:58:50","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("306","0","2022-11-03 22:05:51","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("307","0","2022-11-03 22:11:50","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("308","0","2022-11-03 22:15:38","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("309","0","2022-11-03 22:16:00","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("310","0","2022-11-03 22:16:38","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("311","0","2022-11-03 22:16:44","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("312","0","2022-11-03 22:18:33","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("313","0","2022-11-03 22:18:41","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("314","0","2022-11-03 22:19:10","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("315","0","2022-11-03 22:19:17","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("316","0","2022-11-03 22:19:33","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("317","0","2022-11-03 22:19:51","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("318","0","2022-11-03 22:21:38","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("319","0","2022-11-03 22:22:10","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("320","0","2022-11-03 22:22:22","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("321","0","2022-11-03 22:22:47","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("322","0","2022-11-03 22:22:57","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("323","0","2022-11-03 22:23:43","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("324","0","2022-11-03 22:24:00","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("325","0","2022-11-03 22:24:19","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("326","0","2022-11-03 22:24:58","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("327","0","2022-11-03 22:25:25","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("328","0","2022-11-03 22:27:52","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("329","0","2022-11-03 22:28:02","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("330","0","2022-11-03 22:35:59","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("331","0","2022-11-03 22:36:29","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("332","0","2022-11-04 00:13:38","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("333","0","2022-11-04 00:13:38","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("334","0","2022-11-04 00:22:46","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("335","0","2022-11-04 00:28:35","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("336","0","2022-11-04 00:29:20","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("337","0","2022-11-04 00:35:25","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("338","0","2022-11-04 00:35:37","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("339","0","2022-11-04 00:35:51","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("340","0","2022-11-04 00:36:18","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("341","0","2022-11-04 00:52:40","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("342","0","2022-11-04 18:47:42","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("343","0","2022-11-04 18:47:43","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("344","0","2022-11-04 18:48:16","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("345","0","2022-11-04 18:48:48","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("346","0","2022-11-04 18:50:07","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("347","0","2022-11-04 18:51:03","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("348","0","2022-11-04 18:55:08","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("349","0","2022-11-04 18:55:16","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("350","0","2022-11-04 18:55:20","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("351","0","2022-11-04 18:56:08","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("352","0","2022-11-04 18:56:25","1","Modificación de usuario","El usuario ADMIN actualizó un usuario del sistema");
INSERT INTO TBL_bitacora VALUES("353","0","2022-11-04 18:56:29","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("354","0","2022-11-04 18:56:35","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("355","0","2022-11-04 18:57:04","2","Inicio de sesion","El usuario SHOTGUNWILLY entró al sistema");
INSERT INTO TBL_bitacora VALUES("356","0","2022-11-04 18:57:05","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("357","0","2022-11-04 18:57:20","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("358","0","2022-11-04 19:06:19","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("359","0","2022-11-04 19:07:59","2","Cambio de vista","El usuario SHOTGUNWILLY entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("360","0","2022-11-04 19:25:55","2","Cierre de sesión","El usuario SHOTGUNWILLY salió del sistema");
INSERT INTO TBL_bitacora VALUES("361","0","2022-11-04 19:26:05","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("362","0","2022-11-04 19:26:06","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("363","0","2022-11-04 19:26:37","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("364","0","2022-11-04 22:53:15","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("365","0","2022-11-04 22:53:16","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("366","0","2022-11-04 22:54:24","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("367","0","2022-11-04 22:55:03","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("368","0","2022-11-04 22:55:03","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("369","0","2022-11-04 22:57:27","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("370","0","2022-11-04 23:22:17","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("371","0","2022-11-04 23:22:24","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("372","0","2022-11-04 23:22:28","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("373","0","2022-11-04 23:22:54","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("374","0","2022-11-05 01:16:54","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("375","0","2022-11-05 01:21:51","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("376","0","2022-11-05 01:21:52","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("377","0","2022-11-05 01:22:16","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("378","0","2022-11-05 01:24:43","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("379","0","2022-11-05 01:24:43","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("380","0","2022-11-05 01:24:50","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("381","0","2022-11-05 01:26:19","1","Usuario inactivado","El usuario ADMIN inactivó un usuario del sistema");
INSERT INTO TBL_bitacora VALUES("382","0","2022-11-05 01:26:21","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("383","0","2022-11-05 01:26:46","1","Usuario inactivado","El usuario ADMIN inactivó un usuario del sistema");
INSERT INTO TBL_bitacora VALUES("384","0","2022-11-05 01:26:52","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("385","0","2022-11-05 01:27:25","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("386","0","2022-11-05 01:27:42","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("387","0","2022-11-05 01:29:22","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("388","0","2022-11-05 01:30:34","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("389","0","2022-11-05 01:59:52","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("390","0","2022-11-05 01:59:54","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("391","0","2022-11-05 02:10:41","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("392","0","2022-11-05 11:34:03","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("393","0","2022-11-05 11:34:03","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("394","0","2022-11-05 11:34:26","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("395","0","2022-11-05 11:38:21","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("396","0","2022-11-05 11:39:07","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("397","0","2022-11-05 11:45:48","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("398","0","2022-11-05 11:45:56","1","Cambio de vista","El usuario ADMIN entró a la vista de Inventario Disponible");
INSERT INTO TBL_bitacora VALUES("399","0","2022-11-05 11:48:37","1","Cambio de vista","El usuario ADMIN entró a la vista de Inventario Disponible");
INSERT INTO TBL_bitacora VALUES("400","0","2022-11-05 11:48:59","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("401","0","2022-11-05 12:32:53","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("402","0","2022-11-05 13:00:39","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("403","0","2022-11-05 13:00:40","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("404","0","2022-11-05 13:01:00","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("405","0","2022-11-05 13:01:39","1","Cambio de vista","El usuario ADMIN entró a la vista de Inventario Disponible");
INSERT INTO TBL_bitacora VALUES("406","0","2022-11-05 13:01:42","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("407","0","2022-11-05 13:02:41","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("408","0","2022-11-05 13:03:13","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("409","0","2022-11-05 13:03:29","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("410","0","2022-11-05 13:05:13","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("411","0","2022-11-05 13:09:23","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("412","0","2022-11-05 13:42:11","1","Creación de Objeto","Se creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("413","0","2022-11-05 13:43:13","1","Creación de Objeto","Se creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("414","0","2022-11-05 14:22:52","1","Modificación de objeto","Se actualizó un objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("415","0","2022-11-05 14:25:20","1","Modificación de objeto","Se actualizó un objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("416","0","2022-11-05 14:26:05","1","Modificación de objeto","Se actualizó un objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("417","0","2022-11-05 14:30:57","1","Objeto eliminado","El usuario ADMIN eliminó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("418","0","2022-11-05 14:31:05","1","Objeto eliminado","El usuario ADMIN eliminó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("419","0","2022-11-05 14:31:12","1","Objeto eliminado","El usuario ADMIN eliminó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("420","0","2022-11-05 15:44:57","1","Creación de Rol","El usuario ADMIN creó un nuevo rol en el sistema");
INSERT INTO TBL_bitacora VALUES("421","0","2022-11-05 15:45:39","1","Creación de Rol","El usuario ADMIN creó un nuevo rol en el sistema");
INSERT INTO TBL_bitacora VALUES("422","0","2022-11-05 15:46:26","1","Creación de Rol","El usuario ADMIN creó un nuevo rol en el sistema");
INSERT INTO TBL_bitacora VALUES("423","0","2022-11-05 15:47:48","1","Creación de Rol","El usuario ADMIN creó un nuevo rol en el sistema");
INSERT INTO TBL_bitacora VALUES("424","0","2022-11-05 16:51:36","1","Rol eliminado","El usuario ADMIN eliminó un rol del sistema");
INSERT INTO TBL_bitacora VALUES("425","0","2022-11-05 16:51:46","1","Rol eliminado","El usuario ADMIN eliminó un rol del sistema");
INSERT INTO TBL_bitacora VALUES("426","0","2022-11-05 16:51:55","1","Rol eliminado","El usuario ADMIN eliminó un rol del sistema");
INSERT INTO TBL_bitacora VALUES("427","0","2022-11-05 17:28:42","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("428","0","2022-11-05 17:29:17","1","Modificación de objeto","El usuario ADMIN actualizó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("429","0","2022-11-05 17:57:13","1","Modificación de rol","El usuario ADMIN actualizó un rol del sistema");
INSERT INTO TBL_bitacora VALUES("430","0","2022-11-05 17:57:49","1","Modificación de rol","El usuario ADMIN actualizó un rol del sistema");
INSERT INTO TBL_bitacora VALUES("431","0","2022-11-05 17:58:15","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("432","0","2022-11-05 18:00:10","1","Rol eliminado","El usuario ADMIN eliminó un rol del sistema");
INSERT INTO TBL_bitacora VALUES("433","0","2022-11-05 18:00:22","1","Modificación de rol","El usuario ADMIN actualizó un rol del sistema");
INSERT INTO TBL_bitacora VALUES("434","0","2022-11-05 18:17:02","1","Modificación de rol","El usuario ADMIN actualizó un rol del sistema");
INSERT INTO TBL_bitacora VALUES("435","0","2022-11-05 18:23:04","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("436","0","2022-11-05 18:33:24","1","Modificación de objeto","El usuario ADMIN actualizó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("437","0","2022-11-05 18:33:38","1","Modificación de objeto","El usuario ADMIN actualizó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("438","0","2022-11-05 18:36:32","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("439","0","2022-11-05 18:36:42","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("440","0","2022-11-05 18:36:47","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("441","0","2022-11-05 18:36:51","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("442","0","2022-11-05 18:36:56","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("443","0","2022-11-05 18:37:52","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("444","0","2022-11-05 18:37:55","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("445","0","2022-11-05 18:40:52","1","Objeto eliminado","El usuario ADMIN eliminó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("446","0","2022-11-05 18:40:59","1","Objeto eliminado","El usuario ADMIN eliminó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("447","0","2022-11-05 18:43:17","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("448","0","2022-11-05 18:43:41","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("449","0","2022-11-05 18:44:14","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("450","0","2022-11-05 18:46:55","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("451","0","2022-11-05 18:52:00","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("452","0","2022-11-05 18:56:22","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("453","0","2022-11-05 18:59:27","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("454","0","2022-11-05 18:59:45","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("455","0","2022-11-05 19:31:11","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("456","0","2022-11-05 19:31:13","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("457","0","2022-11-05 19:31:40","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("458","0","2022-11-05 19:35:35","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("459","0","2022-11-05 19:48:23","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("460","0","2022-11-05 19:48:38","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("461","0","2022-11-05 21:19:15","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("462","0","2022-11-05 21:19:18","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("463","0","2022-11-05 21:19:38","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("464","0","2022-11-05 21:19:47","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("465","0","2022-11-05 21:20:12","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("466","0","2022-11-05 21:20:27","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("467","0","2022-11-05 21:20:43","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("468","0","2022-11-05 21:22:30","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("469","0","2022-11-05 21:36:05","1","Creación de Insumo","El usuario ADMIN creó un nuevo insumo en el sistema");
INSERT INTO TBL_bitacora VALUES("470","0","2022-11-05 21:36:37","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("471","0","2022-11-05 21:36:52","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("472","0","2022-11-05 21:37:36","1","Modificación de insumo","El usuario ADMIN actualizó un insumo en el sistema");
INSERT INTO TBL_bitacora VALUES("473","0","2022-11-05 21:37:39","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("474","0","2022-11-05 21:38:49","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("475","0","2022-11-05 23:25:15","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("476","0","2022-11-05 23:25:15","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("477","0","2022-11-05 23:38:51","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("478","0","2022-11-05 23:51:16","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("479","0","2022-11-05 23:51:27","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("480","0","2022-11-05 23:51:28","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("481","0","2022-11-05 23:51:35","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("482","0","2022-11-06 00:00:10","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("483","0","2022-11-06 00:05:50","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("484","0","2022-11-06 00:06:05","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("485","0","2022-11-06 00:06:52","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("486","0","2022-11-06 00:12:27","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("487","0","2022-11-06 00:17:52","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("488","0","2022-11-06 00:22:29","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("489","0","2022-11-06 00:23:18","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("490","0","2022-11-06 00:23:22","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("491","0","2022-11-06 00:26:37","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("492","0","2022-11-06 00:26:53","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("493","0","2022-11-06 00:27:01","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("494","0","2022-11-06 00:27:13","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("495","0","2022-11-06 01:15:49","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("496","0","2022-11-06 01:15:56","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("497","0","2022-11-06 01:29:21","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("498","0","2022-11-06 01:57:41","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("499","0","2022-11-06 02:02:51","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("500","0","2022-11-06 02:02:52","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");



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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `TBL_descuentos` (
  `id_descuentos` int NOT NULL,
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




CREATE TABLE `TBL_detalle_pedido` (
  `id_detalle_pedido` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `precio_venta` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id_detalle_pedido`),
  KEY `FK_produ_detapedido_idx` (`id_producto`),
  KEY `FK_TBL_detalle_pedido_TBL_pedidos` (`id_pedido`),
  CONSTRAINT `FK_produ_detapedido` FOREIGN KEY (`id_producto`) REFERENCES `TBL_producto` (`id_producto`),
  CONSTRAINT `FK_TBL_detalle_pedido_TBL_pedidos` FOREIGN KEY (`id_pedido`) REFERENCES `TBL_pedidos` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `TBL_estado_compras` (
  `id_estado_compra` int NOT NULL,
  `nom_estado_compra` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `TBL_estado_pedido` (
  `id_estado_pedido` int NOT NULL,
  `estado_pedido` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'aqui se colocara si el pedido ya fue facturado o si fue anulado',
  PRIMARY KEY (`id_estado_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `TBL_estado_promociones` (
  `id_estado_promociones` int NOT NULL,
  `nom_estado_promociones` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado_promociones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `TBL_forma_pago` (
  `id_forma_pago` int NOT NULL,
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
  `parametro` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `valor` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `id_usuario` int NOT NULL,
  `creado_por` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `modificado_por` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_parametro`),
  KEY `FK_TBL_ms_parametros_TBL_usuarios` (`id_usuario`),
  CONSTRAINT `FK_TBL_ms_parametros_TBL_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `TBL_usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO TBL_ms_parametros VALUES("1","ADMIN_INTENTOS_INVALIDOS","2","1","ADMIN","2022-10-10 17:58:32","","");
INSERT INTO TBL_ms_parametros VALUES("2","MIN_CONTRASENA","5","1","ADMIN","2022-10-10 18:00:33","","");
INSERT INTO TBL_ms_parametros VALUES("3","MAX_CONTRASENA","10","1","ADMIN","2022-10-10 18:00:48","","");
INSERT INTO TBL_ms_parametros VALUES("4","ADMIN_DIAS_VIGENCIA","360","1","ADMIN","2022-10-16 17:22:18","","");
INSERT INTO TBL_ms_parametros VALUES("5","HORASVIGENCIA_CODIGO_CORREO","24","1","ADMIN","2022-10-20 02:24:24","","");
INSERT INTO TBL_ms_parametros VALUES("6","PREGUNTAS_A_CONTESTAR","3","1","ADMIN","2022-10-25 22:01:25","","");



CREATE TABLE `TBL_ms_preguntas_usuario` (
  `id_pregunta` int NOT NULL,
  `id_usuario` int NOT NULL,
  `respuesta` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `creado_por` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `modificado_por` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  KEY `FK_TBL_ms_preguntas_usuario_TBL_preguntas` (`id_pregunta`),
  KEY `FK_TBL_ms_preguntas_usuario_TBL_usuarios` (`id_usuario`),
  CONSTRAINT `FK_TBL_ms_preguntas_usuario_TBL_preguntas` FOREIGN KEY (`id_pregunta`) REFERENCES `TBL_preguntas` (`id_pregunta`),
  CONSTRAINT `FK_TBL_ms_preguntas_usuario_TBL_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `TBL_usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO TBL_ms_preguntas_usuario VALUES("1","1","futbol","ADMIN","2022-10-28","","");
INSERT INTO TBL_ms_preguntas_usuario VALUES("6","1","molinoos de viento","ADMIN","2022-10-28","","");
INSERT INTO TBL_ms_preguntas_usuario VALUES("3","1","tegucigalpa","ADMIN","2022-10-28","","");
INSERT INTO TBL_ms_preguntas_usuario VALUES("1","2","tenis","","","","");
INSERT INTO TBL_ms_preguntas_usuario VALUES("4","2","espaguetis","","","","");
INSERT INTO TBL_ms_preguntas_usuario VALUES("6","2","Stay with me","","","","");
INSERT INTO TBL_ms_preguntas_usuario VALUES("1","3","Futbol Soccer","","","","");
INSERT INTO TBL_ms_preguntas_usuario VALUES("2","3","Matimba","","","","");
INSERT INTO TBL_ms_preguntas_usuario VALUES("3","3","Tegucigalpa","","","","");
INSERT INTO TBL_ms_preguntas_usuario VALUES("1","4","informatica","","","","");
INSERT INTO TBL_ms_preguntas_usuario VALUES("2","4","informatica","","","","");
INSERT INTO TBL_ms_preguntas_usuario VALUES("3","4","informatica","","","","");
INSERT INTO TBL_ms_preguntas_usuario VALUES("1","5","FUTBOL","","","","");
INSERT INTO TBL_ms_preguntas_usuario VALUES("3","5","EL HOSPITAL","","","","");
INSERT INTO TBL_ms_preguntas_usuario VALUES("4","5","LA QUE ME REGALEN","","","","");



CREATE TABLE `TBL_ms_roles` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `rol` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `descripcion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `creado_por` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `modificado_por` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_ms_roles VALUES("1","Admin Sistema","Administrador encargado de gestion","ADMIN","2022-09-25 00:00:00","","");
INSERT INTO TBL_ms_roles VALUES("2","Admin Inv.","Administrador del inventario de la empresa","ADMIN","2022-10-20 00:00:00","","");
INSERT INTO TBL_ms_roles VALUES("3","Vendedor","Encargado de ventas de la empresa","ADMIN","2022-10-20 00:00:00","","");
INSERT INTO TBL_ms_roles VALUES("4","DEFAULT","Sin permisos de acceso al sistema","ADMIN","2022-09-25 00:00:00","ADMIN","2022-11-05 18:17:01");



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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `TBL_pedido_descuentos` (
  `id_descuentos` int NOT NULL,
  `id_pedidos` int NOT NULL,
  `total_descontado` decimal(6,2) DEFAULT NULL,
  KEY `FK_descu_idx` (`id_descuentos`),
  KEY `KF_pedido_pedi_desc_idx` (`id_pedidos`),
  CONSTRAINT `FK_descu` FOREIGN KEY (`id_descuentos`) REFERENCES `TBL_descuentos` (`id_descuentos`),
  CONSTRAINT `KF_pedido_pedi_desc` FOREIGN KEY (`id_pedidos`) REFERENCES `TBL_pedidos` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `TBL_pedidos` (
  `id_pedido` int NOT NULL,
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
  CONSTRAINT `FK_estado_pedido` FOREIGN KEY (`id_estado_pedido`) REFERENCES `TBL_estado_pedido` (`id_estado_pedido`),
  CONSTRAINT `FK_pago_pedido` FOREIGN KEY (`id_forma_pago`) REFERENCES `TBL_forma_pago` (`id_forma_pago`),
  CONSTRAINT `FK_TBL_pedidos_TBL_Clientes` FOREIGN KEY (`id_cliente`) REFERENCES `TBL_Clientes` (`id_clientes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `TBL_pedidos_promociones` (
  `id_pedido_promocion` int NOT NULL AUTO_INCREMENT,
  `id_promocion` int DEFAULT NULL,
  `id_pedido` int DEFAULT NULL,
  `precio_venta` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id_pedido_promocion`),
  KEY `FK_promo_idx` (`id_promocion`),
  KEY `FK_pedido_idx` (`id_pedido`),
  CONSTRAINT `FK_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `TBL_pedidos` (`id_pedido`),
  CONSTRAINT `FK_promo` FOREIGN KEY (`id_promocion`) REFERENCES `TBL_promociones` (`id_promociones`)
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
  CONSTRAINT `TBL_permisos_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `TBL_ms_roles` (`id_rol`),
  CONSTRAINT `TBL_permisos_ibfk_2` FOREIGN KEY (`id_objeto`) REFERENCES `TBL_objetos` (`id_objeto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `TBL_preguntas` (
  `id_pregunta` int NOT NULL AUTO_INCREMENT,
  `pregunta` varchar(50) NOT NULL,
  `creado_por` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `modificado_por` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_pregunta`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_preguntas VALUES("1","Cual es su deporte favorito?","SAOTOME","2022-09-21 00:00:00","SAOTOME","2022-09-21 00:00:00");
INSERT INTO TBL_preguntas VALUES("2","Nombre de su mascota","SAOTOME","2022-09-23 00:00:00","SAOTOME","2022-09-23 00:00:00");
INSERT INTO TBL_preguntas VALUES("3","Lugar de nacimiento","SAOTOME","2022-09-23 00:00:00","SAOTOME","2022-09-23 00:00:00");
INSERT INTO TBL_preguntas VALUES("4","Comida favorita","SAOTOME","2022-09-23 00:00:00","SAOTOME","2022-09-23 00:00:00");
INSERT INTO TBL_preguntas VALUES("5","Nombre de su primer hijo(a)?","SAOTOME","2022-09-21 00:00:00","SAOTOME","2022-09-21 00:00:00");
INSERT INTO TBL_preguntas VALUES("6","Canción favorita?","SAOTOME","2022-10-25 00:00:00","","");



CREATE TABLE `TBL_producto` (
  `id_producto` int NOT NULL,
  `nom_producto` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_tipo_produ` int DEFAULT NULL,
  `des_produ` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `precio_produ` decimal(5,2) DEFAULT NULL,
  `foto_produ` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'CAMBIAR A FORMATO DE FOTO',
  PRIMARY KEY (`id_producto`),
  KEY `FK_idproducto_tippro_idx` (`id_tipo_produ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_producto VALUES("13","cafe","1","no tiene","25.00","no");



CREATE TABLE `TBL_promociones` (
  `id_promociones` int NOT NULL,
  `nom_promocion` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fech_ini_promo` date DEFAULT NULL,
  `fech_fin_promo` date DEFAULT NULL,
  `id_estado_promocio` int DEFAULT NULL,
  `precio_promocion` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`id_promociones`),
  KEY `FK_promocion_estado_idx` (`id_estado_promocio`),
  CONSTRAINT `FK_promocion_estado` FOREIGN KEY (`id_estado_promocio`) REFERENCES `TBL_estado_promociones` (`id_estado_promociones`)
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
  CONSTRAINT `TBL_promociones_productos_ibfk_1` FOREIGN KEY (`id_promociones`) REFERENCES `TBL_promociones` (`id_promociones`),
  CONSTRAINT `TBL_promociones_productos_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `TBL_producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `TBL_recetario` (
  `id_recetario` int NOT NULL AUTO_INCREMENT,
  `id_producto` int DEFAULT NULL,
  `id_insumo` int DEFAULT NULL,
  `cant_insumo` int DEFAULT NULL,
  PRIMARY KEY (`id_recetario`),
  KEY `FK_produ_recetario_idx` (`id_producto`),
  KEY `FK_insumo_recetario_idx` (`id_insumo`),
  CONSTRAINT `FK_produ_recetario` FOREIGN KEY (`id_producto`) REFERENCES `TBL_producto` (`id_producto`),
  CONSTRAINT `FK_TBL_recetario_TBL_insumos` FOREIGN KEY (`id_insumo`) REFERENCES `TBL_insumos` (`id_insumos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `TBL_restablece_clave_email` (
  `id_restablecer` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `codigo` int DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_restablecer`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO TBL_restablece_clave_email VALUES("1","tankianrichann@gmail.com","3700","2022-10-21 16:48:28");
INSERT INTO TBL_restablece_clave_email VALUES("2","tankianrichann@gmail.com","4483","2022-10-21 18:01:31");
INSERT INTO TBL_restablece_clave_email VALUES("3","tankianrichann@gmail.com","1089","2022-10-23 13:38:37");
INSERT INTO TBL_restablece_clave_email VALUES("4","tankianrichann@gmail.com","1257","2022-10-23 13:48:08");
INSERT INTO TBL_restablece_clave_email VALUES("5","tankianrichann@gmail.com","2173","2022-10-23 13:51:28");
INSERT INTO TBL_restablece_clave_email VALUES("6","tankianrichann@gmail.com","8790","2022-10-23 13:53:20");
INSERT INTO TBL_restablece_clave_email VALUES("7","tankianrichann@gmail.com","1460","2022-10-24 20:30:58");
INSERT INTO TBL_restablece_clave_email VALUES("8","tankianrichann@gmail.com","8802","2022-10-25 20:50:17");
INSERT INTO TBL_restablece_clave_email VALUES("9","tankianrichann@gmail.com","1930","2022-10-25 20:52:35");
INSERT INTO TBL_restablece_clave_email VALUES("10","tankianrichann@gmail.com","6958","2022-10-25 20:57:33");
INSERT INTO TBL_restablece_clave_email VALUES("11","admincitycoffee@gmail.com","8251","2022-10-25 21:00:12");
INSERT INTO TBL_restablece_clave_email VALUES("12","karimhernandez233@gmail.com","4418","2022-10-27 12:52:15");
INSERT INTO TBL_restablece_clave_email VALUES("13","karimhernandez233@gmail.com","2196","2022-10-27 12:54:33");



CREATE TABLE `TBL_talonario_cai` (
  `id_talonario_cai` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `num_cai` int NOT NULL,
  `rango_inicial` int NOT NULL,
  `rango_final` int NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `obs_cai` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_talonario_cai`),
  KEY `FK_TBL_talonario_cai_TBL_usuarios` (`id_usuario`),
  CONSTRAINT `FK_TBL_talonario_cai_TBL_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `TBL_usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




CREATE TABLE `TBL_tipo_producto` (
  `id_tipo_produ` int NOT NULL COMMENT 'Entidad encargada de la clasificación de los productos, así como de la presentación o tamaño de estos',
  `tipo_producto` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'este se refiere a los productoq ue vende la empresa. ejemplo cafe o granita',
  `tamaño_producto` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `clasificacion_producto` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'verificar si se puede colocar como enum\npara elegir la categoria',
  PRIMARY KEY (`id_tipo_produ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `TBL_usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `nombre_usuario` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `estado_usuario` enum('Activo','Inactivo','Bloqueado','Nuevo') COLLATE utf8mb4_general_ci NOT NULL,
  `contrasena` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_rol` int NOT NULL,
  `fecha_ultima_conexion` date DEFAULT NULL,
  `preguntas_contestadas` int DEFAULT NULL,
  `primer_ingreso` int DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `correo_electronico` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `creado_por` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `modificado_por` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO TBL_usuarios VALUES("1","ADMIN","ADMINISTRADOR","Activo","$2y$12$d9ZLQGv4lBE4Lcv2atFD2ODwdR7jwqQh3uXhTJ0jFeRWVucd6YXrG","1","","","1","2023-10-28","admincitycoffee@gmail.com","ADMIN","2022-10-28 13:38:52","","");
INSERT INTO TBL_usuarios VALUES("2","SHOTGUNWILLY","WILLY WILLIAMS","Activo","$2y$12$gtY1cHpDA8sAhSkyEIvSneltY24/vPgD05hoC2Hsq2yFQ1d1/aSPK","2","","","1","2023-10-23","tankianrichann@gmail.com","ADMIN","2022-10-28 13:44:33","ADMIN","2022-11-04 18:56:25");
INSERT INTO TBL_usuarios VALUES("3","MURATA","hola","Activo","$2y$12$hgeVdWSdDtLCtxY7Zi3.pebzljQS.QDr4OfceGCE8.JHxOjrpq3X6","1","","","1","2023-10-23","jeymyortiz4@gmail.com","MURATA","2022-10-28 15:42:28","ADMIN","2022-11-03 15:14:31");
INSERT INTO TBL_usuarios VALUES("4","HOSTING","PRUEBA HOSTIN","Activo","$2y$12$cgAHManx3scV.jJoQuI9IO1KDe90g8.rIJ6AdHjqRT4gYI7LJWLEW","1","","","1","2023-10-24","hronaldjosue@hotmail.com","ADMIN","2022-10-29 22:49:53","ADMIN","2022-10-30 18:23:44");
INSERT INTO TBL_usuarios VALUES("5","DATABASE","DATA","Inactivo","$2y$12$IuVi6L490mKMYvgxyXXLuu0mUXl8vCLCPKwFPNKbzw0u28qtnUxzq","4","","","1","2023-10-31","hronaldjosue@gmail.com","DATABASE","2022-11-05 01:19:14","","");


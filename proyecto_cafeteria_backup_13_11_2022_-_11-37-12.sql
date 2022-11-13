

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
) ENGINE=InnoDB AUTO_INCREMENT=1165 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_bitacora VALUES("501","0","2022-11-06 20:22:11","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("502","0","2022-11-06 20:22:11","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("503","0","2022-11-06 20:22:40","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("504","0","2022-11-06 20:23:05","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("505","0","2022-11-06 20:23:13","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("506","0","2022-11-06 20:23:14","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("507","0","2022-11-06 20:26:13","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("508","0","2022-11-06 20:26:14","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("509","0","2022-11-06 20:26:48","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("510","0","2022-11-06 20:28:00","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("511","0","2022-11-06 20:28:00","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("512","0","2022-11-06 20:34:45","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("513","0","2022-11-06 20:35:06","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("514","0","2022-11-06 20:37:01","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("515","0","2022-11-06 20:37:09","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("516","0","2022-11-06 20:37:14","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("517","0","2022-11-06 20:37:20","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("518","0","2022-11-06 20:39:03","1","Creación de Rol","El usuario ADMIN creó un nuevo rol en el sistema");
INSERT INTO TBL_bitacora VALUES("519","0","2022-11-06 20:39:05","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("520","0","2022-11-06 20:40:13","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("521","0","2022-11-06 20:40:28","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("522","0","2022-11-06 20:53:28","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("523","0","2022-11-06 20:58:50","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("524","0","2022-11-06 20:58:57","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("525","0","2022-11-06 21:00:59","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("526","0","2022-11-06 21:00:59","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("527","0","2022-11-06 21:03:51","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("528","0","2022-11-06 21:04:12","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("529","0","2022-11-06 21:04:19","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("530","0","2022-11-06 23:39:07","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("531","0","2022-11-06 23:42:52","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("532","0","2022-11-06 23:42:53","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("533","0","2022-11-07 00:36:27","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("534","0","2022-11-07 00:53:51","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("535","0","2022-11-07 00:53:54","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("536","0","2022-11-07 15:27:16","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("537","0","2022-11-07 15:27:17","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("538","0","2022-11-07 15:27:29","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("539","0","2022-11-07 15:28:13","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("540","0","2022-11-07 15:49:56","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("541","0","2022-11-07 15:50:01","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("542","0","2022-11-07 15:50:36","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("543","0","2022-11-07 15:50:47","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("544","0","2022-11-07 15:51:27","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("545","0","2022-11-07 15:51:29","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("546","0","2022-11-07 15:51:31","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("547","0","2022-11-07 15:51:37","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("548","0","2022-11-07 15:51:43","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("549","0","2022-11-07 15:53:01","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("550","0","2022-11-07 15:53:03","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("551","0","2022-11-07 15:53:06","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("552","0","2022-11-07 15:54:00","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("553","0","2022-11-07 16:00:56","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("554","0","2022-11-07 16:02:50","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("555","0","2022-11-07 16:02:52","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("556","0","2022-11-07 16:03:46","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("557","0","2022-11-07 16:07:43","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("558","0","2022-11-07 16:07:51","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("559","0","2022-11-07 16:18:38","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("560","0","2022-11-07 16:19:34","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("561","0","2022-11-07 16:20:21","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("562","0","2022-11-07 16:20:49","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("563","0","2022-11-07 17:15:45","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("564","0","2022-11-07 17:15:46","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("565","0","2022-11-07 17:15:55","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("566","0","2022-11-07 17:23:43","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("567","0","2022-11-07 17:24:33","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("568","0","2022-11-07 17:25:21","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("569","0","2022-11-07 17:26:02","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("570","0","2022-11-07 17:26:41","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("571","0","2022-11-07 17:27:44","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("572","0","2022-11-07 17:28:14","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("573","0","2022-11-07 17:30:54","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("574","0","2022-11-07 17:31:36","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("575","0","2022-11-07 17:36:12","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("576","0","2022-11-07 17:38:17","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("577","0","2022-11-07 18:03:40","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("578","0","2022-11-07 18:04:50","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("579","0","2022-11-07 18:08:59","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("580","0","2022-11-07 18:09:01","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("581","0","2022-11-07 18:09:27","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("582","0","2022-11-07 18:12:06","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("583","0","2022-11-07 18:14:53","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("584","0","2022-11-07 18:14:58","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("585","0","2022-11-07 18:18:47","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("586","0","2022-11-07 18:49:32","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("587","0","2022-11-07 18:49:34","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("588","0","2022-11-07 18:50:34","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("589","0","2022-11-07 18:50:51","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("590","0","2022-11-07 18:50:53","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("591","0","2022-11-07 18:53:45","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("592","0","2022-11-07 18:53:53","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("593","0","2022-11-07 18:54:24","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("594","0","2022-11-07 18:54:26","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("595","0","2022-11-07 18:55:04","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("596","0","2022-11-07 19:12:11","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("597","0","2022-11-07 21:05:02","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("598","0","2022-11-07 21:05:02","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("599","0","2022-11-07 21:09:33","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("600","0","2022-11-07 21:09:34","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("601","0","2022-11-07 21:09:36","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("602","0","2022-11-07 21:13:39","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("603","0","2022-11-07 21:57:07","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("604","0","2022-11-07 21:57:09","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("605","0","2022-11-07 21:57:12","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("606","0","2022-11-07 21:57:19","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("607","0","2022-11-07 21:58:18","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("608","0","2022-11-07 21:58:25","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("609","0","2022-11-07 21:58:44","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("610","0","2022-11-07 21:59:47","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("611","0","2022-11-07 21:59:53","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("612","0","2022-11-07 22:00:03","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("613","0","2022-11-07 22:00:10","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("614","0","2022-11-07 22:00:15","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("615","0","2022-11-07 22:00:52","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("616","0","2022-11-07 22:04:29","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("617","0","2022-11-07 22:05:31","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("618","0","2022-11-08 17:50:41","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("619","0","2022-11-08 17:50:41","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("620","0","2022-11-08 17:50:49","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("621","0","2022-11-08 17:52:18","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("622","0","2022-11-08 18:17:34","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("623","0","2022-11-08 18:20:14","1","Modificación de objeto","El usuario ADMIN actualizó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("624","0","2022-11-08 18:20:16","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("625","0","2022-11-08 18:21:43","1","Modificación de objeto","El usuario ADMIN actualizó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("626","0","2022-11-08 18:21:45","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("627","0","2022-11-08 18:22:49","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("628","0","2022-11-08 18:22:57","1","Modificación de objeto","El usuario ADMIN actualizó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("629","0","2022-11-08 18:22:58","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("630","0","2022-11-08 18:30:50","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("631","0","2022-11-08 18:32:43","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("632","0","2022-11-08 18:34:08","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("633","0","2022-11-08 18:34:34","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("634","0","2022-11-08 18:34:40","1","Permiso eliminado","El usuario ADMIN eliminó un permiso del sistema");
INSERT INTO TBL_bitacora VALUES("635","0","2022-11-08 18:34:42","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("636","0","2022-11-08 18:36:05","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("637","0","2022-11-08 18:37:12","1","Modificación de rol","El usuario ADMIN actualizó un rol del sistema");
INSERT INTO TBL_bitacora VALUES("638","0","2022-11-08 18:37:13","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("639","0","2022-11-08 18:37:18","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("640","0","2022-11-08 18:37:34","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("641","0","2022-11-08 18:38:19","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("642","0","2022-11-08 18:38:39","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("643","0","2022-11-08 18:38:49","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("644","0","2022-11-08 18:38:49","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("645","0","2022-11-08 18:39:35","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("646","0","2022-11-08 18:40:26","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("647","0","2022-11-08 18:40:34","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("648","0","2022-11-08 18:40:41","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("649","0","2022-11-08 18:41:33","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("650","0","2022-11-08 18:43:25","1","Creación de Rol","El usuario ADMIN creó un nuevo rol en el sistema");
INSERT INTO TBL_bitacora VALUES("651","0","2022-11-08 18:43:29","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("652","0","2022-11-08 18:46:12","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("653","0","2022-11-08 18:47:14","1","Creación de Rol","El usuario ADMIN creó un nuevo rol en el sistema");
INSERT INTO TBL_bitacora VALUES("654","0","2022-11-08 18:47:15","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("655","0","2022-11-08 18:48:46","1","Creación de Rol","El usuario ADMIN creó un nuevo rol en el sistema");
INSERT INTO TBL_bitacora VALUES("656","0","2022-11-08 18:48:47","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("657","0","2022-11-08 18:49:29","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("658","0","2022-11-08 18:49:44","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("659","0","2022-11-08 18:50:15","1","Modificación de objeto","El usuario ADMIN actualizó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("660","0","2022-11-08 18:50:17","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("661","0","2022-11-08 18:51:38","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("662","0","2022-11-08 19:02:45","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("663","0","2022-11-08 19:05:05","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("664","0","2022-11-08 19:05:13","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("665","0","2022-11-08 19:06:17","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("666","0","2022-11-08 19:06:33","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("667","0","2022-11-08 19:07:51","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("668","0","2022-11-08 19:08:08","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("669","0","2022-11-08 19:08:39","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("670","0","2022-11-08 19:08:59","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("671","0","2022-11-08 19:10:23","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("672","0","2022-11-08 19:11:17","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("673","0","2022-11-08 19:11:33","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("674","0","2022-11-08 19:11:55","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("675","0","2022-11-08 19:12:31","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("676","0","2022-11-08 19:13:04","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("677","0","2022-11-08 19:24:56","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("678","0","2022-11-08 19:25:34","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("679","0","2022-11-08 19:25:56","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("680","0","2022-11-08 19:26:38","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("681","0","2022-11-08 19:26:56","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("682","0","2022-11-08 19:26:57","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("683","0","2022-11-08 19:27:07","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("684","0","2022-11-08 19:27:24","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("685","0","2022-11-08 19:28:23","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("686","0","2022-11-08 19:28:59","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("687","0","2022-11-08 19:33:37","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("688","0","2022-11-08 19:34:05","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("689","0","2022-11-08 19:34:23","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("690","0","2022-11-08 19:35:11","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("691","0","2022-11-08 19:35:39","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("692","0","2022-11-08 19:36:32","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("693","0","2022-11-08 19:36:36","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("694","0","2022-11-08 19:36:39","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("695","0","2022-11-08 19:36:41","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("696","0","2022-11-08 19:36:45","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("697","0","2022-11-08 19:36:48","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("698","0","2022-11-08 19:36:52","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("699","0","2022-11-08 19:36:57","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("700","0","2022-11-08 19:37:00","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("701","0","2022-11-08 19:37:02","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("702","0","2022-11-08 19:37:06","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("703","0","2022-11-08 19:37:09","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("704","0","2022-11-08 19:37:10","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("705","0","2022-11-08 19:37:13","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("706","0","2022-11-08 19:37:15","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("707","0","2022-11-08 19:37:18","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("708","0","2022-11-08 19:37:19","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("709","0","2022-11-08 19:37:21","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("710","0","2022-11-08 19:37:24","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("711","0","2022-11-08 19:37:26","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("712","0","2022-11-08 19:37:28","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("713","0","2022-11-08 19:37:30","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("714","0","2022-11-08 19:37:32","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("715","0","2022-11-08 19:37:34","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("716","0","2022-11-08 19:37:36","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("717","0","2022-11-08 19:37:39","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("718","0","2022-11-08 19:38:33","1","Creación de usuario","El usuario ADMIN creó un nuevo usuario en el sistema");
INSERT INTO TBL_bitacora VALUES("719","0","2022-11-08 19:38:43","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("720","0","2022-11-08 19:38:53","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("721","0","2022-11-08 19:41:13","6","Inicio de sesion","El usuario MARIOS entró al sistema");
INSERT INTO TBL_bitacora VALUES("722","0","2022-11-08 19:41:15","6","Cambio de vista","El usuario MARIOS entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("723","0","2022-11-08 19:42:05","6","Cambio de vista","El usuario MARIOS entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("724","0","2022-11-08 19:42:37","6","Cambio de vista","El usuario MARIOS entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("725","0","2022-11-08 19:45:32","6","Cierre de sesión","El usuario MARIOS salió del sistema");
INSERT INTO TBL_bitacora VALUES("726","0","2022-11-08 19:45:44","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("727","0","2022-11-08 19:45:45","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("728","0","2022-11-08 19:46:04","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("729","0","2022-11-08 19:46:37","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("730","0","2022-11-08 19:46:38","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("731","0","2022-11-08 19:49:56","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("732","0","2022-11-08 19:51:11","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("733","0","2022-11-08 19:51:11","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("734","0","2022-11-08 19:51:30","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("735","0","2022-11-08 19:51:48","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("736","0","2022-11-08 19:51:48","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("737","0","2022-11-08 19:52:07","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("738","0","2022-11-08 19:52:16","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("739","0","2022-11-08 19:52:22","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("740","0","2022-11-08 19:53:06","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("741","0","2022-11-08 19:53:06","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("742","0","2022-11-08 19:54:40","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("743","0","2022-11-08 19:55:33","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("744","0","2022-11-08 19:55:33","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("745","0","2022-11-08 19:55:37","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("746","0","2022-11-08 19:55:40","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("747","0","2022-11-08 19:57:44","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("748","0","2022-11-08 19:58:09","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("749","0","2022-11-08 19:58:09","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("750","0","2022-11-08 20:01:04","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("751","0","2022-11-08 20:01:48","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("752","0","2022-11-08 20:02:03","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("753","0","2022-11-08 20:02:24","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("754","0","2022-11-08 20:03:34","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("755","0","2022-11-08 20:04:37","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("756","0","2022-11-08 20:04:37","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("757","0","2022-11-08 20:04:39","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("758","0","2022-11-08 20:04:54","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("759","0","2022-11-08 20:06:32","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("760","0","2022-11-08 20:07:25","1","Modificación de objeto","El usuario ADMIN actualizó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("761","0","2022-11-08 20:07:27","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("762","0","2022-11-08 20:07:44","1","Modificación de objeto","El usuario ADMIN actualizó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("763","0","2022-11-08 20:07:46","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("764","0","2022-11-08 20:07:54","1","Modificación de objeto","El usuario ADMIN actualizó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("765","0","2022-11-08 20:07:56","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("766","0","2022-11-08 20:08:10","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("767","0","2022-11-08 20:08:11","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("768","0","2022-11-08 20:09:28","1","Modificación de objeto","El usuario ADMIN actualizó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("769","0","2022-11-08 20:09:29","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("770","0","2022-11-08 20:09:41","1","Modificación de objeto","El usuario ADMIN actualizó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("771","0","2022-11-08 20:09:42","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("772","0","2022-11-08 20:10:08","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("773","0","2022-11-08 20:10:08","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("774","0","2022-11-08 20:11:01","1","Modificación de objeto","El usuario ADMIN actualizó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("775","0","2022-11-08 20:11:03","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("776","0","2022-11-08 20:11:29","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("777","0","2022-11-08 20:11:29","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("778","0","2022-11-08 20:12:11","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("779","0","2022-11-08 20:12:11","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("780","0","2022-11-08 20:12:51","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("781","0","2022-11-08 20:12:52","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("782","0","2022-11-08 20:12:56","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("783","0","2022-11-08 20:13:59","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("784","0","2022-11-08 20:15:49","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("785","0","2022-11-08 20:15:49","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("786","0","2022-11-08 20:16:04","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("787","0","2022-11-08 20:29:11","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("788","0","2022-11-08 20:42:28","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("789","0","2022-11-08 20:42:33","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("790","0","2022-11-08 20:42:34","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("791","0","2022-11-08 20:52:05","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("792","0","2022-11-08 20:52:12","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("793","0","2022-11-08 21:07:32","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("794","0","2022-11-08 21:07:43","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("795","0","2022-11-08 21:07:44","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("796","0","2022-11-08 21:32:47","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("797","0","2022-11-08 21:35:32","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("798","0","2022-11-08 21:35:49","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("799","0","2022-11-08 21:35:53","1","Cambio de vista","El usuario ADMIN entró a la vista de Inventario Disponible");
INSERT INTO TBL_bitacora VALUES("800","0","2022-11-08 21:36:00","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("801","0","2022-11-08 21:51:28","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("802","0","2022-11-08 22:07:45","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("803","0","2022-11-08 22:07:52","1","Permiso eliminado","El usuario ADMIN eliminó un permiso del sistema");
INSERT INTO TBL_bitacora VALUES("804","0","2022-11-08 22:07:55","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("805","0","2022-11-08 22:08:14","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("806","0","2022-11-08 22:08:15","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("807","0","2022-11-09 00:27:50","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("808","0","2022-11-09 10:21:01","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("809","0","2022-11-09 10:21:01","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("810","0","2022-11-09 10:21:51","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("811","0","2022-11-09 10:21:58","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("812","0","2022-11-09 10:22:04","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("813","0","2022-11-09 10:22:13","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("814","0","2022-11-09 10:30:07","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("815","0","2022-11-09 10:32:19","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("816","0","2022-11-09 10:33:54","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("817","0","2022-11-09 10:37:54","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("818","0","2022-11-09 10:38:00","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("819","0","2022-11-09 10:45:26","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("820","0","2022-11-09 10:47:48","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("821","0","2022-11-09 11:04:31","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("822","0","2022-11-09 11:06:17","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("823","0","2022-11-09 11:06:21","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("824","0","2022-11-09 11:06:48","1","Creación de Rol","El usuario ADMIN creó un nuevo parametro en el sistema");
INSERT INTO TBL_bitacora VALUES("825","0","2022-11-09 11:06:51","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("826","0","2022-11-09 11:11:54","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("827","0","2022-11-09 11:20:02","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("828","0","2022-11-09 11:20:19","1","Modificación de rol","El usuario ADMIN actualizó un parametro del sistema");
INSERT INTO TBL_bitacora VALUES("829","0","2022-11-09 11:20:21","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("830","0","2022-11-09 11:44:14","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("831","0","2022-11-09 11:45:28","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("832","0","2022-11-09 11:47:15","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("833","0","2022-11-09 11:47:21","1","Parametro eliminado","El usuario ADMIN eliminó un parametro del sistema");
INSERT INTO TBL_bitacora VALUES("834","0","2022-11-09 11:47:23","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("835","0","2022-11-09 11:49:00","","Creación de Proveedor","El usuario ADMIN creó un nuevo proveedor en el sistema");
INSERT INTO TBL_bitacora VALUES("836","0","2022-11-09 11:50:56","1","Cambio de vista","El usuario ADMIN entró a la vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("837","0","2022-11-09 11:51:13","1","Cambio de vista","El usuario ADMIN entró a la vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("838","0","2022-11-09 11:51:49","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("839","0","2022-11-09 11:52:32","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("840","0","2022-11-09 11:52:41","1","Cambio de vista","El usuario ADMIN entró a la vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("841","0","2022-11-09 12:04:20","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("842","0","2022-11-09 13:47:15","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("843","0","2022-11-09 13:47:16","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("844","0","2022-11-09 13:48:00","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("845","0","2022-11-09 13:49:34","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("846","0","2022-11-09 13:49:45","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("847","0","2022-11-09 13:50:12","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("848","0","2022-11-09 13:50:55","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("849","0","2022-11-09 13:52:13","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("850","0","2022-11-09 13:52:21","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("851","0","2022-11-09 13:52:58","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("852","0","2022-11-09 13:53:09","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("853","0","2022-11-09 13:56:25","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("854","0","2022-11-09 13:58:45","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("855","0","2022-11-09 13:58:55","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("856","0","2022-11-09 13:59:03","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("857","0","2022-11-09 14:01:50","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("858","0","2022-11-09 14:01:51","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("859","0","2022-11-09 14:02:02","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("860","0","2022-11-09 14:02:16","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("861","0","2022-11-09 14:02:28","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("862","0","2022-11-09 14:02:36","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("863","0","2022-11-09 14:02:49","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("864","0","2022-11-09 14:05:18","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("865","0","2022-11-09 14:11:20","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("866","0","2022-11-09 14:14:33","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("867","0","2022-11-09 14:14:53","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("868","0","2022-11-09 14:16:38","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("869","0","2022-11-09 14:16:48","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("870","0","2022-11-09 14:18:43","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("871","0","2022-11-09 14:18:51","1","Cambio de vista","El usuario ADMIN entró a la vista de Preguntas");
INSERT INTO TBL_bitacora VALUES("872","0","2022-11-09 14:27:22","1","Cambio de vista","El usuario ADMIN entró a la vista de Preguntas");
INSERT INTO TBL_bitacora VALUES("873","0","2022-11-09 14:35:22","1","Cambio de vista","El usuario ADMIN entró a la vista de Preguntas");
INSERT INTO TBL_bitacora VALUES("874","0","2022-11-09 14:39:54","1","Cambio de vista","El usuario ADMIN entró a la vista de Preguntas");
INSERT INTO TBL_bitacora VALUES("875","0","2022-11-09 14:40:19","1","Creación de Pregunta","El usuario ADMIN creó una nueva pregunta en el sistema");
INSERT INTO TBL_bitacora VALUES("876","0","2022-11-09 14:40:22","1","Cambio de vista","El usuario ADMIN entró a la vista de Preguntas");
INSERT INTO TBL_bitacora VALUES("877","0","2022-11-09 14:41:28","1","Creación de Pregunta","El usuario ADMIN creó una nueva pregunta en el sistema");
INSERT INTO TBL_bitacora VALUES("878","0","2022-11-09 14:41:32","1","Cambio de vista","El usuario ADMIN entró a la vista de Preguntas");
INSERT INTO TBL_bitacora VALUES("879","0","2022-11-09 14:50:25","1","Cambio de vista","El usuario ADMIN entró a la vista de Preguntas");
INSERT INTO TBL_bitacora VALUES("880","0","2022-11-09 14:50:55","1","Cambio de vista","El usuario ADMIN entró a la vista de Preguntas");
INSERT INTO TBL_bitacora VALUES("881","0","2022-11-09 14:52:41","1","Cambio de vista","El usuario ADMIN entró a la vista de Preguntas");
INSERT INTO TBL_bitacora VALUES("882","0","2022-11-09 14:55:01","1","Cambio de vista","El usuario ADMIN entró a la vista de Preguntas");
INSERT INTO TBL_bitacora VALUES("883","0","2022-11-09 14:55:29","1","Modificación de Pregunta","El usuario ADMIN actualizó una pregunta del sistema");
INSERT INTO TBL_bitacora VALUES("884","0","2022-11-09 14:55:31","1","Cambio de vista","El usuario ADMIN entró a la vista de Preguntas");
INSERT INTO TBL_bitacora VALUES("885","0","2022-11-09 15:01:30","1","Cambio de vista","El usuario ADMIN entró a la vista de Preguntas");
INSERT INTO TBL_bitacora VALUES("886","0","2022-11-09 15:01:39","1","Pregunta eliminada","El usuario ADMIN eliminó una pregunta del sistema");
INSERT INTO TBL_bitacora VALUES("887","0","2022-11-09 15:01:42","1","Cambio de vista","El usuario ADMIN entró a la vista de Preguntas");
INSERT INTO TBL_bitacora VALUES("888","0","2022-11-09 15:02:12","1","Pregunta eliminada","El usuario ADMIN eliminó una pregunta del sistema");
INSERT INTO TBL_bitacora VALUES("889","0","2022-11-09 15:02:15","1","Cambio de vista","El usuario ADMIN entró a la vista de Preguntas");
INSERT INTO TBL_bitacora VALUES("890","0","2022-11-09 15:15:44","1","Creación de Pregunta","El usuario ADMIN creó una nueva pregunta en el sistema");
INSERT INTO TBL_bitacora VALUES("891","0","2022-11-09 15:15:46","1","Cambio de vista","El usuario ADMIN entró a la vista de Preguntas");
INSERT INTO TBL_bitacora VALUES("892","0","2022-11-09 15:15:59","1","Modificación de Pregunta","El usuario ADMIN actualizó una pregunta del sistema");
INSERT INTO TBL_bitacora VALUES("893","0","2022-11-09 15:16:02","1","Cambio de vista","El usuario ADMIN entró a la vista de Preguntas");
INSERT INTO TBL_bitacora VALUES("894","0","2022-11-09 15:16:08","1","Pregunta eliminada","El usuario ADMIN eliminó una pregunta del sistema");
INSERT INTO TBL_bitacora VALUES("895","0","2022-11-09 15:16:10","1","Cambio de vista","El usuario ADMIN entró a la vista de Preguntas");
INSERT INTO TBL_bitacora VALUES("896","0","2022-11-09 20:18:40","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("897","0","2022-11-09 20:18:41","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("898","0","2022-11-09 20:20:31","1","Cambio de vista","El usuario ADMIN entró a la vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("899","0","2022-11-09 08:21:16","","Modificación de proveedor","El usuario ADMIN actualizó un proveedor en el sistema");
INSERT INTO TBL_bitacora VALUES("900","0","2022-11-09 20:21:22","1","Cambio de vista","El usuario ADMIN entró a la vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("901","0","2022-11-09 20:22:10","1","Cambio de vista","El usuario ADMIN entró a la vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("902","0","2022-11-09 20:22:15","1","Cambio de vista","El usuario ADMIN entró a la vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("903","0","2022-11-09 20:30:54","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("904","0","2022-11-09 20:30:54","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("905","0","2022-11-09 20:57:18","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("906","0","2022-11-09 20:57:19","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("907","0","2022-11-09 20:57:40","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("908","0","2022-11-09 20:58:19","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("909","0","2022-11-09 21:33:08","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("910","0","2022-11-09 21:33:09","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("911","0","2022-11-09 21:36:48","1","Cambio de vista","El usuario ADMIN entró a la vista de Preguntas");
INSERT INTO TBL_bitacora VALUES("912","0","2022-11-09 21:48:38","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("913","0","2022-11-09 21:48:50","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("914","0","2022-11-09 21:53:05","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("915","0","2022-11-09 21:54:14","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("916","0","2022-11-09 21:54:19","1","Cambio de vista","El usuario ADMIN entró a la vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("917","0","2022-11-09 21:54:58","1","Cambio de vista","El usuario ADMIN entró a la vista de Inventario Disponible");
INSERT INTO TBL_bitacora VALUES("918","0","2022-11-09 21:56:28","1","Cambio de vista","El usuario ADMIN entró a la vista de Inventario Disponible");
INSERT INTO TBL_bitacora VALUES("919","0","2022-11-09 21:56:55","1","Cambio de vista","El usuario ADMIN entró a la vista de Inventario Disponible");
INSERT INTO TBL_bitacora VALUES("920","0","2022-11-09 21:57:54","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("921","0","2022-11-09 21:58:28","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("922","0","2022-11-09 21:58:47","1","Cambio de vista","El usuario ADMIN entró a la vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("923","0","2022-11-09 21:59:45","1","Cambio de vista","El usuario ADMIN entró a la vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("924","0","2022-11-09 21:59:54","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("925","0","2022-11-09 22:01:09","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("926","0","2022-11-09 22:01:30","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("927","0","2022-11-09 22:02:08","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("928","0","2022-11-09 22:02:19","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("929","0","2022-11-09 22:02:47","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("930","0","2022-11-09 22:03:02","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("931","0","2022-11-09 22:03:13","1","Modificación de objeto","El usuario ADMIN actualizó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("932","0","2022-11-09 22:03:14","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("933","0","2022-11-09 22:03:28","1","Modificación de objeto","El usuario ADMIN actualizó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("934","0","2022-11-09 22:03:29","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("935","0","2022-11-09 22:03:45","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("936","0","2022-11-09 22:04:18","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("937","0","2022-11-09 22:04:41","1","Cambio de vista","El usuario ADMIN entró a la vista de Preguntas");
INSERT INTO TBL_bitacora VALUES("938","0","2022-11-09 22:05:13","1","Cambio de vista","El usuario ADMIN entró a la vista de Preguntas");
INSERT INTO TBL_bitacora VALUES("939","0","2022-11-09 22:09:45","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("940","0","2022-11-09 22:24:31","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("941","0","2022-11-09 22:24:43","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("942","0","2022-11-09 22:25:22","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("943","0","2022-11-09 22:34:05","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("944","0","2022-11-09 22:34:23","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("945","0","2022-11-09 22:34:39","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("946","0","2022-11-09 22:35:17","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("947","0","2022-11-09 22:35:25","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("948","0","2022-11-09 22:36:39","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("949","0","2022-11-09 22:38:48","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("950","0","2022-11-09 22:38:55","1","Cambio de vista","El usuario ADMIN entró a la vista de Preguntas");
INSERT INTO TBL_bitacora VALUES("951","0","2022-11-09 22:39:29","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("952","0","2022-11-09 22:41:56","1","Cambio de vista","El usuario ADMIN entró a la vista de Preguntas");
INSERT INTO TBL_bitacora VALUES("953","0","2022-11-09 22:42:05","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("954","0","2022-11-09 22:42:09","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("955","0","2022-11-09 22:42:18","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("956","0","2022-11-09 22:42:26","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("957","0","2022-11-09 22:43:18","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("958","0","2022-11-09 22:43:19","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("959","0","2022-11-09 22:43:33","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("960","0","2022-11-09 22:43:52","1","Modificación de usuario","El usuario ADMIN actualizó un usuario del sistema");
INSERT INTO TBL_bitacora VALUES("961","0","2022-11-09 22:43:56","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("962","0","2022-11-09 22:49:26","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("963","0","2022-11-09 23:01:42","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("964","0","2022-11-09 23:01:43","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("965","0","2022-11-09 23:02:06","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("966","0","2022-11-09 23:02:18","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("967","0","2022-11-09 23:02:23","1","Cambio de vista","El usuario ADMIN entró a la vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("968","0","2022-11-09 23:02:28","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("969","0","2022-11-09 23:03:17","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("970","0","2022-11-09 23:03:27","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("971","0","2022-11-09 23:03:41","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("972","0","2022-11-09 23:04:46","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("973","0","2022-11-09 23:05:41","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("974","0","2022-11-09 23:05:41","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("975","0","2022-11-09 23:05:56","1","Cambio de vista","El usuario ADMIN entró a la vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("976","0","2022-11-09 23:06:17","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("977","0","2022-11-09 23:07:28","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("978","0","2022-11-09 23:12:53","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("979","0","2022-11-09 23:12:54","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("980","0","2022-11-09 23:13:02","1","Cambio de vista","El usuario ADMIN entró a la vista de Preguntas");
INSERT INTO TBL_bitacora VALUES("981","0","2022-11-09 23:13:12","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("982","0","2022-11-11 15:09:51","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("983","0","2022-11-11 15:09:51","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("984","0","2022-11-11 15:10:18","1","Cambio de vista","El usuario ADMIN entró a la vista de Preguntas");
INSERT INTO TBL_bitacora VALUES("985","0","2022-11-11 15:10:20","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("986","0","2022-11-11 15:10:46","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("987","0","2022-11-11 15:10:49","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("988","0","2022-11-11 15:10:52","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("989","0","2022-11-11 15:11:13","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("990","0","2022-11-11 15:16:07","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("991","0","2022-11-11 16:11:45","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("992","0","2022-11-11 16:11:45","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("993","0","2022-11-11 16:11:53","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("994","0","2022-11-11 16:12:12","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("995","0","2022-11-11 16:18:42","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("996","0","2022-11-11 16:18:42","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("997","0","2022-11-11 16:29:10","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("998","0","2022-11-11 16:31:31","1","Cambio de vista","El usuario ADMIN entró a la vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("999","0","2022-11-11 16:31:46","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1000","0","2022-11-11 16:31:53","1","Cambio de vista","El usuario ADMIN entró a la vista de Inventario Disponible");
INSERT INTO TBL_bitacora VALUES("1001","0","2022-11-11 16:33:19","1","Cambio de vista","El usuario ADMIN entró a la vista de Preguntas");
INSERT INTO TBL_bitacora VALUES("1002","0","2022-11-11 16:36:30","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("1003","0","2022-11-11 16:37:27","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1004","0","2022-11-11 16:37:30","1","Cambio de vista","El usuario ADMIN entró a la vista de Inventario Disponible");
INSERT INTO TBL_bitacora VALUES("1005","0","2022-11-11 16:40:26","1","Cambio de vista","El usuario ADMIN entró a la vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1006","0","2022-11-11 16:45:33","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("1007","0","2022-11-11 16:45:46","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("1008","0","2022-11-11 16:46:04","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("1009","0","2022-11-11 16:46:05","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1010","0","2022-11-11 20:31:57","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("1011","0","2022-11-11 20:31:57","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1012","0","2022-11-11 20:32:51","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1013","0","2022-11-11 20:32:56","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("1014","0","2022-11-11 20:33:04","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("1015","0","2022-11-11 20:33:04","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1016","0","2022-11-11 20:33:41","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1017","0","2022-11-11 20:34:29","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1018","0","2022-11-11 20:34:57","1","Objeto eliminado","El usuario ADMIN eliminó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("1019","0","2022-11-11 20:35:02","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1020","0","2022-11-11 20:48:43","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1021","0","2022-11-11 20:52:10","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1022","0","2022-11-11 20:52:26","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1023","0","2022-11-11 20:52:38","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1024","0","2022-11-11 20:52:44","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("1025","0","2022-11-11 20:52:51","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("1026","0","2022-11-11 20:52:51","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1027","0","2022-11-11 20:52:59","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1028","0","2022-11-11 20:53:20","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1029","0","2022-11-11 20:54:34","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1030","0","2022-11-11 21:01:25","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1031","0","2022-11-11 21:03:29","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1032","0","2022-11-11 21:04:09","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1033","0","2022-11-11 21:04:34","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1034","0","2022-11-11 21:04:47","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("1035","0","2022-11-11 21:04:56","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("1036","0","2022-11-11 21:04:56","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1037","0","2022-11-11 21:05:03","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1038","0","2022-11-11 21:05:31","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1039","0","2022-11-11 21:05:39","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1040","0","2022-11-11 21:06:53","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1041","0","2022-11-11 21:07:33","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1042","0","2022-11-11 21:11:12","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("1043","0","2022-11-11 21:12:10","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("1044","0","2022-11-11 21:12:53","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("1045","0","2022-11-11 21:20:49","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("1046","0","2022-11-11 21:20:55","1","Cambio de vista","El usuario ADMIN entró a la vista de Roles");
INSERT INTO TBL_bitacora VALUES("1047","0","2022-11-11 21:20:56","1","Cambio de vista","El usuario ADMIN entró al modal de Creación de Roles");
INSERT INTO TBL_bitacora VALUES("1048","0","2022-11-11 21:22:07","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1049","0","2022-11-11 21:22:58","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("1050","0","2022-11-11 21:22:58","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1051","0","2022-11-11 21:23:25","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1052","0","2022-11-11 21:23:48","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("1053","0","2022-11-11 21:23:49","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1054","0","2022-11-11 21:23:59","1","Cambio de vista","El usuario ADMIN entró a la vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1055","0","2022-11-11 21:26:02","1","Cambio de vista","El usuario ADMIN entró a la vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1056","0","2022-11-11 21:28:31","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1057","0","2022-11-11 21:29:22","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("1058","0","2022-11-11 21:29:24","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1059","0","2022-11-11 21:30:38","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("1060","0","2022-11-11 21:30:39","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1061","0","2022-11-11 21:31:07","1","Modificación de objeto","El usuario ADMIN actualizó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("1062","0","2022-11-11 21:31:09","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1063","0","2022-11-11 21:31:19","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("1064","0","2022-11-11 21:31:50","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("1065","0","2022-11-11 21:31:51","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("1066","0","2022-11-11 21:32:07","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("1067","0","2022-11-11 21:32:08","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("1068","0","2022-11-11 21:32:24","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("1069","0","2022-11-11 21:32:26","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("1070","0","2022-11-11 21:32:42","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("1071","0","2022-11-11 21:32:43","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("1072","0","2022-11-11 21:32:56","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("1073","0","2022-11-11 21:32:57","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("1074","0","2022-11-11 21:34:04","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("1075","0","2022-11-11 21:34:05","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("1076","0","2022-11-11 23:18:20","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1077","0","2022-11-12 10:18:02","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("1078","0","2022-11-12 10:18:02","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1079","0","2022-11-12 10:35:32","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("1080","0","2022-11-12 10:35:35","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1081","0","2022-11-12 10:36:44","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1082","0","2022-11-12 10:37:28","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1083","0","2022-11-12 10:38:35","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1084","0","2022-11-12 10:40:43","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("1085","0","2022-11-12 10:40:46","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1086","0","2022-11-12 10:40:51","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1087","0","2022-11-12 10:42:13","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1088","0","2022-11-12 10:47:14","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1089","0","2022-11-12 11:04:22","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1090","0","2022-11-12 16:40:03","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("1091","0","2022-11-12 16:40:04","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1092","0","2022-11-12 16:40:16","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("1093","0","2022-11-12 16:44:22","1","Cambio de vista","El usuario ADMIN entró a la vista de Permisos");
INSERT INTO TBL_bitacora VALUES("1094","0","2022-11-12 16:45:07","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("1095","0","2022-11-12 16:45:41","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("1096","0","2022-11-12 16:45:45","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1097","0","2022-11-12 16:46:04","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("1098","0","2022-11-12 16:46:16","1","Modificación de usuario","El usuario ADMIN actualizó un usuario del sistema");
INSERT INTO TBL_bitacora VALUES("1099","0","2022-11-12 16:46:20","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("1100","0","2022-11-12 16:57:47","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("1101","0","2022-11-12 17:09:34","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1102","0","2022-11-12 17:10:00","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1103","0","2022-11-12 17:10:28","1","Creación de Objeto","El usuario ADMIN creó un nuevo objeto en el sistema");
INSERT INTO TBL_bitacora VALUES("1104","0","2022-11-12 17:10:29","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1105","1","2022-11-12 17:11:12","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1106","1","2022-11-12 17:30:14","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1107","1","2022-11-12 17:31:13","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1108","0","2022-11-12 17:31:22","1","Cambio de vista","El usuario ADMIN entró a la vista de Parametros");
INSERT INTO TBL_bitacora VALUES("1109","0","2022-11-12 17:33:33","1","Cambio de vista","El usuario ADMIN entró a la vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1110","0","2022-11-12 17:40:32","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("1111","0","2022-11-12 17:41:46","6","Inicio de sesion","El usuario MARIOS entró al sistema");
INSERT INTO TBL_bitacora VALUES("1112","1","2022-11-12 17:41:46","6","Cambio de vista","El usuario MARIOS entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1113","1","2022-11-12 17:42:09","6","Cambio de vista","El usuario MARIOS entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1114","0","2022-11-12 17:42:14","6","Cierre de sesión","El usuario MARIOS salió del sistema");
INSERT INTO TBL_bitacora VALUES("1115","0","2022-11-12 17:42:42","6","Inicio de sesion","El usuario MARIOS entró al sistema");
INSERT INTO TBL_bitacora VALUES("1116","1","2022-11-12 17:42:42","6","Cambio de vista","El usuario MARIOS entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1117","0","2022-11-12 21:27:03","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("1118","0","2022-11-12 21:27:03","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1119","0","2022-11-12 21:27:39","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1120","0","2022-11-12 21:28:50","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1121","0","2022-11-12 21:30:07","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1122","0","2022-11-12 21:30:42","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1123","0","2022-11-12 21:31:23","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1124","0","2022-11-12 21:33:55","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1125","0","2022-11-12 21:44:35","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1126","0","2022-11-12 21:44:46","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1127","0","2022-11-12 21:44:51","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1128","0","2022-11-12 21:45:02","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1129","0","2022-11-12 21:45:13","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1130","0","2022-11-12 21:45:23","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1131","0","2022-11-12 21:49:22","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1132","0","2022-11-12 21:49:38","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1133","0","2022-11-12 21:49:58","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1134","0","2022-11-12 21:50:59","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1135","0","2022-11-12 21:51:13","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1136","0","2022-11-12 21:51:41","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1137","0","2022-11-12 21:52:04","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1138","0","2022-11-12 21:52:23","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1139","0","2022-11-12 21:53:35","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1140","0","2022-11-12 21:54:30","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1141","0","2022-11-12 22:05:01","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1142","0","2022-11-12 22:16:48","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1143","0","2022-11-12 22:16:54","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1144","0","2022-11-12 22:17:24","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1145","0","2022-11-12 22:17:25","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1146","0","2022-11-12 22:19:03","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1147","0","2022-11-12 22:19:27","1","Cambio de vista","El usuario ADMIN entró a la vista de Creación de Usuarios");
INSERT INTO TBL_bitacora VALUES("1148","0","2022-11-12 23:27:30","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("1149","0","2022-11-12 23:27:31","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1150","0","2022-11-12 23:27:50","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1151","0","2022-11-12 23:27:56","1","Cambio de vista","El usuario ADMIN entró a la vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1152","0","2022-11-12 23:28:03","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1153","0","2022-11-12 23:40:25","1","Cambio de vista","El usuario ADMIN entró a la vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1154","0","2022-11-12 23:49:30","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1155","0","2022-11-12 23:49:45","1","Cambio de vista","El usuario ADMIN entró a la vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1156","0","2022-11-12 23:50:06","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1157","0","2022-11-13 00:08:46","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1158","0","2022-11-13 00:24:30","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1159","0","2022-11-13 00:32:16","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1160","0","2022-11-13 11:04:17","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("1161","0","2022-11-13 11:04:18","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1162","0","2022-11-13 11:04:31","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1163","0","2022-11-13 11:04:38","1","Cambio de vista","El usuario ADMIN entró a la vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1164","0","2022-11-13 11:05:26","1","Cambio de vista","El usuario ADMIN entró a la vista de Proveedores");



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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

INSERT INTO TBL_ms_preguntas_usuario VALUES("2","6","copo","","","","");
INSERT INTO TBL_ms_preguntas_usuario VALUES("4","6","pizza","","","","");
INSERT INTO TBL_ms_preguntas_usuario VALUES("3","6","tegucigalpa","","","","");



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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_objetos VALUES("1","HOME","Vista principal del sistema","Home","ADMIN","2022-11-12 17:10:27","","");



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
  `permiso_insercion` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `permiso_actualizacion` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `permiso_eliminacion` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `permiso_consulta` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `creado_por` varchar(50) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `modificado_por` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  KEY `id_rol` (`id_rol`),
  KEY `id_objeto` (`id_objeto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_permisos VALUES("1","1","1","1","1","1","ADMIN","2022-11-08 22:08:13","ADMIN","2022-11-09 22:03:27");
INSERT INTO TBL_permisos VALUES("1","2","0","0","0","1","ADMIN","2022-11-11 21:31:49","","");
INSERT INTO TBL_permisos VALUES("2","2","0","0","0","1","ADMIN","2022-11-11 21:32:06","","");
INSERT INTO TBL_permisos VALUES("3","2","0","0","0","1","ADMIN","2022-11-11 21:32:24","","");
INSERT INTO TBL_permisos VALUES("1","3","1","1","1","1","ADMIN","2022-11-11 21:32:41","","");
INSERT INTO TBL_permisos VALUES("2","3","1","1","1","1","ADMIN","2022-11-11 21:32:56","","");
INSERT INTO TBL_permisos VALUES("3","3","0","0","0","0","ADMIN","2022-11-11 21:34:03","","");



CREATE TABLE `TBL_preguntas` (
  `id_pregunta` int NOT NULL AUTO_INCREMENT,
  `pregunta` varchar(50) NOT NULL,
  `creado_por` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `modificado_por` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_pregunta`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_preguntas VALUES("1","Cual es su deporte favorito?","ADMIN","2022-09-21 00:00:00","ADMIN","2022-09-21 00:00:00");
INSERT INTO TBL_preguntas VALUES("2","Nombre de su mascota","ADMIN","2022-09-23 00:00:00","ADMIN","2022-09-23 00:00:00");
INSERT INTO TBL_preguntas VALUES("3","Lugar de nacimiento","ADMIN","2022-09-23 00:00:00","ADMIN","2022-09-23 00:00:00");
INSERT INTO TBL_preguntas VALUES("4","Comida favorita","ADMIN","2022-09-23 00:00:00","ADMIN","2022-09-23 00:00:00");
INSERT INTO TBL_preguntas VALUES("5","Nombre de su primer hijo(a)?","ADMIN","2022-09-21 00:00:00","ADMIN","2022-09-21 00:00:00");



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
  `id_tipo_produ` int NOT NULL COMMENT 'Entidad encargada de la clasificación de los productos, así como de la presentación o tamaño de estos',
  `tipo_producto` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'este se refiere a los productoq ue vende la empresa. ejemplo cafe o granita',
  `tamaño_producto` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `clasificacion_producto` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'verificar si se puede colocar como enum\npara elegir la categoria',
  PRIMARY KEY (`id_tipo_produ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `TBL_usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nombre_usuario` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado_usuario` enum('Activo','Inactivo','Bloqueado','Nuevo') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contrasena` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_rol` int NOT NULL,
  `fecha_ultima_conexion` date DEFAULT NULL,
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

INSERT INTO TBL_usuarios VALUES("1","ADMIN","ADMINISTRADOR","Activo","$2y$12$d9ZLQGv4lBE4Lcv2atFD2ODwdR7jwqQh3uXhTJ0jFeRWVucd6YXrG","1","2023-10-23","1","1","2023-10-23","admincitycoffee@gmail.com","ADMIN","2022-10-28 13:44:33","ADMIN","2022-10-28 13:44:33");
INSERT INTO TBL_usuarios VALUES("6","MARIOS","MARIO SILVA","Activo","$2y$12$eGEOPtCxe2A0Uf7rSRNoiu2il.85SaT0y4eJheaCQxChMELNAnAbK","2","","","1","2023-11-07","karimhernandez233@gmail.com","ADMIN","2022-11-08 19:38:27","MARIOS","2022-11-12 17:41:09");
INSERT INTO TBL_usuarios VALUES("7","nuevo","prueba","Activo","$2y$12$eGEOPtCxe2A0Uf7rSRNoiu2il.85SaT0y4eJheaCQxChMELNAnAbK","2","","","1","2023-11-07","roman@gmial.com","ADMIN","2022-11-08 19:38:37","ADMIN","2022-11-12 17:41:09");


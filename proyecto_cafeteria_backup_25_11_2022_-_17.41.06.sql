

CREATE TABLE `TBL_Clientes` (
  `id_clientes` int NOT NULL AUTO_INCREMENT,
  `nom_cliente` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `rtn_cliente` varchar(40) DEFAULT NULL,
  `dni_clinte` varchar(20) DEFAULT NULL,
  `tel_cliente` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id_clientes`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_Clientes VALUES("1","ANDREA KARINA","08080225124294","0808022512548","1111111");
INSERT INTO TBL_Clientes VALUES("2","JUANITO","08011992145226","0801199214522","88568787");
INSERT INTO TBL_Clientes VALUES("3","KARIN","0801-1992-12429-5","0801-1992-12429","8733-9107");
INSERT INTO TBL_Clientes VALUES("4","CAFEMANIA","0804-1989-25635-4","0804-1989-25635","8888-9999");
INSERT INTO TBL_Clientes VALUES("5","AZUCAR","08011955445568","0801195544556","9755-2815");
INSERT INTO TBL_Clientes VALUES("6","YUCA","08011992124294","0801199212429","8733-9107");
INSERT INTO TBL_Clientes VALUES("7","MARIA","00000000000","0000000000000","99235601");



CREATE TABLE `TBL_Proveedores` (
  `id_Proveedores` int NOT NULL AUTO_INCREMENT,
  `nom_proveedor` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `rtn_proveedor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tel_proveedor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `correo_proveedor` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dir_proveedor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_Proveedores`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_Proveedores VALUES("1","LEYDE","0801199722659","22201345","sula@gmail.com","Tegucigalpa M.D.C");
INSERT INTO TBL_Proveedores VALUES("2","JOSE MARTINEZ","0982001112223","97238991","josem@gmail.com","Res.Las Uvas");
INSERT INTO TBL_Proveedores VALUES("4","CAFE MAYA","840983284384","99944499","cafemaya@gmail.com","Tegucigalpa M.D.C");
INSERT INTO TBL_Proveedores VALUES("6","PLATICOS Y MAS","0202020202020","99999999","platicos@gmail.com","Tegucigalpa");
INSERT INTO TBL_Proveedores VALUES("7","EL CAÑAL","0000000000000","22453245","elcananhn@gmail.com","San Pedro Sula");



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
) ENGINE=InnoDB AUTO_INCREMENT=2801 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_bitacora VALUES("1741","14","2022-11-23 23:24:56","1","Cambio de vista","El usuario ADMIN entró a la Vista de Respaldo");
INSERT INTO TBL_bitacora VALUES("1742","14","2022-11-23 23:25:09","1","Cambio de vista","El usuario ADMIN entró a la Vista de Respaldo");
INSERT INTO TBL_bitacora VALUES("1743","14","2022-11-23 23:25:15","1","Cambio de vista","El usuario ADMIN entró a la Vista de Respaldo");
INSERT INTO TBL_bitacora VALUES("1744","14","2022-11-23 23:26:01","1","Cambio de vista","El usuario ADMIN entró a la Vista de Respaldo");
INSERT INTO TBL_bitacora VALUES("1745","0","2022-11-23 23:27:48","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("1746","0","2022-11-24 00:35:22","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("1747","1","2022-11-24 00:35:22","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1748","14","2022-11-24 00:35:33","1","Cambio de vista","El usuario ADMIN entró a la Vista de Respaldo");
INSERT INTO TBL_bitacora VALUES("1749","14","2022-11-24 00:37:17","1","Cambio de vista","El usuario ADMIN entró a la Vista de Respaldo");
INSERT INTO TBL_bitacora VALUES("1750","14","2022-11-24 00:37:47","1","Cambio de vista","El usuario ADMIN entró a la Vista de Respaldo");
INSERT INTO TBL_bitacora VALUES("1751","0","2022-11-24 00:39:17","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("1752","1","2022-11-24 00:39:17","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1753","14","2022-11-24 00:39:24","1","Cambio de vista","El usuario ADMIN entró a la Vista de Respaldo");
INSERT INTO TBL_bitacora VALUES("1754","14","2022-11-24 00:41:52","1","Cambio de vista","El usuario ADMIN entró a la Vista de Respaldo");
INSERT INTO TBL_bitacora VALUES("1755","14","2022-11-24 00:42:20","1","Cambio de vista","El usuario ADMIN entró a la Vista de Respaldo");
INSERT INTO TBL_bitacora VALUES("1756","14","2022-11-24 00:44:26","1","Cambio de vista","El usuario ADMIN entró a la Vista de Respaldo");
INSERT INTO TBL_bitacora VALUES("1757","14","2022-11-24 00:46:35","1","Cambio de vista","El usuario ADMIN entró a la Vista de Respaldo");
INSERT INTO TBL_bitacora VALUES("1758","14","2022-11-24 00:47:07","1","Cambio de vista","El usuario ADMIN entró a la Vista de Respaldo");
INSERT INTO TBL_bitacora VALUES("1759","14","2022-11-24 00:47:12","1","Cambio de vista","El usuario ADMIN entró a la Vista de Respaldo");
INSERT INTO TBL_bitacora VALUES("1760","14","2022-11-24 00:49:05","1","Cambio de vista","El usuario ADMIN entró a la Vista de Respaldo");
INSERT INTO TBL_bitacora VALUES("1761","14","2022-11-24 00:49:08","1","Cambio de vista","El usuario ADMIN entró a la Vista de Respaldo");
INSERT INTO TBL_bitacora VALUES("1762","14","2022-11-24 00:49:52","1","Cambio de vista","El usuario ADMIN entró a la Vista de Respaldo");
INSERT INTO TBL_bitacora VALUES("1763","14","2022-11-24 00:51:10","1","Cambio de vista","El usuario ADMIN entró a la Vista de Respaldo");
INSERT INTO TBL_bitacora VALUES("1764","14","2022-11-24 00:51:16","1","Cambio de vista","El usuario ADMIN entró a la Vista de Respaldo");
INSERT INTO TBL_bitacora VALUES("1765","14","2022-11-24 00:52:01","1","Cambio de vista","El usuario ADMIN entró a la Vista de Respaldo");
INSERT INTO TBL_bitacora VALUES("1766","14","2022-11-24 00:53:40","1","Cambio de vista","El usuario ADMIN entró a la Vista de Respaldo");
INSERT INTO TBL_bitacora VALUES("1767","0","2022-11-24 07:10:27","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("1768","1","2022-11-24 07:10:28","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1769","3","2022-11-24 07:10:39","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1770","2","2022-11-24 07:10:45","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1771","2","2022-11-24 07:11:51","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1772","2","2022-11-24 07:13:48","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1773","2","2022-11-24 07:14:48","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1774","2","2022-11-24 07:17:11","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1775","2","2022-11-24 07:17:14","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1776","2","2022-11-24 07:18:00","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1777","2","2022-11-24 07:18:20","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1778","2","2022-11-24 07:18:37","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1779","0","2022-11-24 07:19:47","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("1780","1","2022-11-24 07:19:47","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1781","3","2022-11-24 07:19:56","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1782","2","2022-11-24 07:20:01","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1783","2","2022-11-24 07:20:20","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1784","3","2022-11-24 07:21:53","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1785","3","2022-11-24 07:22:09","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1786","3","2022-11-24 07:22:42","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1787","3","2022-11-24 07:22:57","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1788","3","2022-11-24 07:23:10","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1789","2","2022-11-24 07:23:37","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1790","2","2022-11-24 07:24:35","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1791","2","2022-11-24 07:25:15","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1792","2","2022-11-24 07:25:29","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1793","2","2022-11-24 07:26:02","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1794","2","2022-11-24 07:27:22","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1795","3","2022-11-24 07:27:27","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1796","13","2022-11-24 07:27:49","1","Cambio de vista","El usuario ADMIN entró a la Vista del Recetario");
INSERT INTO TBL_bitacora VALUES("1797","2","2022-11-24 07:48:00","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1798","2","2022-11-24 07:50:27","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1799","2","2022-11-24 07:50:37","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1800","2","2022-11-24 07:50:57","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1801","2","2022-11-24 07:51:04","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1802","2","2022-11-24 07:54:47","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1803","2","2022-11-24 07:59:00","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1804","2","2022-11-24 07:59:06","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1805","2","2022-11-24 08:01:34","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1806","2","2022-11-24 08:01:40","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1807","2","2022-11-24 08:04:29","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1808","2","2022-11-24 08:04:43","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1809","2","2022-11-24 08:05:42","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1810","2","2022-11-24 08:06:11","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1811","2","2022-11-24 08:06:19","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1812","2","2022-11-24 08:07:33","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1813","2","2022-11-24 08:07:50","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1814","2","2022-11-24 08:09:14","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1815","2","2022-11-24 08:09:21","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1816","2","2022-11-24 08:09:38","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1817","2","2022-11-24 08:10:38","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1818","2","2022-11-24 08:15:22","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1819","2","2022-11-24 08:15:27","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1820","2","2022-11-24 08:15:51","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1821","0","2022-11-24 08:21:34","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("1822","1","2022-11-24 08:21:35","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1823","2","2022-11-24 08:21:47","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1824","2","2022-11-24 08:22:08","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1825","2","2022-11-24 08:22:45","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1826","3","2022-11-24 08:27:28","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1827","3","2022-11-24 08:27:46","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1828","11","2022-11-24 08:48:48","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("1829","11","2022-11-24 09:19:14","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("1830","11","2022-11-24 09:25:05","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("1831","2","2022-11-24 09:25:49","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1832","0","2022-11-24 09:55:19","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("1833","1","2022-11-24 09:55:20","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1834","2","2022-11-24 09:56:02","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1835","2","2022-11-24 10:04:51","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1836","2","2022-11-24 10:06:48","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1837","12","2022-11-24 10:06:53","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("1838","3","2022-11-24 10:06:58","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1839","4","2022-11-24 10:07:03","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("1840","4","2022-11-24 10:07:08","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("1841","5","2022-11-24 10:07:12","1","Cambio de vista","El usuario ADMIN entró a la Vista de Movimientos de Inventario");
INSERT INTO TBL_bitacora VALUES("1842","13","2022-11-24 10:07:17","1","Cambio de vista","El usuario ADMIN entró a la Vista del Recetario");
INSERT INTO TBL_bitacora VALUES("1843","6","2022-11-24 10:07:23","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("1844","2","2022-11-24 10:07:36","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1845","2","2022-11-24 10:09:11","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1846","2","2022-11-24 10:09:56","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1847","2","2022-11-24 10:10:47","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1848","2","2022-11-24 10:22:55","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1849","2","2022-11-24 10:24:49","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1850","2","2022-11-24 10:25:02","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1851","2","2022-11-24 10:25:27","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1852","2","2022-11-24 10:25:50","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1853","2","2022-11-24 10:29:22","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1854","2","2022-11-24 10:29:44","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1855","12","2022-11-24 10:38:17","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("1856","12","2022-11-24 10:47:23","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("1857","12","2022-11-24 10:48:16","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("1858","2","2022-11-24 10:48:26","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1859","12","2022-11-24 10:48:36","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("1860","0","2022-11-24 10:48:55","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1861","0","2022-11-24 10:54:52","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1862","0","2022-11-24 10:55:05","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1863","0","2022-11-24 10:58:14","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1864","0","2022-11-24 10:58:26","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1865","0","2022-11-24 10:59:40","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1866","0","2022-11-24 11:00:10","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1867","0","2022-11-24 11:02:35","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1868","0","2022-11-24 11:02:48","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1869","0","2022-11-24 11:03:36","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1870","0","2022-11-24 11:03:40","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1871","0","2022-11-24 11:03:45","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1872","0","2022-11-24 11:03:48","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1873","0","2022-11-24 11:04:46","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1874","0","2022-11-24 11:05:00","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1875","0","2022-11-24 11:06:52","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1876","0","2022-11-24 11:06:56","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1877","0","2022-11-24 11:07:01","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1878","0","2022-11-24 11:07:05","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1879","0","2022-11-24 11:07:21","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1880","0","2022-11-24 11:07:33","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("1881","1","2022-11-24 11:26:32","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1882","12","2022-11-24 11:26:42","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("1883","2","2022-11-24 11:26:49","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1884","0","2022-11-24 11:27:55","1","Modificación de cliente","El usuario ADMIN actualizó un cliente en el sistema");
INSERT INTO TBL_bitacora VALUES("1885","2","2022-11-24 11:28:00","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1886","2","2022-11-24 11:45:37","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1887","2","2022-11-24 11:47:25","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1888","1","2022-11-24 11:47:27","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1889","2","2022-11-24 11:47:34","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1890","1","2022-11-24 11:47:36","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1891","2","2022-11-24 11:48:16","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1892","1","2022-11-24 11:48:18","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1893","2","2022-11-24 11:48:31","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1894","2","2022-11-24 11:48:43","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1895","2","2022-11-24 11:48:53","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1896","2","2022-11-24 11:49:09","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1897","2","2022-11-24 11:51:12","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1898","2","2022-11-24 11:52:11","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1899","2","2022-11-24 11:52:41","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1900","2","2022-11-24 11:53:17","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1901","2","2022-11-24 11:53:35","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1902","2","2022-11-24 11:54:07","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1903","2","2022-11-24 11:57:04","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1904","0","2022-11-24 11:57:49","1","Creación de Proveedor","El usuario ADMIN creó un nuevo proveedor en el sistema");
INSERT INTO TBL_bitacora VALUES("1905","2","2022-11-24 12:03:25","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1906","0","2022-11-24 12:03:47","1","Creación de Proveedor","El usuario ADMIN creó un nuevo proveedor en el sistema");
INSERT INTO TBL_bitacora VALUES("1907","2","2022-11-24 12:03:55","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1908","2","2022-11-24 12:04:56","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1909","0","2022-11-24 12:05:02","1","Proveedor eliminado","El usuario ADMIN eliminó un proveedor del sistema");
INSERT INTO TBL_bitacora VALUES("1910","2","2022-11-24 12:05:04","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1911","0","2022-11-24 12:05:31","1","Modificación de proveedor","El usuario ADMIN actualizó un proveedor en el sistema");
INSERT INTO TBL_bitacora VALUES("1912","2","2022-11-24 12:05:33","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1913","2","2022-11-24 12:08:24","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1914","1","2022-11-24 12:08:26","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1915","2","2022-11-24 12:08:58","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1916","2","2022-11-24 12:09:03","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1917","2","2022-11-24 12:09:09","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1918","2","2022-11-24 12:09:43","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1919","2","2022-11-24 12:09:49","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1920","2","2022-11-24 12:09:56","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1921","2","2022-11-24 12:10:09","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1922","2","2022-11-24 12:10:19","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1923","0","2022-11-24 12:13:30","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("1924","1","2022-11-24 12:13:31","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1925","1","2022-11-24 12:14:18","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1926","2","2022-11-24 12:14:27","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1927","2","2022-11-24 12:14:47","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1928","12","2022-11-24 12:17:25","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("1929","2","2022-11-24 12:17:29","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1930","15","2022-11-24 12:17:39","1","Cambio de vista","El usuario ADMIN entró a la Vista de Detalle de Compras");
INSERT INTO TBL_bitacora VALUES("1931","12","2022-11-24 12:17:47","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("1932","7","2022-11-24 12:18:12","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1933","7","2022-11-24 12:18:17","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1934","0","2022-11-24 12:19:02","1","Proveedor eliminado","El usuario ADMIN eliminó un proveedor del sistema");
INSERT INTO TBL_bitacora VALUES("1935","7","2022-11-24 12:19:01","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1936","2","2022-11-24 12:19:04","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1937","2","2022-11-24 12:20:49","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1938","12","2022-11-24 12:20:57","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("1939","15","2022-11-24 12:21:02","1","Cambio de vista","El usuario ADMIN entró a la Vista de Detalle de Compras");
INSERT INTO TBL_bitacora VALUES("1940","12","2022-11-24 12:21:06","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("1941","12","2022-11-24 12:21:39","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("1942","12","2022-11-24 12:21:51","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("1943","12","2022-11-24 12:21:59","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("1944","3","2022-11-24 12:22:17","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1945","2","2022-11-24 12:22:23","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1946","3","2022-11-24 12:22:40","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1947","7","2022-11-24 12:24:45","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1948","3","2022-11-24 12:25:34","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1949","4","2022-11-24 12:25:54","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("1950","5","2022-11-24 12:26:33","1","Cambio de vista","El usuario ADMIN entró a la Vista de Movimientos de Inventario");
INSERT INTO TBL_bitacora VALUES("1951","4","2022-11-24 12:26:40","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("1952","3","2022-11-24 12:26:46","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1953","6","2022-11-24 12:27:09","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("1954","6","2022-11-24 12:30:36","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("1955","6","2022-11-24 12:31:00","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("1956","6","2022-11-24 12:31:47","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("1957","6","2022-11-24 12:32:24","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("1958","7","2022-11-24 12:34:30","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1959","7","2022-11-24 12:35:19","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1960","11","2022-11-24 12:35:30","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("1961","6","2022-11-24 12:35:54","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("1962","6","2022-11-24 12:36:34","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("1963","11","2022-11-24 12:36:37","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("1964","7","2022-11-24 12:36:45","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1965","6","2022-11-24 12:40:00","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("1966","6","2022-11-24 12:41:53","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("1967","7","2022-11-24 12:41:58","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1968","7","2022-11-24 12:43:29","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1969","7","2022-11-24 12:46:07","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1970","7","2022-11-24 12:46:49","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1971","7","2022-11-24 12:50:27","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("1972","10","2022-11-24 13:07:28","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Preguntas");
INSERT INTO TBL_bitacora VALUES("1973","11","2022-11-24 13:09:15","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("1974","11","2022-11-24 13:10:02","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("1975","11","2022-11-24 13:10:27","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("1976","11","2022-11-24 13:11:37","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("1977","11","2022-11-24 13:12:19","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("1978","9","2022-11-24 13:12:40","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Parámetros");
INSERT INTO TBL_bitacora VALUES("1979","9","2022-11-24 13:13:23","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Parámetros");
INSERT INTO TBL_bitacora VALUES("1980","14","2022-11-24 13:27:01","1","Cambio de vista","El usuario ADMIN entró a la Vista de Respaldo");
INSERT INTO TBL_bitacora VALUES("1981","1","2022-11-24 13:27:18","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1982","2","2022-11-24 13:29:59","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1983","2","2022-11-24 13:30:09","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1984","1","2022-11-24 13:34:30","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("1985","3","2022-11-24 13:34:47","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1986","12","2022-11-24 13:34:58","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("1987","3","2022-11-24 13:41:58","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1988","3","2022-11-24 13:42:06","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1989","3","2022-11-24 13:42:16","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1990","3","2022-11-24 13:42:25","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1991","2","2022-11-24 13:44:25","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1992","2","2022-11-24 13:44:40","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("1993","0","2022-11-24 02:13:16","1","Agregar Producto","Se agrego un nuevo producto en el sistema");
INSERT INTO TBL_bitacora VALUES("1994","0","2022-11-24 02:13:50","1","Modificación de producto","Se actualizó un producto en el sistema");
INSERT INTO TBL_bitacora VALUES("1995","3","2022-11-24 14:28:41","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1996","3","2022-11-24 14:29:17","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1997","3","2022-11-24 14:29:20","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1998","3","2022-11-24 14:32:50","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("1999","3","2022-11-24 14:36:52","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2000","3","2022-11-24 14:37:48","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2001","3","2022-11-24 14:38:04","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2002","3","2022-11-24 14:40:09","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2003","3","2022-11-24 14:41:36","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2004","3","2022-11-24 14:41:39","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2005","0","2022-11-24 14:45:06","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("2006","1","2022-11-24 14:45:07","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2007","3","2022-11-24 14:45:16","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2008","3","2022-11-24 14:45:33","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2009","3","2022-11-24 14:48:06","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2010","3","2022-11-24 14:48:27","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2011","3","2022-11-24 14:49:27","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2012","3","2022-11-24 14:49:43","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2013","3","2022-11-24 14:51:35","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2014","3","2022-11-24 14:56:50","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2015","12","2022-11-24 14:56:54","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2016","12","2022-11-24 14:57:49","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2017","15","2022-11-24 14:57:54","1","Cambio de vista","El usuario ADMIN entró a la Vista de Detalle de Compras");
INSERT INTO TBL_bitacora VALUES("2018","4","2022-11-24 14:57:59","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2019","5","2022-11-24 14:58:06","1","Cambio de vista","El usuario ADMIN entró a la Vista de Movimientos de Inventario");
INSERT INTO TBL_bitacora VALUES("2020","12","2022-11-24 15:04:11","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2021","5","2022-11-24 15:05:23","1","Cambio de vista","El usuario ADMIN entró a la Vista de Movimientos de Inventario");
INSERT INTO TBL_bitacora VALUES("2022","4","2022-11-24 15:05:31","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2023","12","2022-11-24 15:05:42","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2024","4","2022-11-24 15:06:03","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2025","5","2022-11-24 15:06:08","1","Cambio de vista","El usuario ADMIN entró a la Vista de Movimientos de Inventario");
INSERT INTO TBL_bitacora VALUES("2026","5","2022-11-24 15:14:19","1","Cambio de vista","El usuario ADMIN entró a la Vista de Movimientos de Inventario");
INSERT INTO TBL_bitacora VALUES("2027","12","2022-11-24 15:14:22","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2028","1","2022-11-24 15:23:42","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2029","12","2022-11-24 15:23:48","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2030","1","2022-11-24 15:33:57","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2031","0","2022-11-24 03:43:06","1","Agregar Producto","Se agrego un nuevo producto en el sistema");
INSERT INTO TBL_bitacora VALUES("2032","0","2022-11-24 15:56:40","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("2033","0","2022-11-24 15:56:50","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("2034","1","2022-11-24 15:56:50","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2035","0","2022-11-24 15:57:03","1","Producto Eliminado","El usuario ADMIN Elimino un producto del sistema");
INSERT INTO TBL_bitacora VALUES("2036","0","2022-11-24 04:04:42","1","Modificación de producto","Se actualizó un producto en el sistema");
INSERT INTO TBL_bitacora VALUES("2037","0","2022-11-24 17:24:30","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("2038","1","2022-11-24 17:24:31","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2039","10","2022-11-24 17:32:26","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Preguntas");
INSERT INTO TBL_bitacora VALUES("2040","10","2022-11-24 18:03:13","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Preguntas");
INSERT INTO TBL_bitacora VALUES("2041","10","2022-11-24 18:03:45","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Preguntas");
INSERT INTO TBL_bitacora VALUES("2042","10","2022-11-24 18:03:58","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Preguntas");
INSERT INTO TBL_bitacora VALUES("2043","10","2022-11-24 18:04:13","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Preguntas");
INSERT INTO TBL_bitacora VALUES("2044","10","2022-11-24 18:08:04","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Preguntas");
INSERT INTO TBL_bitacora VALUES("2045","10","2022-11-24 18:10:40","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Preguntas");
INSERT INTO TBL_bitacora VALUES("2046","10","2022-11-24 18:18:47","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Preguntas");
INSERT INTO TBL_bitacora VALUES("2047","13","2022-11-24 18:36:38","1","Cambio de vista","El usuario ADMIN entró a la Vista del Recetario");
INSERT INTO TBL_bitacora VALUES("2048","13","2022-11-24 18:38:47","1","Cambio de vista","El usuario ADMIN entró a la Vista del Recetario");
INSERT INTO TBL_bitacora VALUES("2049","13","2022-11-24 18:39:05","1","Cambio de vista","El usuario ADMIN entró a la Vista del Recetario");
INSERT INTO TBL_bitacora VALUES("2050","13","2022-11-24 18:41:16","1","Cambio de vista","El usuario ADMIN entró a la Vista del Recetario");
INSERT INTO TBL_bitacora VALUES("2051","13","2022-11-24 18:41:48","1","Cambio de vista","El usuario ADMIN entró a la Vista del Recetario");
INSERT INTO TBL_bitacora VALUES("2052","0","2022-11-24 18:44:25","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("2053","1","2022-11-24 18:44:26","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2054","7","2022-11-24 18:44:37","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2055","3","2022-11-24 18:48:27","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2056","3","2022-11-24 18:56:11","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2057","2","2022-11-24 18:57:04","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2058","2","2022-11-24 18:57:44","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2059","3","2022-11-24 18:58:20","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2060","3","2022-11-24 18:58:38","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2061","10","2022-11-24 18:58:51","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Preguntas");
INSERT INTO TBL_bitacora VALUES("2062","10","2022-11-24 19:01:38","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Preguntas");
INSERT INTO TBL_bitacora VALUES("2063","3","2022-11-24 19:02:16","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2064","2","2022-11-24 19:02:29","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2065","7","2022-11-24 19:02:35","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2066","2","2022-11-24 19:02:40","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2067","7","2022-11-24 19:03:03","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2068","9","2022-11-24 19:03:12","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Parámetros");
INSERT INTO TBL_bitacora VALUES("2069","9","2022-11-24 19:03:21","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Parámetros");
INSERT INTO TBL_bitacora VALUES("2070","2","2022-11-24 19:05:51","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2071","2","2022-11-24 19:06:08","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2072","2","2022-11-24 19:06:19","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2073","2","2022-11-24 19:06:29","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2074","2","2022-11-24 19:07:27","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2075","9","2022-11-24 19:09:16","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Parámetros");
INSERT INTO TBL_bitacora VALUES("2076","2","2022-11-24 19:10:41","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2077","3","2022-11-24 19:10:58","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2078","2","2022-11-24 19:11:05","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2079","2","2022-11-24 19:11:21","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2080","2","2022-11-24 19:11:46","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2081","2","2022-11-24 19:12:38","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2082","11","2022-11-24 19:14:20","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("2083","11","2022-11-24 19:15:39","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("2084","11","2022-11-24 19:15:59","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("2085","10","2022-11-24 19:17:52","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Preguntas");
INSERT INTO TBL_bitacora VALUES("2086","10","2022-11-24 19:18:05","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Preguntas");
INSERT INTO TBL_bitacora VALUES("2087","10","2022-11-24 19:18:18","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Preguntas");
INSERT INTO TBL_bitacora VALUES("2088","2","2022-11-24 19:21:56","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2089","9","2022-11-24 19:22:07","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Parámetros");
INSERT INTO TBL_bitacora VALUES("2090","9","2022-11-24 19:23:12","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Parámetros");
INSERT INTO TBL_bitacora VALUES("2091","9","2022-11-24 19:25:51","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Parámetros");
INSERT INTO TBL_bitacora VALUES("2092","1","2022-11-24 19:25:56","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2093","2","2022-11-24 19:26:06","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2094","2","2022-11-24 19:26:20","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2095","2","2022-11-24 19:26:34","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2096","11","2022-11-24 19:26:51","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("2097","11","2022-11-24 19:27:13","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("2098","10","2022-11-24 19:27:33","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Preguntas");
INSERT INTO TBL_bitacora VALUES("2099","10","2022-11-24 19:28:04","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Preguntas");
INSERT INTO TBL_bitacora VALUES("2100","10","2022-11-24 19:28:16","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Preguntas");
INSERT INTO TBL_bitacora VALUES("2101","2","2022-11-24 19:29:11","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2102","2","2022-11-24 19:29:27","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2103","2","2022-11-24 19:29:44","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2104","13","2022-11-24 19:29:53","1","Cambio de vista","El usuario ADMIN entró a la Vista del Recetario");
INSERT INTO TBL_bitacora VALUES("2105","13","2022-11-24 19:30:08","1","Cambio de vista","El usuario ADMIN entró a la Vista del Recetario");
INSERT INTO TBL_bitacora VALUES("2106","3","2022-11-24 19:30:21","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2107","3","2022-11-24 19:30:36","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2108","3","2022-11-24 19:30:54","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2109","14","2022-11-24 19:51:59","1","Cambio de vista","El usuario ADMIN entró a la Vista de Respaldo");
INSERT INTO TBL_bitacora VALUES("2110","12","2022-11-24 19:52:07","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2111","6","2022-11-24 19:53:17","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2112","7","2022-11-24 19:53:28","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2113","11","2022-11-24 19:53:37","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("2114","9","2022-11-24 19:54:13","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Parámetros");
INSERT INTO TBL_bitacora VALUES("2115","10","2022-11-24 19:54:24","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Preguntas");
INSERT INTO TBL_bitacora VALUES("2116","10","2022-11-24 19:55:11","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Preguntas");
INSERT INTO TBL_bitacora VALUES("2117","0","2022-11-24 20:49:52","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("2118","1","2022-11-24 20:49:53","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2119","2","2022-11-24 20:50:42","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2120","2","2022-11-24 20:56:19","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2121","0","2022-11-24 20:59:36","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("2122","1","2022-11-24 20:59:37","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2123","2","2022-11-24 21:00:43","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2124","2","2022-11-24 21:04:20","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2125","1","2022-11-24 21:05:49","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2126","0","2022-11-24 21:07:49","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("2127","1","2022-11-24 21:07:49","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2128","12","2022-11-24 21:09:46","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2129","12","2022-11-24 21:12:30","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2130","12","2022-11-24 21:13:22","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2131","12","2022-11-24 21:13:34","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2132","12","2022-11-24 21:13:50","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2133","1","2022-11-24 21:15:02","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2134","2","2022-11-24 21:15:08","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2135","12","2022-11-24 21:15:13","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2136","3","2022-11-24 21:15:19","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2137","4","2022-11-24 21:15:24","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2138","5","2022-11-24 21:15:29","1","Cambio de vista","El usuario ADMIN entró a la Vista de Movimientos de Inventario");
INSERT INTO TBL_bitacora VALUES("2139","13","2022-11-24 21:15:36","1","Cambio de vista","El usuario ADMIN entró a la Vista del Recetario");
INSERT INTO TBL_bitacora VALUES("2140","6","2022-11-24 21:15:43","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2141","7","2022-11-24 21:15:50","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2142","8","2022-11-24 21:15:58","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Roles");
INSERT INTO TBL_bitacora VALUES("2143","11","2022-11-24 21:16:06","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("2144","12","2022-11-24 21:17:41","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2145","12","2022-11-24 21:18:44","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2146","12","2022-11-24 21:18:54","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2147","2","2022-11-24 21:19:14","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2148","2","2022-11-24 21:19:25","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2149","2","2022-11-24 21:19:29","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2150","12","2022-11-24 21:26:47","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2151","12","2022-11-24 21:30:47","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2152","0","2022-11-24 21:30:58","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("2153","1","2022-11-24 21:30:58","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2154","0","2022-11-24 21:37:04","1","Nuevo pedido","El usuario ADMIN registró un pedido en el sistema");
INSERT INTO TBL_bitacora VALUES("2155","12","2022-11-24 21:38:48","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2156","12","2022-11-24 21:41:53","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2157","12","2022-11-24 21:42:03","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2158","12","2022-11-24 21:47:35","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2159","1","2022-11-24 21:52:47","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2160","12","2022-11-24 21:53:43","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2161","12","2022-11-24 21:55:59","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2162","12","2022-11-24 22:23:49","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2163","12","2022-11-24 22:24:20","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2164","12","2022-11-24 22:24:32","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2165","12","2022-11-24 22:25:10","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2166","12","2022-11-24 22:25:42","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2167","2","2022-11-24 22:32:14","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2168","1","2022-11-24 22:32:17","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2169","2","2022-11-24 22:32:26","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2170","2","2022-11-24 22:32:53","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2171","2","2022-11-24 22:33:49","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2172","2","2022-11-24 22:34:07","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2173","7","2022-11-24 22:34:15","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2174","1","2022-11-24 22:35:27","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2175","2","2022-11-24 22:35:35","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2176","2","2022-11-24 22:35:39","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2177","12","2022-11-24 22:35:44","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2178","3","2022-11-24 22:35:48","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2179","2","2022-11-24 22:36:29","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2180","6","2022-11-24 22:36:37","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2181","7","2022-11-24 22:36:42","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2182","8","2022-11-24 22:36:49","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Roles");
INSERT INTO TBL_bitacora VALUES("2183","11","2022-11-24 22:37:01","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("2184","7","2022-11-24 22:37:05","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2185","9","2022-11-24 22:37:08","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Parámetros");
INSERT INTO TBL_bitacora VALUES("2186","7","2022-11-24 22:37:36","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2187","0","2022-11-24 22:38:13","1","Modificación de objeto","El usuario ADMIN actualizó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("2188","7","2022-11-24 22:38:16","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2189","0","2022-11-24 22:38:42","1","Modificación de objeto","El usuario ADMIN actualizó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("2190","7","2022-11-24 22:38:46","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2191","0","2022-11-24 22:39:31","1","Modificación de objeto","El usuario ADMIN actualizó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("2192","7","2022-11-24 22:39:34","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2193","12","2022-11-24 22:40:06","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2194","7","2022-11-24 22:40:07","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2195","2","2022-11-24 22:40:12","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2196","7","2022-11-24 22:41:20","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2197","12","2022-11-24 22:41:37","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2198","0","2022-11-24 22:41:52","1","Modificación de objeto","El usuario ADMIN actualizó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("2199","7","2022-11-24 22:41:56","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2200","12","2022-11-24 22:42:04","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2201","12","2022-11-24 22:42:27","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2202","0","2022-11-24 22:42:30","1","Modificación de objeto","El usuario ADMIN actualizó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("2203","0","2022-11-24 22:42:46","1","Modificación de objeto","El usuario ADMIN actualizó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("2204","7","2022-11-24 22:42:49","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2205","12","2022-11-24 22:42:50","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2206","7","2022-11-24 22:43:22","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2207","0","2022-11-24 22:43:44","1","Modificación de objeto","El usuario ADMIN actualizó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("2208","7","2022-11-24 22:43:47","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2209","7","2022-11-24 22:45:43","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2210","4","2022-11-24 22:46:06","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2211","7","2022-11-24 22:46:13","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2212","0","2022-11-24 22:46:29","1","Modificación de objeto","El usuario ADMIN actualizó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("2213","7","2022-11-24 22:46:32","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2214","7","2022-11-24 22:46:44","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2215","8","2022-11-24 22:47:55","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Roles");
INSERT INTO TBL_bitacora VALUES("2216","8","2022-11-24 22:47:59","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Roles");
INSERT INTO TBL_bitacora VALUES("2217","8","2022-11-24 22:50:25","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Roles");
INSERT INTO TBL_bitacora VALUES("2218","4","2022-11-24 22:51:15","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2219","12","2022-11-24 22:51:20","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2220","12","2022-11-24 22:51:38","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2221","12","2022-11-24 22:53:32","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2222","12","2022-11-24 22:53:35","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2223","12","2022-11-24 22:53:44","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2224","2","2022-11-24 22:53:48","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2225","8","2022-11-24 22:55:04","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Roles");
INSERT INTO TBL_bitacora VALUES("2226","1","2022-11-24 22:55:11","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2227","1","2022-11-24 22:55:33","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2228","1","2022-11-24 22:56:38","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2229","8","2022-11-24 22:58:22","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Roles");
INSERT INTO TBL_bitacora VALUES("2230","12","2022-11-24 22:59:38","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2231","11","2022-11-24 22:59:45","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("2232","12","2022-11-24 22:59:45","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2233","11","2022-11-24 23:00:06","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("2234","8","2022-11-24 23:00:42","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Roles");
INSERT INTO TBL_bitacora VALUES("2235","6","2022-11-24 23:00:51","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2236","6","2022-11-24 23:00:55","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2237","12","2022-11-24 23:01:42","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2238","12","2022-11-24 23:01:45","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2239","6","2022-11-24 23:03:30","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2240","6","2022-11-24 23:03:40","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2241","12","2022-11-24 23:06:31","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2242","12","2022-11-24 23:06:46","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2243","12","2022-11-24 23:07:26","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2244","1","2022-11-24 23:07:31","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2245","12","2022-11-24 23:07:39","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2246","12","2022-11-24 23:08:37","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2247","12","2022-11-24 23:10:32","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2248","12","2022-11-24 23:10:37","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2249","12","2022-11-24 23:10:44","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2250","12","2022-11-24 23:10:49","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2251","12","2022-11-24 23:11:08","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2252","0","2022-11-24 23:11:36","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("2253","1","2022-11-24 23:11:36","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2254","12","2022-11-24 23:12:17","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2255","6","2022-11-24 23:12:25","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2256","12","2022-11-24 23:12:35","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2257","12","2022-11-24 23:13:38","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2258","12","2022-11-24 23:14:04","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2259","12","2022-11-24 23:14:24","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2260","12","2022-11-24 23:14:40","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2261","12","2022-11-24 23:16:18","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2262","12","2022-11-24 23:17:51","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2263","12","2022-11-24 23:17:54","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2264","6","2022-11-24 23:20:15","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2265","4","2022-11-24 23:20:26","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2266","3","2022-11-24 23:20:35","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2267","4","2022-11-24 23:20:42","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2268","5","2022-11-24 23:20:52","1","Cambio de vista","El usuario ADMIN entró a la Vista de Movimientos de Inventario");
INSERT INTO TBL_bitacora VALUES("2269","4","2022-11-24 23:22:25","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2270","4","2022-11-24 23:23:09","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2271","6","2022-11-24 23:28:07","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2272","6","2022-11-24 23:28:20","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2273","6","2022-11-24 23:30:00","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2274","4","2022-11-24 23:30:16","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2275","4","2022-11-24 23:34:47","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2276","4","2022-11-24 23:34:51","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2277","4","2022-11-24 23:35:25","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2278","12","2022-11-24 23:35:51","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2279","12","2022-11-24 23:35:56","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2280","5","2022-11-24 23:37:17","1","Cambio de vista","El usuario ADMIN entró a la Vista de Movimientos de Inventario");
INSERT INTO TBL_bitacora VALUES("2281","12","2022-11-24 23:37:20","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2282","12","2022-11-24 23:38:01","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2283","12","2022-11-24 23:38:19","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2284","4","2022-11-24 23:39:01","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2285","12","2022-11-24 23:39:31","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2286","12","2022-11-24 23:39:44","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2287","12","2022-11-24 23:39:47","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2288","5","2022-11-24 23:40:59","1","Cambio de vista","El usuario ADMIN entró a la Vista de Movimientos de Inventario");
INSERT INTO TBL_bitacora VALUES("2289","12","2022-11-24 23:41:20","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2290","12","2022-11-24 23:44:42","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2291","4","2022-11-24 23:46:54","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2292","4","2022-11-24 23:47:14","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2293","12","2022-11-24 23:47:27","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2294","5","2022-11-24 23:48:52","1","Cambio de vista","El usuario ADMIN entró a la Vista de Movimientos de Inventario");
INSERT INTO TBL_bitacora VALUES("2295","12","2022-11-24 23:49:35","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2296","15","2022-11-24 23:49:38","1","Cambio de vista","El usuario ADMIN entró a la Vista de Detalle de Compras");
INSERT INTO TBL_bitacora VALUES("2297","12","2022-11-24 23:49:53","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2298","12","2022-11-24 23:50:11","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2299","12","2022-11-24 23:50:34","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2300","15","2022-11-24 23:50:38","1","Cambio de vista","El usuario ADMIN entró a la Vista de Detalle de Compras");
INSERT INTO TBL_bitacora VALUES("2301","12","2022-11-24 23:51:57","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2302","12","2022-11-24 23:52:30","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2303","12","2022-11-24 23:53:38","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2304","5","2022-11-24 23:55:17","1","Cambio de vista","El usuario ADMIN entró a la Vista de Movimientos de Inventario");
INSERT INTO TBL_bitacora VALUES("2305","12","2022-11-24 23:55:33","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2306","2","2022-11-24 23:55:52","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2307","12","2022-11-24 23:56:02","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2308","15","2022-11-24 23:56:06","1","Cambio de vista","El usuario ADMIN entró a la Vista de Detalle de Compras");
INSERT INTO TBL_bitacora VALUES("2309","2","2022-11-24 23:56:13","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2310","12","2022-11-24 23:56:15","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2311","15","2022-11-24 23:56:23","1","Cambio de vista","El usuario ADMIN entró a la Vista de Detalle de Compras");
INSERT INTO TBL_bitacora VALUES("2312","2","2022-11-24 23:56:30","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2313","2","2022-11-24 23:56:40","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2314","2","2022-11-24 23:56:52","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2315","3","2022-11-24 23:57:00","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2316","3","2022-11-24 23:57:43","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2317","3","2022-11-24 23:58:29","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2318","4","2022-11-24 23:58:37","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2319","2","2022-11-24 23:59:51","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2320","4","2022-11-25 00:00:02","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2321","4","2022-11-25 00:00:16","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2322","5","2022-11-25 00:00:23","1","Cambio de vista","El usuario ADMIN entró a la Vista de Movimientos de Inventario");
INSERT INTO TBL_bitacora VALUES("2323","5","2022-11-25 00:00:35","1","Cambio de vista","El usuario ADMIN entró a la Vista de Movimientos de Inventario");
INSERT INTO TBL_bitacora VALUES("2324","13","2022-11-25 00:00:42","1","Cambio de vista","El usuario ADMIN entró a la Vista del Recetario");
INSERT INTO TBL_bitacora VALUES("2325","13","2022-11-25 00:01:04","1","Cambio de vista","El usuario ADMIN entró a la Vista del Recetario");
INSERT INTO TBL_bitacora VALUES("2326","6","2022-11-25 00:02:05","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2327","12","2022-11-25 00:02:13","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2328","6","2022-11-25 00:02:18","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2329","7","2022-11-25 00:02:28","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2330","12","2022-11-25 00:02:32","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2331","7","2022-11-25 00:02:41","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2332","8","2022-11-25 00:02:52","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Roles");
INSERT INTO TBL_bitacora VALUES("2333","11","2022-11-25 00:03:02","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("2334","9","2022-11-25 00:03:14","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Parámetros");
INSERT INTO TBL_bitacora VALUES("2335","12","2022-11-25 00:03:25","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2336","10","2022-11-25 00:03:27","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Preguntas");
INSERT INTO TBL_bitacora VALUES("2337","12","2022-11-25 00:03:40","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2338","1","2022-11-25 00:04:26","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2339","12","2022-11-25 00:05:03","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2340","12","2022-11-25 00:05:04","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2341","12","2022-11-25 00:05:07","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2342","12","2022-11-25 00:05:46","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2343","12","2022-11-25 00:06:19","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2344","15","2022-11-25 00:06:26","1","Cambio de vista","El usuario ADMIN entró a la Vista de Detalle de Compras");
INSERT INTO TBL_bitacora VALUES("2345","12","2022-11-25 00:06:55","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2346","12","2022-11-25 00:07:55","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2347","15","2022-11-25 00:08:01","1","Cambio de vista","El usuario ADMIN entró a la Vista de Detalle de Compras");
INSERT INTO TBL_bitacora VALUES("2348","12","2022-11-25 00:08:02","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2349","12","2022-11-25 00:08:03","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2350","15","2022-11-25 00:08:08","1","Cambio de vista","El usuario ADMIN entró a la Vista de Detalle de Compras");
INSERT INTO TBL_bitacora VALUES("2351","12","2022-11-25 00:08:56","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2352","12","2022-11-25 00:10:21","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2353","12","2022-11-25 00:10:59","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2354","15","2022-11-25 00:11:14","1","Cambio de vista","El usuario ADMIN entró a la Vista de Detalle de Compras");
INSERT INTO TBL_bitacora VALUES("2355","12","2022-11-25 00:12:44","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2356","12","2022-11-25 00:14:30","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2357","12","2022-11-25 00:14:46","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2358","12","2022-11-25 00:15:18","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2359","15","2022-11-25 00:18:38","1","Cambio de vista","El usuario ADMIN entró a la Vista de Detalle de Compras");
INSERT INTO TBL_bitacora VALUES("2360","12","2022-11-25 00:18:48","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2361","12","2022-11-25 00:19:18","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2362","12","2022-11-25 00:19:19","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2363","12","2022-11-25 00:20:23","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2364","12","2022-11-25 00:23:01","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2365","15","2022-11-25 00:24:50","1","Cambio de vista","El usuario ADMIN entró a la Vista de Detalle de Compras");
INSERT INTO TBL_bitacora VALUES("2366","12","2022-11-25 00:31:44","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2367","12","2022-11-25 00:32:42","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2368","12","2022-11-25 00:32:45","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2369","12","2022-11-25 00:33:22","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2370","12","2022-11-25 00:34:21","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2371","12","2022-11-25 00:38:44","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2372","12","2022-11-25 00:40:29","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2373","12","2022-11-25 00:41:10","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2374","12","2022-11-25 00:43:55","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2375","12","2022-11-25 00:44:41","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2376","12","2022-11-25 00:45:38","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2377","12","2022-11-25 00:50:19","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2378","12","2022-11-25 00:50:58","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2379","12","2022-11-25 00:52:06","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2380","12","2022-11-25 00:52:49","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2381","12","2022-11-25 00:54:42","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2382","12","2022-11-25 00:55:53","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2383","12","2022-11-25 00:55:59","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2384","12","2022-11-25 00:57:05","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2385","12","2022-11-25 00:57:48","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2386","12","2022-11-25 00:58:13","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2387","12","2022-11-25 00:58:43","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2388","12","2022-11-25 00:59:02","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2389","12","2022-11-25 00:59:19","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2390","12","2022-11-25 00:59:23","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2391","2","2022-11-25 01:01:36","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2392","12","2022-11-25 01:01:41","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2393","2","2022-11-25 01:01:45","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2394","2","2022-11-25 01:01:52","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2395","12","2022-11-25 01:01:58","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2396","12","2022-11-25 01:02:12","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2397","12","2022-11-25 01:02:19","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2398","12","2022-11-25 01:02:29","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2399","12","2022-11-25 01:02:40","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2400","12","2022-11-25 01:02:45","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2401","12","2022-11-25 01:02:46","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2402","12","2022-11-25 01:02:51","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2403","12","2022-11-25 01:04:00","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2404","3","2022-11-25 01:04:15","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2405","4","2022-11-25 01:04:21","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2406","3","2022-11-25 01:04:26","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2407","4","2022-11-25 01:04:32","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2408","3","2022-11-25 01:04:43","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2409","12","2022-11-25 01:05:13","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2410","1","2022-11-25 01:11:15","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2411","0","2022-11-25 01:11:53","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("2412","1","2022-11-25 01:11:53","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2413","12","2022-11-25 01:12:17","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2414","12","2022-11-25 01:12:43","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2415","0","2022-11-25 01:17:04","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("2416","0","2022-11-25 01:17:05","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2417","0","2022-11-25 01:22:53","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("2418","1","2022-11-25 01:22:54","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2419","14","2022-11-25 01:23:12","1","Cambio de vista","El usuario ADMIN entró a la Vista de Respaldo");
INSERT INTO TBL_bitacora VALUES("2420","14","2022-11-25 01:25:15","1","Cambio de vista","El usuario ADMIN entró a la Vista de Respaldo");
INSERT INTO TBL_bitacora VALUES("2421","14","2022-11-25 01:25:24","1","Cambio de vista","El usuario ADMIN entró a la Vista de Respaldo");
INSERT INTO TBL_bitacora VALUES("2422","2","2022-11-25 01:25:39","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2423","12","2022-11-25 01:25:55","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2424","12","2022-11-25 01:26:10","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2425","2","2022-11-25 01:26:25","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2426","2","2022-11-25 01:26:50","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2427","12","2022-11-25 02:44:31","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2428","12","2022-11-25 02:45:34","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2429","12","2022-11-25 02:45:59","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2430","12","2022-11-25 02:46:14","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2431","12","2022-11-25 02:49:44","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2432","12","2022-11-25 02:50:11","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2433","12","2022-11-25 02:50:33","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2434","12","2022-11-25 02:50:54","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2435","12","2022-11-25 03:03:48","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2436","1","2022-11-25 03:03:50","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2437","12","2022-11-25 04:10:27","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2438","12","2022-11-25 04:10:31","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2439","1","2022-11-25 04:42:24","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2440","1","2022-11-25 04:43:36","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2441","12","2022-11-25 04:44:27","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2442","12","2022-11-25 04:44:42","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2443","12","2022-11-25 04:46:12","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2444","12","2022-11-25 04:50:56","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2445","1","2022-11-25 04:50:58","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2446","2","2022-11-25 04:51:04","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2447","2","2022-11-25 04:51:19","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2448","2","2022-11-25 04:51:25","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2449","2","2022-11-25 04:54:46","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2450","12","2022-11-25 04:54:55","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2451","3","2022-11-25 05:03:31","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2452","0","2022-11-25 05:03:53","1","Creación de Insumo","El usuario ADMIN creó un nuevo insumo en el sistema");
INSERT INTO TBL_bitacora VALUES("2453","3","2022-11-25 05:03:55","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2454","4","2022-11-25 05:04:00","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2455","3","2022-11-25 05:04:07","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2456","4","2022-11-25 05:04:12","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2457","4","2022-11-25 05:07:42","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2458","4","2022-11-25 05:09:53","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2459","5","2022-11-25 05:09:57","1","Cambio de vista","El usuario ADMIN entró a la Vista de Movimientos de Inventario");
INSERT INTO TBL_bitacora VALUES("2460","5","2022-11-25 05:10:20","1","Cambio de vista","El usuario ADMIN entró a la Vista de Movimientos de Inventario");
INSERT INTO TBL_bitacora VALUES("2461","12","2022-11-25 05:10:24","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2462","12","2022-11-25 05:10:40","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2463","5","2022-11-25 05:13:29","1","Cambio de vista","El usuario ADMIN entró a la Vista de Movimientos de Inventario");
INSERT INTO TBL_bitacora VALUES("2464","5","2022-11-25 05:17:06","1","Cambio de vista","El usuario ADMIN entró a la Vista de Movimientos de Inventario");
INSERT INTO TBL_bitacora VALUES("2465","12","2022-11-25 05:17:17","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2466","12","2022-11-25 05:17:25","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2467","12","2022-11-25 05:17:31","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2468","2","2022-11-25 05:17:42","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2469","4","2022-11-25 05:19:03","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2470","4","2022-11-25 05:19:35","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2471","4","2022-11-25 05:19:44","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2472","5","2022-11-25 05:19:47","1","Cambio de vista","El usuario ADMIN entró a la Vista de Movimientos de Inventario");
INSERT INTO TBL_bitacora VALUES("2473","4","2022-11-25 05:20:29","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2474","5","2022-11-25 05:20:33","1","Cambio de vista","El usuario ADMIN entró a la Vista de Movimientos de Inventario");
INSERT INTO TBL_bitacora VALUES("2475","4","2022-11-25 05:20:36","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2476","2","2022-11-25 05:21:49","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2477","6","2022-11-25 05:22:52","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2478","6","2022-11-25 05:28:28","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2479","7","2022-11-25 05:28:37","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2480","6","2022-11-25 05:28:41","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2481","8","2022-11-25 05:28:50","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Roles");
INSERT INTO TBL_bitacora VALUES("2482","11","2022-11-25 05:28:59","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("2483","9","2022-11-25 05:29:07","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Parámetros");
INSERT INTO TBL_bitacora VALUES("2484","12","2022-11-25 05:29:16","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2485","12","2022-11-25 05:29:27","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2486","12","2022-11-25 05:30:15","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2487","12","2022-11-25 05:31:18","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2488","12","2022-11-25 05:31:57","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2489","0","2022-11-25 05:32:02","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("2490","0","2022-11-25 05:32:35","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("2491","1","2022-11-25 05:32:36","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2492","11","2022-11-25 05:32:46","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("2493","0","2022-11-25 05:33:12","1","Creación de Permiso","El usuario ADMIN creó un nuevo permiso en el sistema");
INSERT INTO TBL_bitacora VALUES("2494","11","2022-11-25 05:33:14","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("2495","0","2022-11-25 05:33:28","1","Creación de Permiso","El usuario ADMIN creó un nuevo permiso en el sistema");
INSERT INTO TBL_bitacora VALUES("2496","11","2022-11-25 05:33:29","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("2497","0","2022-11-25 05:33:49","1","Creación de Permiso","El usuario ADMIN creó un nuevo permiso en el sistema");
INSERT INTO TBL_bitacora VALUES("2498","11","2022-11-25 05:33:51","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("2499","0","2022-11-25 05:34:05","1","Creación de Permiso","El usuario ADMIN creó un nuevo permiso en el sistema");
INSERT INTO TBL_bitacora VALUES("2500","11","2022-11-25 05:34:07","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("2501","0","2022-11-25 05:34:11","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("2502","0","2022-11-25 05:34:42","6","Inicio de sesion","El usuario JUAN entró al sistema");
INSERT INTO TBL_bitacora VALUES("2503","1","2022-11-25 05:34:43","6","Cambio de vista","El usuario JUAN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2504","2","2022-11-25 05:34:49","6","Cambio de vista","El usuario JUAN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2505","1","2022-11-25 05:34:57","6","Cambio de vista","El usuario JUAN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2506","1","2022-11-25 05:35:02","6","Cambio de vista","El usuario JUAN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2507","1","2022-11-25 05:35:10","6","Cambio de vista","El usuario JUAN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2508","2","2022-11-25 05:35:14","6","Cambio de vista","El usuario JUAN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2509","4","2022-11-25 05:35:21","6","Cambio de vista","El usuario JUAN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2510","5","2022-11-25 05:35:26","6","Cambio de vista","El usuario JUAN entró a la Vista de Movimientos de Inventario");
INSERT INTO TBL_bitacora VALUES("2511","0","2022-11-25 05:35:31","6","Cierre de sesión","El usuario JUAN salió del sistema");
INSERT INTO TBL_bitacora VALUES("2512","0","2022-11-25 05:35:39","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("2513","1","2022-11-25 05:35:39","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2514","11","2022-11-25 05:35:52","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("2515","0","2022-11-25 05:36:49","1","Creación de Permiso","El usuario ADMIN creó un nuevo permiso en el sistema");
INSERT INTO TBL_bitacora VALUES("2516","11","2022-11-25 05:36:51","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("2517","11","2022-11-25 05:37:22","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("2518","0","2022-11-25 05:38:11","1","Creación de Permiso","El usuario ADMIN creó un nuevo permiso en el sistema");
INSERT INTO TBL_bitacora VALUES("2519","11","2022-11-25 05:38:12","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("2520","0","2022-11-25 05:38:30","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("2521","0","2022-11-25 09:05:04","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("2522","1","2022-11-25 09:05:04","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2523","12","2022-11-25 09:18:42","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2524","1","2022-11-25 09:18:55","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2525","2","2022-11-25 09:19:12","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2526","2","2022-11-25 09:26:55","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2527","2","2022-11-25 09:27:02","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2528","0","2022-11-25 09:28:07","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("2529","1","2022-11-25 09:28:07","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2530","2","2022-11-25 09:28:17","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2531","2","2022-11-25 09:28:24","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2532","2","2022-11-25 09:28:35","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2533","2","2022-11-25 09:28:42","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2534","2","2022-11-25 09:28:50","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2535","2","2022-11-25 09:29:00","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2536","3","2022-11-25 09:29:06","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2537","0","2022-11-25 09:29:32","1","Creación de Insumo","El usuario ADMIN creó un nuevo insumo en el sistema");
INSERT INTO TBL_bitacora VALUES("2538","3","2022-11-25 09:29:34","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2539","0","2022-11-25 09:29:59","1","Creación de Insumo","El usuario ADMIN creó un nuevo insumo en el sistema");
INSERT INTO TBL_bitacora VALUES("2540","3","2022-11-25 09:30:01","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2541","0","2022-11-25 09:30:19","1","Creación de Insumo","El usuario ADMIN creó un nuevo insumo en el sistema");
INSERT INTO TBL_bitacora VALUES("2542","3","2022-11-25 09:30:21","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2543","4","2022-11-25 09:30:57","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2544","4","2022-11-25 09:31:05","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2545","4","2022-11-25 09:31:17","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2546","3","2022-11-25 09:31:24","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2547","3","2022-11-25 09:32:01","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2548","5","2022-11-25 09:32:43","1","Cambio de vista","El usuario ADMIN entró a la Vista de Movimientos de Inventario");
INSERT INTO TBL_bitacora VALUES("2549","5","2022-11-25 09:33:21","1","Cambio de vista","El usuario ADMIN entró a la Vista de Movimientos de Inventario");
INSERT INTO TBL_bitacora VALUES("2550","5","2022-11-25 09:33:32","1","Cambio de vista","El usuario ADMIN entró a la Vista de Movimientos de Inventario");
INSERT INTO TBL_bitacora VALUES("2551","6","2022-11-25 09:41:52","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2552","6","2022-11-25 09:42:00","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2553","6","2022-11-25 09:44:25","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2554","6","2022-11-25 09:44:46","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2555","6","2022-11-25 09:44:59","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2556","6","2022-11-25 09:45:16","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2557","6","2022-11-25 09:46:48","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2558","6","2022-11-25 09:47:00","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2559","7","2022-11-25 09:47:09","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2560","7","2022-11-25 09:47:30","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2561","7","2022-11-25 09:47:39","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2562","7","2022-11-25 09:48:40","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2563","7","2022-11-25 09:48:51","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2564","0","2022-11-25 09:49:04","1","Modificación de objeto","El usuario ADMIN actualizó un objeto del sistema");
INSERT INTO TBL_bitacora VALUES("2565","7","2022-11-25 09:49:05","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2566","7","2022-11-25 09:49:16","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2567","7","2022-11-25 09:49:55","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2568","4","2022-11-25 09:50:27","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2569","8","2022-11-25 09:51:55","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Roles");
INSERT INTO TBL_bitacora VALUES("2570","7","2022-11-25 09:52:02","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2571","7","2022-11-25 09:52:27","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2572","7","2022-11-25 09:52:39","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Objetos");
INSERT INTO TBL_bitacora VALUES("2573","8","2022-11-25 09:52:48","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Roles");
INSERT INTO TBL_bitacora VALUES("2574","8","2022-11-25 09:53:03","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Roles");
INSERT INTO TBL_bitacora VALUES("2575","8","2022-11-25 09:53:15","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Roles");
INSERT INTO TBL_bitacora VALUES("2576","8","2022-11-25 09:53:37","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Roles");
INSERT INTO TBL_bitacora VALUES("2577","8","2022-11-25 09:53:46","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Roles");
INSERT INTO TBL_bitacora VALUES("2578","8","2022-11-25 09:55:17","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Roles");
INSERT INTO TBL_bitacora VALUES("2579","8","2022-11-25 09:55:25","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Roles");
INSERT INTO TBL_bitacora VALUES("2580","11","2022-11-25 09:55:31","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("2581","9","2022-11-25 09:55:39","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Parámetros");
INSERT INTO TBL_bitacora VALUES("2582","9","2022-11-25 09:55:48","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Parámetros");
INSERT INTO TBL_bitacora VALUES("2583","9","2022-11-25 09:55:57","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Parámetros");
INSERT INTO TBL_bitacora VALUES("2584","9","2022-11-25 09:56:23","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Parámetros");
INSERT INTO TBL_bitacora VALUES("2585","9","2022-11-25 09:57:20","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Parámetros");
INSERT INTO TBL_bitacora VALUES("2586","9","2022-11-25 09:57:30","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Parámetros");
INSERT INTO TBL_bitacora VALUES("2587","10","2022-11-25 09:57:36","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Preguntas");
INSERT INTO TBL_bitacora VALUES("2588","12","2022-11-25 09:57:44","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2589","9","2022-11-25 10:03:41","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Parámetros");
INSERT INTO TBL_bitacora VALUES("2590","9","2022-11-25 10:03:54","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Parámetros");
INSERT INTO TBL_bitacora VALUES("2591","9","2022-11-25 10:12:35","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Parámetros");
INSERT INTO TBL_bitacora VALUES("2592","12","2022-11-25 10:12:41","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2593","12","2022-11-25 10:19:33","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2594","2","2022-11-25 10:19:36","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2595","2","2022-11-25 10:20:05","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2596","2","2022-11-25 10:20:12","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2597","11","2022-11-25 10:20:22","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("2598","0","2022-11-25 10:20:33","1","Modificación de Permiso","El usuario ADMIN actualizó un permiso del sistema");
INSERT INTO TBL_bitacora VALUES("2599","11","2022-11-25 10:20:34","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("2600","2","2022-11-25 10:20:40","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2601","0","2022-11-25 10:21:03","1","Modificación de proveedor","El usuario ADMIN actualizó un proveedor en el sistema");
INSERT INTO TBL_bitacora VALUES("2602","2","2022-11-25 10:21:05","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2603","2","2022-11-25 10:21:21","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2604","10","2022-11-25 10:22:01","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Preguntas");
INSERT INTO TBL_bitacora VALUES("2605","13","2022-11-25 10:22:09","1","Cambio de vista","El usuario ADMIN entró a la Vista del Recetario");
INSERT INTO TBL_bitacora VALUES("2606","0","2022-11-25 10:22:22","1","Creación de Receta","El usuario ADMIN creó una nueva receta en el sistema");
INSERT INTO TBL_bitacora VALUES("2607","13","2022-11-25 10:22:24","1","Cambio de vista","El usuario ADMIN entró a la Vista del Recetario");
INSERT INTO TBL_bitacora VALUES("2608","13","2022-11-25 10:23:12","1","Cambio de vista","El usuario ADMIN entró a la Vista del Recetario");
INSERT INTO TBL_bitacora VALUES("2609","12","2022-11-25 10:23:22","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2610","6","2022-11-25 10:39:36","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2611","6","2022-11-25 10:40:01","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2612","6","2022-11-25 10:40:37","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2613","6","2022-11-25 10:41:08","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2614","6","2022-11-25 10:41:45","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2615","6","2022-11-25 10:42:20","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2616","6","2022-11-25 10:46:41","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2617","6","2022-11-25 10:47:27","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2618","6","2022-11-25 10:48:02","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2619","6","2022-11-25 10:48:35","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2620","6","2022-11-25 10:48:55","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2621","6","2022-11-25 10:49:17","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2622","6","2022-11-25 10:50:10","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2623","6","2022-11-25 10:54:42","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2624","6","2022-11-25 10:55:18","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2625","6","2022-11-25 10:55:32","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2626","6","2022-11-25 10:58:43","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2627","6","2022-11-25 10:59:14","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2628","6","2022-11-25 10:59:31","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2629","6","2022-11-25 10:59:50","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2630","6","2022-11-25 11:01:15","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2631","6","2022-11-25 11:02:52","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2632","6","2022-11-25 11:03:48","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2633","6","2022-11-25 11:06:01","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2634","6","2022-11-25 11:06:16","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2635","6","2022-11-25 11:09:22","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2636","6","2022-11-25 11:10:44","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2637","6","2022-11-25 11:12:04","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2638","6","2022-11-25 11:13:02","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2639","6","2022-11-25 11:13:40","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2640","6","2022-11-25 11:14:25","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2641","6","2022-11-25 11:15:57","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2642","6","2022-11-25 11:16:53","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2643","6","2022-11-25 11:17:55","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2644","6","2022-11-25 11:20:09","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2645","6","2022-11-25 11:20:44","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2646","6","2022-11-25 11:21:17","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2647","6","2022-11-25 11:21:53","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2648","6","2022-11-25 11:25:11","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2649","6","2022-11-25 11:25:57","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2650","6","2022-11-25 11:26:43","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2651","6","2022-11-25 11:27:23","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2652","6","2022-11-25 11:27:53","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2653","6","2022-11-25 11:29:36","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2654","6","2022-11-25 11:36:15","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2655","6","2022-11-25 11:38:08","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2656","6","2022-11-25 11:38:41","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2657","1","2022-11-25 11:51:10","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2658","12","2022-11-25 11:51:17","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2659","12","2022-11-25 11:51:23","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2660","12","2022-11-25 11:51:39","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2661","12","2022-11-25 11:52:07","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2662","0","2022-11-25 11:57:04","1","Nueva compra","El usuario ADMIN registró una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("2663","12","2022-11-25 11:57:33","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2664","0","2022-11-25 11:57:54","1","Nueva compra","El usuario ADMIN actualizó los datos de una compra en el sistema");
INSERT INTO TBL_bitacora VALUES("2665","0","2022-11-25 11:59:29","1","Nuevo pedido","El usuario ADMIN registró un pedido en el sistema");
INSERT INTO TBL_bitacora VALUES("2666","0","2022-11-25 12:00:59","1","Nuevo pedido","El usuario ADMIN registró un pedido en el sistema");
INSERT INTO TBL_bitacora VALUES("2667","0","2022-11-25 12:03:35","1","Nuevo pedido","El usuario ADMIN registró un pedido en el sistema");
INSERT INTO TBL_bitacora VALUES("2668","12","2022-11-25 12:03:41","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2669","12","2022-11-25 12:03:53","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2670","12","2022-11-25 12:04:18","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2671","4","2022-11-25 12:04:26","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2672","5","2022-11-25 12:04:37","1","Cambio de vista","El usuario ADMIN entró a la Vista de Movimientos de Inventario");
INSERT INTO TBL_bitacora VALUES("2673","12","2022-11-25 12:04:55","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2674","12","2022-11-25 12:06:18","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2675","12","2022-11-25 12:06:24","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2676","12","2022-11-25 12:06:49","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2677","12","2022-11-25 12:09:21","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2678","12","2022-11-25 12:11:34","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2679","12","2022-11-25 12:11:38","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2680","12","2022-11-25 12:17:23","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2681","12","2022-11-25 12:17:28","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2682","12","2022-11-25 12:17:34","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2683","12","2022-11-25 12:17:37","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2684","12","2022-11-25 12:21:32","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2685","12","2022-11-25 12:21:40","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2686","12","2022-11-25 12:22:13","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2687","12","2022-11-25 12:22:16","1","Cambio de vista","El usuario ADMIN entró a la Vista de Detalle de Facturación");
INSERT INTO TBL_bitacora VALUES("2688","12","2022-11-25 12:22:31","1","Cambio de vista","El usuario ADMIN entró a la Vista de Detalle de Facturación");
INSERT INTO TBL_bitacora VALUES("2689","12","2022-11-25 12:22:53","1","Cambio de vista","El usuario ADMIN entró a la Vista de Detalle de Facturación");
INSERT INTO TBL_bitacora VALUES("2690","12","2022-11-25 12:23:17","1","Cambio de vista","El usuario ADMIN entró a la Vista de Detalle de Facturación");
INSERT INTO TBL_bitacora VALUES("2691","12","2022-11-25 12:24:17","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2692","12","2022-11-25 12:24:21","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2693","12","2022-11-25 12:24:27","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2694","0","2022-11-25 12:25:29","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("2695","0","2022-11-25 12:25:37","6","Inicio de sesion","El usuario JUAN entró al sistema");
INSERT INTO TBL_bitacora VALUES("2696","1","2022-11-25 12:25:37","6","Cambio de vista","El usuario JUAN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2697","0","2022-11-25 15:23:14","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("2698","0","2022-11-25 15:23:14","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("2699","1","2022-11-25 15:23:15","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2700","1","2022-11-25 15:23:15","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2701","12","2022-11-25 15:23:24","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2702","2","2022-11-25 15:23:34","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2703","1","2022-11-25 15:23:42","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2704","1","2022-11-25 15:25:01","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2705","6","2022-11-25 15:25:11","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2706","6","2022-11-25 15:25:59","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Usuarios");
INSERT INTO TBL_bitacora VALUES("2707","0","2022-11-25 15:34:58","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("2708","1","2022-11-25 15:34:59","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2709","2","2022-11-25 15:35:11","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2710","2","2022-11-25 15:35:35","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2711","1","2022-11-25 15:35:41","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2712","12","2022-11-25 15:35:47","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2713","0","2022-11-25 15:37:50","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("2714","1","2022-11-25 15:37:51","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2715","12","2022-11-25 15:37:57","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2716","12","2022-11-25 15:38:11","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2717","12","2022-11-25 15:38:22","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2718","12","2022-11-25 15:38:29","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2719","12","2022-11-25 15:38:41","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2720","11","2022-11-25 15:38:58","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("2721","11","2022-11-25 15:39:49","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("2722","2","2022-11-25 15:44:04","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2723","2","2022-11-25 15:44:27","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2724","2","2022-11-25 15:44:47","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2725","2","2022-11-25 15:45:02","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2726","0","2022-11-25 16:13:12","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("2727","1","2022-11-25 16:13:13","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2728","12","2022-11-25 16:13:41","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2729","12","2022-11-25 16:13:56","1","Cambio de vista","El usuario ADMIN entró a la Vista de Detalle de Facturación");
INSERT INTO TBL_bitacora VALUES("2730","12","2022-11-25 16:14:01","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2731","12","2022-11-25 16:14:12","1","Cambio de vista","El usuario ADMIN entró a la Vista de Detalle de Facturación");
INSERT INTO TBL_bitacora VALUES("2732","12","2022-11-25 16:14:21","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2733","12","2022-11-25 16:14:29","1","Cambio de vista","El usuario ADMIN entró a la Vista de Detalle de Facturación");
INSERT INTO TBL_bitacora VALUES("2734","12","2022-11-25 16:14:33","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2735","12","2022-11-25 16:14:40","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2736","12","2022-11-25 16:14:46","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2737","12","2022-11-25 16:14:56","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2738","12","2022-11-25 16:16:16","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2739","12","2022-11-25 16:16:28","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2740","12","2022-11-25 16:16:37","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2741","12","2022-11-25 16:16:45","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2742","12","2022-11-25 16:16:52","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2743","11","2022-11-25 16:17:14","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("2744","11","2022-11-25 16:17:55","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Permisos");
INSERT INTO TBL_bitacora VALUES("2745","2","2022-11-25 16:18:03","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2746","12","2022-11-25 16:18:03","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2747","12","2022-11-25 16:18:07","1","Cambio de vista","El usuario ADMIN entró a la Vista de Detalle de Facturación");
INSERT INTO TBL_bitacora VALUES("2748","2","2022-11-25 16:18:28","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2749","2","2022-11-25 16:18:38","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2750","2","2022-11-25 16:18:53","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2751","3","2022-11-25 16:18:59","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2752","3","2022-11-25 16:20:00","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2753","12","2022-11-25 16:20:06","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2754","0","2022-11-25 16:20:29","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("2755","1","2022-11-25 16:20:30","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2756","3","2022-11-25 16:20:35","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2757","12","2022-11-25 16:22:46","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2758","3","2022-11-25 16:22:50","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2759","12","2022-11-25 16:24:00","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2760","12","2022-11-25 16:24:11","1","Cambio de vista","El usuario ADMIN entró a la Vista de Detalle de Facturación");
INSERT INTO TBL_bitacora VALUES("2761","4","2022-11-25 16:24:24","1","Cambio de vista","El usuario ADMIN entró a la Vista de Inventario");
INSERT INTO TBL_bitacora VALUES("2762","0","2022-11-25 16:24:37","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("2763","1","2022-11-25 16:24:38","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2764","3","2022-11-25 16:30:39","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2765","3","2022-11-25 16:30:55","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2766","12","2022-11-25 16:30:58","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2767","2","2022-11-25 16:39:08","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2768","10","2022-11-25 16:39:52","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Preguntas");
INSERT INTO TBL_bitacora VALUES("2769","10","2022-11-25 16:39:59","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Preguntas");
INSERT INTO TBL_bitacora VALUES("2770","10","2022-11-25 16:40:30","1","Cambio de vista","El usuario ADMIN entró a la Vista de Mantenimiento de Preguntas");
INSERT INTO TBL_bitacora VALUES("2771","2","2022-11-25 16:40:35","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2772","2","2022-11-25 16:40:54","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2773","2","2022-11-25 16:41:01","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2774","2","2022-11-25 16:42:41","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2775","12","2022-11-25 16:43:00","1","Cambio de vista","El usuario ADMIN entró a la Vista de lista de facturas");
INSERT INTO TBL_bitacora VALUES("2776","1","2022-11-25 16:43:16","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2777","12","2022-11-25 16:44:11","1","Cambio de vista","El usuario ADMIN entró a la Vista de Compras");
INSERT INTO TBL_bitacora VALUES("2778","3","2022-11-25 16:44:18","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2779","3","2022-11-25 16:46:29","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2780","3","2022-11-25 16:55:33","1","Cambio de vista","El usuario ADMIN entró a la Vista de Insumos");
INSERT INTO TBL_bitacora VALUES("2781","1","2022-11-25 16:56:03","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2782","0","2022-11-25 16:56:20","1","Cierre de sesión","El usuario ADMIN salió del sistema");
INSERT INTO TBL_bitacora VALUES("2783","0","2022-11-25 16:56:30","6","Inicio de sesion","El usuario JUAN entró al sistema");
INSERT INTO TBL_bitacora VALUES("2784","1","2022-11-25 16:56:31","6","Cambio de vista","El usuario JUAN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2785","0","2022-11-25 16:59:36","6","Inicio de sesion","El usuario JUAN entró al sistema");
INSERT INTO TBL_bitacora VALUES("2786","1","2022-11-25 16:59:37","6","Cambio de vista","El usuario JUAN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2787","0","2022-11-25 17:01:09","6","Inicio de sesion","El usuario JUAN entró al sistema");
INSERT INTO TBL_bitacora VALUES("2788","1","2022-11-25 17:01:10","6","Cambio de vista","El usuario JUAN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2789","1","2022-11-25 17:01:25","6","Cambio de vista","El usuario JUAN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2790","1","2022-11-25 17:14:02","6","Cambio de vista","El usuario JUAN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2791","0","2022-11-25 17:30:53","6","Cierre de sesión","El usuario JUAN salió del sistema");
INSERT INTO TBL_bitacora VALUES("2792","0","2022-11-25 17:31:02","1","Inicio de sesion","El usuario ADMIN entró al sistema");
INSERT INTO TBL_bitacora VALUES("2793","1","2022-11-25 17:31:02","1","Cambio de vista","El usuario ADMIN entró a la vista del Home");
INSERT INTO TBL_bitacora VALUES("2794","2","2022-11-25 17:35:09","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2795","0","2022-11-25 05:35:55","1","Creación de Cliente","El usuario ADMIN creó un nuevo cliente en el sistema");
INSERT INTO TBL_bitacora VALUES("2796","2","2022-11-25 17:35:59","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2797","0","2022-11-25 05:36:35","1","Modificación de cliente","El usuario ADMIN actualizó un cliente en el sistema");
INSERT INTO TBL_bitacora VALUES("2798","2","2022-11-25 17:36:42","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2799","2","2022-11-25 17:38:55","1","Cambio de vista","El usuario ADMIN entró a la Vista de Proveedores");
INSERT INTO TBL_bitacora VALUES("2800","14","2022-11-25 17:41:02","1","Cambio de vista","El usuario ADMIN entró a la Vista de Respaldo");



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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_compras VALUES("1","4","1","2","2022-11-25","3200.00");
INSERT INTO TBL_compras VALUES("2","4","1","2","2022-11-25","204.00");
INSERT INTO TBL_compras VALUES("3","4","1","2","2022-11-25","3575.00");



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
  `estado_compra` enum('Pendiente','Realizada','Anulada') DEFAULT NULL,
  PRIMARY KEY (`id_detalle_compra`),
  KEY `FK_TBL_detalle_compra_TBL_compras` (`id_compra`),
  KEY `FK_TBL_detalle_compra_TBL_insumos` (`id_insumos`),
  CONSTRAINT `FK_TBL_detalle_compra_TBL_compras` FOREIGN KEY (`id_compra`) REFERENCES `TBL_compras` (`id_compra`),
  CONSTRAINT `FK_TBL_detalle_compra_TBL_insumos` FOREIGN KEY (`id_insumos`) REFERENCES `TBL_insumos` (`id_insumos`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_detalle_compra VALUES("1","1","1","200","16.00","2022-11-30","Realizada");
INSERT INTO TBL_detalle_compra VALUES("2","2","1","12","17.00","2022-11-28","Realizada");
INSERT INTO TBL_detalle_compra VALUES("3","3","4","143","25.00","2022-11-10","Realizada");



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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_detalle_pedido VALUES("1","1","6","12","2.00");
INSERT INTO TBL_detalle_pedido VALUES("2","2","6","2","200.00");
INSERT INTO TBL_detalle_pedido VALUES("3","2","3","2","100.00");
INSERT INTO TBL_detalle_pedido VALUES("4","2","8","2","165.00");



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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_estado_pedido VALUES("1","PENDIENTE");
INSERT INTO TBL_estado_pedido VALUES("2","ENTREGADO");



CREATE TABLE `TBL_estado_promociones` (
  `id_estado_promociones` int NOT NULL AUTO_INCREMENT,
  `nom_estado_promociones` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado_promociones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `TBL_forma_pago` (
  `id_forma_pago` int NOT NULL AUTO_INCREMENT,
  `forma_pago` enum('Efectivo','Tarjeta','Cheque') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `descripcion` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_forma_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_forma_pago VALUES("1","Efectivo","pago en billetes");
INSERT INTO TBL_forma_pago VALUES("2","Tarjeta","pago con tarjeta de crédito o débito");
INSERT INTO TBL_forma_pago VALUES("3","Cheque","pago con cheque");



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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_insumos VALUES("1","AZUCAR","1","300","40","LB");
INSERT INTO TBL_insumos VALUES("2","CAFE","1","170","35","LB");
INSERT INTO TBL_insumos VALUES("3","VASOS","2","500","70","UN");
INSERT INTO TBL_insumos VALUES("4","LECHE","1","300","60","L");



CREATE TABLE `TBL_inventario` (
  `id_insumo` int NOT NULL AUTO_INCREMENT,
  `cant_existencia` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_insumo`),
  CONSTRAINT `FK_TBL_inventario_TBL_insumos` FOREIGN KEY (`id_insumo`) REFERENCES `TBL_insumos` (`id_insumos`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_inventario VALUES("1","32");
INSERT INTO TBL_inventario VALUES("2","0");
INSERT INTO TBL_inventario VALUES("3","0");
INSERT INTO TBL_inventario VALUES("4","143");



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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_movi_inventario VALUES("1","1","20","Entrada","2022-11-25 05:12:18","1","Entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("2","1","12","Entrada","2022-11-25 05:13:07","1","Entrada de insumos");
INSERT INTO TBL_movi_inventario VALUES("3","4","143","Entrada","2022-11-25 11:57:04","1","Entrada de insumos");



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
  `tipo_objeto` enum('Home','Proveedores','Insumos','Productos','Compras','Facturacion','Mantenimiento','Administracion') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `creado_por` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `modificado_por` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_objeto`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_objetos VALUES("1","HOME","Pantalla principal del sistema","Home","ADMIN","2022-11-16 11:06:36","","");
INSERT INTO TBL_objetos VALUES("2","PROVEEDORES","Creación y gestión de los proveedores de insumos de la empresa","Proveedores","ADMIN","2022-11-16 11:07:32","ADMIN","2022-11-16 11:51:57");
INSERT INTO TBL_objetos VALUES("3","INSUMOS","Creación y gestión de los insumos utilizados por la empresa","Insumos","ADMIN","2022-11-16 11:10:51","ADMIN","2022-11-16 11:51:48");
INSERT INTO TBL_objetos VALUES("4","INVENTARIO","Contiene las existencias en bodega de los insumos de la empresa","Insumos","ADMIN","2022-11-16 11:11:44","","");
INSERT INTO TBL_objetos VALUES("5","MOVIM_INVENTARIO","Muestra las entradas y salidas ya sea por compras o ventas","Insumos","ADMIN","2022-11-16 11:13:20","ADMIN","2022-11-25 09:49:03");
INSERT INTO TBL_objetos VALUES("6","USUARIOS","Creación y gestión de los usuarios del sistema","Mantenimiento","ADMIN","2022-11-16 11:52:27","","");
INSERT INTO TBL_objetos VALUES("7","OBJETOS","Creación y gestión de los módulos que componen el sistema","Mantenimiento","ADMIN","2022-11-16 12:24:29","","");
INSERT INTO TBL_objetos VALUES("8","ROLES","Creación y gestión de los roles de usuario","Mantenimiento","ADMIN","2022-11-16 20:12:44","","");
INSERT INTO TBL_objetos VALUES("9","PARAMETROS","Creación y gestión de los parámetros utilizados por el sistema","Mantenimiento","ADMIN","2022-11-16 20:25:16","","");
INSERT INTO TBL_objetos VALUES("10","PREGUNTAS","Creación y gestión de las preguntas de recuperación del sistema","Mantenimiento","ADMIN","2022-11-16 20:39:00","","");
INSERT INTO TBL_objetos VALUES("11","PERMISOS","Permisos otorgados para realizar acciones en el sistema","Home","ADMIN","2022-11-16 21:12:04","ADMIN","2022-11-24 22:41:51");
INSERT INTO TBL_objetos VALUES("12","COMPRAS","Creación y gestión de las compras de insumos realizadas","Home","ADMIN","2022-11-21 23:05:32","ADMIN","2022-11-24 22:46:28");
INSERT INTO TBL_objetos VALUES("13","RECETARIO","Cantidades de insumos utilizadas para cada producto vendido","Home","ADMIN","2022-11-21 23:30:07","ADMIN","2022-11-24 22:43:43");
INSERT INTO TBL_objetos VALUES("14","RESPALDO","Creación de respaldos de la base de datos de la empresa","Administracion","ADMIN","2022-11-21 23:38:00","","");
INSERT INTO TBL_objetos VALUES("15","DETALLE COMPRAS","Contiene información detallada respecto a una compra en específico","Compras","ADMIN","2022-11-22 15:34:34","","");
INSERT INTO TBL_objetos VALUES("16","FACTURACION","Creación y gestión de las ventas de productos hechas por la empresa","Facturacion","ADMIN","2022-11-22 15:48:14","","");



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
  `sub_total` decimal(10,2) DEFAULT NULL,
  `ISV` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `id_forma_pago` int DEFAULT NULL,
  `fech_facturacion` datetime DEFAULT NULL,
  `porcentaje_isv` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `FK_cliente_pedido_idx` (`id_cliente`),
  KEY `FK_estado_pedido_idx` (`id_estado_pedido`),
  KEY `FK_pago_pedido_idx` (`id_forma_pago`),
  CONSTRAINT `FK_TBL_pedidos_TBL_Clientes` FOREIGN KEY (`id_cliente`) REFERENCES `TBL_Clientes` (`id_clientes`),
  CONSTRAINT `FK_TBL_pedidos_TBL_estado_pedido` FOREIGN KEY (`id_estado_pedido`) REFERENCES `TBL_estado_pedido` (`id_estado_pedido`),
  CONSTRAINT `FK_TBL_pedidos_TBL_forma_pago` FOREIGN KEY (`id_forma_pago`) REFERENCES `TBL_forma_pago` (`id_forma_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_pedidos VALUES("1","2","123","2022-11-02","2022-11-02","Wakaanda","2","24.00","2.88","26.88","1","2022-11-25 05:30:56","0.12");
INSERT INTO TBL_pedidos VALUES("2","4","123","2022-11-24","2022-11-24","col. quezada","2","465.00","0.00","465.00","2","2022-11-25 11:59:29","0.00");



CREATE TABLE `TBL_pedidos_promociones` (
  `id_pedido_promocion` int NOT NULL AUTO_INCREMENT,
  `id_promocion` int DEFAULT NULL,
  `id_pedido` int DEFAULT NULL,
  `precio_venta` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id_pedido_promocion`),
  KEY `FK_promo_idx` (`id_promocion`),
  KEY `FK_pedido_idx` (`id_pedido`),
  CONSTRAINT `FK_TBL_pedidos_promociones_TBL_pedidos` FOREIGN KEY (`id_pedido_promocion`) REFERENCES `TBL_pedidos` (`id_pedido`),
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

INSERT INTO TBL_permisos VALUES("1","2","1","1","1","1","ADMIN","2022-11-15 21:21:26","ADMIN","2022-11-25 10:20:32");
INSERT INTO TBL_permisos VALUES("1","3","1","1","1","1","ADMIN","2022-11-16 11:21:36","","");
INSERT INTO TBL_permisos VALUES("1","4","0","0","0","1","ADMIN","2022-11-16 11:23:00","","");
INSERT INTO TBL_permisos VALUES("1","6","1","1","1","1","ADMIN","2022-11-16 11:52:59","ADMIN","2022-11-16 21:09:59");
INSERT INTO TBL_permisos VALUES("1","7","1","1","1","1","ADMIN","2022-11-16 12:25:00","","");
INSERT INTO TBL_permisos VALUES("1","8","1","1","1","1","ADMIN","2022-11-16 20:13:09","ADMIN","2022-11-16 21:19:37");
INSERT INTO TBL_permisos VALUES("1","9","1","1","1","1","ADMIN","2022-11-16 20:25:56","ADMIN","2022-11-16 21:19:53");
INSERT INTO TBL_permisos VALUES("1","10","1","1","1","1","ADMIN","2022-11-16 20:40:24","","");
INSERT INTO TBL_permisos VALUES("1","11","1","1","1","1","ADMIN","2022-11-16 21:14:37","","");
INSERT INTO TBL_permisos VALUES("1","12","1","1","1","1","ADMIN","2022-11-21 23:06:00","","");
INSERT INTO TBL_permisos VALUES("1","5","0","0","0","1","ADMIN","2022-11-21 23:24:29","","");
INSERT INTO TBL_permisos VALUES("1","13","1","1","1","1","ADMIN","2022-11-21 23:30:42","","");
INSERT INTO TBL_permisos VALUES("1","14","0","0","0","1","ADMIN","2022-11-21 23:38:33","","");
INSERT INTO TBL_permisos VALUES("1","15","0","0","0","1","ADMIN","2022-11-22 15:43:20","ADMIN","2022-11-22 15:46:52");
INSERT INTO TBL_permisos VALUES("1","16","1","1","1","1","ADMIN","2022-11-22 15:54:07","ADMIN","2022-11-22 15:57:16");
INSERT INTO TBL_permisos VALUES("2","2","1","1","1","1","ADMIN","2022-11-25 05:33:12","","");
INSERT INTO TBL_permisos VALUES("2","3","1","1","1","1","ADMIN","2022-11-25 05:33:27","","");
INSERT INTO TBL_permisos VALUES("2","4","0","0","0","1","ADMIN","2022-11-25 05:33:49","","");
INSERT INTO TBL_permisos VALUES("2","5","0","0","0","1","ADMIN","2022-11-25 05:34:05","","");
INSERT INTO TBL_permisos VALUES("2","12","1","1","1","1","ADMIN","2022-11-25 05:36:49","","");
INSERT INTO TBL_permisos VALUES("3","16","1","1","1","1","ADMIN","2022-11-25 05:38:10","","");



CREATE TABLE `TBL_preguntas` (
  `id_pregunta` int NOT NULL AUTO_INCREMENT,
  `pregunta` varchar(50) NOT NULL,
  `creado_por` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `modificado_por` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_pregunta`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `precio_produ` decimal(10,2) DEFAULT NULL,
  `foto_produ` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'CAMBIAR A FORMATO DE FOTO',
  PRIMARY KEY (`id_producto`),
  KEY `FK_idproducto_tippro_idx` (`id_tipo_produ`),
  CONSTRAINT `FK_TBL_producto_TBL_tipo_producto` FOREIGN KEY (`id_tipo_produ`) REFERENCES `TBL_tipo_producto` (`id_tipo_produ`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_producto VALUES("3","AAAAAA","1","ASDADAS","12.00","../productos_img/c-postedin-image-47429.webp");
INSERT INTO TBL_producto VALUES("6","ACTUALIZACION","1","ACTUALIZACION","25.00","../productos_img/maxresdefault.jpg");
INSERT INTO TBL_producto VALUES("8","PASTEL","2","si se","150.00","../productos_img/298016015_2502331389906478_4220232808044051705_n.jpg");



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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_recetario VALUES("2","3","1","1");



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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO TBL_tipo_producto VALUES("1","BEBIDA","12 ONZ","A");
INSERT INTO TBL_tipo_producto VALUES("2","COMIDA","PEQUEÑO","B");



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
INSERT INTO TBL_usuarios VALUES("6","JUAN","JUAN TORRES","Activo","$2y$12$ApnCgP9wPt82mFD.C8w74.SgNMVTCJrgCqa2lfmPSEuUM7QYfhK2W","2","","","1","2023-11-07","juan3@gmail.com","ADMIN","2022-11-08 19:38:27","MARIOS","2022-11-12 17:41:09");
INSERT INTO TBL_usuarios VALUES("7","nuevo","prueba","Activo","$2y$12$eGEOPtCxe2A0Uf7rSRNoiu2il.85SaT0y4eJheaCQxChMELNAnAbK","2","","","1","2023-11-07","roman@gmial.com","ADMIN","2022-11-08 19:38:37","ADMIN","2022-11-12 17:41:09");


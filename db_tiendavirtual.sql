-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-08-2025 a las 16:12:12
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_tiendavirtual`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` bigint(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `portada` varchar(100) NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp(),
  `ruta` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `nombre`, `descripcion`, `portada`, `datecreated`, `ruta`, `status`) VALUES
(1, 'ACCESORIOS DE LUJO', 'Haz que tu moto hable por ti.', 'img_3e4ed3ad20ba1d3ba78f26f02a075604.jpg', '2025-07-02 09:51:41', 'accesorios-de-lujo', 1),
(2, 'BOLSOS DE LUJO', 'Estilo callejero, diseño que grita exclusividad.', 'img_97dcb81ed92ea638c4a202ca4d4f1001.jpg', '2025-07-06 18:20:36', 'bolsos-de-lujo', 1),
(3, 'PIPETAS', 'Brillo extremo para tu máquina.', 'img_e987cdb2ef8310e21088ebc040ca0a80.jpg', '2025-07-06 18:00:23', 'pipetas', 1),
(4, 'CARBURADORES', 'Acelera sin límites, siente la diferencia.', 'img_cad24d60083f58a0dce77f9cb8ea5dbd.jpg', '2025-07-06 16:38:51', 'carburadores', 1),
(5, 'TECNOLOGIA', 'Lo mejor para divertirte en tu moto', 'img_c8e6dffcfe506a014ad808c751990066.jpg', '2025-07-10 14:22:57', 'tecnologia', 1),
(6, 'ROPA', 'Modela con lo mejor y dsfruta de verte bien', 'img_2e486d5f69849b5cb300b0b4819aea19.jpg', '2025-07-10 14:25:05', 'ropa', 1),
(7, 'MANILLAR Y CALAPIES', 'Lo mejor para tu moto. claro que si!!', 'img_4ed15695ab0936d16be8bbe38da5e32b.jpg', '2025-07-10 14:27:00', 'manillar-y-calapies', 1),
(8, 'GUANTES', 'Cuida de tus manos', 'img_4d2dd274e04188108ee740e705fbc604.jpg', '2025-07-10 14:28:00', 'guantes', 1),
(9, 'GAFAS', 'Lujos que solo tu te puedes dar', 'img_b268e94e6b9047d25d9d96871ba809be.jpg', '2025-07-10 14:31:07', 'gafas', 1),
(10, 'ACELERADORES', 'Mejora a tu mejor amiga con este producto', 'img_35dfa27215635514265abe25d89fde2d.jpg', '2025-07-10 14:32:36', 'aceleradores', 1),
(11, 'EXPLORADORAS', 'Dale un lujo a tus vistas', 'img_494e466bd05ba9571a9d979158fe2d34.jpg', '2025-07-10 14:33:27', 'exploradoras', 1),
(12, 'REPUESTOS', 'Dale ese arreglo que necesita tu moto', 'img_0f0bd8bb281a3d63cb2ae9ed7d87005a.jpg', '2025-07-10 14:35:04', 'repuestos', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

CREATE TABLE `contacto` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `mensaje` text NOT NULL,
  `ip` varchar(15) NOT NULL,
  `dispositivo` varchar(25) NOT NULL,
  `useragent` text NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `contacto`
--

INSERT INTO `contacto` (`id`, `nombre`, `email`, `mensaje`, `ip`, `dispositivo`, `useragent`, `datecreated`) VALUES
(1, 'Abel', 'info@abelosh.com', 'Mensaje de prueba', '127.0.0.1', 'PC', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0', '2021-07-09 01:19:37'),
(2, 'Abel', 'info@abelosh.com', 'Mensaje de prueba', '127.0.0.1', 'PC', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0', '2021-07-09 01:21:50'),
(3, 'Carlos', 'carlos@info.com', 'Otro mensaje de prueba.', '127.0.0.1', 'PC', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0', '2021-07-09 01:23:41'),
(4, 'Roberto', 'roberto@info.com', 'Mensaje de prueba', '::1', 'PC', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-09 01:47:28'),
(5, 'Ricardo', 'ricardo@info.com', 'Nuevo mensaje de prueba.', '::1', 'PC', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '2021-07-09 02:02:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id` bigint(20) NOT NULL,
  `pedidoid` bigint(20) NOT NULL,
  `productoid` bigint(20) NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_temp`
--

CREATE TABLE `detalle_temp` (
  `id` bigint(20) NOT NULL,
  `personaid` bigint(20) NOT NULL,
  `productoid` bigint(20) NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `transaccionid` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen`
--

CREATE TABLE `imagen` (
  `id` bigint(20) NOT NULL,
  `productoid` bigint(20) NOT NULL,
  `img` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `imagen`
--

INSERT INTO `imagen` (`id`, `productoid`, `img`) VALUES
(38, 15, 'pro_72ee63e1badca7f796196ef68baec5ae.jpg'),
(39, 16, 'pro_4a18df422982ee4a831daf00df484ab4.jpg'),
(40, 17, 'pro_e6c03ac94ffb8b6d5e882a81a5ffdafa.jpg'),
(41, 18, 'pro_a30bf8ad7c6a0a4f1c8e712278c9f7dd.jpg'),
(42, 19, 'pro_06599d980463e3887417526d9db3191f.jpg'),
(45, 20, 'pro_f28977ad39fe2e7f7f2babcf61a369a8.jpg'),
(46, 20, 'pro_5760adb9cc4a2aae98c3ad99f203516b.jpg'),
(47, 21, 'pro_1a16365cdca39199fcb8d0b610630b56.jpg'),
(48, 21, 'pro_c5a95c5f30f26674c6105511e2804bb4.jpg'),
(49, 22, 'pro_1695d18cb5267a00b188cfc08cfcc975.jpg'),
(50, 22, 'pro_646e9e18c5f6311a281e57211ec7c16f.jpg'),
(53, 23, 'pro_9b862ca76ebb0cfe40efaacf6768a391.jpg'),
(54, 23, 'pro_c50e02f6fca1e72fdc06454eeb9b38ff.jpg'),
(55, 24, 'pro_8a38bb7f3cd45f09890de2989bdb4fdd.jpg'),
(56, 24, 'pro_be3628b1a7a4eb8db478e4ac414930d0.jpg'),
(57, 25, 'pro_4e390f028bcde87b84ec78cbe4179b5e.jpg'),
(58, 25, 'pro_93083fab441bba2330641969943162eb.jpg'),
(59, 26, 'pro_245ca3497218c618d901f9046bfeb0b9.jpg'),
(60, 26, 'pro_999ebfff5a9bbf41a8dde69398930dfe.jpg'),
(61, 27, 'pro_b92de8975fab5aa70f154aba3f03643b.jpg'),
(62, 28, 'pro_9682abb594d1ef79886839301503b80d.jpg'),
(63, 28, 'pro_b19bbeddc7c3dd404eae0e2f94f54b2f.jpg'),
(64, 29, 'pro_3ce32b56ed08c8b8168e839185e8a119.jpg'),
(65, 30, 'pro_8f13ebb62ba8c67caac7218007762155.jpg'),
(66, 31, 'pro_fb291c98091fc3a62b33b2b806fe194b.jpg'),
(67, 32, 'pro_c88371c071b51d4ce51ac958ff5a83be.jpg'),
(68, 33, 'pro_0310a17d54f0c1c047b9b8e024cd636a.jpg'),
(69, 34, 'pro_b60d820186a255067798af49d45f805e.jpg'),
(70, 35, 'pro_f7279bab1ad39c53eb22b01ac9266aac.jpg'),
(71, 35, 'pro_ffb7c2d5671349f9b83093012fa54977.jpg'),
(72, 36, 'pro_754a136d581c43273bb39de3b2f52412.jpg'),
(73, 37, 'pro_c1b53de044686fb99cc84d2158b906a3.jpg'),
(74, 38, 'pro_eb3c06fd6ca9e300c4d5186d9df8814d.jpg'),
(75, 39, 'pro_5b63522599fae234a8dfebf3f4b756f5.jpg'),
(76, 40, 'pro_a0489425f6057ee40260a019c6e9d121.jpg'),
(78, 41, 'pro_8f6aaa9fa27723ba3bee8a5bd0b0b56a.jpg'),
(79, 42, 'pro_72db18e48d02a0994e5c68d56b5d4c9a.jpg'),
(80, 43, 'pro_574e6eec50d15cf70b57716afff533a4.jpg'),
(81, 44, 'pro_96145b359e874bc76b9375ab838d0d29.jpg'),
(82, 45, 'pro_2cc7a4c21bc4ea51614e570a3f6651b8.jpg'),
(83, 46, 'pro_4603c032d98cf80122b8eb22cc42431d.jpg'),
(84, 47, 'pro_5d0cef3d9e21b4a49fb100cede88402c.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE `modulo` (
  `idmodulo` bigint(20) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`idmodulo`, `titulo`, `descripcion`, `status`) VALUES
(1, 'Dashboard', 'Dashboard', 1),
(2, 'Usuarios', 'Usuarios del sistema', 1),
(3, 'Clientes', 'Clientes de tienda', 1),
(4, 'Productos', 'Todos los productos', 1),
(5, 'Pedidos', 'Pedidos', 1),
(6, 'Caterogías', 'Caterogías Productos', 1),
(7, 'Suscriptores', 'Suscriptores del sitio web', 1),
(8, 'Contactos', 'Mensajes del formulario contacto', 1),
(9, 'Páginas', 'Páginas del sitio web', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `idpedido` bigint(20) NOT NULL,
  `referenciacobro` varchar(255) DEFAULT NULL,
  `idtransaccionpaypal` varchar(255) DEFAULT NULL,
  `datospaypal` text DEFAULT NULL,
  `personaid` bigint(20) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `costo_envio` decimal(10,2) NOT NULL DEFAULT 0.00,
  `monto` decimal(11,2) NOT NULL,
  `tipopagoid` bigint(20) NOT NULL,
  `direccion_envio` text NOT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `idpermiso` bigint(20) NOT NULL,
  `rolid` bigint(20) NOT NULL,
  `moduloid` bigint(20) NOT NULL,
  `r` int(11) NOT NULL DEFAULT 0,
  `w` int(11) NOT NULL DEFAULT 0,
  `u` int(11) NOT NULL DEFAULT 0,
  `d` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`idpermiso`, `rolid`, `moduloid`, `r`, `w`, `u`, `d`) VALUES
(698, 3, 1, 1, 0, 0, 0),
(699, 3, 2, 0, 0, 0, 0),
(700, 3, 3, 0, 0, 0, 0),
(701, 3, 4, 1, 0, 0, 0),
(702, 3, 5, 1, 0, 0, 0),
(703, 3, 6, 0, 0, 0, 0),
(745, 2, 1, 1, 0, 0, 0),
(746, 2, 2, 0, 0, 0, 0),
(747, 2, 3, 0, 0, 0, 0),
(748, 2, 4, 0, 0, 0, 0),
(749, 2, 5, 0, 0, 0, 0),
(750, 2, 6, 0, 0, 0, 0),
(751, 2, 7, 0, 0, 0, 0),
(752, 2, 8, 0, 0, 0, 0),
(915, 7, 1, 0, 0, 0, 0),
(916, 7, 2, 0, 0, 0, 0),
(917, 7, 3, 0, 0, 0, 0),
(918, 7, 4, 0, 0, 0, 0),
(919, 7, 5, 0, 0, 0, 0),
(920, 7, 6, 0, 0, 0, 0),
(921, 7, 7, 0, 0, 0, 0),
(922, 7, 8, 0, 0, 0, 0),
(923, 7, 9, 0, 0, 0, 0),
(924, 1, 1, 1, 1, 1, 1),
(925, 1, 2, 1, 1, 1, 1),
(926, 1, 3, 1, 1, 1, 1),
(927, 1, 4, 1, 1, 1, 1),
(928, 1, 5, 1, 1, 1, 1),
(929, 1, 6, 1, 1, 1, 1),
(930, 1, 7, 1, 1, 1, 1),
(931, 1, 8, 1, 1, 1, 1),
(932, 1, 9, 1, 1, 1, 1),
(933, 4, 1, 0, 0, 0, 0),
(934, 4, 2, 1, 0, 0, 0),
(935, 4, 3, 0, 1, 0, 0),
(936, 4, 4, 0, 1, 0, 0),
(937, 4, 5, 0, 0, 0, 0),
(938, 4, 6, 0, 1, 0, 0),
(939, 4, 7, 0, 0, 0, 0),
(940, 4, 8, 0, 0, 0, 0),
(941, 4, 9, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idpersona` bigint(20) NOT NULL,
  `identificacion` varchar(30) DEFAULT NULL,
  `nombres` varchar(80) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `telefono` bigint(20) NOT NULL,
  `email_user` varchar(100) NOT NULL,
  `password` varchar(75) NOT NULL,
  `nit` varchar(20) DEFAULT NULL,
  `nombrefiscal` varchar(80) DEFAULT NULL,
  `direccionfiscal` varchar(100) DEFAULT NULL,
  `token` varchar(100) DEFAULT NULL,
  `rolid` bigint(20) NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idpersona`, `identificacion`, `nombres`, `apellidos`, `telefono`, `email_user`, `password`, `nit`, `nombrefiscal`, `direccionfiscal`, `token`, `rolid`, `datecreated`, `status`) VALUES
(1, '2409198920', 'Abel', 'OSH', 1234567, 'info@abelosh.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '24252622', 'Abel OSH', 'Antigua Guatemala', '716e8ca01ee89d6fa8f3-841d4f828a8f873766ab-28953617ef5ca74e1111-17efcbee05deff1ce2e7', 1, '2020-08-13 00:51:44', 1),
(3, NULL, 'Antoni', 'Gutierres', 3154789456, 'antoni@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, NULL, NULL, NULL, 7, '2025-07-10 14:21:32', 1),
(4, '50123278', 'Cristina', 'Ayala', 3125407315, 'cris@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, NULL, NULL, NULL, 7, '2025-07-10 14:31:20', 1),
(25, '1111111', 'Duvan', 'Mendez', 3452897945, '11111@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, NULL, NULL, NULL, 7, '2025-07-10 17:22:40', 1),
(27, '79988577', 'Jose Andres', 'Zambrano Dias', 3154789456, 'jose_andres@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, NULL, NULL, NULL, 7, '2025-07-11 08:00:57', 1),
(28, '555555555', 'Santiago', 'Santiago', 987654321, 'santiago@gmail.com', '49faaade493be8b6b6164ee67f7e4d101812a5dda970d6ca693dda8b8cf82e4b', NULL, NULL, NULL, NULL, 1, '2025-08-21 08:55:49', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `post`
--

CREATE TABLE `post` (
  `idpost` bigint(20) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `contenido` text NOT NULL,
  `portada` varchar(100) DEFAULT NULL,
  `datecreate` datetime NOT NULL DEFAULT current_timestamp(),
  `ruta` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `post`
--

INSERT INTO `post` (`idpost`, `titulo`, `contenido`, `portada`, `datecreate`, `ruta`, `status`) VALUES
(1, 'Inicio', '<div class=\"p-t-80\"> <h3 class=\"ltext-103 cl5\">Nuestras marcas</h3> </div> <div> <p>Trabajamos con las mejores marcas del mundo ...</p> </div> <div class=\"row\"> <div class=\"col-md-3\"><img src=\"Assets/images/m1.png\" alt=\"Marca 1\" width=\"110\" height=\"110\" /></div> <div class=\"col-md-3\"><img src=\"Assets/images/m2.png\" alt=\"Marca 2\" /></div> <div class=\"col-md-3\"><img src=\"Assets/images/m3.png\" alt=\"Marca 3\" /></div> <div class=\"col-md-3\"><img src=\"Assets/images/m4.png\" alt=\"Marca 4\" /></div> </div>', '', '2021-07-20 02:40:15', 'inicio', 1),
(2, 'Tienda', '<p>Contenido p&aacute;gina!</p>', '', '2021-08-06 01:21:27', 'tienda', 1),
(3, 'Carrito', '<p>Contenido p&aacute;gina!</p>', '', '2021-08-06 01:21:52', 'carrito', 1),
(4, 'Nosotros', '<section class=\"bg0 p-t-75 p-b-120\"> <div class=\"container\"> <div class=\"row p-b-148\"> <div class=\"col-md-7 col-lg-8\"> <div class=\"p-t-7 p-r-85 p-r-15-lg p-r-0-md\"> <h3 class=\"mtext-111 cl2 p-b-16\">Historia</h3> <p class=\"stext-113 cl6 p-b-26\">Todo comenzó con Daniel Rider, un joven apasionado por el stunt, las motos y la libertad que se vive en la calle. Tras años haciendo acrobacias, entrenando sin apoyo y dañando su equipo por falta de productos adecuados, decidió crear lo que tanto le hizo falta: una tienda para verdaderos riders.\r\n\r\nAsí nació Stunt Riders, un espacio especializado en artículos para stunt y cultura urbana motera. Desde cascos reforzados, guantes de alto agarre, sliders, protecciones, chaquetas con diseño stunt, hasta repuestos específicos para acrobacias: todo está pensado para quienes viven con una rueda en el aire y el corazón acelerado.\r\n\r\nPero Stunt Riders no es solo una tienda. Es una comunidad que apoya nuevos talentos, organiza eventos y promueve la seguridad sin apagar la adrenalina. Cada producto, cada consejo y cada cliente hacen parte de una misma idea: vivir la moto como un estilo de vida.\r\n</p> </div> </div> <div class=\"col-11 col-md-5 col-lg-4 m-lr-auto\"> <div class=\"how-bor1 \"> <div class=\"hov-img0\"><img src=\"https://scontent.fbog2-5.fna.fbcdn.net/v/t39.30808-6/484013378_963794899292500_6899908131672656911_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=cc71e4&_nc_eui2=AeH9B2xrnvA0wvdAB-nZLQMZ1lZ3j5mE_1LWVnePmYT_UnL3hOXpGfGsaPKRtPHn6rxcHRXstrfyxh0xfsrLis5Y&_nc_ohc=_PrJ3LL6IG8Q7kNvwF1oEcJ&_nc_oc=AdnyznIIMzYEuiW21eYz0eyjbX9bDPrpsAvdCl5sF_40xFta9rPp7XuzhL0q0WYVhaI&_nc_zt=23&_nc_ht=scontent.fbog2-5.fna&_nc_gid=IDGQ1RC1d5-tkLSw-pOnKQ&oh=00_AfQ9vykz0VIR0bd8vB_nL6QmiMZFW7OzBuYOHeohIrbyOQ&oe=6875FFF5\" alt=\"IMG\" width=\"500\" height=\"333\" /></div> </div> </div> </div> <div class=\"row\"> <div class=\"order-md-2 col-md-7 col-lg-8 p-b-30\"> <div class=\"p-t-7 p-l-85 p-l-15-lg p-l-0-md\"> <h2 class=\"mtext-111 cl2 p-b-16\"><span style=\"color: #236fa1;\">Nuestra Misi&oacute;n</span></h2> <p class=\"stext-113 cl6 p-b-26\">Impulsar la cultura del stunt como una forma de vida, ofreciendo productos especializados, seguros y de alta calidad para motociclistas apasionados por la adrenalina, la libertad y la expresión sobre dos ruedas. En Stunt Riders, no solo vendemos artículos: construimos comunidad, apoyamos el talento emergente y promovemos la responsabilidad en cada truco.</p> <div class=\"bor16 p-l-29 p-b-9 m-t-22\"> <p class=\"stext-114 cl6 p-r-40 p-b-11\">La vida es como la carretera: llena de curvas, riesgos y libertad... solo los que se atreven, dejan huella.”\r\n</p> <span class=\"stext-111 cl8\"> -– Daniel Rider </span></div> </div> </div> <div class=\"order-md-1 col-11 col-md-5 col-lg-4 m-lr-auto p-b-30\"> <div class=\"how-bor2\"> <div class=\"hov-img0\"><img src=\"https://cdn.pixabay.com/photo/2021/12/13/09/46/moto-bikes-6867911_1280.jpg\" alt=\"IMG\" width=\"500\" height=\"333\" /></div> </div> </div> </div> </div> </section>', 'img_1e5f19e3fdd9c92751ba93cbc00d430fa.jpg', '2021-08-09 03:09:44', 'nosotros', 1),
(5, 'Contacto', '<div class=\"map\"><iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3976.9161786395343!2d-74.07998682418669!3d4.609025142443755!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8e3f99a0e3c8c755%3A0xc2f7c4a0baf01c9b!2sSTUNT%20RIDERS!5e0!3m2!1ses-419!2sco!4v1751470523978!5m2!1ses-419!2sco\" width=\"100%\" height=\"700\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe></div>', 'img_1e5f19e3fdd9c92751ba93cbc00d430fa.jpg', '2021-08-09 03:11:08', 'contacto', 1),
(6, 'Preguntas frecuentes', '<ol> <li><strong>&iquest;Cu&aacute;l es el tiempo de entrega de los producto? </strong>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis sunt, corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur iusto delectus quaerat ullam nesciunt! Quae doloribus deserunt qui fugit illo nobis ipsum, accusamus eius perferendis beatae culpa molestias!</li> <li><strong>&iquest;C&oacute;mo es la forma de env&iacute;o de los productos?</strong> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis sunt, corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur.</li> <li><strong>&iquest;Cu&aacute;l es el tiempo m&aacute;ximo para solicitar un reembolso?</strong> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis sunt, corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur iusto delectus quaerat ullam nesciunt!</li> </ol> <p>&nbsp;</p> <p>Otras preguntas</p> <ul> <li><strong>&iquest;Qu&eacute; formas de pago aceptan? </strong><span style=\"color: #666666; font-family: Arial, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">Corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur iusto delectus quaerat ullam nesciunt! Quae doloribus deserunt qui fugit illo nobis ipsum, accusamus eius perferendis beatae culpa molestias!</span></li> </ul>', '', '2021-08-11 01:24:19', 'preguntas-frecuentes', 1),
(7, 'Términos y Condiciones', '<p>A continuaci&oacute;n se describen los t&eacute;rmino y condiciones de la Tienda Virtual!</p> <ol> <li>Pol&iacute;tica uno</li> <li>Termino dos</li> <li>Condici&oacute;n tres</li> </ol> <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis sunt, corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur iusto delectus quaerat ullam nesciunt! Quae doloribus deserunt qui fugit illo nobis ipsum, accusamus eius perferendis beatae culpa molestias!</p>', '', '2021-08-11 01:51:06', 'terminos-y-condiciones', 1),
(8, 'Sucursales', '<section class=\"py-5 text-center\"> <div class=\"container\"> <p>Visitanos y obten los mejores precios del mercado, cualquier art&iacute;culo que necestas para vivir mejor</p> <a class=\"btn btn-info\" href=\"../../tienda_virtual/tienda\">VER PRODUCTOS</a></div> </section> <div class=\"py-5 bg-light\"> <div class=\"container\"> <div class=\"row\"> <div class=\"col-md-4\"> <div class=\"card mb-4 box-shadow hov-img0\"><img src=\"https://abelosh.com/tienda_virtual/Assets/images/s1.jpg\" alt=\"Tienda Uno\" width=\"100%\" height=\"100%\" /> <div class=\"card-body\"> <p class=\"card-text\">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quaerat necessitatibus eligendi, soluta ipsa natus, at earum qui enim, illum doloremque, accusantium autem nemo est esse nulla neque eaque repellendus amet.</p> <p>Direcci&oacute;n: Antigua Gautemala <br />Tel&eacute;fono: 4654645 <br />Correo: info@abelosh.com</p> </div> </div> </div> <div class=\"col-md-4\"> <div class=\"card mb-4 box-shadow hov-img0\"><img src=\"https://abelosh.com/tienda_virtual/Assets/images/s2.jpg\" alt=\"Sucural dos\" width=\"100%\" height=\"100%\" /> <div class=\"card-body\"> <p class=\"card-text\">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quaerat necessitatibus eligendi, soluta ipsa natus, at earum qui enim, illum doloremque, accusantium autem nemo est esse nulla neque eaque repellendus amet.</p> <p>Direcci&oacute;n: Antigua Gautemala <br />Tel&eacute;fono: 4654645 <br />Correo: info@abelosh.com</p> </div> </div> </div> <div class=\"col-md-4\"> <div class=\"card mb-4 box-shadow hov-img0\"><img src=\"https://abelosh.com/tienda_virtual/Assets/images/s3.jpg\" alt=\"Sucural tres\" width=\"100%\" height=\"100%\" /> <div class=\"card-body\"> <p class=\"card-text\">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quaerat necessitatibus eligendi, soluta ipsa natus, at earum qui enim, illum doloremque, accusantium autem nemo est esse nulla neque eaque repellendus amet.</p> <p>Direcci&oacute;n: Antigua Gautemala <br />Tel&eacute;fono: 4654645 <br />Correo: info@abelosh.com</p> </div> </div> </div> </div> </div> </div>', 'img_d72cb5712933863e051dc9c7fac5e253.jpg', '2021-08-11 02:26:45', 'sucursales', 1),
(9, 'Not Found', '<h1>Error 404: P&aacute;gina no encontrada</h1> <p>No se encuentra la p&aacute;gina que ha solicitado.</p>', '', '2021-08-12 02:30:49', 'not-found', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idproducto` bigint(20) NOT NULL,
  `categoriaid` bigint(20) NOT NULL,
  `codigo` varchar(30) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp(),
  `ruta` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idproducto`, `categoriaid`, `codigo`, `nombre`, `descripcion`, `precio`, `stock`, `imagen`, `datecreated`, `ruta`, `status`) VALUES
(15, 10, '111122229991', 'Acelerador De Cuarta Acerbis Azul', '<p>Acelerador de cuarta marca Acerbis es un componente especializado utilizado en motocicletas y otros veh&iacute;culos motorizados para mejorar la respuesta del acelerador y proporcionar un control m&aacute;s preciso sobre la aceleraci&oacute;n del motor.</p>', 200.00, 3, '', '2025-07-10 14:39:07', 'acelerador-de-cuarta-acerbis-azul', 1),
(16, 1, '111122229992', 'Acelerador De Cuarta Acerbis Negro', '<p>Acelerador de cuarta marca Acerbis es un componente especializado utilizado en motocicletas y otros veh&iacute;culos motorizados para mejorar la respuesta del acelerador y proporcionar un control m&aacute;s preciso sobre la aceleraci&oacute;n del motor.</p>', 200.00, 2, '', '2025-07-10 14:41:15', 'acelerador-de-cuarta-acerbis-negro', 1),
(17, 1, '111122229993', 'Acelerador De Cuarta Acerbis Plateado', '<p>Acelerador de cuarta marca Acerbir es un componente especializado utilizado en motocicletas y otros veh&iacute;culos motorizados para mejorar la respuesta del acelerador y proporcionar un control m&aacute;s preciso sobre la aceleraci&oacute;n del motor.</p>', 200.00, 3, '', '2025-07-10 14:42:12', 'acelerador-de-cuarta-acerbis-plateado', 1),
(18, 1, '111122229994', 'Acelerador De Cuarta Acerbis Rojo', '<p>Acelerador de cuarta marca Rizoma es un componente especializado utilizado en motocicletas y otros veh&iacute;culos motorizados para mejorar la respuesta del acelerador y proporcionar un control m&aacute;s preciso sobre la aceleraci&oacute;n del motor.</p>', 200.00, 3, '', '2025-07-10 14:42:52', 'acelerador-de-cuarta-acerbis-rojo', 1),
(19, 1, '111122229995', 'Acelerador De Cuarta Acerbis Tornasol', '<p>Acelerador de cuarta marca Acerbis es un componente especializado utilizado en motocicletas y otros veh&iacute;culos motorizados para mejorar la respuesta del acelerador y proporcionar un control m&aacute;s preciso sobre la aceleraci&oacute;n del motor.</p>', 200.00, 3, '', '2025-07-10 14:44:13', 'acelerador-de-cuarta-acerbis-tornasol', 1),
(20, 6, '111122228881', 'Jersey básico modelo 48 – Motociclismo', '<p>Jersey camisa manga larga ideal para deportes a la intemperie en tela microperforado que adem&aacute;s de proteger de la intemperie (rayos solares, polvo, etc) permite la transpiraci&oacute;n aliviando la sensaci&oacute;n de humedad y calor adem&aacute;s de su r&aacute;pido secado.</p>', 125.00, 2, '', '2025-07-10 14:49:29', 'jersey-basico-modelo-48-–-motociclismo', 1),
(21, 1, '111122228882', 'Brave Tour Jacket Grey Black', '<p>Jersey camisa manga larga ideal para deportes a la intemperie en tela microperforado que adem&aacute;s de proteger de la intemperie (rayos solares, polvo, etc) permite la transpiraci&oacute;n aliviando la sensaci&oacute;n de humedad y calor adem&aacute;s de su r&aacute;pido secado.</p>', 204.05, 3, '', '2025-07-10 14:51:19', 'brave-tour-jacket-grey-black', 1),
(22, 1, '111122228883', 'Fly F16 Motocross Jersey NavyHi-VizWhiteMEDIUM ONLY', '<p>Jersey camisa manga larga ideal para deportes a la intemperie en tela microperforado que adem&aacute;s de proteger de la intemperie (rayos solares, polvo, etc) permite la transpiraci&oacute;n aliviando la sensaci&oacute;n de humedad y calor adem&aacute;s de su r&aacute;pido secado.</p>', 125.00, 3, '', '2025-07-10 14:52:29', 'fly-f16-motocross-jersey-navyhi-vizwhitemedium-only', 1),
(23, 1, '111122228884', 'Fox Airline EXO Motocross Jersey BlueYellow', '<p>Jersey camisa manga larga ideal para deportes a la intemperie en tela microperforado que adem&aacute;s de proteger de la intemperie (rayos solares, polvo, etc) permite la transpiraci&oacute;n aliviando la sensaci&oacute;n de humedad y calor adem&aacute;s de su r&aacute;pido secado.</p>', 135.00, 3, '', '2025-07-10 14:55:03', 'fox-airline-exo-motocross-jersey-blueyellow', 1),
(24, 1, '111122228885', 'Troy Lee Designs TLD Motocross SE Pro Air Jersey Webstar Navy Blue XL ONLY', '<p>Jersey camisa manga larga ideal para deportes a la intemperie en tela microperforado que adem&aacute;s de proteger de la intemperie (rayos solares, polvo, etc) permite la transpiraci&oacute;n aliviando la sensaci&oacute;n de humedad y calor adem&aacute;s de su r&aacute;pido secado.</p>', 135.00, 3, '', '2025-07-10 14:56:03', 'troy-lee-designs-tld-motocross-se-pro-air-jersey-webstar-navy-blue-xl-only', 1),
(25, 6, '111122228886', 'Fox Ranger Off Road Motocross Jersey Vintage White', '<p>Jersey camisa manga larga ideal para deportes a la intemperie en tela microperforado que adem&aacute;s de proteger de la intemperie (rayos solares, polvo, etc) permite la transpiraci&oacute;n aliviando la sensaci&oacute;n de humedad y calor adem&aacute;s de su r&aacute;pido secado.</p>', 200.00, 5, '', '2025-07-10 14:58:58', 'fox-ranger-off-road-motocross-jersey-vintage-white', 1),
(26, 1, '111122228887', 'jersey Alpinestar Bluewhite', '<p>Jersey camisa manga larga ideal para deportes a la intemperie en tela microperforado que adem&aacute;s de proteger de la intemperie (rayos solares, polvo, etc) permite la transpiraci&oacute;n aliviando la sensaci&oacute;n de humedad y calor adem&aacute;s de su r&aacute;pido secado.</p>', 135.00, 4, '', '2025-07-10 15:00:37', 'jersey-alpinestar-bluewhite', 1),
(27, 1, '111122228888', 'Jersey Moto ALPINESTARS Fluid Haul Amarillo Fluo Azul', '<p>Jersey camisa manga larga ideal para deportes a la intemperie en tela microperforado que adem&aacute;s de proteger de la intemperie (rayos solares, polvo, etc) permite la transpiraci&oacute;n aliviando la sensaci&oacute;n de humedad y calor adem&aacute;s de su r&aacute;pido secado.</p>', 146.00, 4, '', '2025-07-10 15:02:35', 'jersey-moto-alpinestars-fluid-haul-amarillo-fluo-azul', 1),
(28, 6, '111122228889', 'Jersey Fasthouse', '<p>Jersey camisa manga larga ideal para deportes a la intemperie en tela microperforado que adem&aacute;s de proteger de la intemperie (rayos solares, polvo, etc) permite la transpiraci&oacute;n aliviando la sensaci&oacute;n de humedad y calor adem&aacute;s de su r&aacute;pido secado.</p>', 146.00, 5, '', '2025-07-10 15:03:36', 'jersey-fasthouse', 1),
(29, 1, '1111222288810', 'Jersey MRX', '<p>Jersey camisa manga larga ideal para deportes a la intemperie en tela microperforado que adem&aacute;s de proteger de la intemperie (rayos solares, polvo, etc) permite la transpiraci&oacute;n aliviando la sensaci&oacute;n de humedad y calor adem&aacute;s de su r&aacute;pido secado.</p>', 185.00, 4, '', '2025-07-10 15:05:03', 'jersey-mrx', 1),
(30, 6, '1111222288811', 'Jersey MRX Rojo', '<p>Jersey camisa manga larga ideal para deportes a la intemperie en tela microperforado que adem&aacute;s de proteger de la intemperie (rayos solares, polvo, etc) permite la transpiraci&oacute;n aliviando la sensaci&oacute;n de humedad y calor adem&aacute;s de su r&aacute;pido secado.</p>', 185.00, 3, '', '2025-07-10 15:06:05', 'jersey-mrx-rojo', 1),
(31, 3, '111122227771', 'FMF 4.1 RCT Exhaust System GAS GAS EC250F 2021 Aluminum Stainless Steel', '<p>El Factory 4.1 RCT incorpora lo &uacute;ltimo en tecnolog&iacute;a de c&aacute;mara de resonancia FMF&trade;, tanto interna como externamente. Adem&aacute;s, logramos una longitud total m&aacute;s corta, lo que lo hace menos susceptible a da&ntilde;os por colisi&oacute;n y complementa nuestra ingenier&iacute;a de vanguardia de f&aacute;brica: acercar el silenciador al motor para centralizar la masa. El Factory 4.1 RCT est&aacute; fabricado exclusivamente con materiales de grado aeroespacial que cumplen con nuestras rigurosas especificaciones y se fabrica &iacute;ntegramente en nuestra planta del sur de California.</p>', 1.00, 3, '', '2025-07-10 15:09:12', 'fmf-41-rct-exhaust-system-gas-gas-ec250f-2021-aluminum-stainless-steel', 1),
(32, 1, '111122227772', 'FMF 4.1 RCT SLIP-ON Silencer Yamaha WR250F 20202021 Carbon end Titanium', '<p>El Factory 4.1 RCT incorpora lo &uacute;ltimo en tecnolog&iacute;a de c&aacute;mara de resonancia FMF&trade;, tanto interna como externamente. Adem&aacute;s, logramos una longitud total m&aacute;s corta, lo que lo hace menos susceptible a da&ntilde;os por colisi&oacute;n y complementa nuestra ingenier&iacute;a de vanguardia de f&aacute;brica: acercar el silenciador al motor para centralizar la masa. El Factory 4.1 RCT est&aacute; fabricado exclusivamente con materiales de grado aeroespacial que cumplen con nuestras rigurosas especificaciones y se fabrica &iacute;ntegramente en nuestra planta del sur de California.</p>', 1.00, 2, '', '2025-07-10 15:10:27', 'fmf-41-rct-slip-on-silencer-yamaha-wr250f-20202021-carbon-end-titanium', 1),
(33, 1, '111122227773', 'FMF Gnarly Pipe Honda CR 500 R 19892001due July', '<p>El Factory 4.1 RCT incorpora lo &uacute;ltimo en tecnolog&iacute;a de c&aacute;mara de resonancia FMF&trade;, tanto interna como externamente. Adem&aacute;s, logramos una longitud total m&aacute;s corta, lo que lo hace menos susceptible a da&ntilde;os por colisi&oacute;n y complementa nuestra ingenier&iacute;a de vanguardia de f&aacute;brica: acercar el silenciador al motor para centralizar la masa. El Factory 4.1 RCT est&aacute; fabricado exclusivamente con materiales de grado aeroespacial que cumplen con nuestras rigurosas especificaciones y se fabrica &iacute;ntegramente en nuestra planta del sur de California.</p>', 890.85, 3, '', '2025-07-10 15:11:27', 'fmf-gnarly-pipe-honda-cr-500-r-19892001due-july', 1),
(34, 1, '111122227774', 'FMF Racing Exhaust Powercore 2.1 Silencer Husaberg TE 250 300 Husqvarna TC KTM SX XC XC-W 200 Titanium', '<p>El Factory 4.1 RCT incorpora lo &uacute;ltimo en tecnolog&iacute;a de c&aacute;mara de resonancia FMF&trade;, tanto interna como externamente. Adem&aacute;s, logramos una longitud total m&aacute;s corta, lo que lo hace menos susceptible a da&ntilde;os por colisi&oacute;n y complementa nuestra ingenier&iacute;a de vanguardia de f&aacute;brica: acercar el silenciador al motor para centralizar la masa. El Factory 4.1 RCT est&aacute; fabricado exclusivamente con materiales de grado aeroespacial que cumplen con nuestras rigurosas especificaciones y se fabrica &iacute;ntegramente en nuestra planta del sur de California.</p>', 1.05, 3, '', '2025-07-10 15:12:55', 'fmf-racing-exhaust-powercore-21-silencer-husaberg-te-250-300-husqvarna-tc-ktm-sx-xc-xc-w-200-titanium', 1),
(35, 1, '111122227775', 'Pro Circuit Platinum 2 Stroke Motocross Exhaust Pipe1', '<p>El Factory 4.1 RCT incorpora lo &uacute;ltimo en tecnolog&iacute;a de c&aacute;mara de resonancia FMF&trade;, tanto interna como externamente. Adem&aacute;s, logramos una longitud total m&aacute;s corta, lo que lo hace menos susceptible a da&ntilde;os por colisi&oacute;n y complementa nuestra ingenier&iacute;a de vanguardia de f&aacute;brica: acercar el silenciador al motor para centralizar la masa. El Factory 4.1 RCT est&aacute; fabricado exclusivamente con materiales de grado aeroespacial que cumplen con nuestras rigurosas especificaciones y se fabrica &iacute;ntegramente en nuestra planta del sur de California.</p>', 951.00, 3, '', '2025-07-10 15:13:53', 'pro-circuit-platinum-2-stroke-motocross-exhaust-pipe1', 1),
(36, 12, '111122226661', 'Carburador Cortina Plana Universal Racing 28 Mm', '<p>Carburador Cortina Plana Universal Racing 28 Mm</p>', 146.00, 2, '', '2025-07-10 15:21:48', 'carburador-cortina-plana-universal-racing-28-mm', 1),
(37, 12, '111122226662', 'Aceite de Motor Mobil 20W50 Mineral Ultra 4 Tiempos', '<p>Aceite de Motor Mobil 20W50 Mineral Ultra 4 Tiempos</p>', 50.00, 2, '', '2025-07-10 15:23:07', 'aceite-de-motor-mobil-20w50-mineral-ultra-4-tiempos', 1),
(38, 12, '111122226663', 'Cadena Did 520v X120 Fb Oring', '<p>Cadena Did 520v X120 Fb Oring</p>', 135.00, 3, '', '2025-07-10 15:24:26', 'cadena-did-520v-x120-fb-oring', 1),
(39, 1, '111122226664', 'Cadena YAMAHA DT', '<p>Cadena YAMAHA DT</p>', 135.00, 2, '', '2025-07-10 15:26:03', 'cadena-yamaha-dt', 1),
(40, 1, '111122226665', 'Carburador Cortina Plana Universal Racing 28 Mm', '<p>Carburador Cortina Plana Universal Racing 28 Mm</p>', 299.00, 3, '', '2025-07-10 15:26:54', 'carburador-cortina-plana-universal-racing-28-mm', 1),
(41, 1, '111122226666', 'Carburador Moto Keihin Koso Oko De 28-30-32-34 mm Cortina Plana Racing', '<p>Carburador Moto Keihin Koso Oko De 28-30-32-34 mm Cortina Plana Racing</p>', 146.00, 2, '', '2025-07-10 15:28:50', 'carburador-moto-keihin-koso-oko-de-28-30-32-34-mm-cortina-plana-racing', 1),
(42, 1, '111122226667', 'Carburadores para Moto para 125-250cc', '<p>Carburadores para Moto para 125-250cc</p>', 146.00, 3, '', '2025-07-10 15:29:46', 'carburadores-para-moto-para-125-250cc', 1),
(43, 1, '111122226668', 'Carenaje KIT YAHAMA DT', '<p>Carenaje KIT YAHAMA DT</p>', 146.00, 3, '', '2025-07-10 15:30:32', 'carenaje-kit-yahama-dt', 1),
(44, 1, '111122226669', 'Direccional Zxd-41 Lineal Secuencial Con Stop Amarillo', '<p>Direccional Zxd-41 Lineal Secuencial Con Stop Amarillo</p>', 135.00, 4, '', '2025-07-10 15:32:02', 'direccional-zxd-41-lineal-secuencial-con-stop-amarillo', 1),
(45, 1, '1111222266610', 'Kit De Arrastre Revo Libero 125rv-Ybr12 5', '<p>Kit De Arrastre Revo Libero 125rv-Ybr12 5</p>', 200.00, 2, '', '2025-07-10 15:32:42', 'kit-de-arrastre-revo-libero-125rv-ybr12-5', 1),
(46, 7, '111122225551', 'MANUBRIO LAZER TIPO PROTAPER CROSS', '<p>MANUBRIO LAZER TIPO PROTAPER CROSS</p>', 700.00, 3, '', '2025-07-10 15:44:35', 'manubrio-lazer-tipo-protaper-cross', 1),
(47, 5, '45454545', 'hhshshshshs', '', 45454.00, 4, '', '2025-07-11 07:54:55', 'hhshshshshs', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reembolso`
--

CREATE TABLE `reembolso` (
  `id` bigint(20) NOT NULL,
  `pedidoid` bigint(20) NOT NULL,
  `idtransaccion` varchar(255) NOT NULL,
  `datosreembolso` text NOT NULL,
  `observacion` text NOT NULL,
  `status` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idrol` bigint(20) NOT NULL,
  `nombrerol` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `nombrerol`, `descripcion`, `status`) VALUES
(1, 'Administrador', 'Acceso a todo el sistema', 1),
(2, 'Supervisores', 'Supervisor de tienda', 1),
(3, 'Vendedores', 'Acceso a módulo ventas', 1),
(4, 'Servicio al cliente', 'Servicio al cliente sistema', 1),
(5, 'Bodega', 'Bodega', 1),
(6, 'Resporteria', 'Resporteria Sistema', 0),
(7, 'Cliente', 'Clientes tienda', 1),
(8, 'Ejemplo rol', 'Ejemplo rol sitema', 1),
(9, 'Coordinador', 'Coordinador', 1),
(10, 'Consulta Ventas', 'Consulta Ventas', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suscripciones`
--

CREATE TABLE `suscripciones` (
  `idsuscripcion` bigint(20) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `suscripciones`
--

INSERT INTO `suscripciones` (`idsuscripcion`, `nombre`, `email`, `datecreated`) VALUES
(1, 'Abel Osh', 'info@abelosh.com', '2021-05-25 01:02:58'),
(2, 'Abel Osh', 'info@info.com', '2021-05-25 01:03:32'),
(3, 'Abel Osh', 'abel@abel.com', '2021-05-25 01:03:54'),
(4, 'Abel Osh', 'alan@info.com', '2021-05-25 01:05:33'),
(5, 'Alberto', 'alberto@info.com', '2021-05-25 01:08:00'),
(6, 'Alejandra Pineda', 'ale@info.com', '2021-06-08 00:47:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopago`
--

CREATE TABLE `tipopago` (
  `idtipopago` bigint(20) NOT NULL,
  `tipopago` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `tipopago`
--

INSERT INTO `tipopago` (`idtipopago`, `tipopago`, `status`) VALUES
(1, 'PayPal', 1),
(2, 'Efectivo', 1),
(3, 'Tarjeta', 1),
(4, 'Cheque', 1),
(5, 'Despósito Bancario', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Indices de la tabla `contacto`
--
ALTER TABLE `contacto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedidoid` (`pedidoid`),
  ADD KEY `productoid` (`productoid`);

--
-- Indices de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productoid` (`productoid`),
  ADD KEY `personaid` (`personaid`);

--
-- Indices de la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productoid` (`productoid`);

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`idmodulo`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idpedido`),
  ADD KEY `personaid` (`personaid`),
  ADD KEY `tipopagoid` (`tipopagoid`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`idpermiso`),
  ADD KEY `rolid` (`rolid`),
  ADD KEY `moduloid` (`moduloid`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idpersona`),
  ADD KEY `rolid` (`rolid`);

--
-- Indices de la tabla `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`idpost`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idproducto`),
  ADD KEY `categoriaid` (`categoriaid`);

--
-- Indices de la tabla `reembolso`
--
ALTER TABLE `reembolso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedidoid` (`pedidoid`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idrol`);

--
-- Indices de la tabla `suscripciones`
--
ALTER TABLE `suscripciones`
  ADD PRIMARY KEY (`idsuscripcion`);

--
-- Indices de la tabla `tipopago`
--
ALTER TABLE `tipopago`
  ADD PRIMARY KEY (`idtipopago`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `contacto`
--
ALTER TABLE `contacto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `imagen`
--
ALTER TABLE `imagen`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT de la tabla `modulo`
--
ALTER TABLE `modulo`
  MODIFY `idmodulo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idpedido` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `idpermiso` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=942;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idpersona` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `post`
--
ALTER TABLE `post`
  MODIFY `idpost` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idproducto` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `reembolso`
--
ALTER TABLE `reembolso`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idrol` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `suscripciones`
--
ALTER TABLE `suscripciones`
  MODIFY `idsuscripcion` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tipopago`
--
ALTER TABLE `tipopago`
  MODIFY `idtipopago` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`pedidoid`) REFERENCES `pedido` (`idpedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`productoid`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  ADD CONSTRAINT `detalle_temp_ibfk_1` FOREIGN KEY (`productoid`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD CONSTRAINT `imagen_ibfk_1` FOREIGN KEY (`productoid`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`personaid`) REFERENCES `persona` (`idpersona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`tipopagoid`) REFERENCES `tipopago` (`idtipopago`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`rolid`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permisos_ibfk_2` FOREIGN KEY (`moduloid`) REFERENCES `modulo` (`idmodulo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`rolid`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`categoriaid`) REFERENCES `categoria` (`idcategoria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reembolso`
--
ALTER TABLE `reembolso`
  ADD CONSTRAINT `reembolso_ibfk_1` FOREIGN KEY (`pedidoid`) REFERENCES `pedido` (`idpedido`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

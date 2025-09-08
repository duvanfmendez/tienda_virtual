-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-09-2025 a las 06:51:14
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
(2, 'BOLSOS DE LUJO', 'Estilo callejero, diseño que grita exclusividad.', 'img_e8536c9067506d1bb06f829b44ebde04.jpg', '2025-07-06 18:20:36', 'bolsos-de-lujo', 1),
(3, 'PIPONAS', 'Brillo extremo para tu máquina.', 'img_f5c5a243e329cbdf8f9159617e6e48dd.jpg', '2025-07-06 18:00:23', 'piponas', 1),
(4, 'CARBURADORES', 'Acelera sin límites, siente la diferencia.', 'img_90d23d12dc0264177621982a8f9d3f32.jpg', '2025-07-06 16:38:51', 'carburadores', 1),
(5, 'EXPORADORAS', 'Dale El Mejor Estilo A Tu Moto', 'img_2c08142ab57f3708e2159903a0027f66.jpg', '2025-07-07 10:10:47', 'exporadoras', 1),
(6, 'ROPA', 'Súbete a tu moto y demuestra tu Flow', 'img_2f63611f7e583b6109deea806b0f355b.jpg', '2025-07-07 11:24:54', 'ropa', 1);

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

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`idpedido`, `referenciacobro`, `idtransaccionpaypal`, `datospaypal`, `personaid`, `fecha`, `costo_envio`, `monto`, `tipopagoid`, `direccion_envio`, `status`) VALUES
(2, NULL, '7BU95567U55365645', '{\"create_time\":\"2021-01-17T09:01:36Z\",\"update_time\":\"2021-01-17T09:02:02Z\",\"id\":\"3VK75882F34554627\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"payer\":{\"email_address\":\"sb-iimwo4579006@personal.example.com\",\"payer_id\":\"ZTA3QXTY5JS6Q\",\"address\":{\"country_code\":\"GT\"},\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"}},\"purchase_units\":[{\"description\":\"Compra de artículos en Tienda Virtual por $310 \",\"reference_id\":\"default\",\"amount\":{\"value\":\"310.00\",\"currency_code\":\"USD\"},\"payee\":{\"email_address\":\"sb-6z0da4580133@business.example.com\",\"merchant_id\":\"ULNZF7CTTE748\"},\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Guatemala City\",\"admin_area_1\":\"Guatemala City\",\"postal_code\":\"01001\",\"country_code\":\"GT\"}},\"payments\":{\"captures\":[{\"status\":\"COMPLETED\",\"id\":\"7BU95567U55365645\",\"final_capture\":true,\"create_time\":\"2021-01-17T09:02:02Z\",\"update_time\":\"2021-01-17T09:02:02Z\",\"amount\":{\"value\":\"310.00\",\"currency_code\":\"USD\"},\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/7BU95567U55365645\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/7BU95567U55365645/refund\",\"rel\":\"refund\",\"method\":\"POST\",\"title\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/3VK75882F34554627\",\"rel\":\"up\",\"method\":\"GET\",\"title\":\"GET\"}]}]}}],\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/3VK75882F34554627\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"}]}', 9, '2021-01-17 03:02:04', 0.00, 310.00, 1, 'Avenida Las Américas, Guatemala', 'Completo'),
(3, NULL, '37081667RU111502T', '{\"create_time\":\"2021-01-17T09:33:36Z\",\"update_time\":\"2021-01-17T09:33:59Z\",\"id\":\"3HB192330A9317440\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"payer\":{\"email_address\":\"sb-iimwo4579006@personal.example.com\",\"payer_id\":\"ZTA3QXTY5JS6Q\",\"address\":{\"country_code\":\"GT\"},\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"}},\"purchase_units\":[{\"description\":\"Compra de artículos en Tienda Virtual por $410 \",\"reference_id\":\"default\",\"amount\":{\"value\":\"410.00\",\"currency_code\":\"USD\"},\"payee\":{\"email_address\":\"sb-6z0da4580133@business.example.com\",\"merchant_id\":\"ULNZF7CTTE748\"},\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Guatemala City\",\"admin_area_1\":\"Guatemala City\",\"postal_code\":\"01001\",\"country_code\":\"GT\"}},\"payments\":{\"captures\":[{\"status\":\"COMPLETED\",\"id\":\"37081667RU111502T\",\"final_capture\":true,\"create_time\":\"2021-01-17T09:33:59Z\",\"update_time\":\"2021-01-17T09:33:59Z\",\"amount\":{\"value\":\"410.00\",\"currency_code\":\"USD\"},\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/37081667RU111502T\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/37081667RU111502T/refund\",\"rel\":\"refund\",\"method\":\"POST\",\"title\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/3HB192330A9317440\",\"rel\":\"up\",\"method\":\"GET\",\"title\":\"GET\"}]}]}}],\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/3HB192330A9317440\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"}]}', 9, '2021-01-17 03:34:01', 0.00, 410.00, 1, 'Antigua Guatemala, Guatemala', 'Completo'),
(4, '11122233', NULL, NULL, 10, '2021-01-20 00:21:26', 0.00, 310.00, 2, 'Antigua Guatemala, Guatemala', 'Completo'),
(5, '121212121', NULL, NULL, 9, '2021-01-23 00:42:25', 10.00, 220.00, 3, 'Avenida Las Américas, Guatemala', 'Entregado'),
(6, NULL, '2WT620579H276492F', '{\"create_time\":\"2021-01-25T07:58:52Z\",\"update_time\":\"2021-01-25T07:59:54Z\",\"id\":\"3HA78832GE573821B\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"payer\":{\"email_address\":\"sb-iimwo4579006@personal.example.com\",\"payer_id\":\"ZTA3QXTY5JS6Q\",\"address\":{\"country_code\":\"GT\"},\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"}},\"purchase_units\":[{\"description\":\"Compra de artículos en Tienda Virtual por $290 \",\"reference_id\":\"default\",\"amount\":{\"value\":\"290.00\",\"currency_code\":\"USD\"},\"payee\":{\"email_address\":\"sb-6z0da4580133@business.example.com\",\"merchant_id\":\"ULNZF7CTTE748\"},\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Guatemala City\",\"admin_area_1\":\"Guatemala City\",\"postal_code\":\"01001\",\"country_code\":\"GT\"}},\"payments\":{\"captures\":[{\"status\":\"COMPLETED\",\"id\":\"2WT620579H276492F\",\"final_capture\":true,\"create_time\":\"2021-01-25T07:59:54Z\",\"update_time\":\"2021-01-25T07:59:54Z\",\"amount\":{\"value\":\"290.00\",\"currency_code\":\"USD\"},\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/2WT620579H276492F\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/2WT620579H276492F/refund\",\"rel\":\"refund\",\"method\":\"POST\",\"title\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/3HA78832GE573821B\",\"rel\":\"up\",\"method\":\"GET\",\"title\":\"GET\"}]}]}}],\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/3HA78832GE573821B\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"}]}', 10, '2021-01-25 01:59:55', 20.00, 290.00, 1, 'Antigua Guatemala, Guatemala', 'Completo'),
(7, NULL, '2XV84723902906409', '{\"create_time\":\"2021-01-25T08:02:20Z\",\"update_time\":\"2021-01-25T08:02:38Z\",\"id\":\"31P81624HK9799416\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"payer\":{\"email_address\":\"sb-iimwo4579006@personal.example.com\",\"payer_id\":\"ZTA3QXTY5JS6Q\",\"address\":{\"country_code\":\"GT\"},\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"}},\"purchase_units\":[{\"description\":\"Compra de artículos en Tienda Virtual por $120 \",\"reference_id\":\"default\",\"amount\":{\"value\":\"120.00\",\"currency_code\":\"USD\"},\"payee\":{\"email_address\":\"sb-6z0da4580133@business.example.com\",\"merchant_id\":\"ULNZF7CTTE748\"},\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Guatemala City\",\"admin_area_1\":\"Guatemala City\",\"postal_code\":\"01001\",\"country_code\":\"GT\"}},\"payments\":{\"captures\":[{\"status\":\"COMPLETED\",\"id\":\"2XV84723902906409\",\"final_capture\":true,\"create_time\":\"2021-01-25T08:02:38Z\",\"update_time\":\"2021-01-25T08:02:38Z\",\"amount\":{\"value\":\"120.00\",\"currency_code\":\"USD\"},\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/2XV84723902906409\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/2XV84723902906409/refund\",\"rel\":\"refund\",\"method\":\"POST\",\"title\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/31P81624HK9799416\",\"rel\":\"up\",\"method\":\"GET\",\"title\":\"GET\"}]}]}}],\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/31P81624HK9799416\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"}]}', 9, '2021-01-25 02:02:39', 20.00, 120.00, 1, 'Guatemala, Guatemala', 'Completo'),
(8, NULL, '9JJ17208367302546', '{\"create_time\":\"2021-01-25T08:20:41Z\",\"update_time\":\"2021-01-25T08:21:45Z\",\"id\":\"9LN50929CS669412W\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"payer\":{\"email_address\":\"sb-iimwo4579006@personal.example.com\",\"payer_id\":\"ZTA3QXTY5JS6Q\",\"address\":{\"country_code\":\"GT\"},\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"}},\"purchase_units\":[{\"description\":\"Compra de artículos en Tienda Virtual por $230 \",\"reference_id\":\"default\",\"amount\":{\"value\":\"230.00\",\"currency_code\":\"USD\"},\"payee\":{\"email_address\":\"sb-6z0da4580133@business.example.com\",\"merchant_id\":\"ULNZF7CTTE748\"},\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Guatemala City\",\"admin_area_1\":\"Guatemala City\",\"postal_code\":\"01001\",\"country_code\":\"GT\"}},\"payments\":{\"captures\":[{\"status\":\"COMPLETED\",\"id\":\"9JJ17208367302546\",\"final_capture\":true,\"create_time\":\"2021-01-25T08:21:45Z\",\"update_time\":\"2021-01-25T08:21:45Z\",\"amount\":{\"value\":\"230.00\",\"currency_code\":\"USD\"},\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/9JJ17208367302546\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/9JJ17208367302546/refund\",\"rel\":\"refund\",\"method\":\"POST\",\"title\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/9LN50929CS669412W\",\"rel\":\"up\",\"method\":\"GET\",\"title\":\"GET\"}]}]}}],\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/9LN50929CS669412W\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"}]}', 9, '2021-01-25 02:21:46', 20.00, 230.00, 1, 'Antigua Guatemala, Guatemala', 'Completo'),
(9, NULL, '3A418824P3757402W', '{\"create_time\":\"2021-01-26T08:38:30Z\",\"update_time\":\"2021-01-26T08:39:55Z\",\"id\":\"1FR7854608373410U\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"payer\":{\"email_address\":\"sb-iimwo4579006@personal.example.com\",\"payer_id\":\"ZTA3QXTY5JS6Q\",\"address\":{\"country_code\":\"GT\"},\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"}},\"purchase_units\":[{\"description\":\"Compra de artículos en Tienda Virtual por $330 \",\"reference_id\":\"default\",\"amount\":{\"value\":\"330.00\",\"currency_code\":\"USD\"},\"payee\":{\"email_address\":\"sb-6z0da4580133@business.example.com\",\"merchant_id\":\"ULNZF7CTTE748\"},\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Guatemala City\",\"admin_area_1\":\"Guatemala City\",\"postal_code\":\"01001\",\"country_code\":\"GT\"}},\"payments\":{\"captures\":[{\"status\":\"COMPLETED\",\"id\":\"3A418824P3757402W\",\"final_capture\":true,\"create_time\":\"2021-01-26T08:39:55Z\",\"update_time\":\"2021-01-26T08:39:55Z\",\"amount\":{\"value\":\"330.00\",\"currency_code\":\"USD\"},\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/3A418824P3757402W\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/3A418824P3757402W/refund\",\"rel\":\"refund\",\"method\":\"POST\",\"title\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/1FR7854608373410U\",\"rel\":\"up\",\"method\":\"GET\",\"title\":\"GET\"}]}]}}],\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/1FR7854608373410U\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"}]}', 10, '2021-01-26 02:39:57', 20.00, 330.00, 1, 'Avenida Las Américas, Guatemala', 'Completo'),
(10, '465465454455', NULL, NULL, 9, '2021-01-29 22:35:52', 20.00, 338020.00, 3, 'Antigua Guatemala, Guatemala', 'Pendiente'),
(11, NULL, '5B6699765E4675415', '{\"create_time\":\"2021-02-02T06:36:24Z\",\"update_time\":\"2021-02-02T06:37:29Z\",\"id\":\"0EE39518MJ871604Y\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"payer\":{\"email_address\":\"sb-iimwo4579006@personal.example.com\",\"payer_id\":\"ZTA3QXTY5JS6Q\",\"address\":{\"country_code\":\"GT\"},\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"}},\"purchase_units\":[{\"description\":\"Compra de artículos en Tienda Virtual por $200 \",\"reference_id\":\"default\",\"amount\":{\"value\":\"200.00\",\"currency_code\":\"USD\"},\"payee\":{\"email_address\":\"sb-6z0da4580133@business.example.com\",\"merchant_id\":\"ULNZF7CTTE748\"},\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Guatemala City\",\"admin_area_1\":\"Guatemala City\",\"postal_code\":\"01001\",\"country_code\":\"GT\"}},\"payments\":{\"captures\":[{\"status\":\"COMPLETED\",\"id\":\"5B6699765E4675415\",\"final_capture\":true,\"create_time\":\"2021-02-02T06:37:29Z\",\"update_time\":\"2021-02-02T06:37:29Z\",\"amount\":{\"value\":\"200.00\",\"currency_code\":\"USD\"},\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/5B6699765E4675415\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/5B6699765E4675415/refund\",\"rel\":\"refund\",\"method\":\"POST\",\"title\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/0EE39518MJ871604Y\",\"rel\":\"up\",\"method\":\"GET\",\"title\":\"GET\"}]}]}}],\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/0EE39518MJ871604Y\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"}]}', 9, '2021-02-02 00:37:31', 50.00, 200.00, 1, 'Avenida Las Américas, Guatemala', 'Completo'),
(12, NULL, '59T82017PV181852C', '{\"create_time\":\"2021-02-02T06:54:31Z\",\"update_time\":\"2021-02-02T06:55:20Z\",\"id\":\"09945675P26393337\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"payer\":{\"email_address\":\"sb-iimwo4579006@personal.example.com\",\"payer_id\":\"ZTA3QXTY5JS6Q\",\"address\":{\"country_code\":\"GT\"},\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"}},\"purchase_units\":[{\"description\":\"Compra de artículos en Tienda Virtual por $400 \",\"reference_id\":\"default\",\"amount\":{\"value\":\"400.00\",\"currency_code\":\"USD\"},\"payee\":{\"email_address\":\"sb-6z0da4580133@business.example.com\",\"merchant_id\":\"ULNZF7CTTE748\"},\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Guatemala City\",\"admin_area_1\":\"Guatemala City\",\"postal_code\":\"01001\",\"country_code\":\"GT\"}},\"payments\":{\"captures\":[{\"status\":\"COMPLETED\",\"id\":\"59T82017PV181852C\",\"final_capture\":true,\"create_time\":\"2021-02-02T06:55:20Z\",\"update_time\":\"2021-02-02T06:55:20Z\",\"amount\":{\"value\":\"400.00\",\"currency_code\":\"USD\"},\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/59T82017PV181852C\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/59T82017PV181852C/refund\",\"rel\":\"refund\",\"method\":\"POST\",\"title\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/09945675P26393337\",\"rel\":\"up\",\"method\":\"GET\",\"title\":\"GET\"}]}]}}],\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/09945675P26393337\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"}]}', 9, '2021-02-02 00:55:22', 50.00, 400.00, 1, 'Avenida Las Américas, Guatemala', 'Completo'),
(13, NULL, '89T8947688556831X', '{\"create_time\":\"2021-02-11T06:17:03Z\",\"update_time\":\"2021-02-11T06:22:46Z\",\"id\":\"37K32135161933947\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"payer\":{\"email_address\":\"sb-iimwo4579006@personal.example.com\",\"payer_id\":\"ZTA3QXTY5JS6Q\",\"address\":{\"country_code\":\"GT\"},\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"}},\"purchase_units\":[{\"description\":\"Compra de artículos en Tienda Virtual por $410 \",\"reference_id\":\"default\",\"amount\":{\"value\":\"410.00\",\"currency_code\":\"USD\"},\"payee\":{\"email_address\":\"sb-6z0da4580133@business.example.com\",\"merchant_id\":\"ULNZF7CTTE748\"},\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Guatemala City\",\"admin_area_1\":\"Guatemala City\",\"postal_code\":\"01001\",\"country_code\":\"GT\"}},\"payments\":{\"captures\":[{\"status\":\"COMPLETED\",\"id\":\"89T8947688556831X\",\"final_capture\":true,\"create_time\":\"2021-02-11T06:22:46Z\",\"update_time\":\"2021-02-11T06:22:46Z\",\"amount\":{\"value\":\"410.00\",\"currency_code\":\"USD\"},\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/89T8947688556831X\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/89T8947688556831X/refund\",\"rel\":\"refund\",\"method\":\"POST\",\"title\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/37K32135161933947\",\"rel\":\"up\",\"method\":\"GET\",\"title\":\"GET\"}]}]}}],\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/37K32135161933947\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"}]}', 9, '2021-02-03 00:22:49', 50.00, 410.00, 1, 'Avenida Las Américas, Guatemala', 'Reembolsado'),
(14, NULL, '91E06461TP650463J', '{\"create_time\":\"2021-02-11T06:32:13Z\",\"update_time\":\"2021-02-11T06:32:57Z\",\"id\":\"9D4191826X5234304\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"payer\":{\"email_address\":\"sb-iimwo4579006@personal.example.com\",\"payer_id\":\"ZTA3QXTY5JS6Q\",\"address\":{\"country_code\":\"GT\"},\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"}},\"purchase_units\":[{\"description\":\"Compra de artículos en Tienda Virtual por $390 \",\"reference_id\":\"default\",\"amount\":{\"value\":\"390.00\",\"currency_code\":\"USD\"},\"payee\":{\"email_address\":\"sb-6z0da4580133@business.example.com\",\"merchant_id\":\"ULNZF7CTTE748\"},\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Guatemala City\",\"admin_area_1\":\"Guatemala City\",\"postal_code\":\"01001\",\"country_code\":\"GT\"}},\"payments\":{\"captures\":[{\"status\":\"COMPLETED\",\"id\":\"91E06461TP650463J\",\"final_capture\":true,\"create_time\":\"2021-02-11T06:32:57Z\",\"update_time\":\"2021-02-11T06:32:57Z\",\"amount\":{\"value\":\"390.00\",\"currency_code\":\"USD\"},\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/91E06461TP650463J\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/91E06461TP650463J/refund\",\"rel\":\"refund\",\"method\":\"POST\",\"title\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/9D4191826X5234304\",\"rel\":\"up\",\"method\":\"GET\",\"title\":\"GET\"}]}]}}],\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/9D4191826X5234304\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"}]}', 9, '2021-02-04 00:33:00', 50.00, 390.00, 1, 'Avenida Las Américas, Guatemala', 'Completo'),
(15, '465468798', NULL, NULL, 21, '2021-03-09 22:13:29', 50.00, 400.00, 3, 'Guatemala, Guatemala', 'Completo'),
(16, NULL, '5Y6609132B837933T', '{\"create_time\":\"2021-04-15T04:14:33Z\",\"update_time\":\"2021-04-15T04:16:19Z\",\"id\":\"9T986823RR525383D\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"payer\":{\"email_address\":\"sb-iimwo4579006@personal.example.com\",\"payer_id\":\"ZTA3QXTY5JS6Q\",\"address\":{\"country_code\":\"GT\"},\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"}},\"purchase_units\":[{\"description\":\"Compra de artículos en Tienda Virtual por $420 \",\"reference_id\":\"default\",\"amount\":{\"value\":\"420.00\",\"currency_code\":\"USD\"},\"payee\":{\"email_address\":\"sb-6z0da4580133@business.example.com\",\"merchant_id\":\"ULNZF7CTTE748\"},\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Guatemala City\",\"admin_area_1\":\"Guatemala City\",\"postal_code\":\"01001\",\"country_code\":\"GT\"}},\"payments\":{\"captures\":[{\"status\":\"COMPLETED\",\"id\":\"5Y6609132B837933T\",\"final_capture\":true,\"create_time\":\"2021-04-15T04:16:19Z\",\"update_time\":\"2021-04-15T04:16:19Z\",\"amount\":{\"value\":\"420.00\",\"currency_code\":\"USD\"},\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/5Y6609132B837933T\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/5Y6609132B837933T/refund\",\"rel\":\"refund\",\"method\":\"POST\",\"title\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/9T986823RR525383D\",\"rel\":\"up\",\"method\":\"GET\",\"title\":\"GET\"}]}]}}],\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/9T986823RR525383D\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"}]}', 9, '2021-03-15 22:16:21', 50.00, 420.00, 1, 'Antigua Guatemala, Antigua Guatemala', 'Completo'),
(17, NULL, '1RJ71409ML289001F', '{\"create_time\":\"2021-04-21T08:05:46Z\",\"update_time\":\"2021-04-21T08:07:21Z\",\"id\":\"4XX181061C111481V\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"payer\":{\"email_address\":\"sb-iimwo4579006@personal.example.com\",\"payer_id\":\"ZTA3QXTY5JS6Q\",\"address\":{\"country_code\":\"GT\"},\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"}},\"purchase_units\":[{\"description\":\"Compra de artículos en Tienda Virtual por $990 \",\"reference_id\":\"default\",\"soft_descriptor\":\"PAYPAL *JOHNDOESTES\",\"amount\":{\"value\":\"990.00\",\"currency_code\":\"USD\"},\"payee\":{\"email_address\":\"sb-6z0da4580133@business.example.com\",\"merchant_id\":\"ULNZF7CTTE748\"},\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Guatemala City\",\"admin_area_1\":\"Guatemala City\",\"postal_code\":\"01001\",\"country_code\":\"GT\"}},\"payments\":{\"captures\":[{\"status\":\"COMPLETED\",\"id\":\"1RJ71409ML289001F\",\"final_capture\":true,\"create_time\":\"2021-04-21T08:07:21Z\",\"update_time\":\"2021-04-21T08:07:21Z\",\"amount\":{\"value\":\"990.00\",\"currency_code\":\"USD\"},\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/1RJ71409ML289001F\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/1RJ71409ML289001F/refund\",\"rel\":\"refund\",\"method\":\"POST\",\"title\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/4XX181061C111481V\",\"rel\":\"up\",\"method\":\"GET\",\"title\":\"GET\"}]}]}}],\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/4XX181061C111481V\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"}]}', 21, '2021-03-20 02:07:22', 50.00, 990.00, 1, 'Guatemala, Guatemala', 'Reembolsado'),
(18, '654657898', NULL, NULL, 21, '2021-04-01 23:39:32', 50.00, 420.00, 3, 'Antigua Guatemala, Guatemala', 'Completo'),
(19, '546587898', NULL, NULL, 9, '2021-04-02 23:39:41', 50.00, 250.00, 4, 'Guatemala, Guatemala', 'Completo'),
(20, '78465878', NULL, NULL, 21, '2021-04-03 23:39:48', 50.00, 1250.00, 4, 'Guatemala, Guatemala', 'Completo'),
(21, '24091989', NULL, NULL, 20, '2021-04-04 19:20:24', 50.00, 790.00, 5, 'Zaragoza, Guatemala, Guatemala', 'Completo'),
(22, '65132864415', NULL, NULL, 20, '2021-04-05 23:24:50', 50.00, 270.00, 2, 'Guatemala, Guatemala', 'Completo'),
(23, '78448954655', NULL, NULL, 21, '2021-04-06 23:40:09', 50.00, 250.00, 3, 'Guatemala, Guatemala', 'Completo'),
(24, '854756965', NULL, NULL, 21, '2021-04-07 23:29:45', 50.00, 570.00, 4, 'Antigua Guatemala, Guatemala', 'Completo'),
(25, '7854851269', NULL, NULL, 9, '2021-04-08 23:30:57', 50.00, 260.00, 3, 'Guatemala, Guatemala', 'Completo'),
(26, '8784469857', NULL, NULL, 9, '2021-04-09 23:31:33', 50.00, 250.00, 2, 'Guatemala, Guatemala', 'Completo'),
(27, '7844855485', NULL, NULL, 3, '2021-04-10 23:33:30', 50.00, 310.00, 5, 'Guatemala, Guatemala', 'Completo'),
(28, '8445678954', NULL, NULL, 3, '2021-04-11 23:34:08', 50.00, 300.00, 2, 'Antigua Guatemala, Guatemala', 'Completo'),
(29, '78454857895', NULL, NULL, 3, '2021-04-12 23:35:18', 50.00, 420.00, 3, 'Antigua Guatemala, Guatemala', 'Completo'),
(30, '897654654', NULL, NULL, 3, '2021-04-13 00:11:02', 50.00, 860.00, 4, 'Guatemala, Guatemala', 'Completo'),
(31, '789465487', NULL, NULL, 21, '2021-04-14 00:12:16', 50.00, 150.00, 3, 'Guatemala, Guatemala', 'Completo'),
(32, '7894655', NULL, NULL, 9, '2021-04-15 00:13:13', 50.00, 370.00, 5, 'Guatemala, Guatemala', 'Completo'),
(33, '98746548', NULL, NULL, 3, '2021-04-16 01:31:29', 50.00, 550.00, 3, 'Guatemala, Guatemala', 'Completo'),
(34, '31579456', NULL, NULL, 20, '2021-04-17 01:59:41', 50.00, 450.00, 4, 'Guatemala, Guatemala', 'Completo'),
(35, '789413545', NULL, NULL, 20, '2021-04-18 02:00:32', 50.00, 650.00, 2, 'Chimaltenango, Chimaltenango', 'Completo'),
(36, '7846586456', NULL, NULL, 20, '2021-04-19 02:01:09', 50.00, 1090.00, 5, 'Guatemala, Guatemala', 'Completo'),
(37, '465138789', NULL, NULL, 9, '2021-04-20 02:02:18', 50.00, 300.00, 3, 'Sololá Guatemala, Guatemala', 'Completo'),
(38, '789446589', NULL, NULL, 9, '2021-04-21 02:04:20', 50.00, 650.00, 4, 'Guatemala, Guatemala', 'Completo'),
(39, '4455220011', NULL, NULL, 21, '2021-04-22 02:08:19', 50.00, 800.00, 3, 'Guatemala, Guatemala', 'Completo'),
(40, '96633225588', NULL, NULL, 20, '2021-04-23 02:09:07', 50.00, 450.00, 4, 'Guatemala, Guatemala', 'Completo'),
(41, '44112250003', NULL, NULL, 3, '2021-04-23 02:09:49', 50.00, 150.00, 2, 'Guatemala, Guatemala', 'Completo'),
(42, '663258001', NULL, NULL, 3, '2021-04-23 02:17:36', 50.00, 500.00, 4, 'Guatemala, Guatemala', 'Completo'),
(43, '6523100002', NULL, NULL, 21, '2021-04-24 02:14:50', 50.00, 320.00, 3, 'Guatemala, Guatemala', 'Completo'),
(44, '986548521', NULL, NULL, 21, '2021-04-24 02:17:55', 50.00, 470.00, 5, 'Guatemala, Guatemala', 'Completo'),
(45, '9854785212', NULL, NULL, 9, '2021-04-25 02:13:33', 50.00, 860.00, 3, 'Guatemala, Guatemala', 'Completo'),
(46, '7854785487', NULL, NULL, 9, '2021-04-26 02:13:58', 50.00, 1110.00, 5, 'Guatemala, Guatemala', 'Completo'),
(47, '78945656587', NULL, NULL, 9, '2021-04-27 02:46:24', 50.00, 990.00, 2, 'Antigua Guatemala, Guatemala', 'Completo'),
(48, NULL, '8MY45718J7267453F', '{\"create_time\":\"2021-04-28T17:04:05Z\",\"update_time\":\"2021-04-28T17:07:18Z\",\"id\":\"7Y564169U0861072X\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"payer\":{\"email_address\":\"sb-iimwo4579006@personal.example.com\",\"payer_id\":\"ZTA3QXTY5JS6Q\",\"address\":{\"country_code\":\"GT\"},\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"}},\"purchase_units\":[{\"description\":\"Compra de artículos en Tienda Virtual por $1630 \",\"reference_id\":\"default\",\"soft_descriptor\":\"PAYPAL *JOHNDOESTES\",\"amount\":{\"value\":\"1630.00\",\"currency_code\":\"USD\"},\"payee\":{\"email_address\":\"sb-6z0da4580133@business.example.com\",\"merchant_id\":\"ULNZF7CTTE748\"},\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Guatemala City\",\"admin_area_1\":\"Guatemala City\",\"postal_code\":\"01001\",\"country_code\":\"GT\"}},\"payments\":{\"captures\":[{\"status\":\"COMPLETED\",\"id\":\"8MY45718J7267453F\",\"final_capture\":true,\"create_time\":\"2021-04-28T17:07:18Z\",\"update_time\":\"2021-04-28T17:07:18Z\",\"amount\":{\"value\":\"1630.00\",\"currency_code\":\"USD\"},\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/8MY45718J7267453F\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v2/payments/captures/8MY45718J7267453F/refund\",\"rel\":\"refund\",\"method\":\"POST\",\"title\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/7Y564169U0861072X\",\"rel\":\"up\",\"method\":\"GET\",\"title\":\"GET\"}]}]}}],\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/7Y564169U0861072X\",\"rel\":\"self\",\"method\":\"GET\",\"title\":\"GET\"}]}', 3, '2021-04-28 11:07:21', 50.00, 1630.00, 1, 'Guatemala, Guatemala', 'Aprobado'),
(49, '45878548578', NULL, NULL, 3, '2021-04-29 02:12:46', 50.00, 550.00, 3, 'Guatemala, Guatemala', 'Completo'),
(50, '458789846487', NULL, NULL, 9, '2021-04-30 02:14:41', 50.00, 670.00, 2, 'Antigua Guatemala, Antigua Guatemala', 'Completo'),
(51, '854752136544', NULL, NULL, 9, '2021-05-01 02:15:19', 50.00, 350.00, 4, 'Guatemala, Guatemala', 'Completo'),
(52, '785456232594', NULL, NULL, 9, '2021-05-02 02:16:38', 50.00, 360.00, 5, 'Guatemala, Guatemala', 'Completo'),
(53, '652136547854', NULL, NULL, 9, '2021-05-03 02:17:18', 50.00, 350.00, 3, 'Guatemala, Guatemala', 'Completo'),
(54, '235456987855', NULL, NULL, 3, '2021-05-04 02:24:54', 50.00, 400.00, 2, 'Guatemala, Guatemala', 'Completo'),
(55, '8545236', NULL, NULL, 10, '2021-08-17 02:44:18', 50.00, 990.00, 2, 'Guatemala, Guatemala', 'Completo'),
(56, '78945987', NULL, NULL, 10, '2021-08-17 02:47:34', 50.00, 990.00, 3, 'Antigua Guatemala, Antigua Guatemala', 'Completo'),
(57, NULL, '6HM178018S9329407', '{\"id\":\"6VR207207W408294U\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"890.00\"},\"payee\":{\"email_address\":\"sb-6z0da4580133@business.example.com\",\"merchant_id\":\"ULNZF7CTTE748\"},\"description\":\"Compra de artículos en Tienda Virtual por $890 \",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Guatemala City\",\"admin_area_1\":\"Guatemala City\",\"postal_code\":\"01001\",\"country_code\":\"GT\"}},\"payments\":{\"captures\":[{\"id\":\"6HM178018S9329407\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"890.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2021-08-18T09:02:42Z\",\"update_time\":\"2021-08-18T09:02:42Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-iimwo4579006@personal.example.com\",\"payer_id\":\"ZTA3QXTY5JS6Q\",\"address\":{\"country_code\":\"GT\"}},\"create_time\":\"2021-08-18T08:59:18Z\",\"update_time\":\"2021-08-18T09:02:42Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/6VR207207W408294U\",\"rel\":\"self\",\"method\":\"GET\"}]}', 10, '2021-08-18 03:02:44', 50.00, 890.00, 1, 'Guatemala, Guatemala', 'Completo');

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
(716, 7, 1, 1, 0, 0, 0),
(717, 7, 2, 0, 0, 0, 0),
(718, 7, 3, 0, 0, 0, 0),
(719, 7, 4, 0, 0, 0, 0),
(720, 7, 5, 1, 0, 0, 0),
(721, 7, 6, 0, 0, 0, 0),
(745, 2, 1, 1, 0, 0, 0),
(746, 2, 2, 0, 0, 0, 0),
(747, 2, 3, 0, 0, 0, 0),
(748, 2, 4, 0, 0, 0, 0),
(749, 2, 5, 0, 0, 0, 0),
(750, 2, 6, 0, 0, 0, 0),
(751, 2, 7, 0, 0, 0, 0),
(752, 2, 8, 0, 0, 0, 0),
(897, 1, 1, 1, 0, 0, 0),
(898, 1, 2, 1, 1, 1, 1),
(899, 1, 3, 1, 1, 1, 1),
(900, 1, 4, 1, 1, 1, 1),
(901, 1, 5, 1, 1, 1, 1),
(902, 1, 6, 1, 1, 1, 1),
(903, 1, 7, 1, 0, 0, 0),
(904, 1, 8, 1, 0, 0, 0),
(905, 1, 9, 1, 1, 1, 1);

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
(1, '2409198920', 'Abel', 'OSH', 1234567, 'tiagovalbuenacabadia@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '24252622', 'Abel OSH', 'Antigua Guatemala', 'ee3ceea209c331aed94d-c3fdf72b3be4fb683fa0-d97a1f2599d0373232bb-bae933ba25f750cf4c9c', 1, '2020-08-13 00:51:44', 1),
(2, '131313131313', 'Carlos', 'Hernández', 121212121, 'carlos@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', '2c52a34f7988a0afc63e-dfe4badca8d2cb2b93e6-94824d050567a0ccd851-56165c5603c4ca020', 2, '2020-08-13 00:54:08', 0),
(3, '879846545454', 'Pablo', 'Arana', 784858856, 'pablo@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', '', 7, '2020-08-14 01:42:34', 0),
(4, '65465465', 'Jorge David', 'Arana', 987846545, 'jorge@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', '', 1, '2020-08-22 00:27:17', 0),
(5, '4654654', 'Carme Elena', 'Arana', 12121221, 'carmen@infom.com', 'be63ad947e82808780278e044bcd0267a6ac6b3cd1abdb107cc10b445a182eb0', '', '', '', '', 2, '2020-08-22 00:35:04', 0),
(6, '8465484', 'Alex Fernando', 'Méndez', 222222222, 'alex@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', '', 3, '2020-08-22 00:48:50', 0),
(7, '54684987', 'Francisco', 'Herrera', 6654456545, 'francisco@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', '', 2, '2020-08-22 01:55:57', 0),
(8, '54646849844', 'Axel Gudiel', 'Vela', 654687454, 'axel@info.com', '993fdea29acd1f7c6a6423c038601b175bb282382fc85b306a85f134fff4a63e', '', '', '', '', 3, '2020-09-07 01:30:52', 0),
(9, '46548454', 'Alan', 'Arenales', 45687954, 'alan@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'CF', 'Alan', 'Ciudad', '', 7, '2020-10-11 01:30:23', 0),
(10, '89898989', 'Rafa', 'Arana', 25478548, 'toolsfordeveloper@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'CF', 'Rafa Arana', 'Ciudad de Guatemala', '', 7, '2020-10-11 01:43:30', 0),
(11, '54789656458', 'Joel Eduardo', 'Cabrera', 54124528, 'joel@joel.com', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', 'CF', 'Joel Eduardo', 'Antigua Guatemala', '', 7, '2020-10-11 01:44:30', 0),
(12, '56874654', 'Pablo', 'Herrera', 65468464, 'pabloh@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'CF', 'Pablo', 'Antigua Guatemala', '', 7, '2020-10-11 01:59:45', 0),
(13, '46584645', 'Elena', 'Rosales', 46876454, 'elena123@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', '', 7, '2020-12-03 04:23:40', 0),
(14, '654654654547', 'Alexa', 'Cardona', 487546878, 'alexa@info.com', '74d7f333ede0080c542c95522969be8dbc5a127d4cd3b1f765944e318f087bec', '', '', '', '', 2, '2020-12-04 01:49:58', 0),
(15, '6546546545', 'Alan', 'Estrada', 464564564, 'aaaa@info.com', '739ed90c2e5568537d3b3e37550d467e8469a9c2efee57b8ea0faf50bc54f8a2', '', '', '', '', 2, '2020-12-04 02:45:37', 0),
(16, '65465465478', 'Jorge', 'Mendoza', 6545644, 'jmendoza@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'CF', 'Jorge Mendoza', 'Ciudad', '', 2, '2020-12-05 01:58:08', 0),
(17, '65465455', 'Jorge', 'Mendoza', 6545644, 'jjjj@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'CF', 'Jorge Mendoza', 'Ciudad', '', 2, '2020-12-05 01:59:25', 0),
(18, '46584654711', 'Arnold', 'Gutierrez', 78465454, 'arnold@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'CF', 'Arnold', 'Ciudad', '', 7, '2020-12-05 02:02:31', 0),
(19, '64894654', 'Julieta', 'Estrada', 4654564, 'julieta@info.com', 'b6602f58690ca41488e97cd28153671356747c951c55541b6c8d8b8493eb7143', 'CF', 'Julieta', 'Ciudad', '', 7, '2020-12-05 02:22:30', 0),
(20, '785741200', 'Jon', 'Beta', 456546545, 'jon@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'CF', 'Jon', 'Ciudad de Guatemala', '', 7, '2020-12-28 03:36:39', 0),
(21, '745845214558', 'Ale', 'Pérez', 4654798878, 'ale@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'CF', 'Ale', 'Ciudad', '', 7, '2020-12-28 03:42:23', 0),
(22, '1233911840', 'Duvan Felipe', 'Mendez Ayala', 3012891397, 'duvanmendez1029@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, NULL, NULL, NULL, 1, '2025-07-02 07:16:35', 1),
(23, '1033677413', 'Santiago', 'Valbuena Cabadia', 12345678, 'holasoyyo@gmail.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', NULL, NULL, NULL, NULL, 1, '2025-07-07 11:28:44', 1);

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
(4, 'Nosotros', '<section class=\"bg0 p-t-75 p-b-120\"> <div class=\"container\"> <div class=\"row p-b-148\"> <div class=\"col-md-7 col-lg-8\"> <div class=\"p-t-7 p-r-85 p-r-15-lg p-r-0-md\"> <h3 class=\"mtext-111 cl2 p-b-16\">Historia</h3> <p class=\"stext-113 cl6 p-b-26\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris consequat consequat enim, non auctor massa ultrices non. Morbi sed odio massa. Quisque at vehicula tellus, sed tincidunt augue. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas varius egestas diam, eu sodales metus scelerisque congue. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas gravida justo eu arcu egestas convallis. Nullam eu erat bibendum, tempus ipsum eget, dictum enim. Donec non neque ut enim dapibus tincidunt vitae nec augue. Suspendisse potenti. Proin ut est diam. Donec condimentum euismod tortor, eget facilisis diam faucibus et. Morbi a tempor elit.</p> <p class=\"stext-113 cl6 p-b-26\">Donec gravida lorem elit, quis condimentum ex semper sit amet. Fusce eget ligula magna. Aliquam aliquam imperdiet sodales. Ut fringilla turpis in vehicula vehicula. Pellentesque congue ac orci ut gravida. Aliquam erat volutpat. Donec iaculis lectus a arcu facilisis, eu sodales lectus sagittis. Etiam pellentesque, magna vel dictum rutrum, neque justo eleifend elit, vel tincidunt erat arcu ut sem. Sed rutrum, turpis ut commodo efficitur, quam velit convallis ipsum, et maximus enim ligula ac ligula.</p> <p class=\"stext-113 cl6 p-b-26\">Any questions? Let us know in store at 8th floor, 379 Hudson St, New York, NY 10018 or call us on (+1) 96 716 6879</p> </div> </div> <div class=\"col-11 col-md-5 col-lg-4 m-lr-auto\"> <div class=\"how-bor1 \"> <div class=\"hov-img0\"><img src=\"https://cdn.pixabay.com/photo/2015/07/17/22/43/student-849825_1280.jpg\" alt=\"IMG\" width=\"500\" height=\"333\" /></div> </div> </div> </div> <div class=\"row\"> <div class=\"order-md-2 col-md-7 col-lg-8 p-b-30\"> <div class=\"p-t-7 p-l-85 p-l-15-lg p-l-0-md\"> <h2 class=\"mtext-111 cl2 p-b-16\"><span style=\"color: #236fa1;\">Nuestra Misi&oacute;n</span></h2> <p class=\"stext-113 cl6 p-b-26\">Mauris non lacinia magna. Sed nec lobortis dolor. Vestibulum rhoncus dignissim risus, sed consectetur erat. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam maximus mauris sit amet odio convallis, in pharetra magna gravida. Praesent sed nunc fermentum mi molestie tempor. Morbi vitae viverra odio. Pellentesque ac velit egestas, luctus arcu non, laoreet mauris. Sed in ipsum tempor, consequat odio in, porttitor ante. Ut mauris ligula, volutpat in sodales in, porta non odio. Pellentesque tempor urna vitae mi vestibulum, nec venenatis nulla lobortis. Proin at gravida ante. Mauris auctor purus at lacus maximus euismod. Pellentesque vulputate massa ut nisl hendrerit, eget elementum libero iaculis.</p> <div class=\"bor16 p-l-29 p-b-9 m-t-22\"> <p class=\"stext-114 cl6 p-r-40 p-b-11\">Creativity is just connecting things. When you ask creative people how they did something, they feel a little guilty because they didn\'t really do it, they just saw something. It seemed obvious to them after a while.</p> <span class=\"stext-111 cl8\"> - Steve Job&rsquo;s </span></div> </div> </div> <div class=\"order-md-1 col-11 col-md-5 col-lg-4 m-lr-auto p-b-30\"> <div class=\"how-bor2\"> <div class=\"hov-img0\"><img src=\"https://cdn.pixabay.com/photo/2015/07/17/22/43/student-849822_1280.jpg\" alt=\"IMG\" width=\"500\" height=\"333\" /></div> </div> </div> </div> </div> </section>', 'img_2f644b056a9fd3624c7595d24b1d9273.jpg', '2021-08-09 03:09:44', 'nosotros', 1),
(5, 'Contacto', '<div class=\"map\"><iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3976.9161786395343!2d-74.07998682418669!3d4.609025142443755!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8e3f99a0e3c8c755%3A0xc2f7c4a0baf01c9b!2sSTUNT%20RIDERS!5e0!3m2!1ses-419!2sco!4v1751470523978!5m2!1ses-419!2sco\" width=\"100%\" height=\"700\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe></div>', 'img_3024f13dc010ffab8c22da05ac6a32b9.jpg', '2021-08-09 03:11:08', 'contacto', 1),
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

--
-- Volcado de datos para la tabla `reembolso`
--

INSERT INTO `reembolso` (`id`, `pedidoid`, `idtransaccion`, `datosreembolso`, `observacion`, `status`) VALUES
(1, 13, '3YL95553L27747319', '{\"id\":\"3YL95553L27747319\",\"status\":\"COMPLETED\",\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/refunds\\/3YL95553L27747319\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/89T8947688556831X\",\"rel\":\"up\",\"method\":\"GET\"}]}', 'Descripcion reembolso', 'COMPLETED'),
(2, 17, '54U51016166442224', '{\"id\":\"54U51016166442224\",\"status\":\"COMPLETED\",\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/refunds\\/54U51016166442224\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/1RJ71409ML289001F\",\"rel\":\"up\",\"method\":\"GET\"}]}', 'Prueba Tienda Virtual', 'COMPLETED');

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
  MODIFY `idcategoria` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

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
  MODIFY `idpermiso` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=906;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idpersona` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `post`
--
ALTER TABLE `post`
  MODIFY `idpost` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idproducto` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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

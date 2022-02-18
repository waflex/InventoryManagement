-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-02-2022 a las 22:53:01
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inventario`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modificaciones productos`
--

CREATE TABLE `modificaciones productos` (
  `Id_Producto` varchar(20) NOT NULL,
  `Cant_Previa` int(4) NOT NULL,
  `Cant_Nueva` int(4) NOT NULL,
  `Fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Id_Usuario` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mod_usuarios`
--

CREATE TABLE `mod_usuarios` (
  `Id_Usuario` varchar(15) NOT NULL,
  `Psw` varchar(24) NOT NULL,
  `Psw_Antiguo` varchar(24) NOT NULL,
  `Fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Estado` varchar(14) NOT NULL,
  `Id_Usuario_Mod` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `Id_Producto` varchar(20) NOT NULL,
  `N_Producto` varchar(50) NOT NULL,
  `Stock_Actual` int(4) NOT NULL,
  `Stock_Minimo` int(4) NOT NULL,
  `Institucion` varchar(35) NOT NULL,
  `Tipo` varchar(15) NOT NULL,
  `Ubicacion` varchar(30) NOT NULL,
  `Observacion` varchar(250) NOT NULL,
  `Func_Agrega` varchar(15) DEFAULT NULL,
  `F_Agregado` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`Id_Producto`, `N_Producto`, `Stock_Actual`, `Stock_Minimo`, `Institucion`, `Tipo`, `Ubicacion`, `Observacion`, `Func_Agrega`, `F_Agregado`) VALUES
('cm0gO', 'Monitor LG', 60, 35, 'IPVC', 'Perifericos', 'Oficina Informatica', 'Algunos en oficina informatica y otros en bodega', '19.040.510-9', '2022-02-18 13:47:32'),
('EK0JW', 'TN-450', 5, 3, 'IPVC', 'Toners', 'Oficina Informatica', '', '19.040.510-9', '2022-02-18 13:51:27'),
('Iblqh', 'Telefonos IP', 18, 15, 'IPVC', 'Perifericos', 'Oficina Informatica', 'Todos los dispositivos estan desplegados en sede', '19.040.510-9', '2022-02-16 15:40:48'),
('LPzOl', 'TN-2370', 1, 2, 'IPVC', 'Toners', 'Oficina Informatica', 'Realizar solicitud del producto', '19.040.510-9', '2022-02-18 13:52:33'),
('Nt3cE', 'Parlantes', 5, 5, 'IPVC', 'Perifericos', 'Oficina Informatica', 'Pocas unidades en buen estado', '19.040.510-9', '2022-02-16 16:04:48'),
('sCPFs', 'Tn-1060', 3, 2, 'IPVC', 'Toners', 'Oficina Informatica', 'Hay pocos, se necesitan mas', '19.040.510-9', '2022-02-18 13:45:38'),
('UxdD6', 'MLTD-111L', 3, 4, 'UB', 'Toners', 'Oficina Informatica', 'Se necesitan minimo 2 por oficina', '19.040.510-9', '2022-02-18 13:46:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('3b-tYmsmZdliqGgc5P6moYfVWi3oGez0', 1645307525, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"productos\":false,\"level2\":true,\"level3\":true,\"passport\":{\"user\":\"19.040.510-9\"},\"cart\":{\"items\":{},\"CantTotal\":0}}'),
('6czSmAQ5wq8Ua9vMb74LthBLso4lecVJ', 1645282097, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"level2\":true,\"level3\":true,\"passport\":{\"user\":\"19.040.510-9\"},\"cart\":{\"items\":{},\"CantTotal\":1},\"productos\":true}'),
('CprR_8wSiGM1Fig2SDwbLNpeYP6DIoT-', 1645296764, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"level2\":false,\"level3\":false,\"passport\":{\"user\":\"22.222.222-2\"},\"cart\":{\"items\":{\"1blqh\":{\"items\":{\"Id_Producto\":\"1blqh\",\"N_Producto\":\"Telefonos IP\",\"Stock_Actual\":18,\"Stock_Minimo\":15,\"Institucion\":\"IPVC\",\"Tipo\":\"Perifericos\",\"Ubicacion\":\"Oficina Informatica\",\"Observacion\":\"Todos los dispositivos estan desplegados en sede\",\"Func_Agrega\":\"19.040.510-9\",\"F_Agregado\":\"2022-02-16T15:40:48.000Z\"},\"qty\":6}},\"CantTotal\":-11},\"productos\":true}'),
('n-Sg7Rgl4Ym5NqTJ2_6JzMU9yu-DTLmO', 1645279764, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"level2\":true,\"level3\":true,\"passport\":{\"user\":\"19.040.510-9\"},\"cart\":{\"items\":{},\"CantTotal\":1},\"productos\":true}'),
('zwv4lwE9UISeDlF7RSmOicrasTQQydfS', 1645288352, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"level2\":true,\"level3\":true,\"passport\":{\"user\":\"22.222.222-2\"},\"cart\":null,\"productos\":true}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes`
--

CREATE TABLE `solicitudes` (
  `Id_Solicitud` varchar(10) NOT NULL,
  `Id_Usuario` varchar(15) NOT NULL,
  `PSolicitados` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`PSolicitados`)),
  `Estado` varchar(10) NOT NULL,
  `Id_Usuario_Entrega` varchar(15) DEFAULT NULL,
  `Observacion` varchar(250) DEFAULT NULL,
  `PrEntregados` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `F_Solicitud` timestamp NOT NULL DEFAULT current_timestamp(),
  `F_Respuesta` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `solicitudes`
--

INSERT INTO `solicitudes` (`Id_Solicitud`, `Id_Usuario`, `PSolicitados`, `Estado`, `Id_Usuario_Entrega`, `Observacion`, `PrEntregados`, `F_Solicitud`, `F_Respuesta`) VALUES
('79wlAHYa7u', '22.222.222-2', '{\n	\"EK0JW\": {\n		\"items\": {\n			\"Id_Producto\": \"EK0JW\",\n			\"N_Producto\": \"TN-450\",\n			\"Stock_Actual\": 5,\n			\"Stock_Minimo\": 3,\n			\"Institucion\": \"IPVC\",\n			\"Tipo\": \"Toners\",\n			\"Ubicacion\": \"Oficina Informatica\",\n			\"Observacion\": \"\",\n			\"Func_Agrega\": \"19.040.510-9\",\n			\"F_Agregado\": \"2022-02-18T13:51:27.000Z\"\n		},\n		\"qty\": 1\n	}\n}', 'En Proceso', NULL, NULL, NULL, '2022-02-18 16:32:34', NULL),
('bR9r1Qb9iG', '19.040.510-9', '{\n	\"1blqh\": {\n		\"items\": {\n			\"Id_Producto\": \"1blqh\",\n			\"N_Producto\": \"Telefonos IP\",\n			\"Stock_Actual\": 18,\n			\"Stock_Minimo\": 15,\n			\"Institucion\": \"IPVC\",\n			\"Tipo\": \"Perifericos\",\n			\"Ubicacion\": \"Oficina Informatica\",\n			\"Observacion\": \"Todos los dispositivos estan desplegados en sede\",\n			\"Func_Agrega\": \"19.040.510-9\",\n			\"F_Agregado\": \"2022-02-16T15:40:48.000Z\"\n		},\n		\"qty\": 1\n	},\n	\"cm0gO\": {\n		\"items\": {\n			\"Id_Producto\": \"cm0gO\",\n			\"N_Producto\": \"Monitor LG\",\n			\"Stock_Actual\": 60,\n			\"Stock_Minimo\": 35,\n			\"Institucion\": \"IPVC\",\n			\"Tipo\": \"Perifericos\",\n			\"Ubicacion\": \"Oficina Informatica\",\n			\"Observacion\": \"Algunos en oficina informatica y otros en bodega\",\n			\"Func_Agrega\": \"19.040.510-9\",\n			\"F_Agregado\": \"2022-02-18T13:47:32.000Z\"\n		},\n		\"qty\": 1\n	},\n	\"EK0JW\": {\n		\"items\": {\n			\"Id_Producto\": \"EK0JW\",\n			\"N_Producto\": \"TN-450\",\n			\"Stock_Actual\": 5,\n			\"Stock_Minimo\": 3,\n			\"Institucion\": \"IPVC\",\n			\"Tipo\": \"Toners\",\n			\"Ubicacion\": \"Oficina Informatica\",\n			\"Observacion\": \"\",\n			\"Func_Agrega\": \"19.040.510-9\",\n			\"F_Agregado\": \"2022-02-18T13:51:27.000Z\"\n		},\n		\"qty\": 3\n	}\n}', 'En Proceso', NULL, NULL, NULL, '2022-02-18 16:07:25', NULL),
('kUVZUeplZZ', '19.040.510-9', '{\n	\"1blqh\": {\n		\"items\": {\n			\"Id_Producto\": \"1blqh\",\n			\"N_Producto\": \"Telefonos IP\",\n			\"Stock_Actual\": 18,\n			\"Stock_Minimo\": 15,\n			\"Institucion\": \"IPVC\",\n			\"Tipo\": \"Perifericos\",\n			\"Ubicacion\": \"Oficina Informatica\",\n			\"Observacion\": \"Todos los dispositivos estan desplegados en sede\",\n			\"Func_Agrega\": \"19.040.510-9\",\n			\"F_Agregado\": \"2022-02-16T15:40:48.000Z\"\n		},\n		\"qty\": 1\n	}\n}', 'En Proceso', NULL, NULL, NULL, '2022-02-18 16:26:49', NULL),
('yHxPtQzh5a', '19.040.510-9', '{\n	\"1blqh\": {\n		\"items\": {\n			\"Id_Producto\": \"1blqh\",\n			\"N_Producto\": \"Telefonos IP\",\n			\"Stock_Actual\": 18,\n			\"Stock_Minimo\": 15,\n			\"Institucion\": \"IPVC\",\n			\"Tipo\": \"Perifericos\",\n			\"Ubicacion\": \"Oficina Informatica\",\n			\"Observacion\": \"Todos los dispositivos estan desplegados en sede\",\n			\"Func_Agrega\": \"19.040.510-9\",\n			\"F_Agregado\": \"2022-02-16T15:40:48.000Z\"\n		},\n		\"qty\": 5\n	},\n	\"cm0gO\": {\n		\"items\": {\n			\"Id_Producto\": \"cm0gO\",\n			\"N_Producto\": \"Monitor LG\",\n			\"Stock_Actual\": 60,\n			\"Stock_Minimo\": 35,\n			\"Institucion\": \"IPVC\",\n			\"Tipo\": \"Perifericos\",\n			\"Ubicacion\": \"Oficina Informatica\",\n			\"Observacion\": \"Algunos en oficina informatica y otros en bodega\",\n			\"Func_Agrega\": \"19.040.510-9\",\n			\"F_Agregado\": \"2022-02-18T13:47:32.000Z\"\n		},\n		\"qty\": 1\n	},\n	\"Nt3cE\": {\n		\"items\": {\n			\"Id_Producto\": \"Nt3cE\",\n			\"N_Producto\": \"Parlantes\",\n			\"Stock_Actual\": 5,\n			\"Stock_Minimo\": 5,\n			\"Institucion\": \"IPVC\",\n			\"Tipo\": \"Perifericos\",\n			\"Ubicacion\": \"Oficina Informatica\",\n			\"Observacion\": \"Pocas unidades en buen estado\",\n			\"Func_Agrega\": \"19.040.510-9\",\n			\"F_Agregado\": \"2022-02-16T16:04:48.000Z\"\n		},\n		\"qty\": 1\n	},\n	\"LPzOl\": {\n		\"items\": {\n			\"Id_Producto\": \"LPzOl\",\n			\"N_Producto\": \"TN-2370\",\n			\"Stock_Actual\": 1,\n			\"Stock_Minimo\": 2,\n			\"Institucion\": \"IPVC\",\n			\"Tipo\": \"Toners\",\n			\"Ubicacion\": \"Oficina Informatica\",\n			\"Observacion\": \"Realizar solicitud del producto\",\n			\"Func_Agrega\": \"19.040.510-9\",\n			\"F_Agregado\": \"2022-02-18T13:52:33.000Z\"\n		},\n		\"qty\": 1\n	},\n	\"UxdD6\": {\n		\"items\": {\n			\"Id_Producto\": \"UxdD6\",\n			\"N_Producto\": \"MLTD-111L\",\n			\"Stock_Actual\": 3,\n			\"Stock_Minimo\": 4,\n			\"Institucion\": \"UB\",\n			\"Tipo\": \"Toners\",\n			\"Ubicacion\": \"Oficina Informatica\",\n			\"Observacion\": \"Se necesitan minimo 2 por oficina\",\n			\"Func_Agrega\": \"19.040.510-9\",\n			\"F_Agregado\": \"2022-02-18T13:46:19.000Z\"\n		},\n		\"qty\": 1\n	}\n}', 'Entregada', '19.040.510-9', 'Sin Observaciones', '{\r\n \"1blqh\": {\r\n \"items\": {\r\n \"Id_Producto\": \"1blqh\",\r\n \"N_Producto\": \"Telefonos IP\",\r\n \"Stock_Actual\": 18,\r\n \"Stock_Minimo\": 15,\r\n \"Institucion\": \"IPVC\",\r\n \"Tipo\": \"Perifericos\",\r\n \"Ubicacion\": \"Oficina Informatica\",\r\n \"Observacion\": \"Todos los dispositivos estan desplegados en sede\",\r\n \"Func_Agrega\": \"19.040.510-9\",\r\n \"F_Agregado\": \"2022-02-16T15:40:48.000Z\"\r\n },\r\n \"qty\": 5\r\n },\r\n \"cm0gO\": {\r\n \"items\": {\r\n \"Id_Producto\": \"cm0gO\",\r\n \"N_Producto\": \"Monitor LG\",\r\n \"Stock_Actual\": 60,\r\n \"Stock_Minimo\": 35,\r\n \"Institucion\": \"IPVC\",\r\n \"Tipo\": \"Perifericos\",\r\n \"Ubicacion\": \"Oficina Informatica\",\r\n \"Observacion\": \"Algunos en oficina informatica y otros en bodega\",\r\n \"Func_Agrega\": \"19.040.510-9\",\r\n \"F_Agregado\": \"2022-02-18T13:47:32.000Z\"\r\n },\r\n \"qty\": 1\r\n },\r\n \"Nt3cE\": {\r\n \"items\": {\r\n \"Id_Producto\": \"Nt3cE\",\r\n \"N_Producto\": \"Parlantes\",\r\n \"Stock_Actual\": 5,\r\n \"Stock_Minimo\": 5,\r\n \"Institucion\": \"IPVC\",\r\n \"Tipo\": \"Perifericos\",\r\n \"Ubicacion\": \"Oficina Informatica\",\r\n \"Observacion\": \"Pocas unidades en buen estado\",\r\n \"Func_Agrega\": \"19.040.510-9\",\r\n \"F_Agregado\": \"2022-02-16T16:04:48.000Z\"\r\n },\r\n \"qty\": 1\r\n },\r\n \"LPzOl\": {\r\n \"items\": {\r\n \"Id_Producto\": \"LPzOl\",\r\n \"N_Producto\": \"TN-2370\",\r\n \"Stock_Actual\": 1,\r\n \"Stock_Minimo\": 2,\r\n \"Institucion\": \"IPVC\",\r\n \"Tipo\": \"Toners\",\r\n \"Ubicacion\": \"Oficina Informatica\",\r\n \"Observacion\": \"Realizar solicitud del producto\",\r\n \"Func_Agrega\": \"19.040.510-9\",\r\n \"F_Agregado\": \"2022-02-18T13:52:33.000Z\"\r\n },\r\n \"qty\": 1\r\n },\r\n \"UxdD6\": {\r\n \"items\": {\r\n \"Id_Producto\": \"UxdD6\",\r\n \"N_Producto\": \"MLTD-111L\",\r\n \"Stock_Actual\": 3,\r\n \"Stock_Minimo\": 4,\r\n \"Institucion\": \"UB\",\r\n \"Tipo\": \"Toners\",\r\n \"Ubicacion\": \"Oficina Informatica\",\r\n \"Observacion\": \"Se necesitan minimo 2 por oficina\",\r\n \"Func_Agrega\": \"19.040.510-9\",\r\n \"F_Agregado\": \"2022-02-18T13:46:19.000Z\"\r\n },\r\n \"qty\": 1\r\n }\r\n}', '2022-02-18 16:06:40', '2022-02-18 16:10:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trash`
--

CREATE TABLE `trash` (
  `id` int(11) NOT NULL,
  `datamax` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`datamax`)),
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `numero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `trash`
--

INSERT INTO `trash` (`id`, `datamax`, `fecha`, `numero`) VALUES
(1, '{\n	\"id\": \"wafle48@gmail.com\",\n	\"ps\": \"1234\"\n}', '2022-02-17 20:15:50', 0),
(2, '{}', '2022-02-18 13:35:28', 0),
(3, '{}', '2022-02-18 14:24:05', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `ID` varchar(15) NOT NULL,
  `Nom_usu` varchar(50) NOT NULL,
  `Cont_usu` varchar(60) NOT NULL,
  `Cargo` varchar(14) NOT NULL,
  `Institucion` varchar(5) NOT NULL,
  `Estado` varchar(14) NOT NULL,
  `F_add` timestamp NOT NULL DEFAULT current_timestamp(),
  `Lst_conn` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`ID`, `Nom_usu`, `Cont_usu`, `Cargo`, `Institucion`, `Estado`, `F_add`, `Lst_conn`) VALUES
('12.654.987-3', 'Auxiliar', '$2a$10$SKj5bLGq2KIGJvS84zONDevvAtB601D.h.mFp.htttitZlaLcbFyq', 'Auxiliar', 'UB', 'Habilitado', '2022-02-16 21:38:09', '2022-02-16 21:38:39'),
('19.040.510-9', 'Jonathan Rojas', '$2a$10$bFXDHtyna4pBzFZVuO7CHO3XKwMVooXfuYzLRvsQgTzwoLOPrJlfe', 'Administrador', 'IPVC', 'Habilitado', '2022-02-15 20:08:54', '2022-02-18 18:53:01'),
('22.222.222-2', 'Pedro', '$2a$10$ZhVKPJ8Hkq4KYhB3.YyiNuEYab/OIZVdWfAc0pZF8D.BI6GH4c1te', 'Funcionario', 'IPVC', 'Habilitado', '2022-02-18 16:31:38', '2022-02-18 16:53:25');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `modificaciones productos`
--
ALTER TABLE `modificaciones productos`
  ADD KEY `Id_Producto` (`Id_Producto`,`Id_Usuario`),
  ADD KEY `Id_Usuario` (`Id_Usuario`);

--
-- Indices de la tabla `mod_usuarios`
--
ALTER TABLE `mod_usuarios`
  ADD KEY `Id_Usuario` (`Id_Usuario`,`Id_Usuario_Mod`),
  ADD KEY `Id_Usuario_Mod` (`Id_Usuario_Mod`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`Id_Producto`),
  ADD KEY `Func_Agrega` (`Func_Agrega`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indices de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD PRIMARY KEY (`Id_Solicitud`),
  ADD KEY `Id_Usuario` (`Id_Usuario`,`Id_Usuario_Entrega`),
  ADD KEY `Id_Usuario_Entrega` (`Id_Usuario_Entrega`);

--
-- Indices de la tabla `trash`
--
ALTER TABLE `trash`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `trash`
--
ALTER TABLE `trash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `modificaciones productos`
--
ALTER TABLE `modificaciones productos`
  ADD CONSTRAINT `modificaciones productos_ibfk_1` FOREIGN KEY (`Id_Producto`) REFERENCES `productos` (`Id_Producto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `modificaciones productos_ibfk_2` FOREIGN KEY (`Id_Usuario`) REFERENCES `users` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mod_usuarios`
--
ALTER TABLE `mod_usuarios`
  ADD CONSTRAINT `mod_usuarios_ibfk_1` FOREIGN KEY (`Id_Usuario`) REFERENCES `users` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mod_usuarios_ibfk_2` FOREIGN KEY (`Id_Usuario_Mod`) REFERENCES `users` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`Func_Agrega`) REFERENCES `users` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD CONSTRAINT `solicitudes_ibfk_2` FOREIGN KEY (`Id_Usuario`) REFERENCES `users` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `solicitudes_ibfk_3` FOREIGN KEY (`Id_Usuario_Entrega`) REFERENCES `users` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

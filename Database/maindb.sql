-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-02-2022 a las 22:48:18
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
  `Ubicacion` varchar(10) NOT NULL,
  `Observacion` varchar(250) NOT NULL,
  `Func_Agrega` varchar(15) DEFAULT NULL,
  `F_Agregado` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`Id_Producto`, `N_Producto`, `Stock_Actual`, `Stock_Minimo`, `Institucion`, `Tipo`, `Ubicacion`, `Observacion`, `Func_Agrega`, `F_Agregado`) VALUES
('1blqh', 'Telefonos IP', 15, 16, 'IPVC', 'Perifericos', 'Oficina In', 'Mayoria de dispositivos desplegados', '19.040.510-9', '2022-02-16 15:40:48'),
('Nt3cE', 'Parlantes', 5, 5, 'IPVC', 'Perifericos', 'Oficina In', 'Pocas unidades en buen estado', '19.040.510-9', '2022-02-16 16:04:48');

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
('0kKP8MmU3e_CY4zA1RX-PQj7oI5iJiVd', 1645203572, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":\"19.040.510-9\"},\"carro\":{\"items\":{\"1blqh\":{\"items\":{\"Id_Producto\":\"1blqh\",\"N_Producto\":\"Telefonos IP\",\"Stock_Actual\":15,\"Stock_Minimo\":16,\"Institucion\":\"IPVC\",\"Tipo\":\"Perifericos\",\"Ubicacion\":\"Oficina In\",\"Observacion\":\"Mayoria de dispositivos desplegados\",\"Func_Agrega\":\"19.040.510-9\",\"F_Agregado\":\"2022-02-16T15:40:48.000Z\"},\"qty\":1}},\"CantTotal\":1},\"cart\":{\"items\":{\"1blqh\":{\"items\":{\"Id_Producto\":\"1blqh\",\"N_Producto\":\"Telefonos IP\",\"Stock_Actual\":15,\"Stock_Minimo\":16,\"Institucion\":\"IPVC\",\"Tipo\":\"Perifericos\",\"Ubicacion\":\"Oficina In\",\"Observacion\":\"Mayoria de dispositivos desplegados\",\"Func_Agrega\":\"19.040.510-9\",\"F_Agregado\":\"2022-02-16T15:40:48.000Z\"},\"qty\":41943043},\"Nt3cE\":{\"items\":{\"Id_Producto\":\"Nt3cE\",\"N_Producto\":\"Parlantes\",\"Stock_Actual\":5,\"Stock_Minimo\":5,\"Institucion\":\"IPVC\",\"Tipo\":\"Perifericos\",\"Ubicacion\":\"Oficina In\",\"Observacion\":\"Pocas unidades en buen estado\",\"Func_Agrega\":\"19.040.510-9\",\"F_Agregado\":\"2022-02-16T16:04:48.000Z\"},\"qty\":13}},\"CantTotal\":28},\"level3\":true,\"level2\":true,\"productos\":true}'),
('9GWCo6oGOJXAOrtBymGpM2bMwCMsWJ7k', 1645204523, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"level2\":true,\"level3\":true,\"passport\":{\"user\":\"19.040.510-9\"},\"cart\":{\"items\":{\"1blqh\":{\"items\":{\"Id_Producto\":\"1blqh\",\"N_Producto\":\"Telefonos IP\",\"Stock_Actual\":15,\"Stock_Minimo\":16,\"Institucion\":\"IPVC\",\"Tipo\":\"Perifericos\",\"Ubicacion\":\"Oficina In\",\"Observacion\":\"Mayoria de dispositivos desplegados\",\"Func_Agrega\":\"19.040.510-9\",\"F_Agregado\":\"2022-02-16T15:40:48.000Z\"},\"qty\":43},\"Nt3cE\":{\"items\":{\"Id_Producto\":\"Nt3cE\",\"N_Producto\":\"Parlantes\",\"Stock_Actual\":5,\"Stock_Minimo\":5,\"Institucion\":\"IPVC\",\"Tipo\":\"Perifericos\",\"Ubicacion\":\"Oficina In\",\"Observacion\":\"Pocas unidades en buen estado\",\"Func_Agrega\":\"19.040.510-9\",\"F_Agregado\":\"2022-02-16T16:04:48.000Z\"},\"qty\":6}},\"CantTotal\":7},\"productos\":true}'),
('MD36DMpErrXZgpxvAF64zTFaj78-SISV', 1645201054, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"level2\":true,\"level3\":true,\"passport\":{\"user\":\"19.040.510-9\"}}'),
('_pIRncfbr11iCPlpDptq5GYLpwYGcI-g', 1645218193, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"level2\":true,\"level3\":true,\"passport\":{\"user\":\"19.040.510-9\"},\"cart\":{\"items\":{\"1blqh\":{\"items\":{\"Id_Producto\":\"1blqh\",\"N_Producto\":\"Telefonos IP\",\"Stock_Actual\":15,\"Stock_Minimo\":16,\"Institucion\":\"IPVC\",\"Tipo\":\"Perifericos\",\"Ubicacion\":\"Oficina In\",\"Observacion\":\"Mayoria de dispositivos desplegados\",\"Func_Agrega\":\"19.040.510-9\",\"F_Agregado\":\"2022-02-16T15:40:48.000Z\"},\"qty\":1}},\"CantTotal\":3},\"productos\":true}'),
('n-Sg7Rgl4Ym5NqTJ2_6JzMU9yu-DTLmO', 1645218446, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"level2\":true,\"level3\":true,\"passport\":{\"user\":\"19.040.510-9\"},\"cart\":{\"items\":{\"Nt3cE\":{\"items\":{\"Id_Producto\":\"Nt3cE\",\"N_Producto\":\"Parlantes\",\"Stock_Actual\":5,\"Stock_Minimo\":5,\"Institucion\":\"IPVC\",\"Tipo\":\"Perifericos\",\"Ubicacion\":\"Oficina In\",\"Observacion\":\"Pocas unidades en buen estado\",\"Func_Agrega\":\"19.040.510-9\",\"F_Agregado\":\"2022-02-16T16:04:48.000Z\"},\"qty\":1}},\"CantTotal\":2},\"productos\":true}'),
('sPx7NzV5H6YMz3VKeZL_SqN0I7nt46VH', 1645218042, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"level2\":true,\"level3\":true,\"passport\":{\"user\":\"19.040.510-9\"},\"cart\":{\"items\":{},\"CantTotal\":15},\"productos\":true}');

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
  `EntregaF` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`EntregaF`)),
  `F_Solicitud` timestamp NOT NULL DEFAULT current_timestamp(),
  `F_Respuesta` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, '{\n	\"id\": \"wafle48@gmail.com\",\n	\"ps\": \"1234\"\n}', '2022-02-17 20:15:50', 0);

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
('19.040.510-9', 'Jonathan Rojas', '$2a$10$bFXDHtyna4pBzFZVuO7CHO3XKwMVooXfuYzLRvsQgTzwoLOPrJlfe', 'Administrador', 'IPVC', 'Habilitado', '2022-02-15 20:08:54', '2022-02-17 21:07:14');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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

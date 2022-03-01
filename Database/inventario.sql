-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-03-2022 a las 19:23:40
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
-- Estructura de tabla para la tabla `modificaciones_productos`
--

CREATE TABLE `modificaciones_productos` (
  `Id_Producto` varchar(20) NOT NULL,
  `Cant_Previa` int(4) NOT NULL,
  `Cant_Nueva` int(4) NOT NULL,
  `Id_Usuario` varchar(15) NOT NULL,
  `Fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `modificaciones_productos`
--

INSERT INTO `modificaciones_productos` (`Id_Producto`, `Cant_Previa`, `Cant_Nueva`, `Id_Usuario`, `Fecha`) VALUES
('CEjdJ', 5, 4, '11.111.111-1', '2022-02-21 21:15:51'),
('UxdD6', 3, 5, '11.111.111-1', '2022-02-21 21:18:31'),
('CEjdJ', 4, 4, '11.111.111-1', '2022-02-23 18:22:17'),
('CEjdJ', 4, 4, '44.444.444-4', '2022-02-24 18:35:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mod_usuarios`
--

CREATE TABLE `mod_usuarios` (
  `Id_Usuario` varchar(15) NOT NULL,
  `Psw` varchar(24) NOT NULL,
  `Psw_Antiguo` varchar(24) NOT NULL,
  `Fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Estado` varchar(14) DEFAULT NULL,
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
('CEjdJ', 'amonio', 4, 2, 'IPVC', 'Seleccione Cate', 'Bodega 1', 'Hay pocos', '11.111.111-1', '2022-02-21 19:01:05'),
('cm0gO', 'Monitor LG', 33, 35, 'IPVC', 'Perifericos', 'Oficina Informatica', 'Algunos en oficina informatica y otros en bodega', '19.040.510-9', '2022-02-18 13:47:32'),
('EK0JW', 'TN-450', 1, 3, 'IPVC', 'Toners', 'Oficina Informatica', '', '19.040.510-9', '2022-02-18 13:51:27'),
('gfdyy', 'Access Point Huawei', 5, 3, 'IPVC', 'Productos Elect', 'Oficina Informatica', '3 desplegados (4to piso,3er Piso, Patio)\r\n2 en oficina a la espera de nuevos Switch', '11.111.111-1', '2022-02-23 18:18:19'),
('Iblqh', 'Telefonos IP', 18, 15, 'IPVC', 'Perifericos', 'Oficina Informatica', 'Todos los dispositivos estan desplegados en sede', '19.040.510-9', '2022-02-16 15:40:48'),
('LPzOl', 'TN-2370', 3, 2, 'IPVC', 'Toners', 'Oficina Informatica', 'Realizar solicitud del producto', '19.040.510-9', '2022-02-18 13:52:33'),
('Nt3cE', 'Parlantes', 7, 5, 'IPVC', 'Perifericos', 'Oficina Informatica', 'Pocas unidades en buen estado', '19.040.510-9', '2022-02-16 16:04:48'),
('ohYME', 'Samgung M2020W', 2, 1, 'IPVC', 'Impresoras', 'Oficina Informatica', '1 En Oficina Director Sede\r\n1 En ofinica Informatica (cambiada por impresora personal de Finanzas)', '19.040.510-9', '2022-02-19 14:15:52'),
('sCPFs', 'Tn-1060', 3, 2, 'IPVC', 'Toners', 'Oficina Informatica', 'Hay pocos, se necesitan mas', '19.040.510-9', '2022-02-18 13:45:38'),
('tFrUR', 'Servidor', 1, 0, 'IPVC', 'Computadoras', 'Oficina Informatica', 'Activo sin observaciones', '11.111.111-1', '2022-02-23 18:24:03'),
('UxdD6', 'MLTD-111L', 3, 4, 'UB', 'Toners', 'Oficina Informatica', 'Se necesitan minimo 2 por oficina', '19.040.510-9', '2022-02-18 13:46:19'),
('ZzDxY', 'DCP-T510', 1, 1, 'IPVC', 'Impresoras', 'Oficina Informatica', 'Instalada en Admision', '11.111.111-1', '2022-02-23 18:15:17');

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
('_nXvkHoruMZaOUB-MoRhyNgFLVEMJNMS', 1646233810, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"productos\":false,\"level3\":true,\"passport\":{\"user\":\"11.111.111-1\"},\"level2\":false,\"cart\":null,\"CantidadTotal\":null}');

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
  `F_Respuesta` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `solicitudes`
--

INSERT INTO `solicitudes` (`Id_Solicitud`, `Id_Usuario`, `PSolicitados`, `Estado`, `Id_Usuario_Entrega`, `Observacion`, `PrEntregados`, `F_Solicitud`, `F_Respuesta`) VALUES
('aaRfbjSKfA', '11.111.111-1', '{\n	\"cm0gO\": {\n		\"items\": {\n			\"Id_Producto\": \"cm0gO\",\n			\"N_Producto\": \"Monitor LG\",\n			\"Stock_Actual\": 35,\n			\"Stock_Minimo\": 35,\n			\"Institucion\": \"IPVC\",\n			\"Tipo\": \"Perifericos\",\n			\"Ubicacion\": \"Oficina Informatica\",\n			\"Observacion\": \"Algunos en oficina informatica y otros en bodega\",\n			\"Func_Agrega\": \"19.040.510-9\",\n			\"F_Agregado\": \"2022-02-18T13:47:32.000Z\"\n		},\n		\"qty\": 1\n	}\n}', 'Entregada', '11.111.111-1', '', '{\n	\"cm0gO\": {\n		\"items\": {\n			\"Id_Producto\": \"cm0gO\",\n			\"N_Producto\": \"Monitor LG\",\n			\"Stock_Actual\": 35,\n			\"Stock_Minimo\": 35,\n			\"Institucion\": \"IPVC\",\n			\"Tipo\": \"Perifericos\",\n			\"Ubicacion\": \"Oficina Informatica\",\n			\"Observacion\": \"Algunos en oficina informatica y otros en bodega\",\n			\"Func_Agrega\": \"19.040.510-9\",\n			\"F_Agregado\": \"2022-02-18T13:47:32.000Z\"\n		},\n		\"qty\": \"2\"\n	}\n}', '2022-02-21 19:40:35', '2022-02-23 19:16:00'),
('CUjOKxRzwp', '11.111.111-1', '{\n	\"UxdD6\": {\n		\"items\": {\n			\"Id_Producto\": \"UxdD6\",\n			\"N_Producto\": \"MLTD-111L\",\n			\"Stock_Actual\": 3,\n			\"Stock_Minimo\": 4,\n			\"Institucion\": \"UB\",\n			\"Tipo\": \"Toners\",\n			\"Ubicacion\": \"Oficina Informatica\",\n			\"Observacion\": \"Se necesitan minimo 2 por oficina\",\n			\"Func_Agrega\": \"19.040.510-9\",\n			\"F_Agregado\": \"2022-02-18T13:46:19.000Z\"\n		},\n		\"qty\": 1\n	}\n}', 'Entregada', '11.111.111-1', '', '{\n	\"UxdD6\": {\n		\"items\": {\n			\"Id_Producto\": \"UxdD6\",\n			\"N_Producto\": \"MLTD-111L\",\n			\"Stock_Actual\": 3,\n			\"Stock_Minimo\": 4,\n			\"Institucion\": \"UB\",\n			\"Tipo\": \"Toners\",\n			\"Ubicacion\": \"Oficina Informatica\",\n			\"Observacion\": \"Se necesitan minimo 2 por oficina\",\n			\"Func_Agrega\": \"19.040.510-9\",\n			\"F_Agregado\": \"2022-02-18T13:46:19.000Z\"\n		},\n		\"qty\": \"2\"\n	}\n}', '2022-02-21 19:36:33', '2022-02-22 14:48:01'),
('icwoGNfStV', '11.111.111-1', '{\n	\"cm0gO\": {\n		\"items\": {\n			\"Id_Producto\": \"cm0gO\",\n			\"N_Producto\": \"Monitor LG\",\n			\"Stock_Actual\": 35,\n			\"Stock_Minimo\": 35,\n			\"Institucion\": \"IPVC\",\n			\"Tipo\": \"Perifericos\",\n			\"Ubicacion\": \"Oficina Informatica\",\n			\"Observacion\": \"Algunos en oficina informatica y otros en bodega\",\n			\"Func_Agrega\": \"19.040.510-9\",\n			\"F_Agregado\": \"2022-02-18T13:47:32.000Z\"\n		},\n		\"qty\": 2\n	}\n}', 'Cancelada', '11.111.111-1', NULL, NULL, '2022-02-21 19:43:41', '2022-02-28 20:36:10'),
('kgSLxFmmVB', '33.333.333-3', '{\n	\"Nt3cE\": {\n		\"items\": {\n			\"Id_Producto\": \"Nt3cE\",\n			\"N_Producto\": \"Parlantes\",\n			\"Stock_Actual\": 7,\n			\"Stock_Minimo\": 5,\n			\"Institucion\": \"IPVC\",\n			\"Tipo\": \"Perifericos\",\n			\"Ubicacion\": \"Oficina Informatica\",\n			\"Observacion\": \"Pocas unidades en buen estado\",\n			\"Func_Agrega\": \"19.040.510-9\",\n			\"F_Agregado\": \"2022-02-16T16:04:48.000Z\"\n		},\n		\"qty\": 1\n	}\n}', 'Cancelada', '22.222.222-2', NULL, NULL, '2022-02-23 20:13:56', '2022-02-23 20:14:22'),
('kLOfXNhhmJ', '44.444.444-4', '{\n	\"CEjdJ\": {\n		\"items\": {\n			\"Id_Producto\": \"CEjdJ\",\n			\"N_Producto\": \"amonio\",\n			\"Stock_Actual\": 4,\n			\"Stock_Minimo\": 2,\n			\"Institucion\": \"IPVC\",\n			\"Tipo\": \"Seleccione Cate\",\n			\"Ubicacion\": \"Bodega 1\",\n			\"Observacion\": \"Hay pocos\",\n			\"Func_Agrega\": \"11.111.111-1\",\n			\"F_Agregado\": \"2022-02-21T19:01:05.000Z\"\n		},\n		\"qty\": 1\n	},\n	\"EK0JW\": {\n		\"items\": {\n			\"Id_Producto\": \"EK0JW\",\n			\"N_Producto\": \"TN-450\",\n			\"Stock_Actual\": 1,\n			\"Stock_Minimo\": 3,\n			\"Institucion\": \"IPVC\",\n			\"Tipo\": \"Toners\",\n			\"Ubicacion\": \"Oficina Informatica\",\n			\"Observacion\": \"\",\n			\"Func_Agrega\": \"19.040.510-9\",\n			\"F_Agregado\": \"2022-02-18T13:51:27.000Z\"\n		},\n		\"qty\": 1\n	}\n}', 'En Proceso', NULL, NULL, NULL, '2022-02-24 18:39:09', NULL),
('LaeRtOOdUS', '19.040.510-9', '{\n	\"cm0gO\": {\n		\"items\": {\n			\"Id_Producto\": \"cm0gO\",\n			\"N_Producto\": \"Monitor LG\",\n			\"Stock_Actual\": 60,\n			\"Stock_Minimo\": 35,\n			\"Institucion\": \"IPVC\",\n			\"Tipo\": \"Perifericos\",\n			\"Ubicacion\": \"Oficina Informatica\",\n			\"Observacion\": \"Algunos en oficina informatica y otros en bodega\",\n			\"Func_Agrega\": \"19.040.510-9\",\n			\"F_Agregado\": \"2022-02-18T13:47:32.000Z\"\n		},\n		\"qty\": 1\n	},\n	\"LPzOl\": {\n		\"items\": {\n			\"Id_Producto\": \"LPzOl\",\n			\"N_Producto\": \"TN-2370\",\n			\"Stock_Actual\": 1,\n			\"Stock_Minimo\": 2,\n			\"Institucion\": \"IPVC\",\n			\"Tipo\": \"Toners\",\n			\"Ubicacion\": \"Oficina Informatica\",\n			\"Observacion\": \"Realizar solicitud del producto\",\n			\"Func_Agrega\": \"19.040.510-9\",\n			\"F_Agregado\": \"2022-02-18T13:52:33.000Z\"\n		},\n		\"qty\": 1\n	}\n}', 'Entregada', '19.040.510-9', '', '{\n	\"cm0gO\": {\n		\"items\": {\n			\"Id_Producto\": \"cm0gO\",\n			\"N_Producto\": \"Monitor LG\",\n			\"Stock_Actual\": 60,\n			\"Stock_Minimo\": 35,\n			\"Institucion\": \"IPVC\",\n			\"Tipo\": \"Perifericos\",\n			\"Ubicacion\": \"Oficina Informatica\",\n			\"Observacion\": \"Algunos en oficina informatica y otros en bodega\",\n			\"Func_Agrega\": \"19.040.510-9\",\n			\"F_Agregado\": \"2022-02-18T13:47:32.000Z\"\n		},\n		\"qty\": \"1\"\n	},\n	\"LPzOl\": {\n		\"items\": {\n			\"Id_Producto\": \"LPzOl\",\n			\"N_Producto\": \"TN-2370\",\n			\"Stock_Actual\": 1,\n			\"Stock_Minimo\": 2,\n			\"Institucion\": \"IPVC\",\n			\"Tipo\": \"Toners\",\n			\"Ubicacion\": \"Oficina Informatica\",\n			\"Observacion\": \"Realizar solicitud del producto\",\n			\"Func_Agrega\": \"19.040.510-9\",\n			\"F_Agregado\": \"2022-02-18T13:52:33.000Z\"\n		},\n		\"qty\": \"1\"\n	}\n}', '2022-02-21 14:08:45', NULL),
('NSzuquwRvA', '33.333.333-3', '{\n	\"EK0JW\": {\n		\"items\": {\n			\"Id_Producto\": \"EK0JW\",\n			\"N_Producto\": \"TN-450\",\n			\"Stock_Actual\": 4,\n			\"Stock_Minimo\": 3,\n			\"Institucion\": \"IPVC\",\n			\"Tipo\": \"Toners\",\n			\"Ubicacion\": \"Oficina Informatica\",\n			\"Observacion\": \"\",\n			\"Func_Agrega\": \"19.040.510-9\",\n			\"F_Agregado\": \"2022-02-18T13:51:27.000Z\"\n		},\n		\"qty\": 1\n	}\n}', 'Entregada', '11.111.111-1', '', '{\n	\"EK0JW\": {\n		\"items\": {\n			\"Id_Producto\": \"EK0JW\",\n			\"N_Producto\": \"TN-450\",\n			\"Stock_Actual\": 4,\n			\"Stock_Minimo\": 3,\n			\"Institucion\": \"IPVC\",\n			\"Tipo\": \"Toners\",\n			\"Ubicacion\": \"Oficina Informatica\",\n			\"Observacion\": \"\",\n			\"Func_Agrega\": \"19.040.510-9\",\n			\"F_Agregado\": \"2022-02-18T13:51:27.000Z\"\n		},\n		\"qty\": \"3\"\n	}\n}', '2022-02-22 14:37:00', NULL),
('TAJeUzGGgN', '11.111.111-1', '{\n	\"EK0JW\": {\n		\"items\": {\n			\"Id_Producto\": \"EK0JW\",\n			\"N_Producto\": \"TN-450\",\n			\"Stock_Actual\": 4,\n			\"Stock_Minimo\": 3,\n			\"Institucion\": \"IPVC\",\n			\"Tipo\": \"Toners\",\n			\"Ubicacion\": \"Oficina Informatica\",\n			\"Observacion\": \"\",\n			\"Func_Agrega\": \"19.040.510-9\",\n			\"F_Agregado\": \"2022-02-18T13:51:27.000Z\"\n		},\n		\"qty\": 2\n	}\n}', 'Cancelada', '11.111.111-1', NULL, NULL, '2022-02-21 18:15:14', NULL),
('xExQSHBuan', '11.111.111-1', '{\n	\"CEjdJ\": {\n		\"items\": {\n			\"Id_Producto\": \"CEjdJ\",\n			\"N_Producto\": \"amonio\",\n			\"Stock_Actual\": 2,\n			\"Stock_Minimo\": 1,\n			\"Institucion\": \"IPVC\",\n			\"Tipo\": \"Seleccione Cate\",\n			\"Ubicacion\": \"Bodega 1\",\n			\"Observacion\": \"Hay pocos\",\n			\"Func_Agrega\": \"11.111.111-1\",\n			\"F_Agregado\": \"2022-02-21T19:01:05.000Z\"\n		},\n		\"qty\": 1\n	}\n}', 'Entregada', '11.111.111-1', 'Se entrego menos de lo solicitado', '{\n	\"CEjdJ\": {\n		\"items\": {\n			\"Id_Producto\": \"CEjdJ\",\n			\"N_Producto\": \"amonio\",\n			\"Stock_Actual\": 2,\n			\"Stock_Minimo\": 1,\n			\"Institucion\": \"IPVC\",\n			\"Tipo\": \"Seleccione Cate\",\n			\"Ubicacion\": \"Bodega 1\",\n			\"Observacion\": \"Hay pocos\",\n			\"Func_Agrega\": \"11.111.111-1\",\n			\"F_Agregado\": \"2022-02-21T19:01:05.000Z\"\n		},\n		\"qty\": \"2\"\n	}\n}', '2022-02-21 19:03:29', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trash`
--

CREATE TABLE `trash` (
  `id` varchar(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `numero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `trash`
--

INSERT INTO `trash` (`id`, `fecha`, `numero`) VALUES
('AA', '2022-02-23 20:17:15', 0),
('AB', '2022-02-23 20:17:24', 0);

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
('11.111.111-1', 'Admin', '$2a$10$PhYJl0Q4ZOGeZigtOf3krOSenGpVg0h5.1zJt4JHCr5LNy4LcP1Ou', 'Administrador', 'IPVC', 'Habilitado', '2022-02-21 16:01:10', '2022-02-28 18:14:03'),
('19.040.510-9', 'Jonathan Rojas', '$2a$10$bFXDHtyna4pBzFZVuO7CHO3XKwMVooXfuYzLRvsQgTzwoLOPrJlfe', 'Administrador', 'IPVC', 'Habilitado', '2022-02-15 20:08:54', '2022-02-21 16:11:59'),
('22.222.222-2', 'auxiliar', '$2a$10$Usm9jjV9yzOjV9Ar9P220O9IeUwFSd9ElGu2Oo97w4db0jj/3qG8K', 'Auxiliar', 'IPVC', 'Habilitado', '2022-02-21 16:05:24', '2022-02-23 20:14:09'),
('33.333.333-3', 'Funcionario', '$2a$10$ZBGDCpjtP/.HBZ/HaBpTf.hs3JkI9QwZ8sV6UUmmWzgBR3lr1mkO.', 'Funcionario', 'IPVC', 'Habilitado', '2022-02-21 16:02:02', '2022-02-23 19:42:08'),
('44.444.444-4', 'Funcionario 2', '$2a$10$7lWHlOuopipJwkhbfRJ36.4pj2oAGvqraJwBom9DSASVTjO5XVcN6', 'Administrador', 'UB', 'Habilitado', '2022-02-24 18:27:17', '2022-02-24 18:31:28'),
('55.555.555-5', 'Prueba', '$2a$10$OlubxC9FQY/hdVXOGAoCj.nJZxvJAtB98CAI2XLqDbwOUfoFkU.iG', 'Funcionario', 'IPVC', 'Habilitado', '2022-02-24 18:31:48', '2022-02-24 18:31:48');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `modificaciones_productos`
--
ALTER TABLE `modificaciones_productos`
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
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `modificaciones_productos`
--
ALTER TABLE `modificaciones_productos`
  ADD CONSTRAINT `modificaciones_productos_ibfk_1` FOREIGN KEY (`Id_Producto`) REFERENCES `productos` (`Id_Producto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `modificaciones_productos_ibfk_2` FOREIGN KEY (`Id_Usuario`) REFERENCES `users` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

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

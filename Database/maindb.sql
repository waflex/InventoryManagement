-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-02-2022 a las 05:18:10
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
('sd564f', 'Alcohol Gel', 50, 10, 'IPVC', 'Limpieza', 'Bodega 1', 'Alto Stock', 'Admin', '2022-02-12 04:13:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes`
--

CREATE TABLE `solicitudes` (
  `Id_Solicitud` varchar(10) NOT NULL,
  `Id_Usuario` varchar(15) NOT NULL,
  `Id_Producto` varchar(20) NOT NULL,
  `Cantidad` varchar(3) NOT NULL,
  `Estado` varchar(10) NOT NULL,
  `Id_Usuario_Entrega` varchar(15) DEFAULT NULL,
  `Observacion` varchar(250) DEFAULT NULL,
  `Cant_Final` varchar(3) DEFAULT NULL,
  `F_Solicitud` timestamp NOT NULL DEFAULT current_timestamp(),
  `F_Respuesta` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `ID` varchar(15) NOT NULL,
  `Nom_usu` varchar(50) NOT NULL,
  `Cont_usu` varchar(24) NOT NULL,
  `Lst_conn` timestamp NULL DEFAULT current_timestamp(),
  `F_add` timestamp NOT NULL DEFAULT current_timestamp(),
  `Estado` varchar(14) NOT NULL,
  `Cargo` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`ID`, `Nom_usu`, `Cont_usu`, `Lst_conn`, `F_add`, `Estado`, `Cargo`) VALUES
('Admin', 'Admin', 'Admin', '2022-02-12 04:12:43', '2022-02-12 04:12:43', 'Habilitado', 'Administrador');

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
-- Indices de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD PRIMARY KEY (`Id_Solicitud`),
  ADD KEY `Id_Usuario` (`Id_Usuario`,`Id_Producto`,`Id_Usuario_Entrega`),
  ADD KEY `Id_Producto` (`Id_Producto`),
  ADD KEY `Id_Usuario_Entrega` (`Id_Usuario_Entrega`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

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
  ADD CONSTRAINT `solicitudes_ibfk_1` FOREIGN KEY (`Id_Producto`) REFERENCES `productos` (`Id_Producto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `solicitudes_ibfk_2` FOREIGN KEY (`Id_Usuario`) REFERENCES `users` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `solicitudes_ibfk_3` FOREIGN KEY (`Id_Usuario_Entrega`) REFERENCES `users` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

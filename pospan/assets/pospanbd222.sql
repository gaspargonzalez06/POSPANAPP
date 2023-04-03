

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";



CREATE TABLE `detalles` (
  `cantidad` double NOT NULL,
  `id` varchar(50) NOT NULL,
  `impuesto` double NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `ordenesid` varchar(50) NOT NULL,
  `precio` double NOT NULL,
  `subtotal` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes`
--

CREATE TABLE `ordenes` (
  `id` varchar(50) NOT NULL,
  `impuesto` double NOT NULL,
  `subtotal` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `detalles`
--
ALTER TABLE `detalles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ordenesid` (`ordenesid`);

--
-- Indices de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD PRIMARY KEY (`id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalles`
--
ALTER TABLE `detalles`
  ADD CONSTRAINT `detalles_ibfk_1` FOREIGN KEY (`ordenesid`) REFERENCES `ordenes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

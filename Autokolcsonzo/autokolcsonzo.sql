-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Nov 04. 12:45
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `autokolcsonzo`
--
CREATE DATABASE IF NOT EXISTS `autokolcsonzo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `autokolcsonzo`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `buy`
--

CREATE TABLE `buy` (
  `rent_id` int(11) NOT NULL,
  `cars_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `vegosszeg` decimal(10,0) NOT NULL,
  `fizetesi_status` enum('Kifizetve','Függőben','Nincs kifizetve') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `car`
--

CREATE TABLE `car` (
  `cars_id` int(11) NOT NULL,
  `gyarto_es_modell` varchar(100) NOT NULL,
  `evjarat` int(11) NOT NULL,
  `szin` varchar(20) NOT NULL,
  `uzemanyag` enum('Diesel','Benzin','Elektromos') NOT NULL,
  `valto_tipus` enum('Automata','Kézi 5 sebességes','Kézi 6 sebességes') NOT NULL,
  `utasok_szama` enum('5','7') NOT NULL,
  `ar` decimal(10,0) NOT NULL,
  `img` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `car`
--

INSERT INTO `car` (`cars_id`, `gyarto_es_modell`, `evjarat`, `szin`, `uzemanyag`, `valto_tipus`, `utasok_szama`, `ar`, `img`) VALUES
(1, 'Audi A6', 2023, 'fehér', 'Elektromos', 'Automata', '7', 3000000, ''),
(2, 'Audi A4', 2004, 'piros', 'Benzin', 'Kézi 5 sebességes', '5', 2000000, ''),
(3, 'Mercedes CLA', 2021, 'fekete', 'Elektromos', 'Automata', '7', 4000000, ''),
(4, 'BMW X5', 2011, 'fehér', 'Benzin', 'Automata', '7', 2500000, ''),
(5, 'Audi Q3', 2013, 'fehér', 'Diesel', 'Kézi 6 sebességes', '7', 2000000, ''),
(6, 'Mercedes GLC', 2018, 'feher', 'Diesel', 'Automata', '5', 35000000, ''),
(7, 'Mercedes GT 63s', 2023, 'szürke', 'Benzin', 'Automata', '5', 45000000, ''),
(8, 'Audi RS Q8', 2023, 'fekete', 'Diesel', 'Automata', '7', 60000000, ''),
(10, 'Opel Corsa', 2003, 'fekete', 'Benzin', 'Automata', '5', 850000, ''),
(11, 'Ford Raptor', 2023, 'fekete', 'Benzin', 'Automata', '5', 4500000, ''),
(12, 'Suzuki Swift', 2000, 'fekete', 'Benzin', 'Kézi 5 sebességes', '5', 250000, ''),
(20, 'Audi Q7', 2023, 'fehér', 'Elektromos', 'Automata', '7', 2500000, ''),
(21, 'BMW M4', 2014, 'sárga', 'Benzin', 'Automata', '5', 3500000, '');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`userid`, `fullname`, `username`, `password`) VALUES
(2, 'Szivós Patrik', 'patrik', '1234'),
(3, 'Kecsekméti Csenge', 'csenge', 'ATRxrp20');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `buy`
--
ALTER TABLE `buy`
  ADD PRIMARY KEY (`rent_id`),
  ADD UNIQUE KEY `cars_id` (`cars_id`),
  ADD UNIQUE KEY `users_id` (`users_id`);

--
-- A tábla indexei `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`cars_id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `fullname` (`fullname`,`username`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `buy`
--
ALTER TABLE `buy`
  MODIFY `rent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `car`
--
ALTER TABLE `car`
  MODIFY `cars_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `buy`
--
ALTER TABLE `buy`
  ADD CONSTRAINT `buy_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `buy_ibfk_2` FOREIGN KEY (`cars_id`) REFERENCES `car` (`cars_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

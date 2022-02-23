-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Feb 13. 16:10
-- Kiszolgáló verziója: 10.4.14-MariaDB
-- PHP verzió: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `mlbb`
--
CREATE DATABASE IF NOT EXISTS `mlbb` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `mlbb`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `heros`
--

CREATE TABLE `heros` (
  `id` int(11) NOT NULL,
  `hos_id` int(11) NOT NULL,
  `hos_nev` text COLLATE utf8_hungarian_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `hos_leiras` text COLLATE utf8_hungarian_ci NOT NULL,
  `kep` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `heros`
--

INSERT INTO `heros` (`id`, `hos_id`, `hos_nev`, `role_id`, `hos_leiras`, `kep`) VALUES
(1, 1, 'Franco', 1, '', 'franco.jpg'),
(2, 2, 'Minotaur', 1, '', 'minotaur.jpg'),
(3, 3, 'Tigreal', 1, '', 'tigreal.jpg'),
(4, 4, 'Johnson', 1, '', 'johnson.jpg'),
(5, 5, 'Lolita', 1, '', 'lolita.jpg'),
(6, 6, 'Chou', 2, '', 'chou.jpg'),
(7, 7, 'Paquito', 2, '', 'paquito.jpg'),
(8, 8, 'Badang', 2, '', 'badang.jpg'),
(9, 9, 'Lapu Lapu', 2, '', 'lapu.jpg'),
(10, 10, 'Ruby', 2, '', 'ruby.jpg'),
(11, 11, 'Aamon', 3, '', 'aamon.jpg'),
(12, 12, 'Gusion', 3, '', 'gusion.jpg'),
(13, 13, 'Fanny', 3, '', 'fanny.jpg'),
(14, 14, 'Benedetta', 3, '', 'benedetta.jpg'),
(15, 15, 'Hayabusa', 3, '', 'hayabusa.jpg'),
(16, 16, 'Kagura', 4, '', 'kagura.jpg'),
(17, 17, 'Cyclops', 4, '', 'cyclops.jpg'),
(18, 18, 'Pharsa', 4, '', 'pharsa.jpg'),
(19, 19, 'Odette', 4, '', 'odette.jpg'),
(20, 20, 'Vale', 4, '', 'vale.jpg'),
(21, 21, 'Beatrix', 5, '', 'beatrix.jpg'),
(22, 22, 'Hanabi', 5, '', 'hanabi.jpg'),
(23, 23, 'Lesley', 5, '', 'lesley.jpg'),
(24, 24, 'Popol és Kupa', 5, '', 'popol.jpg'),
(25, 25, 'Granger', 5, '', 'granger.jpg'),
(26, 26, 'Angela', 6, '', 'angela.jpg'),
(27, 27, 'Estes', 6, '', 'estes.jpg'),
(28, 28, 'Floryn', 6, '', 'floryn.jpg'),
(29, 29, 'Diggie', 6, '', 'diggie.jpg'),
(30, 30, 'Rafaela', 6, '', 'rafaela.jpg'),
(31, 31, 'Ling', 3, '', 'ling.jpg');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `item_nev` text COLLATE utf8_hungarian_ci NOT NULL,
  `ar` int(11) NOT NULL,
  `leiras` text COLLATE utf8_hungarian_ci NOT NULL,
  `tipus_id` int(11) NOT NULL,
  `kep` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `items`
--

INSERT INTO `items` (`id`, `item_nev`, `ar`, `leiras`, `tipus_id`, `kep`) VALUES
(1, 'Tengeri Alabárd', 2050, '80 fizikai támadóerő\r\n25% támadási sebesség\r\nPasszív: Életregeneráció/Pajzs csökkentés támadás esetén a célpontnak 50%-al 3mp-re', 1, 'tengeri_alabard.jpg'),
(2, 'Rose Gold Meteor', 2120, '60 fizikai támadóerő\r\n30 mágia ellenállás\r\n5% fizikai életlopás\r\nPasszív: A hős életereje ha 30% alá csökken pajzsot generál, mely 510-1350 sebzést nyel el(szinttel növekszik). Növeli a mágikus ellenállást 25-el. A pajzs 3mp-ig érvényes, újratöltési ideje 40mp.', 1, 'rose_gold.jpg'),
(3, 'Vérszomj fejsze', 1970, '70 fizikai támadóerő\r\n10% újratöltés csökkentés\r\nPasszív: 20% képességek általi életlopás', 1, 'verszomj.jpg'),
(4, 'Végtelen harc', 2470, '65 fizikai támadóerő\r\n5 mana regeneráció\r\n250 életerő\r\n10% újratöltés csökkentés\r\n10% fizikai életlopás\r\n5% mozgási sebesség\r\nPasszív: Minden alaptámadás igaz sebzést okoz az ellenfélnek a használt képességek után 3mp-en belül. A sebzés értéke a fizikai támadóerő 60%-a. Az aktiválódás során a mozgási sebesség 10%-al. Újratöltési ideje 1.5mp.', 1, 'vegtelen.jpg'),
(5, 'Kétségbeesés pengéje', 3010, '160 fizikai támadóerő\r\n5% mozgási sebesség\r\nPasszív: Ha az ellenfél életereje 50% alá esik a fizikai támadóerő megnövekszik 25%-al 2mp-ig.', 1, 'ketsegbeeses.jpg'),
(6, 'Berserker dühe', 2250, '65 fizikai támadóerő\r\n25% kritikus találati esély\r\nPasszív:40% kritikus sebzés. A kritikus találatok növelik a fizikai támadóerőt 5%-al 2mp-re', 1, 'berserker.jpg'),
(7, 'Szent kristály', 2180, '100 varázserő\r\nPasszív: Növeli a mágikus erőt 21-35%-al szinttel arányosan', 2, 'szentkristaly.jpg'),
(8, 'Mennyei toll', 2030, '55 varázserő\r\n30% támadási sebesség\r\n5% újratöltés csökkentés\r\nPasszív: Az alaptámadások plusz mágikus sebzést okoznak 50+30% mágikus erő formájában', 2, 'mennyeitoll.jpg'),
(9, 'Kitartás nyaklánca', 2010, '60 varázserő\r\n5% újratöltés csökkentés\r\n10% képességek általi életlopás\r\nPasszív: Életregeneráció és pajzs csökkent az ellenfélnek 50%-al 3mp-ig', 2, 'kitartasnyaklanca.jpg'),
(10, 'Mennyei pallos', 1970, '65 varázserő\r\nPasszív: 35% mágia átütés', 2, 'pallos.jpg'),
(11, 'Véres szárnyak', 3000, '150 varázserő\r\n500 életerő\r\nPasszív: Pajzsot generál 200% varázserővel egyenértékben. 30mp után ha elfogyott újra generálódik', 2, 'veresszarny.jpg'),
(12, 'Jövendölő palást', 2060, '850 életerő\r\n42 mágia ellenállás\r\n10% újratöltés csökkentés\r\nPasszív: Növeli a pajzsok elnyelési képességét és az életregenerációt 30%-al', 3, 'jovendoles.jpg'),
(13, 'Penge páncél', 1660, '90 fizikai ellenállás\r\nPasszív: A kapott alaptámadások 25%-át visszasebzi az ellenfélnek és 1mp-re lassítja őt 15%-al', 3, 'penge.jpg'),
(14, 'Antik mellvért', 2170, '920 életerő\r\n54 fizikai ellenállás\r\n4 életregeneráció\r\nPasszív: Ha egy ellenség képessége megsebzi akkor a támadóerejét csökkenti 8%-al 2mp-re. 3x halmozható.', 3, 'antik.jpg'),
(15, 'Királynő szárnyai', 2250, '25 fizikai támadóerő\r\n900 életerő\r\n10% újratöltés csökkentés\r\nPasszív: Ha az életerő 40% alá esik a kapott sebzés 20%-al csökken és növeli a képességek általi életlopást 25%-al 5mp-re. Újratöltési ideje 1 perc', 3, 'kiralyno.jpg'),
(16, 'Elátkozott sisak', 1760, '1200 életerő\r\n25 mágia ellenállás\r\nPasszív: 1.5% mágikus sebzést okoz mpnként a közeli ellenfeleknek max életerejüktől függően. 50% plusz sebzést okoz minionoknak.', 3, 'elatkozott.jpg'),
(17, 'Fürgeség csizmája', 850, '80 mozgási sebesség\r\nPasszív: Sebzést vagy kiosztott sebzést követően 40 ponttal csökken a mozgási sebesség 5mp-re.', 4, 'furgeseg.jpg'),
(18, 'Gyorsaság csizmája', 710, '40 mozgási sebesség\r\n15% támadási sebesség', 4, 'gyorsasag.jpg'),
(19, 'Újratöltés csizmája', 710, '40 mozgási sebesség\r\n10% újratöltés csökkentés', 4, 'ujratoltes.jpg'),
(20, 'Arkán csizma', 690, '40 mozgási sebesség\r\n10 mágia átütés', 4, 'arkan.jpg'),
(21, 'Ellenállás csizmája', 700, '40 mozgási sebesség\r\n22 mágia ellenállás\r\nPasszív: A kontrolláló képességek hatása csökken 30%-al', 4, 'ellenallas.jpg'),
(22, 'Tűz büntetés', 0, 'Cipővel és büntetéssel együtt alkalmazható!\r\nSzörnyeknek, minionoknak 150% sebzés. Ellenfeleken is alkalmazható 100 igaz sebzést okozva és 52-80 fizikai támadóerőt csökkent számára 5mp-ig.', 5, 'tuz.jpg'),
(23, 'Jég büntetés', 0, 'Cipővel és büntetéssel együtt alkalmazható!\r\nSzörnyeknek, minionoknak 150% sebzés. Ellenfeleken is alkalmazható 100 igaz sebzést okozva és 72-100 mozgási sebességet csökkent számára 5mp-ig.', 5, 'jeg.jpg'),
(24, 'Véres büntetés', 0, 'Cipővel és büntetéssel együtt alkalmazható!\r\nSzörnyeknek, minionoknak 150% sebzés. Ellenfeleken is alkalmazható 100 igaz sebzést okozva és életerőt csökkent 12.5% értékben az üldöző életerejétől függően 5mp-ig.', 5, 'veres.jpg'),
(25, 'Láthatatlanság', 0, 'A saját magad és szövetségesek láthatatlanokká válhattok az ellenfél számára 5mp-ig (növelve a mozgási sebességet 30-75%-al a kapott aranytól függően) vagy míg sebzést nem adsz vagy kapsz.\r\nMegvétel után nem kapsz tapasztalatot és aranyat a szörnyekből és minionokból! (600 arany kigyűjtése után aktiválható tetszőleges időkben és 1500 aranyig halmozható)', 6, 'lathatatlan.jpg'),
(26, 'Bátorság', 0, 'A közeli csapattársak fizikai és mágikus erejét növeli 12-30 ponttal (a kapott aranytól függően) és a mozgási valamint támadási sebességet 15%-al.\r\nMegvétel után nem kapsz tapasztalatot és aranyat a szörnyekből és minionokból! (600 arany kigyűjtése után aktív és 1500 aranyig halmozható)', 6, 'batorsag.jpg'),
(27, 'Szívesség', 0, 'Minden 10mp után a regeneráló képességekből plusz 300-750 (a kapott aranytól függően) életerőt tölt vissza a legkisebb életerővel rendelkező csapattársnak.\r\nMegvétel után nem kapsz tapasztalatot és aranyat a szörnyekből és minionokból! (600 arany kigyűjtése után aktív és 1500 aranyig halmozható)', 6, 'szivesseg.jpg'),
(28, 'Fagyos csapás', 0, 'Minden 30mp után csökkenti az ellenfél teljes életerejét 35%-al és extra sebzést oszt ki 7-18%-a az ellenfél maximum életerejének megfelelően (a kapott aranytól függően)\r\nMegvétel után nem kapsz tapasztalatot és aranyat a szörnyekből és minionokból! (600 arany kigyűjtése után aktív és 1500 aranyig halmozható)', 6, 'fagy.jpg');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `items_type`
--

CREATE TABLE `items_type` (
  `id` int(11) NOT NULL,
  `item_fajta` text COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `items_type`
--

INSERT INTO `items_type` (`id`, `item_fajta`) VALUES
(1, 'Támadás'),
(2, 'Mágikus'),
(3, 'Védelem'),
(4, 'Mozgás'),
(5, 'Dzsungel'),
(6, 'Roam');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `laning`
--

CREATE TABLE `laning` (
  `id` int(11) NOT NULL,
  `role` text COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `laning`
--

INSERT INTO `laning` (`id`, `role`) VALUES
(1, 'Tank'),
(2, 'Fighter'),
(3, 'Assassin'),
(4, 'Mage'),
(5, 'Marksman'),
(6, 'Support');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `heros`
--
ALTER TABLE `heros`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hos_id` (`hos_id`);

--
-- A tábla indexei `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `items_type`
--
ALTER TABLE `items_type`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `laning`
--
ALTER TABLE `laning`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `heros`
--
ALTER TABLE `heros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT a táblához `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT a táblához `items_type`
--
ALTER TABLE `items_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `laning`
--
ALTER TABLE `laning`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

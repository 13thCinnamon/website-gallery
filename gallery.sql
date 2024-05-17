-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 17 2024 г., 16:02
-- Версия сервера: 5.7.39
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `gallery`
--

-- --------------------------------------------------------

--
-- Структура таблицы `genre`
--

CREATE TABLE `genre` (
  `genre_id` int(11) NOT NULL,
  `genre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `genre`
--

INSERT INTO `genre` (`genre_id`, `genre`) VALUES
(1, 'Пейзаж'),
(2, 'Портрет'),
(3, 'Архитектура'),
(4, 'Космос'),
(5, 'Еда'),
(6, 'Животные'),
(7, 'Макро'),
(8, 'Натюрморт');

-- --------------------------------------------------------

--
-- Структура таблицы `photo`
--

CREATE TABLE `photo` (
  `photo_id` int(11) NOT NULL,
  `image` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `photo`
--

INSERT INTO `photo` (`photo_id`, `image`, `genre_id`) VALUES
(1, 'assets\\image\\landscape\\breathtaking-view-of-zugspitze-lake-surrounded-with-forests-in-eibsee_181624-9813.jpg', 1),
(2, 'assets\\image\\landscape\\digital-art-isolated-house_23-2151041322.jpg', 1),
(3, 'assets\\image\\landscape\\mountainous-nature-landscape-with-lake_23-2150705761.jpg', 1),
(4, 'assets\\image\\landscape\\mountains-lake_1398-1033.jpg', 1),
(5, 'assets\\image\\landscape\\mountains-lake_1398-1150.jpg', 1),
(6, 'assets\\image\\landscape\\perspective-of-beautiful-tree-canopy_23-2151305173.jpg', 1),
(7, 'assets\\image\\landscape\\view-of-nature-landscape-with-flowers-field_23-2150763616.jpg', 1),
(8, 'assets\\image\\portrait\\ai-generated-of-man-bloom-portrait_23-2150693178.jpg', 2),
(9, 'assets\\image\\portrait\\elegant-woman-posing-with-painted-face_23-2148364888.jpg', 2),
(10, 'assets\\image\\portrait\\front-view-woman-posing-with-black-outfit_23-2151044538.jpg', 2),
(11, 'assets\\image\\portrait\\portrait-of-beautiful-woman_23-2148780008.jpg', 2),
(12, 'assets\\image\\architecture\\architectural-building-city-with-trees_23-2148798628.jpg', 3),
(13, 'assets\\image\\architecture\\close-up-on-tall-buildings-against-the-sky_23-2149063326.jpg', 3),
(14, 'assets\\image\\architecture\\columns-balcony-beautiful-old-building_181624-8950.jpg', 3),
(15, 'assets\\image\\architecture\\low-angle-view-closed-door-building_1048944-7146585.jpg', 3),
(16, 'assets\\image\\architecture\\neo-brutalism-inspired-building_23-2151004727.jpg', 3),
(17, 'assets\\image\\architecture\\vertical-grayscale-shot-beautiful-balcony-old-building-with-columns_181624-58207.jpg', 3),
(18, 'assets\\image\\architecture\\vertical-grayscale-shot-old-historical-building-with-arch-shaped-door_181624-58031.jpg', 3),
(19, 'assets\\image\\space\\galaxy-night-view_23-2148895305.jpg', 4),
(20, 'assets\\image\\space\\night-sky-reveals-glowing-nebula-amidst-star-field-generated-by-ai_188544-15597.jpg', 4),
(21, 'assets\\image\\space\\panorama-milky-way-galaxy-on-a-night-sky-long-exposure-photograph-with-grain_33900-127.jpg', 4),
(22, 'assets\\image\\space\\photorealistic-earth-planet_23-2151075873.jpg', 4),
(23, 'assets\\image\\space\\photorealistic-galaxy-background_23-2151064385.jpg', 4),
(24, 'assets\\image\\space\\photorealistic-galaxy-background_23-2151064423.jpg', 4),
(25, 'assets\\image\\food\\caesar-salad-with-chicken-on-a-wooden-board_140725-3212.jpg', 5),
(26, 'assets\\image\\food\\close-up-hand-holding-plate-with-food_23-2148814494.jpg', 5),
(27, 'assets\\image\\food\\grilled-chicken-salad-with-tomatoes-and-herbs-in-a-bowl_641010-14592.jpg', 5),
(28, 'assets\\image\\food\\tasty-boiled-spaghetti-pasta-with-basil-leaves-and-tomato-on-sack-with-bread-sticks-and-veg-salad_23-2148076247.jpg', 5),
(29, 'assets\\image\\food\\top-view-delicious-mahi-mahi-fish-with-lemon_23-2150457330.jpg', 5),
(30, 'assets\\image\\food\\top-view-delicious-mahi-mahi-fish-with-lemon_23-2150457352.jpg', 5),
(31, 'assets\\image\\food\\top-view-meaty-soup-with-greens-and-potatoes-on-dark-floor_140725-76797.jpg', 5),
(32, 'assets\\image\\food\\vitamin-salad-of-fresh-tomatoes-arugula-feta-cheese-and-peppers-dietary-menu-proper-nutrition-top-view-flat-lay_2829-20048.jpg', 5),
(33, 'assets\\image\\animal\\istockphoto-137201859-1024x1024.jpg', 6),
(34, 'assets\\image\\animal\\istockphoto-533297303-1024x1024.jpg', 6),
(35, 'assets\\image\\animal\\istockphoto-953893978-1024x1024.jpg', 6),
(36, 'assets\\image\\animal\\istockphoto-1214791429-1024x1024.jpg', 6),
(37, 'assets\\image\\animal\\istockphoto-1418802343-1024x1024.jpg', 6),
(38, 'assets\\image\\macro\\bright-dragonfly-with-neon-shades_23-2151457945.jpg', 7),
(39, 'assets\\image\\macro\\close-up-green-leaf-with-water-dropslets_23-2148791158.jpg', 7),
(40, 'assets\\image\\macro\\close-up-of-dry-autumn-leaves-with-dewdrops_23-2150708189.jpg', 7),
(41, 'assets\\image\\macro\\lavender-colored-background-with-abstract-texture_23-2151396733.jpg', 7),
(42, 'assets\\image\\macro\\macro-water-drops-on-plant-leaf_23-2148678687.jpg', 7),
(43, 'assets\\image\\still-life\\baroque-style-with-sunflowers-and-fruits-arrangement_23-2149629989.jpg', 8),
(44, 'assets\\image\\still-life\\baroque-style-with-vase-and-fruits-arrangement_23-2149629932.jpg', 8),
(45, 'assets\\image\\still-life\\eggs-and-feathers-near-bunch-of-flowers_23-2148073875.jpg', 8),
(46, 'assets\\image\\still-life\\fluffy-cotton-plant-in-vase-used-in-interior-decor_23-2151104690.jpg', 8),
(47, 'assets\\image\\still-life\\gold-chain-and-flower-arrangement_23-2149836420.jpg', 8),
(48, 'assets\\image\\still-life\\grapefruit-still-life-in-baroque-style_23-2149659326.jpg', 8),
(49, 'assets\\image\\still-life\\high-angle-white-pumpkins-and-leaves_23-2149446039.jpg', 8);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`genre_id`);

--
-- Индексы таблицы `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`photo_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `genre`
--
ALTER TABLE `genre`
  MODIFY `genre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `photo`
--
ALTER TABLE `photo`
  MODIFY `photo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

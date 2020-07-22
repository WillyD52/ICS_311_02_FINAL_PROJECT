-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2020 at 03:49 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `omdb`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `movie_view`
-- (See below for the actual view)
--
CREATE TABLE `movie_view` (
`movie_id` int(6)
,`native_name` varchar(180)
,`english_name` varchar(180)
,`year_made` year(4)
,`tag_line` varchar(300)
,`language` varchar(10)
,`country` varchar(20)
,`genre` varchar(15)
,`plot` varchar(500)
,`Trivia` mediumtext
,`Keywords` mediumtext
,`Movie Media` mediumtext
,`Songs` mediumtext
,`People` mediumtext
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `people_view`
-- (See below for the actual view)
--
CREATE TABLE `people_view` (
`id` int(6)
,`stage_name` varchar(30)
,`first_name` varchar(20)
,`middle_name` varchar(20)
,`last_name` varchar(20)
,`gender` varchar(6)
,`image_name` varchar(30)
,`Trivia` mediumtext
,`song_id` int(6)
,`Song Role` varchar(15)
,`Movie Role` varchar(20)
,`screen_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `song_view`
-- (See below for the actual view)
--
CREATE TABLE `song_view` (
`song_id` int(5)
,`title` varchar(30)
,`lyrics` varchar(1000)
,`theme` varchar(50)
,`song_media_id` int(6)
,`s_link` varchar(100)
,`s_link_type` varchar(10)
,`people_id` int(6)
,`role` varchar(15)
,`song_trivia_id` int(6)
,`Song Trivia` mediumtext
,`Song Keywords` mediumtext
,`stage_name` varchar(30)
,`first_name` varchar(20)
,`middle_name` varchar(20)
,`last_name` varchar(20)
);

-- --------------------------------------------------------

--
-- Structure for view `movie_view`
--
DROP TABLE IF EXISTS `movie_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `movie_view`  AS  select `mv`.`movie_id` AS `movie_id`,`mv`.`native_name` AS `native_name`,`mv`.`english_name` AS `english_name`,`mv`.`year_made` AS `year_made`,`mvdt`.`tag_line` AS `tag_line`,`mvdt`.`language` AS `language`,`mvdt`.`country` AS `country`,`mvdt`.`genre` AS `genre`,`mvdt`.`plot` AS `plot`,group_concat(distinct `mvtv`.`trivia` separator ',') AS `Trivia`,group_concat(distinct `mvkw`.`keyword` separator ',') AS `Keywords`,group_concat(distinct `mvmd`.`movie_media_id` separator ',') AS `Movie Media`,group_concat(distinct `mvsg`.`song_id` separator ',') AS `Songs`,group_concat(distinct `ppl`.`stage_name` separator ',') AS `People` from ((((((((`movies` `mv` left join `movie_data` `mvdt` on(`mvdt`.`movie_id` = `mv`.`movie_id`)) left join `movie_trivia` `mvtv` on(`mvtv`.`movie_id` = `mv`.`movie_id`)) left join `movie_keywords` `mvkw` on(`mvkw`.`movie_id` = `mv`.`movie_id`)) left join `movie_media` `mvmd` on(`mvmd`.`movie_id` = `mv`.`movie_id`)) left join `movie_song` `mvsg` on(`mvsg`.`movie_id` = `mv`.`movie_id`)) left join `songs` `sgs` on(`sgs`.`song_id` = `mvsg`.`song_id`)) left join `movie_people` `mvp` on(`mvp`.`movie_id` = `mv`.`movie_id`)) left join `people` `ppl` on(`ppl`.`id` = `mvp`.`people_id`)) group by `mv`.`movie_id` ;

-- --------------------------------------------------------

--
-- Structure for view `people_view`
--
DROP TABLE IF EXISTS `people_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `people_view`  AS  select `ppl`.`id` AS `id`,`ppl`.`stage_name` AS `stage_name`,`ppl`.`first_name` AS `first_name`,`ppl`.`middle_name` AS `middle_name`,`ppl`.`last_name` AS `last_name`,`ppl`.`gender` AS `gender`,`ppl`.`image_name` AS `image_name`,group_concat(`ppltr`.`people_trivia_name` separator ',') AS `Trivia`,`sgppl`.`song_id` AS `song_id`,`sgppl`.`role` AS `Song Role`,`mvppl`.`role` AS `Movie Role`,`mvppl`.`screen_name` AS `screen_name` from (((`people` `ppl` left join `people_trivia` `ppltr` on(`ppl`.`id` = `ppltr`.`people_id`)) left join `song_people` `sgppl` on(`ppl`.`id` = `sgppl`.`people_id`)) left join `movie_people` `mvppl` on(`ppl`.`id` = `mvppl`.`people_id`)) group by `ppl`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `song_view`
--
DROP TABLE IF EXISTS `song_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `song_view`  AS  select `sg`.`song_id` AS `song_id`,`sg`.`title` AS `title`,`sg`.`lyrics` AS `lyrics`,`sg`.`theme` AS `theme`,`sgmd`.`song_media_id` AS `song_media_id`,`sgmd`.`s_link` AS `s_link`,`sgmd`.`s_link_type` AS `s_link_type`,`sgppl`.`people_id` AS `people_id`,`sgppl`.`role` AS `role`,`sgtv`.`song_trivia_id` AS `song_trivia_id`,group_concat(`sgtv`.`song_trivia_name` separator ',') AS `Song Trivia`,group_concat(`sgkw`.`keyword` separator ',') AS `Song Keywords`,`ppl`.`stage_name` AS `stage_name`,`ppl`.`first_name` AS `first_name`,`ppl`.`middle_name` AS `middle_name`,`ppl`.`last_name` AS `last_name` from (((((`songs` `sg` left join `song_media` `sgmd` on(`sg`.`song_id` = `sgmd`.`song_id`)) left join `song_people` `sgppl` on(`sg`.`song_id` = `sgppl`.`song_id`)) left join `song_trivia` `sgtv` on(`sg`.`song_id` = `sgtv`.`song_id`)) left join `song_keywords` `sgkw` on(`sg`.`song_id` = `sgkw`.`song_id`)) left join `people` `ppl` on(`sgppl`.`people_id` = `ppl`.`id`)) group by `sg`.`song_id` ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

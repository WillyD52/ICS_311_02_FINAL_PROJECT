-- By Tracy Sanchez Iteration 8 Views: movie_view, people_view, song_view:

-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2020 at 12:29 AM
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
-- Structure for view `movie_view`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `movie_view`  AS  (select `movies`.`movie_id` AS `movie_id`,`movies`.`native_name` AS `native_name`,`movies`.`english_name` AS `english_name`,`movies`.`year_made` AS `year_made`,`movie_data`.`tag_line` AS `tag_line`,`movie_data`.`language` AS `language`,`movie_data`.`country` AS `country`,`movie_data`.`genre` AS `genre`,`movie_data`.`plot` AS `plot`,group_concat(distinct `movie_trivia`.`movie_trivia_id` separator ',') AS `GROUP_CONCAT(DISTINCT movie_trivia_id)`,group_concat(distinct `movie_keywords`.`keyword` separator ',') AS `GROUP_CONCAT(DISTINCT keyword)`,group_concat(distinct `movie_media`.`movie_media_id` separator ',') AS `GROUP_CONCAT(DISTINCT movie_media_id)`,group_concat(distinct `songs`.`song_id` separator ',') AS `GROUP_CONCAT(DISTINCT songs.song_id)`,group_concat(distinct `people`.`people_id` separator ',') AS `GROUP_CONCAT(DISTINCT people.people_id)` from ((((((((`movies` left join `movie_data` on(`movies`.`movie_id` = `movie_data`.`movie_id`)) left join `movie_trivia` on(`movies`.`movie_id` = `movie_trivia`.`movie_id`)) left join `movie_keywords` on(`movies`.`movie_id` = `movie_keywords`.`movie_id`)) left join `movie_media` on(`movies`.`movie_id` = `movie_media`.`movie_id`)) left join `movie_song` on(`movies`.`movie_id` = `movie_song`.`movie_id`)) left join `songs` on(`movie_song`.`song_id` = `songs`.`song_id`)) left join `movie_people` on(`movies`.`movie_id` = `movie_people`.`movie_id`)) left join `people` on(`movie_people`.`people_id` = `people`.`people_id`)) group by `movies`.`movie_id`) ;

--
-- VIEW `movie_view`
-- Data: None
--

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- --------------------------------------------------------

-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2020 at 12:30 AM
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
-- Structure for view `people_view`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `people_view`  AS  (select `people`.`people_id` AS `people_id`,`people`.`stage_name` AS `stage_name`,`people`.`first_name` AS `first_name`,`people`.`middle_name` AS `middle_name`,`people`.`last_name` AS `last_name`,`people`.`gender` AS `gender`,`people`.`image_name` AS `image_name`,`people_trivia`.`people_trivia_id` AS `people_trivia_id`,`people_trivia`.`people_trivia_name` AS `people_trivia_name`,`movie_people`.`movie_id` AS `movie_id`,`movie_people`.`screen_name` AS `screen_name`,group_concat(distinct `movie_people`.`role` separator ',') AS `movie_role`,`movies`.`native_name` AS `native_name`,`movies`.`english_name` AS `english_name`,`movies`.`year_made` AS `year_made`,`song_people`.`song_id` AS `song_id`,`song_people`.`role` AS `song_role`,`songs`.`title` AS `title`,`songs`.`lyrics` AS `lyrics` from (((((`people` left join `people_trivia` on(`people`.`people_id` = `people_trivia`.`people_id`)) left join `movie_people` on(`people`.`people_id` = `movie_people`.`people_id`)) left join `movies` on(`movie_people`.`movie_id` = `movies`.`movie_id`)) left join `song_people` on(`people`.`people_id` = `song_people`.`people_id`)) left join `songs` on(`song_people`.`song_id` = `songs`.`song_id`)) group by `people`.`people_id`) ;

--
-- VIEW `people_view`
-- Data: None
--

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- --------------------------------------------------------

-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2020 at 12:31 AM
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
-- Structure for view `song_view`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `song_view`  AS  (select `songs`.`song_id` AS `song_id`,`songs`.`title` AS `title`,`song_media`.`song_media_id` AS `song_media_id`,`song_media`.`s_link_type` AS `s_link_type`,group_concat(distinct `song_people`.`people_id` separator ',') AS `GROUP_CONCAT(DISTINCT song_people.people_id)`,group_concat(distinct `song_people`.`role` separator ',') AS `GROUP_CONCAT(DISTINCT song_people.role)`,group_concat(distinct `people`.`stage_name` separator ',') AS `GROUP_CONCAT(DISTINCT stage_name)`,group_concat(distinct `movie_song`.`movie_id` separator ',') AS `GROUP_CONCAT(DISTINCT movie_song.movie_id)`,`movies`.`english_name` AS `english_name` from (((((`songs` left join `song_media` on(`songs`.`song_id` = `song_media`.`song_id`)) left join `song_people` on(`songs`.`song_id` = `song_people`.`song_id`)) left join `people` on(`song_people`.`people_id` = `people`.`people_id`)) left join `movie_song` on(`songs`.`song_id` = `movie_song`.`song_id`)) left join `movies` on(`movies`.`movie_id` = `movie_song`.`movie_id`)) group by `songs`.`song_id`) ;

--
-- VIEW `song_view`
-- Data: None
--

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

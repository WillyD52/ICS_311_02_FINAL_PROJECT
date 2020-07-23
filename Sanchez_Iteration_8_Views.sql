CREATE VIEW `movie_view` AS
(SELECT movies.movie_id, native_name, english_name, year_made, 
tag_line, language, country, genre, plot, 
GROUP_CONCAT(DISTINCT movie_trivia_id), 
GROUP_CONCAT(DISTINCT keyword), 
GROUP_CONCAT(DISTINCT movie_media_id), 
GROUP_CONCAT(DISTINCT songs.song_id), 
GROUP_CONCAT(DISTINCT people.people_id)
FROM `movies`
LEFT JOIN `movie_data` ON movies.movie_id = movie_data.movie_id
LEFT JOIN `movie_trivia` ON movies.movie_id = movie_trivia.movie_id
LEFT JOIN `movie_keywords` ON movies.movie_id = movie_keywords.movie_id
LEFT JOIN `movie_media` ON movies.movie_id = movie_media.movie_id
LEFT JOIN `movie_song` ON movies.movie_id = movie_song.movie_id
LEFT JOIN `songs` ON movie_song.song_id = songs.song_id
LEFT JOIN `movie_people` ON movies.movie_id = movie_people.movie_id 
LEFT JOIN `people` ON movie_people.people_id = people.people_id
GROUP BY movies.movie_id);


CREATE VIEW `people_view` AS
(SELECT people.people_id, stage_name, first_name, middle_name, last_name, gender, image_name,
people_trivia_id, people_trivia_name,
movie_people.movie_id, screen_name, GROUP_CONCAT(DISTINCT movie_people.role) AS movie_role,
native_name, english_name, year_made, 
song_people.song_id, song_people.role AS song_role, 
title, lyrics
FROM `people`
LEFT JOIN `people_trivia` ON people.people_id = people_trivia.people_id
LEFT JOIN `movie_people` ON people.people_id = movie_people.people_id 
LEFT JOIN `movies` ON movie_people.movie_id = movies.movie_id
LEFT JOIN `song_people` ON people.people_id = song_people.people_id
LEFT JOIN `songs` ON song_people.song_id = songs.song_id
GROUP BY people.people_id);


CREATE VIEW `song_view` AS
(SELECT songs.song_id, title, 
song_media_id, s_link_type,
GROUP_CONCAT(DISTINCT song_people.people_id), GROUP_CONCAT(DISTINCT song_people.role),
GROUP_CONCAT(DISTINCT stage_name),
GROUP_CONCAT(DISTINCT movie_song.movie_id),
english_name
FROM `songs`
LEFT JOIN `song_media` ON songs.song_id = song_media.song_id
LEFT JOIN `song_people` ON songs.song_id = song_people.song_id 
LEFT JOIN `people` ON song_people.people_id  = people.people_id
LEFT JOIN `movie_song` ON songs.song_id = movie_song.song_id
LEFT JOIN `movies` ON movies.movie_id = movie_song.movie_id
GROUP BY songs.song_id);

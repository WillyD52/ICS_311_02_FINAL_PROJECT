-- Zach Armstrong query 48

SELECT mv.english_name,
       mvp.role,
       ppl.stage_name
FROM   movies mv
       LEFT JOIN movie_people mvp
              ON mvp.movie_id = mv.movie_id
       LEFT JOIN people ppl
              ON ppl.id = mvp.people_id
WHERE  mvp.role LIKE '%Lead Actress%'

-- Zach Armstrong query 33
SELECT mv.movie_id,
       mv.native_name,
       mv.english_name,
       mv.year_made,
       mvdt.tag_line,
       mvdt.language,
       mvdt.country,
       mvdt.genre,
       mvdt.plot,
       Count(DISTINCT mvtv.trivia)         AS 'Count movie trivia',
       Count(DISTINCT mvkw.keyword)        AS 'Count movie keyword',
       Count(DISTINCT mvmd.movie_media_id) AS 'Count movie media',
       Count(DISTINCT mvsg.song_id)        AS 'Count soungs',
       Count(DISTINCT ppl.id)              AS 'Count people'
FROM   movies mv
       LEFT JOIN movie_data mvdt
              ON mvdt.movie_id = mv.movie_id
       LEFT JOIN movie_trivia mvtv
              ON mvtv.movie_id = mv.movie_id
       LEFT JOIN movie_keywords mvkw
              ON mvkw.movie_id = mv.movie_id
       LEFT JOIN movie_media mvmd
              ON mvmd.movie_id = mv.movie_id
       LEFT JOIN movie_song mvsg
              ON mvsg.movie_id = mv.movie_id
       LEFT JOIN songs sgs
              ON sgs.song_id = mvsg.song_id
       LEFT JOIN movie_people mvp
              ON mvp.movie_id = mv.movie_id
       LEFT JOIN people ppl
              ON ppl.id = mvp.people_id
GROUP  BY mv.movie_id  





--Sia Thao's query #45
(SELECT DISTINCT `native_name`, `english_name`, `year_made` FROM `movies` 
INNER JOIN `movie_people` ON movies.movie_id = movie_people.movie_id
INNER JOIN `people` ON movie_people.people_id = people.people_id
WHERE people.stage_name = 'Stage_Name1' AND people.stage_name = 'Stage_Name2')

    **To do user input: change  'Stage_Name#' to '&people.stage_name'

--Sia Thao's query #33
(SELECT DISTINCT * FROM `movies` 
LEFT JOIN `movie_data` ON movies.movie_id = movie_data.movie_id 
LEFT JOIN `movie_trivia` ON movie_data.movie_id = movie_trivia.movie_id 
LEFT JOIN `movie_keywords` ON movie_trivia.movie_id = movie_keywords.movie_id 
LEFT JOIN `movie_media` ON movie_keywords.movie_id = movie_media.movie_id
LEFT JOIN `movie_song` ON movie_media.movie_id = movie_song.movie_id 
LEFT JOIN `songs` ON movie_song.song_id = songs.song_id 
LEFT JOIN `movie_people` ON movies.movie_id = movie_people.movie_id 
LEFT JOIN `people` ON movie_people.people_id = people.people_id)

-- Samuel Mwangi's Query # 34
SELECT movie_id, english_name, native_name,
    SUBSTRING(native_name, 4, 7)
FROM `movies


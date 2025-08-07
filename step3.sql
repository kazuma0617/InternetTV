-- 1
SELECT episodes.title, SUM(view_counts.views)
FROM view_counts
JOIN episodes ON view_counts.episode_id = episodes.id
GROUP BY episodes.id, episodes.title
ORDER BY SUM(view_counts.views) DESC
LIMIT 3;
-- 2
SELECT programs.title, (SELECT COUNT(*) FROM seasons WHERE seasons.program_id = programs.id) AS season_count, (SELECT COUNT(*) FROM episodes WHERE episodes.program_id = programs.id) AS episode_count, episodes.title, SUM(view_counts.views)
FROM view_counts
JOIN episodes ON view_counts.episode_id = episodes.id
JOIN programs ON episodes.program_id = programs.id
GROUP BY episodes.id, episodes.title, programs.id, programs.title
ORDER BY SUM(view_counts.views) DESC
LIMIT 3;
-- 3
SELECT channels.name, timeslots.start_time, timeslots.end_time, (SELECT COUNT(*) FROM seasons WHERE seasons.program_id = programs.id) AS season_count, (SELECT COUNT(*) FROM episodes WHERE episodes.program_id = programs.id) AS episode_count, episodes.title, episodes.title, episodes.description
FROM timeslots
JOIN channels ON timeslots.channel_id = channels.id
JOIN programs ON timeslots.program_id = programs.id
JOIN episodes ON episodes.program_id = programs.id
WHERE DATE(timeslots.start_time) = CURDATE()
ORDER BY channels.name, timeslots.start_time;
-- 4
SELECT timeslots.start_time, timeslots.end_time, (SELECT COUNT(*) FROM seasons WHERE seasons.program_id = programs.id) AS season_count, (SELECT COUNT(*) FROM episodes WHERE episodes.program_id = programs.id) AS episode_count, episodes.title, episodes.description
FROM timeslots
JOIN channels ON timeslots.channel_id = channels.id
JOIN programs ON timeslots.program_id = programs.id
JOIN episodes ON episodes.program_id = programs.id
WHERE channels.name = 'ドラマ' AND timeslots.start_time >= CURDATE() AND timeslots.start_time < DATE_ADD(CURDATE(), INTERVAL 7 DAY)
ORDER BY timeslots.start_time;
-- 5
SELECT programs.title, SUM(view_counts.views) AS total_views
FROM view_counts
JOIN timeslots ON view_counts.timeslot_id = timeslots.id
JOIN programs ON timeslots.program_id = programs.id
WHERE timeslots.start_time >= DATE_SUB(CURDATE(), INTERVAL 7 DAY) AND timeslots.start_time < CURDATE() + INTERVAL 1 DAY
GROUP BY programs.id, programs.title
ORDER BY total_views DESC
LIMIT 2;
-- 6
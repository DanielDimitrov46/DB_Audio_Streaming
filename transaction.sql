START TRANSACTION;

INSERT INTO Song (Name, Author, Year, Plays, Likes) 
VALUES ('New Song', 'New Artist', '2024-01-01', 0, 0);
SET @new_song_id = LAST_INSERT_ID();

INSERT INTO Song_has_Playlist (Song_idSong, Playlist_idPlaylist) 
VALUES (@new_song_id, 1);

-- Завършване на транзакцията
COMMIT;
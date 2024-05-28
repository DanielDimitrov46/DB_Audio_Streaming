-- info from all song and authors
CREATE VIEW view_all_songs AS
SELECT 
    idSong,
    Name AS SongName,
    Author,
    Year,
    Plays,
    Likes
FROM Song;

-- Informaion for playlists and songs
CREATE VIEW view_playlists_and_songs AS
SELECT 
    p.idPlaylist,
    p.Name AS PlaylistName,
    p.Date,
    p.Author AS PlaylistAuthor,
    p.Likes AS PlaylistLikes,
    p.NumberOfSongs,
    s.idSong,
    s.Name AS SongName,
    s.Author AS SongAuthor
FROM Playlist p
JOIN Song_has_Playlist sp ON p.idPlaylist = sp.Playlist_idPlaylist
JOIN Song s ON sp.Song_idSong = s.idSong;

-- view for users and groups
CREATE VIEW view_users_and_groups AS
SELECT 
    a.idAccount,
    CONCAT(a.FirstName, ' ', a.LastName) AS FullName,
    a.Username,
    a.Email,
    g.idGroup,
    g.Name AS GroupName,
    g.Plays AS GroupPlays,
    g.Likes AS GroupLikes
FROM Account a
JOIN `Group` g ON a.idAccount = g.Creator_Id;

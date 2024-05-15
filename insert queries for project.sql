INSERT INTO Account (FirstName, LastName, Username, Email, Hash, Address, isArtist) 
VALUES ('John', 'Doe', 'johndoe', 'john@example.com', 'hashed_password', '123 Main St', 0);

INSERT INTO Account (FirstName, LastName, Username, Email, Hash, Address, isArtist) 
VALUES ('Jane', 'Smith', 'janesmith', 'jane@example.com', 'hashed_password', '456 Elm St', 1);

INSERT INTO Account (FirstName, LastName, Username, Email, Hash, Address, isArtist) 
VALUES ('Alice', 'Johnson', 'alicej', 'alice@example.com', 'hashed_password', '789 Pine St', 0);


INSERT INTO Song (Name, Author, Year, Plays, Likes)
VALUES ('Song Title 1', 'Author 1', '2022-01-01', 100, 50);

INSERT INTO Song (Name, Author, Year, Plays, Likes)
VALUES ('Song Title 2', 'Author 2', '2022-02-01', 200, 100);

INSERT INTO Song (Name, Author, Year, Plays, Likes)
VALUES ('Song Title 3', 'Author 3', '2022-03-01', 300, 150);

INSERT INTO followers (followingId)
VALUES (1);

INSERT INTO followers (followingId)
VALUES (2);

INSERT INTO followers (followingId)
VALUES (3);

INSERT INTO Playlist (Name, Date, Author, Likes, NumberOfSongs)
VALUES ('My Playlist 1', '2022-01-01', 'User 1', 20, 5);

INSERT INTO Playlist (Name, Date, Author, Likes, NumberOfSongs)
VALUES ('My Playlist 2', '2022-02-01', 'User 2', 30, 8);

INSERT INTO Playlist (Name, Date, Author, Likes, NumberOfSongs)
VALUES ('My Playlist 3', '2022-03-01', 'User 3', 40, 10);

INSERT INTO `Group` (type, Name, Plays, Likes, Creator_Id)
VALUES ('Type 1', 'Group 1', '1000', '500', 1);

INSERT INTO `Group` (type, Name, Plays, Likes, Creator_Id)
VALUES ('Type 2', 'Group 2', '2000', '1000', 2);

INSERT INTO `Group` (type, Name, Plays, Likes, Creator_Id)
VALUES ('Type 3', 'Group 3', 3000, 1500, 3);

INSERT INTO Song_has_Playlist (Song_idSong, Playlist_idPlaylist)
VALUES (1, 1);

INSERT INTO Song_has_Playlist (Song_idSong, Playlist_idPlaylist)
VALUES (2, 2);

INSERT INTO Song_has_Playlist (Song_idSong, Playlist_idPlaylist)
VALUES (3, 3);

INSERT INTO Group_has_Song (Group_idGroup, Group_Creator_Id, Song_idSong)
VALUES (1, 1, 1);

INSERT INTO Group_has_Song (Group_idGroup, Group_Creator_Id, Song_idSong)
VALUES (2, 2, 2);

INSERT INTO Group_has_Song (Group_idGroup, Group_Creator_Id, Song_idSong)
VALUES (3, 3, 3);
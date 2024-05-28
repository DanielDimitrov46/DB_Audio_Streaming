-- level db
CREATE ROLE db_admin;
CREATE USER 'admin_audio_streaming'@'localhost' IDENTIFIED BY '1234';
GRANT db_admin TO 'admin_audio_streaming'@'localhost';
GRANT ALL PRIVILEGES ON audio_streaming.* TO 'db_admin';
-- level table
CREATE ROLE table_editor;
CREATE USER 'editor_audio_streaming'@'localhost' IDENTIFIED BY '1234';
GRANT table_editor TO 'editor_audio_streaming'@'localhost';
GRANT SELECT, INSERT, UPDATE ON audio_streaming.Song TO 'table_editor';
-- level column
CREATE ROLE column_viewer;
CREATE USER 'viewer_audio_streaming'@'localhost' IDENTIFIED BY '1234';
GRANT column_viewer TO 'viewer_audio_streaming'@'localhost';
GRANT SELECT (FirstName, LastName, Email) ON audio_streaming.Account TO 'column_viewer';

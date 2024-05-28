-- Before insert trigger checks email is unique
DELIMITER //

CREATE TRIGGER before_account_insert
BEFORE INSERT ON Account
FOR EACH ROW
BEGIN
  DECLARE existing_email_count INT;
  SELECT COUNT(*) INTO existing_email_count
  FROM Account
  WHERE Email = NEW.Email;
  
  IF existing_email_count > 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email already exists!';
  END IF;
END;
//

DELIMITER ;
-- After insert trigger after adding new song - log
DELIMITER //
CREATE TABLE IF NOT EXISTS Song_Log (
  idLog INT NOT NULL AUTO_INCREMENT,
  Song_id INT NOT NULL,
  Action VARCHAR(10) NOT NULL,
  LogDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (idLog)
) ENGINE=InnoDB;

CREATE TRIGGER after_song_insert
AFTER INSERT ON Song
FOR EACH ROW
BEGIN
  INSERT INTO Song_Log (Song_id, Action)
  VALUES (NEW.idSong, 'INSERT');
END;
//

DELIMITER ;

-- update trigger
-- before update trigger when changing username is unique?
DELIMITER //

CREATE TRIGGER before_account_update
BEFORE UPDATE ON Account
FOR EACH ROW
BEGIN
  DECLARE existing_username_count INT;
  SELECT COUNT(*) INTO existing_username_count
  FROM Account
  WHERE Username = NEW.Username AND idAccount != OLD.idAccount;
  
  IF existing_username_count > 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Username already exists!';
  END IF;
END;
//

DELIMITER ;

-- After update trigger when username is uodated 
DELIMITER //

CREATE TABLE IF NOT EXISTS Account_Log (
  idLog INT NOT NULL AUTO_INCREMENT,
  Account_id INT NOT NULL,
  Action VARCHAR(10) NOT NULL,
  LogDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (idLog)
) ENGINE=InnoDB;

CREATE TRIGGER after_account_update
AFTER UPDATE ON Account
FOR EACH ROW
BEGIN
  INSERT INTO Account_Log (Account_id, Action)
  VALUES (NEW.idAccount, 'UPDATE');
END;
//

DELIMITER ;


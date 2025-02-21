/*This query is written by Usama Abbasi. Kindly reach out on usamahafeez.abbasi234@gmail.com*/
USE stack_over_flow;

SHOW VARIABLES LIKE 'secure_file_priv';

-- Uploading users data
LOAD XML INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Users.xml'
INTO TABLE users
ROWS IDENTIFIED BY '<row>';

-- Uploading badges data
LOAD XML INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Badges.xml'
INTO TABLE badges
ROWS IDENTIFIED BY '<row>';

-- Uploading posts data
LOAD XML INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Posts.xml'
INTO TABLE posts
ROWS IDENTIFIED BY '<row>';

-- Uploading comments data
LOAD XML INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Comments.xml'
INTO TABLE comments
ROWS IDENTIFIED BY '<row>';

-- Uploading comments data
LOAD XML INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\PostHistory.xml'
INTO TABLE posthistory
ROWS IDENTIFIED BY '<row>';

-- Uploading postlink data
LOAD XML INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\PostLinks.xml'
INTO TABLE postlinks
ROWS IDENTIFIED BY '<row>';

-- Uploading tags data
LOAD XML INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Tags.xml'
INTO TABLE tags
ROWS IDENTIFIED BY '<row>';

-- Uploading votes data
LOAD XML INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Votes.xml'
INTO TABLE votes
ROWS IDENTIFIED BY '<row>';







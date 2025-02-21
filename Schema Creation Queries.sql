/*This query is written by Usama Abbasi. Kindly reach out on usamahafeez.abbasi234@gmail.com*/
USE stack_over_flow;
select version() as my_version;
-- Creating badge table. Each badge is assigned to a specific user. A user can have multiple badges.
CREATE TABLE Users
(
  Id INT PRIMARY KEY,
  Reputation INT,
  CreationDate DATETIME,
  DisplayName VARCHAR(255),
  LastAccessDate DATETIME,
  WebsiteUrl VARCHAR(2044),
  Location VARCHAR(255),
  AboutMe TEXT,
  Views INT,
  UpVotes INT,
  DownVotes INT,
  AccountId INT
  );

-- Creating badge table. Each badge is assigned to a specific user. A user can have multiple badges.
CREATE TABLE Badges
(
  Id INT PRIMARY KEY,
  UserId INT NOT NULL,
  Name VARCHAR(255),
  Date DATETIME,
  Class INT,
  TagBased varchar(6),
  FOREIGN key (UserId) REFERENCES Users(Id)
);

-- Each post is owned by a user and may be edited by another user. We have two one to many relationship with user table
CREATE TABLE Posts
(
  Id INT,
  PostTypeId INT,
  ParentId INT,
  AcceptedAnswerId INT,
  CreationDate DATETIME,
  Score INT,
  ViewCount INT,
  Body TEXT,
  OwnerUserId INT,
  LastEditorUserId INT,
  LastEditDate DATETIME,
  LastActivityDate DATETIME,
  Title TEXT,
  Tags TEXT,
  AnswerCount INT,
  CommentCount INT,
  ContentLicense VARCHAR(255)
);


-- Creating a table for the comments data
CREATE TABLE Comments(
Id INT,
PostId INT NOT NULL,
Score INT,
Text TEXT,
CreationDate DATETIME,
UserId INT
);

-- Creating a table for the PostHistory Data
CREATE TABLE PostHistory (
    Id INT PRIMARY KEY,
    PostHistoryTypeId INT,
    PostId INT NOT NULL,
    RevisionGUID CHAR(36),
    CreationDate DATETIME,
    UserId INT,
    Text TEXT,
    ContentLicense VARCHAR(255)
);

-- Creating a table for the PostLinks Data
CREATE TABLE PostLinks (
    Id INT PRIMARY KEY,
    PostId INT NOT NULL,
    RelatedPostId INT NOT NULL,
    LinkTypeId INT,
    CreationDate DATETIME
);

-- Creating a table for the Tags Data
CREATE TABLE Tags (
    Id INT PRIMARY KEY,
    TagName VARCHAR(255),
    Count INT,
    ExcerptPostId INT,
    WikiPostId INT
);

-- Creating a table for the Votes Data
CREATE TABLE Votes (
    Id INT PRIMARY KEY,
    PostId INT NOT NULL,
    VoteTypeId INT,
    CreationDate DATETIME
);








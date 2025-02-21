-- Part 1 Basics
-- Loading and Exploring Data

USE stack_over_flow;

-- Explore the structure and first 10 rows of each table.

SELECT * 
FROM badges 
LIMIT 10;

SELECT * 
FROM posthistory 
LIMIT 10;

SELECT * 
FROM postlinks 
LIMIT 10;

SELECT * 
FROM posts 
LIMIT 10;

SELECT * 
FROM comments 
LIMIT 10;

SELECT * 
FROM tags 
LIMIT 10;

SELECT * 
FROM users 
LIMIT 10;

SELECT * 
FROM votes 
LIMIT 10;

-- Identify the total number of records in each table

SELECT 
COUNT(*) AS Total_Badges_Record 
FROM badges;

SELECT 
COUNT(*) AS Total_PostHistory_Record 
FROM posthistory;

SELECT 
COUNT(*) AS Total_PostLinks_Record 
FROM postlinks;

SELECT 
COUNT(*) AS Total_Posts_Record 
FROM posts;

SELECT 
COUNT(*) AS Total_Comments_Record 
FROM comments;

SELECT 
COUNT(*) AS Total_Tags_Record 
FROM tags;

SELECT 
COUNT(*) AS Total_Users_Record 
FROM users;

SELECT 
COUNT(*) AS Total_Votess_Record 
FROM votes;

-- Filtering and Sorting
-- Find all posts with a comment_count greater than 2.

SELECT 
* 
FROM posts 
WHERE CommentCount > 2;

-- Display comments made in 2012, sorted by creation_date.

SELECT 
Text AS Comment, CreationDate AS CommentTime 
FROM comments 
WHERE YEAR(CreationDate) = 2012 
ORDER BY CreationDate ASC;

-- Simple Aggregations
-- Count the total number of badges.

SELECT 
COUNT(*) AS Total_Badges_Record 
FROM badges;

-- Calculate the average score of posts grouped by post_type_id.

SELECT 
PostTypeId,AVG(score) 
FROM posts 
GROUP BY PostTypeId;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Part 2: Joins
-- 1. Basic Joins

-- Combine the post_history and posts tables to display the title of posts and the corresponding changes made in the post history.

SELECT 
p.Id, ph.CreationDate, Title, Body, Text 
FROM posts AS p 
JOIN posthistory AS ph ON p.Id = ph.PostId 
ORDER BY p.id, ph.CreationDate ASC;

-- Join the users table with badges to find the total badges earned by each user.

SELECT 
u.Id, COUNT(*) AS BadgesEarnedByUser 
FROM users AS u 
JOIN badges AS b ON u.Id = b.UserId 
GROUP BY u.id 
ORDER BY u.Id ASC;

-- 2. Multi-Table Joins
-- Fetch the titles of posts (posts), their comments (comments), and the users who made those comments (users).

SELECT 
p.Title, c.Text, UserId, DisplayName 
FROM posts AS p 
JOIN comments AS c ON p.Id = c.PostId  
JOIN users AS u ON c.UserId = u.Id 
WHERE Title IS NOT NULL 
ORDER BY UserId ASC;

-- Combine post_links with posts to list related questions.
SELECT 
p.id , p.title,pt.Title AS Related_Posts 
FROM posts p 
JOIN postlinks pl ON p.Id = pl.PostId 
JOIN posts pt ON pt.Id = pl.RelatedPostId 
ORDER BY p.Id ASC;

-- Join the users, badges, and comments tables to find the users who have earned badges and made comments.
WITH badge_earned_user AS
(
	SELECT 
    DISTINCT UserId 
    FROM badges 
    order by UserId asc
)

SELECT 
DISTINCT(b.UserId), u.DisplayName 
FROM badge_earned_user b 
JOIN comments c ON b.UserId = c.UserId 
JOIN users u ON b.UserId = u.Id ORDER BY b.UserId ASC;


-- Single-Row Subqueries
-- Find the user with the highest reputation (users table).

SELECT 
DisplayName, Reputation, Views, UpVotes 
FROM
		(
		SELECT
		* , 
		RANK () OVER 
            (
			  ORDER BY Reputation DESC
			) AS Rank_no
	    FROM
	    users) AS temp 
WHERE Rank_no = 1;

-- Retrieve posts with the highest score in each post_type_id (posts table).
-- Note: We have 6 different kinds of posts type id. This query will only show the posts wtih highest score within the post_type who have post with score not equal to 0. Those post types where the highest score is 0.
-- In that case we have all the posts with the same score of 0.
SELECT 
DISTINCT(PostTypeId) 
from posts;

SELECT 
	DISTINCT(PostTypeId),
	Score as Highest_Score,
	Title,
	Body,
	Tags   
FROM 
	(
		SELECT 
        PostTypeId,
        Score,
        Title, 
        Body, 
        Tags, 
		DENSE_RANK () OVER(
		PARTITION BY PostTypeId
		ORDER BY Score DESC) AS Rank_Of_Score 
        FROM posts 
        WHERE Score != 0
	) AS Temp 
WHERE Rank_Of_Score = 1;

-- Correlated Subqueries
-- For each post, fetch the number of related posts from post_links.

CREATE INDEX idx_postlinks_postid ON postlinks(PostId);
SELECT 
Id, (
				SELECT 
				COUNT(RelatedPostId)
				FROM postlinks
				WHERE PostId = OuterTable.Id
		) AS CountOfRelatedPosts
FROM 
posts AS OuterTable ORDER BY Id ASC;



-- Create a CTE to calculate the average score of posts by each user and
-- use it to:
-- List users with an average score above 50.
-- Rank users based on their average post score.

WITH UserAvgScore 
AS 
(
		SELECT 
		OwnerUserId, AVG(score) AS AverageScore 
		FROM posts 
		GROUP BY OwnerUserId 
		ORDER BY OwnerUserId ASC
)

SELECT 
OwnerUserId,AverageScore, RANK() OVER (ORDER BY AverageScore DESC) AS Ranking 
FROM UserAvgScore WHERE AverageScore > 50;



-- Recursive CTE
-- Simulate a hierarchy of linked posts using the post_links table.
CREATE INDEX linkedPostIndex ON postlinks (PostId);

WITH Recursive linked_posts AS (

SELECT *, 0 AS depth from postlinks WHERE PostId = 116
UNION ALL
SELECT  pl.*, lp.depth + 1 FROM  postlinks pl JOIN linked_posts lp ON pl.PostId = lp.RelatedPostId  WHERE depth < 100
)

SELECT PostId, RelatedPostId, Count(depth)  FROM linked_posts GROUP BY PostId, RelatedPostID;

-- Rank posts based on their score within each year (posts table).
SELECT 
PostTypeId,
Score, 
YEAR(CreationDate) As Year, 
RANK() OVER(
PARTITION BY PostTypeId,YEAR(CreationDate)
ORDER BY Score DESC
) as Ranking
FROM posts;



-- Calculate the running total of badges earned by users (badges table).
SELECT 
UserId, 
Name as BadgeName,
Date,
COUNT(*) OVER (PARTITION BY UserId Order By Date)
FROM badges 
ORDER BY UserID asc, Date;
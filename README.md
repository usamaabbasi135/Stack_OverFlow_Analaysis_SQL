# Introduction
This project involves a comprehensive analysis of the Stack Overflow dataset, a publicly available dataset that contains information about users, posts, comments, badges, votes, and more. The goal of this analysis was to explore user activity, post quality, and interactions on the platform, and to derive meaningful insights that could help understand the dynamics of the Stack Overflow community.

# Dataset Overview
The dataset consists of the following key tables:

- **Users:** Information about Stack Overflow users, including reputation, badges, and activity.

- **Posts:**  Questions and answers posted by users.

- **Comments:**  Comments made on posts.

- **Badges:**  Badges earned by users for their contributions.

- **Votes:**  Votes on posts (upvotes, downvotes, etc.).

- **Tags:**  Tags associated with posts.

- **PostHistory:**  History of edits and changes made to posts.

- **PostLinks:**  Relationships between related posts.

# Objectives
The primary objectives of this analysis were:

- Explore the dataset to understand its structure and content.

- Analyze user activity by examining badges, reputation, and post contributions.

- Evaluate post quality by analyzing scores, comments, and tags.

- Identify relationships between users, posts, and comments.

- Perform advanced analysis using subqueries, CTEs, and recursive queries to uncover deeper insights.

# Methodology
The analysis was conducted using SQL on a MySQL database. The following steps were taken:

- **Data Loading:** The dataset was loaded into MySQL using XML files.

- **Data Exploration:** Basic queries were run to explore the structure and content of each table.

- **Filtering and Sorting:** Relevant data was filtered and sorted to focus on key metrics (e.g., posts with high comment counts, comments from specific years).

- **Aggregations:** Basic aggregations (e.g., count, average) were performed to summarize data.

- **Joins:** Tables were joined to analyze relationships (e.g., users and badges, posts and comments).

- **Advanced Analysis:** Subqueries, CTEs, and recursive queries were used to perform advanced analysis (e.g., ranking posts, calculating running totals).

# Key Findings
# User Activity:

- The user with the highest reputation was identified, along with their total views, upvotes, and downvotes.

- Users who earned the most badges were identified, showcasing their contributions to the platform.

# Post Quality:

- Posts with the highest scores were identified, along with their titles and tags.

- The average score of posts was calculated by post type, revealing which types of posts (e.g., questions, answers) tend to perform better.

# User Engagement:

- Comments made in 2012 were analyzed, providing insights into user engagement during that year.

- Posts with more than 2 comments were identified, highlighting popular discussions.

# Relationships:

- The relationship between posts and their related posts (via PostLinks) was explored, revealing how questions are linked to similar or related questions.

- Users who both earned badges and made comments were identified, showcasing active contributors.

# Advanced Insights:

- Recursive CTEs were used to simulate a hierarchy of linked posts, revealing the depth of post relationships.

- Running totals of badges earned by users were calculated, showing how users accumulate badges over time.

# Conclusion
This project provided a deep dive into the Stack Overflow dataset, uncovering valuable insights about user activity, post quality, and community interactions. The analysis highlighted key contributors, popular posts, and the relationships between different entities on the platform. The use of advanced SQL techniques, such as recursive CTEs and ranking functions, allowed for a more nuanced understanding of the data.

## How to Use

1. **Clone the Repository**: Clone this project repository from GitHub.
2. **Set Up the Database**: Run the SQL scripts provided in 'Schema Creation Queries' and 'Uploading Data' file to create and populate the database.
3. **Run the Queries**: Use the SQL queries provided in the "Analysis Queries' file to perform your analysis.
4. **Explore and Modify**: Feel free to modify the queries to explore different aspects of the dataset or answer additional business questions.

## Author - Usama Bin Hafeez Abbasi

This project is part of my portfolio, showcasing the SQL skills essential for data analyst roles. If you have any questions, feedback, or would like to collaborate, feel free to get in touch!

## Follow Me

For more content on SQL, data analysis, and other data-related topics, make sure to follow me on social media and join our community:

- **YouTube**: [Subscribe to my channel](https://www.youtube.com/@usamaabbasi7570)
- **LinkedIn**: [Connect with me professionally](https://www.linkedin.com/in/usamaabbasiai/)

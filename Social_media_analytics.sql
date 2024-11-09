#1. Count the total number of users in the system.
SELECT count(user_id) as total_users from users;

#2. How many posts has each user made?
SELECT user_id, count(*) as Likes from posts
group by user_id ;

#3. Find the most liked post.
SELECT post_id, count(*) as Likes from likes
group by post_id 
order by Likes Desc
limit 1;

#4. Which users have not made any posts?
select u.username,p.post_id, u.user_id, p.post_date from posts as P 
left join users as U on u.user_id = p.user_id
where p.post_id = null;

SELECT u.user_id, u.username
FROM users u
LEFT JOIN posts p ON u.user_id = p.user_id
WHERE p.post_id IS NULL;


#5. Count the number of comments on each post.
SELECT post_id, COUNT(comment_id) AS comment_count FROM Comments GROUP BY post_id;

#6. Find how many posts were made in the last 7 days.
SELECT COUNT(post_id) AS recent_posts FROM Posts WHERE post_date >= DATE_SUB(CURDATE(), INTERVAL 7 DAY);

#7. What is the average number of likes per post?
SELECT AVG(like_count) AS avg_likes_per_post
FROM (
    SELECT post_id, COUNT(like_id) AS like_count
    FROM Likes
    GROUP BY post_id
) AS post_likes;

#8. Which users have commented the most?
SELECT user_id, COUNT(comment_id) AS comment_count
FROM Comments
GROUP BY user_id
ORDER BY comment_count DESC
LIMIT 1;

#9. Which posts have no comments?
SELECT user_id, COUNT(comment_id) AS comment_count
FROM Comments
GROUP BY user_id
ORDER BY comment_count ASC
LIMIT 1;

#10. Find the total number of likes for each user's posts.
SELECT p.user_id, COUNT(l.like_id) AS total_likes
FROM Posts p
LEFT JOIN Likes l ON p.post_id = l.post_id
GROUP BY p.user_id;
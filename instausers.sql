#A) Marketing 
#1) Rewarding Most Loyal Users: People who have been using the platform for the longest time.
#Your Task: Find the 5 oldest users of the Instagram from the database provided.
SELECT username, created_at FROM users ORDER BY created_at limit 5;

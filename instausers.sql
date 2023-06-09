#A) Marketing 

#1) Rewarding Most Loyal Users: People who have been using the platform for the longest time.
#Your Task: Find the 5 oldest users of the Instagram from the database provided.
SELECT username, created_at FROM users ORDER BY created_at limit 5;

#2)Remind Inactive Users to Start Posting: By sending them promotional emails to post their 1st photo.
#Your Task: Find the users who have never posted a single photo on Instagram
SELECT u.username from users u LEFT JOIN photos p on u.id=p.user_id where p.id IS NULL; 

#3)Declaring Contest Winner: The team started a contest and the user who gets the most likes on a single photo will win the contest now they wish to declare the winner.
#Your Task: Identify the winner of the contest and provide their details to the team.
select users.username, photos.user_id, likes.photo_id, count(likes.user_id) NumberOfLikes 
from likes JOIN photos JOIN users on users.id=photos.user_id 
and photos.id=likes.photo_id group by likes.photo_id order by NumberOfLikes 
desc limit 1; 

#4)Hashtag Researching: A partner brand wants to know, which hashtags to use in the post to reach the most people on the platform.
#Your Task: Identify and suggest the top 5 most commonly used hashtags on the platform.
select id, tag_name, count(tag_name) as CommonHashtags from tags join photo_tags 
on tags.id=photo_tags.tag_id group by id order by CommonHashtags 
desc limit 5;

#5)Launch AD Campaign: The team wants to know, which day would be the best day to launch ADs.
#Your Task: What day of the week do most users register on? Provide insights on when to schedule an ad campaign.
select dayname(created_at) DayOfTheWeek, count(users.id) NumberOfUsers from users 
group by dayoftheweek order by numberofusers desc limit 2;


#B) Investor Metrics

#1)User Engagement: Are users still as active and post on Instagram or they are making fewer posts
#Your Task: Provide how many times does average user posts on Instagram. Also, provide the total number of photos on Instagram/total number of users
select count(users.id) NumberofUsers, count(photos.image_url) NumberOfPhotos, count(photos.image_url)/count(users.id) AveragePosts 
from photos right join users on users.id=photos.user_id;

#2)Bots & Fake Accounts: The investors want to know if the platform is crowded with fake and dummy accounts
#Your Task: Provide data on users (bots) who have liked every single photo on the site (since any normal user would not be able to do this)
select user_id as "ID", users.username as "FAKE ACCOUNTS" from 
likes join users on likes.user_id=users.id group by user_id 
having count(photo_id)=(select count(image_url) from photos); 
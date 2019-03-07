select * from users;
select * from posts where userId=100;

select p.*, u.first_name, u.last_name 
from posts p
LEFT JOIN users u ON p.userId=u.id 
WHERE p.userId =200;

select p.*, u.username 
from posts p
LEFT JOIN users u ON p.userId=u.id 
WHERE u.first_name='Norene', u.last_name='Schmitt';

select username 
from users 
where created_at > '2015-01-01';

select p.title, p.content, u.username 
from posts p
LEFT JOIN users u ON p.userId=u.id 
where u.created_at < '2015-01-01';

--13
select p.title 'Post Title', c.*  
from comments c
LEFT JOIN posts p ON c.postId=p.id;

--14
select p.title as post_title, 
p.url as post_url, c.body as comment_body 
from comments c
LEFT JOIN posts p ON c.postId=p.id
WHERE p.created_at < '2015-01-01';

--15
select p.title as post_title, 
p.url as post_url, c.body as comment_body 
from comments c
LEFT JOIN posts p ON c.postId=p.id
WHERE p.created_at > '2015-01-01';

--16
select p.title as post_title, 
p.url as post_url, c.body as comment_body 
from comments c
LEFT JOIN posts p ON c.postId=p.id
WHERE c.body like '%USB%';

--17
select p.title as post_title, 
p.url as post_url, c.body as comment_body 
from comments c
LEFT JOIN posts p ON c.postId=p.id
LEFT JOIN users u ON c.postId=p.id
WHERE c.body like '%matrix%';

--18
select 
u.first_name, u.last_name,
 c.body as comment_body 
from comments c
LEFT JOIN posts p ON c.postId=p.id
LEFT JOIN users u ON c.userId=u.id
WHERE c.body like '%SSL%'
and p.content like '%dolorum%';

--19
select 
up.first_name as post_author_first_name, up.last_name as post_author_last_name,
p.title as post_title,
uc.username as comment_author_username,
 c.body as comment_body 
from comments c
LEFT JOIN posts p ON c.postId=p.id
LEFT JOIN users up ON p.userId=up.id
LEFT JOIN users uc ON c.userId=uc.id
WHERE (c.body like '%SSL%' ||c.body like '%firewall%')
and p.content like '%nemo%';






select count(c.id) 
FROM comments c 
left join posts p ON c.postId=p.id
where p.created_at > '2015-07-14';

select  count(*)
from comments c 
where c.body like '%programming%'
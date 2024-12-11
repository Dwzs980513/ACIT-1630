/* Q1 */
select p.title, t.tag_name
from tag t
left join post_tag pt
on t.tag_id = pt.tag_id
left join post p 
on pt.post_id = p.post_id
where t.tag_name = 'DIY';

/* Q2 */
select p.title, t.tag_name
from post p
left join post_tag pt
on p.post_id = pt.post_id
left join tag t
on pt.tag_id = t.tag_id
where p.title = 'Mickey Mouse Cookies';

/* Q3 */
select p.title, count(pt.tag_id) as 'Number of Tags'
from post p
left join post_tag pt
on p.post_id = pt.post_id
group by p.post_id
order by count(pt.tag_id) desc;

/* Q4 */
select p.title, count(pt.tag_id) as 'Number of Tags'
from post p
left join post_tag pt
on p.post_id = pt.post_id
group by p.post_id
having count(pt.tag_id) = 0;

/* Q5 */
select t.tag_name, count(pt.post_id) as 'Number of Posts'
from tag t
left join post_tag pt
on t.tag_id = pt.tag_id
group by t.tag_id
order by count(pt.post_id) desc;

/* Q6 */
select p.post_id, p.title, pe.first_name
from post p 
left join person pe on p.person_id = pe.person_id
where p.post_id in (select rp.post_id from read_post rp);

/* Q7 */
select p.post_id, p.title, pe.first_name
from post p 
left join person pe on p.person_id = pe.person_id
where p.post_id not in (select rp.post_id from read_post rp);

/* Q8 */
select p.post_id, p.title, pe.first_name, p.created_date, last_modified_date
from post p 
inner join person pe 
on p.person_id = pe.person_id
where p.last_modified_date > p.created_date;

/* Q9 */
select p.post_id, p.title, pe.first_name
from post p 
inner join person pe 
on p.person_id = pe.person_id
where p.post_id not in (select post_id from post_photo);

/* Q10 */
select p.title, count(pl.post_id) as 'Number of Likes'
from post p  
left join post_like pl 
on p.post_id = pl.post_id
group by p.post_id
order by count(pl.post_id) desc;

/* Q11 */
select pe.first_name, pe.last_name, count(p.post_id) as 'Number of Posts'
from person pe 
left join post p 
on pe.person_id = p.person_id
group by pe.person_id
order by count(p.post_id) desc limit 1;

select pe.first_name, pe.last_name, count(p.post_id) as 'Number of Posts'
from person pe 
left join post p 
on pe.person_id = p.person_id
group by pe.person_id
order by count(p.post_id) limit 1;

/* Q12 */
select p.post_id, p.title, pa.first_name as 'author', pc.comment, co.first_name as 'commenter'
from post p 
left join person pa 
on p.person_id = pa.person_id
right join post_photo pp
on p.post_id = pp.post_id
left join post_comment pc 
on p.post_id = pc.post_id
left join person co
on pc.person_id = co.person_id
group by p.post_id, pc.post_comment_id;

/* Q13 */
select p.post_id, p.title, 
(select count(rp.post_id) from read_post rp where rp.post_id = p.post_id) as 'reads',
(select count(pl.post_id) from post_like pl where pl.post_id = p.post_id) as 'likes',
(select count(pc.post_id) from post_comment pc where pc.post_id = p.post_id) as 'comments'
from post p;

/* Q14 */
select ph.photo_id, ph.caption, ph.file_name, 'Profile Photo' as 'photo_type'
from photo ph 
inner join person pe 
on ph.photo_id = pe.profile_photo_id

union

select ph.photo_id, ph.caption, ph.file_name, 'Post Photo' as 'photo_type'
from photo ph 
inner join post_photo pp
on ph.photo_id = pp.photo_id;


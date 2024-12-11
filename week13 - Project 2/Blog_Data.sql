DROP DATABASE IF EXISTS Blog_Data;

CREATE DATABASE Blog_Data;

USE Blog_Data;

DROP TABLE IF EXISTS photo;
DROP TABLE IF EXISTS person;
DROP TABLE IF EXISTS post;
DROP TABLE IF EXISTS post_comment;
DROP TABLE IF EXISTS post_like;
DROP TABLE IF EXISTS post_photo;
DROP TABLE IF EXISTS tag;
DROP TABLE IF EXISTS post_tag;
DROP TABLE IF EXISTS read_post;

create table photo (
	photo_id int auto_increment primary key,
    file_name varchar(255) not null,
    created_date datetime not null default now(),
    caption varchar(500)
);

CREATE TABLE Person (
  person_id int auto_increment primary key,
  first_name varchar(45) not NULL,
  last_name varchar(45) not null,
  email varchar(1150) not null,
  password blob not null,
  profile_photo_id int, 
  foreign key (profile_photo_id) references photo(photo_id)
);

create table post (
	post_id int auto_increment primary key,
    title varchar(250) not null,
    description varchar(1250),
    created_date datetime not null default now(),
    last_modified_date datetime default now(),
    person_id int,
    foreign key (person_id) references person(person_id)
);

create table post_comment (
	post_comment_id int auto_increment primary key,
    post_id int,
    person_id int,
    comment varchar(1000) not null,
    created_date datetime not null default now(),
    foreign key (post_id) references post(post_id),
    foreign key (person_id) references person(person_id)
);

create table post_like (
	post_like_id int auto_increment primary key,
    post_id int,
    person_id int,
    foreign key (post_id) references post(post_id),
    foreign key (person_id) references person(person_id)
);

create table post_photo (
	post_photo_id int auto_increment primary key,
    post_id int,
    photo_id int,
    foreign key (post_id) references post(post_id),
    foreign key (photo_id) references photo(photo_id)
);

create table tag (
	tag_id int auto_increment primary key,
    tag_name varchar(45) not null
);

create table post_tag (
	post_tag_id int auto_increment primary key,
    post_id int,
    tag_id int,
    foreign key (post_id) references post(post_id),
    foreign key (tag_id) references tag(tag_id)
);

create table read_post (
	read_post_id int auto_increment primary key,
    post_id int,
    person_id int,
    created_date datetime not null default now(),
    foreign key (post_id) references post(post_id),
    foreign key (person_id) references person(person_id)
);

insert into photo(file_name, created_date, caption) VALUES 
('barbara_profile.jpg', '2019-06-15', "Barbara's Profile"),
('img_9203710.jpg', '2019-06-15', "James' Profile"),
('dcim_38118385.jpg', '2019-06-15', "Mary"),
('knitting.jpg', '2019-06-15', "Knitted Touques"),
('img_28391910488.jpg', '2019-06-15', "Richard"),
('img_21838392835.jpg', '2019-06-15', "Mickey Mouse Cookies"),
('img_38201884043.jpg', '2019-06-15', "So cute!"),
('img_28320384855.jpg', '2019-06-15', "Smiling already!"),
('rainbow.jpg', '2019-06-15', "Rainbow Quilt"),
('stereo1.jpg', '2019-06-15', "Front Panel"),
('stereo2.jpg', '2019-06-15', "Bass Speakers Installed"),
('new_shed.jpg', '2019-06-15', "Shed inside empty"),
('rose.jpg', '2019-06-15', "Rose"),
('putter.jpg', '2019-06-15', "Putter"),
('nine-iron.jpg', '2019-06-15', "9 Iron"),
('driver.jpg', '2019-06-15', "Driver");


insert into person(first_name, last_name, email, password, profile_photo_id) values
('Barbara', 'Hodge', 'b.hodge@company.com', AES_ENCRYPT('P@ssword!', 'aseed'), 1),
('James', 'Buckles', 'j.buckles@company.com', AES_ENCRYPT('Awesome8', 'aseed'), 2),
('Natalie', 'Wilhite', 'bestest.forever@example.com', AES_ENCRYPT('CakeIsBest', 'aseed'), NULL),
('Mary', 'Barnett', 'lifeisahighway@example.com', AES_ENCRYPT('goGOgo', 'aseed'), 3),
('Richard', 'Tipton', 'tippertapper266602@gmail.com', AES_ENCRYPT('tiptap', 'aseed'), 5);

insert into post (title, description, created_date, last_modified_date, person_id) values
('Mickey Mouse Cookies', 'I found this great recipe for sugar cookies and a new', '2019-04-14', '2019-04-15', 1),
('Touques for infants', "I'm knitting touques for our grandchild that should be born soon!", '2019-02-15', '2019-02-16', 3),
('Our newest family member!', 'Congratulations to our daughter on their new bundle of joy! Theresa May - Born March 3, 2019.', '2019-03-04', '2019-03-04', 3),
('Rainbow Quilt', 'Beautiful new rainbow quilt for our newest granddaughter.', '2019-03-29', '2019-04-01', 3),
('New Car Stereo and Speakers', 'Best Bass Ever! You can hear me from 5 blocks away!', '2019-05-09', '2019-05-09', 2),
('Garden Shed', 'New garden shed has room for the lawn mowers and all our garden tools.', '2019-05-22', '2019-05-22', 2),
('Great way to hang pictures', "It's simple and cost effective!", '2019-04-27', '2019-04-27', 4),
('Beautiful colour, beautiful smell', 'Found a great place to buy the best roses!', '2019-04-14', '2019-04-16', 4),
('Set of golf clubs for sale', 'A friend of mine is selling his set of clubs before he moves to Saskatchewan.', '2019-05-12', '2019-05-15', 2),
('Change your own oil, save hundreds!', "Mechanics are too expensive, and it's not that hard to do it yourself.", '2019-02-22', '2019-02-22', 2),
('Awesome Floor Mats', 'Keep your car clean with these awesome car mats!', '2019-03-03', '2019-03-03', 2);

insert into tag (tag_name)
values 
('baking'), ('cooking'), ('crafts'), ('DIY'), ('cars'), ('home repair'), ('sports'), ('music'), ('shopping');

insert into post_tag (post_id, tag_id)
values 
(1, 1), (1, 2), (1, 3), 
(2, 3), (2, 4),         
(4, 3), (4, 4),         
(5, 5), (5, 4),        
(6, 4), (6, 6),        
(7, 6),                
(9, 7),
(10, 5), (10, 4),      
(11, 5);                
    
insert into post_photo (post_id, photo_id)
VALUES 
(1, 6),             
(2, 4),
(3, 8), (3, 7),         
(4, 9),                 
(5, 11), (5, 10),       
(6, 12),                
(8, 13),                
(9, 15), (9, 16), (9, 14); 

insert into post_comment (post_id, person_id, comment, created_date)
values 
(1, 3, "I'm going to try those myself!", '2019-04-14'),
(3, 1, "Congratulations!", '2019-03-04'),
(3, 2, "How does it feel to be a grandma?", '2019-03-04'),
(4, 1, "Can you make me one next?", '2019-03-29'),
(6, 1, "What colour are you going to paint your shed?", '2019-05-22'),
(9, 5, "I need a good set of clubs; I'll take them!", '2019-05-12');

insert into post_like (post_id, person_id)
values 
(1, 3),
(2, 4),
(3, 1), (3, 2), (3, 4), (3, 5),
(5, 5),
(9, 5);

insert into read_post (post_id, person_id, created_date)
values 
(1, 4, '2019-04-14'), (1, 3, '2019-04-14'),
(2, 4, '2019-02-16'),
(3, 1, '2019-03-04'), (3, 2, '2019-03-04'), (3, 4, '2019-03-04'), (3, 5, '2019-03-04'),
(4, 1, '2019-03-29'),
(5, 5, '2019-05-09'),
(6, 1, '2019-05-22'), (6, 5, '2019-05-22'),
(7, 1, '2019-04-27'),
(9, 5, '2019-05-12'),
(10, 5, '2019-02-22'),
(11, 1, '2019-03-03');

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
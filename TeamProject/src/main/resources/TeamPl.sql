create Table user(
	id varchar(100) primary key,
	pwd varchar(100) not null,
	name varchar(100) not null,
	level varchar(10) default "User",
	email varchar(100) not null,
	phone varchar(100) not null,
	reg_date timestamp default now(),
	update_date timestamp default now(),
	withdraw boolean default false
);
select *from compl where secret=true;

create table Compl(
   cno INT  PRIMARY KEY AUTO_INCREMENT,
   id varchar(100),
   ctitle VARCHAR(300) NOT NULL,
   ccontent VARCHAR(500) NOT NULL,
   view INT DEFAULT 0, 
   cuploaddate TIMESTAMP default now(),
   cupdatedate TIMESTAMP default now(),
   secret boolean,
   FOREIGN KEY(id) REFERENCES user(id) on delete cascade
);
drop table Compl;

select * from Creply where cno=307;
delete from creply where cno=98;

delete from compl where id='test2';
select * from user;
update user set withdraw=false where id='test2';

select count(*) from user where email='limja77770@naver.com';


create table creply(
	rcontent varchar(2000) not null,
	id varchar(30),
	ruploaddate timestamp default now(),
	rupdatedate timestamp default now(),
	up int default 0,
	down int default 0,
	cno int,
	foreign key (cno) references compl (cno) on delete cascade
);
drop table creply;

CREATE TABLE product(
   pno INT  PRIMARY KEY AUTO_INCREMENT,
   pname VARCHAR(300) NOT NULL,
   price int not null,
   pcontent varchar(500)not null,
   puploaddate TIMESTAMP default now(),
   pcode varchar(100) not null,
   plike int default 0
);

create table product_image(
	pno int,
	fileName varchar(500) not null,
	uploadPath varchar(500) not null,
	uuid varchar(500) primary key,
	foreign key (pno)references product(pno) on delete cascade
);

select *from product;
select * from product_image;

drop table product;
drop table product_image;


CREATE TABLE menu(
	mno INT PRIMARY KEY AUTO_INCREMENT,
	muploaddate TIMESTAMP DEFAULT now(),
	mupdatedate TIMESTAMP DEFAULT now(),
	myear INT NOT NULL,
	month INT NOT NULL,
	mlike INT DEFAULT 0
);
create table menu_image(
	mno int,
	fileName varchar(500) not null,
	uploadPath varchar(500) not null,
	uuid varchar(500) primary key,
	foreign key (mno)references menu(mno) on delete cascade
);
drop table menu;
drop table menu_image;
INSERT INTO MENU(myear, month) VALUES(
		2023,9);
select * from menu;
select * from menu_image;
select count(*) total from menu ;

select * from compl where id='test';
SELECT COUNT(*) total FROM COMPL
		where id='test';

select * from user;
select * from creply;
delete from creply where cno=92;
select * from CREPLY where cno=92;

create table NOTICE(
	nno int primary key auto_increment,
	ntitle varchar(100) not null,
	ncontent varchar(2000) not null,
	nuploaddate timestamp default now(),
	view int default 0,
	filename varchar(500)
);	
drop table notice;
select * from notice;
select * from compl;
SELECT * FROM compl order by cno desc LIMIT 5 ;
select * from product order by pno desc limit 2;
select * from menu order by mno desc limit 1;
update user set withdraw=false where id='test3';
select *from user;
select * from menu_image order by mno desc limit 1;
select * from product_image order by pno desc limit 2;
update user set withdraw=false where id='test';


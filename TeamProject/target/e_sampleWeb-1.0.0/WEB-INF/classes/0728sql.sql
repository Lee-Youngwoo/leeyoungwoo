create table Friday(
	id number primary key,
	title varchar2(100) not null,
	RegUser varchar2(100) not null,
	content varchar2(400)not null,
	RegDate date default sysdate
);
drop table Friday;
select *from friday;
drop sequence Board_Id;
select Board_Id as Board_ID from dual;
select Board_ID.nextval from dual ;
select * from member;

create table member(
	mid varchar2(10) primary key,
	mpwd varchar2(20) not null,
	mname varchar2(10) not null
);
create sequence Board_Id increment by 1 start with 1;
insert into Friday(id,title,reguser,content,regdate) values (Board_Id.nextval,?,?,?,sysdate);

desc FRIDAY;

-----------------------------
CREATE TABLE Compl(
   Cno INT  PRIMARY KEY AUTO_INCREMENT,
   Ctitle VARCHAR(300) NOT NULL,
   CWriter VARCHAR(300) NOT NULL,
   CContent VARCHAR(500) NOT NULL,
   VIEW INT DEFAULT 0, 
   CUploadDate TIMESTAMP default now(),
   secret varchar(10) DEFAULT "No",
);
select * from CREPLY where cno=5;

CREATE TABLE product(
   pno INT  PRIMARY KEY AUTO_INCREMENT,
   pname VARCHAR(300) NOT NULL,
   price int not null,
   pcontent varchar(500)not null,
   puploaddate TIMESTAMP default now(),
   pcode varchar(100) not null
);

insert into product (pname,price,pcontent,pcode) values('연필',1000,'4B연필인데 지림','P1234');
update product set pname='샤프', price=2000,pcontent='샤프임',pcode='P1233' where pno=1;
delete from product where pno=2;

select * from product;

insert into compl (Ctitle,CWriter,CContent,cuploaddate) values('test','test','test',now());
select *from compl;

create Table user(
	id varchar(100) primary key,
	pwd varchar(100) not null,
	name varchar(100) not null,
	level varchar(10) default "User",
	email varchar(100) not null,
	phone varchar(100) not null,
	area varchar(300) not null,
	reg_date timestamp default now()
);
create table CREPLY (
	rcontent varchar(2000) NOT NULL,
	ruploaddate timestamp DEFAULT now(),
	rwriter varchar(30),
	cno int primary key constraint creply_cno_fk references compl
);
insert into user (id,pwd,name,email,phone,area) values("test2","test2","test2","test2@naver.com","010-1234-56782","대구광역시2");
update USER set pwd="5", name="5",  email="5", phone="5" , area="5" where id="살상";
delete from user where id="";
select *from CREPLY;
delete from CREPLY where cno=5;

INSERT INTO CREPLY(rcontent,rwriter,cno) VALUES(
			"jj",
			"jj",
			3
			);

select name from user where id='limja77770';
delete from creply where cno=9;

select * from creply where cno=9;

delete from compl where cno=6 cascade;

select * from compl;

select *from compl where  uid='tt';

drop table creply;

drop table compl
;

alter table compl change id uid varchar(100) not null;


select * from user;

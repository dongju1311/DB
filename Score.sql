use hrdb2019;
select database();
select * from member;
desc member;
select 
	member_id,
	name,
    email,
    create_at
from member
where name = '홍길동';

select * from member;


-- score_member 테이블 생성
create table score_member(
	mid char(5) primary key,
    name varchar(10) not null,
    department varchar(20),
    kor	decimal(6,2) default 0.0,
    eng decimal(6,2) default 0.0,
    math decimal(6,2) default 0.0,
    mdate datetime
    );
show tables;
desc score_member;

delimiter $$
create trigger trg_score_member_mid
before insert on score_member -- 테이블명
for each row
begin
declare max_code int;
select ifnull(max(cast(right(mid,4) as unsigned)),0)
into max_code
from score_member;
set new.mid = concat('M', lpad((max_code+1),4,'0'));
end $$
delimiter ;







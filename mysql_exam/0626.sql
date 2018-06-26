#2018-0626
select * from sample.sample21;
use sample;
select * from sample21;
desc sample635;
select * from sample21
where no <= 2;
select * from sample21
where no <> 2;
#<> 아니다 라는 표현

select * from sample21 WHERE name = '박준용';

select * FROM sample21 where birthday IS NULL;

select * from sample24;
select * from sample24
where a <>0 or b<>0;

select * from sample24
where (a=1 or a=2) and (b=1 or b=2);

select * from sample24
where not (a<>0 or b<>0);

SELECT * FROM sakila.actor
where first_name = 'TOM';

select * from sample25;

select * from sample25;
desc sample25;


select text from sample25
where text like '_OM';

select * from sample31;
desc sample31;
select * from sample31
order by age asc, address desc;

select * from sample31
order by  address desc;

select *FROM sample32 order by a ASC, b DESC;

select * from sample33 order by no desc LIMIT 3 ;
select *,price*quantity as tot1 from sample34 where price*quantity > 1900;
select * from sample34; 
select *,price*quantity as tot1 from sample34 order by tot1;

select * from sample341;

select amount,round(amount,-2) from sample341;

select amount,round(amount)as round1,sqrt(amount)  from sample341
where sqrt(amount)>40
order by round1;

select concat(quantity,unit) from sample35;
select * , substring(address,1,2),
character_length(address)
from sample21;

select current_timestamp();

select datediff(current_date(),birthday)
from sample21;

select * from sample37;

select a as "코드",
case when a=1 then '남자'
	when a=2 then '여자'
    else '미입력'
    end as "성별" From sample37;
    
select a as "코드",
case when a is NULL then 0
	else a
    end as "숫자" From sample37;
    
select a as "코드",
case a when  NULL then 0
	else a
    end as "성별" From sample37;
    # 이렇게 하면 안된다고 한다.
    
select * from sample41;
desc sample41;

insert into sample41
value(1);

insert into sample41
values(1,'abc','2018-06-26');

select * from sample41;

insert into sample41(no)
values(2);

insert into sample41(no,a,b)
values(3,'xyz','2018-06-01');

select * from sample411;

insert into sample411
values(1,5);

insert into sample411(no)
values(2);
select* from sample411;
insert into sample411(no)
values(2);

insert into sample411(no ,d)
values(2,default);
select* from sample41;
delete from sample41
where no=2;
# 워크벤치라서 안된다고 한다.

insert into sample41(no)
values(4);

update sample41 set a='a',b='2018-06-26'
where a is null and b is null;

# 이것도 딜리트랑 마찬가지로 안된다.

select * from sample51;

select sum(quantity),count(name)
 from sample51
 where name='A';
 
select count(no), count(name), count(distinct name)
from sample51;

select name, avg(quantity),
avg(case when quantity is null then 0 else quantity end) as avg0
from sample51;

select name, avg(quantity),
avg(case when quantity is null then 0 else quantity end) as avg0
from sample51
group by name;

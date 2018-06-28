use sample;
CREATE TABLE sam01 (
    no INTEGER NOT NULL,
    a VARCHAR(20),
    b DATE,
    PRIMARY KEY (no)
);


desc sam01;

insert into sam01(no) values(4);

SELECT 
    *
FROM
    sam01;

alter table sam01 modify a varchar(30) not null default 'aaa';

DELETE FROM sam01 
WHERE
    no = 4;
    
SELECT 
    *
FROM
    sample71_a 
UNION SELECT 
    *
FROM
    sample71_b;
SELECT 
    *
FROM
    sample71_a 
UNION ALL SELECT 
    *
FROM
    sample71_b;
    
SELECT 
    *
FROM
    sample72_y;
    
SELECT 
    *
FROM
    sample72_x,
    sample72_y;
    
SELECT 
    *
FROM
    상품,
    재고수
WHERE
    상품.상품코드 = 재고수.상품코드;
    
SELECT 
    상품.상품코드, 상품.상품명
FROM
    상품,
    재고수
WHERE
    상품.상품코드 = 재고수.상품코드;

SELECT 
    상품.상품코드, 상품.상품명
FROM
    상품,
    재고수
WHERE
    상품.상품코드 = 재고수.상품코드
        AND 상품.상품분류 = '식료품';
SELECT 
    상품.상품명, 재고수.재고수
FROM
    상품,
    재고수
WHERE
    상품.상품코드 = 재고수.상품코드
        AND 상품.상품분류 = '식료품';
SELECT 
    *
FROM
    상품2;
SELECT 
    s.상품코드,
    s.상품명,
    s.메이커코드,
    m.메이커명,
    s.상품분류
FROM
    상품2 s
        INNER JOIN
    메이커 m ON s.메이커코드 = m.메이커코드;
    
SELECT 
    s.상품코드, s.상품명, m.메이커명, r.재고수
FROM
    상품2 s,
    메이커 m,
    재고수 r
WHERE
    s.상품코드 = r.상품코드
        AND s.메이커코드 = m.메이커코드;

SELECT 
    s.상품명, m.메이커명, r.재고수
FROM
    (SELECT 
        *
    FROM
        상품2
    WHERE
        상품분류 = '식료품') s,
    메이커 m,
    재고수 r
WHERE
    s.상품코드 = r.상품코드
        AND s.메이커코드 = m.메이커코드;

SELECT 
    *
FROM
    상품3;

SELECT 
    s.상품코드, s.상품명, r.재고수
FROM
    상품3 s
        INNER JOIN
    재고수 r ON s.상품코드 = r.상품코드;
    
    
SELECT 
    s.상품코드, s.상품명, r.재고수
FROM
    상품3 s
        LEFT JOIN
    재고수 r ON s.상품코드 = r.상품코드;
    
SELECT 
    s.상품코드, s.상품명, r.재고수
FROM
    상품3 s
        RIGHT JOIN
    재고수 r ON s.상품코드 = r.상품코드;
SELECT 
    *
FROM
    sakila.film_category;


Desc sakila.category;

Desc sakila.film_category;

SELECT 
    COUNT(category_id)
FROM
    sakila.film_category;


SELECT 
    category_id c_id, COUNT(category_id) count_id
FROM
    sakila.film_category
GROUP BY category_id
ORDER BY count_id DESC
LIMIT 5;

CREATE VIEW icategory1 AS
    SELECT 
        category_id c_id, COUNT(category_id) count_id
    FROM
        sakila.film_category
    GROUP BY category_id
    ORDER BY count_id DESC
    LIMIT 5;

SELECT 
    *
FROM
    icategory1;
SELECT 
    *
FROM
    sakila.category;
    
    use sakila;
SELECT 
    c.category_id, c.name, i.count_id
FROM
    category c,
    icategory1 i
WHERE
    c.category_id = i.c_id;
use db1;
desc 주문;
SELECT 
    *
FROM
    db1.주문;
insert into 주문 values(1,'2018-01-01',1,2);
    
start transaction;
    insert into 주문 values(2,'2018-01-01',2);
    insert into 주문 values(3,'2018-01-01',3);
rollback;

use sample;
CREATE TABLE 상품4 (
    no INTEGER,
    a VARCHAR(10)
);

insert into 상품4 values
(1,'aaa');

start transaction;

insert into 상품4 values
(2,'aaa');
insert into 상품4 values
(3,'aaa');

commit;
start transaction;

insert into 상품4 values
(5,'aaa');
insert into 상품4 values
(6,'aaa');

rollback;
select * from 상품4;
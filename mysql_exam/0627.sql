#2018-0627
use sample;
SELECT 
    *
FROM
    sample51;
SELECT 
    name,
    COUNT(*),
    COUNT(no),
    COUNT(name),
    AVG(quantity),
    AVG(CASE
        WHEN quantity IS NULL THEN 0
        ELSE quantity
    END)
FROM
    sample51
GROUP BY name
ORDER BY name DESC;

SELECT 
    *
FROM
    sakila.film_category;
    
SELECT 
    category_id, COUNT(category_id) AS c_count
FROM
    sakila.film_category
GROUP BY category_id
ORDER BY c_count DESC;

SELECT 
    name, COUNT(name)
FROM
    sample51
WHERE
    COUNT(name) = 1
GROUP BY name;
SELECT 
    name, COUNT(name)
FROM
    sample51
GROUP BY name
HAVING COUNT(name) = 1;


DELETE FROM sample54 
WHERE
    a = (SELECT 
        MIN(a)
    FROM
        sample54);

SELECT 
    *
FROM
    (SELECT 
        *
    FROM
        sample54) sq;
SELECT 
    *
FROM
    sample54
WHERE
    a >= 100;

SELECT 
    AVG(a)
FROM
    (SELECT 
        *
    FROM
        sample54
    WHERE
        a >= 100) sq;
SELECT 
    sq.a
FROM
    (SELECT 
        *
    FROM
        sample54
    WHERE
        a >= 100) sq;
SELECT 
    *
FROM
    sample54;
SELECT 
    *
FROM
    sample541;
        desc sample541;
SELECT 
    no, a
FROM
    sample54
WHERE
    no = 2;
    
    insert into sample541 values ((SELECT 
    no, a
FROM
    sample54
WHERE
    no = 2));
    
desc sample54;

desc sample541;

UPDATE sample551 
SET 
    a = '있음'
WHERE
    EXISTS( SELECT 
            *
        FROM
            sample552
        WHERE
            no2 = no);
            
UPDATE sample551 
SET 
    a = '있음'
WHERE
    EXISTS( SELECT 
            *
        FROM
            sample552
        WHERE
            no2 = no);
            
SELECT 
    *
FROM
    sample551
WHERE
    no IN (SELECT 
            no2
        FROM
            sample552);
            
CREATE TABLE sample62 (
    no INTEGER NOT NULL,
    a VARCHAR(30),
    b DATE
);
desc sample62;
insert into sample62 values(1,'XYZ','2018-06-27');
SELECT 
    *
FROM
    sample62;

Drop table sample64;
alter table sample62 add newcol integer;

alter table sample62 modify newcol varchar(20);

alter table sample62 change newcol c varchar(20);

alter table sample62 drop c;

desc sample62;

CREATE TABLE sample632 (
    no INTEGER NOT NULL,
    sub_no INTEGER NOT NULL,
    name VARCHAR(30),
    CONSTRAINT pkey_sample PRIMARY KEY (no , sub_no)
);
SELECT 
    *
FROM
    sample632;
desc sample632;

CREATE TABLE sample631 (
    no INTEGER NOT NULL,
    sub_no INTEGER NOT NULL,
    name VARCHAR(30)
);
alter table sample631 add constraint pk_sample631 primary key  (no,sub_no);
desc sample631;
CREATE TABLE sample634 (
    p INTEGER NOT NULL,
    a VARCHAR(30),
    CONSTRAINT pk_sample634 PRIMARY KEY (p)
);


insert into sample634 values(1,'첫째줄');
insert into sample634 values(2,'둘째줄');
insert into sample634 values(3,'셋째줄');
SELECT 
    *
FROM
    sample634;

desc sample62;
SELECT 
    *
FROM
    sample62;

insert into sample62 values(2,'zzz','2018-06-01');
insert into sample62 values(3,'aaa','2018-06-01');

explain select * from sample62 where no=2;

create index isample62 on sample62(no);

SELECT 
    *
FROM
    sample54;

SELECT 
    no, SQRT(a)
FROM
    vsample54;
CREATE VIEW vsample54 AS
    SELECT 
        *, a * 2, SQRT(a)
    FROM
        sample54;
CREATE TABLE 상품1 (
    상품코드 CHAR(4) NOT NULL,
    상품명 VARCHAR(30),
    메이커명 VARCHAR(30),
    가격 INTEGER,
    상품분류 VARCHAR(30),
    PRIMARY KEY (상품코드)
);

CREATE TABLE 재고수1 (
    상품코드 CHAR(4),
    입고날짜 DATE,
    재고수 INTEGER
);
SELECT 
    *
FROM
    상품1;
SELECT 
    *
FROM
    재고수1;
insert into 상품1 values(0001,'상품OO','OO메이커',100,'식료품');
insert into 상품1 values(0002,'상품XX','OO메이커',200,'식료품');
insert into 상품1 values(0003,'상품ZZ','ZZ메이커',1980,'생활용품');

insert into 재고수1 values(0001,'2014-01-03',200);
insert into 재고수1 values(0002,'2014-02-10',500);
insert into 재고수1 values(0003,'2014-02-14',10);
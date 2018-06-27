SELECT 
    *
FROM
    sample.sample21;
use sample;
SELECT 
    *
FROM
    sample21;
SELECT 
    no, name
FROM
    sample21;
SELECT 
    *
FROM
    sample.sample21;
use sample;
SELECT 
    *
FROM
    sample21;
desc sample635;
SELECT 
    *
FROM
    sample21
WHERE
    no <= 2;
SELECT 
    *
FROM
    sample21
WHERE
    no <> 2;
SELECT 
    *
FROM
    sample21
WHERE
    name = '박준용';

SELECT 
    *
FROM
    sample21
WHERE
    birthday IS NULL;

SELECT 
    *
FROM
    sample24;
SELECT 
    *
FROM
    sample24
WHERE
    a <> 0 OR b <> 0;

SELECT 
    *
FROM
    sample24
WHERE
    (a = 1 OR a = 2) AND (b = 1 OR b = 2);

SELECT 
    *
FROM
    sample24
WHERE
    NOT (a <> 0 OR b <> 0);

SELECT 
    *
FROM
    sakila.actor
WHERE
    first_name = 'TOM';

SELECT 
    *
FROM
    sample25;

SELECT 
    *
FROM
    sample25;
desc sample25;


SELECT 
    text
FROM
    sample25
WHERE
    text LIKE '_OM';

SELECT 
    *
FROM
    sample31;
desc sample31;
SELECT 
    *
FROM
    sample31
ORDER BY age ASC , address DESC;

SELECT 
    *
FROM
    sample31
ORDER BY address DESC;

SELECT 
    *
FROM
    sample32
ORDER BY a ASC , b DESC;

SELECT 
    *
FROM
    sample33
ORDER BY no DESC
LIMIT 3;
SELECT 
    *, price * quantity AS tot1
FROM
    sample34
WHERE
    price * quantity > 1900;
SELECT 
    *
FROM
    sample34;
SELECT 
    *, price * quantity AS tot1
FROM
    sample34
ORDER BY tot1;

SELECT 
    *
FROM
    sample341;

SELECT 
    amount, ROUND(amount, - 2)
FROM
    sample341;

SELECT 
    amount, ROUND(amount) AS round1, SQRT(amount)
FROM
    sample341
WHERE
    SQRT(amount) > 40
ORDER BY round1;

SELECT 
    CONCAT(quantity, unit)
FROM
    sample35;
SELECT 
    *, SUBSTRING(address, 1, 2), CHARACTER_LENGTH(address)
FROM
    sample21;

SELECT CURRENT_TIMESTAMP();

SELECT 
    DATEDIFF(CURRENT_DATE(), birthday)
FROM
    sample21;

SELECT 
    *
FROM
    sample37;

SELECT 
    a AS '코드',
    CASE
        WHEN a = 1 THEN '남자'
        WHEN a = 2 THEN '여자'
        ELSE '미입력'
    END AS '성별'
FROM
    sample37;
    
SELECT 
    a AS '코드',
    CASE
        WHEN a IS NULL THEN 0
        ELSE a
    END AS '숫자'
FROM
    sample37;
    
SELECT 
    a AS '코드',
    CASE a
        WHEN NULL THEN 0
        ELSE a
    END AS '성별'
FROM
    sample37;
SELECT 
    *
FROM
    sample41;
desc sample41;

insert into sample41
value(1);

insert into sample41
values(1,'abc','2018-06-26');

SELECT 
    *
FROM
    sample41;

insert into sample41(no)
values(2);

insert into sample41(no,a,b)
values(3,'xyz','2018-06-01');

SELECT 
    *
FROM
    sample411;

insert into sample411
values(1,5);

insert into sample411(no)
values(2);
SELECT 
    *
FROM
    sample411;
insert into sample411(no)
values(2);

insert into sample411(no ,d)
values(2,default);
SELECT 
    *
FROM
    sample41;
DELETE FROM sample41 
WHERE
    no = 2;
# 워크벤치라서 안된다고 한다.

insert into sample41(no)
values(4);

UPDATE sample41 
SET 
    a = 'a',
    b = '2018-06-26'
WHERE
    a IS NULL AND b IS NULL;

# 이것도 딜리트랑 마찬가지로 안된다.
/*
Elijah Sprung
Homework 5
*/

#67
SELECT DISTINCT
    c.CHECK_NUM, b.BOOK_NUM, c.CHECK_OUT_DATE
FROM
    CHECKOUT c
        JOIN
    BOOK b ON c.BOOK_NUM = b.BOOK_NUM
WHERE
    c.CHECK_OUT_DATE < '2017-04-05';

#69
SELECT DISTINCT
    b.BOOK_NUM, b.BOOK_TITLE, b.BOOK_YEAR
FROM
    BOOK b
WHERE
    (b.BOOK_SUBJECT = 'Middleware'
        OR b.BOOK_SUBJECT = 'Cloud')
        AND b.BOOK_COST > 70
ORDER BY b.BOOK_NUM;

#70
SELECT DISTINCT
    a.AU_ID, a.AU_FNAME, a.AU_LNAME, a.AU_BIRTHYEAR
FROM
    AUTHOR a
WHERE
    a.AU_BIRTHYEAR > 1979
        AND a.AU_BIRTHYEAR < 1990
ORDER BY a.AU_ID;

#80
SELECT 
    COUNT(*) AS 'Available Books'
FROM
    BOOK
WHERE
    BOOK_NUM NOT IN (SELECT 
            BOOK_NUM
        FROM
            CHECKOUT
        WHERE
            CHECK_IN_DATE IS NULL);

#85
SELECT 
    w.AU_ID, COUNT(w.BOOK_NUM) AS Books_Written
FROM
    WRITES w
GROUP BY w.AU_ID
ORDER BY Books_Written DESC , w.AU_ID;

#96
SELECT 
    a.AU_ID, a.AU_FNAME, a.AU_LNAME, w.BOOK_NUM, b.BOOK_TITLE
FROM
    AUTHOR a
        JOIN
    WRITES w ON a.AU_ID = w.AU_ID
        JOIN
    BOOK b ON w.BOOK_NUM = b.BOOK_NUM
WHERE
    b.BOOK_SUBJECT = 'Cloud'
ORDER BY b.BOOK_TITLE , a.AU_LNAME;

#98
SELECT 
    b.BOOK_NUM,
    b.BOOK_TITLE,
    COUNT(c.CHECK_OUT_DATE) AS Times_Checked_Out
FROM
    BOOK b
        LEFT JOIN
    CHECKOUT c ON b.BOOK_NUM = c.BOOK_NUM
GROUP BY b.BOOK_NUM , b.BOOK_TITLE
ORDER BY Times_Checked_Out DESC , b.BOOK_TITLE;

#100
SELECT 
    a.AU_ID,
    a.AU_LNAME,
    b.BOOK_TITLE,
    c.CHECK_OUT_DATE,
    p.PAT_LNAME
FROM
    AUTHOR a
        JOIN
    WRITES w ON a.AU_ID = w.AU_ID
        JOIN
    BOOK b ON w.BOOK_NUM = b.BOOK_NUM
        JOIN
    CHECKOUT c ON b.BOOK_NUM = c.BOOK_NUM
        JOIN
    PATRON p ON c.PAT_ID = p.PAT_ID
WHERE
    a.AU_LNAME = 'Bruer'
        AND p.PAT_LNAME = 'Miles'
ORDER BY c.CHECK_OUT_DATE;

#101
SELECT 
    p.PAT_ID, p.PAT_FNAME, p.PAT_LNAME
FROM
    PATRON p
WHERE
    p.PAT_ID NOT IN (SELECT 
            p.PAT_ID
        FROM
            PATRON p
                JOIN
            CHECKOUT c ON p.PAT_ID = c.PAT_ID)
ORDER BY p.PAT_LNAME , p.PAT_FNAME;
    

#105
SELECT 
    b.BOOK_NUM, b.BOOK_TITLE, b.BOOK_COST
FROM
    BOOK b
WHERE
    b.BOOK_COST = (SELECT 
            MIN(b.BOOK_COST) AS LOWEST
        FROM
            BOOK b)
ORDER BY b.BOOK_NUM;

#106
SELECT DISTINCT
    a.AU_ID, a.AU_FNAME, a.AU_LNAME
FROM
    AUTHOR a
WHERE
    a.AU_ID NOT IN (SELECT 
            a.AU_ID
        FROM
            AUTHOR a
                JOIN
            WRITES w ON a.AU_ID = w.AU_ID
                JOIN
            BOOK b ON w.BOOK_NUM = b.BOOK_NUM
        WHERE
            b.BOOK_SUBJECT = 'Programming')
ORDER BY a.AU_LNAME;

#108
SELECT DISTINCT
    b.BOOK_NUM,
    b.BOOK_TITLE,
    b.BOOK_SUBJECT,
    a.AU_LNAME,
    n.count AS 'Num Books by Author'
FROM
    (SELECT 
        w.AU_ID, COUNT(DISTINCT w.BOOK_NUM) AS count
    FROM
        WRITES w
    GROUP BY w.AU_ID) AS n,
    BOOK b
        JOIN
    WRITES w ON b.BOOK_NUM = w.BOOK_NUM
        JOIN
    AUTHOR a ON w.AU_ID = a.AU_ID
WHERE
    b.BOOK_SUBJECT = 'Cloud'
        AND a.AU_ID = n.AU_ID
ORDER BY b.BOOK_TITLE , a.AU_LNAME;
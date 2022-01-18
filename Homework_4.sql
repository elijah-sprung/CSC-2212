/* Eljiah Sprung */

#29
SELECT DISTINCT
    LGEMPLOYEE.EMP_FNAME,
    LGEMPLOYEE.EMP_LNAME,
    LGEMPLOYEE.EMP_EMAIL
FROM
    LGEMPLOYEE
WHERE
    LGEMPLOYEE.EMP_HIREDATE < '2014-12-31'
        AND LGEMPLOYEE.EMP_HIREDATE > '2005-01-01'
ORDER BY LGEMPLOYEE.EMP_LNAME , LGEMPLOYEE.EMP_FNAME;
    
#31
SELECT 
    LGEMPLOYEE.EMP_NUM,
    LGEMPLOYEE.EMP_LNAME,
    LGEMPLOYEE.EMP_FNAME,
    LGSALARY_HISTORY.SAL_FROM,
    LGSALARY_HISTORY.SAL_END,
    LGSALARY_HISTORY.SAL_AMOUNT
FROM
    LGEMPLOYEE
        JOIN
    LGSALARY_HISTORY ON LGEMPLOYEE.EMP_NUM = LGSALARY_HISTORY.EMP_NUM
WHERE
    LGEMPLOYEE.EMP_NUM = 83731
        OR LGEMPLOYEE.EMP_NUM = 83745
        OR LGEMPLOYEE.EMP_NUM = 84039
ORDER BY LGEMPLOYEE.EMP_NUM , LGSALARY_HISTORY.SAL_FROM;

#32
SELECT DISTINCT
    LGCUSTOMER.CUST_FNAME,
    LGCUSTOMER.CUST_LNAME,
    LGCUSTOMER.CUST_STREET,
    LGCUSTOMER.CUST_CITY,
    LGCUSTOMER.CUST_STATE,
    LGCUSTOMER.CUST_ZIP
FROM
    LGCUSTOMER
        JOIN
    LGINVOICE ON LGCUSTOMER.CUST_CODE = LGINVOICE.CUST_CODE
        JOIN
    LGLINE ON LGINVOICE.INV_NUM = LGLINE.INV_NUM
        JOIN
    LGPRODUCT ON LGLINE.PROD_SKU = LGPRODUCT.PROD_SKU
        JOIN
    LGBRAND ON LGPRODUCT.BRAND_ID = LGBRAND.BRAND_ID
WHERE
    LGINVOICE.INV_DATE > '2017-07-15'
        AND LGINVOICE.INV_DATE < '2017-07-30'
        AND LGBRAND.BRAND_NAME = 'FORESTERS BEST'
ORDER BY LGCUSTOMER.CUST_STATE , LGCUSTOMER.CUST_LNAME , LGCUSTOMER.CUST_FNAME;

#38
SELECT 
    LGBRAND.BRAND_ID,
    LGBRAND.BRAND_NAME,
    ROUND(AVG(LGPRODUCT.PROD_PRICE), 2) AS 'AVG PRICE'
FROM
    LGBRAND
        JOIN
    LGPRODUCT ON LGBRAND.BRAND_ID = LGPRODUCT.BRAND_ID
GROUP BY LGBRAND.BRAND_NAME;

#41
SELECT 
    LGCUSTOMER.CUST_CODE,
    LGCUSTOMER.CUST_FNAME,
    LGCUSTOMER.CUST_LNAME,
    SUM(LGINVOICE.INV_TOTAL) AS TOTALINVOICES
FROM
    LGCUSTOMER
        JOIN
    LGINVOICE ON LGCUSTOMER.CUST_CODE = LGINVOICE.CUST_CODE
GROUP BY LGCUSTOMER.CUST_CODE
HAVING SUM(LGINVOICE.INV_TOTAL) > 1500
ORDER BY TOTALINVOICES DESC;

#43
SELECT DISTINCT
    LGVENDOR.VEND_ID,
    LGVENDOR.VEND_NAME,
    LGBRAND.BRAND_NAME,
    COUNT(LGPRODUCT.PROD_SKU) AS NUMPRODUCTS
FROM
    LGBRAND
        JOIN
    LGPRODUCT ON LGBRAND.BRAND_ID = LGPRODUCT.BRAND_ID
        JOIN
    LGSUPPLIES ON LGPRODUCT.PROD_SKU = LGSUPPLIES.PROD_SKU
        JOIN
    LGVENDOR ON LGSUPPLIES.VEND_ID = LGVENDOR.VEND_ID
GROUP BY LGVENDOR.VEND_NAME , LGBRAND.BRAND_NAME
ORDER BY LGVENDOR.VEND_NAME , LGBRAND.BRAND_NAME;

#46
SELECT DISTINCT
    LGBRAND.BRAND_ID,
    LGBRAND.BRAND_NAME,
    LGBRAND.BRAND_TYPE,
    AVG(LGPRODUCT.PROD_PRICE) AS AVGPRICE
FROM
    LGPRODUCT
        JOIN
    LGBRAND ON LGPRODUCT.BRAND_ID = LGBRAND.BRAND_ID
GROUP BY LGBRAND.BRAND_ID , LGBRAND.BRAND_NAME , LGBRAND.BRAND_TYPE
HAVING AVG(LGPRODUCT.PROD_PRICE) = (SELECT 
        MAX(TEMP.AVERAGES) AS LGST_AVERAGE
    FROM
        (SELECT 
            AVG(PROD_PRICE) AS AVERAGES, BRAND_ID
        FROM
            LGPRODUCT
        GROUP BY BRAND_ID) TEMP);

#47
SELECT DISTINCT
    e1.EMP_FNAME AS Manager_FName,
    e1.EMP_LNAME AS Manager_LName,
    LGDEPARTMENT.DEPT_NAME,
    LGDEPARTMENT.DEPT_NUM,
    e2.EMP_FNAME AS EMP_FNAME,
    e2.EMP_LNAME AS EMP_LNAME,
    LGCUSTOMER.CUST_FNAME,
    LGCUSTOMER.CUST_LNAME,
    LGINVOICE.INV_DATE,
    LGINVOICE.INV_TOTAL
FROM
    LGEMPLOYEE e1
        JOIN
    LGDEPARTMENT ON e1.EMP_NUM = LGDEPARTMENT.EMP_NUM
        JOIN
    LGEMPLOYEE e2 ON LGDEPARTMENT.DEPT_NUM = e2.DEPT_NUM
        JOIN
    LGINVOICE ON e2.EMP_NUM = LGINVOICE.EMPLOYEE_ID
        JOIN
    LGCUSTOMER ON LGINVOICE.CUST_CODE = LGCUSTOMER.CUST_CODE
WHERE
    LGCUSTOMER.CUST_LNAME = 'Hagan'
        AND LGINVOICE.INV_DATE = '2017-05-18';

#50
SELECT 
    A.INV_NUM,
    A.LINE_NUM,
    A.PROD_SKU,
    A.PROD_DESCRIPT,
    B.LINE_NUM,
    B.PROD_SKU,
    B.PROD_DESCRIPT,
    A.BRAND_ID
FROM
    (SELECT 
        l.INV_NUM,
            l.LINE_NUM,
            lp.PROD_SKU,
            lp.PROD_DESCRIPT,
            lp.BRAND_ID,
            lp.PROD_CATEGORY
    FROM
        LGLINE l, LGPRODUCT lp
    WHERE
        l.PROD_SKU = lp.PROD_SKU
            AND lp.PROD_CATEGORY = 'Sealer') A,
    (SELECT 
        l2.LINE_NUM,
            lp2.PROD_SKU,
            lp2.PROD_DESCRIPT,
            lp2.BRAND_ID,
            l2.INV_NUM,
            lp2.PROD_CATEGORY
    FROM
        LGLINE l2, LGPRODUCT lp2
    WHERE
        l2.PROD_SKU = lp2.PROD_SKU
            AND lp2.PROD_CATEGORY = 'Top Coat') B
WHERE
    A.INV_NUM = B.INV_NUM
        AND A.BRAND_ID = B.BRAND_ID
ORDER BY A.INV_NUM , A.LINE_NUM , B.LINE_NUM DESC;

#53
SELECT 
    LGCUSTOMER.CUST_CODE,
    LGCUSTOMER.CUST_FNAME,
    LGCUSTOMER.CUST_LNAME,
    LGCUSTOMER.CUST_STREET,
    LGCUSTOMER.CUST_CITY,
    LGCUSTOMER.CUST_STATE,
    LGCUSTOMER.CUST_ZIP,
    LGINVOICE.INV_DATE,
    LGINVOICE.INV_TOTAL AS 'LARGEST PURCHASE'
FROM
    LGCUSTOMER
        JOIN
    LGINVOICE ON LGCUSTOMER.CUST_CODE = LGINVOICE.CUST_CODE
WHERE
    CUST_STATE = 'AL'
        AND INV_TOTAL = (SELECT 
            MAX(INV_TOTAL)
        FROM
            LGINVOICE
        WHERE
            LGINVOICE.CUST_CODE = LGCUSTOMER.CUST_CODE) 
UNION SELECT 
    LGCUSTOMER.CUST_CODE,
    LGCUSTOMER.CUST_FNAME,
    LGCUSTOMER.CUST_LNAME,
    LGCUSTOMER.CUST_STREET,
    LGCUSTOMER.CUST_CITY,
    LGCUSTOMER.CUST_STATE,
    LGCUSTOMER.CUST_ZIP,
    NULL,
    0
FROM
    LGCUSTOMER
WHERE
    CUST_STATE = 'AL'
        AND LGCUSTOMER.CUST_CODE NOT IN (SELECT 
            LGINVOICE.CUST_CODE
        FROM
            LGINVOICE)
ORDER BY CUST_LNAME , CUST_FNAME;
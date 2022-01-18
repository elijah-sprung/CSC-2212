#1
select EMP_NUM, EMP_LNAME, EMP_FNAME, EMP_INITIAL 
from EMPLOYEE
where EMP_LNAME like 'smith%';

#2
select PROJ_NAME, PROJ_VALUE, PROJ_BALANCE, EMP_LNAME, EMP_FNAME, EMP_INITIAL, JOB.JOB_CODE, JOB_DESCRIPTION, JOB_CHG_HOUR
from PROJECT
join EMPLOYEE on PROJECT.EMP_NUM = EMPLOYEE.EMP_NUM
join JOB on EMPLOYEE.JOB_CODE = JOB.JOB_CODE
order by PROJ_VALUE;

#3
select PROJ_NAME, PROJ_VALUE, PROJ_BALANCE, EMP_LNAME, EMP_FNAME, EMP_INITIAL, JOB.JOB_CODE, JOB_DESCRIPTION, JOB_CHG_HOUR
from PROJECT
join EMPLOYEE on PROJECT.EMP_NUM = EMPLOYEE.EMP_NUM
join JOB on EMPLOYEE.JOB_CODE = JOB.JOB_CODE
order by EMP_LNAME;

#4
select distinct PROJ_NUM
from ASSIGNMENT
order by PROJ_NUM;

#5
select ASSIGN_NUM, EMP_NUM, PROJ_NUM, ASSIGN_CHARGE, ASSIGN_CHARGE * ASSIGN_HOURS as CALC_CHARGE
from ASSIGNMENT
order by ASSIGN_NUM;

#6
select ASSIGNMENT.EMP_NUM, EMPLOYEE.EMP_LNAME, ROUND(SUM(ASSIGN_HOURS), 1) as SumOfASSIGN_HOURS, SUM(ASSIGN_CHARGE) as SumOfASSIGN_CHARGE
from ASSIGNMENT, EMPLOYEE
where EMPLOYEE.EMP_NUM = ASSIGNMENT.EMP_NUM
group by EMP_NUM, EMP_LNAME;

#7
select PROJ_NUM, ROUND(SUM(ASSIGN_HOURS), 1) as SumOfASSIGN_HOURS, SUM(ASSIGN_CHARGE) as SumOfASSIGN_CHARGE
from ASSIGNMENT
group by PROJ_NUM;

#8
select ROUND(SUM(ASSIGN_HOURS), 1) as SumOfASSIGN_HOURS, SUM(ASSIGN_CHARGE) as SumOfASSIGN_CHARGE
from ASSIGNMENT;
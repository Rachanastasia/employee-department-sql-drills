/*

SCHEMA

EMPLOYEE
employee_id
department_id
boss_id
name
salary

DEPARTMENT
department_id
name
*/


-- 1. List employees (names) who have a bigger salary than their boss (bosses are also employees)
SELECT e.name
FROM employee AS e 
INNER JOIN employee AS m on e.boss_id = m.employee_id
WHERE e.salary > m.salary;

--  Shane Rocker
--  Pearlene Mullenix
--  Elba Tritt
--  Ernestine Chiarello
--  Sherri Bassett
--  Alvera Warfield
--  Edmund Mathias
--  Manuela Pendley
--  Eliza Delmont
--  Meda Westmoreland
--  Annita Grunden
--  Kallie Ghoston
--  Ping Vanderford
--  Malcolm Hosking
--  Weston Fife
--  Dorotha Ehle
--  Kia Zahm
--  Kelle Funkhouser
--  Sona Vidales
--  Carry Northington
--  Garrett Quinlan
--  Shaquita Malone
--  Hollie Moen
-- (23 rows)

-- 2. List employees, by department, who have the biggest salary in their departments
SELECT DISTINCT d.name, 
(SELECT MAX(salary) FROM employee AS e WHERE e.department_id = d.department_id)
FROM department as d
JOIN employee AS e on e.department_id = d.department_id;
--        name       |  max   
-- ------------------+--------
--  Accounting       | 198314
--  Dev Ops          | 108487
--  Engineering      | 123151
--  Finance          | 191457
--  ICQA             | 183687
--  Inbound          | 181150
--  IT               | 165779
--  Outbound         | 149998
--  QA               | 186706
--  Sys Admin        | 163356
--  Vendor Relations | 144541



-- 3. List departments that have fewer than 4 people
SELECT name
FROM department as d 
WHERE (SELECT COUNT(*) FROM employee as e 
WHERE e.department_id = d.department_id) < 4;

--  Sys Admin
--  Dev Ops
--  Vendor Relations


-- 4. List all departments along with the number of employees in each
SELECT DISTINCT d.name, 
(SELECT COUNT(*) FROM employee as e WHERE e.department_id = d.department_id)
FROM department as d
INNER JOIN employee as e
ON e.department_id = d.department_id;

--  Accounting       |     5
--  Dev Ops          |     2
--  Engineering      |     5
--  Finance          |     4
--  ICQA             |     6
--  Inbound          |     5
--  IT               |     6
--  Outbound         |     8
--  QA               |     4
--  Sys Admin        |     3
--  Vendor Relations |     3


-- 5. List employees who don't have a boss in the same department
SELECT e.name as employee_name, e.department_id as employee_department, b.name as boss_name, b.department_id as boss_department
FROM employee as e
JOIN employee as b ON b.employee_id = e.boss_id
WHERE e.department_id != b.department_id;

-- employee_name    | employee_department |      boss_name      | boss_department 
-- ---------------------+---------------------+---------------------+-----------------
--  Shane Rocker        |                   2 | Rhett Mcelhaney     |               7
--  Karren Rapoza       |                   1 | Ernestine Chiarello |               4
--  Pearlene Mullenix   |                   3 | Elba Tritt          |               8
--  Elba Tritt          |                   8 | Edmund Mathias      |               7
--  Normand Sacco       |                   5 | Marty Talamantez    |               3
--  Ernestine Chiarello |                   4 | Robbyn Mifflin      |               1
--  Sherri Bassett      |                   4 | Kallie Ghoston      |               1
--  Alvera Warfield     |                   1 | Elmer Pressnell     |               7
--  Edmund Mathias      |                   7 | Alona Chapdelaine   |              11
--  Elmer Pressnell     |                   7 | Manuela Pendley     |               3
--  Manuela Pendley     |                   3 | Alona Chapdelaine   |              11
--  Jone Gross          |                   5 | Kallie Ghoston      |               1
--  Alona Chapdelaine   |                  11 | Johnette Casavant   |               5
--  Eliza Delmont       |                   9 | Alline Riendeau     |               1
--  Magaly Portis       |                   4 | Marylin Wesley      |               7
--  Gennie Nordyke      |                   1 | Manuela Pendley     |               3
--  Ursula Neighbors    |                   2 | Jone Gross          |               5
--  Meda Westmoreland   |                   6 | Garrett Quinlan     |               2
--  Robbyn Mifflin      |                   1 | Carry Northington   |               9
--  Annita Grunden      |                   8 | Josphine Brouillard |              10
--  Belle Burghardt     |                   6 | Kallie Ghoston      |               1
--  Minnie Gillock      |                   9 | Annita Grunden      |               8
--  Sebrina Terrio      |                   6 | Robbyn Mifflin      |               1
--  Rhett Mcelhaney     |                   7 | Manuela Pendley     |               3
--  Ping Vanderford     |                   6 | Elmer Pressnell     |               7
--  Josphine Brouillard |                  10 | Pearlene Mullenix   |               3
--  Malcolm Hosking     |                   7 | Dodie Skeete        |               5
--  Weston Fife         |                   4 | Willette Charrier   |               8
--  Dorotha Ehle        |                  11 | Alvera Warfield     |               1
--  Selena Lovejoy      |                   4 | Hollie Moen         |               2
--  Krishna Kilpatrick  |                   8 | Sherri Bassett      |               4
--  Dona Mccollough     |                   5 | Elidia Nester       |               1
--  Kia Zahm            |                   1 | Dodie Skeete        |               5
--  Kelle Funkhouser    |                   2 | Magaly Portis       |               4
--  Marty Talamantez    |                   3 | Elmer Pressnell     |               7
--  Sona Vidales        |                   3 | Dona Mccollough     |               5
--  Willette Charrier   |                   8 | Sherri Bassett      |               4
--  Carry Northington   |                   9 | Alona Chapdelaine   |              11
--  Marylin Wesley      |                   7 | Johnette Casavant   |               5
--  Shaquita Malone     |                   8 | Alline Riendeau     |               1
--  Dodie Skeete        |                   5 | Josphine Brouillard |              10
--  Hollie Moen         |                   2 | Elmer Pressnell     |               7
--  Odell Sprouse       |                  10 | Krishna Kilpatrick  |               8
--  Johnette Casavant   |                   5 | Annita Grunden      |               8
--  Nguyet Spriggs      |                  11 | Jone Gross          |               5
-- (45 rows)




-- 6. List employees who DO have a boss in the same department
SELECT e.department_id, e.name as employee_name, b.name as boss_name
FROM employee as e
JOIN employee as b ON b.employee_id = e.boss_id
WHERE e.department_id = b.department_id;


--  department_id |  employee_name  |    boss_name     
-- ---------------+-----------------+------------------
--              1 | Elidia Nester   | Robbyn Mifflin
--              1 | Alline Riendeau | Kallie Ghoston
--              1 | Kallie Ghoston  | Alvera Warfield
--              7 | Sherly Kung     | Malcolm Hosking
--              8 | Wes Benefiel    | Wes Benefiel
--              2 | Garrett Quinlan | Ursula Neighbors


-- 7. List all departments and the total salary for each department

SELECT DISTINCT d.name, 
(SELECT SUM(salary) FROM employee AS e WHERE e.department_id = d.department_id)
FROM department as d
INNER JOIN employee as e
ON e.department_id = d.department_id;


--        name       |  sum   
-- ------------------+--------
--  Accounting       | 663554
--  Dev Ops          | 164941
--  Engineering      | 351253
--  Finance          | 578453
--  ICQA             | 661258
--  Inbound          | 542720
--  IT               | 681265
--  Outbound         | 922992
--  QA               | 498743
--  Sys Admin        | 454355
--  Vendor Relations | 319638




























































-- Given the Employee table, write a SQL query that finds out employees who earn
-- more than their managers

-- Employee
-- +----+-------+--------+-----------+
-- | Id | Name  | Salary | ManagerId |
-- +----+-------+--------+-----------+
-- | 1  | Joe   | 70000  | 3         |
-- | 2  | Henry | 80000  | 4         |
-- | 3  | Sam   | 60000  | NULL      |
-- | 4  | Max   | 90000  | NULL      |
-- +----+-------+--------+-----------+
# Solution
Select emp.Name Employee 
FROM Employee emp 
LEFT OUTER JOIN Employee man ON emp.ManagerId = man.Id 
WHERE emp.Salary > man.Salary;




SELECT w2.Id
FROM rising_temps w1, rising_temps w2
WHERE w1.Date + 1 = w2.Date
AND w1.Temperature < w2.Temperature;


-- Write a SQL query to get the second highest salary from the Employee table.

-- Employee
-- +----+--------+
-- | Id | Salary |
-- +----+--------+
-- | 1  | 100    |
-- | 2  | 200    |
-- | 3  | 300    |
-- +----+--------+

SELECT Salary
FROM Employee
ORDER BY Salary desc
LIMIT 1, 1;
# LIMIT offset, count


# Write a SQL query to delete all duplicate email entries in a table named Person,
# keeping only unique emails based on its smallest Id.

DELETE p1
FROM Person p1
INNER JOIN Person p2
WHERE p1.Email = p2.Email
AND p1.Id > p2.Id

SELECT *
FROM dupe_emails p1
INNER JOIN dupe_emails p2
WHERE p1.Email = p2.Email
AND p1.Id > p2.Id

# Suppose that a website contains two tables, the Customers table and the Orders table. 
# Write a SQL query to find all customers who never order anything.
SELECT Name as Customer
FROM Customers LEFT OUTER JOIN Orders ON Customers.Id = Orders.CustomerId
WHERE Orders.CustomerId IS NULL;


# Write a SQL query to find all duplicate emails in a table named Person.
SELECT Email FROM Person GROUP BY Email HAVING COUNT(Email) > 1;
# Use the HAVING, not WHERE clause, for aggregate result comparison

# Write a SQL query for a report that provides the following information for each person in the Person table, 
# regardless if there is an address for each of those people:
# Required format: FirstName, LastName, City, State
SELECT FirstName, Lastname, City, State
FROM Person p LEFT OUTER JOIN Address a on p.PersonId = a.PersonId;


############## Department Highest Salary ##############
# Write a SQL query to find employees who have the highest salary in each of the departments. 
# For the above tables, Max has the highest salary in the IT department and Henry has the 
# highest salary in the Sales department.
-- +----+-------+--------+--------------+
-- | Id | Name  | Salary | DepartmentId |
-- +----+-------+--------+--------------+
-- | 1  | Joe   | 70000  | 1            |
-- | 2  | Henry | 80000  | 2            |
-- | 3  | Sam   | 60000  | 2            |
-- | 4  | Max   | 90000  | 1            |
-- +----+-------+--------+--------------+

-- +----+----------+
-- | Id | Name     |
-- +----+----------+
-- | 1  | IT       |
-- | 2  | Sales    |
-- +----+----------+

# Desired view
-- +------------+----------+--------+
-- | Department | Employee | Salary |
-- +------------+----------+--------+
-- | IT         | Max      | 90000  |
-- | Sales      | Henry    | 80000  |
-- +------------+----------+--------+

SELECT d.Name as Department, e2.Name, e1.maxsalary
FROM (SELECT DepartmentId, MAX(Salary) as maxsalary
FROM Employee e
GROUP BY DepartmentId) as e1 INNER JOIN Employee e2 on e1.DepartmentId = e2.DepartmentId AND e1.maxsalary = e2.Salary
INNER JOIN Department d on e2.DepartmentId = d.Id;

# 

select distinct r.num  from 
    (select num,
        case when @last = num then @count:=@count+1
            when @last<>@last:=num then @count:=1
            end as n,
        from Logs
    ) r ,(select @count:=0,@last:=(select num from Logs limit 0,1)) temp
where r.n>=3







Create Table EmpDemo
(
EmpNo INT(11) NOT NULL AUTO_INCREMENT,
Ename VARCHAR(15) NULL DEFAULT NULL,
Salary DECIMAL(19,2) NOT NULL,
DeptNo INT(11) NOT NULL,
PRIMARY KEY (EmpNo)
); 

Create Table EmpDemo_Log 
(
EmpNo INT(11) NOT NULL,
Ename VARCHAR(15) NULL DEFAULT NULL,
Salary DECIMAL(19,2) NOT NULL,
DeptNo INT(11) NOT NULL,
Action VARCHAR(15) NULL DEFAULT NULL,
DateCreated DATETIME NULL DEFAULT NULL
); 

DELIMITER $$
CREATE TRIGGER after_EmpDemo_update
	AFTER UPDATE ON empdemo
    for each row
BEGIN
	INSERT INTO empdemo_log values(OLD.EmpNo, 
    OLD.Ename,
    OLD.Salary,
    OLD.DeptNo,
    'update',
	NOW());
END$$
DELIMITER ; 

DELIMITER $$
CREATE TRIGGER after_EmpDemo_insert
	AFTER INSERT ON empdemo
    for each row
BEGIN
	INSERT INTO empdemo_log values(NEW.EmpNo, 
    NEW.Ename,
    NEW.Salary,
    NEW.DeptNo,
    'insert',
	NOW());
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER before_EmpDemo_delete
	BEFORE DELETE ON empdemo
    for each row
BEGIN
	INSERT INTO empdemo_log values(OLD.EmpNo, 
    OLD.Ename,
    OLD.Salary,
    OLD.DeptNo,
    'delete',
	NOW());
END$$
DELIMITER ; 

DELIMITER $$
CREATE PROCEDURE get_employee_data
(IN param INT(11))
BEGIN
   IF param IS NULL THEN 
      SELECT * from EmpDemo ;
   ELSE 
      SELECT * from EmpDemo where DeptNo=param ;
   END IF;
END$$
DELIMITER ; 

drop PROCEDURE create_employee_data;
 DELIMITER $$
CREATE PROCEDURE create_employee_data
(INOUT counter INT, IN Ename VARCHAR(15), IN Salary DECIMAL(19,2), IN DeptNo INT(11))
BEGIN	
	SELECT max(EmpNo) into counter from empdemo;
	set counter = counter + 1;
	INSERT into empdemo(EmpNo, Ename, Salary, DeptNo) values(counter, ename, salary, deptno);	
END$$
DELIMITER ; 

set @counter = 0;
call create_employee_data(@counter,'Dani', 6000, 5);

call get_employee_data(5);

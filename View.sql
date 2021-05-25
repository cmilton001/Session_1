CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `northwind`.`new_view` AS
    SELECT 
        `northwind`.`empdemo`.`EmpNo` AS `EmpNo`,
        `northwind`.`empdemo`.`Ename` AS `Ename`,
        `northwind`.`empdemo`.`Salary` AS `Salary`,
        `northwind`.`empdemo`.`DeptNo` AS `DeptNo`
    FROM
        `northwind`.`empdemo`
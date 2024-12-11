DROP TRIGGER IF EXISTS `ch07_saleco`.`employee_del_trig`;
DELIMITER $$
USE ch07_saleco$$
CREATE trigger employee_del_trig AFTER delete ON employee
FOR EACH ROW
BEGIN
UPDATE system_variables
SET thevalue = thevalue - 1
WHERE keyname = 'employeeCount';
END$$
DELIMITER ;
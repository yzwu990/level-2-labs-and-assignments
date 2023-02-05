USE `lab6`;
DROP procedure IF EXISTS `sp_checkInvalidPostalCode`;

USE `lab6`;
DROP procedure IF EXISTS `lab6`.`sp_checkInvalidPostalCode`;
;

DELIMITER $$
USE `lab6`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkInvalidPostalCode`(postalcode varchar(45) )
BEGIN
	-- Check the format is OK, otherwise use signal sqlstate to throw a unique error
	IF ( `postalcode` NOT REGEXP '[A-Z][0-9][A-Z][0-9][A-Z][0-9]' ) THEN
		SIGNAL SQLSTATE '45001' set message_text='The postal code must be 6 characters in length of the form: "A9A9A9"!';
	END IF;
END$$

DELIMITER ;
;

USE `lab6`;
DROP procedure IF EXISTS `sp_checkInvalidTelephone`;

USE `lab6`;
DROP procedure IF EXISTS `lab6`.`sp_checkInvalidTelephone`;
;

DELIMITER $$
USE `lab6`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkInvalidTelephone`(telnumber varchar(45))
BEGIN
	-- Check the format is OK, otherwise use signal sqlstate to throw a unique error
	IF ( `telnumber` NOT LIKE '(___) ___-____' ) THEN
		SIGNAL SQLSTATE '45000' set message_text='The telepone number must be of the form: "(xxx) xxx-xxxx"!';
	END IF;
END$$

DELIMITER ;
;






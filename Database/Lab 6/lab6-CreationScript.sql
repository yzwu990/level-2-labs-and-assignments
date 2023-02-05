-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lab6
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `lab6` ;

-- -----------------------------------------------------
-- Schema lab6
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab6` DEFAULT CHARACTER SET utf8 ;
USE `lab6` ;

-- -----------------------------------------------------
-- Table `customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `customer` ;

CREATE TABLE IF NOT EXISTS `customer` (
  `idcustomer` INT NOT NULL,
  `birthdate` DATETIME NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcustomer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cname`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cname` ;

CREATE TABLE IF NOT EXISTS `cname` (
  `idname` INT NOT NULL,
  `firstname` VARCHAR(20) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idname`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `customer_name`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `customer_name` ;

CREATE TABLE IF NOT EXISTS `customer_name` (
  `idcustomer_name` INT NOT NULL,
  `startdate` DATETIME NOT NULL,
  `enddate` DATETIME NULL,
  `customer_idcustomer` INT NOT NULL,
  `name_idname` INT NOT NULL,
  PRIMARY KEY (`idcustomer_name`),
  CONSTRAINT `fk_customer_cname_customer`
    FOREIGN KEY (`customer_idcustomer`)
    REFERENCES `customer` (`idcustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_cname_name1`
    FOREIGN KEY (`name_idname`)
    REFERENCES `cname` (`idname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_customer_name_customer_idx` ON `customer_name` (`customer_idcustomer` ASC) VISIBLE;

CREATE INDEX `fk_customer_name_name1_idx` ON `customer_name` (`name_idname` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `idaddress` INT NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `province` VARCHAR(45) NOT NULL,
  `postalcode` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idaddress`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `customer_address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `customer_address` ;

CREATE TABLE IF NOT EXISTS `customer_address` (
  `idcustomer_address` INT NOT NULL,
  `startdate` DATETIME NOT NULL,
  `enddate` DATETIME NULL,
  `customer_idcustomer` INT NOT NULL,
  `address_idaddress` INT NOT NULL,
  PRIMARY KEY (`idcustomer_address`),
  CONSTRAINT `fk_customer_address_customer1`
    FOREIGN KEY (`customer_idcustomer`)
    REFERENCES `customer` (`idcustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_address_address1`
    FOREIGN KEY (`address_idaddress`)
    REFERENCES `address` (`idaddress`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_customer_address_customer1_idx` ON `customer_address` (`customer_idcustomer` ASC) VISIBLE;

CREATE INDEX `fk_customer_address_address1_idx` ON `customer_address` (`address_idaddress` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `telephone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `telephone` ;

CREATE TABLE IF NOT EXISTS `telephone` (
  `idtelephone` INT NOT NULL,
  `telephonetype` VARCHAR(45) NOT NULL,
  `number` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtelephone`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `customer_telephone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `customer_telephone` ;

CREATE TABLE IF NOT EXISTS `customer_telephone` (
  `idcustomer_telephone` INT NOT NULL,
  `startdate` DATETIME NOT NULL,
  `enddate` DATETIME NULL,
  `customer_idcustomer` INT NOT NULL,
  `telephone_idtelephone` INT NOT NULL,
  PRIMARY KEY (`idcustomer_telephone`),
  CONSTRAINT `fk_customer_telephone_customer1`
    FOREIGN KEY (`customer_idcustomer`)
    REFERENCES `customer` (`idcustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_telephone_telephone1`
    FOREIGN KEY (`telephone_idtelephone`)
    REFERENCES `telephone` (`idtelephone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_customer_telephone_customer1_idx` ON `customer_telephone` (`customer_idcustomer` ASC) VISIBLE;

CREATE INDEX `fk_customer_telephone_telephone1_idx` ON `customer_telephone` (`telephone_idtelephone` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `product` ;

CREATE TABLE IF NOT EXISTS `product` (
  `idproduct` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`idproduct`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `retaillocation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `retaillocation` ;

CREATE TABLE IF NOT EXISTS `retaillocation` (
  `idretaillocation` INT NOT NULL,
  `telephonenumber` VARCHAR(45) NOT NULL,
  `streetaddress` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `province` VARCHAR(45) NOT NULL,
  `postalcode` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idretaillocation`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `product_retaillocation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `product_retaillocation` ;

CREATE TABLE IF NOT EXISTS `product_retaillocation` (
  `idproduct_retaillocation` INT NOT NULL,
  `quantityonhand` INT NOT NULL,
  `product_idproduct` INT NOT NULL,
  `retaillocation_idretaillocation` INT NOT NULL,
  PRIMARY KEY (`idproduct_retaillocation`),
  CONSTRAINT `fk_product_retaillocation_product1`
    FOREIGN KEY (`product_idproduct`)
    REFERENCES `product` (`idproduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_retaillocation_retaillocation1`
    FOREIGN KEY (`retaillocation_idretaillocation`)
    REFERENCES `retaillocation` (`idretaillocation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_product_retaillocation_product1_idx` ON `product_retaillocation` (`product_idproduct` ASC) VISIBLE;

CREATE INDEX `fk_product_retaillocation_retaillocation1_idx` ON `product_retaillocation` (`retaillocation_idretaillocation` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `purchase`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `purchase` ;

CREATE TABLE IF NOT EXISTS `purchase` (
  `idorder` INT NOT NULL,
  `quantity` INT NOT NULL,
  `customer_idcustomer` INT NOT NULL,
  `product_idproduct` INT NOT NULL,
  `retaillocation_idretaillocation` INT NOT NULL,
  PRIMARY KEY (`idorder`),
  CONSTRAINT `fk_purchase_customer1`
    FOREIGN KEY (`customer_idcustomer`)
    REFERENCES `customer` (`idcustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_product1`
    FOREIGN KEY (`product_idproduct`)
    REFERENCES `product` (`idproduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_retaillocation1`
    FOREIGN KEY (`retaillocation_idretaillocation`)
    REFERENCES `retaillocation` (`idretaillocation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_order_customer1_idx` ON `purchase` (`customer_idcustomer` ASC) VISIBLE;

CREATE INDEX `fk_order_product1_idx` ON `purchase` (`product_idproduct` ASC) VISIBLE;

CREATE INDEX `fk_order_retaillocation1_idx` ON `purchase` (`retaillocation_idretaillocation` ASC) VISIBLE;

DELIMITER ;

-- -----------------------------------------------------
-- Data for table `customer`
-- -----------------------------------------------------
START TRANSACTION;
USE `lab6`;
INSERT INTO `customer` (`idcustomer`, `birthdate`, `password`) VALUES (1, '2000-01-01 00-00-00', 'asdfasdf');
INSERT INTO `customer` (`idcustomer`, `birthdate`, `password`) VALUES (2, '1999-02-03 00-00-00', 'qwert');
INSERT INTO `customer` (`idcustomer`, `birthdate`, `password`) VALUES (3, '2002-03-12 00-00-00', 'xzcv');
INSERT INTO `customer` (`idcustomer`, `birthdate`, `password`) VALUES (4, '1995-10-23 12-12-00', 'noonnoon');
INSERT INTO `customer` (`idcustomer`, `birthdate`, `password`) VALUES (5, '1992-08-09 08-00-00', 'poipoi');
INSERT INTO `customer` (`idcustomer`, `birthdate`, `password`) VALUES (6, '2001-07-22 00-00-00', 'lkjlkj');

COMMIT;


-- -----------------------------------------------------
-- Data for table `cname`
-- -----------------------------------------------------
START TRANSACTION;
USE `lab6`;
INSERT INTO `cname` (`idname`, `firstname`, `lastname`) VALUES (1, 'John', 'Smith');
INSERT INTO `cname` (`idname`, `firstname`, `lastname`) VALUES (2, 'Jane', 'Smith');
INSERT INTO `cname` (`idname`, `firstname`, `lastname`) VALUES (3, 'Jane', 'Lewis');
INSERT INTO `cname` (`idname`, `firstname`, `lastname`) VALUES (4, 'Tom', 'Jones');
INSERT INTO `cname` (`idname`, `firstname`, `lastname`) VALUES (5, 'Tim', 'Richards');
INSERT INTO `cname` (`idname`, `firstname`, `lastname`) VALUES (6, 'Tom', 'Richards');
INSERT INTO `cname` (`idname`, `firstname`, `lastname`) VALUES (7, 'Ricky', 'Edwards');
INSERT INTO `cname` (`idname`, `firstname`, `lastname`) VALUES (8, 'Flexon', 'Wringer');

COMMIT;


-- -----------------------------------------------------
-- Data for table `customer_name`
-- -----------------------------------------------------
START TRANSACTION;
USE `lab6`;
INSERT INTO `customer_name` (`idcustomer_name`, `startdate`, `enddate`, `customer_idcustomer`, `name_idname`) VALUES (1, '1999-01-01 00:00:00', NULL, 1, 1);
INSERT INTO `customer_name` (`idcustomer_name`, `startdate`, `enddate`, `customer_idcustomer`, `name_idname`) VALUES (2, '1999-01-01 00:00:00', '2018-10-10 00:00:00', 2, 2);
INSERT INTO `customer_name` (`idcustomer_name`, `startdate`, `enddate`, `customer_idcustomer`, `name_idname`) VALUES (3, '1999-01-01 00:00:00', NULL, 3, 4);
INSERT INTO `customer_name` (`idcustomer_name`, `startdate`, `enddate`, `customer_idcustomer`, `name_idname`) VALUES (4, '1999-01-01 00:00:00', '2018-09-01 00:00:00', 4, 5);
INSERT INTO `customer_name` (`idcustomer_name`, `startdate`, `enddate`, `customer_idcustomer`, `name_idname`) VALUES (5, '1999-01-01 00:00:00', NULL, 5, 7);
INSERT INTO `customer_name` (`idcustomer_name`, `startdate`, `enddate`, `customer_idcustomer`, `name_idname`) VALUES (6, '1999-01-01 00:00:00', NULL, 6, 8);
INSERT INTO `customer_name` (`idcustomer_name`, `startdate`, `enddate`, `customer_idcustomer`, `name_idname`) VALUES (7, '2018-10-10 00:00:00', NULL, 2, 3);
INSERT INTO `customer_name` (`idcustomer_name`, `startdate`, `enddate`, `customer_idcustomer`, `name_idname`) VALUES (8, '2018-09-01 00:00:00', NULL, 4, 6);

COMMIT;


-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `lab6`;
INSERT INTO `address` (`idaddress`, `street`, `city`, `province`, `postalcode`) VALUES (1, '123 Blake Street', 'Guelph', 'Ontario', 'N2G4G3');
INSERT INTO `address` (`idaddress`, `street`, `city`, `province`, `postalcode`) VALUES (2, '234 Derek Drive', 'Toronto', 'Ontario', 'M5W1E5');
INSERT INTO `address` (`idaddress`, `street`, `city`, `province`, `postalcode`) VALUES (3, '1 Lewis Street', 'Ottawa', 'Ontario', 'K2S1E6');
INSERT INTO `address` (`idaddress`, `street`, `city`, `province`, `postalcode`) VALUES (4, '78 Patterson Street', 'Ottawa', 'Ontario', 'K1G7E3');
INSERT INTO `address` (`idaddress`, `street`, `city`, `province`, `postalcode`) VALUES (5, '2-67 Rideau Court', 'Ottawa', 'Ontario', 'K1K1H0');
INSERT INTO `address` (`idaddress`, `street`, `city`, `province`, `postalcode`) VALUES (6, '1 North Pole Circle', 'North Pole', 'Nunavut', 'H0H0H0');
INSERT INTO `address` (`idaddress`, `street`, `city`, `province`, `postalcode`) VALUES (7, '2 North Pole Circle', 'North Pole', 'Nunavut', 'H0H0H0');
INSERT INTO `address` (`idaddress`, `street`, `city`, `province`, `postalcode`) VALUES (8, '11 Lewis Street', 'Ottawa', 'Ontario', 'K2S1E6');

COMMIT;


-- -----------------------------------------------------
-- Data for table `customer_address`
-- -----------------------------------------------------
START TRANSACTION;
USE `lab6`;
INSERT INTO `customer_address` (`idcustomer_address`, `startdate`, `enddate`, `customer_idcustomer`, `address_idaddress`) VALUES (1, '2018-01-01', '2018-10-01 00:00:00', 1, 1);
INSERT INTO `customer_address` (`idcustomer_address`, `startdate`, `enddate`, `customer_idcustomer`, `address_idaddress`) VALUES (2, '2018-10-01  00:00:00', NULL, 1, 2);
INSERT INTO `customer_address` (`idcustomer_address`, `startdate`, `enddate`, `customer_idcustomer`, `address_idaddress`) VALUES (3, '2017-02-03  00:00:00', NULL, 2, 3);
INSERT INTO `customer_address` (`idcustomer_address`, `startdate`, `enddate`, `customer_idcustomer`, `address_idaddress`) VALUES (4, '2018-01-02  00:00:00', '2018-10-09  00:00:00', 3, 4);
INSERT INTO `customer_address` (`idcustomer_address`, `startdate`, `enddate`, `customer_idcustomer`, `address_idaddress`) VALUES (5, '2013-05-22  00:00:00', NULL, 4, 5);
INSERT INTO `customer_address` (`idcustomer_address`, `startdate`, `enddate`, `customer_idcustomer`, `address_idaddress`) VALUES (6, '2018-09-01  00:00:00', NULL, 5, 6);
INSERT INTO `customer_address` (`idcustomer_address`, `startdate`, `enddate`, `customer_idcustomer`, `address_idaddress`) VALUES (7, '2016-04-22  00:00:00', NULL, 6, 7);
INSERT INTO `customer_address` (`idcustomer_address`, `startdate`, `enddate`, `customer_idcustomer`, `address_idaddress`) VALUES (8, '2018-10-09  00:00:00', NULL, 3, 8);

COMMIT;


-- -----------------------------------------------------
-- Data for table `telephone`
-- -----------------------------------------------------
START TRANSACTION;
USE `lab6`;
INSERT INTO `telephone` (`idtelephone`, `telephonetype`, `number`) VALUES (1, 'home', '+16139876543');
INSERT INTO `telephone` (`idtelephone`, `telephonetype`, `number`) VALUES (2, 'cottage', '+15198987878');
INSERT INTO `telephone` (`idtelephone`, `telephonetype`, `number`) VALUES (3, 'work', '+19023456789');
INSERT INTO `telephone` (`idtelephone`, `telephonetype`, `number`) VALUES (4, 'home', '+14167785656');
INSERT INTO `telephone` (`idtelephone`, `telephonetype`, `number`) VALUES (5, 'work', '+16136784567');

COMMIT;


-- -----------------------------------------------------
-- Data for table `customer_telephone`
-- -----------------------------------------------------
START TRANSACTION;
USE `lab6`;
INSERT INTO `customer_telephone` (`idcustomer_telephone`, `startdate`, `enddate`, `customer_idcustomer`, `telephone_idtelephone`) VALUES (1, '1999-01-01 00:00:00', NULL, 1, 1);
INSERT INTO `customer_telephone` (`idcustomer_telephone`, `startdate`, `enddate`, `customer_idcustomer`, `telephone_idtelephone`) VALUES (2, '1999-01-01 00:00:00', NULL, 2, 2);
INSERT INTO `customer_telephone` (`idcustomer_telephone`, `startdate`, `enddate`, `customer_idcustomer`, `telephone_idtelephone`) VALUES (3, '1999-01-01 00:00:00', '2018-09-01 00:00:00', 3, 3);
INSERT INTO `customer_telephone` (`idcustomer_telephone`, `startdate`, `enddate`, `customer_idcustomer`, `telephone_idtelephone`) VALUES (4, '1999-01-01 00:00:00', NULL, 4, 4);
INSERT INTO `customer_telephone` (`idcustomer_telephone`, `startdate`, `enddate`, `customer_idcustomer`, `telephone_idtelephone`) VALUES (5, '1999-01-01 00:00:00', NULL, 5, 5);
INSERT INTO `customer_telephone` (`idcustomer_telephone`, `startdate`, `enddate`, `customer_idcustomer`, `telephone_idtelephone`) VALUES (6, '2018-09-01 00:00:00', NULL, 3, 6);

COMMIT;


-- -----------------------------------------------------
-- Data for table `product`
-- -----------------------------------------------------
START TRANSACTION;
USE `lab6`;
INSERT INTO `product` (`idproduct`, `name`, `description`, `price`) VALUES (1, 'Basmati Rice', 'new crop - 1kg', 7.99);
INSERT INTO `product` (`idproduct`, `name`, `description`, `price`) VALUES (2, 'Jasmine Rice', 'Indian first rate - 1kg', 4.99);
INSERT INTO `product` (`idproduct`, `name`, `description`, `price`) VALUES (3, 'Cream of Wheat', 'very fine grain - 10kg', 12.34);
INSERT INTO `product` (`idproduct`, `name`, `description`, `price`) VALUES (4, 'Strip Loin Steak', 'AAA grade per kilo', 23.99);
INSERT INTO `product` (`idproduct`, `name`, `description`, `price`) VALUES (5, 'Chicken Breast', 'Boneless, skinless per kilo', 8.80);
INSERT INTO `product` (`idproduct`, `name`, `description`, `price`) VALUES (6, 'Pepperoni Pizza', 'Frozen 40cm', 8.99);

COMMIT;


-- -----------------------------------------------------
-- Data for table `retaillocation`
-- -----------------------------------------------------
START TRANSACTION;
USE `lab6`;
INSERT INTO `retaillocation` (`idretaillocation`, `telephonenumber`, `streetaddress`, `city`, `province`, `postalcode`) VALUES (1, '+14164567890', '12 Bank Street', 'Toronto', 'Ontario', 'M5W2G4');
INSERT INTO `retaillocation` (`idretaillocation`, `telephonenumber`, `streetaddress`, `city`, `province`, `postalcode`) VALUES (2, '+16135678901', '23 Rideau Street', 'Ottawa', 'Ontario', 'K1N3G5');
INSERT INTO `retaillocation` (`idretaillocation`, `telephonenumber`, `streetaddress`, `city`, `province`, `postalcode`) VALUES (3, '+16136789012', '34 Sussex Drive', 'Ottawa', 'Ontario', 'K2G2S7');
INSERT INTO `retaillocation` (`idretaillocation`, `telephonenumber`, `streetaddress`, `city`, `province`, `postalcode`) VALUES (4, '+15197890123', '100 College Avenue', 'Guelph', 'Ontario', 'N1H2G3');

COMMIT;


-- -----------------------------------------------------
-- Data for table `product_retaillocation`
-- -----------------------------------------------------
START TRANSACTION;
USE `lab6`;
INSERT INTO `product_retaillocation` (`idproduct_retaillocation`, `quantityonhand`, `product_idproduct`, `retaillocation_idretaillocation`) VALUES (1, 50, 1, 1);
INSERT INTO `product_retaillocation` (`idproduct_retaillocation`, `quantityonhand`, `product_idproduct`, `retaillocation_idretaillocation`) VALUES (2, 20, 2, 1);
INSERT INTO `product_retaillocation` (`idproduct_retaillocation`, `quantityonhand`, `product_idproduct`, `retaillocation_idretaillocation`) VALUES (3, 30, 3, 1);
INSERT INTO `product_retaillocation` (`idproduct_retaillocation`, `quantityonhand`, `product_idproduct`, `retaillocation_idretaillocation`) VALUES (4, 20, 4, 1);
INSERT INTO `product_retaillocation` (`idproduct_retaillocation`, `quantityonhand`, `product_idproduct`, `retaillocation_idretaillocation`) VALUES (5, 20, 5, 1);
INSERT INTO `product_retaillocation` (`idproduct_retaillocation`, `quantityonhand`, `product_idproduct`, `retaillocation_idretaillocation`) VALUES (6, 10, 6, 1);
INSERT INTO `product_retaillocation` (`idproduct_retaillocation`, `quantityonhand`, `product_idproduct`, `retaillocation_idretaillocation`) VALUES (7, 23, 1, 2);
INSERT INTO `product_retaillocation` (`idproduct_retaillocation`, `quantityonhand`, `product_idproduct`, `retaillocation_idretaillocation`) VALUES (8, 34, 2, 2);
INSERT INTO `product_retaillocation` (`idproduct_retaillocation`, `quantityonhand`, `product_idproduct`, `retaillocation_idretaillocation`) VALUES (9, 25, 3, 2);
INSERT INTO `product_retaillocation` (`idproduct_retaillocation`, `quantityonhand`, `product_idproduct`, `retaillocation_idretaillocation`) VALUES (10, 25, 4, 2);
INSERT INTO `product_retaillocation` (`idproduct_retaillocation`, `quantityonhand`, `product_idproduct`, `retaillocation_idretaillocation`) VALUES (11, 10, 5, 2);
INSERT INTO `product_retaillocation` (`idproduct_retaillocation`, `quantityonhand`, `product_idproduct`, `retaillocation_idretaillocation`) VALUES (12, 23, 6, 2);
INSERT INTO `product_retaillocation` (`idproduct_retaillocation`, `quantityonhand`, `product_idproduct`, `retaillocation_idretaillocation`) VALUES (13, 24, 1, 3);
INSERT INTO `product_retaillocation` (`idproduct_retaillocation`, `quantityonhand`, `product_idproduct`, `retaillocation_idretaillocation`) VALUES (14, 23, 2, 3);
INSERT INTO `product_retaillocation` (`idproduct_retaillocation`, `quantityonhand`, `product_idproduct`, `retaillocation_idretaillocation`) VALUES (15, 34, 3, 3);
INSERT INTO `product_retaillocation` (`idproduct_retaillocation`, `quantityonhand`, `product_idproduct`, `retaillocation_idretaillocation`) VALUES (16, 23, 4, 3);
INSERT INTO `product_retaillocation` (`idproduct_retaillocation`, `quantityonhand`, `product_idproduct`, `retaillocation_idretaillocation`) VALUES (17, 24, 5, 3);
INSERT INTO `product_retaillocation` (`idproduct_retaillocation`, `quantityonhand`, `product_idproduct`, `retaillocation_idretaillocation`) VALUES (18, 14, 6, 3);
INSERT INTO `product_retaillocation` (`idproduct_retaillocation`, `quantityonhand`, `product_idproduct`, `retaillocation_idretaillocation`) VALUES (19, 25, 1, 4);
INSERT INTO `product_retaillocation` (`idproduct_retaillocation`, `quantityonhand`, `product_idproduct`, `retaillocation_idretaillocation`) VALUES (20, 35, 2, 4);
INSERT INTO `product_retaillocation` (`idproduct_retaillocation`, `quantityonhand`, `product_idproduct`, `retaillocation_idretaillocation`) VALUES (21, 24, 3, 4);
INSERT INTO `product_retaillocation` (`idproduct_retaillocation`, `quantityonhand`, `product_idproduct`, `retaillocation_idretaillocation`) VALUES (22, 35, 4, 4);
INSERT INTO `product_retaillocation` (`idproduct_retaillocation`, `quantityonhand`, `product_idproduct`, `retaillocation_idretaillocation`) VALUES (23, 22, 5, 4);
INSERT INTO `product_retaillocation` (`idproduct_retaillocation`, `quantityonhand`, `product_idproduct`, `retaillocation_idretaillocation`) VALUES (24, 21, 6, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `purchase`
-- -----------------------------------------------------
START TRANSACTION;
USE `lab6`;
INSERT INTO `purchase` (`idorder`, `quantity`, `customer_idcustomer`, `product_idproduct`, `retaillocation_idretaillocation`) VALUES (1, 2, 3, 2, 3);
INSERT INTO `purchase` (`idorder`, `quantity`, `customer_idcustomer`, `product_idproduct`, `retaillocation_idretaillocation`) VALUES (2, 3, 1, 1, 2);
INSERT INTO `purchase` (`idorder`, `quantity`, `customer_idcustomer`, `product_idproduct`, `retaillocation_idretaillocation`) VALUES (3, 4, 3, 2, 4);
INSERT INTO `purchase` (`idorder`, `quantity`, `customer_idcustomer`, `product_idproduct`, `retaillocation_idretaillocation`) VALUES (4, 5, 6, 3, 3);
INSERT INTO `purchase` (`idorder`, `quantity`, `customer_idcustomer`, `product_idproduct`, `retaillocation_idretaillocation`) VALUES (5, 3, 4, 4, 1);
INSERT INTO `purchase` (`idorder`, `quantity`, `customer_idcustomer`, `product_idproduct`, `retaillocation_idretaillocation`) VALUES (6, 2, 2, 3, 3);
INSERT INTO `purchase` (`idorder`, `quantity`, `customer_idcustomer`, `product_idproduct`, `retaillocation_idretaillocation`) VALUES (7, 5, 3, 2, 2);
INSERT INTO `purchase` (`idorder`, `quantity`, `customer_idcustomer`, `product_idproduct`, `retaillocation_idretaillocation`) VALUES (8, 6, 2, 1, 4);
INSERT INTO `purchase` (`idorder`, `quantity`, `customer_idcustomer`, `product_idproduct`, `retaillocation_idretaillocation`) VALUES (9, 4, 4, 2, 3);
INSERT INTO `purchase` (`idorder`, `quantity`, `customer_idcustomer`, `product_idproduct`, `retaillocation_idretaillocation`) VALUES (10, 3, 2, 3, 2);
INSERT INTO `purchase` (`idorder`, `quantity`, `customer_idcustomer`, `product_idproduct`, `retaillocation_idretaillocation`) VALUES (11, 7, 1, 2, 1);

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


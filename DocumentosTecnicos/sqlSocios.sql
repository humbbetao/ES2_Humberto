SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `clube_socios` DEFAULT CHARACTER SET latin1 ;
USE `clube_socios` ;

-- -----------------------------------------------------
-- Table `clube_socios`.`pagamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clube_socios`.`pagamento` ;

CREATE TABLE IF NOT EXISTS `clube_socios`.`pagamento` (
  `id_pagamento` INT(11) NOT NULL AUTO_INCREMENT,
  `valor` FLOAT NULL DEFAULT NULL,
  `data_pagamento` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id_pagamento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `clube_socios`.`socio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clube_socios`.`socio` ;

CREATE TABLE IF NOT EXISTS `clube_socios`.`socio` (
  `id_socio` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL DEFAULT NULL,
  `telefone` VARCHAR(45) NULL DEFAULT NULL,
  `endereco` VARCHAR(45) NULL DEFAULT NULL,
  `valor_mensalidade` FLOAT NULL DEFAULT NULL,
  `pagamento_id_pagamento` INT(11) NOT NULL,
  PRIMARY KEY (`id_socio`),
  INDEX `fk_socio_pagamento1_idx` (`pagamento_id_pagamento` ASC),
  CONSTRAINT `fk_socio_pagamento1`
    FOREIGN KEY (`pagamento_id_pagamento`)
    REFERENCES `clube_socios`.`pagamento` (`id_pagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `clube_socios`.`dependente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clube_socios`.`dependente` ;

CREATE TABLE IF NOT EXISTS `clube_socios`.`dependente` (
  `id_dependente` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL DEFAULT NULL,
  `endereco` VARCHAR(45) NULL DEFAULT NULL,
  `socio_id_socio` INT(11) NOT NULL,
  PRIMARY KEY (`id_dependente`),
  INDEX `fk_dependente_socio_idx` (`socio_id_socio` ASC),
  CONSTRAINT `fk_dependente_socio`
    FOREIGN KEY (`socio_id_socio`)
    REFERENCES `clube_socios`.`socio` (`id_socio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `clube_socios`.`registro_atividades`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clube_socios`.`registro_atividades` ;

CREATE TABLE IF NOT EXISTS `clube_socios`.`registro_atividades` (
  `id_registro_atividades` INT(11) NOT NULL AUTO_INCREMENT,
  `data_entrada` DATETIME NULL DEFAULT NULL,
  `data_saida` VARCHAR(45) NULL DEFAULT NULL,
  `socio_id_socio` INT(11) NOT NULL,
  PRIMARY KEY (`id_registro_atividades`, `socio_id_socio`),
  INDEX `fk_registro_atividades_socio1_idx` (`socio_id_socio` ASC),
  CONSTRAINT `fk_registro_atividades_socio1`
    FOREIGN KEY (`socio_id_socio`)
    REFERENCES `clube_socios`.`socio` (`id_socio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `clube_socios`.`unidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clube_socios`.`unidade` ;

CREATE TABLE IF NOT EXISTS `clube_socios`.`unidade` (
  `id_unidade` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL DEFAULT NULL,
  `endereco` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_unidade`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `clube_socios`.`socio_has_unidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clube_socios`.`socio_has_unidade` ;

CREATE TABLE IF NOT EXISTS `clube_socios`.`socio_has_unidade` (
  `socio_id_socio` INT(11) NOT NULL,
  `unidade_id_unidade` INT(11) NOT NULL,
  PRIMARY KEY (`socio_id_socio`, `unidade_id_unidade`),
  INDEX `fk_socio_has_unidade_unidade1_idx` (`unidade_id_unidade` ASC),
  INDEX `fk_socio_has_unidade_socio1_idx` (`socio_id_socio` ASC),
  CONSTRAINT `fk_socio_has_unidade_socio1`
    FOREIGN KEY (`socio_id_socio`)
    REFERENCES `clube_socios`.`socio` (`id_socio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_socio_has_unidade_unidade1`
    FOREIGN KEY (`unidade_id_unidade`)
    REFERENCES `clube_socios`.`unidade` (`id_unidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

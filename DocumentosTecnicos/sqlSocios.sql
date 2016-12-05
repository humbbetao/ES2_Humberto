SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `clube_socios` DEFAULT CHARACTER SET latin1 ;
USE `clube_socios` ;

-- -----------------------------------------------------
-- Table `clube_socios`.`usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clube_socios`.`usuario` ;

CREATE TABLE IF NOT EXISTS `clube_socios`.`usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idusuario`))
ENGINE = InnoDB;


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
  `usuario_idusuario` INT NOT NULL,
  PRIMARY KEY (`id_socio`),
  INDEX `fk_socio_usuario1_idx` (`usuario_idusuario` ASC),
  CONSTRAINT `fk_socio_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `clube_socios`.`usuario` (`idusuario`)
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
  `id_socio` INT(11) NOT NULL,
  PRIMARY KEY (`id_dependente`),
  INDEX `fk_dependente_socio1_idx` (`id_socio` ASC),
  CONSTRAINT `fk_dependente_socio1`
    FOREIGN KEY (`id_socio`)
    REFERENCES `clube_socios`.`socio` (`id_socio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `clube_socios`.`pagamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clube_socios`.`pagamento` ;

CREATE TABLE IF NOT EXISTS `clube_socios`.`pagamento` (
  `id_pagamento` INT(11) NOT NULL AUTO_INCREMENT,
  `valor` FLOAT NULL DEFAULT NULL,
  `data_pagamento` DATETIME NULL DEFAULT NULL,
  `id_socio` INT(11) NOT NULL,
  PRIMARY KEY (`id_pagamento`),
  INDEX `fk_pagamento_socio_idx` (`id_socio` ASC),
  CONSTRAINT `fk_pagamento_socio`
    FOREIGN KEY (`id_socio`)
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
  `id_socio` INT(11) NOT NULL,
  PRIMARY KEY (`id_registro_atividades`),
  INDEX `fk_registro_atividades_socio1_idx` (`id_socio` ASC),
  CONSTRAINT `fk_registro_atividades_socio1`
    FOREIGN KEY (`id_socio`)
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
-- Table `clube_socios`.`unidade_has_socio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clube_socios`.`unidade_has_socio` ;

CREATE TABLE IF NOT EXISTS `clube_socios`.`unidade_has_socio` (
  `id_unidade` INT(11) NOT NULL,
  `id_socio` INT(11) NOT NULL,
  PRIMARY KEY (`id_unidade`, `id_socio`),
  INDEX `fk_unidade_has_socio_socio1_idx` (`id_socio` ASC),
  INDEX `fk_unidade_has_socio_unidade1_idx` (`id_unidade` ASC),
  CONSTRAINT `fk_unidade_has_socio_unidade1`
    FOREIGN KEY (`id_unidade`)
    REFERENCES `clube_socios`.`unidade` (`id_unidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_unidade_has_socio_socio1`
    FOREIGN KEY (`id_socio`)
    REFERENCES `clube_socios`.`socio` (`id_socio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

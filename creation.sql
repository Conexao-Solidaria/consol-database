-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `consol` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `consol` DEFAULT CHARACTER SET utf8 ;
USE `consol` ;

-- -----------------------------------------------------
-- Table `mydb`.`familia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `consol`.`familia` ;

CREATE TABLE IF NOT EXISTS `consol`.`familia` (
  `id_familia` INT NOT NULL,
  `nome` VARCHAR(60) NULL,
  `cep` VARCHAR(8) NULL,
  `numero_casa` INT NULL,
  `renda` DOUBLE(8,2) NULL,
  PRIMARY KEY (`id_familia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`donatario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `consol`.`donatario` ;

CREATE TABLE IF NOT EXISTS `consol`.`donatario` (
  `id_beneficiario` INT NOT NULL,
  `data_cadastro` DATE NULL,
  `nome` VARCHAR(60) NULL,
  `rg*****` VARCHAR(9) NOT NULL,
  `cpf****` VARCHAR(11) NULL,
  `data_nascimento` DATE NULL,
  `telefone1` VARCHAR(11) NULL,
  `telefone2` VARCHAR(11) NULL,
  `estado_civil` VARCHAR(15) NULL,
  `escolaridade` VARCHAR(30) NULL,
  `trabalhando` TINYINT NULL,
  `ocupacao` VARCHAR(45) NULL,
  `fk_familia` INT NOT NULL,
  PRIMARY KEY (`id_beneficiario`, `rg*****`),
  INDEX `fk_donatario_familia1_idx` (`fk_familia` ASC) VISIBLE,
  CONSTRAINT `fk_donatario_familia1`
    FOREIGN KEY (`fk_familia`)
    REFERENCES `consol`.`familia` (`id_familia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`registroVisita`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `consol`.`registroVisita` ;

CREATE TABLE IF NOT EXISTS `consol`.`registroVisita` (
  `data_visita` DATE NOT NULL,
  `descricao` TEXT NULL,
  `fk_donatario` INT NOT NULL,
  PRIMARY KEY (`data_visita`),
  INDEX `fk_registroVisita_donatario1_idx` (`fk_donatario` ASC) VISIBLE,
  CONSTRAINT `fk_registroVisita_donatario1`
    FOREIGN KEY (`fk_donatario`)
    REFERENCES `consol`.`donatario` (`id_beneficiario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`despesa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `consol`.`despesa` ;

CREATE TABLE IF NOT EXISTS `consol`.`despesa` (
  `tipo` VARCHAR(45) NULL,
  `gasto` DOUBLE(7,2) NULL,
  `fk_familia` INT NOT NULL,
  PRIMARY KEY (`fk_familia`),
  CONSTRAINT `fk_despesa_familia1`
    FOREIGN KEY (`fk_familia`)
    REFERENCES `consol`.`familia` (`id_familia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`beneficio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `consol`.`beneficio` ;

CREATE TABLE IF NOT EXISTS `consol`.`beneficio` (
  `nome` VARCHAR(45) NULL,
  `valor` DOUBLE(7,2) NULL,
  `fk_beneficiario` INT NOT NULL,
  PRIMARY KEY (`fk_beneficiario`),
  CONSTRAINT `fk_beneficio_donatario1`
    FOREIGN KEY (`fk_beneficiario`)
    REFERENCES `consol`.`donatario` (`id_beneficiario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`instituicao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `consol`.`instituicao` ;

CREATE TABLE IF NOT EXISTS `consol`.`instituicao` (
  `id_instituicao` INT NOT NULL,
  `nome_instituicao` VARCHAR(70) NULL,
  `cep` CHAR(8) NULL,
  `numero_imovel` VARCHAR(10) NULL,
  `descricao` VARCHAR(255) NULL,
  `foto_perfil` BLOB NULL,
  PRIMARY KEY (`id_instituicao`),
  UNIQUE INDEX `cep_UNIQUE` (`cep` ASC) VISIBLE,
  UNIQUE INDEX `numeroImovel_UNIQUE` (`numero_imovel` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`doacoes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `consol`.`doacoes` ;

CREATE TABLE IF NOT EXISTS `consol`.`doacoes` (
  `id_doacoes` INT NOT NULL,
  `peso` DOUBLE(5,2) NULL,
  `descricao` VARCHAR(200) NULL,
  `status_doacao` CHAR(1) NULL,
  `data_doacao` DATETIME NULL,
  `fk_instituicao` INT NOT NULL,
  `donatario_id_beneficiario` INT NOT NULL,
  `donatario_rg*****` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`id_doacoes`),
  INDEX `fk_doacoes_instituicao1_idx` (`fk_instituicao` ASC) VISIBLE,
  UNIQUE INDEX `status_doacao_UNIQUE` (`status_doacao` ASC) VISIBLE,
  INDEX `fk_doacoes_donatario1_idx` (`donatario_id_beneficiario` ASC, `donatario_rg*****` ASC) VISIBLE,
  CONSTRAINT `fk_doacoes_instituicao1`
    FOREIGN KEY (`fk_instituicao`)
    REFERENCES `consol`.`instituicao` (`id_instituicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_doacoes_donatario1`
    FOREIGN KEY (`donatario_id_beneficiario` , `donatario_rg*****`)
    REFERENCES `consol`.`donatario` (`id_beneficiario` , `rg*****`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`necessidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `consol`.`necessidade` ;

CREATE TABLE IF NOT EXISTS `consol`.`necessidade` (
  `id_necessidade` INT NOT NULL,
  `tipo` VARCHAR(50) NULL,
  `descricao` VARCHAR(255) NULL,
  `fk_instituicao` INT NOT NULL,
  PRIMARY KEY (`id_necessidade`),
  INDEX `fk_necessidade_instituicao1_idx` (`fk_instituicao` ASC) VISIBLE,
  CONSTRAINT `fk_necessidade_instituicao1`
    FOREIGN KEY (`fk_instituicao`)
    REFERENCES `consol`.`instituicao` (`id_instituicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `consol`.`usuario` ;

CREATE TABLE IF NOT EXISTS `consol`.`usuario` (
  `id_usuario` INT NOT NULL,
  `coordernador` TINYINT NULL,
  `nome_usuario` VARCHAR(60) NULL,
  `email` VARCHAR(70) NULL,
  `senha` TEXT NULL,
  `cpf` CHAR(11) NULL,
  `fk_instituicao` INT NOT NULL,
  PRIMARY KEY (`id_usuario`, `fk_instituicao`),
  INDEX `fk_usuario_instituicao2_idx` (`fk_instituicao` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_instituicao2`
    FOREIGN KEY (`fk_instituicao`)
    REFERENCES `consol`.`instituicao` (`id_instituicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`instituicao_familia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `consol`.`instituicao_familia` ;

CREATE TABLE IF NOT EXISTS `consol`.`instituicao_familia` (
  `fk_instituicao` INT NOT NULL,
  `fk_familia` INT NOT NULL,
  PRIMARY KEY (`fk_instituicao`, `fk_familia`),
  INDEX `fk_instituicao_has_familia_familia1_idx` (`fk_familia` ASC) VISIBLE,
  INDEX `fk_instituicao_has_familia_instituicao1_idx` (`fk_instituicao` ASC) VISIBLE,
  CONSTRAINT `fk_instituicao_has_familia_instituicao1`
    FOREIGN KEY (`fk_instituicao`)
    REFERENCES `consol`.`instituicao` (`id_instituicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_instituicao_has_familia_familia1`
    FOREIGN KEY (`fk_familia`)
    REFERENCES `consol`.`familia` (`id_familia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

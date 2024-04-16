DROP DATABASE IF EXISTS `consol`;

CREATE DATABASE IF NOT EXISTS `consol` DEFAULT CHARACTER SET utf8;
USE `consol`;

CREATE TABLE IF NOT EXISTS `consol`.`familia` (
  `id_familia` INT NOT NULL,
  `nome` VARCHAR(60) NULL,
  `cep` VARCHAR(8) NULL,
  `numero_casa` INT NULL,
  `renda` DOUBLE(8,2) NULL,
  PRIMARY KEY (`id_familia`)
);

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
    FOREIGN KEY (`fk_familia`) REFERENCES `consol`.`familia` (`id_familia`)
);


CREATE TABLE IF NOT EXISTS `consol`.`registroVisita` (
  `data_visita` DATE NOT NULL,
  `descricao` TEXT NULL,
  `fk_donatario` INT NOT NULL,
  PRIMARY KEY (`data_visita`),
    FOREIGN KEY (`fk_donatario`) REFERENCES `consol`.`donatario` (`id_beneficiario`)
);

CREATE TABLE IF NOT EXISTS `consol`.`despesa` (
  `tipo` VARCHAR(45) NULL,
  `gasto` DOUBLE(7,2) NULL,
  `fk_familia` INT NOT NULL,
  PRIMARY KEY (`fk_familia`),
    FOREIGN KEY (`fk_familia`) REFERENCES `consol`.`familia` (`id_familia`)
);


CREATE TABLE IF NOT EXISTS `consol`.`beneficio` (
  `nome` VARCHAR(45) NULL,
  `valor` DOUBLE(7,2) NULL,
  `fk_beneficiario` INT NOT NULL,
  PRIMARY KEY (`fk_beneficiario`),
    FOREIGN KEY (`fk_beneficiario`)
    REFERENCES `consol`.`donatario` (`id_beneficiario`)
);

CREATE TABLE IF NOT EXISTS `consol`.`instituicao` (
  `id_instituicao` INT NOT NULL,
  `nome_instituicao` VARCHAR(70) NULL,
  `cep` CHAR(8) NULL,
  `numero_imovel` VARCHAR(10) NULL,
  `descricao` VARCHAR(255) NULL,
  `foto_perfil` BLOB NULL,
  PRIMARY KEY (`id_instituicao`)
);

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
    FOREIGN KEY (`fk_instituicao`) REFERENCES `consol`.`instituicao` (`id_instituicao`),
    FOREIGN KEY (`donatario_id_beneficiario` , `donatario_rg*****`) REFERENCES `consol`.`donatario` (`id_beneficiario` , `rg*****`)
);

CREATE TABLE IF NOT EXISTS `consol`.`necessidade` (
  `id_necessidade` INT NOT NULL,
  `tipo` VARCHAR(50) NULL,
  `descricao` VARCHAR(255) NULL,
  `fk_instituicao` INT NOT NULL,
  PRIMARY KEY (`id_necessidade`),
    FOREIGN KEY (`fk_instituicao`)REFERENCES `consol`.`instituicao` (`id_instituicao`)
);


CREATE TABLE IF NOT EXISTS `consol`.`usuario` (
  `id_usuario` INT NOT NULL,
  `coordernador` TINYINT NULL,
  `nome_usuario` VARCHAR(60) NULL,
  `email` VARCHAR(70) NULL,
  `senha` TEXT NULL,
  `cpf` CHAR(11) NULL,
  `fk_instituicao` INT NOT NULL,
  PRIMARY KEY (`id_usuario`, `fk_instituicao`),
    FOREIGN KEY (`fk_instituicao`)
    REFERENCES `consol`.`instituicao` (`id_instituicao`)
);


CREATE TABLE IF NOT EXISTS `consol`.`instituicao_familia` (
  `fk_instituicao` INT NOT NULL,
  `fk_familia` INT NOT NULL,
  PRIMARY KEY (`fk_instituicao`, `fk_familia`),
    FOREIGN KEY (`fk_instituicao`) REFERENCES `consol`.`instituicao` (`id_instituicao`),
    FOREIGN KEY (`fk_familia`) REFERENCES `consol`.`familia` (`id_familia`)
);
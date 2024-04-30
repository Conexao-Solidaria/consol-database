DROP DATABASE IF EXISTS `consol` ;

CREATE DATABASE IF NOT EXISTS `consol` DEFAULT CHARACTER SET utf8 ;
USE `consol` ;


CREATE TABLE IF NOT EXISTS `consol`.`familia` (
  `id_familia` INT NOT NULL auto_increment,
  `nome` VARCHAR(60) NULL,
  `cep` VARCHAR(8) NULL,
  `numero_casa` INT NULL,
  `renda` DOUBLE(8,2) NULL,
  PRIMARY KEY (`id_familia`)
)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `consol`.`donatario` (
  `id_donatario` INT NOT NULL auto_increment,
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
  PRIMARY KEY (`id_donatario`, `rg*****`),
    FOREIGN KEY (`fk_familia`) REFERENCES `consol`.`familia` (`id_familia`)
    ON DELETE CASCADE
    );


CREATE TABLE IF NOT EXISTS `consol`.`registroVisita` (
  `id_registro_visita` INT PRIMARY KEY auto_increment,
  `data_visita` DATE NOT NULL,
  `descricao` TEXT NULL,
  `fk_donatario` INT NOT NULL,
    FOREIGN KEY (`fk_donatario`) REFERENCES `consol`.`donatario` (`id_donatario`)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `consol`.`despesa` (
  `id_despesa` INT PRIMARY KEY auto_increment,
  `tipo` VARCHAR(45) NULL,
  `gasto` DOUBLE(7,2) NULL,
  `fk_familia` INT NOT NULL,
    FOREIGN KEY (`fk_familia`) REFERENCES `consol`.`familia` (`id_familia`)
    ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS `consol`.`beneficio` (
  `id_beneficio` INT PRIMARY KEY auto_increment,
  `nome` VARCHAR(45) NULL,
  `valor` DOUBLE(7,2) NULL,
  `fk_donatario` INT NOT NULL,
    FOREIGN KEY (`fk_donatario`) REFERENCES `consol`.`donatario` (`id_donatario`)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `consol`.`instituicao` (
  `id_instituicao` INT NOT NULL auto_increment,
  `nome_instituicao` VARCHAR(70) NULL,
  `cep` CHAR(8) NULL,
  `numero_imovel` VARCHAR(10) NULL,
  `descricao` VARCHAR(255) NULL,
  `foto_perfil` BLOB NULL,
  PRIMARY KEY (`id_instituicao`)
);

CREATE TABLE IF NOT EXISTS `consol`.`doacoes` (
  `id_doacoes` INT NOT NULL auto_increment,
  `peso` DOUBLE(5,2) NULL,
  `descricao` VARCHAR(200) NULL,
  `status_doacao` CHAR(1) NULL,
  `data_doacao` DATETIME NULL,
  `fk_instituicao` INT NOT NULL,
  `fk_donatario` INT NOT NULL,
  PRIMARY KEY (`id_doacoes`),
    FOREIGN KEY (`fk_instituicao`) REFERENCES `consol`.`instituicao` (`id_instituicao`) ON DELETE CASCADE,
    FOREIGN KEY (`fk_donatario`) REFERENCES `consol`.`donatario` (`id_donatario` ) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `consol`.`necessidade` (
  `id_necessidade` INT NOT NULL auto_increment,
  `tipo` VARCHAR(50) NULL,
  `descricao` VARCHAR(255) NULL,
  `fk_instituicao` INT NOT NULL,
  PRIMARY KEY (`id_necessidade`),
    FOREIGN KEY (`fk_instituicao`)REFERENCES `consol`.`instituicao` (`id_instituicao`)
    ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS `consol`.`usuario` (
  `id_usuario` INT NOT NULL auto_increment,
  `coordenador` TINYINT NULL,
  `nome_usuario` VARCHAR(60) NULL,
  `email` VARCHAR(70) NULL,
  `senha` TEXT NULL,
  `cpf` CHAR(11) NULL,
  `fk_instituicao` INT NOT NULL,
  PRIMARY KEY (`id_usuario`, `fk_instituicao`),
    FOREIGN KEY (`fk_instituicao`) REFERENCES `consol`.`instituicao` (`id_instituicao`)
    ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS `consol`.`instituicao_familia` (
  `id_familia_instituicao` INT PRIMARY KEY auto_increment,
  `fk_instituicao` INT NOT NULL,
  `fk_familia` INT NOT NULL,
    FOREIGN KEY (`fk_instituicao`) REFERENCES `consol`.`instituicao` (`id_instituicao`) ON DELETE CASCADE,
    FOREIGN KEY (`fk_familia`) REFERENCES `consol`.`familia` (`id_familia`)
    ON DELETE CASCADE
);

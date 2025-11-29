-- MySQL Workbench Forward Engineering
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema plataforma
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `plataforma` ;

-- -----------------------------------------------------
-- Schema plataforma
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `plataforma` DEFAULT CHARACTER SET utf8mb4;
USE `plataforma` ;

-- -----------------------------------------------------
-- categoria
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plataforma`.`categoria` (
  `id_categoria` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `ativa` TINYINT NOT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE)
ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;


-- -----------------------------------------------------
-- local
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plataforma`.`local` (
  `id_local` INT NOT NULL,
  `nome` VARCHAR(150) NOT NULL,
  `endereco` VARCHAR(255) NOT NULL,
  `cidade` VARCHAR(100) NOT NULL,
  `estado` VARCHAR(2) NOT NULL,
  `capacidade_maxima` INT NOT NULL,
  PRIMARY KEY (`id_local`))
ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;


-- -----------------------------------------------------
-- cliente
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plataforma`.`cliente` (
  `id_cliente` INT NOT NULL,
  `nome` VARCHAR(200) NOT NULL,
  `email` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;


-- -----------------------------------------------------
-- artista
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plataforma`.`artista` (
  `id_artista` INT NOT NULL,
  `nome_artista` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id_artista`))
ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;


-- -----------------------------------------------------
-- evento
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plataforma`.`evento` (
  `id_evento` INT NOT NULL,
  `id_categoria` INT NULL,
  `id_local_previsto` INT NULL,
  `titulo` VARCHAR(200) NULL,
  `descricao` TEXT NULL,
  `curadoria` VARCHAR(100) NULL,
  `status` VARCHAR(45) NULL,
  PRIMARY KEY (`id_evento`),
  INDEX `fk_evento_categoria_idx` (`id_categoria` ASC) VISIBLE,
  INDEX `fk_evento_local_idx` (`id_local_previsto` ASC) VISIBLE,
  CONSTRAINT `fk_evento_categoria`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `plataforma`.`categoria` (`id_categoria`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_evento_local`
    FOREIGN KEY (`id_local_previsto`)
    REFERENCES `plataforma`.`local` (`id_local`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;


-- -----------------------------------------------------
-- evento_artista
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plataforma`.`evento_artista` (
  `id_evento` INT NOT NULL,
  `id_artista` INT NOT NULL,
  `papel` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_evento`, `id_artista`),
  INDEX `fk_ea_artista_idx` (`id_artista` ASC) VISIBLE,
  CONSTRAINT `fk_ea_evento`
    FOREIGN KEY (`id_evento`)
    REFERENCES `plataforma`.`evento` (`id_evento`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ea_artista`
    FOREIGN KEY (`id_artista`)
    REFERENCES `plataforma`.`artista` (`id_artista`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;


-- -----------------------------------------------------
-- sessao
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plataforma`.`sessao` (
  `id_sessao` INT NOT NULL,
  `id_evento` INT NOT NULL,
  `data_hora` DATETIME NOT NULL,
  `status` ENUM('aberta', 'esgotada', 'cancelada') NOT NULL,
  `lote` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_sessao`, `id_evento`),
  INDEX `fk_sessao_evento_idx` (`id_evento` ASC) VISIBLE,
  CONSTRAINT `fk_sessao_evento`
    FOREIGN KEY (`id_evento`)
    REFERENCES `plataforma`.`evento` (`id_evento`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;


-- -----------------------------------------------------
-- tipo_ingresso
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plataforma`.`tipo_ingresso` (
  `id_tipo_ingresso` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `preco_base` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id_tipo_ingresso`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE)
ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;


-- -----------------------------------------------------
-- sessao_tipo_ingresso
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plataforma`.`sessao_tipo_ingresso` (
  `id_sessao_tipo` INT NOT NULL,
  `id_sessao` INT NOT NULL,
  `id_tipo_ingresso` INT NOT NULL,
  `preco` DECIMAL(10,2) NOT NULL,
  `quantidade_ofertada` INT NOT NULL,
  `quantidade_vendida` INT NOT NULL,
  PRIMARY KEY (`id_sessao`, `id_tipo_ingresso`),
  INDEX `fk_sti_tipo_idx` (`id_tipo_ingresso` ASC) VISIBLE,
  CONSTRAINT `fk_sti_sessao`
    FOREIGN KEY (`id_sessao`)
    REFERENCES `plataforma`.`sessao` (`id_sessao`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_sti_tipo`
    FOREIGN KEY (`id_tipo_ingresso`)
    REFERENCES `plataforma`.`tipo_ingresso` (`id_tipo_ingresso`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;


-- -----------------------------------------------------
-- pedido
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plataforma`.`pedido` (
  `id_pedido` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `data_pedido` DATETIME NOT NULL,
  `status` ENUM('aberto', 'pago', 'cancelado') NOT NULL,
  PRIMARY KEY (`id_pedido`),
  INDEX `fk_pedido_cliente_idx` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_pedido_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `plataforma`.`cliente` (`id_cliente`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;


-- -----------------------------------------------------
-- item_pedido
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plataforma`.`item_pedido` (
  `id_item_pedido` INT NOT NULL,
  `id_pedido` INT NOT NULL,
  `id_sessao` INT NOT NULL,
  `id_tipo_ingresso` INT NOT NULL,
  `quantidade` INT NOT NULL,
  `preco_unitario_efetivo` DECIMAL(10,2) NOT NULL,
  `valor_total` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id_item_pedido`),
  INDEX `fk_ip_pedido_idx` (`id_pedido` ASC) VISIBLE,
  INDEX `fk_ip_sessao_idx` (`id_sessao` ASC) VISIBLE,
  INDEX `fk_ip_tipo_idx` (`id_tipo_ingresso` ASC) VISIBLE,
  CONSTRAINT `fk_ip_pedido`
    FOREIGN KEY (`id_pedido`)
    REFERENCES `plataforma`.`pedido` (`id_pedido`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ip_sessao`
    FOREIGN KEY (`id_sessao`)
    REFERENCES `plataforma`.`sessao` (`id_sessao`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ip_tipo`
    FOREIGN KEY (`id_tipo_ingresso`)
    REFERENCES `plataforma`.`tipo_ingresso` (`id_tipo_ingresso`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;


-- -----------------------------------------------------
-- pagamento
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plataforma`.`pagamento` (
  `id_pagamento` INT NOT NULL,
  `id_pedido` INT NOT NULL,
  `valor` DECIMAL(10,2) NOT NULL,
  `data_pagamento` DATETIME NOT NULL,
  `status` ENUM('aprovado', 'pendente', 'estornado', 'cancelado') NOT NULL,
  `forma_pagamento` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_pagamento`),
  INDEX `fk_pag_pedido_idx` (`id_pedido` ASC) VISIBLE,
  CONSTRAINT `fk_pag_pedido`
    FOREIGN KEY (`id_pedido`)
    REFERENCES `plataforma`.`pedido` (`id_pedido`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;


-- -----------------------------------------------------
-- check_in
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plataforma`.`check_in` (
  `id_chekin` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `id_sessao` INT NOT NULL,
  `horario_chekin` DATETIME NOT NULL,
  `valido` TINYINT NOT NULL,
  PRIMARY KEY (`id_chekin`),
  INDEX `fk_ci_cliente_idx` (`id_cliente` ASC) VISIBLE,
  INDEX `fk_ci_sessao_idx` (`id_sessao` ASC) VISIBLE,
  CONSTRAINT `fk_ci_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `plataforma`.`cliente` (`id_cliente`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ci_sessao`
    FOREIGN KEY (`id_sessao`)
    REFERENCES `plataforma`.`sessao` (`id_sessao`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

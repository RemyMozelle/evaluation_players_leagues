-- -----------------------------------------------------
-- Schema remy
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `remy` DEFAULT CHARACTER SET utf8 ;
USE `remy` ;

-- -----------------------------------------------------
-- Table `remy`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `remy`.`roles` (
  `id` INT NOT NULL COMMENT '\n					',
  `roles` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `remy`.`equipes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `remy`.`equipes` (
  `id` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `remy`.`joueurs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `remy`.`joueurs` (
  `id` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `roles_id` INT NOT NULL,
  `equipes_id` INT NOT NULL,
  PRIMARY KEY (`id`, `roles_id`, `equipes_id`),
  INDEX `fk_joueurs_roles_idx` (`roles_id` ASC),
  INDEX `fk_joueurs_equipes1_idx` (`equipes_id` ASC),
  CONSTRAINT `fk_joueurs_roles`
    FOREIGN KEY (`roles_id`)
    REFERENCES `remy`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_joueurs_equipes1`
    FOREIGN KEY (`equipes_id`)
    REFERENCES `remy`.`equipes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `remy`.`matchs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `remy`.`matchs` (
  `id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `remy`.`scores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `remy`.`scores` (
  `id` INT NOT NULL,
  `score_gagnant` INT NOT NULL,
  `score_perdant` INT NOT NULL,
  `matchs_id` INT NOT NULL,
  PRIMARY KEY (`id`, `matchs_id`),
  INDEX `fk_scores_matchs1_idx` (`matchs_id` ASC),
  CONSTRAINT `fk_scores_matchs1`
    FOREIGN KEY (`matchs_id`)
    REFERENCES `remy`.`matchs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `remy`.`rangs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `remy`.`rangs` (
  `id` INT NOT NULL,
  `rang` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `remy`.`plateformes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `remy`.`plateformes` (
  `id` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `matchs_id` INT NOT NULL,
  PRIMARY KEY (`id`, `matchs_id`),
  INDEX `fk_plateformes_matchs1_idx` (`matchs_id` ASC),
  CONSTRAINT `fk_plateformes_matchs1`
    FOREIGN KEY (`matchs_id`)
    REFERENCES `remy`.`matchs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `remy`.`jeux`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `remy`.`jeux` (
  `id` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `remy`.`ligues`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `remy`.`ligues` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `rangs_id` INT NOT NULL,
  PRIMARY KEY (`id`, `rangs_id`),
  INDEX `fk_ligues_rangs1_idx` (`rangs_id` ASC),
  CONSTRAINT `fk_ligues_rangs1`
    FOREIGN KEY (`rangs_id`)
    REFERENCES `remy`.`rangs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `remy`.`joueurs_has_jeux`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `remy`.`joueurs_has_jeux` (
  `joueurs_id` INT NOT NULL,
  `joueurs_roles_id` INT NOT NULL,
  `jeux_id` INT NOT NULL,
  PRIMARY KEY (`joueurs_id`, `joueurs_roles_id`, `jeux_id`),
  INDEX `fk_joueurs_has_jeux_jeux1_idx` (`jeux_id` ASC),
  INDEX `fk_joueurs_has_jeux_joueurs1_idx` (`joueurs_id` ASC, `joueurs_roles_id` ASC),
  CONSTRAINT `fk_joueurs_has_jeux_joueurs1`
    FOREIGN KEY (`joueurs_id` , `joueurs_roles_id`)
    REFERENCES `remy`.`joueurs` (`id` , `roles_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_joueurs_has_jeux_jeux1`
    FOREIGN KEY (`jeux_id`)
    REFERENCES `remy`.`jeux` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `remy`.`jeux_has_ligues`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `remy`.`jeux_has_ligues` (
  `jeux_id` INT NOT NULL,
  `ligues_id` INT NOT NULL,
  PRIMARY KEY (`jeux_id`, `ligues_id`),
  INDEX `fk_jeux_has_ligues_ligues1_idx` (`ligues_id` ASC),
  INDEX `fk_jeux_has_ligues_jeux1_idx` (`jeux_id` ASC),
  CONSTRAINT `fk_jeux_has_ligues_jeux1`
    FOREIGN KEY (`jeux_id`)
    REFERENCES `remy`.`jeux` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jeux_has_ligues_ligues1`
    FOREIGN KEY (`ligues_id`)
    REFERENCES `remy`.`ligues` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `remy`.`matchs_has_joueurs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `remy`.`matchs_has_joueurs` (
  `matchs_id` INT NOT NULL,
  `joueurs_id` INT NOT NULL,
  `joueurs_roles_id` INT NOT NULL,
  `joueurs_equipes_id` INT NOT NULL,
  PRIMARY KEY (`matchs_id`, `joueurs_id`, `joueurs_roles_id`, `joueurs_equipes_id`),
  INDEX `fk_matchs_has_joueurs_joueurs1_idx` (`joueurs_id` ASC, `joueurs_roles_id` ASC, `joueurs_equipes_id` ASC),
  INDEX `fk_matchs_has_joueurs_matchs1_idx` (`matchs_id` ASC),
  CONSTRAINT `fk_matchs_has_joueurs_matchs1`
    FOREIGN KEY (`matchs_id`)
    REFERENCES `remy`.`matchs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_matchs_has_joueurs_joueurs1`
    FOREIGN KEY (`joueurs_id` , `joueurs_roles_id` , `joueurs_equipes_id`)
    REFERENCES `remy`.`joueurs` (`id` , `roles_id` , `equipes_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

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
  PRIMARY KEY (`id`, `roles_id`, `equipes_id`)
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
  PRIMARY KEY (`id`, `matchs_id`)
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
  PRIMARY KEY (`id`, `matchs_id`)
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
  PRIMARY KEY (`id`, `rangs_id`)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `remy`.`joueurs_has_jeux`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `remy`.`joueurs_has_jeux` (
  `joueurs_id` INT NOT NULL,
  `joueurs_roles_id` INT NOT NULL,
  `jeux_id` INT NOT NULL,
  PRIMARY KEY (`joueurs_id`, `joueurs_roles_id`, `jeux_id`)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `remy`.`jeux_has_ligues`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `remy`.`jeux_has_ligues` (
  `jeux_id` INT NOT NULL,
  `ligues_id` INT NOT NULL,
  PRIMARY KEY (`jeux_id`, `ligues_id`)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `remy`.`matchs_has_joueurs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `remy`.`matchs_has_joueurs` (
  `matchs_id` INT NOT NULL,
  `joueurs_id` INT NOT NULL,
  `joueurs_roles_id` INT NOT NULL,
  `joueurs_equipes_id` INT NOT NULL,
  PRIMARY KEY (`matchs_id`, `joueurs_id`, `joueurs_roles_id`, `joueurs_equipes_id`)
ENGINE = InnoDB;

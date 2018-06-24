-- -----------------------------------------------------
-- Table `remy`.`joueurs`
-- -----------------------------------------------------
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

-- -----------------------------------------------------
-- Table `remy`.`scores`
-- -----------------------------------------------------
  CONSTRAINT `fk_scores_matchs1`
    FOREIGN KEY (`matchs_id`)
    REFERENCES `remy`.`matchs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

-- -----------------------------------------------------
-- Table `remy`.`plateformes`
-- -----------------------------------------------------
  CONSTRAINT `fk_plateformes_matchs1`
    FOREIGN KEY (`matchs_id`)
    REFERENCES `remy`.`matchs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

-- -----------------------------------------------------
-- Table `remy`.`ligues`
-- -----------------------------------------------------
  CONSTRAINT `fk_ligues_rangs1`
    FOREIGN KEY (`rangs_id`)
    REFERENCES `remy`.`rangs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

-- -----------------------------------------------------
-- Table `remy`.`joueurs_has_jeux`
-- -----------------------------------------------------
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

-- -----------------------------------------------------
-- Table `remy`.`jeux_has_ligues`
-- -----------------------------------------------------
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

-- -----------------------------------------------------
-- Table `remy`.`matchs_has_joueurs`
-- -----------------------------------------------------
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
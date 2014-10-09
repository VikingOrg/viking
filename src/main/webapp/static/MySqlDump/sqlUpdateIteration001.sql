    
#--ALTER TABLE `viking`.`users`
#--DROP COLUMN `port_id`,
#--DROP COLUMN `country_id`;

#--ALTER TABLE `viking`.`machines` 
#--ADD COLUMN `end_date` DATETIME NULL DEFAULT NULL AFTER `start_date`;

ALTER TABLE `viking`.`models` 
ADD COLUMN `model_img` VARCHAR(45) NULL AFTER `archived`;

ALTER TABLE `viking`.`models` 
DROP COLUMN `Country`,
DROP COLUMN `Firm`;

ALTER TABLE `viking`.`machines` 
DROP COLUMN `group_id`;

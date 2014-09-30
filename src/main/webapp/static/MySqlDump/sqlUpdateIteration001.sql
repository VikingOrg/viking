    
#--ALTER TABLE `viking`.`users`
#--DROP COLUMN `port_id`,
#--DROP COLUMN `country_id`;

ALTER TABLE `viking`.`machines` 
ADD COLUMN `end_date` DATETIME NULL DEFAULT NULL AFTER `start_date`;

DROP TABLE IF EXISTS step, material, project_category, category, project;

/* Structure for the `project` table : */

CREATE TABLE `project` (
  `project_id` INTEGER NOT NULL AUTO_INCREMENT,
  `project_name` VARCHAR(128) NOT NULL,
  `estimated_hours` DECIMAL(7,2) DEFAULT NULL,
  `actual_hours` DECIMAL(7,2) DEFAULT NULL,
  `difficulty` INTEGER DEFAULT NULL,
  `notes` TEXT DEFAULT NULL,
  PRIMARY KEY (`project_id`)
);

/* Structure for the `category` table : */

CREATE TABLE `category` (
  `category_id` INTEGER NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`category_id`)
);

/* Structure for the `project_category` table : */

CREATE TABLE `project_category` (
  `project_id` INTEGER NOT NULL,
  `category_id` INTEGER NOT NULL,
  UNIQUE KEY `uk` (`project_id`, `category_id`),
  CONSTRAINT `project_category_fk1` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE,
  CONSTRAINT `project_category_fk2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE
);

/* Structure for the `material` table : */

CREATE TABLE `material` (
  `material_id` INTEGER NOT NULL AUTO_INCREMENT,
  `project_id` INTEGER NOT NULL,
  `material_name` VARCHAR(128) NOT NULL,
  `num_required` INTEGER DEFAULT NULL,
  `cost` DECIMAL(7,2) DEFAULT NULL,
  PRIMARY KEY (`material_id`),
  CONSTRAINT `material_project_id_fk` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE
);

/* Structure for the `step` table : */

CREATE TABLE `step` (
  `step_id` INTEGER NOT NULL AUTO_INCREMENT,
  `project_id` INTEGER NOT NULL,
  `step_text` INTEGER NOT NULL,
  `step_order` INTEGER DEFAULT NULL,
  PRIMARY KEY (`step_id`),
  CONSTRAINT `step_project_id_fk` FOREIGN KEY (`step_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE
);
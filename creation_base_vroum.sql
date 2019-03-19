--
-- Base de données: 'basevroum'
--
CREATE DATABASE IF NOT EXISTS basevroum DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE basevroum;
-- --------------------------------------------------------
-- CREATION DES TABLES

SET FOREIGN_KEY_CHECKS =0;

-- TABLE client
DROP TABLE IF EXISTS client;
CREATE TABLE client (
	cli_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	cli_nom VARCHAR(20)
	)ENGINE=InnoDB;

-- TABLE moniteur
DROP TABLE IF EXISTS moniteur;
CREATE TABLE moniteur ( 
	mon_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	mon_NOM VARCHAR(20)
	)ENGINE=InnoDB;

-- TABLE voiture
DROP TABLE IF EXISTS voiture;
CREATE TABLE voiture (
	VOi_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	VOi_immatriculation  varchar(20)
	)ENGINE=InnoDB;

-- TABLE lecon
DROP TABLE IF EXISTS lecon;
CREATE TABLE lecon( 
	lec_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	lec_debut time,
	lec_fin time,
	lec_voiture int,
	lec_moniteur int
)ENGINE=InnoDB;


-- TABLE recevoir
DROP TABLE IF EXISTS recevoir;
CREATE TABLE recevoir ( 
	rec_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	rec_client int not null,
	rec_lecon int not null
	)ENGINE=InnoDB;

SET FOREIGN_KEY_CHECKS =1;

-- CONTRAINTES
ALTER TABLE recevoir ADD CONSTRAINT CS1 FOREIGN KEY (rec_client) REFERENCES client(cli_id);
ALTER TABLE recevoir ADD CONSTRAINT CS2 FOREIGN KEY (rec_lecon) REFERENCES lecon(lec_id)
 ALTER TABLE lecon ADD CONSTRAINT CS3 FOREIGN KEY (lec_moniteur) REFERENCES moniteur(mon_id);
ALTER TABLE lecon ADD CONSTRAINT CS4 FOREIGN KEY (lec_voiture) REFERENCES voiture(voi_id);
alter table recevoir add constraint  KEY cs5 unique (rec_client,rec_lecon);


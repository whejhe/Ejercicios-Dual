------------------------------------------------------
-- Autor       : I.E.S Sotero Hernández
-- Descripción : Script Creación de la tabla "Formador" - Formación SQL
------------------------------------------------------

-- Creación de tabla para formador.
CREATE TABLE TRAINER (

	cod_trainer INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(15),
	surnames VARCHAR(30),
	dni VARCHAR(9),
	sex CHAR(1),
	address VARCHAR(50),
	city VARCHAR(15),
	post_code INT(5),
	telephone_number INT(9),
	
	CONSTRAINT trainer_pk PRIMARY KEY (cod_trainer),
	CONSTRAINT sex_trainer_chk CHECK (sex IN ('H','M')),
	CONSTRAINT dni_trainer_uq UNIQUE (DNI)
 );
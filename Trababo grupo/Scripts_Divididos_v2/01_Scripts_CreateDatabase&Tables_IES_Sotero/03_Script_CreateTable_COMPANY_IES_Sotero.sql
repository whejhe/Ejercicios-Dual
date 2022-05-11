------------------------------------------------------
-- Autor       : I.E.S Sotero Hernández
-- Descripción : Script Creación de la tabla "Empresa" - Formación SQL
------------------------------------------------------

-- Creación de tabla para empresa.
CREATE TABLE COMPANY (

	cod_company INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(50),
	address VARCHAR(50),
	city VARCHAR(15),
	post_code INT(5),
	cod_trainer INT,
	
	CONSTRAINT company_pk PRIMARY KEY (cod_company),
	CONSTRAINT cod_trainer_fk FOREIGN KEY (cod_trainer) REFERENCES TRAINER(cod_trainer) on update cascade on delete cascade
 );

 
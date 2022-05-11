------------------------------------------------------
-- Autor       : I.E.S Sotero Hernández
-- Descripción : Script Creación de la tabla "Centro educativo" - Formación SQL
------------------------------------------------------

 -- Creación de tabla para centro educativo.
CREATE TABLE SCHOOL (

	cod_school INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(50),
	address VARCHAR(50),
	city VARCHAR(15),
	post_code INT(5),
	
	CONSTRAINT school_pk PRIMARY KEY (cod_school)
 );
------------------------------------------------------
-- Autor       : I.E.S Sotero Hernández
-- Descripción : Script Creación de la tabla "Ciclo formativo"  - Formación SQL
------------------------------------------------------

-- Creación de tabla para ciclo formativo.
CREATE TABLE VOCATIONAL_EDUCATION (

	cod_voc_ed INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(50),
	family VARCHAR(25),
	hours INT(4),
	cod_school INT,
	
	CONSTRAINT voc_ed_pk PRIMARY KEY (cod_voc_ed),
	CONSTRAINT cod_school_fk FOREIGN KEY (cod_school) REFERENCES SCHOOL(cod_school) on update cascade on delete cascade
);
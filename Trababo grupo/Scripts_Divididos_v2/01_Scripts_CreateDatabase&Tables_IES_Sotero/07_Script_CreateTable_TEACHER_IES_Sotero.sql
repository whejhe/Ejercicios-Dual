------------------------------------------------------
-- Autor       : I.E.S Sotero Hernández
-- Descripción : Script Creación de la tabla "Profesor" - Formación SQL
------------------------------------------------------

-- Creación de tabla para profesor.
CREATE TABLE TEACHER (

	cod_teacher INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(15),
	surnames VARCHAR(30),
	dni VARCHAR(9),
	sex CHAR(1),
	address VARCHAR(50),
	city VARCHAR(15),
	post_code INT (5),
	telephone_number INT(9),
	
	CONSTRAINT teacher_pk PRIMARY KEY (cod_teacher),
	CONSTRAINT sex_teacher_chk CHECK (sex IN ('H','M')),
	CONSTRAINT dni_teacher_uq UNIQUE (DNI)
);
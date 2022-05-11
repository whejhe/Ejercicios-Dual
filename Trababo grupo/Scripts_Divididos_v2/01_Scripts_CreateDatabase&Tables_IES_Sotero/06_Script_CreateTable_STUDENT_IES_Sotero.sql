------------------------------------------------------
-- Autor       : I.E.S Sotero Hernández
-- Descripción : Script Creación de la tabla "Alumno" - Formación SQL
------------------------------------------------------

-- Creación de tabla para alumno.
CREATE TABLE STUDENT (

	cod_student INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(15),
	surnames VARCHAR(30),
	dni VARCHAR(9),
	sex CHAR(1),
	address VARCHAR(50),
	city VARCHAR(15),
	post_code INT(5),
	birth_date DATE,
	telephone_number INT(9),
	cod_company INT,
	
	CONSTRAINT student_pk PRIMARY KEY (cod_student),
	CONSTRAINT cod_company_fk FOREIGN KEY (cod_company) REFERENCES COMPANY(cod_company) on update cascade on delete cascade,
	CONSTRAINT sex_student_chk CHECK (sex IN ('H','M')),
	CONSTRAINT dni_student_uq UNIQUE (DNI)
);
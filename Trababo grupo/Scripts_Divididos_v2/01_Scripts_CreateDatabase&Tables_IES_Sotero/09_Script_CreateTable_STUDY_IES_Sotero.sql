------------------------------------------------------
-- Autor       : I.E.S Sotero Hernández
-- Descripción : Script Creación de la tabla "Cursa" - Formación SQL
------------------------------------------------------

-- Creación de tabla para cursa.
CREATE TABLE STUDY (

	cod_student INT,
	cod_module INT,
	mark DECIMAL(4,2),
	
	CONSTRAINT study_pk PRIMARY KEY (cod_student, cod_module),
	CONSTRAINT cod_student_fk FOREIGN KEY (cod_student) REFERENCES STUDENT(cod_student) on update cascade on delete cascade,
	CONSTRAINT cod_module_fk FOREIGN KEY (cod_module) REFERENCES MODULE(cod_module) on update cascade on delete cascade
);
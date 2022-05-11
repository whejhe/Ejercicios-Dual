------------------------------------------------------
-- Autor       : I.E.S Sotero Hernández
-- Descripción : Script Creación de la tabla "Módulo" - Formación SQL
------------------------------------------------------

-- Creación de tabla para módulo. 
CREATE TABLE MODULE (

	cod_module INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(40),
	level INT(1),
	hours INT(3),
	cod_teacher INT,
	cod_voc_ed INT,
	
	CONSTRAINT module_pk PRIMARY KEY (cod_module),
	CONSTRAINT cod_teacher_fk FOREIGN KEY (cod_teacher) REFERENCES TEACHER(cod_teacher) on update cascade on delete cascade,
	CONSTRAINT cod_voc_ed_fk FOREIGN KEY (cod_voc_ed) REFERENCES VOCATIONAL_EDUCATION(cod_voc_ed) on update cascade on delete cascade
);
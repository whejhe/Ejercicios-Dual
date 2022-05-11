------------------------------------------------------
-- Autor       : I.E.S Sotero Hernández
-- Descripción : Script Creación de la tabla "Convenio" - Formación SQL
------------------------------------------------------

-- Creación de tabla para convenio.	
CREATE TABLE AGREEMENT (

	cod_school INT,
	cod_company INT,
	scholarship CHAR(1),
	scholarship_amount INT(3),
	
	CONSTRAINT agreement_pk PRIMARY KEY (cod_school, cod_company),
	CONSTRAINT cod_a_school_fk FOREIGN KEY (cod_school) REFERENCES SCHOOL(cod_school) on update cascade on delete cascade,
	CONSTRAINT cod_a_company_fk FOREIGN KEY (cod_company) REFERENCES COMPANY(cod_company) on update cascade on delete cascade,
	CONSTRAINT scholarship_chk CHECK (scholarship IN ('S','N'))
);
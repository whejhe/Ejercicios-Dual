------------------------------------------------------
-- Autor       : I.E.S Sotero Hernández
-- Descripción : Script Consultas - Formación SQL
------------------------------------------------------

--Solicitamos el nombre y apellidos de aquellos estudiantes var�nes que residan en Sevilla. 
SELECT NAME, SURNAMES 
FROM STUDENT
WHERE SEX LIKE 'H' AND CITY LIKE 'Sevilla';

--Solicitamos la direcci�n de los estudiantes que tengan los apellidos "Ruiz Garcia".
SELECT ADDRESS 
FROM STUDENT 
WHERE SURNAMES LIKE 'Ruiz Garcia';

--Solicitamos el numero de Formadores.
SELECT COUNT(NAME)
FROM TRAINER;

--Solicitamos la media de horas de los m�dulos asignado al codigo de profesor "10".
SELECT ROUND(AVG(HOURS),2) 
FROM MODULE
WHERE COD_TEACHER = 10;

--Solicitamos nombre, apellidos de los profesores que esten entre los codigos de profesor 1/4/10.
SELECT NAME, SURNAMES 
FROM TEACHER
WHERE COD_TEACHER IN (1,4,10);

--Solicitamos nombre y apellidos de los profesores que no tengan los c�digos de profesor 1/4/10.
SELECT NAME, SURNAMES 
FROM TEACHER 
WHERE COD_TEACHER NOT IN (1,4,10);

--Solicitamos nombre y apellidos de los estudiantes que tengan el c�digo de estudiante 2 o 3.
SELECT NAME, SURNAMES
FROM STUDENT
WHERE COD_STUDENT = 2 OR COD_STUDENT = 3;


--Consultas Medias: 

--Solicitamos nombre y apellidos de los estudiantes varones y los mostramos ordenamos por su nombre.
SELECT NAME,SURNAMES
FROM STUDENT 
WHERE SEX LIKE 'H'
ORDER BY NAME;

--Solicitamos el codigo de colegio y el nombre de aquellos colegios que no tengan convenio de formaci�n dual agrupado por codigo de colegio.
SELECT COD_SCHOOL, NAME
FROM SCHOOL
WHERE COD_SCHOOL IN (SELECT COD_SCHOOL FROM AGREEMENT WHERE SCHOLARSHIP = 'N')
GROUP BY COD_SCHOOL;

--Solicitamos la cantidad de la beca y el c�digo de colegio de loa convenios que esten entre 100 y 300 euros, ordenados por el c�digo de colegio.
SELECT SCHOLARSHIP_AMOUNT , COD_SCHOOL 
FROM AGREEMENT 
WHERE SCHOLARSHIP_AMOUNT >= 100 AND SCHOLARSHIP_AMOUNT <= 300
ORDER BY COD_SCHOOL;


--Consultas Complejas:

--Se solicita el nombre, apellidos, asignatura y nota de los alumnos, cuando el nombre del alumno empiece por a y termine por o, y se ordena por la nota de forma descendente.
SELECT S.NAME AS 'Nombre del alumno',S.SURNAMES AS 'Apellidos',M.NAME AS 'Asignatura',ST.MARK AS 'Nota' 
FROM STUDENT S INNER JOIN STUDY ST ON S.COD_STUDENT=ST.COD_STUDENT INNER JOIN MODULE M ON M.COD_MODULE=ST.COD_MODULE 
WHERE S.NAME LIKE 'a%o' 
ORDER BY ST.MARK DESC;

--Se solicita el nombre, apellidos y empresa del formador cuando esta sea NTT DATA, y se ordena de forma ascendente por el por codigo postal de la empresa. 
SELECT T.NAME AS 'Nombre del formador',T.SURNAMES AS 'Apellidos',C.NAME AS 'Empresa' 
FROM TRAINER T LEFT JOIN COMPANY C ON T.COD_TRAINER=C.COD_TRAINER 
WHERE C.NAME LIKE 'NTT DATA' 
ORDER BY C.POST_CODE ASC;

--Se solicita el nombre del centro, codigo postal, ciclo, horas del ciclo, modulo, horas del modulo, nombre y apellidos del profesor, 
--asi como su dni y telefono cuando la columna apellidos comience por M, y se ordena por las horas del modulo de forma descendente.
SELECT SC.NAME AS 'Centro',SC.POST_CODE AS 'Codigo postal',V.NAME AS 'Ciclo',V.HOURS AS 'Horas',M.NAME AS 'Modulo',M.HOURS AS 'Horas',CONCAT(T.NAME,' ',T.SURNAMES) AS 'Profesor',T.DNI AS 'Dni',T.TELEPHONE_NUMBER AS 'Telefono' 
FROM SCHOOL SC INNER JOIN VOCATIONAL_EDUCATION V ON SC.COD_SCHOOL=V.COD_SCHOOL INNER JOIN MODULE M ON V.COD_VOC_ED=M.COD_VOC_ED INNER JOIN TEACHER T ON M.COD_TEACHER=T.COD_TEACHER 
WHERE T.SURNAMES LIKE 'M%' 
ORDER BY M.HOURS DESC;

--Se solicita el nombre, apellidos, dni y telefono del alumno, asi como el nombre de la empresa, ciudad y direccion donde esta llevando las practicas, y si tiene beca y la cantidad de la misma, �
--cuando la empresa sea NTT DATA, o no haya beca, y se ordena por la cantidad de la beca en orden ascendente.
SELECT CONCAT(S.NAME,' ',S.SURNAMES) AS 'Alumno',S.DNI AS 'Dni',S.TELEPHONE_NUMBER AS 'Telefono',C.NAME AS 'Empresa',S.CITY AS 'Ciudad',C.ADDRESS AS 'Direccion',A.SCHOLARSHIP AS 'Beca',A.SCHOLARSHIP_AMOUNT AS 'Cantidad' 
FROM STUDENT S INNER JOIN COMPANY C ON S.COD_COMPANY=C.COD_COMPANY RIGHT JOIN AGREEMENT A ON C.COD_COMPANY=A.COD_COMPANY 
WHERE C.NAME='NTT DATA' OR A.SCHOLARSHIP='N' 
ORDER BY A.SCHOLARSHIP_AMOUNT ASC;

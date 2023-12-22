DROP DATABASE IF EXISTS ACTtriggers;

CREATE DATABASE ACTtriggers;

USE ACTtriggers;

CREATE TABLE alumnos (
	ID INT UNSIGNED,
	Nombre varchar (20),
    Apellido1 varchar (50),
    Apellido2 varchar (50),
    Nota REAL
);


DELIMITER $$
CREATE TRIGGER alumnos_check_nota_before_insert
BEFORE INSERT ON Nota
FOR EACH ROW
-- LOGICA BRUH
	BEGIN
		IF (New.Nota<0) THEN 
					SET NEW.Nota = 0;
		END IF;
		IF New.Nota < 10 THEN
					SET New.Nota = 10;
		END IF;
	END;
	$$
    
    DELIMITER $$
    CREATE TRIGGER alumnos_check_nota_before_update
    BEFORE UPDATE ON Nota
    FOR EACH ROW
    
    BEGIN 
    
		IF (NEW.Nota) THEN 
					SET NEW.Nota = 0;
		END IF;
        IF NEW.Nota < 10 THEN 
					SET NEW.Nota = 10;
		END IF;
        
      END;
      $$
      
	INSERT INTO Alumnos VALUES
	(5,Isai, Manjarres, Sanchez, -24), 
     	(10,Nico, Guzman, Seres, -4),
    	(6,Mildred, Marram, Rosas , 25),
    	(1,Mitsi, lechuga, Ramos, 100);
    

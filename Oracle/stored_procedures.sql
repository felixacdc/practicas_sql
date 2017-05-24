CREATE OR REPLACE
PROCEDURE ADD_EVALUATION
( evaluation_id IN NUMBER
, employee_id IN NUMBER
, evaluation_date IN DATE
, job_id IN VARCHAR2
, manager_id IN NUMBER
, department_id IN NUMBER
) AS
BEGIN
  NULL;
END ADD_EVALUATION;

CREATE OR REPLACE
FUNCTION calculate_score
( cat IN VARCHAR2
, score IN NUMBER
, weight IN NUMBER
) RETURN NUMBER AS
BEGIN
  RETURN NULL;
END calculate_score;

-- Con transaccion
CREATE OR REPLACE PROCEDURE log_errors (p_error_message  IN  VARCHAR2) AS
  PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
  INSERT INTO at_test (id, description)
  VALUES (998, 'Description for 998');

  -- Force invalid insert.
  INSERT INTO at_test (id, description)
  VALUES (999, NULL);
EXCEPTION
  WHEN OTHERS THEN
    log_errors (p_error_message => SQLERRM);
    ROLLBACK;
END;

-- Estructuras condicionales: 
	IF condición THEN 
	     instrucciones; 
	ELSIF condición THEN 
	         instrucciones; 
	      ELSE 
	        instrucciones; 
	END IF;
	-- Ejemplo
	IF sales > (quota + 200) THEN
		bonus := (sales - quota)/4;

		UPDATE employees
		SET salary = salary + bonus 
		WHERE employee_id = emp_id;

		updated := 'Yes';
    END IF;
    -- Case
    CASE grade
		WHEN 'A' THEN DBMS_OUTPUT.PUT_LINE('Excellent');
		WHEN 'B' THEN DBMS_OUTPUT.PUT_LINE('Very Good');
		WHEN 'C' THEN DBMS_OUTPUT.PUT_LINE('Good');
		WHEN 'D' THEN DBMS_OUTPUT.PUT_LINE('Fair');
		WHEN 'F' THEN DBMS_OUTPUT.PUT_LINE('Poor');
		ELSE DBMS_OUTPUT.PUT_LINE('No such grade');
	END CASE;
-- Bucle for
	FOR indice IN inf..sup LOOP 
	--  instrucciones; 
	END LOOP;
	-- Ejemplo
	DECLARE
	   x NUMBER := 100;
	BEGIN
	   FOR i IN 1..10 LOOP
	      IF MOD(i,2) = 0 THEN     -- i is even
	         INSERT INTO temp VALUES (i, x, 'i is even');
	      ELSE
	         INSERT INTO temp VALUES (i, x, 'i is odd');
	      END IF;
	      x := x + 100;
	   END LOOP;
	   COMMIT;
	END;
-- Bucle while
	WHILE condición LOOP
	--  instrucciones; 
	END LOOP;
	-- Ejemplo
	WHILE monthly_value <= 4000
	LOOP
	   monthly_value := daily_value * 31;
	END LOOP;

-- Excepciones
	DECLARE
 	-- Declaramos una excepcion identificada por VALOR_NEGATIVO
    VALOR_NEGATIVO EXCEPTION;
    valor NUMBER;
	BEGIN
	  -- Ejecucion
	valor := -1;
		IF valor < 0 THEN
			RAISE VALOR_NEGATIVO;
		END IF;
	EXCEPTION
	  -- Excepcion
	WHEN VALOR_NEGATIVO THEN
		dbms_output.put_line('El valor no puede ser negativo');
	END; 
	---------------------
	DECLARE
	  err_num NUMBER;
	  err_msg VARCHAR2(255);
	  result  NUMBER;
	BEGIN
	  SELECT 1/0 INTO result 
	  FROM DUAL;
	  
	EXCEPTION  
	WHEN OTHERS THEN
	  
	  err_num := SQLCODE;
	  err_msg := SQLERRM;
	  DBMS_OUTPUT.put_line('Error:'||TO_CHAR(err_num));
	  DBMS_OUTPUT.put_line(err_msg);
	END;
CREATE OR REPLACE FUNCTION info_returned_as_table(
  id customers.customer_id%TYPE)
RETURNS TABLE (customer_id customers.customer_id%TYPE, first_name customers.first_name%TYPE, last_name customers.last_name%TYPE, loan_id loans.loan_id%TYPE, loan_amount loans.amount%TYPE)
AS
$info_returned_as_table$
DECLARE
  sql TEXT;
BEGIN
  sql := 'SELECT customers.customer_id, first_name, last_name, loan_id, amount FROM customers JOIN loans ON customers.customer_id = loans.customer_id WHERE customers.customer_id = ' || id;
  RAISE NOTICE 'sql: %', sql;
  RETURN QUERY EXECUTE sql;
END;
$info_returned_as_table$
LANGUAGE PLPGSQL;

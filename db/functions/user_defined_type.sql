CREATE OR REPLACE FUNCTION userdefinedtype(
  function_name text)
RETURNS TABLE(attribute_name name, type name)
AS
$user_defined_type$
DECLARE
  sql TEXT;
BEGIN
  sql := $sql$
  SELECT distinct(sq.attname),
          typname
  FROM
  (
    SELECT atttypid,
            attname
    FROM pg_proc
    JOIN pg_type ON pg_type.oid = pg_proc.prorettype
    JOIN pg_attribute ON pg_attribute.attrelid = pg_type.typrelid
    WHERE proname = '$sql$ || function_name || $sql$'
  ) sq
  JOIN pg_type ON pg_type.oid = sq.atttypid
  $sql$;
  RAISE NOTICE 'sql: %', sql;
  RETURN QUERY EXECUTE sql;
END;
$user_defined_type$
LANGUAGE PLPGSQL;

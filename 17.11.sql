--CREATE FUNCTION dbo.MyPow(@base INT, @exponent INT)
--RETURNS INT
--AS
--BEGIN
--    DECLARE @result INT = 1;

--    WHILE @exponent > 0
--    BEGIN
--        SET @result = @result * @base;
--        SET @exponent = @exponent - 1;
--    END

--    RETURN @result;
--END;

PRINT dbo.MyPow(dbo.MyPow(2, 3), dbo.MyPow(1, 2));

-----------------------------

--CREATE FUNCTION Calculator(@num1 float, @num2 float, @operation char)
--RETURNS float AS
--BEGIN
--    DECLARE @result float;

--    IF @operation = '+'
--        SET @result = @num1 + @num2;
--    ELSE IF @operation = '-'
--        SET @result = @num1 - @num2;
--    ELSE IF @operation = '*'
--        SET @result = @num1 * @num2;
--    ELSE IF @operation = '/' AND @num2 != 0
--        SET @result = @num1 / @num2;
--    ELSE 
--        SET @result = NULL;

--    RETURN @result;
--END;

DECLARE @result float;
EXEC @result = Calculator @num1 = 5.2, @num2 = 3.4, @operation = '+';
SELECT @result as Result;

-------------------------------

--CREATE FUNCTION dbo.GetDatabaseSizes()
--RETURNS TABLE
--AS
--RETURN 
--(
--    SELECT 
--        name AS DatabaseName,
--        SUM(size * 8 * 1024) AS DatabaseSizeInBytes
--    FROM 
--        sys.master_files
--    WHERE 
--        type = 0 AND -- 0 = rows, 1 = log
--        database_id > 4 -- Skip system databases
--    GROUP BY 
--        database_id, name
--);

SELECT * FROM dbo.GetDatabaseSizes();
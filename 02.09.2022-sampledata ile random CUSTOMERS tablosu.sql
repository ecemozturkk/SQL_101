
--de�i�ken tan�mla, while d�ng�s�ne sok
DECLARE @I AS INT=0
WHILE @I<20000
BEGIN

--de�i�kenlerin tan�mlanmas�
DECLARE @NAME AS VARCHAR(100)
DECLARE @SURNAME AS VARCHAR(100)
DECLARE @GENDER AS VARCHAR(1)
DECLARE @CITY AS VARCHAR(100)
DECLARE @TOWN AS VARCHAR(100)
DECLARE @BIRTHDATE AS DATETIME

--random fonksiyonunun de�i�kene atanmas�
DECLARE @RAND AS INT

--isimlerin random se�ilmesi
SET @RAND = RAND() * 609  --610 adet isim var
SELECT @NAME=NAME,@GENDER=GENDER FROM NAMES WHERE ID=@RAND

--soyisimlerin random se�ilmesi
SET @RAND = RAND() * 16000
SELECT @SURNAME=SURNAME FROM SURNAMES WHERE ID=@RAND

--il ve il�elerin sei�ilmesi
SET @RAND = RAND() * 900
SELECT @CITY=CITY, @TOWN=TOWN FROM CITY_DISTRICT WHERE ID=@RAND

--rastgele bir do�um tarihi olu�tur (son 80 y�lda do�anlar)
SET @RAND = RAND() * 360*80
SELECT @BIRTHDATE = GETDATE() - @RAND

--tablonun i�ine aktar
INSERT INTO CUSTOMERS (NAME,SURNAME, BIRTHDATE, CITY, TOWN, GENDER)
VALUES (@NAME,@SURNAME,@BIRTHDATE,@CITY,@TOWN,@GENDER)

--while d�ng�s�n� bitir
SET @I = @I +1
END

------------------
SELECT * FROM CUSTOMERS




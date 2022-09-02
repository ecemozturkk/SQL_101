
--deðiþken tanýmla, while döngüsüne sok
DECLARE @I AS INT=0
WHILE @I<20000
BEGIN

--deðiþkenlerin tanýmlanmasý
DECLARE @NAME AS VARCHAR(100)
DECLARE @SURNAME AS VARCHAR(100)
DECLARE @GENDER AS VARCHAR(1)
DECLARE @CITY AS VARCHAR(100)
DECLARE @TOWN AS VARCHAR(100)
DECLARE @BIRTHDATE AS DATETIME

--random fonksiyonunun deðiþkene atanmasý
DECLARE @RAND AS INT

--isimlerin random seçilmesi
SET @RAND = RAND() * 609  --610 adet isim var
SELECT @NAME=NAME,@GENDER=GENDER FROM NAMES WHERE ID=@RAND

--soyisimlerin random seçilmesi
SET @RAND = RAND() * 16000
SELECT @SURNAME=SURNAME FROM SURNAMES WHERE ID=@RAND

--il ve ilçelerin seiçilmesi
SET @RAND = RAND() * 900
SELECT @CITY=CITY, @TOWN=TOWN FROM CITY_DISTRICT WHERE ID=@RAND

--rastgele bir doðum tarihi oluþtur (son 80 yýlda doðanlar)
SET @RAND = RAND() * 360*80
SELECT @BIRTHDATE = GETDATE() - @RAND

--tablonun içine aktar
INSERT INTO CUSTOMERS (NAME,SURNAME, BIRTHDATE, CITY, TOWN, GENDER)
VALUES (@NAME,@SURNAME,@BIRTHDATE,@CITY,@TOWN,@GENDER)

--while döngüsünü bitir
SET @I = @I +1
END

------------------
SELECT * FROM CUSTOMERS




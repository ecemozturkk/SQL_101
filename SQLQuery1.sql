Select * from Products where CategoryId in (2,3)

Select Count(*) as [�r�n Say�s�] from Products

Select Count(ProductName) as [Deneme bosluk] from Products

Select Count(Region) as [M��teri B�lge Say�s�] from Customers

Select Min(UnitPrice) as [Minimum Fiyat] from Products

Select Max(UnitPrice) from Products

Select Avg(UnitPrice) as Kazan� from Products 

Select Sum(UnitPrice * Quantity) as Kazan� from [Order Details]



/* 30. Left-Right-Len-Lower-Upper Fonksiyonlar�yla �al��mak */

Select Left('Ecem �zt�rk',5) 

Select LEN('Ecem �zt�rk') 

Select ProductName, LEN(ProductName) as Karakter from Products

Select LOWER('ecEm �Zt�RK')
Select UPPER('ecEm �Zt�RK')

/*  31. Trim-Ltrim-Rtrim-Reverse Fonksiyonlar� */
Select * from Products where TRIM(ProductName)= 'Chai'

Select LTRIM('                deneme          ')
Select RTRIM('                deneme          ')

Select REVERSE ('abcdef')

/* 32. Substring-Reverse-CharIndex-Ascii-Char Fonksiyonlar�yla �al��mak*/

Select Charindex ('m', 'mama',3)
Select ProductName from Products where CHARINDEX(' ',ProductName,1)>0

Select REPLACE(ProductName,' ','_') from Products
Select SUBSTRING('Ecem �zt�rk',1,3)

/* 33. Distinct �le �al��mak*/
Select DISTINCT(Country) from Customers ORDER BY Country

/*34. Group By �le �al��maya Ba�lamak*/

Select Country,Count(*) as Adet from Customers group by Country

/*  36. Inner Join �le �al��maya Ba�lamak */
SELECT * from Products INNER JOIN Categories on Products.CategoryID = Categories.CategoryID

SELECT * from Products inner join Categories on Products.CategoryID = Categories.CategoryID where Products.UnitPrice>20
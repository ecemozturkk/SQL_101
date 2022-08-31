Select * from Products where CategoryId in (2,3)

Select Count(*) as [Ürün Sayýsý] from Products

Select Count(ProductName) as [Deneme bosluk] from Products

Select Count(Region) as [Müþteri Bölge Sayýsý] from Customers

Select Min(UnitPrice) as [Minimum Fiyat] from Products

Select Max(UnitPrice) from Products

Select Avg(UnitPrice) as Kazanç from Products 

Select Sum(UnitPrice * Quantity) as Kazanç from [Order Details]



/* 30. Left-Right-Len-Lower-Upper Fonksiyonlarýyla Çalýþmak */

Select Left('Ecem Öztürk',5) 

Select LEN('Ecem Öztürk') 

Select ProductName, LEN(ProductName) as Karakter from Products

Select LOWER('ecEm ÖZtÜRK')
Select UPPER('ecEm ÖZtÜRK')

/*  31. Trim-Ltrim-Rtrim-Reverse Fonksiyonlarý */
Select * from Products where TRIM(ProductName)= 'Chai'

Select LTRIM('                deneme          ')
Select RTRIM('                deneme          ')

Select REVERSE ('abcdef')

/* 32. Substring-Reverse-CharIndex-Ascii-Char Fonksiyonlarýyla Çalýþmak*/

Select Charindex ('m', 'mama',3)
Select ProductName from Products where CHARINDEX(' ',ProductName,1)>0

Select REPLACE(ProductName,' ','_') from Products
Select SUBSTRING('Ecem Öztürk',1,3)

/* 33. Distinct Ýle Çalýþmak*/
Select DISTINCT(Country) from Customers ORDER BY Country

/*34. Group By Ýle Çalýþmaya Baþlamak*/

Select Country,Count(*) as Adet from Customers group by Country

/*  36. Inner Join Ýle Çalýþmaya Baþlamak */
SELECT * from Products INNER JOIN Categories on Products.CategoryID = Categories.CategoryID

SELECT * from Products inner join Categories on Products.CategoryID = Categories.CategoryID where Products.UnitPrice>20
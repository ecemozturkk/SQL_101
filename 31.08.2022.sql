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

/* 34. Group By Ýle Çalýþmaya Baþlamak*/

Select Country,Count(*) as Adet from Customers group by Country

/*  36. Inner Join Ýle Çalýþmaya Baþlamak */
SELECT * from Products INNER JOIN Categories on Products.CategoryID = Categories.CategoryID

SELECT * from Products inner join Categories on Products.CategoryID = Categories.CategoryID where Products.UnitPrice>20 order by Categories.CategoryID

/*  37. Birden Çok Tabloyla Join*/
--Ürün ismi, alýnan tarih, kazanýlan tutar'ý gösterelim
SELECT p.ProductName, o.OrderDate, od.Quantity * od.UnitPrice as Total from Products p inner join [Order Details] od on p.ProductID = od.ProductID inner join Orders o on o.OrderID = od.OrderID order by p.ProductName

/* 38. Left Join Ýle Çalýþmak*/
--satýþý hiç yapýlmayan ürünleri gösterelim
select * from Products p left join [Order Details] od on p.ProductID = od.ProductID where od.ProductId is null

--hiç satýþ yapýlmamýþ müþterileri görelim
select * from Customers c left join Orders o on c.CustomerID = o.CustomerID where o.CustomerID is null

/* 41 Workshop Tanýtýmý*/ 
select * from Employees e left join Orders o on e.EmployeeID = o.EmployeeID where o.EmployeeID is null

/* Hangi üründen kaç tane satmýþýz*/
select p.ProductName, count(*) as Adet from Products p inner join [Order Details] od on p.ProductID = od.ProductID group by p.ProductName

/* Hangi kategoriden kaç tane satmýþýz? */
select c.CategoryName,Count(*) from Categories c inner join Products p on c.CategoryID = p.CategoryID inner join [Order Details] od on p.ProductID = od.ProductID group by c.CategoryName 

/* Employees Tablosunda kimin kime hesap verdiði */ 
Select e1.FirstName+' '+ e1.LastName as Personel, e2.FirstName+' '+e2.LastName as Üstü from Employees e2 inner join Employees e1 on e2.EmployeeID=e1.ReportsTo

/* 49. Insert Into Ýle Çalýþmak*/
INSERT INTO Categories (CategoryName, Description) values ('Test Category', 'Test Category Description')

-- eðer kolon adýný yazmazsak (yukarýdaki (CategoryName, Description) gibi), sýralý olarak eþleþtirmeli halde yazmamýz gerekir
insert into [Order Details] values (10248,12,12,10,0)

/* 50. Update Ýle Çalýþmak */
--Categories tablosundaki CategoryID'si 10 olan satýrýn CategoryName'ini 'Test Category'Yap 
update Categories set CategoryName='Test Category' where CategoryID=9

/* 52. Select Ýfadeleriyle Insert Yapmak*/
Select * from CustomersWork
delete from CustomersWork where ContactName=''
--Oluþturduðumuz Customers tablosundaki CustomerID,CompanyName ve ContactName kolonlarýný oluþturduðumuz CostumersWork tablosuna aktaralým
insert into CustomersWork (CustomerId,CompanyName,ContactName) select CustomerID,COmpanyName,ContactName from Customers

--içinde en geçenleri insert et 
insert into CustomersWork (CustomerId, CompanyName, ContactName) select CustomerID, CompanyName, ContactName from Customers where ContactName like '%en%'

/* 55. Union Ýle Çalýþmak*/

--Join'de biz iki tabloyu yanyana getiriyorduk, Union'da ise alt alta getiriyoruz.
--Union için kolon sayýlarýnýn birbirine eþit olmasý gerekir, bu yüzden Customers tablosunun sadece 3 adet kolonunu aldýk çünkü CustomersWork'un sadece 3 adet kolonu var.
--Union sadece farklýlarý ekler!!
select CustomerId, CompanyName, ContactName from Customers
union
select * from CustomersWork
--eðer ayný olan kolonlarýn da eklenmesini istiyorsak o zaman UNION ALL kullanýlýr
select CustomerId, CompanyName, ContactName from Customers
union all
select * from CustomersWork
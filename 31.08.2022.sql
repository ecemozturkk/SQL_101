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

/* 34. Group By �le �al��maya Ba�lamak*/

Select Country,Count(*) as Adet from Customers group by Country

/*  36. Inner Join �le �al��maya Ba�lamak */
SELECT * from Products INNER JOIN Categories on Products.CategoryID = Categories.CategoryID

SELECT * from Products inner join Categories on Products.CategoryID = Categories.CategoryID where Products.UnitPrice>20 order by Categories.CategoryID

/*  37. Birden �ok Tabloyla Join*/
--�r�n ismi, al�nan tarih, kazan�lan tutar'� g�sterelim
SELECT p.ProductName, o.OrderDate, od.Quantity * od.UnitPrice as Total from Products p inner join [Order Details] od on p.ProductID = od.ProductID inner join Orders o on o.OrderID = od.OrderID order by p.ProductName

/* 38. Left Join �le �al��mak*/
--sat��� hi� yap�lmayan �r�nleri g�sterelim
select * from Products p left join [Order Details] od on p.ProductID = od.ProductID where od.ProductId is null

--hi� sat�� yap�lmam�� m��terileri g�relim
select * from Customers c left join Orders o on c.CustomerID = o.CustomerID where o.CustomerID is null

/* 41 Workshop Tan�t�m�*/ 
select * from Employees e left join Orders o on e.EmployeeID = o.EmployeeID where o.EmployeeID is null

/* Hangi �r�nden ka� tane satm���z*/
select p.ProductName, count(*) as Adet from Products p inner join [Order Details] od on p.ProductID = od.ProductID group by p.ProductName

/* Hangi kategoriden ka� tane satm���z? */
select c.CategoryName,Count(*) from Categories c inner join Products p on c.CategoryID = p.CategoryID inner join [Order Details] od on p.ProductID = od.ProductID group by c.CategoryName 

/* Employees Tablosunda kimin kime hesap verdi�i */ 
Select e1.FirstName+' '+ e1.LastName as Personel, e2.FirstName+' '+e2.LastName as �st� from Employees e2 inner join Employees e1 on e2.EmployeeID=e1.ReportsTo

/* 49. Insert Into �le �al��mak*/
INSERT INTO Categories (CategoryName, Description) values ('Test Category', 'Test Category Description')

-- e�er kolon ad�n� yazmazsak (yukar�daki (CategoryName, Description) gibi), s�ral� olarak e�le�tirmeli halde yazmam�z gerekir
insert into [Order Details] values (10248,12,12,10,0)

/* 50. Update �le �al��mak */
--Categories tablosundaki CategoryID'si 10 olan sat�r�n CategoryName'ini 'Test Category'Yap 
update Categories set CategoryName='Test Category' where CategoryID=9

/* 52. Select �fadeleriyle Insert Yapmak*/
Select * from CustomersWork
delete from CustomersWork where ContactName=''
--Olu�turdu�umuz Customers tablosundaki CustomerID,CompanyName ve ContactName kolonlar�n� olu�turdu�umuz CostumersWork tablosuna aktaral�m
insert into CustomersWork (CustomerId,CompanyName,ContactName) select CustomerID,COmpanyName,ContactName from Customers

--i�inde en ge�enleri insert et 
insert into CustomersWork (CustomerId, CompanyName, ContactName) select CustomerID, CompanyName, ContactName from Customers where ContactName like '%en%'

/* 55. Union �le �al��mak*/

--Join'de biz iki tabloyu yanyana getiriyorduk, Union'da ise alt alta getiriyoruz.
--Union i�in kolon say�lar�n�n birbirine e�it olmas� gerekir, bu y�zden Customers tablosunun sadece 3 adet kolonunu ald�k ��nk� CustomersWork'un sadece 3 adet kolonu var.
--Union sadece farkl�lar� ekler!!
select CustomerId, CompanyName, ContactName from Customers
union
select * from CustomersWork
--e�er ayn� olan kolonlar�n da eklenmesini istiyorsak o zaman UNION ALL kullan�l�r
select CustomerId, CompanyName, ContactName from Customers
union all
select * from CustomersWork
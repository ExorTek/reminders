-- DDL --
-- SQL SERVER REPLICATION --> Bir yerdeki sunucu ile başka sunucu arası veri transferi/Bir verinin farklı konumlardaki sunucularda tutulması
-- SQL RDBMS -->İlişkisel Veritabanı Yönetim Sistemi
-- MasterDB --> Sistem conf/kullanıcılar ve yetkileri/Sistem Dosyaları/Erişim yetkileri/Temel conf
-- ModelDB --> Şablon veritabanı/Her oluşturulacak veritabanı ModelDB'nin bir kopyası
-- MsDB --> Periyodik olarak çalıştırılam her türlü işlem burada tutulur(joblar,schedulelar,alertler)
-- TempDB --> Geçici tabloların oluşturulduğu işlemler burada gerçekleşir/Aggregation işlemler(by,order by,sum,count,max, min gibi)
-- DDL Commands --> CREATE / ALTER / DROP / TRUNCATE
CREATE DATABASE TEST -- Database oluştur

DROP DATABASE TEST --- Database sil

CREATE TABLE ISIMLER (
	ID INT IDENTITY(1,1),ISIM VARCHAR(20)
) -- Tablo oluştur

INSERT INTO ISIMLER(ISIM)VALUES('MEMET') -- kayıt gir

SELECT*FROM ISIMLER -- tablodaki verilerin hepsini çağır

DROP TABLE ISIMLER -- tabloyu sil

ALTER TABLE ISIMLER ADD TELEFON VARCHAR(12) -- kolon ekleme

ALTER TABLE ISIMLER ADD SOYISIM VARCHAR(12) -- kolon ekleme

ALTER TABLE ISIMLER DROP COLUMN SOYISIM -- kolon sil

ALTER TABLE ISIMLER ALTER COLUMN TELEFON VARCHAR(50) -- varolan bir kolonun içeriğini değiştirme

TRUNCATE TABLE ISIMLER -- tablonun içerisindeki verileri siler

DECLARE @ISIM AS VARCHAR(100) -- değişken tanımlama
SET @ISIM='MEHMET' -- değişkene değer atama
DECLARE @SOYISIM AS VARCHAR(100)='DEMİREL' -- değişken tanımlama ve değişkene değer atama
SELECT @ISIM,@SOYISIM -- görüntüleme


DECLARE 
	@SAYI1 AS INTEGER,
	@SAYI2 AS INTEGER,
	@SAYI3 AS INTEGER

-- OR --

DECLARE @SAYI1 AS INTEGER=10
DECLARE @SAYI2 AS INTEGER
SET @SAYI2='20'
DECLARE @TOPLAM2 AS INTEGER
SET @TOPLAM2=@SAYI1+@SAYI2

SELECT @SAYI1 AS SAYI1,@SAYI2 AS SAYI2,@SAYI1+@SAYI2 AS TOPLAM,@TOPLAM2 AS TOPLAM2 -- alias

-- TABLODAKİ DEĞERLERİ DEĞİŞKENE ATAMA --

DECLARE @ISIM AS VARCHAR(50)
DECLARE @TELEFON AS VARCHAR(50)
SELECT 
@ISIM=NAMESURNAME,@TELEFON=TELNR FROM CUSTOMERS WHERE ID=2
SELECT @ISIM,@TELEFON


-- DATE TIME --
DECLARE @DATE AS DATETIME
SET @DATE=GETDATE()
SELECT @DATE TARIH

-- String functions --

-- SUBSTRING --

DECLARE @KELIME AS VARCHAR(50)
SET @KELIME='MERHABA DÜNYA'
SELECT SUBSTRING(@KELIME,1,7) -- BELİRLENMİŞ İNDEKSLER ARASI CHARLARI AYIRIR
SELECT SUBSTRING(@KELIME,9,13)

-- LOWER, UPPER --
DECLARE @KELIME AS VARCHAR(50)
SET @KELIME='MERHABA DÜNYA'
SELECT LOWER(@KELIME) -- KELİMELERİN HEPSİNİ BÜYÜK HARF YAPAR
SELECT UPPER(@KELIME) -- KELİMELERİN HEPSİNİ KÜÇÜK HARF YAPAR

-- String birleştirme --
DECLARE @AD AS VARCHAR(50)='MEHMET'
DECLARE @SOYAD AS VARCHAR(50)='DEMİREL'
SELECT @AD+' '+@SOYAD

-- RIGHT, LEFT --
DECLARE @KELIME AS VARCHAR(50)
SET @KELIME='MERHABA DÜNYA'
--SELECT LEFT(@KELIME,7) -- SOLDAN İTİBAREN 7 KARAKTER
SELECT RIGHT(@KELIME,5) -- SAĞDAN İTİBAREN 5 KARAKTER

-- LTRIM,RTRIM,TRIM --
DECLARE @KELIME AS VARCHAR(100)='   MERHABA DÜNYA   '
SELECT LTRIM(@KELIME) -- SOL KISIMDAKI BOŞLUKLARI SİLER
SELECT RTRIM(@KELIME) -- SAĞ KISIMDAKİ BOŞLUKLARI SİLER
SELECT TRIM(@KELIME) -- SAĞ VE SOLDAKİ BOŞLUKLARI SİLER
SELECT LTRIM(RTRIM(@KELIME)) -- TRIM İLE AYNI

-- REPLACE --
DECLARE @KELIME AS VARCHAR(100)='MERHABA DÜNYA'
SELECT REPLACE(@KELIME,'Ü','U') -- HARF DEĞİŞİMİ
REPLACE(@KELIME,'MERHABA','HELLO') -- KELIME DEĞİŞİMİ
SELECT REPLACE(REPLACE(@KELIME,'MERHABA','HELLO'),'DÜNYA','WORLD')

-- LEN --
DECLARE @KELIME AS VARCHAR(100)='MERHABA DÜNYA'
SELECT LEN(@KELIME) -- CÜMLE VEYA KELIME UZUNLUGU

-- STRING_SPLIT --
DECLARE @KELIME AS VARCHAR(100)='MERHABA DÜNYA'
SELECT
* FROM string_split(@KELIME,' ') -- KELIMELERI TABLO DEĞERİNE DÖNÜŞTÜRÜR
DECLARE @KELIME AS VARCHAR(100)='MERHABA BEN MEHMET SQL EĞİTİMİ ALIYORUM'
SELECT
* FROM string_split(@KELIME,' ')

-- DATE TIME FUNCTİONS --

-- DATEADD --
DECLARE @TARIH AS DATETIME
	SET @TARIH='2021-01-01 16:21:37' 
DECLARE @TARIH2 AS DATETIME
	SET @TARIH2=DATEADD(MONTH,6,@TARIH) -- GÜN AY YIL GİBİ EKLEMELER
SELECT @TARIH,@TARIH2

-- DATEDIFF --
DECLARE @TARIH AS DATETIME
	SET @TARIH='2018-01-01 18:18:12' -- İKİ TARİH ARASI FARK GÜN AY YIL
DECLARE @TARIH2 AS DATETIME
	SET @TARIH2='2021-01-01 21:21:21'
SELECT DATEDIFF(YEAR,@TARIH,@TARIH2) AS YIL
SELECT DATEDIFF(DAY,@TARIH,@TARIH2) AS GUN
SELECT DATEDIFF(WEEK,@TARIH,@TARIH2) AS HAFTA
SELECT DATEDIFF(MONTH,@TARIH,@TARIH2) AS AY

-- DATEFROMPARTS --
SELECT DATEFROMPARTS(2021,8,21)
DECLARE @TARIH AS DATETIME -- TARIH FORMATINA DÖNÜŞTÜRME
SET @TARIH=DATEFROMPARTS(2021,8,21)
SELECT @TARIH

-- DATEPART --
DECLARE @TARIH AS DATETIME
	SET @TARIH='2018-01-01 18:18:12' -- TARIHTEN ISTEDIGIMIZ ALANI GETIRTME
SELECT DATEPART(YEAR,@TARIH)

-- GETDATE --
SELECT GETDATE() -- ŞU ANKİ ZAMANI GETİRİR
DECLARE @TARIH AS DATE -- YAŞ HESAPLAMA
	SET @TARIH='1996-10-08'
SELECT DATEDIFF(YEAR,@TARIH,GETDATE())

-- WHILE --
DECLARE @I AS INT = 0
WHILE @I<10
BEGIN
INSERT INTO TARIHLER (TARIH) VALUES(GETDATE())
WAITFOR DELAY '00:00:01'
PRINT @I
SET @I=@I+1
END
SELECT * FROM TARIHLER
----------------------------------------------
SELECT * FROM ISIM
SELECT * FROM SOYISIM
SELECT * FROM KISILER
DECLARE @AD AS VARCHAR(50)
DECLARE @SOYAD AS VARCHAR(50)
DECLARE @I AS INT=0

WHILE @I<1
BEGIN
SELECT @AD=AD FROM ISIM WHERE ID=ROUND (RAND()*1000,0)
SELECT @SOYAD=SOYAD FROM SOYISIM WHERE ID=ROUND (RAND()*1000,0)
SELECT @AD,@SOYAD
INSERT INTO KISILER(AD,SOYAD) VALUES (@AD,@SOYAD)
SET @I=@I+1
END
-- STRING --
CHAR(N)
NCHAR
VARCHAR(N,MAX)
NVARCHAR(N,max)
TEXT
NTEXT
-- NUMBER --
INT
BIT
BIGINT
SMALLINT
TINYINT
DECIMAL OR NUMERIC
FLOAT(N)
MONEY
REAL
SMALLMONEY
BIT(BOOLEAN)

BINARY(N)
VARBINARY(N)
IMAGE
-- DATE --
DATE
SMALLDATETIME
DATETIME
DATETIME2
TIME
DATETIMEOFFSET

----------------------------------------------------------------------------------------------------------------------------------------

DECLARE 
	@I AS INT=1,
	@NAMES AS VARCHAR(50),
	@IDS AS INT=1
WHILE(@I<=1)
	BEGIN
	SELECT @NAMES=NAMESURNAME FROM CUSTOMERS WHERE(@IDS=ID)
	SELECT @NAMES AS ISIMLER
	SET @IDS+=1
	SET @I+=1A
	END

INSERT INTO CUSTOMERS([NAMESURNAME], [GENDER], [BIRTHDATE], [CITY], [TOWN], [TELNR], [NAME_], [SURNAME])
VALUES('MEHMET DEMİREL','E','1999-08-10','OSMANIYE','KADIRLI','1111111111','MEHMET','DEMİREL')
SELECT * FROM CUSTOMERS WHERE(ID='2512013')

UPDATE CUSTOMERS
	SET 
	NAMESURNAME='AHMET DEMİREL',
	GENDER='E', 
	BIRTHDATE='1999-08-10',
	CITY='OSMANIYE',
	TOWN='KADIRLI',
	TELNR='111111111',
	NAME_='AHMET',
	SURNAME='DEMİREL'
WHERE(ID='2512013')

UPDATE CUSTOMERS
	SET AGE=DATEDIFF(YEAR,BIRTHDATE,GETDATE())

DECLARE @S1 AS FLOAT=29
DECLARE @S2 AS FLOAT=7
DECLARE @TOPLA AS CHAR(1)='+'
DECLARE @CIKAR AS CHAR(1)='-'
DECLARE @BOL AS CHAR(1)='/'


----------------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM CUSTOMERS
SELECT * FROM CUSTOMERS WHERE(CITY='İZMİR')
SELECT * FROM CUSTOMERS WHERE(CITY<>'İZMİR')
SELECT * FROM CUSTOMERS WHERE(NOT CITY='İZMİR')
SELECT * FROM CUSTOMERS WHERE(GENDER='E')
SELECT * FROM CUSTOMERS WHERE(BIRTHDATE>'1990-01-01')
SELECT * FROM CUSTOMERS WHERE(BIRTHDATE BETWEEN '1990-01-01' AND '1992-01-01')
SELECT * FROM CUSTOMERS WHERE(AGE BETWEEN 20 AND 30)
SELECT *FROM CUSTOMERS WHERE(BIRTHDATE='1998-01-02')
SELECT * FROM CUSTOMERS WHERE(NAMESURNAME LIKE 'ALİ%')
SELECT * FROM CUSTOMERS WHERE(NAMESURNAME LIKE '%ALİ')
SELECT * FROM CUSTOMERS WHERE(NAMESURNAME LIKE '%ALİ%')
SELECT * FROM CUSTOMERS WHERE(CITY IN('İSTANBUL','ANKARA'))
SELECT * FROM CUSTOMERS WHERE(CITY NOT IN('İSTANBUL','ANKARA'))

----------------------------------------------------------------------------------------------------------------------------------------
UPDATE CUSTOMERS 
	SET BIRTHDATE='1998-01-02'
	WHERE(BIRTHDATE BETWEEN '1990-01-01' AND '1992-01-01')

UPDATE CUSTOMERS
	SET GENDER='ERKEK'
	WHERE(GENDER='E')

UPDATE CUSTOMERS
	SET GENDER='KADIN'
	WHERE(GENDER='K')

SELECT TOP(100) * FROM CUSTOMERS
UPDATE CUSTOMERS
	SET GENDER='E'
	WHERE(GENDER='ERKEK')

UPDATE CUSTOMERS
	SET GENDER='K'
	WHERE(GENDER='KADIN')

----------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE MEMET(
	ID  INT IDENTITY(1,1) NOT NULL,
	NAMESURNAME VARCHAR(50),
	AGE INT
)
----------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM CUSTOMERS ORDER BY(NAMESURNAME)ASC
SELECT * FROM CUSTOMERS ORDER BY(NAMESURNAME)DESC
SELECT * FROM CUSTOMERS WHERE(CITY='İSTANBUL') ORDER BY(NAMESURNAME)

----------------------------------------------------------------------------------------------------------------------------------------

SELECT 
	MIN(AMOUNT) AS MIN_AMOUNT,
	MAX(AMOUNT) AS MAX_AMOUNT,
	COUNT(AMOUNT) AS COUNT_AMOUNT,
	SUM(AMOUNT) AS SUM_AMOUNT,
	AVG(AMOUNT) AS AVG_AMOUNT 
FROM SALES

SELECT 
	MIN(TOTALPRICE) AS MIN_TOTALPRICE,
	MAX(TOTALPRICE) AS MAX_TOTALPRICE,
	COUNT(TOTALPRICE) AS COUNT_TOTALPRICE,
	SUM(TOTALPRICE) AS SUM_TOTALPRICE,
	AVG(TOTALPRICE) AS AVG_TOTALPRICE 
FROM SALES

SELECT 
	MIN(TOTALPRICE) AS MIN_TOTALPRICE,
	MAX(TOTALPRICE) AS MAX_TOTALPRICE,
	COUNT(TOTALPRICE) AS COUNT_TOTALPRICE,
	SUM(TOTALPRICE) AS SUM_TOTALPRICE,
	AVG(TOTALPRICE) AS AVG_TOTALPRICE 
FROM SALES WHERE (CITY='ADANA')

SELECT 
	MIN(TOTALPRICE) AS MIN_TOTALPRICE,
	MAX(TOTALPRICE) AS MAX_TOTALPRICE,
	COUNT(TOTALPRICE) AS COUNT_TOTALPRICE,
	SUM(TOTALPRICE) AS SUM_TOTALPRICE,
	AVG(TOTALPRICE) AS AVG_TOTALPRICE 
FROM SALES WHERE (CITY='ANKARA')

SELECT CITY,
	MIN(TOTALPRICE) AS MIN_TOTALPRICE,
	MAX(TOTALPRICE) AS MAX_TOTALPRICE,
	COUNT(TOTALPRICE) AS COUNT_TOTALPRICE,
	SUM(TOTALPRICE) AS SUM_TOTALPRICE,
	AVG(TOTALPRICE) AS AVG_TOTALPRICE 
FROM SALES GROUP BY CITY ORDER BY CITY

----------------------------------------------------------------------------------------------------------------------------------------

SELECT CITY,
	SUM(TOTALPRICE) AS DESC_TOTALPRICE
FROM SALES
GROUP BY CITY 
ORDER BY (SUM(TOTALPRICE)) DESC

UPDATE SALES
	SET DATE2= CONVERT(DATE,DATE_)

SELECT 
	DATE2,
	CITY,
	SUM(TOTALPRICE)
FROM SALES WHERE(DATE2='2019-01-01')
	GROUP BY DATE2,CITY 
	ORDER BY DATE2,SUM(TOTALPRICE) DESC

UPDATE SALES
	SET MONTHNAME_='12.ARALIK' WHERE (DATEPART(MONTH,DATE2)=12)

SELECT MONTHNAME_ FROM SALES

SELECT 
	MONTHNAME_,
	CITY,
	SUM(TOTALPRICE) AS TOTALPRICE 
FROM SALES
	GROUP BY CITY,MONTHNAME_ 
	ORDER BY CITY,MONTHNAME_ 


SELECT 
	MONTHNAME_,
	CITY,
	SUM(TOTALPRICE) AS TOTALPRICE 
FROM SALES WHERE(CITY='ADANA')
	GROUP BY CITY,MONTHNAME_ 
	ORDER BY CITY,MONTHNAME_ 


SELECT 
	CITY,
	MONTHNAME_,
	SUM(TOTALPRICE) AS TOTALPRICE 
FROM SALES
	GROUP BY CITY,MONTHNAME_ 
	ORDER BY MONTHNAME_ ,CITY

SELECT 
	CITY,
	MONTHNAME_,
	SUM(TOTALPRICE) AS TOTALPRICE 
FROM SALES WHERE(CITY='ADANA')
	GROUP BY CITY,MONTHNAME_ 
	ORDER BY CITY,MONTHNAME_ 

----------------------------------------------------------------------------------------------------------------------------------------

SELECT 
	CATEGORY1,
	CATEGORY2,
	CATEGORY3,
	CATEGORY4, 
	SUM(TOTALPRICE) AS TOTALPRICE,
	COUNT(*) AS ROWCOUNT_,
	SUM(AMOUNT) AS TOTALAMAOUNT
FROM SALES 
	GROUP BY 
		CATEGORY1,
		CATEGORY2,
		CATEGORY3,
		CATEGORY4 
	ORDER BY 
		CATEGORY1,
		CATEGORY2,
		CATEGORY3,
		CATEGORY4

SELECT 
	FICHENO,
	COUNT(*) AS COUNT_,
	CITY AS CITY_
FROM SALES 
	WHERE (MONTHNAME_='01.OCAK' AND CITY='ADANA')
	GROUP BY FICHENO,CITY


SELECT 
	FICHENO,
	COUNT(*) AS COUNT_,
	CITY AS CITY_
FROM SALES 
	WHERE (MONTHNAME_='01.OCAK')
	GROUP BY FICHENO,CITY
	ORDER BY CITY

SELECT 
	CITY AS SEHIR,
	COUNT(DISTINCT FICHENO) AS OCAK_AYI_SATIS,
	COUNT(*) AS TOPLAM_FATURA
	
FROM SALES 
	WHERE (MONTHNAME_='01.OCAK')
	GROUP BY CITY
	ORDER BY CITY


SELECT 
	CITY,
	SUM(TOTALPRICE) 
FROM SALES 
	GROUP BY CITY 
	HAVING SUM(TOTALPRICE)<40000
	ORDER BY SUM(TOTALPRICE) DESC


SELECT  COUNT(CITY) - COUNT(DISTINCT CITY)  FROM STATION 


SELECT * FROM USERS
-- ID İLE ADRESLERİ ÇEKME -- 
SELECT USERS.*,ADDRESS_.ADDRESSTEXT FROM 
USERS,ADDRESS_ WHERE USERS.ID=ADDRESS_.USERID AND USERS.ID=4

SELECT 
	U.NAMESURNAME, U.EMAIL,U.GENDER,U.BIRTHDATE
	,A.ADDRESSTEXT
	FROM USERS AS U,ADDRESS_ AS A
WHERE (U.ID=A.USERID AND U.ID=4)

SELECT 
	U.NAMESURNAME, U.EMAIL,U.GENDER,U.BIRTHDATE
	,A.ADDRESSTEXT
	,A.POSTALCODE
	,C.COUNTRY
	,CT.CITY
	,T.TOWN
	,D.DISTRICT
	FROM USERS AS U,ADDRESS_ AS A, COUNTRIES C,CITIES CT,TOWNS T,DISTRICTS D
WHERE (U.ID=A.USERID AND C.ID=A.COUNTRYID AND CT.ID=A.CITYID AND T.ID=A.TOWNID AND  D.ID=A.DISTRICTID AND U.ID=4 )


SELECT 
	U.NAMESURNAME, U.EMAIL,U.GENDER,U.BIRTHDATE
	,A.ADDRESSTEXT
	,A.POSTALCODE
	,C.COUNTRY
	,CT.CITY
	,T.TOWN
	,D.DISTRICT
	FROM USERS AS U,ADDRESS_ AS A, COUNTRIES C,CITIES CT,TOWNS T,DISTRICTS D
WHERE (U.ID=A.USERID AND C.ID=A.COUNTRYID AND CT.ID=A.CITYID AND T.ID=A.TOWNID AND  D.ID=A.DISTRICTID )
ORDER BY NAMESURNAME



SELECT 
	U.NAMESURNAME, U.EMAIL,U.GENDER,U.BIRTHDATE
	,A.ADDRESSTEXT
	,A.POSTALCODE
	,C.COUNTRY
	,CT.CITY
	,T.TOWN
	,D.DISTRICT
	FROM USERS AS U,ADDRESS_ AS A, COUNTRIES C,CITIES CT,TOWNS T,DISTRICTS D
WHERE (
	U.ID=A.USERID AND 
	C.ID=A.COUNTRYID AND 
	CT.ID=A.CITYID AND 
	T.ID=A.TOWNID AND  
	D.ID=A.DISTRICTID AND
	CT.CITY LIKE 'BURSA'
						)
ORDER BY NAMESURNAME



SELECT 
	COUNT(DISTINCT U.ID)
FROM USERS AS U,ADDRESS_ AS A, COUNTRIES C,CITIES CT,TOWNS T,DISTRICTS D
	WHERE (
		U.ID=A.USERID AND 
		C.ID=A.COUNTRYID AND 
		CT.ID=A.CITYID AND 
		T.ID=A.TOWNID AND  
		D.ID=A.DISTRICTID)
	

SELECT 
	U.ID
FROM USERS AS U,ADDRESS_ AS A, COUNTRIES C,CITIES CT,TOWNS T,DISTRICTS D
	WHERE (
		U.ID=A.USERID AND 
		C.ID=A.COUNTRYID AND 
		CT.ID=A.CITYID AND 
		T.ID=A.TOWNID AND  
		D.ID=A.DISTRICTID)
	GROUP BY U.ID

SELECT 
	U.NAMESURNAME, COUNT(A.ID) AS ADDRESS_COUNT
FROM USERS AS U,ADDRESS_ AS A, COUNTRIES C,CITIES CT,TOWNS T,DISTRICTS D
	WHERE (
		U.ID=A.USERID AND 
		C.ID=A.COUNTRYID AND 
		CT.ID=A.CITYID AND 
		T.ID=A.TOWNID AND  
		D.ID=A.DISTRICTID)
	GROUP BY U.NAMESURNAME


SELECT 
	U.NAMESURNAME, COUNT(DISTINCT C.COUNTRY) AS COUNTRY_COUNT
FROM USERS AS U,ADDRESS_ AS A, COUNTRIES C,CITIES CT,TOWNS T,DISTRICTS D
	WHERE (
		U.ID=A.USERID AND 
		C.ID=A.COUNTRYID AND 
		CT.ID=A.CITYID AND 
		T.ID=A.TOWNID AND  
		D.ID=A.DISTRICTID)
	GROUP BY U.NAMESURNAME

SELECT 
	U.NAMESURNAME, COUNT(DISTINCT CT.ID) AS CITY_COUNT
FROM USERS AS U,ADDRESS_ AS A, COUNTRIES C,CITIES CT,TOWNS T,DISTRICTS D
	WHERE (
		U.ID=A.USERID AND 
		C.ID=A.COUNTRYID AND 
		CT.ID=A.CITYID AND 
		T.ID=A.TOWNID AND  
		D.ID=A.DISTRICTID)
	GROUP BY U.NAMESURNAME


SELECT 
	U.NAMESURNAME, COUNT(DISTINCT CT.ID) AS CITY_COUNT
FROM USERS AS U,ADDRESS_ AS A, COUNTRIES C,CITIES CT,TOWNS T,DISTRICTS D
	WHERE (
		U.ID=A.USERID AND 
		C.ID=A.COUNTRYID AND 
		CT.ID=A.CITYID AND 
		T.ID=A.TOWNID AND  
		D.ID=A.DISTRICTID)
	GROUP BY U.NAMESURNAME
	HAVING COUNT(A.ID)>2


SELECT 
	CT.CITY
FROM USERS AS U,ADDRESS_ AS A, COUNTRIES C,CITIES CT,TOWNS T,DISTRICTS D
	WHERE (
		U.ID=A.USERID AND 
		C.ID=A.COUNTRYID AND 
		CT.ID=A.CITYID AND 
		T.ID=A.TOWNID AND  
		D.ID=A.DISTRICTID)
	GROUP BY CT.CITY



SELECT 
	CT.CITY,COUNT(U.ID) AS USER_COUNT
FROM USERS AS U,ADDRESS_ AS A, COUNTRIES C,CITIES CT,TOWNS T,DISTRICTS D
	WHERE (
		U.ID=A.USERID AND 
		C.ID=A.COUNTRYID AND 
		CT.ID=A.CITYID AND 
		T.ID=A.TOWNID AND  
		D.ID=A.DISTRICTID)
	GROUP BY CT.CITY



SELECT 
	CT.CITY,COUNT(U.ID) AS USER_COUNT,COUNT(DISTINCT D.DISTRICT) AS DISTRICT_COUNT
FROM USERS AS U,ADDRESS_ AS A, COUNTRIES C,CITIES CT,TOWNS T,DISTRICTS D
	WHERE (
		U.ID=A.USERID AND 
		C.ID=A.COUNTRYID AND 
		CT.ID=A.CITYID AND 
		T.ID=A.TOWNID AND  
		D.ID=A.DISTRICTID)
	GROUP BY CT.CITY
----------------------------------------------------------------------------------------------------------------------------------------


SELECT U.NAMESURNAME,A.ADDRESSTEXT,C.COUNTRY,CT.CITY,T.TOWN,D.DISTRICT
	FROM USERS U
	JOIN ADDRESS_ A ON A.USERID = U.ID
	JOIN COUNTRIES C ON C.ID=A.COUNTRYID
	JOIN CITIES CT ON CT.ID=A.CITYID
	JOIN TOWNS T ON T.ID=A.TOWNID
	JOIN DISTRICTS D ON D.ID = A.DISTRICTID


CREATE TABLE USERS(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	USERNAME_ VARCHAR(50),
	PASSWORD_ VARCHAR(50),
	NAMESURNAME VARCHAR(100),
	EMAIL VARCHAR(100),
	GENDER VARCHAR(1),
	BIRTHDATE DATE,
	CREATEDDATE DATETIME,
	TELNR1  VARCHAR(15),
	TELNR2 VARCHAR(15)
);

CREATE TABLE ADDRESS_(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	USERID INT,
	COUNTRYID TINYINT,
	CITYID SMALLINT,
	TOWNID INT,
	DISTRICTID INT,
	POSTALCODE VARCHAR(10),
	ADDRESSTEXT VARCHAR(500)
);
CREATE TABLE ITEMS(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ITEMCODE VARCHAR(50),
	ITEMNAME VARCHAR(100),
	UNITPRICE FLOAT,
	CATEGORY1 VARCHAR(50),
	CATEGORY2 VARCHAR(50),
	CATEGORY3 VARCHAR(50),
	CATEGORY4 VARCHAR(50),
	BRAND VARCHAR(50)
);

CREATE TABLE ORDERS(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	USERID INT,
	DATE_ DATETIME,
	TOTALPRICE FLOAT,
	STATUS_ TINYINT,
	ADDRESSID INT
);

CREATE TABLE ORDERDETAILS(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ORDERID INT,
	ITEMID INT,
	AMOUNT INT,
	UNITPRICE FLOAT,
	LINETOTAL FLOAT
);

CREATE TABLE PAYMENTS(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ORDERID INT,
	PAYMENTTYPE TINYINT,
	DATE_ DATETIME,
	ISOK BIT,
	APPROVECODE VARCHAR(100),
	PAYMENTTOTAL FLOAT
);

CREATE TABLE COUNTRIES(
	ID TINYINT IDENTITY(1,1) PRIMARY KEY,
	COUNTRY VARCHAR(50)
);

CREATE TABLE CITIES(
	ID SMALLINT IDENTITY(1,1) PRIMARY KEY,
	COUNTRYID TINYINT,
	CITY VARCHAR(50)
);
CREATE TABLE TOWNS(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	CITYID SMALLINT,
	TOWN VARCHAR(50)
);

CREATE TABLE DISTRICTS(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	TOWNID INT,
	DISTRICT VARCHAR(50)
);

CREATE TABLE INVOICE(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ORDERID INT,
	DATE_ DATETIME,
	ADDRESSID INT,
	CARGOFICHENO VARCHAR(20),
	TOTALPRICE FLOAT
);

CREATE TABLE INVOICEDETAIL(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	INVOICEID INT,
	ORDERDETAILID INT,
	ITEMID INT,
	AMOUNT INT,
	UNITPRICE FLOAT,
	LINETOTAL FLOAT
);
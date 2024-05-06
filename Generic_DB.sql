# SOURCE C:/Users/alexa/OneDrive/Desktop/Facultate/anu2/sem2/BD/proiect_bd/script01.sql;
/*          Folositi pentru cale simbolul "/", NU "\"         */ 


/*#############################################################*/
/*        PARTEA 1 - STERGEREA SI RECREAREA BAZEI DE DATE      */

DROP DATABASE bazarAutoDB;
CREATE DATABASE bazarAutoDB;
USE bazarAutoDB;

/*#############################################################*/




/*#############################################################*/
/*                  PARTEA 2 - CREAREA TABELELOR              */

CREATE TABLE tblUseri (
	idUser SMALLINT(5) PRIMARY KEY AUTO_INCREMENT,
	parola VARCHAR(30) NOT NULL,
	nume VARCHAR(20) NOT NULL,
	prenume VARCHAR(50) NOT NULL,
	cnp VARCHAR(13) NOT NULL UNIQUE
);

CREATE TABLE tblBazaruri (
	judet VARCHAR(50) NOT NULL UNIQUE,
	adresa VARCHAR(50) NOT NULL UNIQUE,
	idBazar SMALLINT(2) PRIMARY KEY AUTO_INCREMENT,
	capacitateMaxima SMALLINT(4) NOT NULL
	
);

CREATE TABLE tblMasini (
	marca VARCHAR(20) NOT NULL,
	model VARCHAR(20) NOT NULL,
	anFabricatie YEAR,
	kilometraj MEDIUMINT(7) NOT NULL,
	pretEuro MEDIUMINT NOT NULL,
	codBazar SMALLINT(2) NOT NULL,
	nrInmatriculare VARCHAR(10) NOT NULL UNIQUE,
	vin VARCHAR(17) PRIMARY KEY,
	
	FOREIGN KEY (codBazar) REFERENCES tblBazaruri(idBazar) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE tblTranzactii (
	nrOrdine SMALLINT(4) PRIMARY KEY,
	userID SMALLINT(3) NOT NULL,
	bazarID SMALLINT(2) NOT NULL,
	
	FOREIGN KEY (userID) REFERENCES tblUseri(idUser) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (bazarID) REFERENCES tblBazaruri(idBazar) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE tblFacturi (
	idFactura SMALLINT(5) PRIMARY KEY AUTO_INCREMENT,
	dataFactura DATE NOT NULL,
	userID SMALLINT(5) NOT NULL,
	bazarID SMALLINT(2) NOT NULL,
	suma MEDIUMINT NOT NULL,
	tipFactura ENUM("cumparare","vanzare"),
	
	FOREIGN KEY (userID) REFERENCES tblUseri(idUser) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (bazarID) REFERENCES tblBazaruri(idBazar) ON DELETE CASCADE ON UPDATE CASCADE
);

/*#############################################################*/




/*#############################################################*/
/*         PARTEA 3 - INSERAREA INREGISTRARILOR IN TABELE      */


LOAD DATA INFILE /*!!!LOAD YOUR OWN USER DATA!!!*/
 INTO TABLE bazarAutoDB.tblUseri
 FIELDS TERMINATED BY ',' 
 LINES TERMINATED BY '\n' 
 (nume, prenume, cnp, parola, idUser);
 
LOAD DATA INFILE /*!!!LOAD YOUR OWN CARS DATA!!!*/
 INTO TABLE bazarAutoDB.tblMasini 
 FIELDS TERMINATED BY ',' 
 LINES TERMINATED BY '\n' 
 (marca, model, anFabricatie, km, pretEuro, sellerID, nrInmatriculare, vin);  
#Brand,Model,YearOfFabrication,Kilometres,PriceEuro,SellerID,LicensePlateNumber,VIN

LOAD DATA INFILE /*!!!LOAD YOUR OWN DEALERSHIPS DATA!!!*/
 INTO TABLE bazarAutoDB.tblBazaruri 
 FIELDS TERMINATED BY ',' 
 LINES TERMINATED BY '\n' 
 (judet, adresa, idBazar, capacitateMaxima); 

LOAD DATA INFILE /*!!!LOAD YOUR OWN INVOICE DATA!!!*/
 INTO TABLE bazarAutoDB.tblFacturi 
 FIELDS TERMINATED BY ',' 
 LINES TERMINATED BY '\n' 
 (judet, adresa, idBazar, capacitateMaxima);  


/*#############################################################*/



/*#############################################################*/
/*  PARTEA 4 - VIZUALIZAREA STUCTURII BD SI A INREGISTRARILOR  */

DESCRIBE tblUseri;
DESCRIBE tblBazaruri;
DESCRIBE tblMasini;
DESCRIBE tblTranzactii;
DESCRIBE tblFacturi;

SELECT * FROM tblBazaruri;
SELECT * FROM tblUseri;
SELECT * FROM tblMasini;
SELECT * FROM tblTranzactii;
SELECT * FROM tblFacturi;
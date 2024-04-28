# SOURCE C:/Users/alexa/OneDrive/Desktop/Facultate/anu2/sem2/BD/proiect_bd/script_proiect.sql;
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
	idUser SMALLINT(3) PRIMARY KEY AUTO_INCREMENT,
	email VARCHAR(50) UNIQUE,
	parola VARCHAR(30) NOT NULL,
	nume VARCHAR(20) NOT NULL,
	prenume VARCHAR(50) NOT NULL,
	cnp VARCHAR(13) NOT NULL UNIQUE
);

CREATE TABLE tblMasini (
	vin VARCHAR(17) PRIMARY KEY,
	marca VARCHAR(20) NOT NULL,
	model VARCHAR(20) NOT NULL,
	nrInmatriculare VARCHAR(10) NOT NULL UNIQUE,
	km MEDIUMINT(7) NOT NULL,
	anFabricatie YEAR NOT NULL,
	pretEuro MEDIUMINT NOT NULL,
	sellerID SMALLINT(3) NOT NULL,
	
	FOREIGN KEY (sellerID) REFERENCES tblSeller(idSeller) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE tblFacturi (
	idFactura SMALLINT(4) PRIMARY KEY AUTO_INCREMENT,
	dataFactura DATE NOT NULL,
	sellerID SMALLINT(3) NOT NULL,
	buyerID SMALLINT(3) NOT NULL,
	inmatriculareVechi VARCHAR(10) NOT NULL,
	inmatriculareNou VARCHAR(10) NOT NULL,
	
	FOREIGN KEY (sellerID) REFERENCES tblSeller(idSeller) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (buyerID) REFERENCES tblCumparator(idCumparator) ON DELETE CASCADE ON UPDATE CASCADE
);

/*#############################################################*/




/*#############################################################*/
/*         PARTEA 3 - INSERAREA INREGISTRARILOR IN TABELE      */

LOAD DATA INFILE 'E:/wamp64/tmp/data_useri.csv' 
 INTO TABLE bazarAutoDB.tblUseri
 FIELDS TERMINATED BY ',' 
 LINES TERMINATED BY '\n' 
 (nume, prenume, cnp, parola, idUser);
 
LOAD DATA INFILE 'E:/wamp64/tmp/data_masini.csv' 
 INTO TABLE bazarAutoDB.tblMasini 
 FIELDS TERMINATED BY ',' 
 LINES TERMINATED BY '\n' 
 (marca, model, anFabricatie, km, pretEuro, sellerID, nrInmatriculare, vin);  
#Brand,Model,YearOfFabrication,Kilometres,PriceEuro,SellerID,LicensePlateNumber,VIN

/*#############################################################*/



/*#############################################################*/
/*  PARTEA 4 - VIZUALIZAREA STUCTURII BD SI A INREGISTRARILOR  */

DESCRIBE tblSeller;
DESCRIBE tblCumparator;
DESCRIBE tblMasini;
DESCRIBE tblFacturi;

SELECT * FROM tblSeller;
SELECT * FROM tblCumparator;
SELECT * FROM tblMasini;
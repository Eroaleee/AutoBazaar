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
	adresa VARCHAR(50) NOT NULL,
	idBazar SMALLINT(2) PRIMARY KEY AUTO_INCREMENT,
	capacitateMaxima SMALLINT(4) NOT NULL
	
);

CREATE TABLE tblMasini (
	marca VARCHAR(20) NOT NULL,
	model VARCHAR(20) NOT NULL,
	anFabricatie YEAR,
	kilometraj MEDIUMINT(7) NOT NULL,
	pretEuro MEDIUMINT NOT NULL,
	nrInmatriculare VARCHAR(10) NOT NULL UNIQUE,
	vin VARCHAR(17) PRIMARY KEY,
	codBazar SMALLINT(2) NOT NULL,
	
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
	tipFactura VARCHAR(9),
	
	FOREIGN KEY (userID) REFERENCES tblUseri(idUser) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (bazarID) REFERENCES tblBazaruri(idBazar) ON DELETE CASCADE ON UPDATE CASCADE
);

/*#############################################################*/




/*###################a##########################################*/
/*         PARTEA 3 - INSERAREA INREGISTRARILOR IN TABELE      */

LOAD DATA INFILE 'C:/wamp64/tmp/UserData.txt'
 INTO TABLE bazarAutoDB.tblUseri
 FIELDS TERMINATED BY ',' 
 LINES TERMINATED BY '\n' 
 (idUser, parola, nume, prenume, cnp);

LOAD DATA INFILE 'C:/wamp64/tmp/Bazaar.csv'
 INTO TABLE bazarAutoDB.tblBazaruri 
 FIELDS TERMINATED BY ',' 
 LINES TERMINATED BY '\n' 
 (judet, adresa, idBazar, capacitateMaxima); 


LOAD DATA INFILE 'C:/wamp64/tmp/UpdatedCarsData.csv'
 INTO TABLE bazarAutoDB.tblMasini 
 FIELDS TERMINATED BY ',' 
 LINES TERMINATED BY '\n' 
 (marca, model, anFabricatie, kilometraj, pretEuro, nrInmatriculare, vin, codBazar);  
#Brand,Model,YearOfFabrication,Kilometres,PriceEuro,,LicensePlateNumber,VIN



LOAD DATA INFILE 'C:/wamp64/tmp/Invoice.txt'
 INTO TABLE bazarAutoDB.tblFacturi 
 FIELDS TERMINATED BY ',' 
 LINES TERMINATED BY '\n' 
 (idFactura, dataFactura, userID, bazarID, suma, tipFactura);  


/*#############################################################*/



/*#############################################################*/
/*  PARTEA 4 - VIZUALIZAREA STUCTURII BD SI A INREGISTRARILOR  */

DESCRIBE tblUseri;
DESCRIBE tblBazaruri;
DESCRIBE tblMasini;
DESCRIBE tblTranzactii;
DESCRIBE tblFacturi;
